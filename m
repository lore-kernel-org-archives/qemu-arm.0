Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3441875lfq;
        Tue, 12 Jan 2021 02:58:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKPYKWcYiK/JSv0h89J4tBrlwzJkUFG14W8KOZu7zop7Kvs+agSF6QKiGOFlNBS3vQ1ty/
X-Received: by 2002:a25:9d01:: with SMTP id i1mr5574019ybp.359.1610449109276;
        Tue, 12 Jan 2021 02:58:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610449109; cv=none;
        d=google.com; s=arc-20160816;
        b=hFl5S7/0GfsQ1X2D0LKimlE2n6v4IMHZhRvM1mh/I8oXvtOqorCECvbt1AQNFyq8W9
         arl+xJtUREAF5mv9bSAW059dLSVHBJp9VGVZaXWgm21JdDbivB/0qY5YdGU0XrIfuLK7
         JKReKckuXyZ6lNQQJZp6WVeXp3ijeDs1VFBfR/k9Wi4b8+2XwZgdq8IUAu4n7NczJ4YT
         QnHzCI1npbWQFHr4TZVMvx/FAcCa6l/kj6uwY+wfIvpZ+dPDJ73LGej/JTg3bLCKWPcP
         USevkGi5fuyUQaaNbVbdPWqzWEI+U5Mh1T9ZvPhCb4quQQrXDEpvA98UmwcpNko5Q27k
         NeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=1W7SaYVYg1Ojb9C+iua2/QJBrTLIwJEwC7pt+9FVXkE=;
        b=A98taDHIRveR3YyOLYRSRI9KU7gC26ab7Q+vcFPA0CV2pUNIUKChHYGekqmh/1/unf
         hHiolQH29TAiyKa1hD/2k6wIgkQ19YDLC4iHJwdSGpunvfnUBBtOsrofU4zRgQvl4Nlx
         1wttv2VRgooi5nOcQe50R9XuLryUy/cKMHpjtauRHDS686zeJnqRy7bQxZYfVqAWHeTk
         YxfdaKW7gJt2seYOtP7XVuwtr5WW672tK1y9iFpxeVAb9GhU2YCiri98RBamDkCqAECE
         tyKxuNNDQhg2e38VRWGs9UHk9/WaLIGuy03QMg5qaylfoQEKQ/76Gfc2KVFmVYYK4gGI
         9SPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si470688ybm.355.2021.01.12.02.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 02:58:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHNc-0001em-LX
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 05:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHB6-0003de-Cc; Tue, 12 Jan 2021 05:45:32 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56714
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHB2-0003Ss-JN; Tue, 12 Jan 2021 05:45:30 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 0124960283;
 Tue, 12 Jan 2021 11:45:12 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 06/19] target/arm: declare new AA64PFR0 bit-fields
Date: Tue, 12 Jan 2021 12:44:58 +0200
Message-Id: <20210112104511.36576-6-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
X-TUID: EGivSwtMe++x

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7afa26e08a..fecdd642c9 100644
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
2.30.0

