Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp180195njc;
        Thu, 18 Jul 2024 18:09:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNf/q8gLjzh5ZTg+S6mh3qucGdcaZGM1SIGAA8auN5wzFvsJFirfp+NH3Ib+Q17/HwktUZ6D6njhXKy/f/F9hSKUz0lpCz
X-Google-Smtp-Source: AGHT+IEvW2NTjw/2JP7kld4A251sbAn940VfJsOsq2JpGGDAZM5r/fAjPuqXWoBL6J6BoLfq8Cbk
X-Received: by 2002:a05:620a:298e:b0:79d:5f67:a836 with SMTP id af79cd13be357-7a18745d69emr680514085a.26.1721351344747;
        Thu, 18 Jul 2024 18:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721351344; cv=none;
        d=google.com; s=arc-20160816;
        b=AV8Ad4L96TdjsMMhPdQ9M3L3+3ItQFl9tLcOXE0sLZPQsIt0+bUIiH3ljoccx6AErH
         uFQQgJwRphbPzE0thVrQ3EX2u5hkki7j+bmqlSw0lBdbEZVjAno7SrP5ELxAcfyD8l8c
         nuknRA/cuDZQkNh9OTawtXQKP81TQGqq5EkI7fNMhZYg07dfqCu8q0zc28arIvYtb4NI
         ZyNXoGCPkfu2daDhXwvxJf71GxR2M2Q2oTNNySAd0GapTwfqj5H2EDFickKVbVhhgDey
         VgeWqBnHwXRPfzq9D1xy9K9J+HQ/eoKBXiZy9Xgs/W8sv4UZLTD0qMty7b6xa5IV+p35
         zgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qQ06f1POln3X8Sb8fDa8/CDLulrLL54olCBz3brWMPA=;
        fh=Rc2oOAtVcw1QgMi4H4R5cDBav9mgTQMB7BmgqsQhSJ8=;
        b=veWK/ktdhAk+5De3FKvj2H2XiJ1zcA22pMhFeCcMVObTiGkh/5jHAhlmXSDSWO0qUG
         +U0tjI84wchbXVXE3dD2610ObJutNX2ugrMqpxksY/QE5Ew4oKX9/XT4wAhLQx4E0936
         yCKZM3eCINYBfgmLEae/jo10u6XtkPVLCpJd59MSIEafiU9IULrqRWLDWSNhWmFX0W9Z
         chjEEPOy1Cgt4xg3mFUp4x0gEhHbfWl3SDBGf/XzWRIbjfkBfVZrJkPFQfIMG9yCqZ1x
         tdXFYWOwCPApeiFWNXb8oSGnh1/+OVaSZhrAoyqCOJHq6Xii8YaEfAg7jVaHhzoJI/p7
         dyqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HIgrXQvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdb87f1si4176121cf.331.2024.07.18.18.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 18:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HIgrXQvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUc6d-00058s-Gb; Thu, 18 Jul 2024 21:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5y-0003H1-Po
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:40 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5u-0000mm-I3
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:36 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1fc2a194750so14196335ad.1
 for <qemu-arm@nongnu.org>; Thu, 18 Jul 2024 18:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721351253; x=1721956053; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQ06f1POln3X8Sb8fDa8/CDLulrLL54olCBz3brWMPA=;
 b=HIgrXQvijkfwIOy0gZzA5J5UwBcIKZUzRC+Jyo3xzqNlBZG4WjXb3zP5Mb0Ews37sp
 0iBkAH7iQ45kgAHY8gZbIHvCdAZghfZVxpP8I8wBtDhyqYuS9EttXICk4j1Vv2E9aaoe
 Waw8jD2rR3gFQIqI64edXjGldGJlrSyUsc9cOeRbRsvQ4dg8I4a/Kh8/4kNHDT3rUulJ
 F8LWIZmTizxMwc6odIaVZEy2Wnwau1haoVXONYkO2ZWErSgZRezY3aNERNszuUsaSRrY
 ab+neIXBox/Z0eqeKqKcynXOKjEU+5b4CWOhpKQ+9LZvTQhZZ8Rbvi7+dZMsygRSIV6R
 WDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721351253; x=1721956053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQ06f1POln3X8Sb8fDa8/CDLulrLL54olCBz3brWMPA=;
 b=r6RIFF6meC6J3lDyZjSfO0Qxzc9PoLXTYWoam/xnqy15b6aj0zl1+08cejASblIkdU
 aebbr+iM0Vx+bZ8YbyDM1Pdx6+bWytl+94Qmjj56QyvYBgenJM5Cw2FwqhzHWvv6fhcg
 5kmhDNBEjJVANcEtAhzUAHVKCu24sNAsAzPo3wkhK0d7tbKsyvZHvf86gMyZDbQate6V
 Q9i9VW2+hzdmkKg7gWWX/ZV4kf/021LXuV2ghXne29EQCOlC9AYsP+xm0UXHopzfNAHp
 UdtGmhNcc4GYluO0W1wyJ9HBPLjuF4O7z7DCD7aGcGqqvqNh7iTrOYGDOsLsm/d2wmc5
 5Hyw==
