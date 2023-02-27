Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5052757ejc;
        Mon, 27 Feb 2023 13:34:07 -0800 (PST)
X-Google-Smtp-Source: AK7set80jYZlGS/ZI2GOBxLY0+foPBIEwbJnPoJNIbU5HVOq7artfcsN5YQJGF4RBH1WXNuidl7v
X-Received: by 2002:ac8:5906:0:b0:3bf:d51e:18d with SMTP id 6-20020ac85906000000b003bfd51e018dmr1177704qty.61.1677533647853;
        Mon, 27 Feb 2023 13:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533647; cv=none;
        d=google.com; s=arc-20160816;
        b=OUmkQjHx6eOrK4IML6W+3wntqWz+Y7G+VlGufrai9s+I21poK97qumHLB+VHvCF1Xd
         SgNycwZfWOJa0np70qnLhHs1/UXnUtGKiZJPH2U8S/BkdLUGrnLU38VRKvrkvNqbf2nX
         lfYSkROvltS6d+zPaaDCgG7wcPGqvaEleV810ascZOqbxzhrX1qN7NS90vIBSAZ/yg8X
         HSeWsBDLAq1nGwZ90Qf1BBP1uFZz3rwbjGQ8t6gka2/apMRlTeymd8ozISfsm99twdnX
         2v2VmW8wWMXYy7PUonOqUrqFF57JJRPnIaZbsI7u7XwII37QygrgJvrEmhkE8WsClZts
         rffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oFabQEE82JV36HMrVDQBYDbr2a18gGcUEuaUfpMg43Q=;
        b=iQBQF7M2pw6I8E9kFF3UOWBw5mMgR5ygaw0g4z8HA1H+HpsCDFfz+GUYX3laTufbfF
         rlXVUYGXVU7uUWqmQVihvO33+3AcNibnqYEvXSAmxKU24VFRhWGVOLlATGx0AndsOqix
         174xJ4a6PHdoghBSRPK+5465KY1StckMMC8w25A1zuqVPNAHKBWj+mf0cQY7aI6xDoD1
         +/SqcbuJAnpbIXTjDh+5fds3s5AyMwXkL9W6uyIIAz96akqZo8fxR40aJjIm0cEqKOTE
         9G+iCMpPNRL+bNbiSqMmCzsNQ7aMJWuvhB0bXfJGxWVUSyllSoDk02q8BohuSFCsUaqo
         qPiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mxv/KyZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020a374506000000b006eebf6f2e6asi6293632qka.409.2023.02.27.13.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mxv/KyZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl87-0007Nh-68; Mon, 27 Feb 2023 16:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl85-0007Il-Kg
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:53 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl83-0004Ku-Py
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:53 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p6so7419016plf.0
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFabQEE82JV36HMrVDQBYDbr2a18gGcUEuaUfpMg43Q=;
 b=mxv/KyZ/rhHd4cQavQuKiVpgjunHydFwPctfMhrwvdpDVu0s2JQx8ueIawA8daj/B4
 +KTRZru9muo0r478dJ+rEcTp2kCRIbZRuosVr7S7mLUHjJxU8vD6uQPuBBBs3hyQTZ3u
 tJXEsp8Z33IlnDTjFB9EJbp3KEbBrCXsXtfI3iqgQd2EQTYjubBVAPRHHt4KVCFZLLQF
 McLIpV74yI00QpxhRmYedjMeXrxHR3keT8jpj3p6HloPrkhQ43Qg8gK+Ck7XtMNy+wHC
 6YAsyM+6yadS9zRReYbTYjBARE8wsHhsN1Z9TjD0BxTWLsEUnAIeUCeb0F51hI59dTiV
 Hg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFabQEE82JV36HMrVDQBYDbr2a18gGcUEuaUfpMg43Q=;
 b=WEcEpqxTspwVWEX1yaxKcWg+EAhcHRIOK1xhcVQqZaE0P6YS2BhwbKl+OoOMPRm++B
 cVGEZ4uiOot4I/yHb/XEzSE+2Ej90rxZ7irvQXXidsUjB0H/+q0rS/pGfwh6Ck5C/Dsg
 pw8HpdA9WStzUxaoN1X5DZN77NSYw1CHAxaLf7oZCIEUA0C+k5UjwPgZX7qlO4ticxaD
 40pjHc5wk7U/UN29x8dGQ7eVvLRnLi4JZDfcSXBSP4XZRAeq82tk0c6DhccJYlwxWve5
 2RXqvOrGSNPaxM6XOMjoePc6MJeHKQjs/906N5DxwLTlkyfZ4KjdFSvbDHR4wH/W4CP4
 sJ0g==
X-Gm-Message-State: AO0yUKVYdyrW3fRWVJ3pSeUOZ+5qt8LV8AZnEEVQflhcbUxymz5rP6US
 cIotQNjz3zB0RdEiqEhB8wQbAQ==
X-Received: by 2002:a17:90b:4b52:b0:237:3d0c:89ae with SMTP id
 mi18-20020a17090b4b5200b002373d0c89aemr604646pjb.34.1677533630523; 
 Mon, 27 Feb 2023 13:33:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/14] target/arm: Export arm_v7m_mrs_control
Date: Mon, 27 Feb 2023 11:33:27 -1000
Message-Id: <20230227213329.793795-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B/xSsIDATQo4

From: David Reiss <dreiss@meta.com>

Allow the function to be used outside of m_helper.c.
Rename with an "arm_" prefix.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Split out of a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 3 +++
 target/arm/tcg/m_helper.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 97271117a4..0f2c48ad4b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1355,6 +1355,9 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
+/* Read the CONTROL register as the MRS instruction would. */
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
+
 #ifdef CONFIG_USER_ONLY
 static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 #else
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index f94e87e728..03be79e7bf 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -56,7 +56,7 @@ static uint32_t v7m_mrs_xpsr(CPUARMState *env, uint32_t reg, unsigned el)
     return xpsr_read(env) & mask;
 }
 
-static uint32_t v7m_mrs_control(CPUARMState *env, uint32_t secure)
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
 {
     uint32_t value = env->v7m.control[secure];
 
@@ -93,7 +93,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 0 ... 7: /* xPSR sub-fields */
         return v7m_mrs_xpsr(env, reg, 0);
     case 20: /* CONTROL */
-        return v7m_mrs_control(env, 0);
+        return arm_v7m_mrs_control(env, 0);
     default:
         /* Unprivileged reads others as zero.  */
         return 0;
@@ -2465,7 +2465,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 0 ... 7: /* xPSR sub-fields */
         return v7m_mrs_xpsr(env, reg, el);
     case 20: /* CONTROL */
-        return v7m_mrs_control(env, env->v7m.secure);
+        return arm_v7m_mrs_control(env, env->v7m.secure);
     case 0x94: /* CONTROL_NS */
         /*
          * We have to handle this here because unprivileged Secure code
-- 
2.34.1

