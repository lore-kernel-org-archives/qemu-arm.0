Received: by 2002:a05:7022:1119:b0:6e:5a56:ff6c with SMTP id ou25csp1635560dlb;
        Mon, 30 Oct 2023 10:41:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErhgd5/E/4CYkzgKzlpfkB6y/n5+LlndTR1uLe1gkcBhqTWIWO7A4WaJPD2OENmMS8T+aO
X-Received: by 2002:a05:620a:2486:b0:775:c335:1ee8 with SMTP id i6-20020a05620a248600b00775c3351ee8mr10710404qkn.54.1698687666297;
        Mon, 30 Oct 2023 10:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698687666; cv=none;
        d=google.com; s=arc-20160816;
        b=KRexE/xQqQOF23d2hg9oeez4Rr82PNTsUX4EKUnusmTaLFz3UOp2iKpck2eYfXJCjH
         nWV8Y4edQ57r1iKWUG3EOGdVpXwSpkgLE79KLoMYIeDXKq/Lyc2Kkr8ihk/un+PFAsUl
         mDByode5RQqst9mCFjWoTg8Dig0EHMgjIw52M8jW/zE4+w3PSmjbpC05YZJvNPF723qG
         LTAHcHutNTs5jjFiEQSC5eIJSWSlV7mFZbMN803HHGkHe5KkoTfhjZUVRwaGg2yU5xQq
         0x0qc4igsx9Bww/Mksaj3xTCmdo12KkHYRpqr2Mo3bumg6NgSPTV0Oc2DuMTrkYLJcMK
         sbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8ZNFOWWtLsTPgYHbvU45OdcAlg5gVb5D/Mp59sG/PFg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=vb2vKQoFgU/zFqBdAZwvx+ShZQCpMeXg8Y61nM4lph3Yh3sA73e13DrQXaOA84WdXU
         5VihCfLyRG3Yfi9GiwTK+49qQGEIsIYYItHbLLvLbVQ9r4z7m1PZM7ShmB+IdiN4w/c4
         bVW0K4BXd0v7ssYvAdXRWNUv2G90MRZQY/7XKDIlxQhW6NK9IgQAcAzcJLivTWrjrmfg
         Wnzst244dEW+YSA+CaBonE8rkyKJ4y6JUAmRToJhQRfXxdrX76/bU36MN5BD45UuhIjg
         NX5miPm0UuN8DYFA/DCixc9gpzgTuPGP1R8i3e5jCNlmEzgadjP7Ic1IVnNwUR8CVunN
         hkTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=muzNiCZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21-20020a05620a16d500b007788bb3ee9esi5843527qkn.554.2023.10.30.10.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 10:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=muzNiCZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxWFL-0000YC-VN; Mon, 30 Oct 2023 13:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxWFG-0000Vs-Pg
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 13:40:10 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxWFC-0000Hb-FI
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 13:40:10 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5079f9675c6so7206785e87.2
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 10:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698687604; x=1699292404; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8ZNFOWWtLsTPgYHbvU45OdcAlg5gVb5D/Mp59sG/PFg=;
 b=muzNiCZkS2WfLPy85aW9hChSkUPZAxwYTwP9H6LfSCzjbX5B9Df6DDu20MricDr3ex
 Sf1zbU94sSjQX6bPKMwvTZqO+wO0XIgMOHUcjEPbHhfiaMT7Ok2Kgb6G5SIllzbQDdxh
 D3cfn/iZ1PS5ulnS/Y0nZMKYZvw6p7pp2Drlt8TCq8aKeP6I3FLUodvsef91fvnznvt8
 +2Nb9ER/x6Ij+7zBOi1SaO7h8HkNBDoGsxkf9MwQhgcMQL3hNR4C1osSFIOxjQt6+kFQ
 /VHLYb6PKWR4gAU2ro4pr+8isls/IgUcgoSGNR6tJhC4aFR9kx6KKvbGHw19W0OGccEv
 gAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698687604; x=1699292404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ZNFOWWtLsTPgYHbvU45OdcAlg5gVb5D/Mp59sG/PFg=;
 b=r2r2/tpUGeARhx7dwbiELVElg4IEavu3AZRneNiWjJWsbJ/pqznA7VQmyqacg72KwV
 NIInh3CqCebrRhaZb2z4XGtZsl7wl0jinjP7b60nF0002g2HWB8NJhQxpOyK7cgvXjME
 0z6pkCFEhoKY3nz4enlddI11a60ZLTlul//yY7a+cmZ6c32IlLIjC3ugVj37u+8nR7un
 yiFPqLks8TVg58tSwo4oYR8y4lMkSx/W8g7CfnBzYtQJeypF6HyVUYjSmb8HYX93biIb
 eOfOYXquLxq/tOQ0xIiI4tk2N0sK4RK3hKWklU3DtW1NFWdoeCBEunS6+jP4V/3FVn/d
 5Z9g==
