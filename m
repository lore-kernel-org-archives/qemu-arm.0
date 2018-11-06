Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1167235wrw;
        Tue, 6 Nov 2018 09:38:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5cIn6URBZ5/yOLfpePe9GkWcWXx6HyS0xzrV4peXHzf4uTz5QL8BxQprNWZbmhIFgIuztnw
X-Received: by 2002:aed:2022:: with SMTP id 31-v6mr25668015qta.252.1541525932849;
        Tue, 06 Nov 2018 09:38:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541525932; cv=none;
        d=google.com; s=arc-20160816;
        b=Q2WFBMOyWGjc3UgS7szEedJcKeaDhMa0Q1Nnd82Yt+ZzexDT/wBAqz/QUSIX2DDKkf
         pnz0xZbpEgWKAC5JMdMPEBhPd565VLtmnjkWAIbbMP00d1MEpznvZuX6ZhT+eWnG3h5k
         2IGLy6F6nEZMglAenNxXTd2wF8Y2n6lB4UaTUKLWUKtrn22/cD2pAHBrm15CGlIa0jvt
         syfwmRNc9r4wTKJop/hYj88oh4vDjcRACDhn24ydQriY3NLuLe/bQR5Z8C1GG/GIDYyE
         93oVpuY95sr1pdL8mSE3pJlzn7RdnkG/kvqSLxsr90ZAdaLExry/fZl4da+CqxR5HJQn
         SMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=F/UzJ1hRTP13nRO9xRlc9Gc0431X5Qbz9jJ17NgHjlE=;
        b=KRhxFFAyk+XxGdm0H/gHh+ATybvf0ROxGpocu8gwGEBxjt79VZ+YLT+KazkKWvCaYe
         +QqsgMUdV/DeRTEEiePE4vIodXMkhaPDlI45nXLZB7avUFjMRRNaB95vO7NLMGaJGuzj
         6ACFy7tfSZi6VyyIh4NQwvSz/j7uK8U3MzDZQZMbRZe31DtGm8u0/yTS6i+SQOC8Y1Br
         ZFU9JVlSbti15ivbCAKi7aITkiGeZm0Y0ow4gOMBfmuHym2hIQsrMXpTDj+MPT9Y6dsE
         qCJqkEp4IJmNtGv8R4czFNcvrXICdsUyS6lfRhsaSIEBLTrrFTVT3RaevsSOi4enSwMo
         FHOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si4882440qtp.367.2018.11.06.09.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 09:38:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gK5JU-0004es-45
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 12:38:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gK5Ig-0001cW-5V
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 12:38:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gK5Co-0002oy-TV
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 12:32:05 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gK5Cm-0000NR-Jb
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 12:31:58 -0500
Received: by mail-wr1-f65.google.com with SMTP id x12-v6so14468444wrw.8
	for <qemu-arm@nongnu.org>; Tue, 06 Nov 2018 09:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=F/UzJ1hRTP13nRO9xRlc9Gc0431X5Qbz9jJ17NgHjlE=;
	b=InCz69az0c7BIgJA3h+8x4NwHsGlnXR8Zcn7POxaGZ18lLJ2OmWQ/qaGlHFcTTdh87
	FKLZRO3lA/DI9leeC+o8By/IyBejNUMjEm5vOddQZPUkU33C6VeLFi/5hIS3bmoNF9Hj
	aJw9Q4vm3jL5+DNg7iDinzv6MLDatRiGhv9p0ZT1gMgUkrWmxRlIF4wscRvvMR+kfaM5
	f4KwLjfmalIMy7sIkZrwDxRs/GzdkR7BhSx2buTgXXkRbtZTo5AFyqU0XfgTt0s9zyas
	FkI1gH0uuHdmMkzY1BRJHwWf045lHmbqvk2JVXnDCX58ehdIYfWbGUc0Le+pXhmzr/Nu
	A/KA==
X-Gm-Message-State: AGRZ1gKnJiRkUwB8NUvh4vj3Kd0YPokHx8Na6AhMStXRcDCeqbCplMwG
	UOCFzTPrA7fwD/0c3aBv/kZDVA==
X-Received: by 2002:adf:9501:: with SMTP id
	1-v6mr24778598wrs.291.1541525400848; 
	Tue, 06 Nov 2018 09:30:00 -0800 (PST)
Received: from [192.168.1.74] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	v11-v6sm29838144wrw.3.2018.11.06.09.29.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Nov 2018 09:30:00 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181106163801.14474-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e2d9d1f7-4310-d8a6-f50f-c4fd833e166e@redhat.com>
Date: Tue, 6 Nov 2018 18:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181106163801.14474-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] target/arm: Remove
 workaround for small SAU regions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aP6ccak/ZRzA

On 6/11/18 17:38, Peter Maydell wrote:
> Before we supported direct execution from MMIO regions, we
> implemented workarounds in commit 720424359917887c926a33d2
> which let us avoid doing so, even if the SAU or MPU region
> was less than page-sized.
> 
> Once we implemented execute-from-MMIO, we removed part
> of those workarounds in commit d4b6275df320cee76; but
> we forgot the one in get_phys_addr_pmsav8() which
> suppressed use of small SAU regions in executable regions.
> Remove that workaround now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   target/arm/helper.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96301930cc8..ec56becc394 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10560,18 +10560,6 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>   
>       ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
>                               txattrs, prot, &mpu_is_subpage, fi, NULL);
> -    /*
> -     * TODO: this is a temporary hack to ignore the fact that the SAU region
> -     * is smaller than a page if this is an executable region. We never
> -     * supported small MPU regions, but we did (accidentally) allow small
> -     * SAU regions, and if we now made small SAU regions not be executable
> -     * then this would break previously working guest code. We can't
> -     * remove this until/unless we implement support for execution from
> -     * small regions.
> -     */
> -    if (*prot & PAGE_EXEC) {
> -        sattrs.subpage = false;
> -    }
>       *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
>       return ret;
>   }
> 
