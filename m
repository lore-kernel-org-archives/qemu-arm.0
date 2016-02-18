Received: by 10.25.208.211 with SMTP id h202csp736478lfg;
        Thu, 18 Feb 2016 09:45:06 -0800 (PST)
X-Received: by 10.55.73.69 with SMTP id w66mr10324119qka.39.1455817506101;
        Thu, 18 Feb 2016 09:45:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si9051996qkl.103.2016.02.18.09.45.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:45:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWSdV-0001Vd-Ha
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:45:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWScH-0007PX-HE
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWScE-0001dG-AR
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:43:49 -0500
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231]:35373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWScE-0001ct-2S; Thu, 18 Feb 2016 12:43:46 -0500
Received: by mail-lf0-x231.google.com with SMTP id l143so37783082lfe.2;
	Thu, 18 Feb 2016 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=MTPZJj/2eGPy14b6jnlIQAa2vpRi3QwW9rQy22Ig6qQ=;
	b=lj0k1l6hYNqcbPwWT3BdpcqV3FBHUHY1EUQlJq5OfvWR+HjSAVIgewJnMHCgWHPhOD
	Ka4lXzhyextBKcvlxvT/J9OyIP/LYhxM8Odl5lLTp0vJ/X0fmtljNFq3PaIEmYOXB7W6
	j78xlZnN8oRB3NHSLZD5OT8qKP41MjcpoY+KfvWNhPkxMc/5QKjcfC8YFG5sKKQUQSkr
	4IQ2EWggH4fzb+U1SM85h7NVahf4Ii9qYqtvkaKyKwRKY7Rif+nM0qSvKpY2pjq56j28
	Vl8lPM3V3u965g9M9l3KncFOxxJ4FtEeFZ+swWEqPOl/45begMcqGRIrpKf0lHcIQ7gY
	ShSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=MTPZJj/2eGPy14b6jnlIQAa2vpRi3QwW9rQy22Ig6qQ=;
	b=kM3/i8MwU9o8MQeduNKKJ2DllzX6mw8YXdPKnwiKDkYlmCRVbJu2q12Mq9UjulDDND
	kWR8f6lOXJdlVmAizQhMfxEgtOu7gkrCRanIZl9BRUuQ7Q2kn1YOTr56Ixa+S0d33T1u
	WQlBwLD93ffUG5LF08kPZrXHLlZhEAeGAA4qsziNfRW22y9Kl2lezvCtMFATbysZlFbp
	4F5DQ6ifIuwaZI9iSV+x6b1UlU0uAsNoicq4q15SKgxiCZhTeW750FuNBdrzSPSvaJO5
	KYJ+6tQsrePXbcX9Fl1aFHxrMRg8cvF/LnNwp3NGw84NrQ+J/uFQQIe4D1X5IQ+o7m1p
	YRSw==
X-Gm-Message-State: AG10YORts3WiQgHHWlv76rnKYmN/Z21HxNoxBufsmtltMNk4X14yA8oYuJptKVvBMeShhA==
X-Received: by 10.25.15.23 with SMTP id e23mr3667970lfi.111.1455817425321;
	Thu, 18 Feb 2016 09:43:45 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	ph5sm1046930lbb.44.2016.02.18.09.43.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:43:44 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-9-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C602CE.60409@gmail.com>
Date: Thu, 18 Feb 2016 20:43:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::231
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/11] target-arm: Forbid mode
 switch to Mon from Secure EL1
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
X-TUID: EHGsml3i1W+O

On 15.02.2016 20:22, Peter Maydell wrote:
> In v8 trying to switch mode to Mon from Secure EL1 is an
> illegal mode switch. (In v7 this is impossible as all secure
> modes except User are at EL3.) We can handle this case by
> making a switch to Mon valid only if the current EL is 3,
> which then gives the correct answer whether EL3 is AArch32
> or AArch64.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 4074b97..e7b3eb3 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5188,7 +5188,7 @@ static int bad_mode_switch(CPUARMState *env, int mode)
>          return !arm_feature(env, ARM_FEATURE_EL2)
>              || arm_current_el(env) < 2 || arm_is_secure(env);
>      case ARM_CPU_MODE_MON:
> -        return !arm_is_secure(env);
> +        return arm_current_el(env) < 3;
>      default:
>          return 1;
>      }

