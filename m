Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1310556lfj;
        Thu, 5 May 2022 12:36:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ/0R2sJqEPBxSxRyySAj2SzcZTZ6XrBxSoT75mhAULG0NyvV+iMHI+Jd0zchAHL34iYoF
X-Received: by 2002:a05:620a:981:b0:69f:f2b6:e4b1 with SMTP id x1-20020a05620a098100b0069ff2b6e4b1mr13219922qkx.426.1651779374673;
        Thu, 05 May 2022 12:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651779374; cv=none;
        d=google.com; s=arc-20160816;
        b=c6LxaF7JuPj10kh/k+8hbVO9Q1aTZJuD7COELL13ShwIvaz6KhbU1SOooCmJQ+BLez
         PEHqKjOWQmmEjuGNreUQwiBmi133j2dCD1Dn6JAJRF0I+ckhdkHYHDkNONvWI+ofejRB
         EkRXY+hpc1/vSxoVv7z8b5yWw5on8fWcik2emOu+tOmbbFh9VfsRICL3NK2+O3e6vuvF
         pf9pSnYD8fj9LMiLooxR6k0hWgY8bQT8MqwKgn9KeLq1xCbddKKdi+8QH9XB2GpK5UQ6
         S9SM/B0Bj0xYb4ZKqRDkPLmHcc1rsyPVcXuHuumdXI0JKu9WKzZzaSQk2rMMOaV569jc
         TIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
        b=jE8kP8ZiFYz0Kut0IdBFMiUJdLhS4WE9iTR8WeWxo4pQz1GiuDhQshE+3EV7pkY9IP
         064AEMGb0fej70aUFVXPYxFkdMP6scnOcAI1W+BrOMKsQdC0hAcsrLQACfl86IdXRnfA
         jaUA5pws8b9d+eJei0qm4rFgbNE5YTSD+/jnMaouIKwAcIvhT6PqauQXTCBbDB297IPX
         wvBFm7JOZ6LdM7H2awzO9WwCUAxp57A1tBEUbUWb4FJJca7u54OOYLaTcRiEmLozxi5y
         oas53ZcvRV00C06IFHbWlMc4Nn0m/M7BbP4liz4IMqVi4Iyvq5/iCSfZ/vaXh0UuI9+B
         PmbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JV1nr+9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a0562141d2900b004563dfe9eedsi1652469qvd.190.2022.05.05.12.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JV1nr+9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmhGo-0006S8-6D
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYl-0003Ep-5K
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:43 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:36673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYi-0004aN-G8
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:42 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so3521012oty.3
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=JV1nr+9Alv23LjDksJM/oDNw/xp44i5ghLG1RdRQq63bl7PAN1kUiO+j2+MAB4T8KK
 c1eAl3/GOaBt/z2v92XJ56IGMp48Q7q8tQMp7+Xo1nW5ok2JG6W46m1MYxx7K3W9Y+2z
 DBRtLmMFuil6Y8sfo/uZZlXKjT0YHni6QYMTP2H0WmWaLG6ORKggsMb1E8P83DLZQg42
 27UXecI+IQ2/2Y5X6x/Ft624ARqzZmol0vHShozUpgiH/mKD3Yaq4zn+5r+GIvswkcEt
 Sc9gucDGUuJlTYdbxRXvf1JMbj3jqiI9ACFTgpS+qtEFSwX80EqohnPLa1s/0kKq2tV5
 B7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=MZH6OEV7FSLCnEvddzwxbRatsOwNT0pXKE4x+idj8oz8C352yYfUrpx1zoWqyPYsNe
 JyKEB3zRCncGWds5t0j+EL9aStSWIOybG+FjJ7/xlrae2jqPYyJEgEHoWBDc6w7rARBW
 1ZHPMBMGmYW1oQMDEkxSBdlv4LP3rvQ6skzFM/dbaC9aqH2dYylquCqGBrHVuktGkTaw
 kLymBESZwNglMPQBBM4KHkSWo3DUXDrhEUhpBrpH5t2OOkivysEo60bWeFUjlu/dUcy0
 LI5+O786syCVzXrp6thyl7jTpDX0Dg5ca2eK7xB76BSyLhl7AMUf6HvMRaQ42hGnGmk/
 nOgg==
X-Gm-Message-State: AOAM531aW423w6wgxGfYZr1PmE/2eVp1qjv7JQgamprr829T6XNOwmgZ
 4K//o8/zOWJ9b38+sc05fsZvKg==
X-Received: by 2002:a05:6830:448:b0:606:35a:55f9 with SMTP id
 d8-20020a056830044800b00606035a55f9mr9742850otc.84.1651776639349; 
 Thu, 05 May 2022 11:50:39 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 21/24] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Thu,  5 May 2022 13:50:03 -0500
Message-Id: <20220505185006.200555-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
X-TUID: ywt2zJOt21JY

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 9765ee3eaf..48522b8e1c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -16,6 +16,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 07b44a62be..40f77defb5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 762b961707..ea4eccddc3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -74,6 +74,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.34.1

