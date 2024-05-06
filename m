Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1399659ejc;
        Mon, 6 May 2024 00:49:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4jnghqJoFdxSlTs8RUivftnATA9SiKOGmZFNszJZ6jPR6M27QID34Uxm3fnwHbbnmZuZHTRTWZg+HgSnSOpnxobcHzjhJ
X-Google-Smtp-Source: AGHT+IH+Iml2cn9vsiK4w8upf5U71grq+j4VUk1PEXAMY3bKXD9KIhJ+kl5qsWHzlBtEbs96O9NI
X-Received: by 2002:a05:620a:25d2:b0:790:fbaa:550d with SMTP id y18-20020a05620a25d200b00790fbaa550dmr12377778qko.45.1714981781335;
        Mon, 06 May 2024 00:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714981781; cv=none;
        d=google.com; s=arc-20160816;
        b=by3cUgqG2c6COTY3vry6tA66O6kJclrb6VakHPs3OqsP3e5zhuQ9BWS3e+0LAP9OsC
         5/OA2PtQ898/Drlcq+pi42xdQSKuQt75Ea+bdmoGRVicT429RsJB7mayLRFBgMJTQT2Z
         ee70chvpVJseOq98r7vAMAaLdNaAkiA6V48XKg74lI3qmNOeW1Ha/ex4vRMiX8OXdTm1
         pPSSSTQxxgvfAtSr6rWO6yh09o8EpuWulu8P2S6m7gCZT43IE6k0YLQ7ZxtPijFQG8Lg
         BYusOHHRGlizZ/KEzzdlk6OdErTY4SLaNJeIgiSVWQv98KeBf7jrQAMri1/pAQJB01wX
         0sug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AG9JPJ2NO0frLDtYOlHEhWYFOcm6MOuVJVo5/lWL+g4=;
        fh=Fq5BRtstbKxsJMmLvJLBg68j9eGuo8NeUPI88s+4Q9g=;
        b=zrvc1h8P0xqRzOoZAcZRk5ZBbEKsF7WT+4toyBaiUpV7PnEJ7nrpuesRx9ZZXV7cP8
         InUYnEtAaL0x8PpUK6xsnHiBH48EDSwdV2c69QHW20+DqpqumSO58CBJVvU3/rtxH9z8
         +9FuXs4eRdnjMe5ykhWZYRolA3dMgPeVSIZEAss+69UazBZytSa3rnIlBxUC8faEMKdu
         fvQ4/C78bsaq7ht5YPhoQXQlpbUHaedRRuIic0YVcvX8f5h0tZKvteq15YagDl+z1BAQ
         WhKREOHzXx8hv3GEQGGTXqoo0g3gpHD4WchCTmkM5wRp+uk89UQMBtCYdRtBGpqPH1ft
         uINg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gG/ozM4a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020a05620a066400b007929a1ad783si1576835qkh.421.2024.05.06.00.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2024 00:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gG/ozM4a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3t65-0004Kb-Bf; Mon, 06 May 2024 03:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3t5y-0004GI-5A
 for qemu-arm@nongnu.org; Mon, 06 May 2024 03:49:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3t5w-0000xj-5R
 for qemu-arm@nongnu.org; Mon, 06 May 2024 03:49:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41c7ac73fddso17225445e9.3
 for <qemu-arm@nongnu.org>; Mon, 06 May 2024 00:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714981746; x=1715586546; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AG9JPJ2NO0frLDtYOlHEhWYFOcm6MOuVJVo5/lWL+g4=;
 b=gG/ozM4auoUUcbP/6tSdeFpX9q5ZFT9sua1RpB+WFP66y/8Z2UKBw/CuzWr29bwdPb
 vJy3gNSw0dGqWUGg6XCn/+FshQ0oAhFlAOKvVE2yeaJZdTaddjIlgH1jgtY/BLrWzORG
 gia7sekFKIWPXiPVTjktAjuDNMZ4Lx1KgxBGsZuuUMzwES8PCkTyowYBtJIw2zJ+rBrq
 j9xunW3xQjaE3kObL8kslakGdPsbjaUPiWT+kY8Rg11niza2h6rkGSlIkiFsYOgB6kDj
 psbr93F9mWHgEaJiYGN4ant7SjJvBNWW0SbOwA7VT/Jk0Y1JDMaRrgStWv8vKHMwbZxD
 hE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714981746; x=1715586546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AG9JPJ2NO0frLDtYOlHEhWYFOcm6MOuVJVo5/lWL+g4=;
 b=Nt2cFeVFKL4b9YjRhuszVviU7yEV/UkpoxSth2gWrdG/Aiu214WcImZpQHehntJTbX
 gGHIwaAhBJXobVv6ft9ZypDTaUID4SXQ8bxTujIVcAfjOXptifv7vdfGSmhlY0W7jJgd
 keF58rK/lnxhzPo7rMXEJnkb2Ik1CclMrUx40CAnwzmx24CdNc0oFmL5QGx3QZCBHTrf
 sCYA303oqf5Unb9DZ+3z23k079LRcoGL8wOKkCqIkWR+C1YQZ+r7liJpbbz4/MVK9pxP
 6mjbn7AVSkeWTY76GJJ56ESRvmBx2lkWdYVQLiX+CFX+462UT7MFcn65X1h2QKXKDwDT
 OD7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxJgFKLEPjAHaTQakSZy0QowrCXA0Iu7RJ67TNui8s+jQLpdHfKOg/U07xKy+fiTSg9FrD025k9wtANfPx0QNuGlYa
