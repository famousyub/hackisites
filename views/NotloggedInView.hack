namespace HackFacebook\UiServer\Views;
use type Facebook\XHP\HTML\{div, a,i, strong};
/*class User {
  public string $name;

  protected function __construct(string $name) {
    $this->name = $name;
  }

  public static function get_name(int $id): User {
    return new User(\str_shuffle("ABCDEFGHIJ").\strval($id));
  }
}

async function load_user(int $id): Awaitable<User> {
  // Load user from somewhere (e.g., database).
  // Fake it for now
  return User::get_name($id);
}

async function load_users_await_loop(vec<int> $ids): Awaitable<vec<User>> {
  $result = vec[];
  foreach ($ids as $id) {
    $result[] = await load_user($id);
  }
  return $result;
}*/

class NotLoggedinView extends AbstractView {


    protected async function getBodyAsync(): Awaitable<\XHPRoot> {


  //  $ids = vec[1, 2, 5, 99, 332];
  //  $result = \HH\Asio\join(load_users_await_loop($ids));

        return <div> Please <a href="/login">login </a> too see this view.    </div>;
    }
    public function getCSS(): Set<string> {
        return Set {};
    }
    public function getJS(): Set<string> {
        return Set {};
    }
    protected function getTitle(): string {
        return "Not logged in";
    }
    protected async function getTitleAsync(): Awaitable<string> {
        return "Error";
    }
    public function __construct() {
        parent::__construct();
    }
}