X-Gm-Message-State: AOJu0YxMvpuXKzcmzIQCHGhdvssVDMybfp5u/djTSuUWJLntHxQSBypN
 lqgFusGS2lJrqcqFw3xPhNbfx0ss9gR/mhbbEWvtJOcbRvJJgkv63ZYDOQJcccewerzpH6+5TgC
 hMgKvhw==
X-Received: by 2002:a17:903:41c7:b0:1fa:8f64:8b0d with SMTP id
 d9443c01a7336-1fc4e154b4fmr67172795ad.4.1721351252633; 
 Thu, 18 Jul 2024 18:07:32 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd64d07ad9sm2067415ad.177.2024.07.18.18.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 18:07:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 05/12] target/ppc: Hoist dcbz_size out of dcbz_common
Date: Fri, 19 Jul 2024 11:07:00 +1000
Message-ID: <20240719010707.1319675-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719010707.1319675-1-richard.henderson@linaro.org>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: FwuK3cQoxSPp

The 970 logic does not apply to dcbzep, which is an e500 insn.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mem_helper.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 361fd72226..5067919ff8 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -271,22 +271,12 @@ void helper_stsw(CPUPPCState *env, target_ulong addr, uint32_t nb,
 }
 
 static void dcbz_common(CPUPPCState *env, target_ulong addr,
-                        uint32_t opcode, int mmu_idx, uintptr_t retaddr)
+                        int dcbz_size, int mmu_idx, uintptr_t retaddr)
 {
-    target_ulong mask, dcbz_size = env->dcache_line_size;
-    uint32_t i;
+    target_ulong mask = ~(target_ulong)(dcbz_size - 1);
     void *haddr;
 
-#if defined(TARGET_PPC64)
-    /* Check for dcbz vs dcbzl on 970 */
-    if (env->excp_model == POWERPC_EXCP_970 &&
-        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
-        dcbz_size = 32;
-    }
-#endif
-
     /* Align address */
-    mask = ~(dcbz_size - 1);
     addr &= mask;
 
     /* Check reservation */
@@ -300,7 +290,7 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
         memset(haddr, 0, dcbz_size);
     } else {
         /* Slow path */
-        for (i = 0; i < dcbz_size; i += 8) {
+        for (int i = 0; i < dcbz_size; i += 8) {
             cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
         }
     }
@@ -308,12 +298,22 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
 
 void helper_dcbz(CPUPPCState *env, target_ulong addr, uint32_t opcode)
 {
-    dcbz_common(env, addr, opcode, ppc_env_mmu_index(env, false), GETPC());
+    int dcbz_size = env->dcache_line_size;
+
+#if defined(TARGET_PPC64)
+    /* Check for dcbz vs dcbzl on 970 */
+    if (env->excp_model == POWERPC_EXCP_970 &&
+        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
+        dcbz_size = 32;
+    }
+#endif
+
+    dcbz_common(env, addr, dcbz_size, ppc_env_mmu_index(env, false), GETPC());
 }
 
 void helper_dcbzep(CPUPPCState *env, target_ulong addr, uint32_t opcode)
 {
-    dcbz_common(env, addr, opcode, PPC_TLB_EPID_STORE, GETPC());
+    dcbz_common(env, addr, env->dcache_line_size, PPC_TLB_EPID_STORE, GETPC());
 }
 
 void helper_icbi(CPUPPCState *env, target_ulong addr)
-- 
2.43.0

