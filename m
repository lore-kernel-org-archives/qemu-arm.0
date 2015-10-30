Received: by 10.182.105.169 with SMTP id gn9csp94077obb;
        Fri, 30 Oct 2015 13:49:43 -0700 (PDT)
X-Received: by 10.55.51.200 with SMTP id z191mr13067153qkz.21.1446238183121;
        Fri, 30 Oct 2015 13:49:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b94si920594qga.13.2015.10.30.13.49.43
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 13:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:53020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsGcI-0006ec-Qu
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 16:49:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGcF-0006dR-TV
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 16:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGcE-0004wh-VW
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 16:49:39 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGcE-0004wG-Qz
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 16:49:38 -0400
Received: by vkex70 with SMTP id x70so54752713vke.3
	for <qemu-arm@nongnu.org>; Fri, 30 Oct 2015 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Rr22GQxuKIh78YjkRbuJ0GMDVwWt9DYv3A9vc+raj/Y=;
	b=JZPjj5tyJEAdP/ISIH4lixj/h5VjrMZayOGt3snRaGchDDMmK63qzSMMeZGUHHK0GY
	uPIRCN05NiHix8w5Fht6VmuuV0Ec95QALaMfo6dSC1FvoLvqQNBzFGf2O/4Mk4IT6OU4
	wLVePBiQxUn3kESZ8DbBFvq8H+CxxufU8RTvRam9Tct9Au1u8CB8E0FLShovZU1SAOcn
	v2SiESRXOnd1Q5ivl9iwVF7PTibYXdW3A+rdlfWjMqT3yyC4m1A60+RBmpILViZuMNMt
	STzf54zef1nR/fdwaQrrF9XYHRUKFOYtPZbU/270D9flhSIwy1otGHkiDl770m07+8mC
	wE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Rr22GQxuKIh78YjkRbuJ0GMDVwWt9DYv3A9vc+raj/Y=;
	b=l0tWPdTJ9Aup/LxBV0b97GbU4fOPT8+YO9tKbeZqzztxz9Nc+/rsQc1fGucAVliGvb
	o6emciHIJhiI3ba4mRDn+47t/Zmt/DXJvyukPobeUWUI4lyecQzzNlxtIj5X/PmlSwIr
	evaiSlw8ceH2/VxCREOG5LXhjkkxPGNjetKxBnqPg5fc7fTCq9cA2/0Qa0beijuKNexe
	jPIvuFF8JhoRNyqvHDmvUNVX9RgfA20tKBST4ZifkqPoH/geTt9R7pPtfoBgNy3VN0p+
	0JzlZnYiN3lBU2EJrb2phoycZKS2p3h/FOfGpZ1W785iEmOroyabmry8rU/OCVOLZb2S
	5M8g==
X-Gm-Message-State: ALoCoQkxCqwIITxLrkB0nVkJsPorSo4VycNl3htOaLGIJiCv0s792gnB/NboMBieZd1Zeyqbnd5k
X-Received: by 10.31.136.144 with SMTP id k138mr6645680vkd.92.1446238178456;
	Fri, 30 Oct 2015 13:49:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 30 Oct 2015 13:49:19 -0700 (PDT)
In-Reply-To: <8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2015 20:49:19 +0000
Message-ID: <CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH v2 4/5] arm: boot: Add secure_board_setup flag
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
X-TUID: 7rXX2Q0y2kGr

On 30 October 2015 at 05:34, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Add a flag that when set, will cause the primary CPU to start in secure
> mode, even if the overall boot in non-secure. This is useful for when

"is non-secure".

> there is a board-setup blob that needs to run from secure mode, but
> device and secondary CPU init should still be done as-normal for a non-
> secure boot.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>
>  hw/arm/boot.c        | 3 ++-
>  include/hw/arm/arm.h | 6 ++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index b0879a5..6680d45 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -495,7 +495,8 @@ static void do_cpu_reset(void *opaque)
>                  }
>
>                  /* Set to non-secure if not a secure boot */
> -                if (!info->secure_boot) {
> +                if (!info->secure_boot &&
> +                    (cs != first_cpu || !info->secure_board_setup)) {
>                      /* Linux expects non-secure state */
>                      env->cp15.scr_el3 |= SCR_NS;
>                  }
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index 9217b70..60dc919 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -97,6 +97,12 @@ struct arm_boot_info {
>      hwaddr board_setup_addr;
>      void (*write_board_setup)(ARMCPU *cpu,
>                                const struct arm_boot_info *info);
> +
> +    /* If set, the board specific loader/setup blob will be run from secure
> +     * mode, regardless of secure_boot. The blob becomes responsible for
> +     * changing to non-secure state if implementing a non-secure boot
> +     */
> +    bool secure_board_setup;
>  };

I thought you were planning to have the generic code do the
S->NS transition; but I guess it works better in the board
code (we have to go up into Monitor and back down again, right?)

Is it an error for the board to set secure_board_setup if
the CPU doesn't have EL3? (if so, worth mentioning in this
comment; maybe assert?)

thanks
-- PMM
