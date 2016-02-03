Received: by 10.25.159.19 with SMTP id i19csp1192717lfe;
        Wed, 3 Feb 2016 04:30:51 -0800 (PST)
X-Received: by 10.140.20.82 with SMTP id 76mr1209103qgi.5.1454502651726;
        Wed, 03 Feb 2016 04:30:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a14si5339401qkj.63.2016.02.03.04.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 04:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQwaA-0006dG-JC
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 07:30:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aQwa7-0006dA-1h
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 07:30:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aQwa2-0002Dn-0T
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 07:30:46 -0500
Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236]:33371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aQwa1-0002Dg-OY; Wed, 03 Feb 2016 07:30:41 -0500
Received: by mail-lf0-x236.google.com with SMTP id m1so12990415lfg.0;
	Wed, 03 Feb 2016 04:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=yfAwHKd9dLZGx0QfdunyV8pFSHj9H6UXv+Ra5rjaggU=;
	b=vnunfRu6DiEy6Auk32PkekMwAFszZxkpofIU+YkH/wP4C9DGCv3jh+Jeq8KarmFrgh
	ZgSY0Bip+YQ1UHIOoY4V24w0G23eeRO2oIt1bMbZxrfW2FuW/DrVohs1lErk9aTtRmH1
	cTZ8wnETE6zlWcpGq3vRJmyHVLcK1La0vb9kxz5QeJ6oFYpeyHZgMRWTcrEcjffWiIz3
	DfHMWNVDpmGnuDaG3mebqjMgHeanvL2TH8loNTndItqJ/aZrdcXx5xjDztYJ0dVHP3bE
	R2uGq1MazIWiitaQD5Ly+6RaGqY6ndIriLnGTpVuHkGhzEnmVT3oaZRS4hgqhUwLv/Ax
	gJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=yfAwHKd9dLZGx0QfdunyV8pFSHj9H6UXv+Ra5rjaggU=;
	b=ezVKXV/xvTzOsaf7SeND7Cu40gGkYI8/hJSg4ITvprpVi3UmW424E/tNSrh6E44NCq
	vxTWZpdgbXWmqlVKYgzIZTaTV+n2aqjEcAJl2H5OgYTrdK/0eDF+Pm9dcSB+FjtKUtOC
	cixWE5MlDn7ge2AukOwQpJJf6bQTjfTgwc9FjZkpYLZF6Hdb5t3Y9+Wae83klT9+F8Cw
	6D6Zhn4PdTMTmqxptqNY2Y9XRFU/RHbtI3pF/O2ZcQUwbGWNxi20g/+YnKDlFTKz+n81
	Hoe6/CeqsCJmK8mWNs71KlQ1nXqcoDe1Q04+MzEmCg0H6L3xM4NHKj9oBNscxTxn1pJX
	qu3A==
X-Gm-Message-State: AG10YOTpEOTVDRaDQ2OeInNRC1NMY/kL7bazQKqi/EluLg6OLVPGGOeGvMGOIvP/Tggy3g==
X-Received: by 10.25.170.203 with SMTP id t194mr549523lfe.48.1454502640082;
	Wed, 03 Feb 2016 04:30:40 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	a67sm883310lfe.6.2016.02.03.04.30.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 04:30:39 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454437242-10262-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B1F2EE.9020008@gmail.com>
Date: Wed, 3 Feb 2016 15:30:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454437242-10262-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::236
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] target-arm: Don't report presence of EL2 if
 it doesn't exist
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
X-TUID: 0Yt/1m/NqhkP

On 02.02.2016 21:20, Peter Maydell wrote:
> We already modify the processor feature bits to not report EL3
> support to the guest if EL3 isn't enabled for the CPU we're emulating.
> Add similar support for not reporting EL2 unless it is enabled.
> This is necessary because real world guest code running at EL3
> (trusted firmware or bootloaders) will query the ID registers to
> determine whether it should start a guest Linux kernel in EL2 or EL3.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
> When full EL2 arrives and we have the CPU property for it then
> this will expand a bit to look like the 'if (!cpu->has_el3)'
> condition just above it.
>
>  target-arm/cpu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 6c34476..0cc075d 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -650,6 +650,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->id_aa64pfr0 &= ~0xf000;
>      }
>  
> +    if (!arm_feature(env, ARM_FEATURE_EL2)) {
> +        /* Disable the hypervisor feature bits in the processor feature
> +         * registers if we don't have EL2. These are id_pfr1[15:12] and
> +         * id_aa64pfr0_el1[11:8].
> +         */
> +        cpu->id_aa64pfr0 &= ~0xf00;
> +        cpu->id_pfr1 &= ~0xf000;
> +    }
> +
>      if (!cpu->has_mpu) {
>          unset_feature(env, ARM_FEATURE_MPU);
>      }

