Received: by 10.25.134.130 with SMTP id i124csp1225232lfd;
        Sat, 9 Jan 2016 16:50:54 -0800 (PST)
X-Received: by 10.140.40.37 with SMTP id w34mr81112935qgw.85.1452387053732;
        Sat, 09 Jan 2016 16:50:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d69si18109080qhc.98.2016.01.09.16.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 16:50:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aI4Dd-0005Di-Df
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 19:50:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aI4Db-00059z-4J
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 19:50:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aI4Da-0006VF-BM
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 19:50:51 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:32812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aI4DY-0006V0-HQ; Sat, 09 Jan 2016 19:50:48 -0500
Received: by mail-wm0-x241.google.com with SMTP id u188so21100910wmu.0;
	Sat, 09 Jan 2016 16:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vUPDIbAA0+9kr+1I1r2wwSba5/PUUN6FFS3sgYkDW9E=;
	b=Mz6jL6TbJPDa1dMOatElk1DgHOUZCbG73QHonVA134QG1XJoKiDDyOPipOE1PnTCw+
	TKZFXmR1/OluFkskrYzngN0PvJRvQ9dnAy11iw8M+aWF7XTtIbmCaMfyL8JY+0AjABzm
	+F30c6KvJNZF+Ue+E0i5Yusj4FpkWs3iA2o8aUNWlIjfdO2gveJKuuEDZVw7sn2HHCs3
	OWNnGsKOJP70QIXaBj2j+dbx87x2vqvIY5k0vg49B1+xYi/Zj3YkBdqScI7lGLbJoTx9
	ZnXA1b7w3EK/X/xHIckk8hzOY72xxerRFrgIOV3J3hN/ESGU1BddPSj+006XKZbpuPGG
	QLpQ==
MIME-Version: 1.0
X-Received: by 10.28.64.137 with SMTP id n131mr5713632wma.96.1452387047886;
	Sat, 09 Jan 2016 16:50:47 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Sat, 9 Jan 2016 16:50:47 -0800 (PST)
In-Reply-To: <f515e61fa162411d0a75c3d0583780531fe8cc6e.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<f515e61fa162411d0a75c3d0583780531fe8cc6e.1452359845.git.digetx@gmail.com>
Date: Sat, 9 Jan 2016 16:50:47 -0800
Message-ID: <CAPokK=rLt6Fa=qhV8A-giqTSG0geQ9ae8bobtNopYJS+unNphw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v10 4/7] hw/ptimer: Support "on the fly"
	timer mode switch
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MxIMBJg9rENb

On Sat, Jan 9, 2016 at 9:39 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> Allow to switch between periodic <-> oneshot modes while timer is running.
>

"Allow switching"

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 0a54212..6960738 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -167,16 +167,16 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
>
>  void ptimer_run(ptimer_state *s, int oneshot)
>  {
> -    if (s->enabled) {
> -        return;
> -    }
> -    if (s->period == 0) {
> +    int was_disabled = !s->enabled;

bool

blank line here.

Otherwise:

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> +    if (was_disabled && s->period == 0) {
>          fprintf(stderr, "Timer with period zero, disabling\n");
>          return;
>      }
>      s->enabled = oneshot ? 2 : 1;
> -    s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -    ptimer_reload(s);
> +    if (was_disabled) {
> +        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        ptimer_reload(s);
> +    }
>  }
>
>  /* Pause a timer.  Note that this may cause it to "lose" time, even if it
> --
> 2.6.4
>
