Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1421792lfb;
        Wed, 2 Dec 2020 11:04:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzptKiIRM1MUYRlZhe99w19d5+Td+6b0Y0ajPZpCbXUEe+BKbECWOf5IbUoDo061V+KHN2B
X-Received: by 2002:a25:cdc5:: with SMTP id d188mr7317910ybf.58.1606935873828;
        Wed, 02 Dec 2020 11:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606935873; cv=none;
        d=google.com; s=arc-20160816;
        b=jkPdKEfmedKD1s3yS2y0un+k4eFaMVkOklwxp41WrHEL9zUxY+C2evoUcaXH7lqywU
         6rG0DWsZ0T/8t06BZ4xxek3Cvpah5YMHgpsOXk6IDohQCcWoYLZ1//Sw3QXZKAuvyt0k
         310mPVlVSAwJQ0p77Dn30yyRto+uZr/q4XuPwVIKePURTSgxDCYFj2Z+G5k4XkRwdjas
         MGAaMLfO76OMO4lEdFahIof1QGUonlOUkk+0ziSN6su4WUmekz4AMcK2eDXAdMudEXzy
         gUBQtZiGHsApc0RI0lqh5vPrw5iH2zyEfj7aKlF/cOzWs1pafZZjgFmXP+45In62jzX1
         C2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YDqE0MBcc8PZfYHaDGLV7yLXNek5+eOAkxBoEvRMKBw=;
        b=otoYMVKLYb/7H0WGo81CTyco9d7evsysgXZjQ+Cn/IguN4M4YSU9JqK0GruN/q0jL6
         EhotYiQ6DzcA5f3NBnFeKbErA+JnzBp1Np9MWZPFWtxDn0kfnwszM17UluPSbAqCQhot
         R2Js/jyA6Xat3Jog9xaJKs5rlAkp8rJrdoliW9ZVq5FXU6vd49DvobwD2snEPhx0mSK4
         IsDwB31gW5bLjHdQthdbIsruxhegaONRh4ayuaYlnt+uxFSCRFt8F2HEgC7KFc07jQb0
         +ZlStxCsksinW79Ca5SLRcqIjZE+YV9pspABZAbW78md2WIY/Z55bMs7R0JJzOKqdvZi
         mdOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l188si2607628ybb.88.2020.12.02.11.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 11:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkXQX-00032G-7f
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 14:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXQH-00031t-Ab; Wed, 02 Dec 2020 14:04:17 -0500
Received: from mail.csgraf.de ([188.138.100.120]:56404
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXQD-0005Dq-Ng; Wed, 02 Dec 2020 14:04:17 -0500
Received: from localhost.localdomain
 (dynamic-077-007-031-140.77.7.pool.telefonica.de [77.7.31.140])
 by csgraf.de (Postfix) with ESMTPSA id D478C390038F;
 Wed,  2 Dec 2020 20:04:10 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/10] hvf: Add hypervisor entitlement to output binaries
Date: Wed,  2 Dec 2020 20:03:59 +0100
Message-Id: <20201202190408.2041-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201202190408.2041-1-agraf@csgraf.de>
References: <20201202190408.2041-1-agraf@csgraf.de>
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
X-TUID: LZV25JVdWTEG

In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
respective entitlement. Add an entitlement template and automatically self
sign and apply the entitlement in the build.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - Make safe to ctrl-C
---
 accel/hvf/entitlements.plist |  8 ++++++++
 meson.build                  | 30 ++++++++++++++++++++++++++----
 scripts/entitlement.sh       | 13 +++++++++++++
 3 files changed, 47 insertions(+), 4 deletions(-)
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

