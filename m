Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4710102lfb;
        Sun, 29 Nov 2020 19:08:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQkxwY2MySCatVzZTa11YOVNhwsiD64pjFUDz0mAm2t2xArE4z3koYzcAWghwuDnzZjr1/
X-Received: by 2002:a25:d0c5:: with SMTP id h188mr22684330ybg.13.1606705738789;
        Sun, 29 Nov 2020 19:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606705738; cv=none;
        d=google.com; s=arc-20160816;
        b=eF0fGAXJQGXqdXkt/BZyMFWwwN+z97/ElUXEyiH1LMQxQ36xbrUVcpVnKF0StbZpG4
         BgDc6mBraT8hYpxFKYTovcTDDW8GK55GJUPANQ+0yC5G948N6laBaXGYAV/9CL4RkceS
         MM35oxfqnd1mZToJrVqKvGircus2n9tWkZQRhL0BQbbJcRlCdwnM2EDrr8gzjxkBSRUC
         IPu4TzDGnDSvdBruJ6VV0DQHDy+/p6YzhCVePoXkCyrL6qTFpHPiwW1sKnzu9hfWTgTe
         H5DJML2i/8iiWJNt2zJA/28xDsqfGeLjEpnwEnNt/DSQrMASGtaiUZiJLhlNW78LRsYG
         prgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=M6CtsqwYFfbA6GShf6isgleZKH/oVcsPkzsiDU8f23k=;
        b=l0Tvuzt0bMc2MRUqdfk5iYQuRau3vvbM1GoW4hHLv1Y07Yn/a3i4JHnvmn0g6o9qEO
         aGOGwqrI0g8/YIxB7bq/JQ0j3UWJPIC05LAD82OZ6474FffpKkuEF977wVP4wW2YdyOb
         uiKiNrv2hu/yrjgM1ugqsVK2IJQV8MRd3lyBFX4NudEwXoPIUz6WuumWGKcBaMsMI/Ja
         neuYFKSyIqvSJQFrHTkVTnhyYGzCXQr2Ff9QOkoxbYaKn/VFXT3oWlLttwHs8+GrUT8x
         LC+84iQqRhi1aBQO84/gBMv8x2DCedIWOH1Ht0tASpLDoREKu2dBg/z8OK9c+0EaIxWI
         ri6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si18473563ybl.338.2020.11.29.19.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 19:08:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjZYg-0001Cz-0e
	for alex.bennee@linaro.org; Sun, 29 Nov 2020 22:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZXL-0008FM-Lk; Sun, 29 Nov 2020 22:07:35 -0500
Received: from mail.csgraf.de ([188.138.100.120]:35392
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZXG-00078G-Er; Sun, 29 Nov 2020 22:07:35 -0500
Received: from localhost.localdomain
 (dynamic-077-009-091-089.77.9.pool.telefonica.de [77.9.91.89])
 by csgraf.de (Postfix) with ESMTPSA id 7BEA539004E4;
 Mon, 30 Nov 2020 04:07:28 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] arm: Add Hypervisor.framework build target
Date: Mon, 30 Nov 2020 04:07:23 +0100
Message-Id: <20201130030723.78326-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201130030723.78326-1-agraf@csgraf.de>
References: <20201130030723.78326-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xrfHX+EqxDLg

Now that we have all logic in place that we need to handle Hypervisor.framework
on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
can build it.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - Fix build on 32bit arm
---
 meson.build                | 11 ++++++++++-
 target/arm/hvf/meson.build |  3 +++
 target/arm/meson.build     |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/hvf/meson.build

diff --git a/meson.build b/meson.build
index 2a7ff5560c..bff3fe7089 100644
--- a/meson.build
+++ b/meson.build
@@ -74,16 +74,25 @@ else
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
+
+if cpu in ['x86', 'x86_64']
+  hvf_targets = ['i386-softmmu', 'x86_64-softmmu']
+elif cpu in ['aarch64']
+  hvf_targets = ['aarch64-softmmu']
+else
+  hvf_targets = []
+endif
+
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i368 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
     'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_HVF': hvf_targets,
   }
 endif
 if cpu in ['x86', 'x86_64']
   accelerator_targets += {
     'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
-    'CONFIG_HVF': ['x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
   }
 endif
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
index f5de2a77b8..95bebae216 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -56,5 +56,7 @@ arm_softmmu_ss.add(files(
   'psci.c',
 ))
 
+subdir('hvf')
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.24.3 (Apple Git-128)

