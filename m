Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp793090ejc;
        Thu, 10 Aug 2023 09:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVRgB4whFGC56uy2PCiQ4Jvlv8fAWaffCT7lvMqhaMlnE9Gg9m43qPGiCP6xjiSo6bTmH1
X-Received: by 2002:a0c:e442:0:b0:63c:f193:40b4 with SMTP id d2-20020a0ce442000000b0063cf19340b4mr2988328qvm.9.1691684665022;
        Thu, 10 Aug 2023 09:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691684665; cv=none;
        d=google.com; s=arc-20160816;
        b=Fcz+7/sTWWVQFcKCqzqpdsyXkeRgL8yUbnt8GoGfhovYvp+oBr72pnqfoKg89KGFSR
         CTzB0+ODnpYJMFMM0mG1Ab0I6U9aBfK2agCUnpwsBG9wvvDhuITH2CqhP/k0C3/00dP0
         NuGhBTQ4gtvlzA3GUwHf9semh9FDhQOJon/KmGQXPUCXoQ9ApTCx4CdmXv5GfD7UBl2H
         Rld4w1DxYg8YaoG9AT6Pb31EJ/c0hjD4T19Q5SK7Bs27iDFmvMPqLqC3wg5KRyBF5YCp
         XBQ5KQkDNN40nfRaocQchbfuDX1c5ktY9SkK8J2tEa5F0869mT8URFdxFHcmkAfG9osO
         nBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=i2mcToMniKLoxJuyIOSXHvvMNrpA05EweuAGyGbT8dM=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=HtUVznTxQ0zF9Ze4rdJsBluIpQ0fTqfCqiKjkiAGIradWRHUPeu1XGSRc5suIRVboe
         Brwq0+vAnEtbYl8+50H44VPpgImVEnXbUNLf0a9XvjWZx/YmbrNUFpQlB1RinxMYHO9Y
         Vavk3FLSuggFv5kAiMnMzWoqZ5AEQsjrPabfearCDvZtoPWc4SVIvQKh07RdEXjGvJP2
         nbU1h9qJUFHNljSHGb9o8C4tKWiitET5lQdjAxaKR/ZqJruRsVFJkoEfxWPHYAxFBfiA
         iC5nUAyU9P0VO4Q59mJfweDI2GrNdaY1VUjrDADwE7+fBWkBIj6vflPZH41kgj32myt4
         Sllg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q60wI34s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a0cf211000000b0063d3863fcbfsi1072379qvk.594.2023.08.10.09.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q60wI34s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8SR-0006Uo-HG; Thu, 10 Aug 2023 12:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8SP-0006Th-Di
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:24:17 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8SO-00054g-1W
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:24:17 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so1363389a12.1
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691684654; x=1692289454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i2mcToMniKLoxJuyIOSXHvvMNrpA05EweuAGyGbT8dM=;
 b=Q60wI34sMiXv3pG/2PBj71fExmDk90yyeELgAFBl72RA+fo9HZYGOeXL4S0nbeijQ7
 M//Qzwv74oI/HI8yDKF32iBpWnAElQFO+Qh/FUt5KqPEcn2dE5xqr2nNk2Sn+B+7DJSz
 +mu/ziuKfaKFeGZuNZlrtsk6bbouis3oOCMWZEu166QtFtRFYSCNJLCJSFRn+NGJQMzU
 OYJLd3J/pAoijvuE6Ga6vsKw/QQRgAAjumsKRU3x+D36nxyntyy/wrvzPvVTWmXFtuHt
 sGkuDBBDjQJriQO7g3FOOaWzPzCCVeeMSrp+gFvmdVoIIueQVrcElVkZdKQAVwF4m3LQ
 NsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684654; x=1692289454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i2mcToMniKLoxJuyIOSXHvvMNrpA05EweuAGyGbT8dM=;
 b=DVoW+y1Mf60iH9fHqD0A+BBMeVMIWx24ikYtzsvYW7QQKV46PD9aw2KpSbHSEk42QJ
 XFEfYpG70XWTjLgPpoSqk16war0XubMfvSGCGSbZt/o0tf2G6Bh4moIzH4huEMll/PGg
 8SdN14R837APDIpMkHA+BGPZnc7BXJoqGsh/gOg3+EfCwUb1QGOUjWh7Bcq2HFTFGdd5
 M14jQD5JTIjxzmmSuaJedDplYPJUCQzf8+hIQYQRBCBeKcqD8l9UxIM32Kp29WkeKYIJ
 0E/bQj2cM/wnPLFqudaCabQOowE7/1Fg9l/cqLUYhCS+EOfB0uAIwprw1zQJrVCn27Dg
 1QpA==
X-Gm-Message-State: AOJu0Yz+zXHlxuajjUBw6ISNH+Ki3emRuX2Yzb1+eM7XnRaHJzxI9uta
 nuZnSZp6zOxbE637liWIua9p5Z60uIJCUE/rj3auN7gM/hxfkECe
X-Received: by 2002:a05:6402:31eb:b0:523:4c93:1c0f with SMTP id
 dy11-20020a05640231eb00b005234c931c0fmr2404412edb.21.1691684654604; Thu, 10
 Aug 2023 09:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-6-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:24:03 +0100
Message-ID: <CAFEAcA-OH--irvgpBP6BFLsCZf+2XT=1s=u+xsivRdNi8jwxPg@mail.gmail.com>
Subject: Re: [PATCH 05/24] target/m68k: Use tcg_gen_negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: Z7zEiJCgZGes

On Tue, 8 Aug 2023 at 04:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
