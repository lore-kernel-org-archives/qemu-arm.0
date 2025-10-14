Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F45CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:17:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJz-0002ev-5A; Tue, 14 Oct 2025 16:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJi-0002Ly-DU
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:18 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ6-0005NU-4E
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:17 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b6271ea3a6fso3708120a12.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472456; x=1761077256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7hkthyYRuHXN3913QLlPJYPsMb7uOcoCSH2wW9sxo8=;
 b=kHhL/TFd0q3K1gvW3mJBHsZsqHkXDVlPz4jcIKzCVKYEAjK45iX8QqKRKV8Plmd+gV
 LY5Uhu+XRAEBkLrmL8Vp5mkx0O+75Ou879X1qXRox7SpFibuIDsTepktGOHkZRwRKNog
 /I5Rodh6IY0FLffQFTGjMYzLbCM7cNtCqp2av5D7Xcz4xr5KRH/yorplmUUG8FuAPdSM
 8DzmBJyOWkLqw7tf7J9VATgmtAcDpsaffkIFc/f/o18OhY1fjZ+DF1THftBgvVs/NCnl
 9Ic+k9OoLzdsN7n0W0sylG5wvh0UZ/T7wHxi84Qg37rMeW0SwweS90/TNAIAAMtBi+XK
 t/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472456; x=1761077256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m7hkthyYRuHXN3913QLlPJYPsMb7uOcoCSH2wW9sxo8=;
 b=Vw+tUCkv7yzKSqvQcK+c7Yo/WB5m/hVVUNWiPMdbcoUjjfu4BBhYkzIyfMNqojAHhU
 D61XKzQcg/Ql1RjP9LaKloz3Ewoj+lpFdz0tst3QjDaZD5++rvY7sbHhRRsNr84mmZF/
 P2a+ow3N2GF9dBhS5YUzByQ3pHKhTr2DT0SrvKYk5PFpppwxRBs+cgW8rPsc4Psy65F9
 QA7FGcx7oSoxdqqv3KGQAlHZgTlhWuozy4fyD3mHJg3gDraLe2nry2Z1Jce+4ygVCiGV
 T5f5h5WgeCmGsbm6bSji2SqlYRBWad5Gh8pz//pG9jXCPt9xI2hho96HN5sTIj/X6cI7
 +AMQ==
X-Gm-Message-State: AOJu0YzfMaGyhgvKcOQ2csST6C5yYjs6nkQbc6Qou+1Zrf0im9N/duV0
 UHG/faX3ZVzRqKeiBfLt+jh5Vo0Xw1dZYZOofxtYSl7hu4gpB4USYQiv+NqQEZfHisep32QbVmS
 0Bfm5AA0=
X-Gm-Gg: ASbGncvo6jjdJXQvV4u5eeIfoAGLp4kPALIHfwis7fHUHBrbNcDbmRw9du7etBuJVKz
 G6ZL491RU3vwQppxIcSOKR0ZvsiXDMOsk02XaZ0HVWztxIuo8pcHmqshi7SrejmwIdZ8Gq1mQOm
 SZQjMZ883+ge/mETkPuqXh0O0D9lCCVxQ38ra8UiLx70K6rGv4qj9G+qtQucDHNuc6vmtC52hy0
 SiP1VftTNSqaZehmnWOW2uLZQqs5hPLszi0ZXfDqG0uOZThZXO5GfwHeaMx3UgFrbLShYcfbBiu
 5A7EsHSFtKOwM/s2HC7yH+VTE2Zzg0HSVqaSXN5ZTtD2vQtzb9bSewyNYsytUPuv58UsoImazXZ
 KqLrpbLodtmWK0y2ekLpPO/sfPBzyjd40OlkF0A/VLDGT4po0Cj8Kv6bS8pG/Ow==
X-Google-Smtp-Source: AGHT+IGyA0qQWo+PwVYNO70vAG9eQhBXIq9i3+Jzuke4pIfGDXo1cSW2Iqt3Cqn36f79IYA/BEXDgw==
X-Received: by 2002:a17:902:f78c:b0:25c:76f1:b024 with SMTP id
 d9443c01a7336-290272679dbmr313113515ad.25.1760472455626; 
 Tue, 14 Oct 2025 13:07:35 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 23/37] target/arm: Split out flush_if_asid_change
Date: Tue, 14 Oct 2025 13:07:04 -0700
Message-ID: <20251014200718.422022-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 550ba77c5c..c6d290ce7c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2929,6 +2929,17 @@ static void vmsa_tcr_el12_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void flush_if_asid_change(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 uint64_t new, unsigned mask)
+{
+    uint64_t old = raw_read(env, ri);
+
+    /* The ASID or VMID is in bits [63:48]. */
+    if ((old ^ new) >> 48) {
+        tlb_flush_by_mmuidx(env_cpu(env), mask);
+    }
+}
+
 static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -2950,14 +2961,13 @@ static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * TCR_EL2.A1 to know if this is really the TTBRx_EL2 that
      * holds the active ASID, only checking the field that might.
      */
-    if (extract64(raw_read(env, ri) ^ value, 48, 16) &&
-        (arm_hcr_el2_eff(env) & HCR_E2H)) {
-        uint16_t mask = ARMMMUIdxBit_E20_2 |
-                        ARMMMUIdxBit_E20_2_PAN |
-                        ARMMMUIdxBit_E20_2_GCS |
-                        ARMMMUIdxBit_E20_0 |
-                        ARMMMUIdxBit_E20_0_GCS;
-        tlb_flush_by_mmuidx(env_cpu(env), mask);
+    if (arm_hcr_el2_eff(env) & HCR_E2H) {
+        flush_if_asid_change(env, ri, value,
+                             ARMMMUIdxBit_E20_2 |
+                             ARMMMUIdxBit_E20_2_PAN |
+                             ARMMMUIdxBit_E20_2_GCS |
+                             ARMMMUIdxBit_E20_0 |
+                             ARMMMUIdxBit_E20_0_GCS);
     }
     raw_write(env, ri, value);
 }
@@ -2965,16 +2975,11 @@ static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
-
     /*
      * A change in VMID to the stage2 page table (Stage2) invalidates
      * the stage2 and combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
-    if (extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
-        tlb_flush_by_mmuidx(cs, alle1_tlbmask(env));
-    }
+    flush_if_asid_change(env, ri, value, alle1_tlbmask(env));
     raw_write(env, ri, value);
 }
 
-- 
2.43.0


