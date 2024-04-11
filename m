Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp157500ejv;
        Thu, 11 Apr 2024 13:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgD7FuFR/j6L/A2kYu9YtqXqO436j9jh651CDsW6+j1eORpeXPdEbOKNPQb26cOsi/iBZMO9XV1v60ebm89rIntgVi93yl
X-Google-Smtp-Source: AGHT+IEghWWATc0eCOXiTambkN+Lk8sml2s4bsSlMP0k5HhpqUdFjqspU3Mg35LjGr7THe4LFPo2
X-Received: by 2002:a05:620a:29d3:b0:78e:13eb:cbeb with SMTP id s19-20020a05620a29d300b0078e13ebcbebmr948292qkp.57.1712866049324;
        Thu, 11 Apr 2024 13:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712866049; cv=none;
        d=google.com; s=arc-20160816;
        b=pTFkiZn/IdJ6MBUyCZKnFscU2esPjLJd2pXuYzo2DiVc2ZD4FxOO2mtThvejoYJRYs
         DAN8qIT3FZ8wEoatHm8KFSTvYe0M+liXU/DafUGhmp6T7qSVlbboEtWQRfWbntYg+S3l
         wZN/UuxrLfAOhewBvLWMWshY9tv0nScr1LRvAuT8Hm0b1e+FHeinPkRnRzyGJNyhLSft
         yMCEB4gRYN0Sxbbgz4ySuzBEo/vJqe46PLfs6QEUHzJWj07644/QepYyVWaWrFJ+6VR1
         jQMXk+o1io0wBXE/aqSyO9P4jzkUG61FXyV7kUeJzr7HPB8N2P20UDao5y1YStD7jT1b
         GOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RjJZcjUlCUYpyhqM4iU+yENzWXNTqDQyMdK9vg5KE50=;
        fh=DORhgL6gfjhtryP3HzcMN06gh10qs9KUs6e+bcPrZR0=;
        b=zGpKEzKA+S4GxYzB6TiOsCfcuRjDMqi8ENsQEZ5chEeedN3eFlVmNUdxI0LTJlcySv
         SMMBbHdioOtv4TwO8tQRC16CLl/U0Of5hBSeClBMzl1d0kLi5dIql86VZozmu5njC7Yi
         nhpfEafisQGTE6Ad2kEjyXrJbTvNQLE7z/hHN/IcgwUh1wy7uIZUnSpvRdWSnS1QYPji
         goF5mPN/HZ8KilR4j8dyGRbKy91jjlcPzSMWZMLnaVvQzVU8DWkm4ygJrJ3xvXZBuNgF
         teKcZ/gQCAI+ZFkBg7yzRFv5avU2SrsQzkOX2NcFARgp5soTzO6S1utaBiMT8YUPlqWn
         jDWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vvvlhYmP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id yf5-20020a05620a3bc500b0078d6187ea92si2186027qkn.599.2024.04.11.13.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 13:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vvvlhYmP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv0hc-0003J3-UP; Thu, 11 Apr 2024 16:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv0ha-0003Il-Gx
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:07:18 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv0hW-0006nN-FT
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:07:17 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6ecf1bb7f38so262683b3a.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712866032; x=1713470832; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RjJZcjUlCUYpyhqM4iU+yENzWXNTqDQyMdK9vg5KE50=;
 b=vvvlhYmPSuG3KVuR8PlTsI+GzS8f9We6wQvsf2RUf4EypUgA6RyykrmdI9B0INuj+4
 0NGrw1ePuwrA5fr1tauim/Fp305y3/aVeLn47ccKCAPmTePmPX4YZwxKutXnNKLuMwQ8
 YxXbOSXauzp/32QnS3r5ScZuGePbx2kgHIEv5D9Bi9Ylx3DvIfHX6xzAU2i350YVqqDe
 V0eGPwFTiaH8guo9SANf/Cj2upsSBXOMVlYSeY/sN+o0ohvDUnAxUo37Ftdzd2JFPk67
 S78ZoMKsjSOOFMc68s26yX8Eb6TmPSDXegT2SifFoTT8EPlnma2947TXBKb6iZFW4NKL
 Sigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712866032; x=1713470832;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RjJZcjUlCUYpyhqM4iU+yENzWXNTqDQyMdK9vg5KE50=;
 b=wgoOK2kVHVym/NoiGqbyUtvyM4mVHTCngj/BToVzmholn4NmL1im6f5Pp3UmiZyLe9
 x9gEZeH4QNuWbgz1W7jtW6v3rICNbU+G+iM84NLhJJOmMoMXXG+z6iSBZYXq/nNWOVlR
 SMWDS9CLtXAgjTb75/WExKvL7TSdkPLSjuEhC2hXD3/DG75qvZHjjZ+BX/NUTRIjeuJx
 iE2b9bmp+tP6z5Pei6Hifnpu7DVZpSOGfm9DpWWje49Y3NpdXNDg6Wg8AwRqAcX9OBtf
 YSIVRGvd67fgvEp4LVRrxGynzLEvCz0Dgm1Eg3TRULGFQ/NeNWNssACZEBwfYZXojIIy
 O/+A==
