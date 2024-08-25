Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp664330njb;
        Sat, 24 Aug 2024 20:47:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAgSBgjAnB1A+r8zEBDUZN94FeTOJc7SQ/Nvr6nwwznjIl+jet2orNHFcFJYOlt9ld9bsdDtcw1ZxbqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE8yuQFQzEHAQPkjH/0r+7kCXEI6HvK/vERzWJAW1Y2CvTuiEqjSSlPDzIAo5NV5P9mDLQb
X-Received: by 2002:ac8:5785:0:b0:44f:e11c:b0d8 with SMTP id d75a77b69052e-454fae47b67mr196384701cf.7.1724557671597;
        Sat, 24 Aug 2024 20:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724557671; cv=none;
        d=google.com; s=arc-20160816;
        b=gBhRev9lytonz+nob91MspR5/dCrv6Y86nZndDOZs4mRirjQQMOumT/QUSYBmL8Zuo
         L/oTlLn41abKzoWqLhaJtOTyHnl8D2bNGorucXDcc1IzEK3rx0ZuYGSeUwV/eTNhWB5S
         HRPWS2L9D9wqQDkZuIzqPhCaT6z9Rt3GYDfBGTXwneP6RzIyw/EWiJ1ioWrB+3DtDhdG
         m1NjfoH32HcGlnCwUapd0ujzJ1OLsh+pTuIuHdtVWC3Rt+SL40KkGN+7NnewF23RYRH1
         yaWfRzmvG7nXjNg+XkOXbWeLaMftYJC03Yeh8hML43ncEArd4lBypKK6tGC1xwow7U8M
         ZhPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=99v5quJs4YQKEqNZ/sX88krhzDH2F2vxQorkrJZwTuU=;
        fh=t/ePWZS7+gvxmbqJjM6W5t9eMedphpgYrU0k8cXvyGY=;
        b=YRIWJkJrFkN3Zpp4RULpHmD762uDaU74xmvHB4pvzAUEKe5sNew7O/5eMaxBQFFh2X
         lfqkpVQItVboHRBTNHFNyaMJYFMW/G2QcH9VUnLLyVpIEiCg0Q4RF2U+SBkicXjInWRx
         mj2t6n9oia28dbgzl3RkvI3XeDAPz/TMVj5+wY/LzmFJGJOJgEs4eQZwPLGrkROiodW6
         qZDO43biQKBPRywcMDDoAEaehcMC7kGD36oy5hhB2d7HWzB74yDw4d85ILeAc01jYGO3
         CiYSHPR1nALAI4XOfbYUMgdc2zvaTGodLyPc454NsvG9wf6aIqYEbGdOMu3b2BMOjQT1
         SePw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RBbLTPSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe1ab468si75081481cf.350.2024.08.24.20.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Aug 2024 20:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RBbLTPSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1si4Dt-0005Op-K2; Sat, 24 Aug 2024 23:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1si4Dr-0005Jc-IO; Sat, 24 Aug 2024 23:47:23 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1si4Dp-0004XU-RO; Sat, 24 Aug 2024 23:47:23 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC6F160B50;
 Sun, 25 Aug 2024 03:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AC9C32782;
 Sun, 25 Aug 2024 03:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724557640;
 bh=lvDSsNqUtQQvopqQkh5pV2gPEmOPZKjex7TqFGENmKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RBbLTPSrrjCJ/ijsVLLoEjz7uWsxO97viqL3e2POmTTrBetZT3S9ONKLweRrHh4zh
 8SgMzAlGpCfuZcoEszdLBdosePC7SBI8zp+aJA8CXhoK3B5HGfZGYMxjI62jYvU3h2
 M0mSqSM50ZXXwQiaCqIIuaPemAOkgKhmOzRWisxoSHU1qwYn7KBAGyXeCAkyJ/en5q
 se1WPLOel2VgFwOzbV81xILoSP/bLIzyw3VGNfVxKaazU6HfzpipC7TEsFVXWKmDSH
 g6z6Dbhs3suTjYx935PkEBJ18PfSERH+9JQIuFaJVbe0nD/tW1fdCEJ3E/a9Yngmzh
 +xIgBP50RPKgg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab@kernel.org>) id 1si4Ch-00000001RMg-2Qod;
 Sun, 25 Aug 2024 05:46:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v9 04/12] acpi/ghes: better name GHES memory error function
Date: Sun, 25 Aug 2024 05:45:59 +0200
Message-ID: <ceb8b8f3537cf9f125fbdc86659bae25fdb34e3b.1724556967.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724556967.git.mchehab+huawei@kernel.org>
References: <cover.1724556967.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: BR5yEFTuhA1d

The current function used to generate GHES data is specific for
memory errors. Give a better name for it, as we now have a generic
function as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes-stub.c    | 2 +-
 hw/acpi/ghes.c         | 2 +-
 include/hw/acpi/ghes.h | 4 ++--
 target/arm/kvm.c       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index c315de1802d6..dd41b3fd91df 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(uint8_t source_id, uint64_t physical_address)
 {
     return -1;
 }
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 3190eb954de4..10ed9c0614ff 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -494,7 +494,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     cpu_physical_memory_write(cper_addr, cper, len);
 }
 
-int acpi_ghes_record_errors(int source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(int source_id, uint64_t physical_address)
 {
     /* Memory Error Section Type */
     const uint8_t guid[] =
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 4b5af86ec077..be53b7c53c91 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -70,7 +70,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(int source_id,
+int acpi_ghes_memory_errors(int source_id,
                             uint64_t error_physical_addr);
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp);
@@ -79,7 +79,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
  * acpi_ghes_present: Report whether ACPI GHES table is present
  *
  * Returns: true if the system has an ACPI GHES table and it is
- * safe to call acpi_ghes_record_errors() to record a memory error.
+ * safe to call acpi_ghes_memory_errors() to record a memory error.
  */
 bool acpi_ghes_present(void);
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8c4c8263b85a..8e63e9a59a5e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2373,7 +2373,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_record_errors(ARM_ACPI_HEST_SRC_ID_SEA,
+                if (!acpi_ghes_memory_errors(ARM_ACPI_HEST_SRC_ID_SEA,
                                              paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {
-- 
2.46.0

