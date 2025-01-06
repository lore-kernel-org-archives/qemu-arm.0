Received: by 2002:a05:7022:92c:b0:92:a90b:6588 with SMTP id bs44csp11793616dlb;
        Mon, 6 Jan 2025 11:10:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVU0bD9yk1SxFpRbUk1SxDkEfFXkc2B4WwcnYITCNCHBVCe03SIHONsa/YjTogA5i/rPTDlHShRq5A2HA==@linaro.org
X-Google-Smtp-Source: AGHT+IHtmQ7rVBHRgYNRsPU6NZC8L79IjvAm7+d197SveAA3w4kPvUoQeYeN8EIQGRxgFAbcjkX0
X-Received: by 2002:a05:622a:1802:b0:467:7b65:383 with SMTP id d75a77b69052e-46a4a970364mr1076844881cf.35.1736190606011;
        Mon, 06 Jan 2025 11:10:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736190605; cv=none;
        d=google.com; s=arc-20240605;
        b=aqfVqPHmps8oqh02Ixl90sbCgQaSXa3K/5UjOsf6MNew6/1Kn1sBovSS7k03EpfKVC
         Uf+uJ2VHTMIdmFLcplIbPcxhrBN3x9W5A7N1xf8INuqQub0Oedv+NZzia6Ec+tpe1nBj
         FFr/GT/ywdtKNOsi4IKe2yHrG20V0H3yYT29SRsEiWC16eILjjcPRoFdcvb2pxJn8gfG
         uExMWuuEjFO9Fex8HQSlUAM2XT96T4xfYy09dkVnGFdg2e1UXa+K+JxB4EiLsTpgsqcM
         qEYuj6tdNJpe8MxQs2VVwBfdZvg19lmAb3xt3ZDE88DMdXnY13Dku49jW43FoOCPDeLC
         JRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GZ04ROe5zVucSnsi1pG1M6Y22Z5NwpHQGNla8TDV7+8=;
        fh=JVIUtk4P5p270O3Q37L+fvFnEgdJ/gXHETFghwOU/pY=;
        b=i+hs6FBd9GvveJojpKPHrktLEJVCjcpgi+aq76e5wqG9H6zyEDhf9k0Lcc9fT3u201
         7/lw6pPdtmO40Jqzv9jX2hhrY5GRnCfh1pxo0zTlpghyD4NjdQDnD18dYqcIfm8E24ra
         DILEuqPB5cdb1C2R7tLhrGtHX1o5Ckx/FwfpjdQZJ7mzDuYAWeK7eh1rY0AU1lYRyUDz
         hjiudIabWC/2pbrl9rzOx04odp0OOW6Ij+uhd8whrYg19uBl12td+kljFBEQXyUJn9ou
         r0faLQCLoF0xr3Ay+HxcW64hwBaGyLM88gVDin8ypCa1pUXSaagZvkQGwP8bHJtV16Zp
         2VLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=FNVbSjJq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebd835dsi116699381cf.595.2025.01.06.11.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2025 11:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=FNVbSjJq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tUsTs-0003hR-2K; Mon, 06 Jan 2025 14:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tUsTp-0003gg-NY
 for qemu-arm@nongnu.org; Mon, 06 Jan 2025 14:09:37 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tUsTo-0006aq-46
 for qemu-arm@nongnu.org; Mon, 06 Jan 2025 14:09:37 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso206683465ad.3
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2025 11:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736190574; x=1736795374; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GZ04ROe5zVucSnsi1pG1M6Y22Z5NwpHQGNla8TDV7+8=;
 b=FNVbSjJqeSV2H20IxhiUKQAXECUONIx1OP2rdlM7jChIe4597u9Ac9qJeHCKKjuQW1
 b2XJ1KaRmutTvwRPK52vycj79WvDvpjY4/s2W+dasLZPHLzQWylVZ3nGejj9tk41A31Y
 rW9AnfNbv4tEUaPCzspYGZpdf2/XUNXheHrwdhvJI6XJH07AEpoKyRCvY2YF6kabtcb2
 SZI5OoxD2wbc72tKTEYVbiUj1GiVywJgNQhtcqKC1GcVjwxyse3cNOuf7zDwotSJcNC1
 IY8ka908k9TdMmy2XTi7yE8KP4JokMxR+S+aIUlIy206GAkVX5JJ745NhzIC1JPs1m05
 wLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736190574; x=1736795374;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GZ04ROe5zVucSnsi1pG1M6Y22Z5NwpHQGNla8TDV7+8=;
 b=LKELZOum+opUyUtO+A1kFoTjcFw4MYAoID4pVAVjuwTIWay+vepJj0Xgf3Q/TSi1xc
 QHEwXqxy2xVbMtpWg7FTQFa/v4JqnNEHeB2US23+igwhGMOniA9xFveC8inAUk5XTLBU
 wha/lzQMnjgL81zYCNgkQ7hWnrlqpYKm22/rKZt67T1gbXEtdGM/rVnl01EKfAvQFJ94
 2CE4CF6eW4Lhu1xmxTfvwnKJV3O+5Ff6/ST+s84CClSqCjW4cmwQPgw+9e7BO++8EEh1
 OHciwIqc22j2pO4C8SYUxO/coh0mL7ZBVjBTw5KG9Jpd5TaYCKDYeoH9ZHfVqs0o2UIb
 Y32w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx/fgb/3tqTwpHy89/pYzbKo0098kalHSze/y+xEIjR0a4W0JUq70qrt0vjbxGvcuRWg/tGn085Q==@nongnu.org
