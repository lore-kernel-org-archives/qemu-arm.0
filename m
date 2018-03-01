Received: by 10.28.91.67 with SMTP id p64csp1842293wmb;
        Thu, 1 Mar 2018 05:40:31 -0800 (PST)
X-Google-Smtp-Source: AG47ELvUtALXKSIF34PpuUgDKR17ZIZ4NQy2+pmyrGTVcj1KHrjD/tvLn1h3qL9sP5G9wzzgKnie
X-Received: by 2002:a25:c885:: with SMTP id y127-v6mr1105495ybf.103.1519911630935;
        Thu, 01 Mar 2018 05:40:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519911630; cv=none;
        d=google.com; s=arc-20160816;
        b=FCwHNRK4udyXpDy2+x0wbtrBND3g2VMiXJfV5paVGm0m5D+UHJwBbdQX3JvAUa1gsZ
         kRc3blLbI2c51yqnQ6VTjBxMDOxpopekPoJvAd5H+yJlyDvdzr8tTh1LrdI4uN2NkhwW
         xWgkWfLoWlZWKdhUSOWlqRdoaNt7JKnyDSalxuQNEOFlo/yidGRpnR1Asjn7p5TSiRp1
         6F7EmMCY76m373WPl446mNjwG/v0Qgmgoi+q+8H/wX3rG2P66K37C8Oax8qpIIvn3oTL
         jHRSddR5T7mOswwppV1aYBzJXjO7+HhJ9KHG/TRaP9Dq0xqylsNdG29tXlr7gCtCyYT4
         HUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BX/I8d8esB+qKqiJkm6t4Pg7yYk6S0G4vt6KQzEJNT8=;
        b=BKGnIP78bD+enY/QcCj02/hpbwZdyJHRbILtCAuOjSrtsIoQsWifE4/dAnkHjNmund
         AcC6jQesXQXhkw9+yz4IyNYMjlVwVcZrcBoHq3ZaF8Busa9++IPKAjFXXc1sWaYpYj2L
         Aj3dFI+hzHdARR4GPlc4O9LfPe6Do0EGXxbu5/1JOafQpRU6nTVfQrE8P1L3WKeda2a8
         Cq+m/aHlCfShr+gYmyRJI2HCeWX1ZbMuY9s0jgsgcSTfdhzgJYFGrSlE/3vk1r0xW49A
         tMaBZfTVxjoyhb/PamXYmNGEcjgapvgtFfiExaiiy02BiOmjgXCZjiYlL1zz+E+tDxRd
         2igQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AEf4pyBw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20si628420ywh.606.2018.03.01.05.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 05:40:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AEf4pyBw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erORi-000521-A3
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 08:40:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNsS-0005J2-NP
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:04:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNsO-0007yy-MR
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:04:04 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:43610)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erNsO-0007ym-H5
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:04:00 -0500
Received: by mail-ot0-x244.google.com with SMTP id m22so5447397otf.10
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 05:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BX/I8d8esB+qKqiJkm6t4Pg7yYk6S0G4vt6KQzEJNT8=;
	b=AEf4pyBwRHm6oAVcyJjN5Eemhs+9ykVUEiwy03dAk++4F7RBUVBBj4vLry5IJR66D1
	dpQIHUTnQkV/b+d0wpNZXIV5OlkEUpMhsBJQjrz/3kgBCHNJpmjriLjbHA2iH1s3n0ER
	kpM+7uwPLx1yopxTjGc6sJS3PCaoBu1pbhZOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BX/I8d8esB+qKqiJkm6t4Pg7yYk6S0G4vt6KQzEJNT8=;
	b=Hd/xU3wz1jCk38lyxcmhgwknpjaNdmoImHPfmO7VEwBOE1LjiAf13Bi4imkdwW4nrD
	ZG5Jq1NYvBnZKIYduw0KpqjPbtM15UhzCXhZZ0TcNJbx87U7+Uhk8tTT/XTvjXfKITKm
	zir42M4iEnzeisFLcooeBMBWmDfdPLkD+w0JlJhSWwDEpv24gRxpop/LrOS64TfGQyKf
	fBv2G9SCzWNoxlbyh8Mgk5mqVehQgCRnejUesLMmXpfraIoeo10t5mL7rMJW4QUr1atm
	4X+1kk8lpDtSCOnRSeW8tTjC60Nzc7o3zHs38S/8G0g6OV75N9UYYi7vNzktXXFPDUcy
	Aa7A==
X-Gm-Message-State: APf1xPC4Wx4QkeXw8JPclmgp3RC3K4clVjwq11xgnLt1lITqvobCf9Ii
	1ze2beLtZsyHVLQD31dN9uha/c8APIdQyORc+Wtq4Q==
X-Received: by 10.157.27.17 with SMTP id l17mr1260474otl.294.1519909439570;
	Thu, 01 Mar 2018 05:03:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 05:03:39 -0800 (PST)
In-Reply-To: <1519883168-22092-1-git-send-email-thuth@redhat.com>
References: <1519883168-22092-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 13:03:39 +0000
Message-ID: <CAFEAcA9Q9+sK5S1BREuCAVp4J5tU_mexDZU9nBuett3W7bQp-Q@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH] hw/arm: Use more CONFIG switches to decide
 which object files should be linked
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JZL/+J7WSHMT

On 1 March 2018 at 05:46, Thomas Huth <thuth@redhat.com> wrote:
> A lot of ARM object files are linked into the executable unconditionally,
> even though we have corresponding CONFIG switches like CONFIG_PXA2XX or
> CONFIG_OMAP. We should make sure to use these switches in the Makefile so
> that the users can disable certain unwanted boards and devices more easily.
> Also introduce the new switch CONFIG_STRONGARM to be able to disable the
> "Collie" machine if it is not wanted.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak |  2 ++
>  hw/arm/Makefile.objs            | 26 +++++++++++++++++---------
>  2 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index ca34cf4..43f382a 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -133,3 +133,5 @@ CONFIG_GPIO_KEY=y
>  CONFIG_MSF2=y
>  CONFIG_FW_CFG_DMA=y
>  CONFIG_XILINX_AXI=y
> +
> +CONFIG_STRONGARM=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 1c896ba..5e1e0a9 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -1,15 +1,23 @@
> -obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
> -obj-$(CONFIG_DIGIC) += digic_boards.o
> -obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
> -obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
> -obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
> +obj-y += boot.o virt.o sysbus-fdt.o
>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
> -obj-y += netduino2.o
> -obj-y += sysbus-fdt.o
> +obj-$(CONFIG_ARM_V7M) += highbank.o netduino2.o vexpress.o

This is definitely wrong -- highbank and vexpress are not V7M
platforms. Netduino2 is a v7M platform, but I don't think we
should be making it conditional on ARM_V7M -- we have per-board
configs for other boards, so you'd have a CONFIG_NETDUINO2 here
if you wanted it.

> +obj-$(CONFIG_ASPEED_SOC) += integratorcp.o musicpal.o versatilepb.o

This is wrong too -- none of these are aspeed-based devices.

thanks
-- PMM
