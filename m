Received: by 10.25.150.194 with SMTP id y185csp2140558lfd;
        Tue, 22 Nov 2016 09:23:55 -0800 (PST)
X-Received: by 10.200.45.129 with SMTP id p1mr12139848qta.96.1479835435241;
        Tue, 22 Nov 2016 09:23:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p132si16525335qka.274.2016.11.22.09.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Nov 2016 09:23:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9EnS-00048s-KP
	for alex.bennee@linaro.org; Tue, 22 Nov 2016 12:23:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c9Elv-0003SF-1s
	for qemu-devel@nongnu.org; Tue, 22 Nov 2016 12:22:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c9Elr-0007rY-Mg
	for qemu-devel@nongnu.org; Tue, 22 Nov 2016 12:22:19 -0500
Received: from 4.mo69.mail-out.ovh.net ([46.105.42.102]:53287)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1c9Elr-0007pp-CY
	for qemu-devel@nongnu.org; Tue, 22 Nov 2016 12:22:15 -0500
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 067FAB5D6
	for <qemu-devel@nongnu.org>; Tue, 22 Nov 2016 18:22:13 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player798.ha.ovh.net (Postfix) with ESMTPSA id 8D56C54009A;
	Tue, 22 Nov 2016 18:22:03 +0100 (CET)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
Date: Tue, 22 Nov 2016 18:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 9134707420011989966
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdehgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.42.102
Subject: Re: [Qemu-devel] [PATCH 2/4] qtest: Support named interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aVrg9UCG3Peg

On 11/17/2016 05:36 AM, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>=20
> The QTest framework cannot work with named interrupts. This patch
> adds support for them, as well as the ability to manipulate them
> from within a test.
>=20
> Read actions are via callbacks, which allows for pulsed interrupts
> to be read (the polled method used for the unnamed interrupts
> cannot read pulsed interrupts as the value is reverted before the
> test sees the changes).
>=20
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

This looks OK to me but I am clearly not an expert in this area.
Maybe Paolo has some comments to add.

Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Thanks,

C.=20

