Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp419529lfp;
        Wed, 15 Sep 2021 11:52:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0wdsIfWum11VJviAq64sVBNH90Yd//iGBNWG96k+QznYlvVQ7rM0D0XyXm4nk3LqcdVs0
X-Received: by 2002:a05:620a:2ef:: with SMTP id a15mr1433593qko.221.1631731966544;
        Wed, 15 Sep 2021 11:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631731966; cv=none;
        d=google.com; s=arc-20160816;
        b=rIhmMlJnbyD4BZh9aF07Qp792lwYE5TGTdIXqYIhtdWlZ1s2ZlXsshUTFctLqj48Fu
         mucnl6nGlQ0oYLefkBIMbU9f7jou6OmAxJeds5iPIWWP+E9Si+OxevdOGoolgUlWeSR9
         TWRCA0uarkLWhH2li9avFbcBxdGsD8ynYXs69OYTiPEq1p/XIsFv0yFEQLqx1iQ78qHn
         RmHLbJkXOsdQyk2rUPa9J4ODjk1Elm6HHqf4GOI/e69IdHlfwm92d6wO8xnA3Of+7YAT
         GUrxbTn8oa5jqITFrvv/mXJwqDPuaaqlYLkU0aVniNqhAJDVy7ijg9LsabPL42Sa3U6n
         /6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LR60cNcaqGvw2zVzs8hPhVdY8Y7KWBHKRBtxojOtI4I=;
        b=eADVjh0mholqCH77yuuhBt8e60JuI1LUJZqE+2rAZyKJqqpCjLynmSf3NO9uddYxJK
         AGodg0sAFCwMGDq2vYql8M+wwZDD3WiznqsfBNtgNA+FyNzSuzIJY5fC5DUC0KVJCr1c
         yTFBy433RPUCBHZ4E0JGiyUfkcdDuHAAPUu3EchXQqagloaAqA60gOgT/HG3mbaPPcd0
         WkEKqPGy5kukQ755IdEApRUloM0qBTY+fYd9tBpIN3+U+JlfZ1XhI6QeA3z3uOjBqvLD
         SdxRXMJiw4MOKiPf3pGNDUv52KUreLEvtLTmwecmQpVXEQb0ZH+2mHny6cw51ijafgO8
         ZrfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25si387617qtg.373.2021.09.15.11.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 11:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQa1W-0006o0-1T
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 14:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQZNA-0006eM-7O; Wed, 15 Sep 2021 14:11:05 -0400
Received: from mail.csgraf.de ([85.25.223.15]:50724 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQZN4-0003Rm-0M; Wed, 15 Sep 2021 14:11:03 -0400
Received: from localhost.localdomain
 (dynamic-095-117-089-091.95.117.pool.telefonica.de [95.117.89.91])
 by csgraf.de (Postfix) with ESMTPSA id 1B22D60806E8;
 Wed, 15 Sep 2021 20:10:56 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v11 08/10] arm: Add Hypervisor.framework build target
Date: Wed, 15 Sep 2021 20:10:47 +0200
Message-Id: <20210915181049.27597-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210915181049.27597-1-agraf@csgraf.de>
References: <20210915181049.27597-1-agraf@csgraf.de>
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
X-TUID: PunLCCl2vmBV

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
index baa28d7d62..15ef4d3c41 100644
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
   # i386 emulator provides xenpv machine type for multiple architectures
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

