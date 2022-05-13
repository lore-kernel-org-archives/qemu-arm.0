Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp178687lfj;
        Fri, 13 May 2022 03:14:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw++P+1mFHGGrJYzxQX+/t9bQPbrS4d3aCIzrJuAmPZRWQevs6kpZN5fZ8gYZ7HNg3Kd7k9
X-Received: by 2002:ac8:7f81:0:b0:2f3:c5d3:f239 with SMTP id z1-20020ac87f81000000b002f3c5d3f239mr3709670qtj.87.1652436875516;
        Fri, 13 May 2022 03:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652436875; cv=none;
        d=google.com; s=arc-20160816;
        b=Ju0lwQrv57xu6PvYOpRg6HsJjCGNov80DbcAsIWuEiIezixnk+8222mN2fli0pqZmE
         rXKviDRrqlAL6cSJE+q5xeELWlv8Eb3CwTzSESNWLZ2wha0TB/o0BtidseKj0il/v0p2
         XZ4XEVl+BqnpPTQroHfpDQe1QVQDQhlLxUX6mRUtJYKNGmEUgKcOn82j2sM/xFImXsdy
         0Vt/3soImTDe8a22Jp2YEdR2r5kq/Dk4PK2VGolABJWHBW9TCWbygP43lhsopVaP7ot7
         M8hH0ZYGBakGFZChbXtbbCyilHmo8xFdA4bqRpAgVQqjGRRP0aoF80iEvoXE5CUSfkJo
         YRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=w0Je9y+M8dIuB/fuq3rxBKyiseRF3ljnPWVNnO9YjwY=;
        b=JmQZEmGzRJQUZXJPO9cmL52aW1mM0GiBDu5KBEa3d8bwcti9Pm5qJE76uY9RD8C+Ov
         I6WDS/dleY4Dg5gKUAmf/f2d8X2kIA2KqdK1qRjMBft8+llPrVd3Epi1MmsZoHLdcmlP
         lcI7merOAoEyFTCFrzMwyP/TkVLSdWNqX1X2aoGKPNUzNThKnzk6TTUb7TTrI6iNqgkb
         tvpu7PBF5Otf9UyOi8Bu168Ql/X1uBvibiUxpNUck7UFLV6J0mw4U8lMUiyTtfUqlei3
         SMuH1Fn8Ofs4dOpmyQO5jWFgW3wxpL8lN/mrljf8RLsnIoC7O5E6cTfqMb8pkCxjKLZj
         EwHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=APaApJB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a0562140d0700b00443cdc10af6si1129549qvh.536.2022.05.13.03.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 03:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=APaApJB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npSJf-00016x-2D
	for alex.bennee@linaro.org; Fri, 13 May 2022 06:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npSJQ-00016W-Hr
 for qemu-arm@nongnu.org; Fri, 13 May 2022 06:14:20 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:40815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npSJO-0000nQ-U6
 for qemu-arm@nongnu.org; Fri, 13 May 2022 06:14:20 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f7ca2ce255so84926057b3.7
 for <qemu-arm@nongnu.org>; Fri, 13 May 2022 03:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w0Je9y+M8dIuB/fuq3rxBKyiseRF3ljnPWVNnO9YjwY=;
 b=APaApJB6UqWraxTgECAl54MAmCOldMfux4QqMpt5u/hM/BvxU3XUrHcohh7QLPUebb
 A6ZvgbwEKHntCYNChvs9RN1fTmRSqXskG5w3YoAZrR84jE4Yr1llzrjjm8sxIo6u8Xs9
 fchU8H9oa5JvXvhZxa6ULiJmCVYbyCuRy/e47xSwNXwGYh5anjNK3Sb/mB7Gc9MZn4CS
 ECmVsBFyLUgvykRpA+dduR+ExivNsZcKPTs77OaiOHYptJ0z6fEivoBBbOcEgYjrnmdf
 swSDkDvG4Eq6VqityceUco8uDvEvwK5FVgrA/goyr89R6OGfdITzSQAGQkB+6Yvpflep
 osKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w0Je9y+M8dIuB/fuq3rxBKyiseRF3ljnPWVNnO9YjwY=;
 b=jGvxIESdJsj19tTMzZTUOI7hAT9n5IQbZXxVlYz/+tTReN8z3gMxfED9o1LyJTt2rU
 EHxXjcEQsp/AXsfLSooUAAZU5F9CdsiYZctE2BJDqhs5cRDZvdquEzBjcoT6/+pMopgR
 1i9pq4jqrwsK/uo3LkBiPEeCpWjicHQX0w3fvS5djENJKaSUk5NR1cf9OctYQk+0AFiE
 wKfwd1M40rFbpwo8eLMNunlicen3c+fbdLQcWtW8qzsuLSVgy6oLqXvuUZkqTHNLAb8C
 Bl5ok65hKTiEb66kML9BdQ6wWEftQ3KfaGgcmI6J8x5bTADjeQVE2+dQ644GlwYN01R/
 GCTw==
