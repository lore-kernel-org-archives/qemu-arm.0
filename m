Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3616352lfb;
        Mon, 13 Sep 2021 05:22:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmlMmcwHz84IB3QKo9h3oxOypEigQlW0L/F6D/t6xFObJLNS243lXAddNhWZmCSGsK9mPe
X-Received: by 2002:a0c:fb4f:: with SMTP id b15mr10202479qvq.20.1631535721199;
        Mon, 13 Sep 2021 05:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631535721; cv=none;
        d=google.com; s=arc-20160816;
        b=g0u7b+VCEhJfEwDrh1R/OftrsIiFHuWklR1F/OvHn9MzNA+MOb/uDOQpMZn5gPN/Hb
         T97hJnd8/oGa/PKkuPhATWSBRQeSI2BZxOF+4AIivZhikLcIQRNJ+v6puMJxDdey5WA/
         W6wCeATon5+dbQ9Dr9syKG6AT7tDwr6a/GWRe/kMQPnON735yCXE/8bbdtKVLnbOPKkg
         xpcvZEBnM5HGDZNp8STwzwSvzsLXVeBAvSIB/9k8/VYrxEbhEMprFzbmfcp3ihjfut+2
         ocZPiD5mKsa3at7em5gY1zkqkwbSrJhjfmWA+czAEFxOxqcIZVeP2E4SBqg/L8QQM8mz
         ABPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2LoWYVw1BSrANo4EqnnCTCJwtu/zBGlXhjD4v+P91+k=;
        b=Tij+K7Oa95ifVlan/r2WsNrI1UUvynrlcd9z8LIN32XyHjyORaYtxAcR4Lc237We/2
         jk2WUPFRoFlsST7ag0H+G5Vc0nv7GEVAyCSZ0ZemJSWL/KU3ivjgAsp68SYK7i9zSbLj
         2xT/5cG1pevewvi4CkebaL8SQf8JMjRjvH/23fctdjMzUyNbzkrG+fFBkh46Q9UbRuYh
         DNaLbQZeTELuEGJuLmfMvHiOKLPHSftWiJZHDTWfIfyAjQIR0ya5xo7Hf9UmpBHa8Fvy
         +50DcuISmALBZ3EG7OQAWfi32j7Sb+YfdUux457fHFev9bW8XTU3Lcbjn8eO43KwjSkp
         ncuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si2010665qvk.193.2021.09.13.05.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 05:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPkyG-0002YW-F4
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 08:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPklY-0002PN-6r; Mon, 13 Sep 2021 08:08:52 -0400
Received: from mail.csgraf.de ([85.25.223.15]:44084 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPklW-0004lS-Gk; Mon, 13 Sep 2021 08:08:51 -0400
Received: from localhost.localdomain
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id E17C460806AF;
 Mon, 13 Sep 2021 14:08:48 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v10 08/10] arm: Add Hypervisor.framework build target
Date: Mon, 13 Sep 2021 14:08:40 +0200
Message-Id: <20210913120842.62116-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210913120842.62116-1-agraf@csgraf.de>
References: <20210913120842.62116-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DsbOOdz6F8Cu

Now that we have all logic in place that we need to handle Hypervisor.framework
on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
can build it.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Sergio Lopez <slp@redhat.com>

---

v1 -> v2:

  - Fix build on 32bit arm

v3 -> v4:

  - Remove i386-softmmu target

v6 -> v7:

  - Simplify HVF matching logic in meson build file
---
 meson.build                | 7 +++++++
 target/arm/hvf/meson.build | 3 +++
 target/arm/meson.build     | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 target/arm/hvf/meson.build

diff --git a/meson.build b/meson.build
index a3e9b95846..cf91256c9a 100644
--- a/meson.build
+++ b/meson.build
@@ -77,6 +77,13 @@ else
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
+
+if cpu in ['aarch64']
+  accelerator_targets += {
+    'CONFIG_HVF': ['aarch64-softmmu']
+  }
+endif
+
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i368 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
new file mode 100644
index 0000000000..855e6cce5a
--- /dev/null
+++ b/target/arm/hvf/meson.build
@@ -0,0 +1,3 @@
+arm_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
+  'hvf.c',
+))
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 25a02bf276..50f152214a 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -60,5 +60,7 @@ arm_softmmu_ss.add(files(
   'psci.c',
 ))
 
+subdir('hvf')
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.30.1 (Apple Git-130)

