Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp395345lfq;
        Wed, 20 Jan 2021 14:45:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz89kp+q+rByCu71QZ42j1sOJL/75m6Mt7D7FLSkBMEAAjg2ckG8jlVETj3j1MDkHNP1/JC
X-Received: by 2002:a25:99c6:: with SMTP id q6mr17025370ybo.408.1611182727875;
        Wed, 20 Jan 2021 14:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611182727; cv=none;
        d=google.com; s=arc-20160816;
        b=NAUxAfWevTNWcsWqgBBaPWlWh8jmhFmIAYZcxYmtUMs9mIghDqv+xDBILlV7XANsWX
         0ZRDzBbh2ur9J7oINr8G4DtNOnYPuL0x6d4xFek6W78oehNZduwyHyShoy37U8pATy1w
         ChPs1TzfHsNqnjD33mjYOWnUV6ykBbvvWZjTk7ZUGO7ogOe0yp6lL3uwIdpplfyAFMP2
         1OhGFvOYXvzONC4v0ihFXV5H+HryJV2SijYmincmkYbMOvLMLKknPsV/lsiCgny4kRI2
         JHZj4dI8Pz4eaKqxmLrZsl3uOG4v3Zb36Rwt0fdp/alRFqEf/6ueNTUHqkuXoW6ECFbd
         a5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=6L3wUH7aVkfC+FpPCuZCo9SAkwSalOkQPL0eoGH4gUI=;
        b=OyTRiyuPwD4s0QDsulSevaXvsFETAW75FC+bDZVjn+ASSwkvv5HQBUlLFfyYvsRiL9
         EmPmLsimiCjEqsrSeiV3cH/yPoqfWM+y+dfkhUFaSYAAr4F6vJfT8SZtSGBag8StQd9E
         kKkSo8igjKxBCS9Xn7bdguPxMTsL00votHwDX/YtEJQb/upfOm2rfhkFkJ/dWkp2ac+o
         V6mWD3X9Kx5sHjMdKUMtBg42eCUTtcVAK67EOeb6vLQo/eq7oUjN5ri8GAqvs4eQS5YX
         PQMoy23FgfZxWhVSTuSjaS7gSsO04Uuc684ZaZY4/WE6hTaOqT4Zz0SdEe0iXuef/1e4
         rC0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si3367998ybc.86.2021.01.20.14.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 14:45:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2MEB-0003tC-4w
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 17:45:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1l2MDe-0003rm-W3; Wed, 20 Jan 2021 17:44:55 -0500
Received: from mail.csgraf.de ([188.138.100.120]:45100
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1l2MDa-0001Sd-P9; Wed, 20 Jan 2021 17:44:54 -0500
Received: from localhost.localdomain
 (dynamic-077-002-091-253.77.2.pool.telefonica.de [77.2.91.253])
 by csgraf.de (Postfix) with ESMTPSA id B306239003C7;
 Wed, 20 Jan 2021 23:44:46 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/11] hvf: Add hypervisor entitlement to output binaries
Date: Wed, 20 Jan 2021 23:44:34 +0100
Message-Id: <20210120224444.71840-2-agraf@csgraf.de>
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
X-TUID: 57RdR+SFunMM

In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
respective entitlement. Add an entitlement template and automatically self
sign and apply the entitlement in the build.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

---

v1 -> v2:

  - Make safe to ctrl-C

v3 -> v4:

  - Remove unused exe_full variable
  - Reuse exe_name variable
---
 accel/hvf/entitlements.plist |  8 ++++++++
 meson.build                  | 29 +++++++++++++++++++++++++----
 scripts/entitlement.sh       | 13 +++++++++++++
 3 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 accel/hvf/entitlements.plist
 create mode 100755 scripts/entitlement.sh

diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.plist
new file mode 100644
index 0000000000..154f3308ef
--- /dev/null
+++ b/accel/hvf/entitlements.plist
@@ -0,0 +1,8 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
+<plist version="1.0">
+<dict>
+    <key>com.apple.security.hypervisor</key>
+    <true/>
+</dict>
+</plist>
diff --git a/meson.build b/meson.build
index 3d889857a0..c667d64498 100644
--- a/meson.build
+++ b/meson.build
@@ -2146,9 +2146,14 @@ foreach target : target_dirs
     }]
   endif
   foreach exe: execs
-    emulators += {exe['name']:
-         executable(exe['name'], exe['sources'],
-               install: true,
+    exe_name = exe['name']
+    exe_sign = 'CONFIG_HVF' in config_target
+    if exe_sign
+      exe_name += '-unsigned'
+    endif
+
+    emulator = executable(exe_name, exe['sources'],
+               install: not exe_sign,
                c_args: c_args,
                dependencies: arch_deps + deps + exe['dependencies'],
                objects: lib.extract_all_objects(recursive: true),
@@ -2156,7 +2161,23 @@ foreach target : target_dirs
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
                gui_app: exe['gui'])
-    }
+
+    if exe_sign
+      emulators += {exe['name'] : custom_target(exe['name'],
+                   install: true,
+                   install_dir: get_option('bindir'),
+                   depends: emulator,
+                   output: exe['name'],
+                   command: [
+                     meson.current_source_dir() / 'scripts/entitlement.sh',
+                     meson.current_build_dir() / exe_name,
+                     meson.current_build_dir() / exe['name'],
+                     meson.current_source_dir() / 'accel/hvf/entitlements.plist'
+                   ])
+      }
+    else
+      emulators += {exe['name']: emulator}
+    endif
 
     if 'CONFIG_TRACE_SYSTEMTAP' in config_host
       foreach stp: [
diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
new file mode 100755
index 0000000000..c540fa6435
--- /dev/null
+++ b/scripts/entitlement.sh
@@ -0,0 +1,13 @@
+#!/bin/sh -e
+#
+# Helper script for the build process to apply entitlements
+
+SRC="$1"
+DST="$2"
+ENTITLEMENT="$3"
+
+trap 'rm "$DST.tmp"' exit
+cp -af "$SRC" "$DST.tmp"
+codesign --entitlements "$ENTITLEMENT" --force -s - "$DST.tmp"
+mv "$DST.tmp" "$DST"
+trap '' exit
-- 
2.24.3 (Apple Git-128)

