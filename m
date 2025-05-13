Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp460503njb;
        Tue, 13 May 2025 04:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7MeTTSLO2C9xDFKod6phEN/sg+/vzMLadHsstgpvmrYnC+1qtC9YfKGyCQQyRcm6yW+KqAwBWtLZbxg==@linaro.org
X-Google-Smtp-Source: AGHT+IH9mrcnZ3vTm+bUnKfb6ZOXOlmENEX5FkmoSwad+1Fuhsfka20WpeVM+mE6SmeT+eWKIq3p
X-Received: by 2002:a05:6214:1949:b0:6f5:41cd:9dd2 with SMTP id 6a1803df08f44-6f6e481d160mr337176026d6.37.1747137435855;
        Tue, 13 May 2025 04:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747137435; cv=none;
        d=google.com; s=arc-20240605;
        b=OU6WUJ6T3FiSZLSdZlFTAyl6HwhA2/w96L04lWDBIGdIdq3DsJmU3Mdf7CUKf4Wi0w
         AKc8ACkg4azVO0Upy8YNsrHg9Sl/Yez3hRCPzGtb2gIQURP+W69GdUgKsXZlLii+VVpI
         gaPcMEMfGJzmZ6IPFnpjPUQ1lyc5oqMiNKxwkXDjo2OFVoL2qkFlCniZFWeo6/jjJfAz
         vgW3RGxaKi4kIaJ+uAJ9kkGvIwI7pOWBeGAqkB29A3Pgf7sTxaZeNZhkEPz4VFwGaUMT
         iSCgkKY+XFnQdaXwK9zcAQtyPDhSeaXOx9/cst+9L606Mc7q7fFoq+VzvK/3JwVJyON9
         TZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=N1iB5gvmLzqgimGLRjWOz8X1HYfCPTyJ1LadMmLJHh8=;
        fh=I7Qv5hrQ1oZsx4ajrBWM3/89bcJiclOoQA/C65d0RlY=;
        b=D9od6YcW8lXgYN43BLyTfT22jvLUyJtq0sAwak84J4aeYVniacg3cN5A2OFsiFEfkw
         Yn3Xnvg0VKQYLTnY2L6oDSXJqX80+KRj1orMqcxGw8elg+mQsHOZUnZmkLI2hRyEJ6f7
         uUJ+BAK1fLb9ZbBJFU8mKqeSsMwEk0R617/01JNZB/ZidCdtL9hgWKx2+RfUWVuYRJXf
         1uXG6JOcV7JBZD7/12PrKprfmOainhIv8QKQ2fUO1Ye+iGabCgIL32S0slVr0uYXrPVW
         /lwC+1EVgB/T0v+zrj33cMGRywUbMaz4wDpxIc5LUbHwycbKJXWcvgr2nVkktWetvWfM
         yg7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iIQOfBaJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e4a9a99asi105166706d6.492.2025.05.13.04.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 04:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iIQOfBaJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEoFi-0003o9-IV; Tue, 13 May 2025 07:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uEoFg-0003nj-7u
 for qemu-arm@nongnu.org; Tue, 13 May 2025 07:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uEoFd-000396-Tt
 for qemu-arm@nongnu.org; Tue, 13 May 2025 07:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747137409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N1iB5gvmLzqgimGLRjWOz8X1HYfCPTyJ1LadMmLJHh8=;
 b=iIQOfBaJwjDUpokRvzFqEtuddp7ydjuDpD9mrFvsZKl5NI+1SutXdJQdb9P58Hmkg33GKA
 PXd0nUAllM0yc3smW1Rxx+w0k80rwGNOmnuD0ybu/tri/JjP3TGOTgZYzCMWHJ7IBdE3up
 2BayMFoT67fSx8OO4bWDUSbOuWYgmxM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-s0X6PC2vObGEfUJXOzx54Q-1; Tue,
 13 May 2025 07:56:46 -0400
X-MC-Unique: s0X6PC2vObGEfUJXOzx54Q-1
X-Mimecast-MFC-AGG-ID: s0X6PC2vObGEfUJXOzx54Q_1747137404
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9FC361955D82; Tue, 13 May 2025 11:56:44 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.62])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A572E1953B82; Tue, 13 May 2025 11:56:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2] meson.build: Compile hw_common_arch_libs files with right
 header include paths
