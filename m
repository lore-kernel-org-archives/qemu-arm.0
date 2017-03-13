Received: by 10.25.77.4 with SMTP id a4csp1304415lfb;
        Mon, 13 Mar 2017 12:31:42 -0700 (PDT)
X-Received: by 10.55.221.1 with SMTP id n1mr31778161qki.221.1489433502359;
        Mon, 13 Mar 2017 12:31:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p24si1177913qtf.288.2017.03.13.12.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 12:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnVgx-0003b1-Kr
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 15:31:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVgt-0003Zv-18
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:31:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVgs-0006pK-2t
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:31:35 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33589)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVgm-0006oQ-Pl; Mon, 13 Mar 2017 15:31:28 -0400
Received: by mail-qk0-x243.google.com with SMTP id j127so38579522qke.0;
	Mon, 13 Mar 2017 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=NhsYYqlEQaBZpsSBgYS4dva/lk+q8Cj/XKG8CK5deTg=;
	b=B2VhnulwdQSpN1v9ViNbh1iMfW2O3iINBoZBZfnQ101JIdyFIdvqRhZSXRcovycCV7
	L3hEYH36QwZttij8GRK0hq0q7R0LmjxU2XSk+1XocudLoLDgEgMW3V5YSosoYpzsuDQ/
	2vyBFbDGrvmP5V+ULfnWQOukZakOhb2RE3hTbjtPF2j+9iRCKdiz3YY3OtPOicLfEvvK
	Uc7k1NWYUEe/sOmfWBSWwpRap+T5OAUT8e4cCx8l30ABK1jlDBpqTleh3f0sg8KfMzLt
	KY/lg1TviluJGmCEv9ZBVTv4JJPo0/NjH9K6F2hhrV1bRMIUPY8GfKIeoYFDi3mf6AiD
	h0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NhsYYqlEQaBZpsSBgYS4dva/lk+q8Cj/XKG8CK5deTg=;
	b=bKX+haMS5G2omPmZBdbM8SuJxpSiu9DQ9TZ05sRhBj9+yMaiTXwCXwTMsN/HnOrVZS
	a3apCNzYF05p41QVIyV5Zn8u0i2Nkms+7YiXywfL3hwUgq5ru7n+cvCCpeAH/xah+Jfj
	kVOsuCLnqDJtEwkcw186D1fDges1cty1JxKjKh1LWyJdEJu4ERq9P280gfIXnpMFZWh7
	A5IZCSqnwyTZmo7VdEF2kLOxJu22BfJt3y+JU71wZ0oQwGrKInJ9uK/kHmGn95DHBXkT
	vYx3iJfR4I/nQnufxY0TFybbdE8qxXLcOMTeGNa01zci4dhx0kZ3kPDmb+FnPmdSPJp6
	tKpQ==
X-Gm-Message-State: AFeK/H057AhF4gJTQwNUTXQV3IrEGnGLMBk7zKCUP+p5BoJwoA+NR/juNqmjuKsPM6PG1w==
X-Received: by 10.55.87.198 with SMTP id l189mr31901535qkb.106.1489433488302; 
	Mon, 13 Mar 2017 12:31:28 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	c6sm12829594qte.30.2017.03.13.12.31.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:31:27 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <20170313180432.7067-1-krzk@kernel.org>
	<20170313180432.7067-4-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d9bac0a7-be58-17bb-249c-05b2d388fc6f@amsat.org>
Date: Mon, 13 Mar 2017 16:31:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170313180432.7067-4-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v2 3/5] hw/timer/exynos4210_mct: Fix
 checkpatch style errors
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
X-TUID: 9iCdPkKhef/A

On 03/13/2017 03:04 PM, Krzysztof Kozlowski wrote:
> Fix checkpatch errors:
> 1. ERROR: spaces required around that '+' (ctx:VxV)
> 2. ERROR: spaces required around that '&' (ctx:VxV)
>
> No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/timer/exynos4210_mct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 0c189348ae04..cd290637f357 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -936,7 +936,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
>  {
>      uint32_t freq = s->freq;
>      s->freq = 24000000 /
> -            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg)+1) *
> +            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg) + 1) *
>                      MCT_CFG_GET_DIVIDER(s->reg_mct_cfg));
>
>      if (freq != s->freq) {
> @@ -1161,7 +1161,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>
>      DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
>
> -    if (offset&0x4) {
> +    if (offset & 0x4) {
>          s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
>      } else {
>          s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
>
