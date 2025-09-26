Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CA6CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 00:14:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1w4t-0002WY-NW; Thu, 25 Sep 2025 20:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w4c-0002Qe-0W
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:31 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w40-0005Ec-CP
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:26 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2570bf6058aso22809115ad.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 17:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758845501; x=1759450301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qDnKsSaswSY9Uz2CP7z+gEIsVNNGoF8/gWfXHJioIQ=;
 b=UcbNyaovhvPhrm82K6gk/BCbqxiD7TAFFF6pNChrc64yPouHGBCoYRIL4wVZmolqJ1
 VpLIsoSk+ym5cyT6lmg0D5Ye1BMVzCn8vz0nh+K7EtjsB+mjepodbYgkgy43m6+8A6jK
 9vjfgfDi07Q1ok5WkTa3+5gmXEaNAT1r0vGt2jZk2vVYEjZZQbH2ELpI73r6Qc/bYGa8
 IOM9j+1iR/GJ2WL6vGG2jqXwpinLibsVaKJsw4SMTMciAidjLE2gc+Zx2MvJF/m0RBWB
 cqG/OJP/1I/FdEAG5dg2XVwv+LzVhERzIGjqrBBrg6z6TGMHPbZbfaHahieTz9SfKLeI
 598A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758845501; x=1759450301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qDnKsSaswSY9Uz2CP7z+gEIsVNNGoF8/gWfXHJioIQ=;
 b=GME/zMSO0NHew74JYsi1IqHKKSB2g0fpIEvSP2ULzd4x8BFVPk3tDV7R9RQ1sWJYD/
 YEt9BcsN5BeYtUWoRKTA5/ANNE8ihVBKiemByfD4Ni6DAGswhXMVo0b6IUKeL7iYgxpU
 1/HJpSfknn57yw7lxBNEEP82Hq4APt5s+8vyIjVub5sUQKkj6Q1h6SxHESXbRlbwK2dP
 cWUuKW9Ww5o/cBTroH8Jzz0yg8pTD1Jql4eCieont26AaRb++vZHxkEPIIXfGo9VZtYJ
 qRj8I5/PSt/eJmQe/reFkbpkslSV071BUD3y6iCJqp/ud0xnQErGUAnfOrpjMNdhOQGl
 I8OA==
X-Gm-Message-State: AOJu0YwTIX/6qY81+RZA+1ed6l825SeuOa8eKIOzxYxLO6IJi8jvWnTX
 kJgQFRzRgxSmDXivJ6dB2ncNxi5fvMAwJClHNJrdkvnCmWTUZyFGxLpKj6qoyyc3jDfH66BOkJL
 xC9FY
X-Gm-Gg: ASbGnctgjgCWcXWqUGA+wdTV7t9smpA7k1lBH32IYwnv/cMqXSjSZfzfxfHLHyhGaLA
 izQ1JoO/txfV8IJMVVEzl9KuwcWKs5GFJvreVZ0aPYwJ86KEb0qxvN4jGWgNmF+WJzRUDvjWMaf
 OztXmim/gKENCGDMBm+7xzaRkwYn7cE6omn8lZbzphF+l7InWu/QIZSvf11kjNw+6Qa8Ak3h5Oj
 qkZyQCcGc3sRIWqpI27GoS8nriLLXS9BcBxQOKxas7HE2tLEL7tA6dXdTz9RGq6nZXKO9A0Dd4p
 xOcUcL5JnSbJaDPekqCiTrMOTBbzjbuKPOPiAoHSSaoRsd1uSBXyOxcsUvLAGTC6jZ7G8UqwkMP
 Zfiy5wYuUuHPQW+eGcfRTW83Rr8Om
X-Google-Smtp-Source: AGHT+IEGo8UYQVKhFIHiqS8Y/vZCvy+mA+2Qi0b2KKoAd/ZMM/9xKj91Q4FtSrwtKpjOJE6wxOYMPQ==
X-Received: by 2002:a17:903:3d0e:b0:277:3488:787e with SMTP id
 d9443c01a7336-27ed49b85d6mr54700085ad.12.1758845500948; 
 Thu, 25 Sep 2025 17:11:40 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac37efsm35829425ad.137.2025.09.25.17.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 17:11:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/10] target/arm: Implement SPAD, NSPAD, RLPAD
Date: Thu, 25 Sep 2025 17:11:31 -0700
Message-ID: <20250926001134.295547-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926001134.295547-1-richard.henderson@linaro.org>
References: <20250926001134.295547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

These bits disable all access to a particular address space.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 56a3cd8fa0..36917be83e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -387,7 +387,25 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     l0gptsz = 30 + FIELD_EX64(gpccr, GPCCR, L0GPTSZ);
 
     /*
-     * GPC Priority 2: Secure, Realm or Root address exceeds PPS.
+     * GPC Priority 2: Access to Secure, NonSecure or Realm is prevented
+     * by one of the GPCCR_EL3 address space disable bits (R_TCWMD).
+     * All of these bits are checked vs aa64_rme_gpc2 in gpccr_write.
+     */
+    {
+        static const uint8_t disable_masks[4] = {
+            [ARMSS_Secure] = R_GPCCR_SPAD_MASK,
+            [ARMSS_NonSecure] = R_GPCCR_NSPAD_MASK,
+            [ARMSS_Root] = 0,
+            [ARMSS_Realm] = R_GPCCR_RLPAD_MASK,
+        };
+
+        if (gpccr & disable_masks[pspace]) {
+            goto fault_fail;
+        }
+    }
+
+    /*
+     * GPC Priority 3: Secure, Realm or Root address exceeds PPS.
      * R_CPDSB: A NonSecure physical address input exceeding PPS
      * does not experience any fault.
      */
@@ -398,7 +416,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
         goto fault_size;
     }
 
-    /* GPC Priority 3: the base address of GPTBR_EL3 exceeds PPS. */
+    /* GPC Priority 4: the base address of GPTBR_EL3 exceeds PPS. */
     tableaddr = env->cp15.gptbr_el3 << 12;
     if (tableaddr & ~pps_mask) {
         goto fault_size;
@@ -502,6 +520,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
         goto fault_walk; /* reserved */
     }
 
+ fault_fail:
     fi->gpcf = GPCF_Fail;
     goto fault_common;
  fault_eabt:
-- 
2.43.0


