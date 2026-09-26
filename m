Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6A5C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMPx-0002IA-4B; Sat, 26 Sep 2026 03:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPu-0002HP-92
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:50 -0400
Received: from mail-dy2-x16.google.com ([2607:f8b0:4864:36::16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPq-0000SB-Ly
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:49 -0400
Received: by mail-dy2-x16.google.com with SMTP id
 5a478bee46e88-342773d94a7so513946eec.0
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406105; x=1791010905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N4+ve3swbK5ctjr/uSx7Tqtz8Hqkt+vfSyLQiiwbXAQ=;
 b=h2yZRlbIGH1vaQKhdJsFA77NRUpl43KhPPFbQG97QJqo++FxtXoK30mWZhEG7Xu7AX
 hSDCKxdUwq1rppjW6RhDYBYD/oCqpCP3qynNL+pPtZ7yZg9R7lO96s/OWCZ0F5THBDad
 St3RAgj8mkGHUopPr1eYdvnDt/cxYiqUh/yX784dL5kkEybzOF3G1hwFsKCd7BL9ne1M
 UCYYVz6H6JIob8PUY9PyI/KuGVGcoJWraFZ78IgPPlpxscrokSZqL6+p9u8Esz4Jg3WV
 16R2lSsk08l5wnNPB+3YIQy2/o6YnCiGVUdlHpn1rRBLbeSDkBM9qCSfElsbz1FDIvzd
 4qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406105; x=1791010905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N4+ve3swbK5ctjr/uSx7Tqtz8Hqkt+vfSyLQiiwbXAQ=;
 b=ziI6I0/syRxBwMwXPMptiuVWrYy4Pn7c9iVNGbd4+c/Z2x6DjIlD/iVqFd/V7Dqfgx
 /HodZKrSDHCiutPpsBAYSCw4vnj4JhYztw/derVv5tRd8oYN8I6q7ymP/4FOOY8esxvP
 V0MZ9/Bt6CudJ7SnVbHacNuXdZd0lySFICw4aTp7PW3kMerVr7JtD7GrYynX23QJTa1G
 tmP/a09UCZ5NmTCmzW34qUI1UaM8pw2NwHutKod2Uip436sAO0FH9TgZ+BZf18GwqHYW
 /Hrw0dmskoYhRVz87G24tn9rN4C4/jMyNyRWnw42MC3HlnciP0VbkcniGwUfKMxwjnH1
 lBbA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwdOp8BynUJbTzqNKbeNz7EzM/oNzkElw09fa9L+YLZWuOaKs5DOz1FOWmiAtY2Xg0f7DCGt3XlpQ==@nongnu.org
X-Gm-Message-State: AFuF++kmIL8VNFlNmQSVPkCAeb4znv9jRZjvAMTko/Z6/A+Vtigauhax
 IdHlbwM4U6s4Uj5a6F3FblFhivZ9YA019yVMMir9a3rN7q4ySluXcMHr
X-Gm-Gg: AYBFou2Jn+jAmGcN6pvX0ZZsrSa+M8/ZFyCF+I+XfiKZyWfK7JuzHgHhMyeALSmxITk
 6v8zP21n/oSIMn1N0F2cM3WHFYYzvodFd3almGpa5ZFEqAxLcS0KcyiGnxUMdZZm4WFBxTcCwqG
 BxmEd7CKE/QLIXoBnJ1FqzlkUwogb58BaMCLErZb4zs4T05BabGWo8ye58u2MU1RBOMMrg4J2jP
 Mi9yNVnbya/iYnuwHeyPt7QbZKZfgHrHSlsgfdrUuoDDkU8indHEKZL/hYIDQRXHk1qSFAEjjh0
 zQpsRmO25SKini4fV2W5DCluRLpZ6TtIi2YAptCDemT0ByRYOauYLtklhf8besdjIp5Oy+6jfoz
 p04wocS2fOX8VUpDXP/AICbf8nD37wy7PS3/Kp49tAX0Fg/lXzJbl2BTKCkFsLiBOSMcv0sgTMq
 EEq6zgIFQJVLZmjiFzgF8+XYaWX3LRTpv6uK+w2q35qZUMF2RrTNHV9HKRYC/0S6YC2yZednDR2
 VdAiwH5zW6YygqZeoVgkihGadsMsEs=
X-Received: by 2002:a05:7301:4301:b0:343:311a:372d with SMTP id
 5a478bee46e88-343311a386amr799765eec.28.1790406104888; 
 Sat, 26 Sep 2026 00:01:44 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:01:44 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 10/55] target-info: add TargetKconfig
Date: Sat, 26 Sep 2026 15:00:09 +0800
Message-ID: <20260926070057.1234-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::16;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x16.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add a packed TargetKconfig of device and accel CONFIG_* bits,
generated from the Kconfig tree, and attach it to TargetInfo.
target_kconfig() returns the current bits, and
target_has_kconfig_<name>() tests them. Initialize
target_info_stub.kconfig from CONFIG_DEVICES.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info-def.h       |   2 +
 include/qemu/target-kconfig-has.h    |   7 ++
 include/qemu/target-kconfig.h        |  34 ++++++
 meson.build                          |  14 +++
 scripts/gen-target-kconfig.py        | 162 +++++++++++++++++++++++++++
 target-info-def.c                    |   6 +
 target-kconfig.c                     |  20 ++++
 tests/unit/meson.build               |   1 +
 tests/unit/test-target-kconfig-has.c |  22 ++++
 9 files changed, 268 insertions(+)
 create mode 100644 include/qemu/target-kconfig-has.h
 create mode 100644 include/qemu/target-kconfig.h
 create mode 100644 scripts/gen-target-kconfig.py
 create mode 100644 target-kconfig.c
 create mode 100644 tests/unit/test-target-kconfig-has.c

diff --git a/include/qemu/target-info-def.h b/include/qemu/target-info-def.h
index 080e30a5b0e..ae6374583a7 100644
--- a/include/qemu/target-info-def.h
+++ b/include/qemu/target-info-def.h
@@ -13,6 +13,7 @@
 #include "qapi/qapi-types-machine.h"
 #include "qemu/queue.h"
 #include "qemu/target-info.h"
+#include "qemu/target-kconfig.h"
 
 struct TargetInfo {
     /* runtime equivalent of TARGET_NAME definition */
@@ -32,6 +33,7 @@ struct TargetInfo {
     unsigned page_bits_init;
     /* runtime equivalent of TARGET_PAGE_BITS_VARY definition */
     bool page_bits_vary;
+    TargetKconfig kconfig;
 };
 
 typedef struct TargetInfoNode TargetInfoNode;
diff --git a/include/qemu/target-kconfig-has.h b/include/qemu/target-kconfig-has.h
new file mode 100644
index 00000000000..6616f75845a
--- /dev/null
+++ b/include/qemu/target-kconfig-has.h
@@ -0,0 +1,7 @@
+/*
+ * QEMU target_has_kconfig_* helpers
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "target-kconfig-has-gen.h"
diff --git a/include/qemu/target-kconfig.h b/include/qemu/target-kconfig.h
new file mode 100644
index 00000000000..21b2ba576ec
--- /dev/null
+++ b/include/qemu/target-kconfig.h
@@ -0,0 +1,34 @@
+/*
+ * QEMU target kconfig API
+ *
+ *  Copyright (c) Yonggang Luo
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_TARGET_KCONFIG_H
+#define QEMU_TARGET_KCONFIG_H
+
+#include "qemu/compiler.h"
+
+/**
+ * struct TargetKconfig:
+ *
+ * Compile-time device and accel CONFIG_* bits. Not Kconfig.host
+ * or target/Kconfig. Target identity is TargetInfo, not these
+ * bits. Not kvm_enabled() etc. Fields and
+ * target_has_kconfig_<name>() are generated by
+ * scripts/gen-target-kconfig.py.
+ */
+typedef struct TargetKconfig {
+#include "target-kconfig-fields.h"
+} QEMU_PACKED TargetKconfig;
+
+/**
+ * target_kconfig:
+ *
+ * Returns: The current TargetKconfig (target_info()->kconfig).
+ */
+const TargetKconfig *target_kconfig(void);
+
+#endif
diff --git a/meson.build b/meson.build
index 93237429713..9485f4e97be 100644
--- a/meson.build
+++ b/meson.build
@@ -3444,6 +3444,19 @@ genh += custom_target('config-poison.h',
                       capture: true,
                       command: [find_program('scripts/make-config-poison.sh'),
                                 target_configs_h])
+genh += custom_target('target-kconfig',
+                      output: ['target-kconfig-fields.h',
+                               'target-kconfig-init.h',
+                               'target-kconfig-has-gen.h',
+                               'target-kconfig-has.c.inc'],
+                      depfile: 'target-kconfig.d',
+                      command: [python, files('scripts/gen-target-kconfig.py'),
+                                '--kconfig', meson.current_source_dir() / 'Kconfig',
+                                '--depfile', '@DEPFILE@',
+                                '--fields', '@OUTPUT0@',
+                                '--init', '@OUTPUT1@',
+                                '--has', '@OUTPUT2@',
+                                '--has-c', '@OUTPUT3@'])
 
 if fdt_required.length() > 0
   error('fdt disabled but required by targets ' + ', '.join(fdt_required))
@@ -3778,6 +3791,7 @@ endif
 
 qom_ss.add(files(
   'target-info.c',
+  'target-kconfig.c',
 ))
 qom_ss = qom_ss.apply({})
 libqom = static_library('qom', qom_ss.sources() + genh,
diff --git a/scripts/gen-target-kconfig.py b/scripts/gen-target-kconfig.py
new file mode 100644
index 00000000000..afeffc75ca0
--- /dev/null
+++ b/scripts/gen-target-kconfig.py
@@ -0,0 +1,162 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+"""Generate TargetKconfig CONFIG_* field, initializer, and has headers.
+
+The field list is every `config FOO` from the QEMU Kconfig tree,
+parsed with scripts/minikconf.py (including accel/Kconfig: KVM,
+XEN, HVF, TCG, ...). Host proxies in Kconfig.host and the
+target/Kconfig tree (arch tokens and TARGET_BIG_ENDIAN) are
+omitted. Target identity is TargetInfo, not TargetKconfig.
+
+Each field also gets target_has_kconfig_<name>(const TargetInfo *).
+"""
+
+import argparse
+import os
+import sys
+
+sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
+from minikconf import KconfigData, KconfigParser
+
+
+def field_name(config: str) -> str:
+    return config[len("CONFIG_"):].lower()
+
+
+def collect_from_kconfig(root: str) -> tuple[set[str], list[str]]:
+    data = KconfigData()
+    with open(root, "rt", encoding="utf-8") as fp:
+        KconfigParser.parse(fp, data)
+    names = {"CONFIG_" + name for name in data.defined_vars}
+    return names, list(data.previously_included)
+
+
+def collect_kconfig_names(path: str) -> set[str]:
+    data = KconfigData()
+    with open(path, "rt", encoding="utf-8") as fp:
+        KconfigParser.parse(fp, data)
+    return {"CONFIG_" + name for name in data.defined_vars}
+
+
+def collect_host_kconfig_names(kconfig_root: str) -> set[str]:
+    host = os.path.join(os.path.dirname(os.path.abspath(kconfig_root)),
+                        "Kconfig.host")
+    return collect_kconfig_names(host)
+
+
+def collect_target_kconfig_names(kconfig_root: str) -> set[str]:
+    target = os.path.join(os.path.dirname(os.path.abspath(kconfig_root)),
+                          "target", "Kconfig")
+    return collect_kconfig_names(target)
+
+
+def write_fields(path: str, configs: list[str]) -> None:
+    lines = [
+        "/* Generated by scripts/gen-target-kconfig.py. Do not edit. */",
+        "",
+    ]
+    for name in configs:
+        lines.append(f"    uint32_t {field_name(name)} : 1;")
+    lines.append("")
+    with open(path, "w", encoding="utf-8", newline="\n") as fh:
+        fh.write("\n".join(lines))
+
+
+def write_init(path: str, configs: list[str]) -> None:
+    lines = [
+        "/* Generated by scripts/gen-target-kconfig.py. Do not edit. */",
+        "",
+    ]
+    for name in configs:
+        field = field_name(name)
+        lines.append(f"#if defined({name})")
+        lines.append(f"    .{field} = true,")
+        lines.append("#endif")
+    lines.append("")
+    with open(path, "w", encoding="utf-8", newline="\n") as fh:
+        fh.write("\n".join(lines))
+
+
+def has_fn(config: str) -> str:
+    return "target_has_kconfig_" + field_name(config)
+
+
+def write_has_h(path: str, configs: list[str]) -> None:
+    lines = [
+        "/* Generated by scripts/gen-target-kconfig.py. Do not edit. */",
+        "",
+        "#ifndef TARGET_KCONFIG_HAS_GEN_H",
+        "#define TARGET_KCONFIG_HAS_GEN_H",
+        "",
+        "#include <stdbool.h>",
+        "",
+        "typedef struct TargetInfo TargetInfo;",
+        "",
+    ]
+    for name in configs:
+        lines.append(f"bool {has_fn(name)}(const TargetInfo *ti);")
+    lines.append("")
+    lines.append("#endif")
+    lines.append("")
+    with open(path, "w", encoding="utf-8", newline="\n") as fh:
+        fh.write("\n".join(lines))
+
+
+def write_has_c(path: str, configs: list[str]) -> None:
+    lines = [
+        "/* Generated by scripts/gen-target-kconfig.py. Do not edit. */",
+        "",
+    ]
+    for name in configs:
+        fn = has_fn(name)
+        field = field_name(name)
+        lines.append(f"bool {fn}(const TargetInfo *ti)")
+        lines.append("{")
+        lines.append(f"    return ti->kconfig.{field};")
+        lines.append("}")
+        lines.append("")
+    with open(path, "w", encoding="utf-8", newline="\n") as fh:
+        fh.write("\n".join(lines))
+
+
+def write_depfile(path: str, outputs: list[str], deps: list[str]) -> None:
+    lines = [" ".join(outputs) + ":" ]
+    for dep in deps:
+        lines.append(f"  {dep} \\")
+    if len(lines) > 1:
+        lines[-1] = lines[-1][:-2]
+    lines.append("")
+    with open(path, "w", encoding="utf-8", newline="\n") as fh:
+        fh.write("\n".join(lines))
+
+
+def main(argv: list[str]) -> int:
+    parser = argparse.ArgumentParser(
+        description="Generate TargetKconfig CONFIG_* include headers"
+    )
+    parser.add_argument("--fields", required=True, help="output fields header")
+    parser.add_argument("--init", required=True, help="output initializer header")
+    parser.add_argument("--has", required=True, help="output has-function header")
+    parser.add_argument("--has-c", required=True, help="output has-function bodies")
+    parser.add_argument("--kconfig", required=True, help="root Kconfig")
+    parser.add_argument("--depfile", help="ninja depfile of walked Kconfig files")
+    args = parser.parse_args(argv)
+
+    names, kconfig_files = collect_from_kconfig(args.kconfig)
+    names -= collect_host_kconfig_names(args.kconfig)
+    names -= collect_target_kconfig_names(args.kconfig)
+    configs = sorted(names)
+
+    write_fields(args.fields, configs)
+    write_init(args.init, configs)
+    write_has_h(args.has, configs)
+    write_has_c(args.has_c, configs)
+    if args.depfile:
+        write_depfile(args.depfile,
+                      [args.fields, args.init, args.has, args.has_c],
+                      kconfig_files)
+    return 0
+
+
+if __name__ == "__main__":
+    sys.exit(main(sys.argv[1:]))
diff --git a/target-info-def.c b/target-info-def.c
index 3041d64ccd2..c02d98e6875 100644
--- a/target-info-def.c
+++ b/target-info-def.c
@@ -7,6 +7,9 @@
  */
 
 #include "qemu/osdep.h"
+#ifdef CONFIG_DEVICES
+#include CONFIG_DEVICES
+#endif
 #include "qemu/target-info.h"
 #include "qemu/target-info-def.h"
 #include "hw/core/boards.h"
@@ -38,6 +41,9 @@ static const TargetInfo target_info_stub = {
     .page_bits_vary = false,
     .page_bits_init = TARGET_PAGE_BITS,
 #endif
+    .kconfig = {
+#include "target-kconfig-init.h"
+    },
 };
 
 target_info_init(target_info_stub)
diff --git a/target-kconfig.c b/target-kconfig.c
new file mode 100644
index 00000000000..078c0d8e7f3
--- /dev/null
+++ b/target-kconfig.c
@@ -0,0 +1,20 @@
+/*
+ * QEMU target kconfig helpers
+ *
+ *  Copyright (c) Yonggang Luo
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/target-info.h"
+#include "qemu/target-info-def.h"
+#include "qemu/target-kconfig.h"
+#include "qemu/target-kconfig-has.h"
+
+const TargetKconfig *target_kconfig(void)
+{
+    return &target_info()->kconfig;
+}
+
+#include "target-kconfig-has.c.inc"
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index dc980a35955..c806dbc4ffa 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -47,6 +47,7 @@ tests = {
     objects: target_info_def_objects.values(),
     compile_args: ['-DTARGET_INFO_DEF_COUNT=@0@'.format(
       target_info_def_objects.values().length())])],
+  'test-target-kconfig-has': [qom],
   'test-qemu-opts': [],
   'test-keyval': [testqapi],
   'test-logging': [],
diff --git a/tests/unit/test-target-kconfig-has.c b/tests/unit/test-target-kconfig-has.c
new file mode 100644
index 00000000000..289ed89b854
--- /dev/null
+++ b/tests/unit/test-target-kconfig-has.c
@@ -0,0 +1,22 @@
+/*
+ * target-kconfig-has.h include path test
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/target-kconfig-has.h"
+
+static void test_include(void)
+{
+    bool (*fn)(const TargetInfo *ti) = target_has_kconfig_tcg;
+
+    g_assert_nonnull(fn);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/target-kconfig-has/include", test_include);
+    return g_test_run();
+}
-- 
2.52.0.windows.1


