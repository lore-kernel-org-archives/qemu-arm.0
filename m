Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp496958njc;
        Thu, 8 Aug 2024 06:03:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJGO2om65BLBFkPA7yroI+dLTrHN8Aj5bAZaNLATwMgkINCt8bhF3y0otTFkma01KgBziBZtwhe1aSzA==@linaro.org
X-Google-Smtp-Source: AGHT+IExXepVV1RqY8mOzbEsgiZk7u2FYAQgTNhJ/170zTxNPmI2lWcZz9q6lspWQ6Xa6b+uxBLE
X-Received: by 2002:a05:600c:3c91:b0:426:62c5:473e with SMTP id 5b1f17b1804b1-4290af19256mr15502095e9.26.1723122238344;
        Thu, 08 Aug 2024 06:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723122238; cv=none;
        d=google.com; s=arc-20160816;
        b=o8uMEJT/JBGIsoIzKpTGY0wYk6yTmrSO8M/b+YTNk7lkVw1PkbBd9bm7wnXFhR+6NB
         AcjAUE6YVOyneWlyC4aKJLJoZPcLu1WYAaXD00R/IFbeO9Ged4BCLDTzu66tQcFT7aDJ
         yCmJKN/5AkN9WtCDq3hwNXgt4jDqdsBaGAkF5scgWvkL0QYn3QsTkK+scMGhjJQN0gj0
         iMO1kAWU7Ub03OFt+pKmvX7q6iC1D4NAprRa26V9Axzbqtl9pI9EgnNv5PHjt9Wz1pfQ
         3eAuYYQhC9siovbc0cuOSW8U+q7QkCDfJeO3F5SxlSmWp4fFxCNrlBM9nezJo/MN84Rj
         4Pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2x+upV4aKqH/ReQCdsxjfOCLOWnfSZw1DbO3TJVHrTc=;
        fh=456VxxF5cH/kn6ZGczEAPquU3F5BBxQr+EFbS/Iixlo=;
        b=yenzrzdr+J/0G0T/NN9uDoxIV/7TigK+fX8T5kzB0k7AIlSL6OBi01RBMu+DrNAjuV
         h8inov1UeLKB23Hjs4rcxM3qwh6LISQeunykMZ42RXI+dN02WjNmGbV9DTwgFehtPm2l
         z/QfirOegduvQYpCuKv2TwZFcjeaeWGi2WRGC6XHaJreaGTWYtPKQQ/SeP6frxV9L+WI
         pjUNaK7TfpF1UbJTMNiKFhdXXZRUPSbF/JK0n5991cQ8i6PMO2TsaOgzivmSkxQSfCNo
         mSQaiIAELuSOYoMJy5wdAWis9KgA10Tm4MivXIuodGkK95rUQEH+BCZ8JoUcoKWudb2B
         1Ubg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eeb4IMP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36d2727e63asi793231f8f.724.2024.08.08.06.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 06:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eeb4IMP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc2nq-00038T-Qb; Thu, 08 Aug 2024 09:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc2np-000377-E8
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 09:03:37 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc2nn-0002jD-Ee
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 09:03:37 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5b391c8abd7so1083713a12.2
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723122213; x=1723727013; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2x+upV4aKqH/ReQCdsxjfOCLOWnfSZw1DbO3TJVHrTc=;
 b=Eeb4IMP7nIyRGos1q3M2E5sdjKUcAcZl2L3vv0/EGAfG/eRyVWf+ZAgavKiPrFH9q6
 qwI2hXty+PMqIqRaFdA7XV3B+AtDkIW1nSW6u+UuMBYPCxGo6kE9W5/PC+PdZzXX4VLb
 b3fVN6i3gsMpyP37vvm7q2gBTWZDXu9DSsnf6RjtKzE+kiVmjsZY7ego8GPloidsn5YD
 b8w4kZYELt41Wnu416EW4VuDv3gMWMfOvWPgt/ZBvsQOJQ0JcVOvoPlWZtmYDfdcYU2b
 td9HBqEBTLLGObNwMfoYiqkL3DVfTHW76/fEylSEXFcEO6Ghvp1WiyftHkMKrJjcGmOZ
 qhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723122213; x=1723727013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2x+upV4aKqH/ReQCdsxjfOCLOWnfSZw1DbO3TJVHrTc=;
 b=W1zCv+/biQlFFkPxFMrWtjd176xN8Hp4alDNxPSMCnHSe17V9LUvJTNOFjW9l1Fi38
 fGtW4vUMAaZX2yhSDBuXXu1D4nkPVnw+yoDF0QyAF0g4x9U3s8zrHVT86IDP+y6KAybx
 WwvzLphSpEif7U3h4BN5lN1RaosuAA965mfqyON6d+tG1gDNxUuKPOeN99lGpBxq2FEM
 Ruzph8ME37ErCskNf7DSmpfpvCs4+iYMSDG7MZVu9Sh2oJz+EmJGFubzp/BW0+ZLvgnL
 LZUQvqwi5bHUT5kZ0uUo+x7w/MBclJfnc72KKn+YcUyAHzrv0fW4LG+UyezRr4K6g9rX
 SyXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiToI4yKfJfz8BhdRvAnK2T3LVleBiS0pd25q7JbdGj6Fqmegf1MBvDEuvzqYwmZzUfVS4no8jiw==@nongnu.org
