Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2163941lfq;
        Fri, 18 Dec 2020 02:41:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzryK7SsZ7mWTKNYVRYVWjotFuro3NKbr/f20iY/6RYg6TbO2XPBEWOGHfUUfQNfXO6PuLR
X-Received: by 2002:a25:374c:: with SMTP id e73mr5406161yba.376.1608288106897;
        Fri, 18 Dec 2020 02:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288106; cv=none;
        d=google.com; s=arc-20160816;
        b=z03b5sZumPZj9WtjwG9QEDICTXF2mnDF93h6mqluLBm3HqqFtYC6sn5Mejh4ye9c4c
         XSV6/WB3Meq5USOTsL//LIbKBZsixsyr6fJY7rTbv9WON2j085WAbDJZsQ86OxU+xiOS
         jmaRqoI0RHB6QWCHSnKCnEXQRkL6B743gtqsUG0NW6aPwnbD6hClaxxpN5oBZqxRVsbM
         Af5dm+WaorQtLx4nbw2pi63aX+9zVRGrYcXNFBGhRRMFq6oC7ktZLRP7nMs2bXqcocez
         eMMDpSRvEwhC5iCI/WXJoCxyN4cDKrNII8IQcxN47ocFA7huJLqzCGGEe5I8UzQDmgcP
         5orA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=u/mHDpUwCLJG0bICvoUeZlyIM5lb2teF0a1hQiaITTE=;
        b=c3T99+hW7dW8cGXmT377ivL6s0ogu3xVUom2o+CMGpwEqkcLRV4A9ym5vHGfi4z2sE
         k9dEHjHJhBtRVah1+y3wHVSsfYnoJfs4AawmB4eO9Y6mQPHnjECIhgC+6ICyLPOqXlw4
         J0PwFUaNUahhRkOmKuSg9fQvtYPT/upVTieo1El3wcXrJ6b9ZCjxR1a0rgxlx1h1zUqB
         kemaau+9JcVjo9SUwvPMPWOUlt0ndpNhUy2Von2GE6EPgfNtbrRRrDGBPTBT6DHnGkv5
         yFuPUMGZLnaSmT1yRnk7LU98gAk3LptRS2UHnuI8RBU6GTYkbQ+ebc7L08FYMpThZYXi
         QjPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si7831683ybs.204.2020.12.18.02.41.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:41:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDCk-0002v3-8e
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9D-00069k-7g; Fri, 18 Dec 2020 05:38:07 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55286
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9B-0003Jk-Ko; Fri, 18 Dec 2020 05:38:06 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 4251A6009A;
 Fri, 18 Dec 2020 11:38:01 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 06/18] target/arm: declare new AA64PFR0 bit-fields
Date: Fri, 18 Dec 2020 12:37:47 +0200
Message-Id: <20201218103759.19929-6-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
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
X-TUID: HX/HjFUXJfi6

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c4e370df06..6a5a253eb6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1881,6 +1881,12 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
 FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
+FIELD(ID_AA64PFR0, SEL2, 36, 4)
+FIELD(ID_AA64PFR0, MPAM, 40, 4)
+FIELD(ID_AA64PFR0, AMU, 44, 4)
+FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, CSV2, 56, 4)
+FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
 FIELD(ID_AA64PFR1, SBSS, 4, 4)
@@ -3928,6 +3934,11 @@ static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
 }
 
+static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
-- 
2.29.2

