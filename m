Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3663872lfb;
        Mon, 9 Nov 2020 06:13:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXbnNp4YE4lyiMyro1lCmekSOJ5OmRtKhal8+SD38FaupUmz+nhZH2eGIycaZxziVOhRWJ
X-Received: by 2002:a25:4e43:: with SMTP id c64mr18419865ybb.380.1604931196292;
        Mon, 09 Nov 2020 06:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931196; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/O5iNh0BSDbyr4rml9b/J7FjwsUbhhPbWnwxN58qeZ9CkPHGK/Scsu7ogNaN2315Z
         i37rP5jYhO5H4VpIFaCQ1lOi5ENlRTp4IKv2f1QxnsA/FDAT1GNyN7R+ArxETkWx3RGK
         ar+gREDAGFyaRXSb4VWZl4Iy5Q3v3QL5DJiow+0p/jUtytrmxTLfnX5GfMJDthkNwqGS
         shSlR99RCfLY6T/U8CywlvPwP19zM9iGHhvWA/jdo+Jw76riNyoKBfJPP4g5V60eA9Hg
         CThROuJRPpicPtVMSr42BYk6KmE2VcysSXoTIJYMNFFHgenhhQBC0r/RAX0VJv1jK4x4
         DicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Ow9TE/qiSJrjFRlNirFnl1zsE9aRU8G/XeyxDRYRsgQ=;
        b=L6ACKZ6yFmR27rPcUh/fjRiR7lyIIjPc3oVNI9MX4PnDv/Kn4eONMU5nhmT57BuHYB
         Sfx4MYPXwJU9YqXQwVeLZp02VOVkDNKorKI2bugmrn5mla6nyZZ2UuAww8COIEgfpAX9
         +WxpkjFUClQsHIOJMhiP1qiD0f5engXwO1LFUBMgGrhK6kYL+UTpuOT0Xn3T7SICDaXk
         zmICTH4RP+tgYwzIBF/+HaKdruxWSXtopgH9ZGruIvmGUh02nVOj+CBr6IdiIiOV4OQy
         ikbsLde/kHs58H1M8b14ZmKmZ7b+mAlY15/nUQn+UcpTk3fYm8lhCxLZm1UikLfeJO7R
         rVAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si8534875ybs.336.2020.11.09.06.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:13:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc7v1-0006UH-Mz
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sM-00034O-1R; Mon, 09 Nov 2020 09:10:30 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60180
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sK-0002nS-9B; Mon, 09 Nov 2020 09:10:29 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 52E6D60105;
 Mon,  9 Nov 2020 15:10:22 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 06/17] target/arm: declare new AA64PFR0 bit-fields
Date: Mon,  9 Nov 2020 16:10:09 +0200
Message-Id: <20201109141020.27234-6-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
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
X-TUID: y9kaBHRg9j/B

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a1ee436853..a74055df22 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1849,6 +1849,12 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
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
@@ -3881,6 +3887,11 @@ static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
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

