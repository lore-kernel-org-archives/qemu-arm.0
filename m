Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1784807lfb;
        Thu, 26 Nov 2020 13:50:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6M6qrSWz5e/P3HwTYsAeOdXDZXDa+gPSw7aM4UWM6ZBE3LAZQ/n/iOwNXHdtsc66vN4pY
X-Received: by 2002:a25:9746:: with SMTP id h6mr6634171ybo.222.1606427440516;
        Thu, 26 Nov 2020 13:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427440; cv=none;
        d=google.com; s=arc-20160816;
        b=MUzRsja7MnpUVN3omiNDSnHRJJOpBlAVvLJLSEahsIdbh0C75TKiyj36x+KnuFy6eu
         sLJsSqNPtlEuP5IcQNzVajQl4GGtoKj08/nFfG32WvvSbRrJoRxQVhZ6/CRYzzLgsjpJ
         7tKRq639km20/IxpCtCdbPI/KpimMW15LDHW7xHFPFuLcQ46e748gCbq64l2Jv9FnJbO
         lwUvL/LKH+H2rodGCy8rz4c4QuffWhxEzr7NHhSKDzoP7VE2nR63CXWynkCG8NFFGNnE
         8cNC8b07UoaRdXyLIlqIFOx9c4N/a/l8+GYPiatG6w6/hjW0F8MR9DmGX37mlV/LoWSL
         M+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Sf+DuqwDCUCV+d8d2OBlRlg2vsmiKOSNpN5e7g3jBgk=;
        b=fX0gxlY5F5Ugd/rU49Dp2j+oAXohGQyoJShjXCPR+VNJz9AY0f6J2SRWibKdTJeYWD
         7AhSHjp/g9pQYqfUzTfwBytdYQ/AwRha0TTVDar9RKI7GzzBP5HC9O5XxDGv/bgjAcmv
         GEETM3DND9RCOmoEc/G1X8kbZsV3AwZZvEEbXtJxrsplfYjPaAMwiOUgXS8UYyMm8nG3
         wx00QA7522WDJeMkmkNCyTxBl0lQM8bSa3ku772GN6Fic5/288kMG2SzE8+pqBBDOsKI
         FgwgB4aSPsH3xun6zu6gQhoAu0/tNbXGZu1+MIQ6swa9dT2PtMbSXCC02/4jQCstCkmt
         wZHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si6492101ybm.266.2020.11.26.13.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:50:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiP9z-0001m4-Sq
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9l-0001jw-Mf; Thu, 26 Nov 2020 16:50:25 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60516
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9i-0005jn-N8; Thu, 26 Nov 2020 16:50:25 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id 920D63900501;
 Thu, 26 Nov 2020 22:50:18 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] hvf: Add hypervisor entitlement to output binaries
Date: Thu, 26 Nov 2020 22:50:10 +0100
Message-Id: <20201126215017.41156-2-agraf@csgraf.de>
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
X-TUID: tG2ZqiIPyFdJ

In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
respective entitlement. Add an entitlement template and automatically self
sign and apply the entitlement in the build.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/entitlements.plist |  8 ++++++++
 meson.build                  | 30 ++++++++++++++++++++++++++----
 scripts/entitlement.sh       | 11 +++++++++++
 3 files changed, 45 insertions(+), 4 deletions(-)
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
index 5062407c70..2a7ff5560c 100644
--- a/meson.build
+++ b/meson.build
@@ -1844,9 +1844,14 @@ foreach target : target_dirs
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
@@ -1854,7 +1859,24 @@ foreach target : target_dirs
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
                gui_app: exe['gui'])
-    }
+
+    if exe_sign
+      exe_full = meson.current_build_dir() / exe['name']
+      emulators += {exe['name'] : custom_target(exe['name'],
+                   install: true,
+                   install_dir: get_option('bindir'),
+                   depends: emulator,
+                   output: exe['name'],
+                   command: [
+                     meson.current_source_dir() / 'scripts/entitlement.sh',
+                     meson.current_build_dir() / exe['name'] + '-unsigned',
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
index 0000000000..7ed9590bf9
--- /dev/null
+++ b/scripts/entitlement.sh
@@ -0,0 +1,11 @@
+#!/bin/sh -e
+#
+# Helper script for the build process to apply entitlements
+
+SRC="$1"
+DST="$2"
+ENTITLEMENT="$3"
+
+rm -f "$2"
+cp -a "$SRC" "$DST"
+codesign --entitlements "$ENTITLEMENT" --force -s - "$DST"
-- 
2.24.3 (Apple Git-128)

