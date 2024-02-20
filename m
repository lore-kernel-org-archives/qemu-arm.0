Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1253015ejb;
        Tue, 20 Feb 2024 04:18:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXimvyrAIPUAoE5DSczTyGWQvKcUDSnvr9n/RUDwJQEK2f6Jy+LlYKJJ5f1iNn80p1t7tyRk7thJap/T+jyBSzptX6H2oFh
X-Google-Smtp-Source: AGHT+IE1FsRxVTfPUbIoUHPOffQpdHm7LhNEpvo+n8chohuKfTFWL9XcJ5Lb5ME9tCEL3ds1qtSq
X-Received: by 2002:a05:620a:677:b0:787:3304:ce1a with SMTP id a23-20020a05620a067700b007873304ce1amr12725784qkh.29.1708431518304;
        Tue, 20 Feb 2024 04:18:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708431518; cv=none;
        d=google.com; s=arc-20160816;
        b=uQqJwwDildBXtxnxTiNQYvSV5OqpkEjnG7degjYFji5hFXVCo5t/Teuxaf6qYnHDbA
         peDnfnwQYumM1OSnKo+n7qSwpn/vzTJrgAS+F3YrRjj2SEJg9RQmJeoUGzVFcW+Sj25/
         QnISo2ta6ZjjhJIFScJpTXzQryKpKPs/ZUYE/BIG1vx4c2VjKja7CN6uQqFdlqcr8MW0
         i8wu9Ych9vBvZ4P/ODRIhg6hYhyR6keFdDkxqwBub7OFl0/x4PSrB3gEjha/DetNf37r
         Jp6WXDdQ37PrheoTivP0erdrbxmdQBIVGz2u7NMIawG2O/gaCFN0WjLK7kAX40kagx8G
         vxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hxZ/1Wp/ALyY7BKNpyDflf3LMmHEkqKQ6VtkdTvFR64=;
        fh=0sgVlpNcO/U0rLsC2gfEAxXuwMw/Cb1hgwNISwGcFds=;
        b=XSgwpXQvTpPGXxGN/rQHqorHWcyqNPS2NaD+wJXYdHt1vpFjq3aMx2uknJRWtL9k6U
         A7A4Dvz5RIUu/fF/PJFfz/h2MLBLF8y0dSaLOzAqZRZYiX7CJWvmESIw1aH6cZkOuxmt
         NRLtzrn0eVkqp7Nh9PEYIm2KN+5O/5M6Ts7b7tqwx7JlS/AXs+jmXC3J71O9I8/vUtad
         MWB6leumDk85LsXcYN1ESGxP6JNjXYQ/iLiPKOKvF51qdxzDdRFwsLQtHC4IkKwm4ueC
         z7ez1eHDVX/7FgHtkg10O4QRBH0TX5Y9eCoAyCMLhytu/u2NPVYsrNtKXuEIWzVVV3cG
         cirg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6KCuex1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020a37db09000000b00787180965fasi6437331qki.310.2024.02.20.04.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Feb 2024 04:18:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6KCuex1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcP4w-0007t0-8J; Tue, 20 Feb 2024 07:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP4t-0007sY-Qz
 for qemu-devel@nongnu.org; Tue, 20 Feb 2024 07:18:27 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP4s-0004KQ-62
 for qemu-devel@nongnu.org; Tue, 20 Feb 2024 07:18:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4126aee00b2so10186175e9.3
 for <qemu-devel@nongnu.org>; Tue, 20 Feb 2024 04:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431505; x=1709036305; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hxZ/1Wp/ALyY7BKNpyDflf3LMmHEkqKQ6VtkdTvFR64=;
 b=a6KCuex10yLUrR8sQrC1G0LpngBfUV27CRl+VmxNtNpjcG8OwpXbRskVcV/GPKzWw+
 CZXwORUOB1uR7ajPJ85/obp7tL81DtYvrcSe2EHm6VypCrNZjO3su2kiKQmnrTo2wR+S
 UBgEQMENI70HSjuGdC2n/MROixdMXL6Vyv1w9BWZfzkFikaYlRU8h8uMlOM2M5etA7+U
 cdBrcHm8P78RICAnJRq342ydvPSSPyhfOdDmFXnefMj5/l7jDmlVftRVdxvF5bZ61UDS
 ymlOEY7EFsTWsCfFJ+4vgsnZ3Gw6Ad4N00Y9/uIMRyZKd4ZxbGW6VSG6QRyTBfKxb5zy
 Crcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431505; x=1709036305;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hxZ/1Wp/ALyY7BKNpyDflf3LMmHEkqKQ6VtkdTvFR64=;
 b=my8EB3tJopLpiRxyWv0RsRrOq8ZIWkRg+m6KFEBV1KvRWSkFj4LC7Z7yNXcjMzkyWC
 qGA1HcagwxMwIT+N4B8skEEKwd53JF53DYoR85fZH/BOPQzC1ToaijuzJ4U/yMk+iaHt
 2EhKLNyDJTDtGaGW+uPuiWLoxzUyvyrxQLW2R8gkLj+9C8xbzIrLgbPIfVYwDTdHEOkx
 BWUktuYCziZ0mx7GiCgD/cRk4EAG6kaCBj1bLlb36R1Ze+aKS1Ipdu37d46ZRqAm5iP3
 2Veo3egJd2HzoMmKEXXKedB+V/eJn9It/N+zwby+CzaI8k+7O9qv+rVrEOdaRQfr77Bo
 JGNg==
X-Gm-Message-State: AOJu0Yx2hMcvy25LRXygl4BZd1EAzpXEiuQiJ5XS9oR6Ve3DECOPB1MG
 sLuCAKJaofqc2pGzu+gczOlVRrqntz5wAeO/Be7X0+XoFcDK87QLb0x1M+iHRWg=
X-Received: by 2002:adf:fe0f:0:b0:33c:e35b:7a59 with SMTP id
 n15-20020adffe0f000000b0033ce35b7a59mr10054563wrr.48.1708431504685; 
 Tue, 20 Feb 2024 04:18:24 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b0033b483d1abcsm13193952wrp.53.2024.02.20.04.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:18:24 -0800 (PST)
Message-ID: <9ac1a0a8-7a71-4074-8ea5-62cd98fefed8@linaro.org>
Date: Tue, 20 Feb 2024 13:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/21] hw/arm/omap.h: correct typos
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <3a8b80f6427bf84580eec8f7c5c411fab5419e1f.1708419115.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3a8b80f6427bf84580eec8f7c5c411fab5419e1f.1708419115.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MVHgw4CCPcYE

On 20/2/24 09:52, Manos Pitsidianakis wrote:
> Correct typos automatically found with the `typos` tool
> <https://crates.io/crates/typos>
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   include/hw/arm/omap.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index 067e9419f7..2f59220c0e 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -1008,7 +1008,7 @@ void omap_mpu_wakeup(void *opaque, int irq, int req);
>                         __func__, paddr)
>   
>   /* OMAP-specific Linux bootloader tags for the ATAG_BOARD area
> -   (Board-specifc tags are not here)  */
> +   (Board-specific tags are not here)  */

Unfortunately you need to update the comment style, otherwise
this patch doesn't pass ./scripts/checkpatch.pl.

With this fixed:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!
