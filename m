Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp302908njb;
        Tue, 11 Feb 2025 05:18:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIlCyJDPgDE00fqpu0lxO2Sijd/KvBp4yYngWdudB8xzc0iQsJeBWLbl5d2v1N2o38udOL27ruu8TVEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGBBBR2pCxwZrb3UQ3nxVaarS3hqrllAT9/cHu91m48rmAUc2wKKmprYMBl65w0S9rgvAeI
X-Received: by 2002:a05:620a:8393:b0:7bd:bafc:32a0 with SMTP id af79cd13be357-7c0686e17b7mr612867585a.23.1739279899097;
        Tue, 11 Feb 2025 05:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739279899; cv=none;
        d=google.com; s=arc-20240605;
        b=V3RVdYzutIXhQqB+R2EJIyEBmlQBibO1jgJXBUCZmDKHVGi7AkuZFeU/WObhl27Qc2
         tnwTE6ZXdNH4dXAmMHsf8AJJmQ9M5EFI+ZqQB2QgQfNx+ruO2/V1+jRcjTP0MzzXuMx/
         VD4uSqcxW01jjkc0d5mgaxV8vWwZFHpXWh+QJ1XX3SoA0X00jrzq/haZ2/2C11ikTwea
         fS9Crf4Pa/IzLDJrVW282DLmebBUbDTQdtKHCY5dpCUAcIazdYtP7MuPmXIdgVieQII1
         ESU0Cg8jmiGm/sF0lWr8EuT0xY0lUpzOr/xRsUhJTel5WKknYord5lw3nOQ8XUbpXa/Y
         2jZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wPHK2/7y7lM2DRSfC8k131Pk3pYOMVGZdLEWYS2YOm0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Xv+h/WA0uY1eIPld9uOmCmz6GRtpaOtCU5DAyvzYWkwN6LrR+ij04c7jj3KxEj1VH1
         zODQD1jWxU9DHmhOCHWNbrNr8MBh0eu5OsIVAdc1iCuasDjg16qSpcZDeEL+vT/IlOn0
         MqkmWZnNHMl5x+ZbqrSO07Fyv4wos2oXGgDx9lcm1L3xWQXwcBDBPqAhHoyMo6yK14cJ
         lRjvY8Z5Q5MhS01aXkTXcMiY1Ld734nspSwm3HT6bGNuDO+deeJkr0jCkTN4zt/Bnspz
         dfmXfmRZVb6IhHx4kGj7kVvQ3ASwm/vivEZruFa3MsZYHDI6VpsjIaNuUEd657ZDdtoS
         0dhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZ9soloP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df5c8dsi1117175585a.130.2025.02.11.05.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 05:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZ9soloP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thq9F-0004QC-DI; Tue, 11 Feb 2025 08:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thq91-0004OK-8g
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 08:17:46 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thq8y-0001A7-Uz
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 08:17:42 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e587cca1e47so5022445276.0
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2025 05:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739279859; x=1739884659; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wPHK2/7y7lM2DRSfC8k131Pk3pYOMVGZdLEWYS2YOm0=;
 b=NZ9soloPmbf73At8HVBAgMxU7p/u6fY5tBks6OdH6K28H98jMeYXtGCAn5VqGl+l5w
 mmJ34o1hKR+hHZ0Z50Sa89X0b4uiGIRR4uJCCNdiEeCAb2FgcwYRMv7ikcrvAuB9ZJfU
 HHo/FY81r9PbbX6lIHSUcb1rIs5X0cvIHURIRe2mo3EiO2b6gAqkz4NwY1U97dLiXQTZ
 t/IJC+ZhqbwGALOJ0ki2NHlzL2cMRwopYauiV/HyFi8y4TDDW3ReQ7gLeawvSFykkdBq
 uUKEayGrYOZXTZKiR4Q89CrFHUlyCLV6/B1yBPEHm8RoEq74lwkQo0VWR5rfke0rnsmu
 xy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739279859; x=1739884659;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wPHK2/7y7lM2DRSfC8k131Pk3pYOMVGZdLEWYS2YOm0=;
 b=JIn9eV3XC8YEUC3YQrpYmbdhkVqKVyNr/5fnWyRcctOnqCrdvjNcF1leQNVJaKgx0d
 /d9iFt9PhBECnimE8ta/feIrWYIcd33ikz+syHzNHNZYDJKGXhQtlakWM9EMxwBkcs7R
 5SJ1RAohhI86uYbTGVMLM6b7hUcgPbXwkDFeHvLoJdDcMJgYNU+nx6S1Qa3IAkDNPyBq
 JKGDImXkRh7LLD5yEqndZC7/P3OP70HnseuAwzNagiQsP5Z/kCiswuHf+u+d+Prpx1f4
 pDkG+78XsZbm1iNDUhB1eE+JdCuVMvNmnwHwb4UlnWT3wHi1HuNjPNIvrzS82uG/6zIk
 tUuA==
