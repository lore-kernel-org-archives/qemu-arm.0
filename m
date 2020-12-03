Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp115730lfb;
        Thu, 3 Dec 2020 15:49:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIeauLdEYcrdfbOpvbvi3nwjUmUdcoi61YXjyLd9nMVa/HpWe2Byp48pNsX3o09Ao4ETkh
X-Received: by 2002:a25:8809:: with SMTP id c9mr2227669ybl.521.1607039365825;
        Thu, 03 Dec 2020 15:49:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607039365; cv=none;
        d=google.com; s=arc-20160816;
        b=pjv/Tl+7MiwmODr5UIZVRzSWdIQv49Gy7oO/3oy+xJM7bWKQARwcqmN6NfdvQLx03l
         0l48FpYeYGOa+FnDV272epwIfyEcmIlOcp8JX4hjU6kJMAmo5jdvAMawnyRm626li6o9
         ofqCerOzRfNKsjTOna0lTc2+5Ewgew4crWT3axuL38/tvmmZ1DuZDiCTShoSFJlVuWoR
         vuz/yzdkAowR7C2x+zckbxdf4qtGfYHcqMbNA8Dr1aRABrzC78N/yeavLu7oTYAlMlnv
         TW5g10Vv+Ahsa+C3ySMn8TQSuVVL6pXjgFAcWdBWF27UVWFy80sqfQgiF3wHcMVGL5p6
         9gxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=GTfqKyFKNOzKHL5Pwlcirup91cpEepmZOcBaWv6EmEo=;
        b=QNvgfg9peiiYbE73PSUqabnOI3B30Fg5MLY3WSXykxImW7fVTfiQnN7hHwqnDwg79X
         l87Dj8HgM6kAihVrXFTKZWz1cLz7lfjeVX38agpjSWnoGrorCZXizRdyh4kduyWUupdT
         CHQ+EequS67jAVgviM0SikIn7tLgV+r18r46Vq/B4uirTP+SCBfqEHX9wgh6s0jhnnP4
         4R4t5fSsSljyJ4Oxz3RVXY6F/9WeRpnAmaVu8QuzojebiMth4jw4pxkiP5uZU49dfjqL
         7J4LGSlxX6AMrCVnA52lX65Yl4KzlaDccZkEgtkbWm34dzeOMiHp+W1ldm/+WW1aemN7
         iM5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g31si397923ybi.59.2020.12.03.15.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 15:49:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkyLl-0002eA-4y
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 18:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLV-0002Ys-Sn; Thu, 03 Dec 2020 18:49:09 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57578
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLT-0003Pd-Uu; Thu, 03 Dec 2020 18:49:09 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id A61433900517;
 Fri,  4 Dec 2020 00:49:02 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/11] arm: Add Hypervisor.framework build target
Date: Fri,  4 Dec 2020 00:48:54 +0100
Message-Id: <20201203234857.21051-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201203234857.21051-1-agraf@csgraf.de>
References: <20201203234857.21051-1-agraf@csgraf.de>
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
X-TUID: 05r9Eic+24LU

Now that we have all logic in place that we need to handle Hypervisor.framework
on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
can build it.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

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
index 86d433c8a4..a2323e8d23 100644
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

