Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1428861lfb;
        Wed, 2 Dec 2020 11:13:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzC1zL7fGxB5C6Mh9WP607atqQiew5HBbg3kUTqjYW0RFWPfA7RmVCzHOH1FPE/+DYXDpjI
X-Received: by 2002:a25:504c:: with SMTP id e73mr5511571ybb.376.1606936422881;
        Wed, 02 Dec 2020 11:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606936422; cv=none;
        d=google.com; s=arc-20160816;
        b=vT+/gptPgBKDWGxPx2bdT1vr+wSE07ghmjKtyl2kPbgVWMdnwkHO0xnc02ujSU5t7z
         hYaRBUc21yvcqaXUP2aWQ0MhRr2QD4F7UsYDFVCxIkLIakDCrOI2ZNgRF3qZPxE7+SHI
         P51LxVy+lUzmR/myADdJ/9uF99n+FBgJhQN8iy085Jne48cXwGgGZG+NIYKCBNs2jGwP
         ldLQS/5AmPK6SZwvoMIPmn2cRCBcwoD356UV/AEMT2k+3tyI6LsXBQ5sKRryQwXT4m2Y
         da8gxxOtqdlKgM2J56h7cPP96lsrLyfwsekDTn7g0V3QvYyibW5fy6UThj4QjSDfO25W
         WJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=M6CtsqwYFfbA6GShf6isgleZKH/oVcsPkzsiDU8f23k=;
        b=0SGPklAsglmbenq6Z6r5L3la2JvR3zrU65GRVIpSBNvQTeZo60enEvWPhlkGaPtlgP
         tBeJy+TwU0HVZFV9815CMLww+rR0mQL35Sp6RkBGrVC3R9m+P3qo4N0TnV2S9lNOUrwE
         8gGCeuWTooGYSi468BRqRIUSsRl7XVDYGmCpPh/ldsUOZqT0VT56tk4QBpBKDyCS1qnF
         eWlGK9FD5OFxl9unsqyyq+wd3N0rQViYtJe2qHsHB078GcJl2/wfML7bBs1F9KdSiMkD
         lTEYSdwAJBzx3hf4Z3mYHHZjD4KkFo3a6/xAiTcbpvKXJsPnJtPiKGmrMoQmP81yT27P
         BTHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si3239826ybj.342.2020.12.02.11.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 11:13:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkXZO-0003ag-9I
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 14:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXQP-00039j-SK; Wed, 02 Dec 2020 14:04:25 -0500
Received: from mail.csgraf.de ([188.138.100.120]:56478
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXQM-0005GY-UI; Wed, 02 Dec 2020 14:04:25 -0500
Received: from localhost.localdomain
 (dynamic-077-007-031-140.77.7.pool.telefonica.de [77.7.31.140])
 by csgraf.de (Postfix) with ESMTPSA id 1453D390038F;
 Wed,  2 Dec 2020 20:04:18 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/10] arm: Add Hypervisor.framework build target
Date: Wed,  2 Dec 2020 20:04:05 +0100
Message-Id: <20201202190408.2041-8-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201202190408.2041-1-agraf@csgraf.de>
References: <20201202190408.2041-1-agraf@csgraf.de>
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
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0rmcsZjAYq7i

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

