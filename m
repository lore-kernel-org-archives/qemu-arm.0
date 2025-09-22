Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF40CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:47:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d65-0006XT-1X; Mon, 22 Sep 2025 05:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d5H-0005WM-42
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:43:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d4q-00020C-Fa
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:43:46 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45ed646b656so36530615e9.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758534195; x=1759138995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqiiGjBNvtYaKdQTe1DwRjyIG78iRIOiYHfJlvRqfHA=;
 b=BSvTKnjNonf/Neo7vcVsTUeoX4GUJC6hCAXul/qjbYQ9xT26PWeKeTWRh5nSJKNiNv
 xUGxz+eUHgl35hmJs8j/JraPkRlXnOkbLWwLpDqT3LDrjRaG1QpksQjg+ittg8nVqKoR
 uQ9xiXT2RYwI3WcO4duYsLJXYs/HhIAOuaFd/kGroTtZHNW44N0f7Uv1AVZY1GS7IxcB
 Dv/1Ok7QIRx9Cmbj0z/BSP9SIZ2rBZJcu9eGVWeaIiMYLW9E2Qc7COTHtGzs/nWlcmBg
 aTwTECYhznTMDCockBdO3bRbchPHwc1ATipl1e1xE2OxhHYrfXkLcrFEPBsSK0bqHcwz
 jG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534195; x=1759138995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqiiGjBNvtYaKdQTe1DwRjyIG78iRIOiYHfJlvRqfHA=;
 b=ftmicMcktRldMyS3WRySRcU/SGzHb+95tDm72PhYORc//afG78MMa5HFfKUk/jJMJI
 dFLP7CqDfSaYFSTjqlfBnk82+aqlGF9Q7YbsBYQFg4OgDZMEYubWMPsQVLS2usX+Jx48
 uw2eO+CPsaK7mTdWCPzGsNxJxhY9niRhAnCPV0n5Ows0SQvay47z1oEC4ArDcvU4Afdp
 PscX9QW0iWKLeG6/iCtXG4OMGoVj8QoVmw2w38dk5ObqkkvVD31WVBbnCvxB5ctNq3C6
 6eWz2+DsI/8rBhZ+9icV5LuWAbezhxdey3ViDZJSkLCYF42xeiT5Np1OENFastz1K1cK
 QIJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpDSWWA/Xka+GHeFmnSeJ/2YavBRemh/tow3L+uvpL6TU4/09iGffl7he/bVdqSJujATC9Q+/vAg==@nongnu.org
X-Gm-Message-State: AOJu0YzEZFCIAJNpWOdSznjaq6XRPm65Pt14M0v0IMPNOvGw01gU/HZL
 hj7gZ6FLqMRN+GLAjn2tr49fzqW+Ufdq5g5j1kC15bjaqm7glc8JcJZJ/uVY2uC/hp4=
X-Gm-Gg: ASbGncvbM6IyAZ02zShJwUcMWE3BayKMx+3sLxPApvCMNvn7EdbRg80RZScqIjuPZN4
 jlYI7GVL7AVWf8otwkB+KF4XRcsKGn0kIKhyW7oag6HhOgadxNQ02dok+Dzk8b9Q9vlPMGo+hud
 TIrYL74qCBF+WndQ4jj0jStoSn+jQG2sNiUo7FNrDTZmbNr17/lcMgnrbFMxMLPToKGDlzHKPQu
 ZV/LQQqtxZeIEJpurk2ThaPIl6B7konrcX+6BhsCm0tZZYebAcyH8G+7PPKkraCpylHId3ke4Fm
 fAr4i6SRXLpHsPzwkoX0WCYrJrHs7gmwdnMMaqKB+3YS/HGLXS0AgakqcKr8lUvjvRTWYDUe9oY
 Ne8tWGAb1SZAPE/GspNoZmSY=
X-Google-Smtp-Source: AGHT+IGCo15ZaMp32c22dqH1B5nXWehe70gVLCv9IxMmziyOEJbVn3lp3L8zFn5gf9xkJndgRd+BQg==
X-Received: by 2002:a05:600c:a44:b0:45d:f650:376f with SMTP id
 5b1f17b1804b1-467efedab3cmr128676865e9.23.1758534194921; 
 Mon, 22 Sep 2025 02:43:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f3d8csm18283021f8f.9.2025.09.22.02.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:43:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D219E5FA60;
 Mon, 22 Sep 2025 10:37:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 24/25] contrib/plugins/uftrace_symbols.py
Date: Mon, 22 Sep 2025 10:37:09 +0100
Message-ID: <20250922093711.2768983-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

usage:  contrib/plugins/uftrace_symbols.py \
        --prefix-symbols \
        arm-trusted-firmware/build/qemu/debug/bl1/bl1.elf \
        arm-trusted-firmware/build/qemu/debug/bl2/bl2.elf \
        arm-trusted-firmware/build/qemu/debug/bl31/bl31.elf \
        u-boot/u-boot:0x60000000 \
        u-boot/u-boot.relocated:0x000000023f6b6000 \
        linux/vmlinux

Will generate symbols and memory mapping files for uftrace, allowing to
have an enhanced trace, instead of raw addresses.

It takes a collection of elf files, and automatically find all their
symbols, and generate an ordered memory map based on that.

This script uses the python (native) pyelftools module.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20250902075042.223990-9-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/uftrace_symbols.py | 152 +++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100755 contrib/plugins/uftrace_symbols.py

