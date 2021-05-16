Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp655471lfm;
        Sun, 16 May 2021 13:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCsA8G939N1cMveQysT807D5huPO5dE+MDzmPJOzXwn9tq/YS6Yre6HCMnueE79KQXCMDJ
X-Received: by 2002:a05:6e02:1b87:: with SMTP id h7mr17831177ili.185.1621195637144;
        Sun, 16 May 2021 13:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195637; cv=none;
        d=google.com; s=arc-20160816;
        b=eQ7xED7+v3FORfz65PVaVwf0baVOzr3v7EyaYEq9UIpx6kDLbIv2JCKeIqy0dn47pJ
         Hun2ixBGUfucHOjfgikhRjNb3jImeBUi73fIK+79Jgnfq4h+843vz4S+3nW+PsI2tS46
         WxoU/gyS4Y3xIxiTLckxSdL30MubJkv6yh04b7Sqw8aRpxbCuSH7qs9sh9TvgdGzNPGA
         RMYNGWH0Ptiz06iIeXrsHiqCZFtmmd5Y2OxD35e/iJbkxYeJXElQE6X5B2G+iKBeNyGi
         QOt3OCnR9CgX/blEu8j7/XlwDdvKds8SC7jnwRUgQDou3JdVHnuPkC1/DpMjkaGuPLO/
         ZHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+IClyz7gDZOqqJWtq3bDYMuvy9eNDmzEv425/qCS1Pg=;
        b=A/KUZDhhSQdShj5f25o5MFVKkIJoBphU2wKpGMQ8tgOLn8C1yYascNrA5vz6jfczsf
         N5KYwABCdlL8mnpbCWPEEZhSaPaPN2x3Cv+wz5K2rSY2+H8gMzZWuwsWHBSXCx3l96rW
         WN3lSkyN2vSedtaqZoT6kdoK3gI3YvMxvg9BArjFBhhQipz98K4CAkBIgDEQHdhBX5UR
         YXzxg92nb3oDzqt9sphTUWx8EpD57luZYHbzAknui2M2sIa2gC8qUrrZFEeT7v8BgriP
         INw5AvhL+4wvcM+jC91uvN6b0Ho9KwaTZAul0OsZsMt5FpOxVvflsfQy5L/OK8Lh03PS
         bVgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si14855061ilm.111.2021.05.16.13.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 13:07:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liN2i-00032e-HH
	for alex.bennee@linaro.org; Sun, 16 May 2021 16:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMvR-0003om-0q; Sun, 16 May 2021 15:59:45 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45478 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMvA-0008KF-QB; Sun, 16 May 2021 15:59:44 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id 424136080684;
 Sun, 16 May 2021 21:59:07 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 17/19] arm: Add Hypervisor.framework build target
Date: Sun, 16 May 2021 21:58:53 +0200
Message-Id: <20210516195855.28869-18-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
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
X-TUID: J9gKRP4Sw4TU

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
index 0ec7002286..551ad458ea 100644
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