> ---
>  qtest.c          | 98 ++++++++++++++++++++++++++++++++++++++++++------=
--------
>  tests/libqtest.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++--=
-
>  tests/libqtest.h | 59 ++++++++++++++++++++++++++++++++++
>  3 files changed, 216 insertions(+), 28 deletions(-)
>=20
> diff --git a/qtest.c b/qtest.c
> index 46b99ae..a56503b 100644
> --- a/qtest.c
> +++ b/qtest.c
> @@ -40,7 +40,6 @@ static DeviceState *irq_intercept_dev;
>  static FILE *qtest_log_fp;
>  static CharBackend qtest_chr;
>  static GString *inbuf;
> -static int irq_levels[MAX_IRQ];
>  static qemu_timeval start_time;
>  static bool qtest_opened;
> =20
> @@ -160,10 +159,16 @@ static bool qtest_opened;
>   *
>   *  IRQ raise NUM
>   *  IRQ lower NUM
> + *  IRQ_NAMED NAME NUM LEVEL
>   *
>   * where NUM is an IRQ number.  For the PC, interrupts can be intercep=
ted
>   * simply with "irq_intercept_in ioapic" (note that IRQ0 comes out wit=
h
>   * NUM=3D0 even though it is remapped to GSI 2).
> + *
> + *  > irq_set NAME NUM LEVEL
> + *  < OK
> + *
> + *  Set the named input IRQ to the level (0/1)
>   */
> =20
>  static int hex2nib(char ch)
> @@ -243,17 +248,31 @@ static void GCC_FMT_ATTR(2, 3) qtest_sendf(CharBa=
ckend *chr,
>      va_end(ap);
>  }
> =20
> +typedef struct qtest_irq {
> +    qemu_irq old_irq;
> +    char *name;
> +    bool last_level;
> +} qtest_irq;
> +
>  static void qtest_irq_handler(void *opaque, int n, int level)
>  {
> -    qemu_irq old_irq =3D *(qemu_irq *)opaque;
> -    qemu_set_irq(old_irq, level);
> +    qtest_irq *data =3D (qtest_irq *)opaque;
> +    level =3D !!level;
> +
> +    qemu_set_irq(data->old_irq, level);
> =20
> -    if (irq_levels[n] !=3D level) {
> +    if (level !=3D data->last_level) {
>          CharBackend *chr =3D &qtest_chr;
> -        irq_levels[n] =3D level;
>          qtest_send_prefix(chr);
> -        qtest_sendf(chr, "IRQ %s %d\n",
> -                    level ? "raise" : "lower", n);
> +
> +        if (data->name) {
> +            qtest_sendf(chr, "IRQ_NAMED %s %d %d\n",
> +                    data->name, n, level);
> +        } else {
> +            qtest_sendf(chr, "IRQ %s %d\n", level ? "raise" : "lower",=
 n);
> +        }
> +
> +        data->last_level =3D level;
>      }
>  }
> =20
> @@ -289,7 +308,7 @@ static void qtest_process_command(CharBackend *chr,=
 gchar **words)
>          if (!dev) {
>              qtest_send_prefix(chr);
>              qtest_send(chr, "FAIL Unknown device\n");
> -	    return;
> +            return;
>          }
> =20
>          if (irq_intercept_dev) {
> @@ -299,33 +318,69 @@ static void qtest_process_command(CharBackend *ch=
r, gchar **words)
>              } else {
>                  qtest_send(chr, "OK\n");
>              }
> -	    return;
> +            return;
>          }
> =20
>          QLIST_FOREACH(ngl, &dev->gpios, node) {
> -            /* We don't support intercept of named GPIOs yet */
> -            if (ngl->name) {
> -                continue;
> -            }
>              if (words[0][14] =3D=3D 'o') {
>                  int i;
>                  for (i =3D 0; i < ngl->num_out; ++i) {
> -                    qemu_irq *disconnected =3D g_new0(qemu_irq, 1);
> -                    qemu_irq icpt =3D qemu_allocate_irq(qtest_irq_hand=
ler,
> -                                                      disconnected, i)=
;
> +                    qtest_irq *data =3D g_new0(qtest_irq, 1);
> +                    data->name =3D ngl->name;
> +                    qemu_irq icpt =3D qemu_allocate_irq(qtest_irq_hand=
ler, data,
> +                            i);
> =20
> -                    *disconnected =3D qdev_intercept_gpio_out(dev, icp=
t,
> +                    data->old_irq =3D qdev_intercept_gpio_out(dev, icp=
t,
>                                                              ngl->name,=
 i);
>                  }
>              } else {
> -                qemu_irq_intercept_in(ngl->in, qtest_irq_handler,
> -                                      ngl->num_in);
> +                qtest_irq *data =3D g_new0(qtest_irq, 1);
> +                data->old_irq =3D *ngl->in;
> +                data->name =3D ngl->name;
> +                qemu_irq_intercept_in(ngl->in, qtest_irq_handler, ngl-=
>num_in);
>              }
>          }
>          irq_intercept_dev =3D dev;
>          qtest_send_prefix(chr);
>          qtest_send(chr, "OK\n");
> =20
> +    } else if (strcmp(words[0], "irq_set") =3D=3D 0) {
> +        DeviceState *dev;
> +        NamedGPIOList *ngl;
> +        int level;
> +        qemu_irq irq =3D NULL;
> +        int irq_num;
> +
> +        g_assert(words[1]); /* device */
> +        g_assert(words[2]); /* gpio list */
> +        g_assert(words[3]); /* gpio line in list */
> +        g_assert(words[4]); /* level */
> +        dev =3D DEVICE(object_resolve_path(words[1], NULL));
> +        if (!dev) {
> +            qtest_send_prefix(chr);
> +            qtest_send(chr, "FAIL Unknown device\n");
> +            return;
> +        }
> +
> +        irq_num =3D atoi(words[3]);
> +        level =3D atoi(words[4]);
> +
> +        QLIST_FOREACH(ngl, &dev->gpios, node) {
> +            if (strcmp(words[2], ngl->name) =3D=3D 0 && ngl->num_in > =
irq_num) {
> +                irq =3D ngl->in[irq_num];
> +            }
> +        }
> +
> +        if (irq =3D=3D NULL) {
> +            qtest_send_prefix(chr);
> +            qtest_send(chr, "FAIL Unknown IRQ\n");
> +            return;
> +        }
> +
> +        qemu_set_irq(irq, level);
> +
> +        qtest_send_prefix(chr);
> +        qtest_send(chr, "OK\n");
>      } else if (strcmp(words[0], "outb") =3D=3D 0 ||
>                 strcmp(words[0], "outw") =3D=3D 0 ||
>                 strcmp(words[0], "outl") =3D=3D 0) {
> @@ -622,8 +677,6 @@ static int qtest_can_read(void *opaque)
> =20
>  static void qtest_event(void *opaque, int event)
>  {
> -    int i;
> -
>      switch (event) {
>      case CHR_EVENT_OPENED:
>          /*
> @@ -632,9 +685,6 @@ static void qtest_event(void *opaque, int event)
>           * used.  Injects an extra reset even when it's not used, and
>           * that can mess up tests, e.g. -boot once.
>           */
> -        for (i =3D 0; i < ARRAY_SIZE(irq_levels); i++) {
> -            irq_levels[i] =3D 0;
> -        }
>          qemu_gettimeofday(&start_time);
>          qtest_opened =3D true;
>          if (qtest_log_fp) {
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 6f69752..43da151 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -21,12 +21,16 @@
>  #include <sys/wait.h>
>  #include <sys/un.h>
> =20
> +#include <glib.h>
> +
>  #include "qapi/qmp/json-parser.h"
>  #include "qapi/qmp/json-streamer.h"
>  #include "qapi/qmp/qjson.h"
> =20
> +
>  #define MAX_IRQ 256
>  #define SOCKET_TIMEOUT 50
> +#define IRQ_KEY_LENGTH 64
> =20
>  QTestState *global_qtest;
> =20
> @@ -34,12 +38,22 @@ struct QTestState
>  {
>      int fd;
>      int qmp_fd;
> +    GHashTable *irq_handlers;
>      bool irq_level[MAX_IRQ];
>      GString *rx;
>      pid_t qemu_pid;  /* our child QEMU process */
>      bool big_endian;
>  };
> =20
> +typedef struct irq_action {
> +    void (*cb)(void *opaque, const char *name, int irq, bool level);
> +    void *opaque;
> +    const char *name;
> +    int n;
> +    bool level;
> +} irq_action;
> +
> +
>  static GHookList abrt_hooks;
>  static GList *qtest_instances;
>  static struct sigaction sigact_old;
> @@ -216,6 +230,8 @@ QTestState *qtest_init(const char *extra_args)
> =20
>      s->big_endian =3D qtest_query_target_endianness(s);
> =20
> +    s->irq_handlers =3D g_hash_table_new_full(g_str_hash, g_str_equal,=
 g_free, g_free);
> +
>      return s;
>  }
> =20
> @@ -224,6 +240,8 @@ void qtest_quit(QTestState *s)
>      qtest_instances =3D g_list_remove(qtest_instances, s);
>      g_hook_destroy_link(&abrt_hooks, g_hook_find_data(&abrt_hooks, TRU=
E, s));
> =20
> +    g_hash_table_destroy(s->irq_handlers);
> +
>      /* Uninstall SIGABRT handler on last instance */
>      if (!qtest_instances) {
>          cleanup_sigabrt_handler();
> @@ -304,11 +322,35 @@ static GString *qtest_recv_line(QTestState *s)
>      return line;
>  }
> =20
> +void qtest_irq_attach(QTestState *s, const char *name, int irq,
> +        void (*irq_cb)(void *opaque, const char *name, int irq, bool l=
evel),
> +        void *opaque)
> +{
> +    char key[IRQ_KEY_LENGTH];
> +    irq_action *action =3D g_new0(irq_action, 1);
> +
> +    action->cb =3D irq_cb;
> +    action->name =3D name;
> +    action->n =3D irq;
> +    action->opaque =3D opaque;
> +    action->level =3D false;
> +
> +    g_assert_cmpint(snprintf(key, sizeof(key), "%s.%d",
> +            name, irq), <, sizeof(key));
> +
> +    g_hash_table_insert(s->irq_handlers, g_strdup(key), action);
> +}
> +
> +#define MAX_ACTIONS 256
>  static gchar **qtest_rsp(QTestState *s, int expected_args)
>  {
>      GString *line;
>      gchar **words;
>      int i;
> +    int action_index;
> +    int action_count =3D 0;
> +    bool action_raise[MAX_ACTIONS];
> +    irq_action *actions[MAX_ACTIONS];
> =20
>  redo:
>      line =3D qtest_recv_line(s);
> @@ -325,10 +367,29 @@ redo:
>          g_assert_cmpint(irq, >=3D, 0);
>          g_assert_cmpint(irq, <, MAX_IRQ);
> =20
> -        if (strcmp(words[1], "raise") =3D=3D 0) {
> -            s->irq_level[irq] =3D true;
> -        } else {
> -            s->irq_level[irq] =3D false;
> +        s->irq_level[irq] =3D (strcmp(words[1], "raise") =3D=3D 0);
> +
> +        g_strfreev(words);
> +        goto redo;
> +    } else if (strcmp(words[0], "IRQ_NAMED") =3D=3D 0) {
> +        bool level;
> +        char key[IRQ_KEY_LENGTH];
> +        irq_action *action;
> +
> +        g_assert(words[1] !=3D NULL);
> +        g_assert(words[2] !=3D NULL);
> +        g_assert(words[3] !=3D NULL);
> +
> +        level =3D (words[3][0] =3D=3D '1');
> +
> +        g_assert_cmpint(snprintf(key, sizeof(key), "%s.%s",
> +                words[1], words[2]), <, sizeof(key));
> +
> +        action =3D g_hash_table_lookup(s->irq_handlers, key);
> +
> +        if (action) {
> +            action_raise[action_count] =3D level;
> +            actions[action_count++] =3D action;
>          }
> =20
>          g_strfreev(words);
> @@ -346,6 +407,17 @@ redo:
>          g_strfreev(words);
>      }
> =20
> +/* Defer processing of IRQ actions until all communications have been =
handled,
> + * otherwise, interrupt handler that cause further communication can d=
isrupt
> + * the communication stream
> + */
> +    for (action_index =3D 0; action_index < action_count; action_index=
++) {
> +        irq_action *action =3D actions[action_index];
> +        action->cb(action->opaque, action->name, action->n,
> +                action_raise[action_index]);
> +        action->level =3D action_raise[action_index];
> +    }
> +
>      return words;
>  }
> =20
> @@ -918,3 +990,10 @@ bool qtest_big_endian(QTestState *s)
>  {
>      return s->big_endian;
>  }
> +
> +void qtest_irq_set(QTestState *s, const char *id, const char *gpiolist=
, int n,
> +        bool level)
> +{
> +    qtest_sendf(s, "irq_set %s %s %d %d\n", id, gpiolist, n, level);
> +    qtest_rsp(s, 0);
> +}
> diff --git a/tests/libqtest.h b/tests/libqtest.h
> index 90f182e..c74373c 100644
> --- a/tests/libqtest.h
> +++ b/tests/libqtest.h
> @@ -176,6 +176,34 @@ void qtest_irq_intercept_in(QTestState *s, const c=
har *string);
>  void qtest_irq_intercept_out(QTestState *s, const char *string);
> =20
>  /**
> + * irq_attach:
> + * @s: #QTestState instance to operate on.
> + * @name: the name of the GPIO list containing the IRQ
> + * @irq: The IRQ number within the GPIO list to attach to
> + * @irq_cb: The callback to execute when the interrupt changes
> + * @opaque: opaque info to pass to the callback
> + *
> + * Attach a callback to an intercepted interrupt
> + */
> +void qtest_irq_attach(QTestState *s, const char *name, int irq,
> +        void (*irq_cb)(void *opaque, const char *name, int irq, bool l=
evel),
> +        void *opaque);
> +
> +/**
> + * qtest_irq_set
> + * Set an interrupt level
> + * @s: #QTestState instance to operate on.
> + * @id: the device to inject interrupts for
> + * @gpiolist: the GPIO list containing the IRQ
> + * @n: the GPIO within the list
> + * @level: the IRQ level
> + *
> + * Set an interrupt to a nominated level
> + */
> +void qtest_irq_set(QTestState *s, const char *id, const char *gpiolist=
, int n,
> +        bool level);
> +
> +/**
>   * qtest_outb:
>   * @s: #QTestState instance to operate on.
>   * @addr: I/O port to write to.
> @@ -626,6 +654,37 @@ static inline void irq_intercept_out(const char *s=
tring)
>  }
> =20
>  /**
> + * irq_attach:
> + * @name: the name of the gpio list containing the IRQ
> + * @irq: The IRQ to attach to
> + * @irq_cb: The callback to execute when the interrupt changes
> + * @opaque: opaque info to pass to the callback
> + *
> + * Attach a callback to an intecepted interrupt
> + */
> +static inline void irq_attach(const char *name, int irq,
> +        void (*irq_cb)(void *opaque, const char *name, int irq, bool l=
evel),
> +        void *opaque)
> +{
> +    qtest_irq_attach(global_qtest, name, irq, irq_cb, opaque);
> +}
> +
> +/**
> + * qtest_irq_set
> + * Set an interrupt level
> + * @id: the device to inject interrupts for
> + * @gpiolist: the GPIO list containing the line to seh
> + * @n: the line to set within the list
> + * @level: the IRQ level
> + */
> +static inline void irq_set(const char *id, const char *gpiolist, int n=
,
> +        bool level)
> +{
> +    qtest_irq_set(global_qtest, id, gpiolist, n, level);
> +}
> +
> +
> +/**
>   * outb:
>   * @addr: I/O port to write to.
>   * @value: Value being written.
>=20