X-Gm-Message-State: AOJu0YysT5KFF0tSVZwfBW99tGoW9734b3AtVcMPSElMk2HSVkR9K3NC
 JNEItJdOlMAbIaDCh1ELgolvtJgec14NiGFaxOo=
X-Received: by 2002:ac2:44a9:0:b0:507:ba75:b016 with SMTP id
 c9-20020ac244a9000000b00507ba75b016mr7968685lfm.3.1698687604413; 
 Mon, 30 Oct 2023 10:40:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b0032f7d1e2c7csm5912914wri.95.2023.10.30.10.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 10:40:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-user: Report AArch64 hwcap2 fields above bit 31
Date: Mon, 30 Oct 2023 17:39:59 +0000
Message-Id: <20231030174000.3792225-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030174000.3792225-1-peter.maydell@linaro.org>
References: <20231030174000.3792225-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: 2VpFAEAuHbkr

The AArch64 ELF hwcap2 field is 64 bits, but our get_elf_hwcap2()
works with uint32_t, so it accidentally fails to report any hwcaps
over bit 31.  Use uint64_t here.

The Arm hwcap2 is only 32 bits (because the ELF format makes these
fields be the size of "long" in the ABI), but since it shares the
prototype declaration for get_elf_hwcap2() it is easier to also
expand it to 64 bits.

The only hwcap fields we implement already that are affected by this
are the HBC and MOPS ones, neither of which were implemented in a
previous release, so this doesn't need backporting to older stable
branches.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/loader.h  | 2 +-
 linux-user/elfload.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/loader.h b/linux-user/loader.h
index 324e5c872af..9be00da40a4 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -61,7 +61,7 @@ uint32_t get_elf_hwcap(void);
 const char *elf_hwcap_str(uint32_t bit);
 #endif
 #if defined(TARGET_AARCH64) || defined(TARGET_ARM)
-uint32_t get_elf_hwcap2(void);
+uint64_t get_elf_hwcap2(void);
 const char *elf_hwcap2_str(uint32_t bit);
 #endif
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 2e3809f03c4..6fb44206fab 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -520,10 +520,10 @@ uint32_t get_elf_hwcap(void)
     return hwcaps;
 }
 
-uint32_t get_elf_hwcap2(void)
+uint64_t get_elf_hwcap2(void)
 {
     ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
+    uint64_t hwcaps = 0;
 
     GET_FEATURE_ID(aa32_aes, ARM_HWCAP2_ARM_AES);
     GET_FEATURE_ID(aa32_pmull, ARM_HWCAP2_ARM_PMULL);
@@ -784,10 +784,10 @@ uint32_t get_elf_hwcap(void)
     return hwcaps;
 }
 
-uint32_t get_elf_hwcap2(void)
+uint64_t get_elf_hwcap2(void)
 {
     ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
+    uint64_t hwcaps = 0;
 
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
     GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
-- 
2.34.1

