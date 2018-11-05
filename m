Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2715744wro;
        Mon, 5 Nov 2018 07:29:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5dalZqUCHZ8eiJ1IomKspvL6IIuYX/oD/h0+i9eziyP6u8jEHf1fTuqScSb1wD/4tRaaiLB
X-Received: by 2002:ac8:3222:: with SMTP id x31mr19248034qta.275.1541431762194;
        Mon, 05 Nov 2018 07:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541431762; cv=none;
        d=google.com; s=arc-20160816;
        b=HFKfFGd+kXEtamMg671qOEMVGxH0RZgPWO4yl38W+KGKZgG7ALO5JZtHmYN/LEVunu
         4V8mSQLVs+ck1NXPFAvleEW8UxcA54W9sxQZPtWKQcll4zX39hNeqTAcApdVsbzpX45P
         tvwZLU+JJn8Iq2B8xTyI5iXgaucJNZP32FwOP9feNV9NlLUkWUiECu/JwKgC3rOsXaLU
         FKIAuonOuaGuUZL1RSt69uplMc/IEJZu7SnT5gEWDkvPwKhx+nkqoPAZyVa0FDDGUpur
         zAU2IRlstUcVeFeuaI19dPnuEYv0psW6otTrwL3E6NAZTvqP92Oo/Hv0/GGEuUW/zHUl
         glVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ldRBliylCYgCyh3oYB9L/bzSOAMG1vntvamkwY9HPe8=;
        b=kvmQya9LL3v6+sgGue31spDqT4zgkQu0Hg1GOdhfhkoInazkCbPO04qR64icLYjdT8
         PJJ2kc1X3I35QTJpqc6OIpYwbnueRNI9t1CbcVbwXRrXif+Xar7Q8RghmZohSp2GlhUH
         sm+S89FwS7Pxrlw83S4YGgVzfBiMi+ASggzdye7fKPQSJPk/SoJPyxNc9fwFVx5Hxx1T
         NGvln7TxubsC7GjUmxc2DEbFQE3OOv5p3Ky7TeDaxJ236P5iLPmlYGTE691fEKMNipJO
         Mew93v9Hj2Sh8EtwBt2CP1w4Ew2CTpTSuWaRZ+K40HOJvVKnASlTvWf1TepfFJnZ3eXy
         jo4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f19si490124qtp.106.2018.11.05.07.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJgob-0004fx-1S
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:29:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gJgoQ-0004fh-Ml
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:29:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gJgoN-0003dG-Gv
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:29:10 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gJgoN-0003ah-7z
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:29:07 -0500
Received: by mail-wm1-f67.google.com with SMTP id a8-v6so8450139wmf.1
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 07:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ldRBliylCYgCyh3oYB9L/bzSOAMG1vntvamkwY9HPe8=;
	b=H/vWHsnEvq/FcvaohriGckuqgi8UXpw10uRFNzSZY16/070sz6XqtS5NMgwO+OaAyS
	niqduvtESb/wWJNoeFYVLJWCRJmIPnrxERvAVO8tDHl+DNHRS+7ZO1g3ytS+DAXLlImC
	IblgbqV19rw1BpULTw1+mjmgZ0sxC5daYbcg9jgRaWkgjm5n1xSjZbHGVbcYyTze4tL1
	tC+hny4+FjPdwHwmiQKp/1Hk3PKVA3Mee6P4Tx/rL1CKj1uXKB2qcrR0h0B+Vr1U6GyN
	jj69xu5lkXraOsRMfV6njx+bg26mZ+n6IqViHqNrQnzrkIxSLAUUjixIwytKj/YjDsUN
	qGmg==
X-Gm-Message-State: AGRZ1gIUclQ51oKj4DB+L93HoUlt1tcsW2c2DdV9btmv7GwgUe9e1F98
	3vaooyoTqRXN5AkV4miY4mxmAA==
X-Received: by 2002:a1c:7e8f:: with SMTP id
	z137-v6mr6328802wmc.140.1541431746150; 
	Mon, 05 Nov 2018 07:29:06 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:88f4:6d00:2c10:ba7d:db2f:4ad5?
	([2a01:cb1d:88f4:6d00:2c10:ba7d:db2f:4ad5])
	by smtp.gmail.com with ESMTPSA id a7sm7391770wrx.26.2018.11.05.07.29.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 07:29:05 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181105151132.13884-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1ff507fd-fb35-50d5-ae45-cf96d077e0b3@redhat.com>
Date: Mon, 5 Nov 2018 16:29:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181105151132.13884-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH for-3.1] hw/arm/exynos4210: Zero memory
 allocated for Exynos4210State
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OuG413jm9IHd

Hi Peter,

On 5/11/18 16:11, Peter Maydell wrote:
> In exynos4210_init() we allocate memory for an Exynos4210State
> struct. Generally devices can assume that the memory allocated
> for their state struct is zero-initialized; we broke that
> assumption here by using g_new(). Use g_new0() instead.
> (In particular, some code assumes that the various irq arrays
> in the Exynos4210Irq sub-struct are zero-initialized.)
> 
> In the longer term, this code should be QOMified, and then
> the struct memory will be allocated elsewhere and by functions
> which always zero-initalize it; but for 3.1 this is a
> simple fix.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I suggested this fix the other day:
> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg00135.html
> so here it is as an actual patch.

I did the same patch as you suggested but continued more soft-freeze 
testing and planed to send it today, sorry.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Probably we should go through other uses of g_new() in
> board/device code at some point.
> 
>   hw/arm/exynos4210.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 827318a0036..af82e955421 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -162,7 +162,7 @@ static uint64_t exynos4210_calc_affinity(int cpu)
>   
>   Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
>   {
> -    Exynos4210State *s = g_new(Exynos4210State, 1);
> +    Exynos4210State *s = g_new0(Exynos4210State, 1);
>       qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
>       SysBusDevice *busdev;
>       DeviceState *dev;
> 