X-Gm-Message-State: AOJu0Yy0p8BYFJaXi3TuhRZMkIiaTXPNSxj1psJ8sy7nXAQEzO1k+rzA
 HEEZ1y85W0Ntq4FM3Ln0rw0GmO9A0O3tNYBKfri+sYKanCJb2YNNhn9lpj3w9KA=
X-Received: by 2002:a05:600c:1e09:b0:418:a706:3209 with SMTP id
 ay9-20020a05600c1e0900b00418a7063209mr10053658wmb.31.1714981746453; 
 Mon, 06 May 2024 00:49:06 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b0041ea90d11edsm5178504wmo.31.2024.05.06.00.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 00:49:06 -0700 (PDT)
Message-ID: <5c1507b8-7f6e-419e-972e-af4fc98e9112@linaro.org>
Date: Mon, 6 May 2024 09:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [sdl-qemu] [PATCH v1] /hw/intc/arm_gic WRONG ARGUMENTS
To: Andrey Shumilin <shum.sdl@nppct.ru>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Cc: sdl.qemu@linuxtesting.org, qemu-arm <qemu-arm@nongnu.org>
References: <a4cbfe6c-27d6-4df0-ae31-db0d60d88f9e@nppct.ru>
 <95ab6dcf-cc96-4472-93ab-f08682b37d5e@tls.msk.ru>
 <4c4dfebb-698d-466f-90b0-9475ad4c123a@nppct.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4c4dfebb-698d-466f-90b0-9475ad4c123a@nppct.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bgpXozddrngf

On 5/5/24 21:57, Andrey Shumilin wrote:
>  1. Possibly mismatched call arguments in function 'gic_apr_ns_view':
>     'cpu' and 'regno' passed in place of 'int regno' and 'int cpu'.
>  2. Possibly mismatched call arguments in function
>     'gic_apr_write_ns_view': 'cpu' and 'regno' passed in place of 'int
>     regno' and 'int cpu'.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 

Fixes: 51fd06e0ee ("hw/intc/arm_gic: Fix handling of GICC_APR<n>, 
GICC_NSAPR<n> registers")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
>  From 23b142f5046ba9d3aec57217f6d8f3127f9bff69 Mon Sep 17 00:00:00 2001
> From: Andrey Shumilin <shum.sdl@nppct.ru>
> Date: Sun, 5 May 2024 20:13:40 +0300
> Subject: [PATCH] Patch hw/intc/arm_gic.c

Your patch is malformed, see:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches

> 
> Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
> ---
>   hw/intc/arm_gic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 7a34bc0998..47f01e45e3 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1658,7 +1658,7 @@ static MemTxResult gic_cpu_read(GICState *s, int 
> cpu, int offset,
>               *data = s->h_apr[gic_get_vcpu_real_id(cpu)];
>           } else if (gic_cpu_ns_access(s, cpu, attrs)) {
>               /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
> -            *data = gic_apr_ns_view(s, regno, cpu);
> +            *data = gic_apr_ns_view(s, cpu, regno);
>           } else {
>               *data = s->apr[regno][cpu];
>           }
> @@ -1746,7 +1746,7 @@ static MemTxResult gic_cpu_write(GICState *s, int 
> cpu, int offset,
>               s->h_apr[gic_get_vcpu_real_id(cpu)] = value;
>           } else if (gic_cpu_ns_access(s, cpu, attrs)) {
>               /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
> -            gic_apr_write_ns_view(s, regno, cpu, value);
> +            gic_apr_write_ns_view(s, cpu, regno, value);
>           } else {
>               s->apr[regno][cpu] = value;
>           }
> 

