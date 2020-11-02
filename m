Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3821182lfa;
        Mon, 2 Nov 2020 02:58:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/jX2J8Q3WJ5cThysuZCkt0Gt1eP+fMIunkRDxySYYej2xTT4KnR7mxlP2ucys8CfD93bp
X-Received: by 2002:ad4:5808:: with SMTP id dd8mr20985654qvb.58.1604314712400;
        Mon, 02 Nov 2020 02:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604314712; cv=none;
        d=google.com; s=arc-20160816;
        b=EGc90NzIcpB6OaL+wuJEvDn2VmCExJVcIL7IcMTt81EeMYYffSE2FI8jvhQdzQ+L68
         TUDD75wmoXHid2b1cyqLg51LPyvkCw+wwA59YOQBimbPZVAB4jH6RcXWN4vcixyWV6Ik
         tQ3JEo2hdxXFJlcT2avdD7Z5AjhTjV3ISO/QHUHRjxuFCfUKMNQ+y+CxdOyr9bfXGsg7
         sRPFGvyTj9XNR+fdV1nFOAWcPXVq7QpzAGVbbBHDTuwTZCDmvz7k6KYc0G+/cxP17vMG
         NVBsZBQ3xFHRj0Gdz0w5biTMcaKgATdu1qjg+3ngf0oXO9EMHydVJdlGif6aMOiyUFHG
         XebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ZBxZuJ5kvcZKtYxBdCBTm+UCzaCP0GiboNzh7lfEDtU=;
        b=W6m7yp/cRyCzNtWsNYEKRzWW+ZijUFGhutTRreF5iVXt7bCSr1L6omLvPEn5QFmw3+
         zPBV1dYYPJurnWX84L1tovwA4XklnKLVGv1KZh+y5SAGpEGUF1iogHVaqdNKnO8NZ2d5
         FvawgpGtOtHcbHQ8ZpNwJNMtVl4yFZ5gvYxHR3NTCR2h/Cs4d6Awh99sxo9Fke/KWWeK
         N0Kd5Aq93U9Z+7cyWvuAEIagK7tzWwJO15RaMYeE6JaHNTZBgxLIWXwrbAv7+dr8COF/
         OWd1aPEDlMUpFvPoUEsyDQr7lj6s31eOmMzAEXVUx+MNpyOM2CDCLOpWbDCYH6f5beVw
         0m2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si8843345qvv.222.2020.11.02.02.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 02:58:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXXj-000803-Pv
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 05:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXXO-0007Re-VV; Mon, 02 Nov 2020 05:58:10 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39538
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXXL-0006io-Vh; Mon, 02 Nov 2020 05:58:10 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 5C0EA5FBC5;
 Mon,  2 Nov 2020 11:58:02 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 01/14] target/arm: add arm_is_el2_enabled() helper
Date: Mon,  2 Nov 2020 12:57:49 +0200
Message-Id: <20201102105802.39332-1-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <2172054.ElGaqSPkdT@basile.remlab.net>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bAuiTJbZRqxf

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This checks if EL2 is enabled (meaning EL2 registers take effects) in
the current security context.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c18a916766..aaf3671806 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2040,6 +2040,15 @@ static inline bool arm_is_secure(CPUARMState *env)
     return arm_is_secure_below_el3(env);
 }
 
+/* Return true if the current security state has AArch64 EL2 or AArch32 Hyp */
+static inline bool arm_is_el2_enabled(CPUARMState *env)
+{
+    if (arm_feature(env, ARM_FEATURE_EL2)) {
+        return !arm_is_secure_below_el3(env);
+    }
+    return false;
+}
+
 #else
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
@@ -2050,6 +2059,11 @@ static inline bool arm_is_secure(CPUARMState *env)
 {
     return false;
 }
+
+static inline bool arm_is_el2_enabled(CPUARMState *env)
+{
+    return false;
+}
 #endif
 
 /**
-- 
2.29.1

