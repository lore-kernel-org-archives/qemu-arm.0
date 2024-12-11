Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4419432njb;
        Wed, 11 Dec 2024 15:09:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4X0dWpJ+pczqI3dpp8Ve2Stryo2zQ3ijbV/NYMi5DOnjI9qIdeiG3paa7GTWs4P0br5FltLoNsUrEiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFuoFBh6KQvxLdeO5OKAhFVAPJepCgivXwJ4xzShsy8VWj7ufHBmoDJUWEDGe4aLKvb0UK8
X-Received: by 2002:a05:622a:2b49:b0:467:86a9:f7d4 with SMTP id d75a77b69052e-467961755damr20188751cf.16.1733958548299;
        Wed, 11 Dec 2024 15:09:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958548; cv=none;
        d=google.com; s=arc-20240605;
        b=a+eOgPIVlJAPpACisVi8ty/z2PP6ZyA6yzd/cpeKZrUp5TFCcwDMbGYF/DxCZh3rap
         PJnFicuxnbBBt4G0++Hr1V9ZBNHKyrRpniKPV9J65o/lfa/sL/sXBYoq8Su1eKkpQY0U
         0nLQQ/+5FCCrNbr1gfqBjF6lGRTeJwdmFc2/v9GK1NVy+z7R0kOUHyvf1zkXDmWmE9eO
         DRyX8eO8cQTUnU6+d1NhVVXUplemPSKJmCxKtA0XzAgZnpp9Wn0iAOYw0of23QByDWOs
         ujt7y47CkBkbEw4nHSVmmLupHnkepcnTKu931aYgq8+v57EhRQnDq6SN8wNXNQ9PiVVD
         QR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zsmSPaG3Pa+CQ9Uj41IVqOgCCcirEC0d/DLzNavG/yw=;
        fh=Y799DbDVzJKT/W3FT1FtV4MmGDzyktUo1tpoNiazJNM=;
        b=FBEXjoDtzyoOI0UIcBgtnlhBzY+z8w2L2Pa41jznW46WvDLoIruwYLJipYZMAvIo8N
         yWJKM39s3bmDy5idvsbs3t3cpI//rlZyuNgSUf9bRCSbs75B0YBZSG/aPAqPTvU1BFmS
         58/pPuVYrrkqFBviaXvj+t8Nu1mhct1P4Orasy2xs9NrZgDgQW3MlJSL2s8OxV8MBt7n
         Rjkf9razOtBFrYZwQBjDJjy3wW4WyRYL9HNCdMLA4I0GjkYy5uuUHRaLxBgq+G0sMU+b
         x+DcBw1CnlyKdN4ssBzqeMdSD4anTUld6IwimAoAafCDZG79GvQGhkmztyWU94pLwusG
         C/QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D/XTV3e5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467879766ebsi47254601cf.234.2024.12.11.15.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:09:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D/XTV3e5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVpI-0004Yp-2V; Wed, 11 Dec 2024 18:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVpG-0004Ya-RQ
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:09:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVpF-000319-53
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:09:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso5520285f8f.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958539; x=1734563339; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zsmSPaG3Pa+CQ9Uj41IVqOgCCcirEC0d/DLzNavG/yw=;
 b=D/XTV3e5if5NyFYt9T7gU0yIuZwhKcHu7XqlNb2ifDQuQyT4Vk3L8zY4FMS5oPHqsv
 t5unyjxi+P/ea3yUzQdfhJMCeJ/M4GCG5ctr3JgDTzgcmDTbpT2Vdh8+o4uMCtRZAlhU
 Ww/rpo/e5+OC6oUXx0OZ+K5cXHKMFOO5ldpO2c9KjG8pJwXahmr2YltCSTpAqBO0gSWQ
 d7Mce7ARLAn7BSUhJz/0XFdHyStO63lnaPkZ1rNDbW+qITnr/CmsxjJtuhDQ6RBPqPDn
 nn4/uesH/7uBLq2jkA7Irxchhf9EO9KLo+jidDamkFhn9qEnXV+mCaUc675MFJKc3pkm
 2C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958539; x=1734563339;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zsmSPaG3Pa+CQ9Uj41IVqOgCCcirEC0d/DLzNavG/yw=;
 b=twgJ4ZcFA9t9qMcbiGVuSW8pCvfKO2MZgHrCeQwWRsNqdxMQx/L0oKAvY0t8/AU5Q5
 RpkhmsqtKWrQrHZMwdJyQxZm8VEL58rqtsOnWPZnSi7w1mCeu2dm6+hMPrUf/TLIemKh
 0MrHqb5MSJmITp+eFvV4mQJQ654paZrcoqtYUTQ7esHQUhedy3s6rly6Es2kJfPMZqeG
 BU4OE023m29OKMUNptCMWeaI7F7Wi6siIMgToT/XMsFvAdbSJhztyfEHlthtmyfUTTnt
 LTbBcY13Rnaj9jvgjqFxjpcyZupUubXvBHA0uiDXbnn9qdxtzGjRoYb8w2LvX34MoX+K
 GdTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb/GD6CBAOOyefA0YK5d2NGJODIG0BHVeayhSvEP9hfEG3MOkkYf5mmHynReQ7dpTzksWBqKe4Sw==@nongnu.org
