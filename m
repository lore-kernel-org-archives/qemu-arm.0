Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp399518lfq;
        Wed, 20 Jan 2021 14:53:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYubEd3bg6SnfCFvU0+0m5UHOVUSMUVbdtmYXsozZ1A6m4PLCIgBUZgIx1TW0YSRMqq4E9
X-Received: by 2002:a25:af42:: with SMTP id c2mr11961469ybj.516.1611183213609;
        Wed, 20 Jan 2021 14:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611183213; cv=none;
        d=google.com; s=arc-20160816;
        b=NEzb/oiUeGUDuZxnJpsUlvjyzFpKlQ9BZ2eSqFtcNaCvMKTZXrwLz6eCZt9xz5hP8j
         wGoJi8h5KL5nZHE2Jhpz7dJ2i1VVLJOM6/B3iSyap4+E/tGSuu+p+O3O1kCXS0mUUuzQ
         /01Qw5Wup4rAiOZI1RVF6oUTUN0EoFUJCnI20uYju8c1SEqdrD2tEcSC+nJBiQcFiP54
         3bYrsTndacMIm6j3mnb6R9ohyVWkIEfVY+94slFDUBdvVue3fIEZcX5KHyCoOKVVk+Me
         bF0gjPXRvICC5v2Ut+aOUrPcRSIiTSZD4BPn3wZ2K2+md3j/axwqWeLDIIc8RYTkYi5o
         iGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YGyYK3bV3fFcIkZXBMnjy61JEvYKbhrdFxVr7j2QsgQ=;
        b=GtC4nqI6QAjgNzQQ9BXW8XXkHwLPqEqfHiX1bBJRUC2I7qKxjMsikxMYxxTNVEhj9V
         F91JlcbKtNRRdGXyxfQCxQhgRHN3a7VIJcNWdbAu8hlYh8PlwzE6BgFoX7oos0/r2L5K
         fJ0r6Ab2g3jd8qaK6/5ZQwyjIuRYB7nwECpwi3gjhnFbPFmgtaOKwjreEhjwm/gUCUHU
         wNnUyh+qXjvhAJWB3ngh1mzUJRHCbnC9omBeBQKelKbvDDMoLsypiMePX9Qy99OqY1rA
         Mm6OnsmK/JNAIBB8m9H5Us1+agDj2jxq+XU8I4/QwFBB0vgF/nab2CM/PkY1xiYX6x3Z
         Kk+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k66si3114645ybf.34.2021.01.20.14.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 14:53:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2MM0-0003Ht-To
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 17:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1l2MDj-0003vW-LE; Wed, 20 Jan 2021 17:45:00 -0500
Received: from mail.csgraf.de ([188.138.100.120]:45214
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1l2MDe-0001VM-FG; Wed, 20 Jan 2021 17:44:59 -0500
Received: from localhost.localdomain
 (dynamic-077-002-091-253.77.2.pool.telefonica.de [77.2.91.253])
 by csgraf.de (Postfix) with ESMTPSA id E9105390057B;
 Wed, 20 Jan 2021 23:44:50 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/11] arm: Add Hypervisor.framework build target
Date: Wed, 20 Jan 2021 23:44:41 +0100
Message-Id: <20210120224444.71840-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210120224444.71840-1-agraf@csgraf.de>
References: <20210120224444.71840-1-agraf@csgraf.de>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wG8dl1gEV1Y7

Now that we have all logic in place that we need to handle Hypervisor.framework
on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
can build it.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)

---

v1 -> v2:

  - Fix build on 32bit arm

v3 -> v4:

  - Remove i386-softmmu target
---
 meson.build                | 11 ++++++++++-
 target/arm/hvf/meson.build |  3 +++
 target/arm/meson.build     |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/hvf/meson.build

diff --git a/meson.build b/meson.build
index c667d64498..8302fcbd90 100644
--- a/meson.build
+++ b/meson.build
@@ -74,16 +74,25 @@ else
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
+
+if cpu in ['x86', 'x86_64']
+  hvf_targets = ['x86_64-softmmu']
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
index 15b936c101..2efd6e672a 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -54,5 +54,7 @@ arm_softmmu_ss.add(files(
   'psci.c',
 ))
 
+subdir('hvf')
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.24.3 (Apple Git-128)