Date: Tue, 13 May 2025 13:56:37 +0200
Message-ID: <20250513115637.184940-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.549,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I9qWZNK6LDke

From: Thomas Huth <thuth@redhat.com>

Since commit 6f4e8a92bbd ("hw/arm: make most of the compilation units
common"), compilation of some arm machines (like musicpal) fails on
certain host systems like OpenBSD 7.6/7.7 since headers like <epoxy/gl.h>
don't reside in /usr/include and we currently don't add the right
CFLAGS for the common files to include the additional header search
paths. Add a loop similar to what we already did in commit 727bb5b477e6
to fix it.

With this fix applied, we can now also drop the explicit dependency
on pixman for the arm musicpal machine.

Fixes: 6f4e8a92bbd ("hw/arm: make most of the compilation units common")
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[thuth: Add commit message + changes in hw/arm/meson.build]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Change the subject of the patch according to Paolo's suggestion

 meson.build        | 27 ++++++++++++++++-----------
 hw/arm/meson.build |  2 +-
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meson.build b/meson.build
index 5ac64075be7..7131aa2b21d 100644
--- a/meson.build
+++ b/meson.build
@@ -3228,6 +3228,7 @@ config_devices_mak_list = []
 config_devices_h = {}
 config_target_h = {}
 config_target_mak = {}
+config_base_arch_mak = {}
 
 disassemblers = {
   'alpha' : ['CONFIG_ALPHA_DIS'],
@@ -3419,6 +3420,11 @@ foreach target : target_dirs
     config_all_devices += config_devices
   endif
   config_target_mak += {target: config_target}
+
+  # build a merged config for all targets with the same TARGET_BASE_ARCH
+  target_base_arch = config_target['TARGET_BASE_ARCH']
+  config_base_arch = config_base_arch_mak.get(target_base_arch, {}) + config_target
+  config_base_arch_mak += {target_base_arch: config_base_arch}
 endforeach
 target_dirs = actual_target_dirs
 
@@ -4099,28 +4105,27 @@ common_all = static_library('common',
 
 # construct common libraries per base architecture
 hw_common_arch_libs = {}
-foreach target : target_dirs
-  config_target = config_target_mak[target]
-  target_base_arch = config_target['TARGET_BASE_ARCH']
+foreach target_base_arch, config_base_arch : config_base_arch_mak
+  if target_base_arch in hw_common_arch
+    base_arch_hw = hw_common_arch[target_base_arch].apply(config_base_arch, strict: false)
+    base_arch_common = common_ss.apply(config_base_arch, strict: false)
 
-  # check if already generated
-  if target_base_arch in hw_common_arch_libs
-    continue
-  endif
+    lib_deps = base_arch_hw.dependencies()
+    foreach dep : base_arch_common.dependencies()
+      lib_deps += dep.partial_dependency(compile_args: true, includes: true)
+    endforeach
 
-  if target_base_arch in hw_common_arch
     target_inc = [include_directories('target' / target_base_arch)]
-    src = hw_common_arch[target_base_arch]
     lib = static_library(
       'hw_' + target_base_arch,
       build_by_default: false,
-      sources: src.all_sources() + genh,
+      sources: base_arch_hw.sources() + genh,
       include_directories: common_user_inc + target_inc,
       implicit_include_directories: false,
       # prevent common code to access cpu compile time
       # definition, but still allow access to cpu.h
       c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],
-      dependencies: src.all_dependencies())
+      dependencies: lib_deps)
     hw_common_arch_libs += {target_base_arch: lib}
   endif
 endforeach
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 5098795f61d..8e3bf495dbf 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -8,7 +8,7 @@ arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 arm_common_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
 arm_common_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
 arm_common_ss.add(when: 'CONFIG_MPS3R', if_true: files('mps3r.c'))
-arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [pixman, files('musicpal.c')])
+arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
 arm_common_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 arm_common_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
 arm_common_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
-- 
2.49.0