X-Gm-Message-State: AOJu0YyMPjWdRqaXF49OFfXrzoskwe+HlYTjkq8mSmFYdETsBbqwtMDR
 SV2TgQz+D2C7sqAb+hvaD5r++wMIQCve+iNYz48I1LwGYvlrmmOQa25dfo3mAtbCJCkxzuYBQ8C
 sJcp69OXeJw1gfRvDnnD0mXPaafz2rRWTSx9Wjw1afyfxxJWW
X-Gm-Gg: ASbGncupkB6H6N9mv4TwVHzgqZBWWIS4Vpg+pXQBCsFQjBaHbJ/7tNX44FgzNiRt2Ev
 oUZmUso7tOCNB1nLWfL9f+fNQFGLt/eQ038NNnoW7w7LUamoliWwbuVLPkeSpbCNXXMRCe/iB4w
 ==
X-Received: by 2002:a05:6902:844:b0:e57:34ee:398c with SMTP id
 3f1490d57ef6-e5d93d30d43mr4307512276.44.1739279858897; Tue, 11 Feb 2025
 05:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
 <20250201164012.1660228-9-peter.maydell@linaro.org>
In-Reply-To: <20250201164012.1660228-9-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2025 13:17:25 +0000
X-Gm-Features: AWEUYZldTfeBYFfbgHhQAEo2iFBAa1hCmddkzDFrihaVNPYzs7CA0bUbzp0lrBA
Message-ID: <CAFEAcA9QHK1HcvSEW+p=dGTJ0NjUKTq3C-+-Lr-rwGJpXTYKsg@mail.gmail.com>
Subject: Re: [PATCH v2 08/69] target/arm: Adjust FP behaviour for FPCR.AH = 1
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: g+gMcXHpORAB

On Sat, 1 Feb 2025 at 16:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> When FPCR.AH is set, various behaviours of AArch64 floating point
> operations which are controlled by softfloat config settings change:
>  * tininess and ftz detection before/after rounding
>  * NaN propagation order
>  * result of 0 * Inf + NaN
>  * default NaN value
>
> When the guest changes the value of the AH bit, switch these config
> settings on the fp_status_a64 and fp_status_f16_a64 float_status
> fields.
>
> This requires us to make the arm_set_default_fp_behaviours() function
> global, since we now need to call it from cpu.c and vfp_helper.c; we
> move it to vfp_helper.c so it can be next to the new
> arm_set_ah_fp_behaviours().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This turns out to need this tweak folding in to avoid compile
failures on the kvm-only config:

 #include "exec/helper-proto.h"
 #include "internals.h"
 #include "cpu-features.h"
+#include "fpu/softfloat.h"
 #ifdef CONFIG_TCG
 #include "qemu/log.h"
-#include "fpu/softfloat.h"
 #endif


(Once this has landed I'm tempted to clean up vfp_helper.c
so that e.g. the tcg-only parts get moved into tcg/ rather
than almost all of the file being inside an ifdef.)

-- PMM
