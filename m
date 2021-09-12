Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3184725lfb;
        Sun, 12 Sep 2021 16:14:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxABBIpNUD4ypffNiPX2J/mP8kbQnOAuaNweiJGLNbY3KI51fDp0nuM4e8ZmGKYn+u5kkMa
X-Received: by 2002:a05:6638:1642:: with SMTP id a2mr7139585jat.88.1631488461052;
        Sun, 12 Sep 2021 16:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631488461; cv=none;
        d=google.com; s=arc-20160816;
        b=qi2Rq7oVOgVToKUjv7edk+FsU8aWGZQIYwxZ/GrMR7l2cFm+yhusHm3LUcpecfveW5
         DN9siUYxTjcpfuIalLBsnCMTm76KbUbWO3gJVDUvu0DdLaO9yvd2kknxjFGKnLlXj7tk
         U5Dm+Xsg9z8/3sJ9uj3TUcAmI5prl1bwj39wSU+AqSR1HIY0BLYJ4vUaLzln+72Ke1PX
         jpmtDsagDlvcGkZJ55D3AbjPqjiQAuObwvPOLCnX57IdCeU4BZEkebUgZnszqcFVUa5H
         Ot3Oo5diMTUQfGacfiih4EfHeEAER1EKBmsIKtlO5Minj4kVe69wUIExPWs4pglxB2FW
         bDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2LoWYVw1BSrANo4EqnnCTCJwtu/zBGlXhjD4v+P91+k=;
        b=EswDM8nNqMj1ypiPzywOrBKpF1di0wq1a3woLhRpg8a1rd54hH446cPGFmWUVc45tC
         JFn7h6EpR/q17Eqmk0n9uCQrW8b+ea6lkJWsDGNLd5u3REvJxMHRqVKLECGHUzHMqR5a
         CGNFreu6/fX/H4HDrsN8BgjkfdgvKJDCQ3qSASuAbcghhikdI9BJX/Zicctwt5OwJufy
         0iZMzQKnpDxq4iW7C874zOCqkCM72BnqyZWYtySELhGTe1UZ63/nCh4e94mhsgD9r0So
         eeNsG3d0wE3OW6/lYkgCAFy1eysssgtrQ6WwRIFP1eUB8sExyeEHKIrUg4hXQNOt5te/
         JhtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si4959184ilc.6.2021.09.12.16.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 16:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPYg0-0006tf-79
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 19:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPYa2-0002P6-ER; Sun, 12 Sep 2021 19:08:10 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43580 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPYZz-0003IH-6S; Sun, 12 Sep 2021 19:08:10 -0400
Received: from localhost.localdomain
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id 46F876080849;
 Mon, 13 Sep 2021 01:08:03 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v9 08/11] arm: Add Hypervisor.framework build target
Date: Mon, 13 Sep 2021 01:07:54 +0200
Message-Id: <20210912230757.41096-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210912230757.41096-1-agraf@csgraf.de>
References: <20210912230757.41096-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
X-TUID: h+xvpEeCP9sG

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

