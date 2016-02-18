Received: by 10.25.208.211 with SMTP id h202csp736324lfg;
        Thu, 18 Feb 2016 09:44:45 -0800 (PST)
X-Received: by 10.140.202.212 with SMTP id x203mr11183136qha.19.1455817485334;
        Thu, 18 Feb 2016 09:44:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si9078591qka.3.2016.02.18.09.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:44:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWSdA-0000la-QP
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:44:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSc6-00072f-An
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSc2-0001WJ-J6
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:43:37 -0500
Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d]:34378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWSc2-0001W0-AW; Thu, 18 Feb 2016 12:43:34 -0500
Received: by mail-lf0-x22d.google.com with SMTP id j78so37735304lfb.1;
	Thu, 18 Feb 2016 09:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=YWPWCm+2fr7odBcfeBtzM9Ysv3mc+lkty8KGO41HRi4=;
	b=cd3V8SxmtyeSnWz1CdgFkeh5my+V4Bz465rEdI3mnEP5xzHxcCdl3Sui9KuhZeORfK
	KnIqXvYBQsYZNmaRAqF2Icr6pdtEAUl/bomJLJJM4MWDJFlsBDVVfkAZH3dmGpHPcGlc
	Rmo6RHDDHs73R6U5u4GDt4TM3TmJ70Dk2B3BBRP3PHCP6dneZMd/AurW9U+RUYrymQ7B
	AmbQwvoooCI5KiVCEniWNP8MK8RxR12lElTvUw2jJToz7On31M5/nNDYJciTyzGFHW3G
	YOvBlYDplwAj7fK3wcZoPz0Ec9HVaCk/UBAINhw1maST6adIM0SASKy2sqC6VDt0SAyL
	jF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=YWPWCm+2fr7odBcfeBtzM9Ysv3mc+lkty8KGO41HRi4=;
	b=YzKoZSDy5PqHBQatzAd58V2IB0wX8amspexK4EoqPgeh6A+Agq3aixeN1Y6ZL1sjjT
	mPBfHVVqjxCHxL06Fv3R+jfDe6xuaJ4yn9aFOGt35hdcPQV9AY/NEz4EEPrOczduhW7v
	YYC8qKH0w8XQmA2tOUCflv6VRhESSBG7JyDJPcAJyzTP9fczJNoFLIUCx/23IAyGi/g+
	yk4+1DWTcrDOWKlMBas8xW4rUT2574xY1o/KKwLvuNsZ/OPLSgfdH1wPxJdIOw1YS6Q1
	TINVkcZfPvjo1jGCAmTz93HAFNPQb54Yjj8kp+5e0y9J0rm4pWze0bSji0lU+pDU+wq4
	ardA==
X-Gm-Message-State: AG10YOS24ZpZYCIH1+7mSUVTyRVhb1yH0WviNIgrU1F3Gf7xEuL269Vc7mgdXaSNIfeUFw==
X-Received: by 10.25.81.195 with SMTP id f186mr3807715lfb.69.1455817413548;
	Thu, 18 Feb 2016 09:43:33 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	rk1sm1090868lbb.0.2016.02.18.09.43.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:43:32 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-8-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C602C3.2080808@gmail.com>
Date: Thu, 18 Feb 2016 20:43:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22d
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 07/11] target-arm: Add Hyp mode checks to
 bad_mode_switch()
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
X-TUID: FxoiJy0Buehy

On 15.02.2016 20:22, Peter Maydell wrote:
> We don't actually support Hyp mode yet, but add the correct
> checks for it to the bad_mode_switch() function for completeness.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 37b5439..4074b97 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5184,6 +5184,9 @@ static int bad_mode_switch(CPUARMState *env, int mode)
>           * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
>           */
>          return 0;
> +    case ARM_CPU_MODE_HYP:
> +        return !arm_feature(env, ARM_FEATURE_EL2)
> +            || arm_current_el(env) < 2 || arm_is_secure(env);
>      case ARM_CPU_MODE_MON:
>          return !arm_is_secure(env);
>      default:

