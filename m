Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp824874ejc;
        Thu, 23 Feb 2023 07:25:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+xbvsdZU8bRgMyi666JpDyEeY9SppJ5/XUsuHKLUuery38ToVi1CRtckd4B03IcErLS7z6
X-Received: by 2002:ac8:5714:0:b0:3b9:bd1f:1de6 with SMTP id 20-20020ac85714000000b003b9bd1f1de6mr21696413qtw.40.1677165922502;
        Thu, 23 Feb 2023 07:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677165922; cv=none;
        d=google.com; s=arc-20160816;
        b=ArATZNSLYai/QkTuHGpMjjyjXU6Ec3c4khQMsBzuTCUMiPSMZ/EEp6iGqYVdkIdnLq
         /5UQM8AaukdU7YNHWhnJTMdfFQcxLqFE2/86bLTHqCWs43HZ+OUZFnoNDBgOUjBroUig
         K+uBR4zAyCSKVab7dGlmfdSCnTausDgvOos1cJokBvf8zXuNwXuHY8bXPF8E9AspqP2V
         ko1wSTcIlGY6B5leuO4+o8Ocscm4WYtgoQCjM0PyqSgyRFGoZGaUWtRUfvlXZT4IdKdi
         2MZhh8KEvSuk242wHYz3fbGHg4FuZNZ71T6abJHi7bsCTaD0jQZTHDO2I94+nbFSkxoW
         U82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zbAdwnMghSTWFEpuJewSk+X+0/bwV0RXTWu2NdcKuko=;
        b=tOSXNIJ73MZQ9vCEIZ6PXD2FURTe/eNh1hU9tJLZOeu5Hm3EvjQ8AKWzoYZOtXDqpH
         CftJzLtLWBVFTEfnZctJZCuxaFpS9K6P1cQ4SDkRQ+ykffSv2g0G79hPKbcA6bJYSuYU
         4m0eXedlLgZ9xweQYCxXuL1EX6TVgFvLzptowBPmFxPUANq8f6LWap+bnFqicJMpiEr+
         6eJR2vDNhsSZZ2GBG4cEA90bJt1FUnQyFX44AqWV7pnsFOeu7hVNgUYpUROFxFpsRLjS
         Pj0FKeXYlRd9XWTi4QS80MKLzibdSMiil3We4RKPaVxzbKfW5/BQk473/nhl5rN7lD2/
         td+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="avE4yRU/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020a05620a24d000b0073911cf01f9si9389424qkn.705.2023.02.23.07.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:25:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="avE4yRU/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVDT7-0004mB-6f; Thu, 23 Feb 2023 10:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDT5-0004fY-Io
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:25:11 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDT3-00020k-7X
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:25:11 -0500
Received: by mail-pg1-x52f.google.com with SMTP id q189so5709149pga.9
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zbAdwnMghSTWFEpuJewSk+X+0/bwV0RXTWu2NdcKuko=;
 b=avE4yRU/mLWkWihxLB5mBI9Y/V4VhzTnVMzq4dduz8IfsEKDF6esBLGekYg58tCd6m
 5rSDWWnmXp/zQ8mf5ALlgCoVHdVsPxsGVuoh+DVn3iU8X8tRhCIn3Cd+dFIn2o6FMJKL
 abCcSiLyKS2wnLAzyFtAs/oihHJI4+g7SIilEvCg9We2nazlZm3SuNvj1TsJqRsMSPjq
 /B92D1mH1BgK/cRNPoBi0P9ov59DTXeilEnbGfzaKeuhdo/f4Ow7sZ/oSmYEXEBCFwdv
 OEvZJZA2Q0uCbg6jWHueutQ0iL4MzSqzfzWAP5nm9sRgoBJGceAmHaTdgRmPLKTWmL6y
 gjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zbAdwnMghSTWFEpuJewSk+X+0/bwV0RXTWu2NdcKuko=;
 b=ot7JahDKuYWhtR/jtAGcrsgu9ye1Lz5umrnT+ulXQ45MzK/yURx8i56cz4b7t6Jiuq
 YaOKD+CJsFHUUim/70PjRMc4V2MIB4RqLCXhnnYTsMa7xsQWPZqNJayC1g6BfrcP/vZF
 I2GKExInPcVvHmqMXIWUXeh5D018zpjgMrqWHv+8N7wMWCxeBf9fCObpE2CoZR0PDWuO
 Ab7kErAKCWXcpv0+VQCg01QdxYTEjopxSTjAGe1d21LtOA3w+ycoZgA5l7wiTkCt3bOD
 seKc7L49SOVPYjIQ8D/ye9eI7x0GDB7d+uyW4dlu/47ZDKxwMBWLWtm5iNAr+/GFAhB5
 pAFA==
X-Gm-Message-State: AO0yUKW3ltWNDYCs2CrAFPlPG0G+La+Y3E4pMhtifMFnJajGnQ2Rb3Fh
 WHsxGz1Z9zSb6p6b7Km7eBM26HcbQ7nfNpMmt5mSw7yn3lpFog==
X-Received: by 2002:a62:8387:0:b0:593:974c:cba7 with SMTP id
 h129-20020a628387000000b00593974ccba7mr1871546pfe.5.1677165907200; Thu, 23
 Feb 2023 07:25:07 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-5-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:24:56 +0000
Message-ID: <CAFEAcA9RGYhU3wryevfPQcn1xKSQk6MVaCgfhGpPUXq=L5=_LA@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] target/arm: Use tcg_gen_qemu_st_i128 for STZG,
 STZ2G
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: rkRnb9rQLRNz

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fixes a bug in that these two insns should have been using atomic
> 16-byte stores, since MTE is ARMv8.5 and LSE2 is mandatory from ARMv8.4.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
> index a981de62d4..04974f9ebb 100644
> --- a/tests/tcg/aarch64/mte-7.c
> +++ b/tests/tcg/aarch64/mte-7.c
> @@ -19,8 +19,7 @@ int main(int ac, char **av)
>      p = (void *)((unsigned long)p | (1ul << 56));
>
>      /* Store tag in sequential granules. */
> -    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
> -    asm("stg %0, [%0]" : : "r"(p + 0x1000));
> +    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));

Why did we need to change the test program ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
