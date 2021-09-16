Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1259304lfp;
        Thu, 16 Sep 2021 09:04:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5epUC6v6AeOHOcQ+90CGZKUV5ASV7r5mUfZzK9m6SAGDGq+FmvTHQAb6HhL0woKF4SWNn
X-Received: by 2002:a05:622a:34e:: with SMTP id r14mr2715704qtw.126.1631808272132;
        Thu, 16 Sep 2021 09:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631808272; cv=none;
        d=google.com; s=arc-20160816;
        b=H+iiLhIea60lQ5xt1ehtTwfo52sh23Rb8uLL/rxMmtfPTw0ZQE/dH8qnmHRG2SfCvQ
         wxH24bTjbSUkumkm92k1ETvJHCXexPKjov+Cl+u30UCM8fbEtprR005sptawxlhJSGB1
         dCWJIZYw6p+rX91jTwWCFqpEGtfUWdrAH8Ii1JwLkWCDaSTCAYkTX3Csk/OlmwdNFUko
         aDPYqB2WCzryyQZ3vGOA+qqELMvhWpBSSa4iqRlodpvQMvKwEYTq7DIBxumus9aExXqW
         DqKGl3gOFLuIu+DRdezTFpz5nRwyEgfsKVsvr4A0+1nmCkgudSqr8IVmDvWRKvLOx0be
         miUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LR60cNcaqGvw2zVzs8hPhVdY8Y7KWBHKRBtxojOtI4I=;
        b=FYsSM/jD9aVtpo4T0ot69dOkeuTUZTn1shxodoxPQ21tMXBP5f8MiL6XHoruq+aw8h
         ZpiPIi43I9Wc3e0rWujE+wIr2qvPK8B36Fj9g3RSlEXzVVB/TmK/u7G/SytMdjinhCKL
         iS/Fk/2mVv1qZRhu55bv5i8/jQU30Or3p6DDEW+qL73h64GjhUM2sd3zW6XLpxI8MEMw
         SAMVeJcRxRajCwhU+D21iAKO4k7LeJPZssVFJ71cgBldZjg9fxZNA9wnrPOXEwVX16sg
         mRFr9dFM9NInEY4RlDEJtnyE3XOdhAbOt5gd1Nhosl8NcnwLHHuIygZy/MsvUp+4lKPp
         SbEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk21si859772qkb.205.2021.09.16.09.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQtsF-0002e4-Gu
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtiO-00034c-7l; Thu, 16 Sep 2021 11:54:20 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51396 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtiJ-000594-J1; Thu, 16 Sep 2021 11:54:20 -0400
Received: from localhost.localdomain
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 2271D60806E8;
 Thu, 16 Sep 2021 17:54:10 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v12 08/10] arm: Add Hypervisor.framework build target
Date: Thu, 16 Sep 2021 17:54:02 +0200
Message-Id: <20210916155404.86958-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
References: <20210916155404.86958-1-agraf@csgraf.de>
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
X-TUID: /xl0KHbFvKsM

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

