Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2620936ejb;
        Wed, 24 May 2023 08:07:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64lM7QdwW5PLykQIB/Ay2miKYfde2Rd3xSWSzPDOEStXEQmVHt0AopGYtIPDwh/b/DXe5b
X-Received: by 2002:a05:6214:19c4:b0:5af:af15:8d44 with SMTP id j4-20020a05621419c400b005afaf158d44mr30916613qvc.45.1684940834575;
        Wed, 24 May 2023 08:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684940834; cv=none;
        d=google.com; s=arc-20160816;
        b=BK8nVjpEXNMCZIDt6wHZjdttMklJ8W3oPpBS1Ge8JQuV9kvXVRXQGp+bQ2i1bAwOxZ
         Clg6pZduEGB0CW0zsg5Cl0shd6hgu8i/UcRkynJcK69cZpkUzaadBLgGoOS8LDKfvYP1
         4aZsTQ3n9c0rD/IrNH5zLLmq7gFZvNoiYnE1Z4p+f+tB/pvPlZ2u4BElTFINC1tBY5z1
         4GRtJslK/ytWQY9kA4S7LFt5ZXr0Xs24C14pj1g8vPoD2HfiG4YbZgvE63Z8/QU7Bxig
         eIWTtjHk86Ek2dT7aAk1zWjCA7d67ItMxA140r7qo9f6LF3Ug0P0R0zbAsUr4Bjz3p+Y
         QYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QM6W3cgwm+idTlEdAxc6oJS3+EvOS+5ij7wxUcVCeuI=;
        b=JqFvltuxKtOW9qSmlpst8lAmUzDgwyqMTxjxi7kDFXB68HcCxRlplimrduPicxXVzR
         rvMbg7t7oiNRXxQHS4g6o2lyIHJKa1dMqumdC90jPKaHi0DnIrJ1qpqBJ5R4Nva0Tsrn
         zoXP7ma6O1oBrZegmWFdSJA+jyJA118gTWkMN8BfxoihuC6oLzEVcXAbGlYqQhJ+6ny1
         AUIFVAw7WnEfFaj5ScOlAwvlIkHYxpohfUxNFL0pgMnTLLOXUp1960NhOToSWJ4D0AAH
         1VgHp1WPCsO4xpDYIboW3qTdEkcvJta7JInAXzXBZzhCHVze7xD3rGp9W9Q9qmMwG03Y
         KT7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zndLkgUN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05622a178e00b003f7d719855esi61413qtk.281.2023.05.24.08.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 08:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zndLkgUN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1q4r-0005jB-Rs; Wed, 24 May 2023 11:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1q4q-0005hN-HA
 for qemu-devel@nongnu.org; Wed, 24 May 2023 11:07:00 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1q4o-0000gl-S4
 for qemu-devel@nongnu.org; Wed, 24 May 2023 11:07:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so693998f8f.3
 for <qemu-devel@nongnu.org>; Wed, 24 May 2023 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684940817; x=1687532817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QM6W3cgwm+idTlEdAxc6oJS3+EvOS+5ij7wxUcVCeuI=;
 b=zndLkgUNaRhUBVQ9qjKgJ0y0edeZ/9dogb9pRErr0mDZpdtrF8CzcSq50ikQgH+5A7
 ErNH5RgQmAthuvdnE1V+hHZphvOAjQW195XNrfRdj0fvkXEfTZzFBnXfZVXGwyreX5Kw
 9eaXN9GxEUvlUJjqPX0xdl/ve0PrtEVkDFcIZlgRL0Oy+ui3hF7F7yZ+0honr2mw4Yq6
 mCmploddt59MWO5Fpb2Bs0o3rzisAU83ezIrLZDA2uo6qCKPuQj12VBJMkkffjLRVX1w
 l3etRtAtJ5WBlYn+v8t+hwl89l9T0lApWQDqmh48dVXeLuXW4WNbO6FxN7nh2lSyoHZd
 ftRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940817; x=1687532817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QM6W3cgwm+idTlEdAxc6oJS3+EvOS+5ij7wxUcVCeuI=;
 b=lK74ZxNexEvlCKmSgT6BfhGl5yIVIfTPmFR79h2/mNcQdi2wseut5Qnp8ZNani3teR
 aUdOsdifOHak9dZvCWdA5Gzz3jOnvcbHoD8PkXLYiwtl6zuvz1Iq5TUXjLgMQGJR3khY
 ACdc9rayP0zVjkRdiMS4hIKtsRCuBPDQs6J7uYM+B0aSEeppqMxQgqs4ttFDOOhrJxlz
 gKG+PQMDOBiC+MJlSU6dIv5pm+Y3epffACCOVdoIfRhj3mmWIiAEFDVW+zKDnKlS4ZQQ
 pmAocGzwKaTElrZD3h7YOnanNyBBYM/gtVhPwMBQwtaaiWwxwaK7Igz9D6C9O6S8O0l/
 y44w==
