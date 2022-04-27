Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp839584lfu;
        Wed, 27 Apr 2022 02:09:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxORC/CZuxtzc/R8aiQnv17OTK4gU+jtEw1kEb6UJIKyvd+u/24VkIcglaSaILYomMt5QKy
X-Received: by 2002:a05:622a:1c7:b0:2f2:4aa:76d2 with SMTP id t7-20020a05622a01c700b002f204aa76d2mr18492322qtw.611.1651050597414;
        Wed, 27 Apr 2022 02:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651050597; cv=none;
        d=google.com; s=arc-20160816;
        b=HAd2p3fa6/CvTchHCvUN6/1no7itN+NMZH4393fXFRN4d86E2KBKuFpaRQBfL8FJS0
         S0Klvc1MlbiKR2msB84MjZb6nZhOZVPHG8NuIsgphW1r1Q8WAaYseYG9R7NC6mYS911o
         36CtynhuFL8JalnolbJSOHJod7MgOf+JVRUuH6PR5bsy4dcu4UMLbCqqPwvlMl0cEQ/K
         bcR8jIZPTkaSmuN39JzP3TQU3MXPSWNnNjOvYgm54WjbcSEypzS1sUnFUx4KeWCV0NcY
         MhrZB9qfVy6um5QzEdj0aeRryYwSF0vO4rZzNFQTN8v5JVAu3GvPckNaDn0So8OY9FHV
         VoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vTuy2Q3HKMxmWp0VRYSAap4dqyjc1PqEPVf4LD5lV0g=;
        b=U9CEj5qKP5dpnhs6DW2GOj+cdCTB1sa5dY9AuRYTfi24G9RGBOY5c7gH2YZfEWIUZD
         JOFdGR5Pu/2Qis0rydyzoT8qUG7QqaPi1h5M1FGAMZjFfGS7jzVaS1voHY6saqqeuTGX
         67/XQDDPyjtLNm1PICdeq9ewHK41T2hOoo+FmmAJB9z8tkISp/FPoVb7bxmtXtuGa35F
         KPJNRd1O5OVyb1FKiBFVhRMhL5PrLntc62/cix2Gx0W56L885XxbqmqGLcJ2DV01abxj
         PJN7o+scUKM/HWNyn8Oqc0tEhsNi6zyUj2WYtWwgY82DmA7B4FdLTt4tcLUV38Okhwpz
         XX/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="m/++t9Bj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a05622a14ce00b002ee8f28c297si219252qtx.428.2022.04.27.02.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 02:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="m/++t9Bj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njdgK-0001kK-Pi
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 05:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1njdY6-00065N-98; Wed, 27 Apr 2022 05:01:26 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1njdY3-00024i-Ec; Wed, 27 Apr 2022 05:01:25 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 746E72077F;
 Wed, 27 Apr 2022 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1651050080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vTuy2Q3HKMxmWp0VRYSAap4dqyjc1PqEPVf4LD5lV0g=;
 b=m/++t9BjlWk2HE9MwQCl3oYY4kSxAixJyTANJ2JCU3yxHNtT8TW4zS2i0Tg6XWzvkHcnQt
 zNT3YPkwokDwrs2I2iZ3PKe9fupQ8TE/P8omUCSu6N2fq986EVYAGMLpoZHMbr9GGumEl0
 Y/uH8D55jfuBnCPBALeak97xZCo3yf0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/arm: Disable cryptographic instructions when neon
 is disabled
Date: Wed, 27 Apr 2022 11:01:17 +0200
Message-Id: <20220427090117.6954-1-damien.hedde@greensocs.com>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m1GpeTrKx16o

As of now, cryptographic instructions ISAR fields are never cleared so
we can end up with a cpu with cryptographic instructions but no
floating-point/neon instructions which is not a possible configuration
according to ARM specifications.

In QEMU, we have 3 kinds of cpus regarding cryptographic instructions:
+ no support
+ cortex-a57/a72: cryptographic extension is optional,
  floating-point/neon is not.
+ cortex-a53: crytographic extension is optional as well as
  floationg-point/neon. But cryptographic requires
  floating-point/neon support.

Therefore we can safely clear the ISAR fields when neon is disabled.

Note that other arm cpus seem to follow this. For example cortex-a55 is
like cortex-a53 and cortex-a76/cortex-a710 are like cortex-a57/a72.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

v2: also clear SHA3 / SM3 / SM4 (Richard)
---
 target/arm/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e3f8215203..e46a766d77 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1587,6 +1587,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_NEON);
 
         t = cpu->isar.id_aa64isar0;
+        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
         cpu->isar.id_aa64isar0 = t;
 
@@ -1601,6 +1607,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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