X-Gm-Message-State: AOJu0Yx2BetvnKlbJPgjn2yrV4xqeh4mBknGsPUCmfTC3cXDUEk/cxm0
 Jf9YzNZJAaB98BakjAHcQoROI10T6t/o2fxHC6UEizAlaju+rkLa18Vev3N/uic=
X-Received: by 2002:a05:6a00:3d42:b0:6ec:ed90:65ea with SMTP id
 lp2-20020a056a003d4200b006eced9065eamr786916pfb.32.1712866032399; 
 Thu, 11 Apr 2024 13:07:12 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a056a000bd700b006e6b180d87asm1582041pfu.35.2024.04.11.13.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:07:12 -0700 (PDT)
Message-ID: <89453f6f-1ffe-4141-a8aa-fde7319f3e17@linaro.org>
Date: Thu, 11 Apr 2024 13:07:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] hw/mips/malta: Add re-usable rng_seed_hex_new()
 method
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411101550.99392-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: AK2Uz04vlguy

On 4/11/24 03:15, Philippe Mathieu-Daudé wrote:
> Extract common code from reinitialize_rng_seed() and
> load_kernel() to rng_seed_hex_new().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/malta.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index af74008c82..9fc6a7d313 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -850,15 +850,24 @@ static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
>       va_end(ap);
>   }
>   
> -static void reinitialize_rng_seed(void *opaque)
> +static char *rng_seed_hex_new(void)
>   {
> -    char *rng_seed_hex = opaque;
>       uint8_t rng_seed[32];
> +    char rng_seed_hex[sizeof(rng_seed) * 2 + 1];
>   
>       qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
>       for (size_t i = 0; i < sizeof(rng_seed); ++i) {
>           sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
>       }
> +
> +    return g_strdup(rng_seed_hex);
> +}
> +
> +static void reinitialize_rng_seed(void *opaque)
> +{
> +    g_autofree char *rng_seed_hex = rng_seed_hex_new();
> +
> +    strcpy(opaque, rng_seed_hex);
>   }

Though it isn't deprecated, strcpy isn't really any safer than sprintf.
We don't need to be copying text around quite as much as this.

How about:

#define RNG_SEED_SIZE 32

static void rng_seed_hex_new(char buf[2 * RNG_SEED_SIZE + 1])
{
     static const char hex = "0123456789abcdef";
     uint8_t rng_seed[RNG_SEED_SIZE];

     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
     for (int i = 0; i < RNG_SEED_SIZE; ++i) {
         buf[i * 2 + 0] = hex[rng_seed[i] / 16];
         buf[i * 2 + 1] = hex[rng_seed[i] % 16];
     }
     buf[RNG_SEED_SIZE * 2] = '\0';
}

static void reinitialize_rng_seed(void *opaque)
{
     rng_seed_hex_new(opaque);
}

with little change in load_kernel.


r~
