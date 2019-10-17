Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1344281wrm;
        Thu, 17 Oct 2019 11:52:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnYiOwIOMxdoIWag1WvfHMpvvrtkl48OlbxdizpbOZXPqY3o6RgyYOmyV1/Woku1Lp/ADZ
X-Received: by 2002:a17:906:448e:: with SMTP id y14mr5065804ejo.136.1571338360737;
        Thu, 17 Oct 2019 11:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338360; cv=none;
        d=google.com; s=arc-20160816;
        b=PJGGfTew+5wbXwmk3BngXH7Cd4D+9B6e6hSpIPzGghKrq3ZqQetQrXTpw4O8zT343L
         ShUjLTHsyqdYvsi5+1h7J7rfwGPhLw+MaRcBiXjw7ldh9aSNJMQa0djMVy0qQF2OTFQD
         Bx5AcRJyAZo2K0Mnwmd9gvizMQJVvAY+R88awgLXzlna4GuS+o1RUoo9CEmRb6tJxcFJ
         lTY8/X4lzWV6MTJyBQXYy4+kyf2kajpakZuVdBjfmwka/2mrSSsJqwkV2Ls+wh8CGcor
         l8HYqmqCXHiMOaEe1P6T5kz6pfPxES7rbBOZWG1hRS+STmyfMVg7JBighU8mlV+lJOTQ
         pa1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EExBny+oAa/2RvpDTj0xViQxKJSM6o83jutlTagIpwU=;
        b=gyZzReDFtAabfvw/uS6C3b3DMSukSGfx0UYmaKEkPju0SVKVndlV6MndBK1+Ueg/31
         T8g47wrzgg+2lsR8NTi2RjoaWNXY+0R2hBJ5XtoL9FUbykiYcHYq3sabmMeH7xl9Bkbb
         8/hCC4Dws8kHGpxhnt29m/zI4Gd/zaUbIWl8LJY7bY2JcwSTUVL4oOVfPdjlhx/b6m6C
         +sAJOThfE1GRGLTerJ63nDbWsrVBY19aN7U5ZkC6ePimpnVKITnQkxTpaZT/3I31Sn+L
         sKWay+3o60h7sEkFm84R/4XIvrwk0Y4z868Z4S/eIgri5KHqinSiia8Z6MEQRifIn9XG
         P73A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NxvEpzHc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b31si2540457ede.12.2019.10.17.11.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NxvEpzHc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAt5-0002KF-8e
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArz-0001Dn-90
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArt-0000tF-0c
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:28 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLArs-0000sc-M8
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:24 -0400
Received: by mail-pl1-x641.google.com with SMTP id w8so1561289plq.5
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EExBny+oAa/2RvpDTj0xViQxKJSM6o83jutlTagIpwU=;
 b=NxvEpzHc9miC/SMKdGOWl7jKJnrn+I+GOrYGHIZY96dtR4Je9HPB41aY1uD00I7Y1b
 PPBNBcc+DRmf72mohzLzaEnuLezbbll1E8ES8BcgAZx/mZc09f0RUWHGx5FC3ZE4t0jF
 2swxCSMPXVmgDKAkm6bcm8OJ6GLmMT09IN3t2PYgbNDUQVmucX9aHNQXUO77Ksbr4YGp
 pAIN9d4nC2yBYqacG0hJSWRGTib1TkHvZuuqe5a03NNdEmIKiLHMHCrZfMSb4jeBpGjU
 59nNDoEidi45CW07mhH0cJtGFqeMO+UQVDb9NC8/s+Pe1WDGUUaHvUEz5JU2rhsl+0J6
 gxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EExBny+oAa/2RvpDTj0xViQxKJSM6o83jutlTagIpwU=;
 b=pZihgtfT8mPQTscqKcq0v2x2JhYHD+YG9BekRjYlBGbbrwHg3ksPExM6UJMKAaJpyf
 nxYTjRVxCnmmFnxyRP0oeQi1ssAoGkJrU/J7DRL/DsP19clz5BTuMuXdah3t+8v+zLSJ
 CM5wBSBxSyi+pD7XwcYiXC1NaCNXckiEbqwhhsW/oadvSHb6DqKQj9uxZq/LfNXWj8F7
 CjLX+mrT9Cl6MSYrd1+qzNnlgL+rUdIMne/7sPQllLG1JCwLTYk3e8ji3ijq+rhkoGXg
 HlRQv7UKTMFAQoEXPfcbg1hHTDwA7hzXmJshB/eJS/aFOQ/BJx24TlOj5QwugCxuYyo8
 bwtA==
X-Gm-Message-State: APjAAAXnd2qU0/tlTHEH2IdIKHJEMLMNcyMeYzoFT2U73clreRa0S/yw
 zcBzgBxTEcgGJ1/i/W9Y7b7R7dVNGlA=
X-Received: by 2002:a17:902:8601:: with SMTP id
 f1mr5665293plo.144.1571338282782; 
 Thu, 17 Oct 2019 11:51:22 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/20] target/arm: Split out rebuild_hflags_aprofile
Date: Thu, 17 Oct 2019 11:50:58 -0700
Message-Id: <20191017185110.539-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-TUID: ZVRe1t+WGCN6

Create a function to compute the values of the TBFLAG_ANY bits
that will be cached, and are used by A-profile.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1cd54cc93..ddd21edfcf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11106,18 +11106,28 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_aprofile(CPUARMState *env)
+{
+    int flags = 0;
+
+    flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL,
+                       arm_debug_target_el(env));
+    return flags;
+}
+
 static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+    uint32_t flags = rebuild_hflags_aprofile(env);
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
+    uint32_t flags = rebuild_hflags_aprofile(env);
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
-    uint32_t flags = 0;
     uint64_t sctlr;
     int tbii, tbid;
 
@@ -11262,12 +11272,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (!arm_feature(env, ARM_FEATURE_M)) {
-        int target_el = arm_debug_target_el(env);
-
-        flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL, target_el);
-    }
-
     *pflags = flags;
     *cs_base = 0;
 }
-- 
2.17.1

