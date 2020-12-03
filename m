Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp116627lfb;
        Thu, 3 Dec 2020 15:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQPQewQGSvCUyrfIAxMBcz4kf4d412GLbWrmKwEDd7OsICpiJcfP3qsUuM/YzDgCAwIQqD
X-Received: by 2002:a25:cf95:: with SMTP id f143mr2264142ybg.216.1607039463013;
        Thu, 03 Dec 2020 15:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607039463; cv=none;
        d=google.com; s=arc-20160816;
        b=w7nSakP2MatI3I1zBFTBwE/TxagFFbNtvlDTjjCuhwhWqiZ/Z8x8kQc8JXk8bWRisv
         VuFt4dQzQWKdsFMnxyz+sQQNu02/N1rxWSEqPvBgN5OSMKSfJC6ptbGj7FunjX86U+fm
         /WjrCimWzYkhsyB1sPtUEYtDUKl0IWFmMiseBQjqR3ZgxjpuZKuCIKvjqCPCONppvwNT
         aBKT0hmEOD6WzTBMdgqoYoet2dKaDb+1L5HAmQMDOUTsX1/69wPcN6AnM/0N9GJNPjsA
         3gcSC5AzrX3umhYmWcPX5h9abEh4oWq9oDMgu8/ZoK44eK5cIc6etJ8K/p7jZw5H8Vv5
         S2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=aBj502ILznSfAvdAo+MP5ESSoqj3obVnYtu+GHyQMM4=;
        b=xI/jxbAtu7YBZ6dcMBagujGL5cG1yoPY9+WX/b2iGaVEdluL0So3gUuSFnJ94o/FxZ
         +Syzy/SibTPi3zOWmmGqMsNBy9uwK35uO1GrwuBa5I4PCCBTykY1fOoCVNG6gij6k9aI
         pVmMo8y3SF5/T56ywShvp0X59ZHoWTiNOAdwgIfYTD0Jpw644AbtoY4zswNZMXv2KidZ
         tqiXZ4QFVKWTgjBOjYIl6eTo2xUz6lDszz+WgxACK42ZdIcx7G1FxUpPSvKEepb0/Iwr
         pQsnMqI+7v2Ms8jkYk/ZRdh5e0iPPUYhFC2BRihCps8fpTRuucjDcj1tqvL3xSt6yTuy
         iSPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si286612ybk.267.2020.12.03.15.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 15:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkyNK-0004mW-AM
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 18:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLU-0002WS-GJ; Thu, 03 Dec 2020 18:49:08 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57472
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLQ-0003Lg-Dz; Thu, 03 Dec 2020 18:49:08 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id B191C39003CD;
 Fri,  4 Dec 2020 00:48:58 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/11] hvf: Add hypervisor entitlement to output binaries
Date: Fri,  4 Dec 2020 00:48:47 +0100
Message-Id: <20201203234857.21051-2-agraf@csgraf.de>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4qYgyDUce+LF

In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
respective entitlement. Add an entitlement template and automatically self
sign and apply the entitlement in the build.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

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
index e3386196ba..86d433c8a4 100644
--- a/meson.build
+++ b/meson.build
@@ -1843,9 +1843,14 @@ foreach target : target_dirs
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
@@ -1853,7 +1858,23 @@ foreach target : target_dirs
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

