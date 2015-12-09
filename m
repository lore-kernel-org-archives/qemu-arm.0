Received: by 10.182.158.201 with SMTP id ww9csp756794obb;
        Wed, 9 Dec 2015 08:48:44 -0800 (PST)
X-Received: by 10.55.40.153 with SMTP id o25mr8594649qko.93.1449679724879;
        Wed, 09 Dec 2015 08:48:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z20si9663380qgz.41.2015.12.09.08.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 08:48:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6hv2-00055Z-LK
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 11:48:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6hv0-00055O-AS
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 11:48:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6huy-0003hV-Vx
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 11:48:42 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:32897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6huy-0003hH-Qa
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 11:48:40 -0500
Received: by wmec201 with SMTP id c201so270150655wme.0
	for <qemu-arm@nongnu.org>; Wed, 09 Dec 2015 08:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Qg2KN1V7AIduSjDZIKexdiNb6Z9HkVxlVwygWdOwcDk=;
	b=RrFc15cD/x609tfnRPXGKu/KNPkpzgT0hxCT4nQSoXD5b1/xyowC1y18upMEF9XxIu
	ArUbFPNwd04U6Z2OHycTJUmnVAcRAguplhFW8YDBjkjgxLB7J2DUsITMY9BtX07YJ8jV
	RUZQ4zA9sXEo7bpFYwtxuEevOqe4AQYyrlEGedZdBGIT1lMS39OMuelZPzmbC06FzfSM
	d8DdE9TyPeQFSo1U+ywRtocylx+OdGG4u7wjy5yxyKrYPMC2gpPV62fiYsHgyfN2GpAd
	o5zluXg3oy9Vy/SX5s3h7CrNbopoSR27Is9TQ0L2UZgISUKiD7aJIeQVMm1cwbBgP1vu
	Oe0w==
MIME-Version: 1.0
X-Received: by 10.28.133.4 with SMTP id h4mr11617522wmd.59.1449679720185; Wed,
	09 Dec 2015 08:48:40 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Wed, 9 Dec 2015 08:48:40 -0800 (PST)
In-Reply-To: <1449656808-16570-1-git-send-email-rabinv@axis.com>
References: <1449656808-16570-1-git-send-email-rabinv@axis.com>
Date: Wed, 9 Dec 2015 08:48:40 -0800
Message-ID: <CAPokK=rz01FavfiPB9GUNxvRs5g9bx2Q-DnXQuDfi+3jWmLOKQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Rabin Vincent <rabin.vincent@axis.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>, qemu-arm@nongnu.org,
	Rabin Vincent <rabinv@axis.com>
Subject: Re: [Qemu-arm] [PATCH 1/2] arm_mptimer: add watchdog mode support
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
X-TUID: fR/UlLcivxkv

On Wed, Dec 9, 2015 at 2:26 AM, Rabin Vincent <rabin.vincent@axis.com> wrote:
> Add support for the watchdog mode of the MPTimer.
>
> Signed-off-by: Rabin Vincent <rabinv@axis.com>
> ---
>  hw/timer/arm_mptimer.c         |   49 ++++++++++++++++++++++++++++++++++++----
>  include/hw/timer/arm_mptimer.h |    4 ++++
>  2 files changed, 49 insertions(+), 4 deletions(-)
>
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index 3e59c2a..2be4551 100644
> --- a/hw/timer/arm_mptimer.c
> +++ b/hw/timer/arm_mptimer.c
> @@ -21,8 +21,11 @@
>
>  #include "hw/timer/arm_mptimer.h"
>  #include "qemu/timer.h"
> +#include "sysemu/sysemu.h"
>  #include "qom/cpu.h"
>
> +#define TWD_CONTROL_WDOG_MODE   (1 << 3)
> +
>  /* This device implements the per-cpu private timer and watchdog block
>   * which is used in both the ARM11MPCore and Cortex-A9MP.
>   */
> @@ -38,7 +41,12 @@ static inline int get_current_cpu(ARMMPTimerState *s)
>
>  static inline void timerblock_update_irq(TimerBlock *tb)
>  {
> -    qemu_set_irq(tb->irq, tb->status && (tb->control & 4));
> +    if ((tb->control & TWD_CONTROL_WDOG_MODE) && tb->status) {
> +        qemu_log_mask(CPU_LOG_RESET, "MPCore Watchdog Reset\n");
> +        qemu_system_reset_request();

The actual consequences of a watchdog timeout are a SoC or board level
thing. The WDT (and MPCore) can only create the signal while the
instantiator of the SoC has to act on it for system level reset
consequences. We should match that. There was a similar thread with
Michael Davidsaver and the ARMv7M reset semantics:

https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg02047.html

Regards,
Peter

> +    } else {
> +        qemu_set_irq(tb->irq, tb->status && (tb->control & 4));
> +    }
>  }
>
