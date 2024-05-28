Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp464458ejb;
        Tue, 28 May 2024 05:49:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWouWf4wTISLnUP9ZYk/fs/VjV/UZr39HDPS6itPg7WyGF0WcCnzOmaNK+z0xWVuINHGhWHoXHIsETeAxxzNgtZTPG+vSbU
X-Google-Smtp-Source: AGHT+IEd91Lf+pDSLLpW6Evpw35ZxGOxorDRVTEnzg8zlAH7+NB3WdyUAK+Mj8jfcJuObsUakhIF
X-Received: by 2002:a05:6122:2205:b0:4de:bdbf:6351 with SMTP id 71dfb90a1353d-4e4f028ade6mr12513831e0c.7.1716900546986;
        Tue, 28 May 2024 05:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716900546; cv=none;
        d=google.com; s=arc-20160816;
        b=V+LDUbE7wMHy+FvBC1TmbjCTytWzQz8Jbo4IIksdRS98YeHz2qpBSG1TFKIse6bQjl
         BhZmgUKbqvmsnTyAI1rn2jJRS6A6qAIXkofAdkmLEQx9PHGvc5phqeBZ2ICQjzZNbT/4
         zSrc3aGvvO7mpTdsJfjjzWO4NGGcPllR6psx5fwKTE2VZREpj6wloJJP+I+TMVWco0CI
         1MV2LLli1/PZaAmWod/45aEFUmNpuL1ZuXyAafyLd8lsWP+vS8AFHZkMAdP3b0RtKGnm
         wfQI4Tia4jHNnI4JeDh+6WCJlAOERJAmcy5gUkuCdTInrB1BV7bDlzeojjQEWl8QrRK6
         s1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zcol2jmXKa9f1VEV+cxuSqXh63Fmp1Jcz/riDhFlBa8=;
        fh=KQV7fBNQ8OlpnDtE//WuGd5joU5+cDn1+Evx5Vur4Xw=;
        b=weHB+aFfvJG5tiave5uawc/6W9P9g2s/Q54WOmqBY7GNTXsTzS/xLOSFCRm7WmqtZV
         p/jkPx5OkhDOHvc7dpYApDsu94/vU95ax3v0O55YaEdHaQt4QBxfsvj77fEm1AVWhCwD
         s0y3o33EhTIjwuIaus7bB5rX0o4qRrtGUX8VNQIwrtWIJKC3sZ185IgxOpShqUIT+Ce8
         a0RPMfdcFZz6IPDTf3dIp7+w44bocqypzYvWjc2fbYqQ4gFXChyLIpDvroiIYo77TU38
         alHkTqPs6VEmSaJLxGJd3ayYnfGOKgWZ/OJ3g949yJK8qwhfg1qrHavoyQWd6WWYYSP7
         lglA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4OcXNaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd614bdsi987400885a.785.2024.05.28.05.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 05:49:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4OcXNaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBwFa-00060y-9D; Tue, 28 May 2024 08:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBwFY-00060Z-AZ
 for qemu-arm@nongnu.org; Tue, 28 May 2024 08:48:20 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBwFW-0000Ch-OL
 for qemu-arm@nongnu.org; Tue, 28 May 2024 08:48:20 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5766cd9ca1bso1082479a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716900496; x=1717505296; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zcol2jmXKa9f1VEV+cxuSqXh63Fmp1Jcz/riDhFlBa8=;
 b=s4OcXNaXYLr5N7I+R5GpU09ynysdrEhNGdLZibQ2bL0G1jWYg1wzyldgvE0V76qLaI
 Ek5jSL6DQIPnS+rmprQHy2GWIp9tDE3DfPju8iKWNBePB4M6A65hQ2zOwf/I2yDjyjXT
 QVEp76b/YUypi1csYT3Y1AxTzIOLmVfa9c3oSGerZ3r9bJ+8Zzc/5ZN2IiTtBa9STYKA
 W0AB6XcVf4u8wrz5bWJMUZz1cy9D5rUrJel+WSLYtE2wTeZg08rPtjmExVA+GOuwJlO3
 2KkZQ0pupugcbrwWvenAaebsL5uS1D2BAgGdJlgBQ/KLhSP6frugfGVgN1qOlqCXtzGy
 cOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716900496; x=1717505296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zcol2jmXKa9f1VEV+cxuSqXh63Fmp1Jcz/riDhFlBa8=;
 b=alFRzBBAkjY9ib3KAYKXY1KAGPurgsTV7tVEaa5/STLWRCOdH64cRTbzTr2VQ4zcto
 +yob5+spCuGC/sRok3eNEN5F2sy3LLSBLZ2jmCDDSOlqUmuOaStBZwukXquPAWRhhhLN
 Fh4vYqL1qeCffdsfox18grAYqhJa8LS8NpG8/eY3qjkiw6v6sJEbaDx325UzmiMDqEkW
 ETmulTUgMLHHzWOEEe+OeiBiuHp7Q6H4JBONd3BSjwS0Dm8MGIIAe/nC0n55wvL9QxUa
 6d808nMOQM97m3p1/o4d3FRXLA6Z9rMZuzm8vIOZu1m1lsXjemkd6VxTOLI3plL5pYi+
 lFDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9uhVHRMthwJa2tvfrKnqBfWSxMUlMAxAI24puxTot3y7utqG62EWYHMBSycXZeMtpZKCnqrzMldGGM3qcjBG3X5gu
X-Gm-Message-State: AOJu0YwxGDJI1TwP0Vt0VSu7eOKd2falVjFWSepHA3ErZPthSWSvIn7P
 3lAAPVdNPTP1dwadDiPZxtayYKBoXynqDEfCVs3aUi4mBVR7L4TUzLJB+KoLQn7lffuZsVacQcD
 lXSN0nGHyZxvwppZGXWAqndapcVV2nXmW6SlR6q0Mo1nhUrkI
X-Received: by 2002:a50:9b0d:0:b0:570:374:fbf5 with SMTP id
 4fb4d7f45d1cf-57851a23abfmr9212037a12.39.1716900496602; Tue, 28 May 2024
 05:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-5-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 13:48:05 +0100
Message-ID: <CAFEAcA-EEaKCGsdURrLqTcJj5p=NuSGyU4YCF5ppRVvQfZ0-kw@mail.gmail.com>
Subject: Re: [PATCH v2 04/67] target/arm: Zero-extend writeback for fp16
 FCVTZS (scalar, integer)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hSuLXfWiOXVb

On Sat, 25 May 2024 at 00:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixes RISU mismatch for "fcvtzs h31, h0, #14".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 4126aaa27e..d97acdbaf9 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -8707,6 +8707,9 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
>              read_vec_element_i32(s, tcg_op, rn, pass, size);
>              fn(tcg_op, tcg_op, tcg_shift, tcg_fpstatus);
>              if (is_scalar) {
> +                if (size == MO_16 && !is_u) {
> +                    tcg_gen_ext16u_i32(tcg_op, tcg_op);
> +                }
>                  write_fp_sreg(s, rd, tcg_op);
>              } else {
>                  write_vec_element_i32(s, tcg_op, rd, pass, size);
> --
> 2.34.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
