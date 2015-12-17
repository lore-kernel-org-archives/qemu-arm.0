Received: by 10.182.158.201 with SMTP id ww9csp602564obb;
        Thu, 17 Dec 2015 11:38:26 -0800 (PST)
X-Received: by 10.140.230.8 with SMTP id a8mr67542996qhc.31.1450381106194;
        Thu, 17 Dec 2015 11:38:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g131si12630523qkb.102.2015.12.17.11.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:38:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9eNd-0000aS-TP
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:38:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eJK-00021g-NI
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:33:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eJJ-0001XP-P3
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:33:58 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:32841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eJJ-0001Ww-LA
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:33:57 -0500
Received: by mail-vk0-x234.google.com with SMTP id a188so53320132vkc.0
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 11:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qQtINgOUcwgp0CLZCPsgHXdH3097kj0W4DzKQkAIOOU=;
	b=GD9AfiNlw3vb2Y1rnPWQjkQRmQLJ4YAD7LjBxldoW5OpDyJdEAHOgcFiq66Efq1GpU
	dJxqa3OuKVZWf2hci2BhIcXqEnOsN/sO9SSiqG3nUG5FbgWJK43FR8Dox4Pydilxaiar
	ymHKOpJKPytBRynl1nMJoSGOJA0zY6VO72LiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qQtINgOUcwgp0CLZCPsgHXdH3097kj0W4DzKQkAIOOU=;
	b=j8vv+A/cxlFc81/5FzxHg6vWRJ0nLmpNk3kdG4bhF5GsoH/4pGCU06Mw4x7rpY4nrX
	F7OMFYUQ8yeTnFruCg0Xx7DO9gep6aXR6EP3VZ+fG5lvCqEbsw9INr+jZaIIEiei7OQp
	v03J3Gxym6W79/ibiLHPrPv1BJ7MgMCsGHuUv0moYGNq+zpMsG+DB7ihOWq7gmmDTmQs
	+rvvbAGTVbJI2ws8vJmFkLRZAtEVetX8nQtMNfElyLSAC9fWSbwqO1Serm7Y4T9vKEfL
	7HPdQbyVmSE2RsSBJtEBcCHFcMae4DjhkO4Mv2LBcDL/dQPmfCwFeT7bOMDMTvMVZ4db
	WM/Q==
X-Gm-Message-State: ALoCoQla7HljY+tJYABY+CKkAFAAqbBQ89n59Vuy44JiPedaFfmDtEI9nS9+qKQU6tXtuevYXjhBq7nm9ixv3H/mAhtIc6nguZkeYuoYx+VWlpJOXS85M6c=
X-Received: by 10.31.0.136 with SMTP id 130mr20915696vka.139.1450380835988;
	Thu, 17 Dec 2015 11:33:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 11:33:36 -0800 (PST)
In-Reply-To: <1449101933-24928-15-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-15-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 19:33:36 +0000
Message-ID: <CAFEAcA8P_L12bTub+m+7X_Ko6bJz-fQVNE17TvNFLOkrX5Vkfg@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 14/26] armv7m: prevent unprivileged write
	to STIR
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
X-TUID: QciYSOyESCs7

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Prevent unprivileged from writing to the

"unprivileged writes to the"

> Software Triggered Interrupt register

".".

> ---
>  hw/intc/armv7m_nvic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 0f9ca6a..5731146 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -727,7 +727,9 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>                        "NVIC: Aux fault status registers unimplemented\n");
>          break;
>      case 0xf00: /* Software Triggered Interrupt Register */
> -        if ((value & 0x1ff) < NVIC_MAX_IRQ) {
> +        /* STIR write allowed if privlaged or USERSETMPEND set */

You'll want to use the #define of CCR_USERSETMPEND that you'll
add to the previous patch. If you do that then the comment is
no longer really needed as the code itself is fairly straightforward.
(If you want to keep it then "privileged".)

> +        if ((arm_current_el(&cpu->env) || (cpu->env.v7m.ccr & 2))
> +            && ((value & 0x1ff) < NVIC_MAX_IRQ)) {
>              armv7m_nvic_set_pending(s, (value&0x1ff)+16);
>          }
>          break;

thanks
-- PMM