X-Gm-Message-State: AC+VfDzDoj7x3H2Q/haGfDpa++ZL4WJNy9sWtkO5qNej4vZIzKTy8YZY
 VlVeeyeRdbnVargjpOM4bIoqTw==
X-Received: by 2002:a5d:4082:0:b0:309:4cd5:76f8 with SMTP id
 o2-20020a5d4082000000b003094cd576f8mr125497wrp.2.1684940816763; 
 Wed, 24 May 2023 08:06:56 -0700 (PDT)
Received: from [192.168.69.115] (fac34-h02-176-184-31-193.dsl.sta.abo.bbox.fr.
 [176.184.31.193]) by smtp.gmail.com with ESMTPSA id
 i14-20020adffdce000000b003095bd71159sm14991998wrs.7.2023.05.24.08.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 08:06:56 -0700 (PDT)
Message-ID: <14ef3e93-65b2-5c27-5126-3a67e73dc9da@linaro.org>
Date: Wed, 24 May 2023 17:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] hw/arm/xlnx-zynqmp: fix unsigned error when checking the
 RPUs number
Content-Language: en-US
To: =?UTF-8?Q?Cl=c3=a9ment_Chigot?= <chigot@adacore.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, edgar.iglesias@gmail.com, alistair@alistair23.me,
 peter.maydell@linaro.org
References: <20230524143714.565792-1-chigot@adacore.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230524143714.565792-1-chigot@adacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
X-TUID: gVu7pTmPol+R

Hi Clément,

On 24/5/23 16:37, Clément Chigot wrote:
> When passing --smp with a number lower than XLNX_ZYNQMP_NUM_APU_CPUS,
> the expression (ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS) will result
> in a positive number as ms->smp.cpus is a unsigned int.
> This will raise the following error afterwards, as Qemu will try to
> instantiate some additional RPUs.
>    | $ qemu-system-aarch64 --smp 1 -M xlnx-zcu102
>    | **
>    | ERROR:../src/tcg/tcg.c:777:tcg_register_thread:
>    |   assertion failed: (n < tcg_max_ctxs)
> 
> Signed-off-by: Clément Chigot <chigot@adacore.com>
> ---
>   hw/arm/xlnx-zynqmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 335cfc417d..5905a33015 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -213,7 +213,7 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
>                                      const char *boot_cpu, Error **errp)
>   {
>       int i;
> -    int num_rpus = MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
> +    int num_rpus = MIN((int)(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS),
>                          XLNX_ZYNQMP_NUM_RPU_CPUS);
>   
>       if (num_rpus <= 0) {

Can we set mc->min_cpus in xlnx_zcu102_machine_class_init() instead?

-- >8 --
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 4c84bb932a..60a2710e21 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -269,6 +269,7 @@ static void 
xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
      mc->block_default_type = IF_IDE;
      mc->units_per_default_bus = 1;
      mc->ignore_memory_transaction_failures = true;
+    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
      mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
      mc->default_ram_id = "ddr-ram";
---

$ qemu-system-aarch64 -M xlnx-zcu102 -smp 1
qemu-system-aarch64: Invalid SMP CPUs 1. The min CPUs supported by 
machine 'xlnx-zcu102' is 4

Regards,

Phil.
