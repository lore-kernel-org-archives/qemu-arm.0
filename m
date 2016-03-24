Received: by 10.25.208.211 with SMTP id h202csp767181lfg;
        Thu, 24 Mar 2016 09:54:28 -0700 (PDT)
X-Received: by 10.140.42.137 with SMTP id c9mr11983010qga.5.1458838468590;
        Thu, 24 Mar 2016 09:54:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e65si7245351qge.25.2016.03.24.09.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 09:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj8Wi-0007Ot-5T
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 12:54:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aj8Wb-0007GG-Ip
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 12:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aj8Wa-0005Fp-GT
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 12:54:21 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aj8Wa-0005F3-C7
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 12:54:20 -0400
Received: by mail-vk0-x230.google.com with SMTP id e185so66851907vkb.1
	for <qemu-arm@nongnu.org>; Thu, 24 Mar 2016 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O6S0epHsOOZQMUYP8U4byMONNtqh0vM+ouApyr3r8Jw=;
	b=Zy+yVfyVDn/FMlklr0D1xP9HO6WhTiqqGvy2x8Sn7Ih3gG4tg4Ii+1fdPqKCaEe+kc
	rxLaah4jLmz0eWqWBVMmE2bZLULWQlFcckNWYfe4aJo9yXDVmQ8TNj+t/sIUKIksAVLM
	shV6+3k8081FEihRCMwPLMzJgtwNlVOLcmLLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O6S0epHsOOZQMUYP8U4byMONNtqh0vM+ouApyr3r8Jw=;
	b=Y2Mk5BZV8xqq9NHjgSTVt/anNpw9qx4lLfCbr7egfIzH4A8vP9oSo6I65Nnb+IB/jk
	EQMSQcBMYwsHJN0c01vfdR8LVQ0NGKZgL2nztQIpG5xX3rx/4Qj97PW1BzDS6ifLJ+Rb
	mJRCDIjFnb7ixd0dk6vGjpb9dwbMkt7s7ik/+9+9vBNE0CogWr+xgiqX8eYKp7GAqRRB
	Z51az87bcDkw5lb88vmkHXhHh/XBJrDvWUeMaQgaKdRitDfojB6f/PGz+DGBY154CDDz
	rG1yhDlaQoSihY9PPjfeIMs5vMKZ1IAx4mM4u8FwrFHDyuuQvQcYmy9RhoojIJ0Mw0dr
	jaUA==
X-Gm-Message-State: AD7BkJLjLByXCbTVHdZ7/KyMQ2OkPd1zm43bM7N8yBBrJkz2vposdFa+OboQeCfaKjcvAbTocxOpIcZHw4+yW3Vw
X-Received: by 10.159.35.72 with SMTP id 66mr4508893uae.119.1458838458717;
	Thu, 24 Mar 2016 09:54:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 24 Mar 2016 09:53:59 -0700 (PDT)
In-Reply-To: <1458837548-10413-1-git-send-email-sw@weilnetz.de>
References: <1458837548-10413-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2016 16:53:59 +0000
Message-ID: <CAFEAcA_Tvn3-eRz7HBCETmbT1QGyGb8q21ymbucuk2k00VuMkQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] pxa2xx: Fix warnings from cgcc
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
X-TUID: v+ulHC8X0y4G

On 24 March 2016 at 16:39, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> This patch is rather old, but it still can be applied.
> It avoids duplicate definitions for some array indices
> (which are allowed by gcc, but cgcc complains).
>
>  hw/arm/pxa2xx_pic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
> index 8a39b1c..a8a68e8 100644
> --- a/hw/arm/pxa2xx_pic.c
> +++ b/hw/arm/pxa2xx_pic.c
> @@ -204,7 +204,6 @@ static void pxa2xx_pic_mem_write(void *opaque, hwaddr offset,
>
>  /* Interrupt Controller Coprocessor Space Register Mapping */
>  static const int pxa2xx_cp_reg_map[0x10] = {
> -    [0x0 ... 0xf] = -1,
>      [0x0] = ICIP,
>      [0x1] = ICMR,
>      [0x2] = ICLR,
> @@ -216,6 +215,7 @@ static const int pxa2xx_cp_reg_map[0x10] = {
>      [0x8] = ICLR2,
>      [0x9] = ICFP2,
>      [0xa] = ICPR2,
> +    [0xb ... 0xf] = -1,
>  };

This is more bug-prone than the current code, because now
if we add or remove an entry in the array we have to change
the final line. The point of [ 0x0 ... 0xf ] is to specify
a default value for the array.

We use -Wno-initializer-overrides to silence a clang warning
about this, because we want to be able to use this "set the
default" idiom.

thanks
-- PMM
