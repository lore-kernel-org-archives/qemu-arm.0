Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1785025lfb;
        Thu, 26 Nov 2020 13:51:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN+v+LN5holVSgL7KrC899lT+XVfMoNWVWlXIlP8/Axb0YbaqGuPPYIM1bx+yEhQ0+daZJ
X-Received: by 2002:a25:b83:: with SMTP id 125mr8185286ybl.102.1606427467555;
        Thu, 26 Nov 2020 13:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427467; cv=none;
        d=google.com; s=arc-20160816;
        b=eCr8yeyIXhyDlBE6MZLjbCbDFoucEhdx9lRpIOXGzPjksdGBYC0LV8MMQk0LuClsRi
         G1YwFEQBLMlj/WZYQbdXIZhKdcfIPvuO0WitPn3Q3NwsZ+ai49R/6Nl1wt/MB2xqCtPX
         Y9bvy6k+9k+u/rdew8wrnR3VCsm025GymHNa2h6y2VD2LPAGCmMCnzmYP9bxQc6Rvuxw
         n2m1o9PVRpnzmIHYwoOmKMrsqk5KJfZ2ma4u3TCkiKXi2qJT0Zy/nOZMeBf1IZhQozAg
         HHqxN2A2sbOrqyy8EpWbMtof3SQwUAQcmaGqI9x9Q246asPByp/FdoZeMiADPIxT6aWm
         P0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=RYW4eH/ZsrKQzuthW1O+bv7Xe1lYlj3a8avPcP1Wggk=;
        b=XI5bt64neE0FvZZdnwlTCIWhzmFP0yXccTQiOs1HN/WYRWQTli7tJOtalOoW5wZnJ4
         4iHk6WFSOGYWn8EmtQqPxr12CVQmzEOeM7rerB8MxViIa91t/xAq8eXJOlAnSvIpwFwH
         U5pgBW19vN0am7fJIKkTKuhWSh4PvxA+k+cVv+xTnesc4SWdS3sj+I3n8Bx03lyWSiff
         18OVGQEPpTEutszQ/HyaOJjwiKnRZyEdhXeui3c4HnC07ZFPscmEC3f0HK1a6/DQsrnN
         gIatcLj0xk1owRsbYbvgx5jh5fh2QEDEmaHIdnvBhcE4NkfewkoEQ5eZzatb8DG6CIav
         8hyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si6290991ybk.30.2020.11.26.13.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPAQ-0002gF-Tt
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9s-0001sn-74; Thu, 26 Nov 2020 16:50:32 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60638
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9m-0005nf-8y; Thu, 26 Nov 2020 16:50:31 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id 60BF439005B9;
 Thu, 26 Nov 2020 22:50:21 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] arm: Add Hypervisor.framework build target
Date: Thu, 26 Nov 2020 22:50:16 +0100
Message-Id: <20201126215017.41156-8-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +S1Lg32KNuCn

Now that we have all logic in place that we need to handle Hypervisor.framework
on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
can build it.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 meson.build                | 9 ++++++++-
 target/arm/hvf/meson.build | 3 +++
 target/arm/meson.build     | 2 ++
 3 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/hvf/meson.build

diff --git a/meson.build b/meson.build
index 2a7ff5560c..21565f5787 100644
--- a/meson.build
+++ b/meson.build
@@ -74,16 +74,23 @@ else
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
+
+if cpu in ['x86', 'x86_64']
+  hvf_targets = ['i386-softmmu', 'x86_64-softmmu']
+elif cpu in ['aarch64']
+  hvf_targets = ['aarch64-softmmu']
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