X-Gm-Message-State: AOJu0Yy3cM9O1cTg2kI+Pde0oS7jGJjobJEoA9ounE4Z5gGlC4ldztjR
 r5SPFUf+Satx0/z7RYQRD/AkRA8y+ut5jjzSi6l9Ty7e3kK6LpnaJHNfztzMhw1km2FyHKBOCKZ
 Q6AAGAsbXXoPCzrTCPxp5FRCkWebRXf7392jbKA==
X-Received: by 2002:a05:6402:42c2:b0:5a1:faf:e5ac with SMTP id
 4fb4d7f45d1cf-5bbb23c6440mr1615459a12.26.1723122212996; Thu, 08 Aug 2024
 06:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240801220328.941866-1-alexrichardson@google.com>
In-Reply-To: <20240801220328.941866-1-alexrichardson@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Aug 2024 14:03:21 +0100
Message-ID: <CAFEAcA88Y=VXcTAGyZ396L2VDQp77E5KaStjpKrT5AS1aouC9w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: add support for 64-bit PMCCNTR in AArch32 mode
To: Alex Richardson <alexrichardson@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: 5Mr4q29XrhYZ

On Fri, 2 Aug 2024 at 02:00, Alex Richardson <alexrichardson@google.com> wrote:
>
> See https://developer.arm.com/documentation/ddi0601/2024-06/AArch32-Registers/PMCCNTR--Performance-Monitors-Cycle-Count-Register?lang=en
>
> Signed-off-by: Alex Richardson <alexrichardson@google.com>
> ---
>  target/arm/helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8fb4b474e8..94900667c3 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5952,6 +5952,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
>        .writefn = sdcr_write,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
> +    { .name = "PMCCNTR", .state = ARM_CP_STATE_AA32,
> +      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_64BIT,
> +      .cp = 15, .crm = 9, .opc1 = 0,
> +      .access = PL0_RW, .resetvalue = 0, .fgt = FGT_PMCCNTR_EL0,
> +      .readfn = pmccntr_read, .writefn = pmccntr_write,
> +      .accessfn = pmreg_access_ccntr },
>  };
>
>  /* These are present only when EL1 supports AArch32 */
> --
> 2.46.0.rc2.264.g509ed76dc8-goog

Coincidentally I'd also noticed recently that we don't implement
the 64-bit accessor for PMCCNTR, but I hadn't got round to
writing a patch, so thanks for doing this.

The 64-bit AArch32 PMCCNTR was added in v8 with the PMUv3, and
presumably most guests which use the PMU in AArch32 code want
to retain the ability to work with PMUv1 or v2 (or were simply
written for PMUv1/v2 and never updated), so they stick to the
32-bit sysreg, which is why we haven't noticed this bug before.

There is an argument that we should gate this on
ARM_FEATURE_PMU being set (or on an ID register test
for the PMU version field being at least 3), but we don't
currently do that for the existing PMU registers, which we
just add regardless for v7 CPUs. So I think we should
consider that a separate cleanup, and this is OK.

I've applied this to target-arm.next (with an expansion
of the commit message to note some of the above).

thanks
-- PMM
