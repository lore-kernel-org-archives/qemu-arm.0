Received: by 10.25.0.147 with SMTP id 141csp1207099lfa;
        Sun, 5 Mar 2017 20:06:46 -0800 (PST)
X-Received: by 10.200.51.177 with SMTP id c46mr15407011qtb.55.1488773206325;
        Sun, 05 Mar 2017 20:06:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si14629529qti.319.2017.03.05.20.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Mar 2017 20:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckjv1-0004Rh-Ku
	for alex.bennee@linaro.org; Sun, 05 Mar 2017 23:06:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ckjuw-0004Q2-Q2
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 23:06:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ckjuv-0003WU-SX
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 23:06:38 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ckjur-0003VG-I2; Sun, 05 Mar 2017 23:06:33 -0500
Received: by mail-qk0-x243.google.com with SMTP id o135so721652qke.2;
	Sun, 05 Mar 2017 20:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=fq48zaFRQ0HXhRmJhnorM9D/MrcIUcZtuhSm3KwPtKQ=;
	b=bAiOwXblsBdhwPSvWRqRHqs+n+8QYrL6GwCvA+yVowMm1ZX+/B2wXs955ALN+XDSM5
	lZpaDLRlTmPHPgGI3j4xvwQQTV8Kybw1dV1JE8Y0jxgj+CUUavgash/Caclt2SjydsBS
	PbWOfyiR5VXOAucjeoSBmgXSobPRxI7GB35BNPZd7BKdOcEUC+DrCKyjrR6lT0DxpcCb
	KR0I3VM4jx5Kpo/ekLX8nTRWQ1GZ3s2UAto/AZWbqFh1onkDUcjtaHkZ5jaMxdKwafb2
	RVffeWTOOWFLSNUgjsa+XE4skCp6/E894qykeMMgwTg4mPPbk+9p+BKJ575FBLojQfVK
	wb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fq48zaFRQ0HXhRmJhnorM9D/MrcIUcZtuhSm3KwPtKQ=;
	b=AhbT6HXRRJSsY7xFZlpWwgwv2/g0oAGQBCiTP2WvUNd2G5mxMkw0GHxLeDE+EN98iM
	aOKdQ3MkG25Uctw3MB6QLAyMPdvQd45v/6BwDQEe4M29DME6oM/qwNlbllnalIm1MB97
	Zr2NqVrFTw0WjM6pXzCTGYsYXa27dHQuD6VsqzEhr/GZcrnheLuFLpWn8Uv4FeRvAXNr
	v2TUO2/+wXTEJPOOuHmZwVEHlHaY+KPv2RxpQyGkQRCTp+qe2suW17hvrlv9dUbMHLTr
	K6K2NZVsuEEKBUumr8bcd2jqzMLtZTZOUmULZY+4vHuoHHvDlIrUMrxeL2OtqAHAqcuN
	6hGQ==
X-Gm-Message-State: AMke39kBDf3h1I6AGOu3Na+kTVr+sjdCRnT5wDrWyxG8olEMP6TNGSavksfXOvMl0eWVnw==
X-Received: by 10.200.53.237 with SMTP id l42mr13198729qtb.264.1488773193111; 
	Sun, 05 Mar 2017 20:06:33 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	f126sm12628619qkc.47.2017.03.05.20.06.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Mar 2017 20:06:32 -0800 (PST)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170305214857.9510-1-krzk@kernel.org>
	<20170305214857.9510-3-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2130c1b2-0f81-13f6-a1f8-c0a2e294e3f0@amsat.org>
Date: Mon, 6 Mar 2017 01:06:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170305214857.9510-3-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/misc/exynos4210_pmu: Reorder local
 variables for readability
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F8ICcQSUN0jq

Hi Krzysztof,

On 03/05/2017 06:48 PM, Krzysztof Kozlowski wrote:
> Short declaration of 'i' was in the middle of declarations with
> assignments.  Make it a little bit more readable.  No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/misc/exynos4210_pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
> index cbdfa0614600..60d1545c0baa 100644
> --- a/hw/misc/exynos4210_pmu.c
> +++ b/hw/misc/exynos4210_pmu.c
> @@ -401,8 +401,8 @@ static uint64_t exynos4210_pmu_read(void *opaque, hwaddr offset,
>                                      unsigned size)
>  {
>      const Exynos4210PmuState *s = (Exynos4210PmuState *)opaque;
> -    unsigned i;
>      const Exynos4210PmuReg *reg_p = exynos4210_pmu_regs;
> +    unsigned i;

your change seems OK but while you are here, 'unsigned' is considered 
harmful since more than a decade. why not use 'size_t i' since 
PMU_NUM_OF_REGISTERS is indeed an ARRAY_SIZE()?

>
>      for (i = 0; i < PMU_NUM_OF_REGISTERS; i++) {
>          if (reg_p->offset == offset) {
> @@ -420,8 +420,8 @@ static void exynos4210_pmu_write(void *opaque, hwaddr offset,
>                                   uint64_t val, unsigned size)
>  {
>      Exynos4210PmuState *s = (Exynos4210PmuState *)opaque;
> -    unsigned i;
>      const Exynos4210PmuReg *reg_p = exynos4210_pmu_regs;
> +    unsigned i;
>
>      for (i = 0; i < PMU_NUM_OF_REGISTERS; i++) {
>          if (reg_p->offset == offset) {
>
