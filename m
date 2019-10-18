Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1232552wrm;
        Fri, 18 Oct 2019 10:54:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGQFUTWKeBd/wIahHpt3Eo+kcsn+oeUUWC4TOwTAPmPdFYdC/crRXJeu3nk8tWD3mBBxGN
X-Received: by 2002:a05:620a:78e:: with SMTP id 14mr9907810qka.483.1571421244615;
        Fri, 18 Oct 2019 10:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421244; cv=none;
        d=google.com; s=arc-20160816;
        b=nolsc+cF5xJlpnzTqHEk9T+WVPLMi5gAx+4c5KmhCRXtH7WFKyNjhlskIHQ+ADgFGr
         o9Zfxp1YAR/7cHg9kx2L4hnX3YCmHhPPjW0B1Wb2eKRk12OSY4nBrZ/oJMUGY+9kDBkl
         o1ceDtvI7yQ+gprkin6+D3XjMTuGyYQ/Ip8lMQ7Suy3GNnugMZokfGNS04Qs9vBeos4X
         nT42SnIpNa2l4ayhVU/q9WjnVOQvCEkiaYF4iO+J1b90rqkuHrDUf2VjAGJDOFS0MuWi
         DBTxhOUCqVB74F/tJHtiHhmJ0QaU2o4Lo0b5NSi98tRYXske9f5D9tgPK0UBn++Nw1pB
         TxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
        b=h+tkH/iZIDWTaGBOFqu0CV1vUOUO+hVp9yANX2wl0ozSFriT2ilAHz+2y6+aaAX0TQ
         EocDaUU6DlrtfRy5UQAAorAXXPfDhM214nQ7q/QTeMcJ5S2rkfDq+UbPPf/C7yiAe1VW
         PYSjJ9rsEhRQKajLKAd+rhTwN6l5BHqiSxlGLdVir8j5WbLkROFDAUvfAywlGTcR67df
         zPUBKPaFlIE/sTtIvRJTptsyrjPK3rLLsngB4FVTNOIpjmHCv5r57gfm26N4fu9gBPDA
         5/6JVzZ+9tvGb+4OR7RYlnZjuBuukn0Ymeu0zRWxDGr5R2hoEz4CSCQj2wRe5ljkp/Ei
         mtUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hZHwdPeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si6485116qve.213.2019.10.18.10.54.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:54:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hZHwdPeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWRv-0007vz-OO
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ4-0006le-4E
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ2-0005Y4-9U
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:54 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36784)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJ1-0005XU-U9
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:52 -0400
Received: by mail-pf1-x443.google.com with SMTP id y22so4327327pfr.3
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
 b=hZHwdPeEBA2AK5wNx1xD+5hnv39LM/tC0jfD0A5B9JMZUCZTWzkFMUPZNiEzngiD00
 DykvZK+XCp5mXLSW/kIvFMiPG/+Z/qcVp2MTHBboWNgE0kWVw10akFp1WFWyw7a8ektb
 i2GDDDv9z8nSyFOt/H/xBAajBs/pSb0rGnuuL/kFq1zRi0h1T22qz17cBDxKonMsTX5W
 hhIu4giEickQYIXnUhG6qR2HwVSl6HsdNTq8/a3+UtCdnqiiD1rXHhMK9cpQsnsiOzW0
 p7BBEw4hppAnlx4NXa9vwJx2ayxuot/3Y3sm1gtgzHHDRTxDmap79oEzLBXjcU5Y+aVI
 fiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
 b=q7daIjf4mv0kWbNELn0g5wm6t8D4BjcFZtC7mkX8WsuUz7dXrwRVKyuszSO5zwQQ16
 3O7thPSLd9/XMcZQRNU5eILD8QDHBtimCijnCXVBbW9Bh5lLgKqjN63G8RwKrs7jglKq
 P/zKpAdjFhkLtfEb+oYRwMPz7eGrtQrIMXGtVo9818vrkZzSq6UAPP5t6eLO6mVtDprP
 EHTiUeaYnqf1X0Iq4aaD8UGraXT545jk3BBYvQdRUsiwI2x4dEOKKTaDdhDVJl7IVdZJ
 ZzScpEty7uEOwYFn0AS8a3C1hZReuPDYSV+GC8MunNrvKWq8b6GI91CXHQAetVVDowo7
 fJIw==
X-Gm-Message-State: APjAAAXODxxPCiOulwhfBF5dzSrvml1GzGKqGMs7VgXp4GSHFDBGcYWN
 +Ff4/YLNqUzJnSqsZ8xZmo7XMg==
X-Received: by 2002:a17:90a:b908:: with SMTP id
 p8mr12857107pjr.62.1571420690907; 
 Fri, 18 Oct 2019 10:44:50 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 15/22] target/arm: Add HELPER(rebuild_hflags_{a32, a64,
 m32})
Date: Fri, 18 Oct 2019 10:44:24 -0700
Message-Id: <20191018174431.1784-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gg/i68DCDa8A

This functions are given the mode and el state of the cpu
and writes the computed value to env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h |  4 ++++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1fb2cb5a77..3d4ec267a2 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -90,6 +90,10 @@ DEF_HELPER_4(msr_banked, void, env, i32, i32, i32)
 DEF_HELPER_2(get_user_reg, i32, env, i32)
 DEF_HELPER_3(set_user_reg, void, env, i32, i32)
 
+DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
+
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37424e3d4d..b2d701cf00 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11220,6 +11220,30 @@ void arm_rebuild_hflags(CPUARMState *env)
     env->hflags = rebuild_hflags_internal(env);
 }
 
+void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-- 
2.17.1

