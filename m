Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1245614eja;
        Fri, 1 Mar 2024 10:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4G7JYMtP2fKDIViAMOdvhqnSksR4C5GfRt98ffVCGU5o347YvPlyQspOSQYJuHFNMzlx/gBUAhLq9A71N4CTrgJZu5NU1
X-Google-Smtp-Source: AGHT+IHNt2jWV9VnnHY839czX/EolidPHheKra5nJ9lxZAK3eQOzXOcLRPys+yOEEDztZIfMVibi
X-Received: by 2002:a05:620a:a1b:b0:785:a968:8c5c with SMTP id i27-20020a05620a0a1b00b00785a9688c5cmr2084912qka.67.1709318010634;
        Fri, 01 Mar 2024 10:33:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709318010; cv=none;
        d=google.com; s=arc-20160816;
        b=s9wa0dYbVDoClIoRqQ9EKp2zd1DhUAhObaOfL4En/0fR3l66d/YTXkWV8nwmgO3j4N
         RKUWP6/PMpt487R+JTZuVcaAf3nSiFrnt8+SrY5e9IAFZkJ1c+ynarP9tlr14kDd4+Ix
         ASIag3ERaG8Se7UjZhLL4aD0MX/CLKqnuk/ye6r068ewZJrrChXRsjJ9F4/0DwfblXsE
         aJlE4IbXqLhwE3Ul/2yduG/5Qm0rrg6Hv0IR9tQoSZX3m2IPxB8iTZMGKuCGxamageMf
         CaiCw2mZRu1ifEz/m3mm5UMkTvjsskvvFkAh9mo4/DGbk5xvCXVAcfWSEaqAvl8DONvy
         iEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p+dys/cioNoZhTZtInFG+2Of2YnqX5s/i4q/n08XiVo=;
        fh=x4yV6W++5EDM2T8pvDWfrYghCgb7XqbEnMjseNXnlds=;
        b=uRD0WWj7KCL5tBBQ+OsVfy1XLdAsRfeGSboQz0WLEvg89E8BQPFimpXqZbI6UGbSH5
         SOvBv6bdHPd/I3r3JtQfpK9ej7bX1rhsjGwAEWih9NqgSOri4LUpTCLmrD7Uy4KyPDbX
         8citTl2iSanQII5OjlW9+HTNiBBv5Y5H/1AlbymYgPnuBr6TZeBJSmDcNBYF2wJmO87D
         67/SH0IXY9XUMt5Cn8jT10PYLrkBUEJO0PaEECWjHZRVvWY4+CApyVnUJwFMCjX6Gjcq
         DTGMsBB7uM2k6vhhBJS1fL3a9wnGW8J3oMiVB/Q9xf636Pt1ZJho0XAuML2RJOhVFvW9
         Zuow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d7bfaO/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm37-20020a05620a19a500b0078787ecc201si4619176qkb.778.2024.03.01.10.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 10:33:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d7bfaO/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg7gU-0006VL-Pc; Fri, 01 Mar 2024 13:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gN-0006QV-PN
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:31 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gJ-0008Lv-IU
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:30 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512b700c8ebso2580389e87.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 10:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709317945; x=1709922745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+dys/cioNoZhTZtInFG+2Of2YnqX5s/i4q/n08XiVo=;
 b=d7bfaO/DwNC7mpCcQBZFHIioi6hZ4fuHU68ZIioIddceV5UNwRCcjUNjGSivrYO5Ss
 9VAr33G5Vi2/379arO4gW6q1AFHpmRWAK1hAMSONhxQ2tNMHOWvQqGv5lP9zvqYW3E+0
 q2tPJLFyl5mhvZuzyp+cM0WDJgCxqvCwUjnmu8WnnQLvHhxkesKIzGDJH/gSoI3j7IK1
 6pDDG/4mIxDOtv7dFqskZl6RYVTBT0o7cH6x5eZG1rfg2B4ovcKZz4KpHUG5yH5V3DMM
 HUeyq9/oVl9WRP1WpPwt20F9oKT/R+AMir7ldFogE2esXsIYPb01nEKX4nJIj9YXByxn
 yqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709317945; x=1709922745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+dys/cioNoZhTZtInFG+2Of2YnqX5s/i4q/n08XiVo=;
 b=Su2g8f8ce1BZDmVfaqRHRQ49w8gH6jQs4EWR8DROFPbLld9MPpbT8hz0hDaaDHL3Zw
 6PoAOxBeRj2K32SXwMtGEo458ZF6GgZ5Jg1nrIDN7DmCU8qCEKbdRRFiP3eGwUYI+Qg1
 jlJmPwt7Z2oDhAMzGpVKdp1490po3gOOHwdwBzNKnQVRiJFlK1BUW9KYpEDDzWxTkSel
 +VVY+YfRhfnytZ30RXo2EeolVmdqUe7sCp66aIAAP39tie94hkmhRNHca5OS/rOqgM42
 JVV1oRXzWvxAedbNJbm2XNE2KRCntZYGamw51WejkXHH8Coj97HxF30DICChGjVjX3/v
 n/ZA==
X-Gm-Message-State: AOJu0Yyp0VM7s8pKqUll8R+2bjvQSe3DpDadk2DK2iMbFhiBbJHE7bZQ
 2NYk3ABNWmiHwWPt6NeHNkT5Ny4zH4qetO9wJyOXDWHU4ISi8LFBFN0sve5b63KFe+efLS5XQiz
 8
X-Received: by 2002:ac2:5e24:0:b0:513:2010:6d93 with SMTP id
 o4-20020ac25e24000000b0051320106d93mr1762866lfg.56.1709317944962; 
 Fri, 01 Mar 2024 10:32:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfeb42000000b0033b483d1abcsm5158934wrn.53.2024.03.01.10.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:32:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 8/8] target/arm: Enable FEAT_ECV for 'max' CPU
Date: Fri,  1 Mar 2024 18:32:19 +0000
Message-Id: <20240301183219.2424889-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301183219.2424889-1-peter.maydell@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
X-TUID: gYP/X4Eaj+QZ

Enable all FEAT_ECV features on the 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f67aea2d836..2a7bbb82dc4 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -28,6 +28,7 @@ the following architecture extensions:
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
 - FEAT_E0PD (Preventing EL0 access to halves of address maps)
+- FEAT_ECV (Enhanced Counter Virtualization)
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 5fba2c0f040..9f7a9f3d2cc 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1184,6 +1184,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
+    t = FIELD_DP64(t, ID_AA64MMFR0, ECV, 2);       /* FEAT_ECV */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.34.1

