Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A95CAC5B5
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 00:14:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1w46-0002GQ-J5; Thu, 25 Sep 2025 20:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w44-0002FA-6Y
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:11:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w3s-0005Ee-H9
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:11:52 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b553412a19bso1231862a12.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 17:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758845500; x=1759450300; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vivjIlgr13Ze+mKb52uWp8aOAE5om3WBoS6OrJZHKBg=;
 b=baszOTmXVnjzRjc8x04DckY/CBOM17NZf8NLOECbjCS01Jd7e0NavT6Buq5ZmzGw5B
 j43ayCGGdXdGCHP3ZYDmEhCLivBdBKfDchTzvK0SLN2rgQ0UPtxhYK0Xri9Rt34/kizR
 dYJuD0HgN0j4tlmyO+3OdsvB71K0ymzY6k3PJiPrp6fULp0OpUsP3E6/79GSTyf0CAgv
 BrGigVfuKbhp38nVQiLPBFQZ1b79r3y1GEvYaeqoCoIXlnPTLke7N2UREESRIn0WZ89T
 XKk/jgEkYmkFDey6GzOMlIRPw8O9yAtlbVNq8IQ4KDpbtx78pTdyN3alJsZgSgNwU4ec
 GsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758845500; x=1759450300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vivjIlgr13Ze+mKb52uWp8aOAE5om3WBoS6OrJZHKBg=;
 b=LmQB3E3OThhrwKcya/EVt5gFKkt+VodOaS32zuZdXuYnTdW/HlRT/TNpRAqutwOfod
 8bMYUQLYnUm8EJxlsUGMX5dGyOOllcBguWUpMhhQ6LYbaW2HskZYeHjvxiNFEzOIWher
 fS0yrPU4iqQe7COY04eEHQBfkg0P2RyFqoV5ojWdpPnp/eFb0EdmIeNyjUNkPvgIAnZr
 RMYtYYyYdK4QtYZPKvhV/ifoOxwcKS1SDKyNNzB2Ff6158E3yUUfnnOA+d6T3kieBfPw
 ex/wY7BefJ8TD3TUs/GmwQpjRX0BLeXPBWswQXjww5oysi2mnoTdel6nc+PsHk05GbQH
 hx1A==
X-Gm-Message-State: AOJu0Yzjdj5aUH9cLfYV4uWMVhorLVmJfXJhmcJimUdogtcYSS3KdFQR
 HsIFS0crIAfWQzQeKZzZ0LdQK/Lx+ZzkOAn8snuQRCGvTub5x0O2FtO/nqg8VHEJ58lQ9Cy+Qfs
 fddsf
X-Gm-Gg: ASbGncv+EoqFe6GO3tJkoGrk7cq6kE0WU+YUOtxb16c3Pr5M8vB2RxG78hV7FM8Bh41
 fNwNkt0RtRYuAzufukeU5l9kL5utGmWR7PfsvF7C9CPWGfHRildrmFwAtgDvpaJTb/700/umn5g
 ov/Nxu4mtqMxUpR9TH7nlMg9Tw0qkpOOwsNp1qs+RdFjk969NoDi7guGwrL+AqZ8B5mClOKqZ7J
 +7kRX5nH6YyT/EmcL7baVaG3thvOCmHhDNECxB8lpoXQh9upK2JlrhEdN5iCZTsSqRyweQtd/yB
 bjlNNIQf0pOeqAlTUKcc4Vc6gSo7MW+jXrQTHRKbXUQKGO+rZktrkmZpPghFeM2T7oCZkvSizqh
 ACoLeWfRqj38y0OxoEsGyPLXe0Vt7
X-Google-Smtp-Source: AGHT+IGH/3kdWmq2FYwlpP7OGirtprHW2mLA5VoswuNNwSUMWqomVuOkrEJWhp0+IM6eLHSu3D1jWA==
X-Received: by 2002:a17:902:e54b:b0:26d:e984:8157 with SMTP id
 d9443c01a7336-27ed4a08e9emr47184165ad.8.1758845500094; 
 Thu, 25 Sep 2025 17:11:40 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac37efsm35829425ad.137.2025.09.25.17.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 17:11:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/10] target/arm: Implement GPT_NonSecureOnly
Date: Thu, 25 Sep 2025 17:11:30 -0700
Message-ID: <20250926001134.295547-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926001134.295547-1-richard.henderson@linaro.org>
References: <20250926001134.295547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
 target/arm/ptw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3df5d4da12..56a3cd8fa0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -318,6 +318,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
                                      ARMSecuritySpace pspace,
+                                     ARMSecuritySpace ss,
                                      ARMMMUFaultInfo *fi)
 {
     MemTxAttrs attrs = {
@@ -490,6 +491,13 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
             return true;
         }
         break;
+    case 0b1101: /* non-secure only */
+        /* aa64_rme_gpc2 was checked in gpccr_write */
+        if (FIELD_EX64(gpccr, GPCCR, NSO)) {
+            return (pspace == ARMSS_NonSecure &&
+                    (ss == ARMSS_NonSecure || ss == ARMSS_Root));
+        }
+        goto fault_walk;
     default:
         goto fault_walk; /* reserved */
     }
@@ -3553,7 +3561,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
         return true;
     }
     if (!granule_protection_check(env, result->f.phys_addr,
-                                  result->f.attrs.space, fi)) {
+                                  result->f.attrs.space, ptw->in_space, fi)) {
         fi->type = ARMFault_GPCFOnOutput;
         return true;
     }
-- 
2.43.0