X-Gm-Message-State: AOJu0YzK7fUipNwZKfMaMTCAqdqCLpdJEgSiavN0s4bNeFXACl8h/t98
 oEvJMvJXoINm8lb3xjmhRNRKqOhb6I5isrEYU5q8L05v+0mNZFhl1gJ2T+eW34k=
X-Gm-Gg: ASbGncvKMw69d0v/fqW3T5Hvls+6j2+FEvtwjLWcFeP3asseGhyh1wacpjAxAThqqdn
 iwOpjD7T3pRBsrhbb4llrtBAh+9Yl/pYPtTlYpJ8ONH6FLVQRUWexakqi5YXVrCDg9R0rgutzg4
 khDPGV5ekbm8LmINZtxj3L01sn6hMqoD8mPB9sppC8GvYEy0NsHIDQUIpqzeoi/CjYAyWH+QzXi
 5TakGcFSHTAxxOk+IEBPjuG/nK7GPe3VaddPI0Fndkb7jJdvGdXvuKp3E/4INxCwRSyP5Cpet04
 BIFS9MOe5yipS9o93YGLheHWvf11JPeLfVU=
X-Received: by 2002:a05:6a00:4486:b0:727:d55e:4bee with SMTP id
 d2e1a72fcca58-72abdd4f493mr74546969b3a.1.1736190574054; 
 Mon, 06 Jan 2025 11:09:34 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:6edb:f473:a9df:d551:443b?
 ([2804:7f0:bcc0:6edb:f473:a9df:d551:443b])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72b5bde56f8sm11568513b3a.162.2025.01.06.11.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 11:09:33 -0800 (PST)
Message-ID: <57a210eb-1335-4ac9-a0ac-cb636189c19c@ventanamicro.com>
Date: Mon, 6 Jan 2025 16:09:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] target/arm/arm-powerctl: Restrict to ARM cores
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Eduardo Habkost <eduardo@habkost.net>, Anton Johansson <anjo@rev.ng>
References: <20250106182343.35859-1-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250106182343.35859-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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
X-TUID: sNxSPQlbZZbF



On 1/6/25 3:23 PM, Philippe Mathieu-Daudé wrote:
> When running on a heterogeneous setup, the CPU_FOREACH()
> macro in arm_get_cpu_by_id() iterates on all vCPUs,
> regardless they are ARM or not. Check the CPU class type
> and skip the non-ARM instances.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/arm/arm-powerctl.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index 20c70c7d6bb..a080a6ab79f 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -36,9 +36,11 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
>       DPRINTF("cpu %" PRId64 "\n", id);
>   
>       CPU_FOREACH(cpu) {
> -        ARMCPU *armcpu = ARM_CPU(cpu);
> +        if (!object_class_dynamic_cast((ObjectClass *)cpu->cc, TYPE_ARM_CPU)) {
> +            continue;
> +        }
>   
> -        if (arm_cpu_mp_affinity(armcpu) == id) {
> +        if (arm_cpu_mp_affinity((ARMCPU *)cpu) == id) {
>               return cpu;
>           }
>       }

