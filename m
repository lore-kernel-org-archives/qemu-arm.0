Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1839038lfm;
        Wed, 19 May 2021 13:40:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQffY9EtO3so5SJWr1QlqEQabiwzVHbJ0Cj4zYJm5lDvV894OIByxY712j5KWmKqk+PsIJ
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr1126742jak.91.1621456830937;
        Wed, 19 May 2021 13:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621456830; cv=none;
        d=google.com; s=arc-20160816;
        b=MZAiknZHrBwIs3qCBBWwm3XFX5CD4rqamIClfVgebKEUTG5AOzz64bx6B/4lzy2jeo
         4b0R2rwjIG9YTy1LSuCKWjRWSdF2quX1Htbd4kGBFR6IqQAGwq0GstznSPAy2yh+tOkB
         2wiqVA+VJNFb+xrrZiFO1DlQup+oeXMVySmwr2dMHkjwJLMLktNHBoap/X28Y+eAzcbr
         aCb7iPPdrOVYaO7CrnK6SQmMVL4b3ZzoTeGtYdjzfu6lD5bvLalWh9JUlMV7obPavGJf
         WzDr2ejxm12bgpEzkT/I7AqdAXp1VmQWFhw9yYlwvfbmjGg1C2eBagHQ8TfISZJlQbf2
         /anQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=mPRGlLF8vmDfE3kgHFgFq1bo2JfODZ7yDYH2j0Rjp2I=;
        b=IuuVady0+TmZUu6CTQwMPRNLGXh7VhxlinWGDqbt/XUoNza43DOrrS8+dzQEiPr3Eh
         i7zo7ZgCj7KcpyV4EYWt2JmOdudM73kufCAVxSPPnpFUtM3g+UPOmOm+zYSs9hX2Hy9M
         LoXESuMIjibkJQh5n7FneooC14n4Fs0S1unjUpNURjbjECHXlbsYxxfuHlyWHyGmJ1aA
         R4H0XoDimA96e0J307aEtnYd9OX9yqRuYjSXUftsviMm457VySaqcccVmzRemUPHVhgg
         9pGMZrvKFqKkWRdf2FfzOp4uAx9jn1qrTmo3QuSZyGb2SFXd03SSrjdyk7mQ2OsPt2Z/
         ryqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si803412ill.70.2021.05.19.13.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSzW-0005Z2-9d
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSjR-0005ZY-IJ; Wed, 19 May 2021 16:23:54 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48272 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSjM-0003J9-4L; Wed, 19 May 2021 16:23:53 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id 09A886080780;
 Wed, 19 May 2021 22:23:06 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 17/19] arm: Add Hypervisor.framework build target
Date: Wed, 19 May 2021 22:22:51 +0200
Message-Id: <20210519202253.76782-18-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210519202253.76782-1-agraf@csgraf.de>
References: <20210519202253.76782-1-agraf@csgraf.de>
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3yOxDOUxpRVf

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

v6 -> v7:

  - Simplify HVF matching logic in meson build file
---
 meson.build                | 7 +++++++
 target/arm/hvf/meson.build | 3 +++
 target/arm/meson.build     | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 target/arm/hvf/meson.build

diff --git a/meson.build b/meson.build
index 698f4e9356..d28bd068ff 100644
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
index 5bfaf43b50..48004bf0e6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -57,5 +57,7 @@ arm_softmmu_ss.add(files(
   'psci.c',
 ))
 
+subdir('hvf')
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.30.1 (Apple Git-130)