X-Gm-Message-State: AOAM533Pe8c82gM/at5S2bqDuAYMnyJhOjlERAbHV+N4t7YH89sNIqrh
 s8Lmkb3O1ZHR5tF/wtjCwt3fyuGQcAleW+wSvonD7Q==
X-Received: by 2002:a0d:db4a:0:b0:2f8:3968:e808 with SMTP id
 d71-20020a0ddb4a000000b002f83968e808mr4730925ywe.455.1652436857548; Fri, 13
 May 2022 03:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220510000426.45797-1-richard.henderson@linaro.org>
 <20220510000426.45797-3-richard.henderson@linaro.org>
In-Reply-To: <20220510000426.45797-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 11:14:06 +0100
Message-ID: <CAFEAcA8OGPEETKTt=A3j4W65Kh3QAC80W7hmt5xrpLu8TUJHDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Use FIELD definitions for CPACR, CPTR_ELx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pk/e9EBhSIRV

On Tue, 10 May 2022 at 01:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had a few CPTR_* bits defined, but missed quite a few.
> Complete all of the fields up to ARMv9.2.
> Use FIELD_EX64 instead of manual extract32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 44 +++++++++++++++++++++++++++++++-----
>  hw/arm/boot.c       |  2 +-
>  target/arm/cpu.c    | 11 ++++++---
>  target/arm/helper.c | 54 ++++++++++++++++++++++-----------------------
>  4 files changed, 75 insertions(+), 36 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b35b117fe7..c44acd8b84 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1259,11 +1259,45 @@ void pmu_init(ARMCPU *cpu);
>  #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
>  #define SCTLR_TIDCP   (1ULL << 63) /* FEAT_TIDCP1 */
>
> -#define CPTR_TCPAC    (1U << 31)
> -#define CPTR_TTA      (1U << 20)
> -#define CPTR_TFP      (1U << 10)
> -#define CPTR_TZ       (1U << 8)   /* CPTR_EL2 */
> -#define CPTR_EZ       (1U << 8)   /* CPTR_EL3 */
> +/* Bit definitions for CPACR (AArch32 only) */
> +FIELD(CPACR, CP10, 20, 2)
> +FIELD(CPACR, CP11, 22, 2)
> +FIELD(CPACR, TRCDIS, 28, 1)    /* matches CPACR_EL1.TTA */
> +FIELD(CPACR, D32DIS, 31, 1)    /* up to v7; RAZ in v8 */
> +FIELD(CPACR, ASEDIS, 31, 1)

D32DIS is bit 30, not 31.

> +
> +/* Bit definitions for CPACR_EL1 (AArch64 only) */
> +FIELD(CPACR_EL1, ZEN, 16, 2)
> +FIELD(CPACR_EL1, FPEN, 20, 2)
> +FIELD(CPACR_EL1, SMEN, 24, 2)
> +FIELD(CPACR_EL1, TTA, 28, 1)   /* matches CPACR.TRCDIS */
> +
> +/* Bit definitions for HCPTR (AArch32 only) */
> +FIELD(HCPTR, TCP10, 10, 1)
> +FIELD(HCPTR, TCP11, 11, 1)
> +FIELD(HCPTR, TSAE, 15, 1)

This is TASE, not TSAE.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