diff --git a/contrib/plugins/uftrace_symbols.py b/contrib/plugins/uftrace_symbols.py
new file mode 100755
index 00000000000..b49e03203c8
--- /dev/null
+++ b/contrib/plugins/uftrace_symbols.py
@@ -0,0 +1,152 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+#
+# Create symbols and mapping files for uftrace.
+#
+# Copyright 2025 Linaro Ltd
+# Author: Pierrick Bouvier <pierrick.bouvier@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import argparse
+import elftools # pip install pyelftools
+import os
+
+from elftools.elf.elffile import ELFFile
+from elftools.elf.sections import SymbolTableSection
+
+def elf_func_symbols(elf):
+    symbol_tables = [(idx, s) for idx, s in enumerate(elf.iter_sections())
+                  if isinstance(s, SymbolTableSection)]
+    symbols = []
+    for _, section in symbol_tables:
+        for _, symbol in enumerate(section.iter_symbols()):
+            if symbol_size(symbol) == 0:
+                continue
+            type = symbol['st_info']['type']
+            if type == 'STT_FUNC' or type == 'STT_NOTYPE':
+                symbols.append(symbol)
+    symbols.sort(key = lambda x: symbol_addr(x))
+    return symbols
+
+def symbol_size(symbol):
+    return symbol['st_size']
+
+def symbol_addr(symbol):
+    addr = symbol['st_value']
+    # clamp addr to 48 bits, like uftrace entries
+    return addr & 0xffffffffffff
+
+def symbol_name(symbol):
+    return symbol.name
+
+class BinaryFile:
+    def __init__(self, path, map_offset):
+        self.fullpath = os.path.realpath(path)
+        self.map_offset = map_offset
+        with open(path, 'rb') as f:
+            self.elf = ELFFile(f)
+            self.symbols = elf_func_symbols(self.elf)
+
+    def path(self):
+        return self.fullpath
+
+    def addr_start(self):
+        return self.map_offset
+
+    def addr_end(self):
+        last_sym = self.symbols[-1]
+        return symbol_addr(last_sym) + symbol_size(last_sym) + self.map_offset
+
+    def generate_symbol_file(self, prefix_symbols):
+        binary_name = os.path.basename(self.fullpath)
+        sym_file_path = f'./uftrace.data/{binary_name}.sym'
+        print(f'{sym_file_path} ({len(self.symbols)} symbols)')
+        with open(sym_file_path, 'w') as sym_file:
+            # print hexadecimal addresses on 48 bits
+            addrx = "0>12x"
+            for s in self.symbols:
+                addr = symbol_addr(s)
+                addr = f'{addr:{addrx}}'
+                size = f'{symbol_size(s):{addrx}}'
+                name = symbol_name(s)
+                if prefix_symbols:
+                    name = f'{binary_name}:{name}'
+                print(addr, size, 'T', name, file=sym_file)
+
+def parse_parameter(p):
+    s = p.split(":")
+    path = s[0]
+    if len(s) == 1:
+        return path, 0
+    if len(s) > 2:
+        raise ValueError('only one offset can be set')
+    offset = s[1]
+    if not offset.startswith('0x'):
+        err = f'offset "{offset}" is not an hexadecimal constant. '
+        err += 'It should starts with "0x".'
+        raise ValueError(err)
+    offset = int(offset, 16)
+    return path, offset
+
+def is_from_user_mode(map_file_path):
+    if os.path.exists(map_file_path):
+        with open(map_file_path, 'r') as map_file:
+            if not map_file.readline().startswith('# map stack on'):
+                return True
+    return False
+
+def generate_map(binaries):
+    map_file_path = './uftrace.data/sid-0.map'
+
+    if is_from_user_mode(map_file_path):
+        print(f'do not overwrite {map_file_path} generated from qemu-user')
+        return
+
+    mappings = []
+
+    # print hexadecimal addresses on 48 bits
+    addrx = "0>12x"
+
+    mappings += ['# map stack on highest address possible, to prevent uftrace']
+    mappings += ['# from considering any kernel address']
+    mappings += ['ffffffffffff-ffffffffffff rw-p 00000000 00:00 0 [stack]']
+
+    for b in binaries:
+        m = f'{b.addr_start():{addrx}}-{b.addr_end():{addrx}}'
+        m += f' r--p 00000000 00:00 0 {b.path()}'
+        mappings.append(m)
+
+    with open(map_file_path, 'w') as map_file:
+        print('\n'.join(mappings), file=map_file)
+    print(f'{map_file_path}')
+    print('\n'.join(mappings))
+
+def main():
+    parser = argparse.ArgumentParser(description=
+                                     'generate symbol files for uftrace')
+    parser.add_argument('elf_file', nargs='+',
+                        help='path to an ELF file. '
+                        'Use /path/to/file:0xdeadbeef to add a mapping offset.')
+    parser.add_argument('--prefix-symbols',
+                        help='prepend binary name to symbols',
+                        action=argparse.BooleanOptionalAction)
+    args = parser.parse_args()
+
+    if not os.path.exists('./uftrace.data'):
+        os.mkdir('./uftrace.data')
+
+    binaries = []
+    for file in args.elf_file:
+        path, offset = parse_parameter(file)
+        b = BinaryFile(path, offset)
+        binaries.append(b)
+    binaries.sort(key = lambda b: b.addr_end());
+
+    for b in binaries:
+        b.generate_symbol_file(args.prefix_symbols)
+
+    generate_map(binaries)
+
+if __name__ == '__main__':
+    main()
-- 
2.47.3


