Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp200927lfu;
        Tue, 26 Apr 2022 05:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX7tV2HfvtYHTFdnN9dq0B9PJ4GS38h1djXJ6YXbL8WTlhKr2yFTX1gfVTM1DE8RoKT+8p
X-Received: by 2002:a05:620a:2404:b0:69e:8102:acaf with SMTP id d4-20020a05620a240400b0069e8102acafmr12637832qkn.528.1650977358797;
        Tue, 26 Apr 2022 05:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650977358; cv=none;
        d=google.com; s=arc-20160816;
        b=XNGjElZuN9P7ZdxVv6wdm3W57GpU0jIDg9Uwe7wC05jPoVqIQ8TsxA0WEdMgzFh87a
         e50gDmuJmQcLp6BaiInBJ37jW2of9WWfyDmvNO5vyD8zAtInpvOe6xo2lrBR5dWMf/3w
         1g080pY2v5xjG3VZRS1507NMK2R77qAOSAAF5+JZjch5rlgwfrODC83PFxt6a9ckzJYE
         x7h6hvqJPBTSDH/CmguYh2tXFnoBY0vAD8tygadQQyPRBzmHtoiy+6dA0uTMJl4GozaE
         UyeSP5B2qCpV9Jz8uUQN+Ta0y8nzQ8x4br6Fx/XTgvrnIHf5Ckj66pRi87CS5faPclO4
         NgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=RWHtsDu+LE670syEAcFAHX7KCWw0niSW9QAOQGqfOwo=;
        b=bKcjElP5dpTePMg0qxWBg62diWxI+uLbzixGtbB+C3tLzh+sSCqoNigjwi/wz8sdbi
         mTukBBjygYKg5I8lBJtSp/fypUGrgsm9Eq9V5s6U4pp/ax3EPOsmOxWpYt8eagdMQ7C9
         K9EUbd1+dkmeIRkyVeDkPd3hgEjL2NSGOjmOBLGS5M85EPPJff2CPnRxDRLcNiw5GGEn
         +651Ye17Y43WvqZdT8z4qLjCo7CKSbrJMTzKosWyiVBd73z2nb32XMGxApoNYtLL0Xe2
         fjl6AX7R1DUkZuzNnigtrvAwHhXfNgH7vL2CYs5A9rU3h7EjCnlCla451R1IWlUz2Amg
         CIAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=c3Z8POyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a056214212a00b00443c8df303dsi5301014qvc.248.2022.04.26.05.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 05:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=c3Z8POyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njKd3-0000Xy-1k
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 08:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1njKX6-0002GZ-BF; Tue, 26 Apr 2022 08:43:10 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1njKX4-00062J-DH; Tue, 26 Apr 2022 08:43:07 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 725ED2076B;
 Tue, 26 Apr 2022 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1650976981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RWHtsDu+LE670syEAcFAHX7KCWw0niSW9QAOQGqfOwo=;
 b=c3Z8POyByBGITkrTFYZCoMhbE567YLoYG0Tw3FaiNvjz42LdDEFV8FY/hDt79R4gJDTMVn
 TGdqVr9EbDkhLmOPzyzmT/aNagTKeC44AP/mbxAsZenJkgIByIv/4GzSAanskwmkI/9+Oh
 aZE771O7KEJkNrnkvie1Oyv12ScoVoc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Disable cryptographic instructions when neon is
 disabled
Date: Tue, 26 Apr 2022 14:42:59 +0200
Message-Id: <20220426124259.44087-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uyYEiu7S7ptc

As of now, cryptographic instructions ISAR fields are never cleared so
we can end up with a cpu with cryptographic instructions but no
floating-point/neon instructions which is impossible according to ARM
specifications.

In QEMU, we have 3 kinds of cpus regarding cryptographic instructions:
+ no support
+ cortex-a57/a72: cryptographic extension is optional,
  floating-point/neon is not.
+ cortex-a53: crytographic extension is optional as well as
  floationg-point/neon. But cryptographic requires
  floating-point/neon support.

Therefore we can safely clear the ISAR fields when neon is disabled.

Note that other arm cpus seem to follow this. For example cortex-a55 is
like cortex-a53 and cortex-a76 is like cortex-57/72.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Note: if we wanted to provide such configuration, we could have a
has_crypto property/feature to represent this.
---
 target/arm/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e3f8215203..e789d18851 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1587,6 +1587,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_NEON);
 
         t = cpu->isar.id_aa64isar0;
+        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
         cpu->isar.id_aa64isar0 = t;
 
@@ -1601,6 +1604,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_aa64pfr0 = t;
 
         u = cpu->isar.id_isar5;
+        u = FIELD_DP32(u, ID_ISAR5, AES, 0);
+        u = FIELD_DP32(u, ID_ISAR5, SHA1, 0);
+        u = FIELD_DP32(u, ID_ISAR5, SHA2, 0);
         u = FIELD_DP32(u, ID_ISAR5, RDM, 0);
         u = FIELD_DP32(u, ID_ISAR5, VCMA, 0);
         cpu->isar.id_isar5 = u;
-- 
2.35.1

