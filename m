Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B25C71130
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 20:58:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYsuU-0003Ll-BI; Mon, 07 Jul 2025 16:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsL7-0005Gh-NG
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:29 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsL5-0004HE-7H
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:25 -0400
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4a4312b4849so40433871cf.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919682; x=1752524482; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxsgUWQbY5ASUPXPwx0i/WLJ4Mhu4BV4cCyqG0Z6fig=;
 b=bl3wPI+bo7iBmd/4rIjH/OfgpkJzm65UTkql6/6hBoCu+1GR7uKC69zSblZLjHfHH2
 YUqVbeY/4kxD30h7+czt9Dqkzzq3KUlq2q7pD4RqTjLDR02pyoY5iNgSuAlFG4WPwvUb
 oMVIoxPrCeh/1UgdFFO4qQnL4HK+8ycD6JUH/x+AkX/BzcSMojjFmICDWqraHL9UWN9P
 91AcRKYIL4m9fJTKm4mgXdzFgxtxzdTiQAJcU+TCpP0HYAJBfSU1ESVrOIN2FPOUoanN
 DlP3eNhqB+7JyKhf59siSqXBzoR4X7zNPVx+lSKdYPASsEqkgJMqz8XfcFa2FHMyuC3B
 RfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919682; x=1752524482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jxsgUWQbY5ASUPXPwx0i/WLJ4Mhu4BV4cCyqG0Z6fig=;
 b=smnUZYX/JuyMBPTOEvRv1hiDQ69tfumDSz5tIklXfNQcM84Qg1xlsBiOoLuiH03wsm
 PJMC/+YDY7tKH9jS7a9WIZwg5fdqI/rnWMRsZ3sB5CTIkltrZcqfvdyWXMp+hbuU9kJH
 svRq7F0BYK3KMq8s20ODjB6eDI5ohYBjhWn6ndUOiDH+p1QDb7IfB307FklsKzMytyqc
 Tz4OmZc3rU+7PpfVthhQDrhgfxE/enHKCLmWHTPJ4DsTMxW6+j9ioO07ubI0EbPyaQ5I
 9e4dy4JNbFYzFAo+KrHp1rmbFtaq2QhV6uMBiuwoC3StK36k7jGU6/QODN0COSTbjUmF
 iUlA==
X-Gm-Message-State: AOJu0Yw3gIbQvk11g+y64tpPfT4/xrY5qA3NSudGiS7Dj8aRQhyrTfXt
 Y+5slZvtoUBnqmhh1MB87GzBn1RMImL3Vzo6B59obuD29fGkweD5visHz3V6yn0dQ6g=
X-Gm-Gg: ASbGncsI/6tvwx2SaGzFSV6WF1dRSRMtLyEBj4JdGz8s+N+6LCmGhSW8ZYPyyjKy/Kn
 /IswAoKAudNHV96hIjAa4La3B6suVVMeLGF4z/OD4+Vl/hAC+X3xnq4Y01XZyOK/vr3OcfhGdBe
 RN3jIZulMPfo2zWYasdJfg4j9R2LWBOFFaXyv5iZUCpESSggfIkAtfGQCAZWfrGzklk8iSfAFY+
 l3WBns7O6peio0lHHVKpEVCxNGLXiW7P1RP1pT77XiQRgzkr4S/BLT4ziy4oYh0easUZLsqIxsE
 gxoBmd2Z0IjOegPe2RIlo+uzLJ0nP3Dw6IBoyH3GRYq1h81CIiFNiug6EiWzWoXaOxxqgIQWg3g
 aveDI9Rp4N+GQDbuA
X-Google-Smtp-Source: AGHT+IExKQL2znVnByclw1nVIw6sdSlZTVR593+58jvr8Wfq3eiZhURLMWNn7BtZsr7pijDwvFS/FQ==
X-Received: by 2002:ac8:7d52:0:b0:4a7:f9ab:7899 with SMTP id
 d75a77b69052e-4a9ccc338a7mr9395711cf.35.1751919681966; 
 Mon, 07 Jul 2025 13:21:21 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/20] target/arm: Convert get_phys_addr_pmsav5 to access_perm
Date: Mon,  7 Jul 2025 14:20:55 -0600
Message-ID: <20250707202111.293787-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7503d1de6f..adceeabfe4 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2182,7 +2182,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 static bool get_phys_addr_pmsav5(CPUARMState *env,
                                  S1Translate *ptw,
                                  uint32_t address,
-                                 MMUAccessType access_type,
+                                 unsigned access_perm,
                                  GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
@@ -2218,7 +2218,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env,
         return true;
     }
 
-    if (access_type == MMU_INST_FETCH) {
+    if (access_perm & PAGE_EXEC) {
         mask = env->cp15.pmsav5_insn_ap;
     } else {
         mask = env->cp15.pmsav5_data_ap;
@@ -3485,7 +3485,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                        result, fi);
         } else {
             /* Pre-v7 MPU */
-            ret = get_phys_addr_pmsav5(env, ptw, address, access_type,
+            ret = get_phys_addr_pmsav5(env, ptw, address, 1 << access_type,
                                        result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
-- 
2.43.0


