Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E61CAC598
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:25:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWcQ-0007bK-IA; Tue, 16 Sep 2025 10:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWad-00061S-JK
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:27 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaT-0008NS-TK
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2445806df50so44611055ad.1
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032582; x=1758637382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFvrkXppk9qW3dQaIUV7du/mSWSAFGQyLCbJPSszGi0=;
 b=ohax2Rt6HfKUrn8WG4X3m38AO+JFqe5yl2w6a016T+LDQ7oTZ6PTu360TzBrwqRXZG
 cgiynJHsVeco8jWrXs1g9dvf0o3j13E5jm5hlXXva9dK2TR5LYEHHYdW4FmkxtgaiKVd
 oR1W7tZzRj7H6xW9rp1UTEylSSXZDrBZSCmfIkA0NUggSEy05pPtqEwRHqOnagKiNSXa
 jp/dbrR/NF8IkWZz8N291g3iNmx/C/cLHbM/QwGbI5sFPM0/IFH6uFJXizA5SLAdDR3E
 89a+006JKVcCsAnr/k1tp/vFa9NrzcBShJFeAeRcqA6A9EsOfvB3K31DakrNUNjaCe4x
 Owtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032582; x=1758637382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iFvrkXppk9qW3dQaIUV7du/mSWSAFGQyLCbJPSszGi0=;
 b=YxiIHpeIO0HFiE6PhnOB6HU36WlaKJ4OTxhmeVJ0jVXtUPVeMegZjN2CM2dUBPo3ze
 hFa0dvhzmkp+fPIk3wNNtgBXKxL9YRoGvQnsBJ47EEtWtAXOR7nqeJolvczJh3elvT3w
 pKjvlTyiA3cHcB53eQ42pYopkdD0J8A822tAIC412kNS551lA6Pax5tR9e+qK78FjqtD
 488cnriXxWUWPUSmtVn5LmktNRDGaXRmfe2wqGVdWTEDPGl7PgcslWHaKNN6+0BVzzvG
 H3wZHaNVmSoKKW2NnQRz4c+7FR4UmGww+l1TN3hscvoiu0AR++YEBnxJHux2ktuBGJrV
 1I1w==
X-Gm-Message-State: AOJu0YwGhh4TO1jIPIDxyXgSGxqtFP+mWU8RoNEUwHkwJxEzhZZU+Ip6
 ukCzmy06ZgcLfAAseKFCGGGk9hWBFKfCAE8EzTaDGvuau9FzLPrbXXdeUoRUREp3mD0K7x+nvds
 SzylG
X-Gm-Gg: ASbGncvttX3K17nFG9qyIFGaT5xAjQLnwLTUlwwDTDwtyY4m9i75T/LKbw073HSCLCQ
 NTIwYgi8gdf7TukE3KO3yhUP/+5njVU6X+z6lLYXYnVttYJ98mDzK279Oi8z1PqV79bNgHCPoMh
 OruQG9z0t9p4GNgYqVpmbv6b95Qe3lhHYmZQ+Ha/igfNcFAoAb/AFV/CEXTl8YKULSe7566d4Ea
 YQ1QLwzBUPwSPcvaa7NQ7dX1k/bxed9/snWra8PcnFRc3hZjkqfvWqKmzlmh0g/4Lt0coKtNpsA
 QPhU5lyk3eI8yevN3ie7/ZNcgs2y7CkmnjD4sG1LfTM5NwlVfKmoWQi7o6DN1od5SRxeEuGNsDO
 vhrtx9ISlP3kA4Utw80PZhWzQe+NM
X-Google-Smtp-Source: AGHT+IETPo01soMbT7PfDX618eaXGP3wwZ6+IeqFVDMBk3dznVd9SPlYZYu/Vk+THaw6tnB/li8UvA==
X-Received: by 2002:a17:903:8c3:b0:260:c48c:3fba with SMTP id
 d9443c01a7336-260c48c4123mr148767645ad.47.1758032582027; 
 Tue, 16 Sep 2025 07:23:02 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:23:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 28/36] target/arm: Move alias setting for wildcards
Date: Tue, 16 Sep 2025 07:22:29 -0700
Message-ID: <20250916142238.664316-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Move this test from add_cpreg_to_hashtable to
define_one_arm_cp_reg_with_opaque, where we can also
simplify it based on the loop variables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index da3dd073d3..9156cc72ae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7503,20 +7503,12 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, ARMCPRegInfo *r,
     }
 
     /*
-     * By convention, for wildcarded registers only the first
-     * entry is used for migration; the others are marked as
-     * ALIAS so we don't try to transfer the register
-     * multiple times. Special registers (ie NOP/WFI) are
-     * never migratable and not even raw-accessible.
+     * Special registers (ie NOP/WFI) are never migratable and
+     * are not even raw-accessible.
      */
     if (r->type & ARM_CP_SPECIAL_MASK) {
         r->type |= ARM_CP_NO_RAW;
     }
-    if (((r->crm == CP_ANY) && crm != 0) ||
-        ((r->opc1 == CP_ANY) && opc1 != 0) ||
-        ((r->opc2 == CP_ANY) && opc2 != 0)) {
-        r->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
-    }
 
     /*
      * Update fields to match the instantiation, overwiting wildcards
@@ -7819,6 +7811,16 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
                 ARMCPRegInfo *r2 = alloc_cpreg(r, NULL);
                 ARMCPRegInfo *r3;
 
+                /*
+                 * By convention for wildcarded registers, only the first
+                 * entry is used for migration; the others are marked as
+                 * ALIAS so we don't try to transfer the register
+                 * multiple times.
+                 */
+                if (crm != crmmin || opc1 != opc1min || opc2 != opc2min) {
+                    r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
+                }
+
                 switch (r->state) {
                 case ARM_CP_STATE_AA32:
                     add_cpreg_to_hashtable_aa32(cpu, r2, cp, crm, opc1, opc2);
-- 
2.43.0


