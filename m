Received: by 10.25.205.13 with SMTP id d13csp350489lfg;
        Wed, 14 Dec 2016 10:30:49 -0800 (PST)
X-Received: by 10.200.50.35 with SMTP id x32mr100520434qta.78.1481740249427;
        Wed, 14 Dec 2016 10:30:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q67si30467400qkf.11.2016.12.14.10.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 10:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHEKE-0007Al-KT
	for alex.bennee@linaro.org; Wed, 14 Dec 2016 13:30:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHEKA-0007AS-02
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 13:30:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHEK5-0007o6-If
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 13:30:42 -0500
Received: from mail-vk0-f42.google.com ([209.85.213.42]:35494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHEK5-0007na-9u
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 13:30:37 -0500
Received: by mail-vk0-f42.google.com with SMTP id w194so40874506vkw.2
	for <qemu-arm@nongnu.org>; Wed, 14 Dec 2016 10:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MsxeUsjOaw98ag+Q/IKAaky43UTIO1JEe8mJnrYe4H4=;
	b=OqrnXXLA+RjW30qSrhyrI5T9BQow9UQRhriV4ncLJwxDdI+8OXEy7SSjGInZH1eHtP
	bNLEzY6iJQvRRTn4uwecnRC5/hzIdJ3plMaI17gpNauhXRNdjDutB/7h1OsdV5HIMhA/
	88m6ARLnEn0JNFbq9YQVgFkciyOjYIJbsdcw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MsxeUsjOaw98ag+Q/IKAaky43UTIO1JEe8mJnrYe4H4=;
	b=ra1cNpvXGXnVB73+UL4+0/6/0xmRRsMIfpiYC5h03658bDsac5IHk4K2gKer1JNbWg
	NB5tquKCk8vkXUYoYzFQlU4h3XslAuikzDLsGssa6Zj8CySrhZrv4d/x6GvP4FkgMMor
	5547YsE2yIJTqZWhWKUOkiV1dnMfPhP++5+4e76+UF2eNIiTLuQAd2/tuyKh5K2TrSxv
	ojXyzt40aEV5LFZOpHsNdFN6qlwTRThMFxquev3D2CEGXTH6/jKO96gCbe80WaRyIOkh
	6kXuRmqkRt7XAZUgfMTMrDoCQYK0n00W2sC1mMaYNk3HLzO2vVwSntdx3NWUFHdgngfM
	IVCA==
X-Gm-Message-State: AKaTC02xJ1uDfK9vy2Kt0azGAL1UQg5GpiKsFVwh7ddkJexdL7nZ9DkV3pwOm2rfL+gZqtIfE1idwfM/eNn6zyol
X-Received: by 10.31.79.132 with SMTP id d126mr45848812vkb.165.1481740171992; 
	Wed, 14 Dec 2016 10:29:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 14 Dec 2016 10:29:11 -0800 (PST)
In-Reply-To: <20161202054617.6749-5-alastair@au1.ibm.com>
References: <20161202054617.6749-1-alastair@au1.ibm.com>
	<20161202054617.6749-5-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2016 18:29:11 +0000
Message-ID: <CAFEAcA8__YWN9f2=GDeX5ddFnV_WWknpdrUeVud9-YLu9cE0Pw@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.42
Subject: Re: [Qemu-arm] [PATCH v3 4/7] qtest: Support named interrupts
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NcFT7oaHVzf8

On 2 December 2016 at 05:46, Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> The QTest framework cannot work with named interrupts. This patch
> adds support for them, as well as the ability to manipulate them
> from within a test.
>
> Read actions are via callbacks, which allows for pulsed interrupts
> to be read (the polled method used for the unnamed interrupts
> cannot read pulsed interrupts as the value is reverted before the
> test sees the changes).
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

> --- a/qtest.c
> +++ b/qtest.c
> @@ -40,7 +40,6 @@ static DeviceState *irq_intercept_dev;
>  static FILE *qtest_log_fp;
>  static CharBackend qtest_chr;
>  static GString *inbuf;
> -static int irq_levels[MAX_IRQ];
>  static qemu_timeval start_time;
>  static bool qtest_opened;
>
> @@ -160,10 +159,16 @@ static bool qtest_opened;
>   *
>   *  IRQ raise NUM
>   *  IRQ lower NUM
> + *  IRQ_NAMED NAME NUM LEVEL

I think we should be consistent about the protocol here:
unnamed IRQs get 'raise' and 'lower' messages, so we should
do the same for named IRQs.

>   *
>   * where NUM is an IRQ number.  For the PC, interrupts can be intercepted
>   * simply with "irq_intercept_in ioapic" (note that IRQ0 comes out with
>   * NUM=0 even though it is remapped to GSI 2).
> + *
> + *  > irq_set NAME NUM LEVEL
> + *  < OK
> + *
> + *  Set the named input IRQ to the level (0/1)

I think adding support for raising and lowering device IRQs
should be a separate patch, as it's a different feature.
(I'm also not sure we should need it -- devices will be
wired into the system, and qtest is testing the whole
system from the point of view of the CPU. The CPU can't
arbitrarily reach in and assert a device's outgoing
interrupt line, so I'm not sure the tests should be able
to do it either.)

(Everything else below here is trivial fixes.)

>   */
>
>  static int hex2nib(char ch)
> @@ -243,17 +248,31 @@ static void GCC_FMT_ATTR(2, 3) qtest_sendf(CharBackend *chr,
>      va_end(ap);
>  }
>
> +typedef struct qtest_irq {
> +    qemu_irq old_irq;
> +    char *name;
> +    bool last_level;
> +} qtest_irq;
> +
>  static void qtest_irq_handler(void *opaque, int n, int level)
>  {
> -    qemu_irq old_irq = *(qemu_irq *)opaque;
> -    qemu_set_irq(old_irq, level);
> +    qtest_irq *data = (qtest_irq *)opaque;
> +    level = !!level;
> +
> +    qemu_set_irq(data->old_irq, level);
>
> -    if (irq_levels[n] != level) {
> +    if (level != data->last_level) {
>          CharBackend *chr = &qtest_chr;
> -        irq_levels[n] = level;
>          qtest_send_prefix(chr);
> -        qtest_sendf(chr, "IRQ %s %d\n",
> -                    level ? "raise" : "lower", n);
> +
> +        if (data->name) {
> +            qtest_sendf(chr, "IRQ_NAMED %s %d %d\n",
> +                    data->name, n, level);
> +        } else {
> +            qtest_sendf(chr, "IRQ %s %d\n", level ? "raise" : "lower", n);
> +        }
> +
> +        data->last_level = level;
>      }
>  }
>
> @@ -289,7 +308,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>          if (!dev) {
>              qtest_send_prefix(chr);
>              qtest_send(chr, "FAIL Unknown device\n");
> -           return;
> +            return;
>          }
>
>          if (irq_intercept_dev) {
> @@ -299,33 +318,73 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>              } else {
>                  qtest_send(chr, "OK\n");
>              }
> -           return;
> +            return;
>          }

Fixing whitespace issues is generally best done in a separate patch.


> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 6f69752..36b3960 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -21,12 +21,16 @@
>  #include <sys/wait.h>
>  #include <sys/un.h>
>
> +#include <glib.h>
> +

osdep.h pulls in glib for you.

>  #include "qapi/qmp/json-parser.h"
>  #include "qapi/qmp/json-streamer.h"
>  #include "qapi/qmp/qjson.h"
>
> +

Stray whitespace change.

>  #define MAX_IRQ 256
>  #define SOCKET_TIMEOUT 50
> +#define IRQ_KEY_LENGTH 64
>
>  QTestState *global_qtest;


> @@ -346,6 +408,17 @@ redo:
>          g_strfreev(words);
>      }
>
> +/* Defer processing of IRQ actions until all communications have been handled,
> + * otherwise, interrupt handler that cause further communication can disrupt
> + * the communication stream
> + */

Bad indent on this comment.

> +    for (action_index = 0; action_index < action_count; action_index++) {
> +        irq_action *action = actions[action_index];
> +        action->cb(action->opaque, action->name, action->n,
> +                action_raise[action_index]);
> +        action->level = action_raise[action_index];
> +    }
> +
>      return words;
>  }
>

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
> +        void (*irq_cb)(void *opaque, const char *name, int irq, bool level),
> +        void *opaque)
> +{
> +    qtest_irq_attach(global_qtest, name, irq, irq_cb, opaque);
> +}
> +
> +/**
> + * qtest_irq_set

Comment doesn't match function name (and missing ':').

> + * Set an interrupt level
> + * @id: the device to inject interrupts for
> + * @gpiolist: the GPIO list containing the line to seh
> + * @n: the line to set within the list
> + * @level: the IRQ level
> + */
> +static inline void irq_set(const char *id, const char *gpiolist, int n,
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
> --
> 2.9.3

thanks
-- PMM
