Received: by 10.25.159.19 with SMTP id i19csp520891lfe;
        Sat, 6 Feb 2016 08:50:37 -0800 (PST)
X-Received: by 10.55.82.2 with SMTP id g2mr24057443qkb.53.1454777437794;
        Sat, 06 Feb 2016 08:50:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b9si21848459qgb.116.2016.02.06.08.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 08:50:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS64D-0004VR-9f
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 11:50:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS64A-0004R3-Lg
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 11:50:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS649-0000R1-Ek
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 11:50:34 -0500
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:35844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aS645-0000Os-0h; Sat, 06 Feb 2016 11:50:29 -0500
Received: by mail-pa0-x241.google.com with SMTP id sv5so678618pab.3;
	Sat, 06 Feb 2016 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VwDk3glQ3xRXRfOzWfYYN7IsIoGBwsoyJXPhfhywubo=;
	b=k5UrMu4pp8xQB6YJjuYlln6SKVbY2b6wbcW0uleppARVJt2fx6uXazs/iF2D8XIJSK
	6hdSt5LzY1hsH9BZjjjC8HmBBuDJOQPLtWKkKGmTiEEY6pPdq9AgkKYFJVzt4wzPolu4
	oaIN+pcQCMj+8mZg1Ucenv1Qn0KtQrAtBt0dG8fVACTaCrTUBu74vllc7Su/jW8hySDJ
	kCnEck0q600t/aElwMUNCTrJRTEUHXsXIqgudMpYEmFc1qcC6q85crloNnTPHkIEt15p
	obT3zVZP/yzPOtLfM5W9N4FjIjxXWKqTANnA7gRTrJQFSPBzBv8sbQBzG4ELVYPvpO9N
	z4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=VwDk3glQ3xRXRfOzWfYYN7IsIoGBwsoyJXPhfhywubo=;
	b=ZM3u6h5a7b1aSzL6+VG7chvurbwHSElmu7osn9mJs99aW3FWAlbU7NRA82ITY/6cEA
	hzsrZSwiYhIuImyCU4Wvbq3sSNqjdRXOODctqSNFlwSh4eQ0NtiytQYnwzkNXhXvRD4R
	MP68QOTaI/NkEpTax/CfkHUpZNWal8ftvfY4qURAgw2EwukUeGuivgWNYLG6PhKmI1/j
	fkGJPgWwbCyJNacvPbuS3rcDfA7PCNy9FNSnT2ubHOd1GCv3bZw6RvVj8osaoT9T1Moj
	C/FI5RbZRbb0epzSrpWCQL5+IcuCShZyUEbPAkEz2goAa+kciEmq/17jNkSb6SAHofyt
	i+NA==
X-Gm-Message-State: AG10YOStxcBqIY9ukSfKXHC+YCH6m5hVC7Yx0v5DNMbDDv8arD9h4zCjIZnRamlds5tbqA==
X-Received: by 10.66.191.195 with SMTP id ha3mr29250775pac.58.1454777428329;
	Sat, 06 Feb 2016 08:50:28 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	d8sm32429827pas.14.2016.02.06.08.50.26
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 08:50:27 -0800 (PST)
Date: Sat, 6 Feb 2016 17:43:50 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160206164350.GH3913@toto>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-8-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454506721-11843-8-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 7/7] target-arm: Enable EL3 for Cortex-A53
	and Cortex-A57
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
X-TUID: 6Lfknh8c2thy

On Wed, Feb 03, 2016 at 01:38:41PM +0000, Peter Maydell wrote:
> Enable EL3 support for our Cortex-A53 and Cortex-A57 CPU models.
> We have enough implemented now to be able to run real world code
> at least to some extent (I can boot ARM Trusted Firmware to the
> point where it pulls in OP-TEE and then falls over because it
> doesn't have a UEFI image it can chain to).

Cool! Finally! :-)

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
> index cc177bb..073677b5 100644
> --- a/target-arm/cpu64.c
> +++ b/target-arm/cpu64.c
> @@ -109,6 +109,7 @@ static void aarch64_a57_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
>      cpu->midr = 0x411fd070;
>      cpu->revidr = 0x00000000;
> @@ -161,6 +162,7 @@ static void aarch64_a53_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>      cpu->midr = 0x410fd034;
>      cpu->revidr = 0x00000000;
> -- 
> 1.9.1
> 