X-Gm-Message-State: AOJu0Yxtey8BMuMiNFqqQF406nTBXAFtUVpi38vf10t1drUnt7sXx4Wa
 vKb0YJ8/DSswseHkAEW0prdpWtxrTkzItD0MLJdEqPDcUprqHkyAggy6Ip+J2++3IU9uTeF/PzF
 X
X-Gm-Gg: ASbGncvwy2al0jKR2gzYP/JkCbzbfZYqTJjRJAkTrJepdtmB8tr93lE0AOhXKNV+Wo2
 B8NJaTskz/S59gddUwsLoSKnWAeVxResoEXMGcJAQ9YzP1nIHkO/N1/HEO2PbqZGWajw+7SnKqM
 goMF73+SXUZjDkuEnRkw/VZSp+oKji5YLUkEqCfGornAa08GshoUXYHmZFL83uh7jDXSM5NWFLB
 +iBk51lT7kSUQURvWPqkeDwg8LlbOf+M1PKKrW79AfdsSc3BsdqpRj3Zv8rEOyoZYt+peeCVCn+
 iaR3RkX3car+P0Wzbb1b960p
X-Received: by 2002:adf:e18e:0:b0:386:4571:9a22 with SMTP id
 ffacd0b85a97d-38787695702mr1024951f8f.31.1733958539517; 
 Wed, 11 Dec 2024 15:08:59 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878252d22csm2297033f8f.110.2024.12.11.15.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 15:08:58 -0800 (PST)
Message-ID: <6e1e69d8-a9f3-4a30-83c8-84c5647578d5@linaro.org>
Date: Thu, 12 Dec 2024 00:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] target/xtensa: Remove tswap() calls in semihosting
 simcall() helper
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241211230357.97036-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: sCUVUmP1WI4k

On 12/12/24 00:03, Philippe Mathieu-Daudé wrote:
> In preparation of heterogeneous emulation where cores with
> different endianness can run concurrently, we need to remove
> the tswap() calls -- which use a fixed per-binary endianness.
> 
> Get the endianness of the CPU accessed using the libisa
> xtensa_isa_is_big_endian() call and replace the tswap() calls
> by bswap() ones when necessary.

Instead read here:

   In preparation of heterogeneous emulation where cores with
   different endianness can run concurrently, replace the pair
   of cpu_memory_rw_debug() + tswap() calls by put/get_user_u32()
   ones, which still do the same under the hood, but simplify the
   code maintenance (having less sites to do endianness code
   conversion).

> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/xtensa/xtensa-semi.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
> index fa21b7e11fc..2ded8e5634e 100644
> --- a/target/xtensa/xtensa-semi.c
> +++ b/target/xtensa/xtensa-semi.c
> @@ -30,6 +30,7 @@
>   #include "chardev/char-fe.h"
>   #include "exec/helper-proto.h"
>   #include "semihosting/semihost.h"
> +#include "semihosting/uaccess.h"
>   #include "qapi/error.h"
>   #include "qemu/log.h"
>   
> @@ -323,15 +324,12 @@ void HELPER(simcall)(CPUXtensaState *env)
>               uint32_t fd = regs[3];
>               uint32_t rq = regs[4];
>               uint32_t target_tv = regs[5];
> -            uint32_t target_tvv[2];
>   
>               struct timeval tv = {0};
>   
>               if (target_tv) {
> -                cpu_memory_rw_debug(cs, target_tv,
> -                        (uint8_t *)target_tvv, sizeof(target_tvv), 0);
> -                tv.tv_sec = (int32_t)tswap32(target_tvv[0]);
> -                tv.tv_usec = (int32_t)tswap32(target_tvv[1]);
> +                get_user_u32(tv.tv_sec, target_tv);
> +                get_user_u32(tv.tv_sec, target_tv + 4);
>               }
>               if (fd < 3 && sim_console) {
>                   if ((fd == 1 || fd == 2) && rq == SELECT_ONE_WRITE) {
> @@ -387,11 +385,8 @@ void HELPER(simcall)(CPUXtensaState *env)
>                   const char *str = semihosting_get_arg(i);
>                   int str_size = strlen(str) + 1;
>   
> -                argptr = tswap32(regs[3] + str_offset);
> -
> -                cpu_memory_rw_debug(cs,
> -                                    regs[3] + i * sizeof(uint32_t),
> -                                    (uint8_t *)&argptr, sizeof(argptr), 1);
> +                put_user_u32(regs[3] + str_offset,
> +                             regs[3] + i * sizeof(uint32_t));
>                   cpu_memory_rw_debug(cs,
>                                       regs[3] + str_offset,
>                                       (uint8_t *)str, str_size, 1);

