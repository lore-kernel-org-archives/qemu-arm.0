Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F90FC83030
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 20:58:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYsup-0003XI-1b; Mon, 07 Jul 2025 16:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLH-0005M9-I8
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:36 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLF-0004K6-5Y
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:34 -0400
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7d3dd14a7edso575131185a.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919692; x=1752524492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gH9VNXBEfhinmOk/OsQiqn+Gb4kuwgshVCSdhCST/W4=;
 b=Fx3Pb1xUpX9oPAWqNvu54qHYpi7lpcWr+5pc1ApWZo2ToTIZOXSfIQjCnFBlVKADrP
 wuP01NdCcBQUf+3OkD8ItpVpYbnOWeLzDKDrNfyzpLJ6p9wvErsMfW7jPhU5hNfp69Hn
 cknznoa+03Beh5MtiePLsX2EpgiMzAF2eejbB0DoB7VRGPIz4suPQIBpIz78RIIXvXZv
 f9oGAUCuWiwQ3uwqrVF0BLZ4o8pp/UYDYWypZkh6hnNfGyW0KCmzDzWoTCFsavSxy0DC
 w8tHZVoZXQcgs9gHc8/VpRtv9/57JEHRvwJAAAczhL+jfPbSCptzrlXy+DwSNqm1upE+
 UoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919692; x=1752524492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gH9VNXBEfhinmOk/OsQiqn+Gb4kuwgshVCSdhCST/W4=;
 b=l+HAp07XLkDsI7jsEkksa/H4urUHlO/6dv5KlF0GMwtCm4EmK0vJWDmVoy6t43KBS0
 O/ncZMBsZikYfMZDyuU+Y8h4usQvE5Unbz64CZdJ+/iZe6xgBnul8Rb3n8o4a+NOHJjt
 X/EA4N0CQzR+a1hmBCSKfqGHhnJu4mt0M6u/OCfftYRBjd8HyCE+jGEaOKufmoCZdU/S
 vEl2QKBWkxvbUfMA5Y/x8p9OzFU/MZpYubpRC3ZJx405pyds7upxCxQBAAKAbF4/QyGS
 MC4OAnlKaczp4OTBO5lzpbh2N3WctecqhPSoIg27Po7CIWUBjkatrdIRyHL3blYK715/
 K1bA==
X-Gm-Message-State: AOJu0YyMeVVEKEHcdRs2+q/AR80VnYtmhp4JikHDLpLvhWUFLnWnjKlg
 Mia6TJKxmfaR6bC8KUrexZk/ZEG7cbaqclBpkfiofJU5xukdC2f6yHeCVn7uC+ezsB4=
X-Gm-Gg: ASbGncsmtRo+EFIvnsaUO3WSywuHKCA/ZJnlbwdClu69QCTLj4wINBdqb9K3na3+VjH
 /Rn1TRL1IAOgcP9e7BkG9mKISvuLvoCXl+Km3J0hyfE3StseG1npmVH6T4LY0U2WsGPtuvHIE5M
 iihdsAn+R0Nyh+1IBBghOmfVe3/WtU2ssYV9RcHjEGohtfVQRWMC2hKdF+VAZCHXS4iMTQ8K9aU
 3r+i9lAkuir0kOpXx27xu9/IitLrOY8rmhayeI5RHzb6tGPBNQRGqjJBHIDcD6qJPbcSsQ/RILg
 cekp+t5Hu0fS9E8P8SvhteCRb9i8I2Ga3rFgdhSLubB0E82K3AmNYMz1khXaHPLWeY+u0Tz7Kwy
 /zYQftVvNN3+ydVSH
X-Google-Smtp-Source: AGHT+IFoGNOMe+FGzZ96WtNG6bkBWpVIS25sSsCd1ApP6Jo/ojTVFmHInB7LU2k9yFcIcx9nj1/jQw==
X-Received: by 2002:a05:620a:2b89:b0:7d4:4b92:85e4 with SMTP id
 af79cd13be357-7d5dcc5e457mr1833576085a.14.1751919691816; 
 Mon, 07 Jul 2025 13:21:31 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/20] target/arm: Convert get_phys_addr_pmsav8 to access_perm
Date: Mon,  7 Jul 2025 14:21:00 -0600
Message-ID: <20250707202111.293787-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 709dfa2684..f1edbbee5b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2881,7 +2881,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 static bool get_phys_addr_pmsav8(CPUARMState *env,
                                  S1Translate *ptw,
                                  uint32_t address,
-                                 MMUAccessType access_type,
+                                 unsigned access_perm,
                                  GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
@@ -2891,9 +2891,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
     bool ret;
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        v8m_security_lookup(env, address, 1 << access_type, mmu_idx,
+        v8m_security_lookup(env, address, access_perm, mmu_idx,
                             secure, &sattrs);
-        if (access_type == MMU_INST_FETCH) {
+        if (access_perm & PAGE_EXEC) {
             /*
              * Instruction fetches always use the MMU bank and the
              * transaction attribute determined by the fetch address,
@@ -2952,7 +2952,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, 1 << access_type, mmu_idx, secure,
+    ret = pmsav8_mpu_lookup(env, address, access_perm, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
         result->f.lg_page_size = 0;
@@ -3477,7 +3477,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
-            ret = get_phys_addr_pmsav8(env, ptw, address, access_type,
+            ret = get_phys_addr_pmsav8(env, ptw, address, 1 << access_type,
                                        result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
-- 
2.43.0


