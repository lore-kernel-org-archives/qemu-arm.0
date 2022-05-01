Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp482600lfu;
        Sat, 30 Apr 2022 23:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnQGhHI6ERIbMC+8HNBWgHD5lraPk1aNVdh0YBftyNYGn+qZ867cRdsWW3y7xWf5I3s7y+
X-Received: by 2002:a05:622a:c4:b0:2e1:cb5b:9b5c with SMTP id p4-20020a05622a00c400b002e1cb5b9b5cmr5865650qtw.69.1651387483304;
        Sat, 30 Apr 2022 23:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651387483; cv=none;
        d=google.com; s=arc-20160816;
        b=bWpbfwqx6YEuHIe1GfJPFxIguHB8XyXNx/kvOAv8TtTKIiOBVnGt4xi5h+7JF4LQNR
         W4FuOLj2ANEidH2R8CQWzrEScgBc0p6JDhVZ8lc4SQV2fI9lnhZGnWdPvOggdFxdb/+x
         LH/LPv2d4ymspYqT+gs+1Q7O26lpvDnEJDNvfgqP1PfJxmcRuig0X7ogCgLZk7J4oEZg
         Zub5KOsQ+xVLJwC8Jkf4EgyMUAshMEAabbAamMrcxuX4rqzba2L3lw9gIkpVxjFTb91Z
         rOz6Of3NFgJNzBCQ2osr5mOess2i0icy1uwW5CUObeyS6GIYAoPY4XecjYoTiB61NORs
         gj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eLmL8OHUPXIjo0sXAU8FjVln9l2ooq2J7ROpHXXZtis=;
        b=HtBFQcMfBAU9QwKxqmty8Q3wHKg1+iYEuSSKCF0yxCjPaj8QSOMW5i74pn9tcpe/nu
         15nYmlEWC6rYz6iyV8nK+aY9b2l4+VvE6Sso9qbHoPtzsN8Hkgwh/ones+dVudzLTu1t
         7aztf0oYHq3kpyck0RFjClwwBlYrh2SzdZZ03Y2tWP5MFD7KVK/0v/YC0RECl8jSSVPt
         XwBXOb0HNGqXDpWQTawPD6MLfnx2mTCi2xtWz0A0GP93x1yCMG5MXg3qmhU5hNtBi8WY
         ZH6S8QuzSQ8YYnAeAAEVqjkCLn3+Wi9JZnuMjOPffQgn6voqNLfd12h7rsWOz1lQyFqX
         OJ6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aRyFtQqn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay13-20020a05620a178d00b0069ec82be0b3si4778014qkb.446.2022.04.30.23.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aRyFtQqn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3Jy-0003LN-Ov
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U8-00072H-Lp
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:09 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U4-0001Pr-Qy
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:07 -0400
Received: by mail-pj1-x1036.google.com with SMTP id e24so10351328pjt.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLmL8OHUPXIjo0sXAU8FjVln9l2ooq2J7ROpHXXZtis=;
 b=aRyFtQqnrJwkTfdumlf2aIP22ZbTQ6UdyAedj3ff7clHfnu3Y/xgxR9OODXH0IsKu5
 Akdvs/L2pudrastpqibBlXi9FB8yu2iAZzdVyGN+slj6Z157Kq0NcMMP6ZiUe1l+49kl
 4YBMs+ghtv4ckHPZkYYU+nwwcOodnFurakoissllOiGf88T6gQOgccqSve+MssB/Paem
 PSg7W8z2V/gjY6k4Bhs6HMWyJ7LpXFPJioW8/DGLBOTapF7dZ18CUgV+SCTW1Dtmd3+M
 9SSbb6o3x2IzJwLJ5tfJ4UzaQ9BP6Zh5jjr/BeDDMKcEn6sGkaHmyrcT6Bqn0s22PVV4
 eHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLmL8OHUPXIjo0sXAU8FjVln9l2ooq2J7ROpHXXZtis=;
 b=L8qQRsfatY6ExenbAi3aHZvdE0NJmjQYCg1canPBoEst/KL2oNv2F9MuOaf4tVzvUy
 CnLpZBszVpF8w0kz9iitAAEQJN22q4HW9IvnlXri0UDvXFdh842jA/pwWv+8+pRO5Use
 4MOT9LdiGTRJgKSvw2OnldDvfVBs3J3/BBarisRYXK6ZGcKxTcQHUFcLfiY8p5RWGDR/
 gFlF7/iAjZ2v7gyNvy9sMHMKZR5lk4Z/U0zCI5VddR+kvpcuLG04wDs0u2pPt48kz9sA
 XamfnWDfv+BzakXLrMTlKETjVMw+Dy5TQ62Q1728alccQXPorpOoy7h74zRx3/zSwWya
 tlZg==
X-Gm-Message-State: AOAM531A4fEWV84hnJ6CJwWVW5DLHdv9wlCMIf99Yiu04/3OFvYK/sLD
 ajZaalVzHh8PVpFWRMykO7uckn8+vS4Fqg==
X-Received: by 2002:a17:90b:4d0c:b0:1d9:aee3:fac1 with SMTP id
 mw12-20020a17090b4d0c00b001d9aee3fac1mr12283101pjb.15.1651384261966; 
 Sat, 30 Apr 2022 22:51:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/45] target/arm: Add isar_feature_{aa64,any}_ras
Date: Sat, 30 Apr 2022 22:50:15 -0700
Message-Id: <20220501055028.646596-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0YAQs8QPX7fL

Add the aa64 predicate for detecting RAS support from id registers.
We already have the aa32 version from the M-profile work.
Add the 'any' predicate for testing both aa64 and aa32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7303103016..ca01f909a8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3886,6 +3886,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
@@ -4108,6 +4113,11 @@ static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
     return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
 }
 
+static inline bool isar_feature_any_ras(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.34.1

