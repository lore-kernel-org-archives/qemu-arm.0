Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp632877lfq;
        Sat, 9 Apr 2022 12:55:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD0ZaLm+/jfKQz0BDGoCxuChJPy0rySu3n0pCHkzYeSU94egaPSZua8JNT1QihcVA5Hjfh
X-Received: by 2002:a05:620a:89e:b0:69b:fcc5:eae5 with SMTP id b30-20020a05620a089e00b0069bfcc5eae5mr1998422qka.322.1649534100771;
        Sat, 09 Apr 2022 12:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649534100; cv=none;
        d=google.com; s=arc-20160816;
        b=WcvLpkTBzigAYk+uxrunPZ4FWZOQK7Ulr7NtWdMWmqmgZM6OrfTk6EzuJLbZa3/AIk
         1soVp3v9VSVBlYkgZjfVTpSJnBCEffOpR0D0h8x9VRyXv3fdeaQVjCzkmmlO01fGaDCO
         FDtdheFywP5kuAPL3eG20dVhzLQRCyvAyPEAWPwyKnC6yAz2IuJ1isPdAwrZt3D7qQlu
         OPdYCyFLyr1WuSOiyqyBMRsIt7bLlSgHqPkHQ+a02YfNRgI0zKHRfeSGoXKZfxtlPxpq
         E3l2Gbf3sEcnHoRUNeUbi3hk613f3FZ8egggU8IZI/2tPVsUamUMWtbRaeE57SZZ+rq1
         +zlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=uHj1JBKGUb/JAXg960pBTK6M12MZZYk6u8w96S4rdT8=;
        b=mkd8VKaE8bZESrxpoD49lybWhovVWIkhOoArEKc7uj4KGzijWcMKeDhYxRlmZdUzTi
         FPVhGdMR7c6gvDClxJD/fQFHTtQcm1FhwblvTolhblxmo35V0fGApJFP5rVvPtbg562p
         3ACAI2B+ycnFz/qUzVNKu5oY7W67R84Q/e1PwJE+LruDPMxdIYTN1v3TX/SyggIwctCi
         o0CJIsK/TVDDcmem3Jdskr9TOhTmdjaQShuvRS7628szqntMT/amjSia6gVq+A4D5gRK
         f8djHqCiDEhVZ+Dsowzk2Z2fpw705DZFleFyC+CnT+I53EIfKgy98SFlEeObxfPAnk28
         FLFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6jFFMyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020ac87ee5000000b002e1fbf3bf65si2221091qtc.342.2022.04.09.12.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 12:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6jFFMyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndHAi-0000lu-AJ
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 15:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHAY-0000kK-SY
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 15:54:50 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHAW-0005VG-JE
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 15:54:50 -0400
Received: by mail-pf1-x433.google.com with SMTP id z16so11288387pfh.3
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uHj1JBKGUb/JAXg960pBTK6M12MZZYk6u8w96S4rdT8=;
 b=O6jFFMyCIK/TxncmJowGuk9EXXOAB9A8dX3tR8GAbGxceRS0TsJCG6/XClHKWbqn3h
 4nF/953t3s+NQ7K1kBgs2egcwT/XrjPi3/anwaw5ih6VqejGH5RGZgVeL0r3IFgp/iyi
 HMYD/ROx7y8rSM+ZHvJ8/f7xYRhLAlvwy4wVtkyLp6je+5uaJhUAJAS2VFQl40umgGOH
 HPyCMVVZM67mrxpdZOZr1dk1nJpewJoo/rBtXz/l8yTEsLu1hZRr/W+cw894MdyWzaMX
 4IsWkHizOOVT0JNFMYMBafmU8keiij5+Sz0opCpGeKkAyA5ER3+2jFYAa2b4j7dvhe0V
 GO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uHj1JBKGUb/JAXg960pBTK6M12MZZYk6u8w96S4rdT8=;
 b=qAlof2kQH6s/unSNacPsmIIUeAV7PYlD7BAzfkiHvUTsrErlNg3T4tRqysZYA7vsgB
 J0ZLZ6FyT/9ELeDZBfKHXUMRcR0COHv7w6ACbAqZMgXfd6SeIap0yeD3nznno1HNdS9g
 Rr5EPyGwfy0fvMPxjawAZlUJmp6RZscJG4yxQse3S29gaevjOcrfS4dggk7M0mNhbLvI
 vcAquY3ilQe1lQc+9fVWAFpPXqmVMD+dBZrQJTFopv5LJ2h4Q8M+BYYQUymGAEcjAce5
 lwHh8olItR+5dujBRsfi66srjM87SOaDk+WZtWTTK5weNwsYdjO1eCAziOlZLwejkXyz
 OIRg==
X-Gm-Message-State: AOAM5300AJeL5Quvv9dMIxrPbUnSErFK92mMLGps99FB7nSa7d4Zkwaz
 EYlbpDwlzU8kpRUUviz1fpvjCg==
X-Received: by 2002:a05:6a00:15c6:b0:4fa:aaec:ef42 with SMTP id
 o6-20020a056a0015c600b004faaaecef42mr25501100pfu.74.1649534086796; 
 Sat, 09 Apr 2022 12:54:46 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 r76-20020a632b4f000000b003820643e1c2sm25456245pgr.59.2022.04.09.12.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 12:54:46 -0700 (PDT)
Message-ID: <4f8d81ad-521a-adb0-d8d5-745f57818b9a@linaro.org>
Date: Sat, 9 Apr 2022 12:54:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 28/41] hw/intc/arm_gicv3_redist: Factor out "update hpplpi
 for all LPIs" logic
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f3Vny+1PjSAH

On 4/8/22 07:15, Peter Maydell wrote:
> Factor out the common part of gicv3_redist_update_lpi_only() into
> a new function update_for_all_lpis(), which does a full rescan
> of an LPI Pending table and sets the specified PendingIrq struct
> with the highest priority pending enabled LPI it finds.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 66 ++++++++++++++++++++++++++------------
>   1 file changed, 46 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 571e0fa8309..2379389d14e 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -103,6 +103,48 @@ static void update_for_one_lpi(GICv3CPUState *cs, int irq,
>       }
>   }
>   
> +/**
> + * update_for_all_lpis: Fully scan LPI tables and find best pending LPI
> + *
> + * @cs: GICv3CPUState
> + * @ptbase: physical address of LPI Pending table
> + * @ctbase: physical address of LPI Configuration table
> + * @ptsizebits: size of tables, specified as number of interrupt ID bits minus 1
> + * @ds: true if priority value should not be shifted
> + * @hpp: points to pending information to set
> + *
> + * Recalculate the highest priority pending enabled LPI from scratch,
> + * and set @hpp accordingly.
> + *
> + * We scan the LPI pending table @ptbase; for each pending LPI, we read the
> + * corresponding entry in the LPI configuration table @ctbase to extract
> + * the priority and enabled information.
> + *
> + * We take @ptsizebits in the form idbits-1 because this is the way that
> + * LPI table sizes are architecturally specified in GICR_PROPBASER.IDBits
> + * and in the VMAPP command's VPT_size field.
> + */
> +static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
> +                                uint64_t ctbase, unsigned ptsizebits,
> +                                bool ds, PendingIrq *hpp)
> +{
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint8_t pend;
> +    uint32_t pendt_size = (1ULL << (ptsizebits + 1));

Code movement, so ok, but no need for ull.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
