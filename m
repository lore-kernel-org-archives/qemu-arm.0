Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986350njb;
        Mon, 5 Aug 2024 13:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLnfBmUthBhXn9jbpFy0G2A/jE0stN6QCFGQuFwP+KOWGXQV21XnaYzDqQdJzpK7vk9ZQ9BmFMWeJHqrkC9EtQok/uA2Qx
X-Received: by 2002:a05:6902:2b0a:b0:e06:d62c:98ec with SMTP id 3f1490d57ef6-e0bde4fb8ccmr15499417276.45.1722889046810;
        Mon, 05 Aug 2024 13:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889046; cv=none;
        d=google.com; s=arc-20160816;
        b=r8alGSkD7kA6ClDuor3DlSyQRQwRoex8sTeptQzmfqcuMhZ/xBDnnhqzW36zb9jLic
         KIgAQ3X72l2qhnOvuttRKdgoRdXQTkPzg+86ckFBePGjaBpeUx/yDN1C+5/xkiuRgs7D
         QmtgnuA7QTKf9BBt+sYA5S3sylT/gfjzjb+fe+Ns14wkM9X51J2RVK7MzRc33hJQVDBq
         2WKUCyZXX2a1u20R1dlF/Ey9Tf3JSJ2a4YEoBOw1/parjHMrFRB3SWnTzaA0ziMm1WmE
         2+XhU5aNxIksoBXYG3z0MnYekpzS5m6FpFrx2HSf/5V7tR/jfSUAwDGEFurnznopqDv1
         7NIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=ZwJD/lgjO5kdqyhD8RpYuIvdatMPOMP/3LVoVmWvMSk=;
        fh=nkYz9niiuJL64cASIUCe4FDEgZxTD+4gxagJejRfuZo=;
        b=iZWRDFuAlAv2Iig3VMw2u+9uInayZyWhscd1rAyZs9HcJx0xAyb53NBiSuudnqwZNA
         fJdnJqGjV4TshntuUg4SmYmNVSNYzckL2k+gBVolzBW2PEaI/66ZZQYtBl9z6eKdboMQ
         5bkZmcGN6xHSEQc0OSUg9qnVeRV6tIJukKwSkRX2UHRu29p7BEDxs5EfMtqe7TCQ+h0Z
         Ip0gru2gJtoS8SGw/gbo23PjvRD39TbLwq7GRX7BH6RUAeJjVt2oUwQV5/k07RmWJMxf
         MUD4sxEbLBw/FTwY59BmoE2p/IPXRu0juAPBumZ3d3yQm2BTPYNMPqzoxVVBFjzx/6Dq
         gBrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="rH3/GvVc";
       spf=pass (google.com: domain of 3vtoxzgukc7wvcxkriqqing.eqocngz.dgppggnkpctq.qti@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3VTOxZgUKC7wvcxkriqqing.eqocngz.dgppggnkpctq.qti@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3VTOxZgUKC7wvcxkriqqing.eqocngz.dgppggnkpctq.qti@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0e67e3313csor638498276.3.2024.08.05.13.17.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3vtoxzgukc7wvcxkriqqing.eqocngz.dgppggnkpctq.qti@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="rH3/GvVc";
       spf=pass (google.com: domain of 3vtoxzgukc7wvcxkriqqing.eqocngz.dgppggnkpctq.qti@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3VTOxZgUKC7wvcxkriqqing.eqocngz.dgppggnkpctq.qti@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889046; x=1723493846; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwJD/lgjO5kdqyhD8RpYuIvdatMPOMP/3LVoVmWvMSk=;
        b=rH3/GvVcDM1DayaBOnsrE+bVQzrzEwoLSk+tANE1w0jv8BBrv9zHjqFsuyDjfg5CvZ
         jPBVU31fAOYbyBYQgQTFlH4ksnxO64fFSuBAAo5fVfSw8GAsIWWJy1eRXO2n8PNg8J77
         dCgpSQ+JhtpnfYis1oSt8+b53SqAltJeDlVGTA569uoMt4YJc97MwB1M9TOyRoaOaq7V
         kIdJKyTY6SQ+tfxq+90sl2RNj2g3b4v0ILCdYHIEHg3p0qav/OMgz8hG99ibiqs0AZsm
         V7yuASM6RUOVcjojepZCSWVZZdMX8CW0ttfDyoOjoSRzvp6JQORJjrDu5tHbYiaYww11
         MRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889046; x=1723493846;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwJD/lgjO5kdqyhD8RpYuIvdatMPOMP/3LVoVmWvMSk=;
        b=Ph1f7PjDW7uCMRIo5uj9e6/b7ixIFeLHr5bjlpQjaDZG6DGmgqBSAOdhjVtXocI7lU
         gLKpgzDrmD/IZRJ0kJ3YMCJvmMraxiil+zFJzcFyqixkeZeqnPjW4EftX/Pr4/mGVQ9v
         0fomxD4VKfxMgbaz1DryzifpAVbbXKR/RCR6OHBs+kPJzgvNZyi4wh4svpPVtZh+1QPC
         TolViOmQN4s/juejl4FMJ5ldve3Fb6IgVdlwBlMjECje3iQmhhXCsT8rjRyNPB/tMd7D
         R1INm/4HlbOBp6C1m8S0EXsjGrQzBeEODwDEny8BnPRuAR2o15SMLsjI1Ljt4kjsePc+
         EJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO2lZovvlHBVyjXXE1gHp3NYNNjeh+vxZHSWGnCrEgZR3MZm+XlZikgOv2R6Wgi5D+N/ZoHgDzoe+4bSx7/MzEzwzUaDBi
X-Gm-Message-State: AOJu0Yze6U9DB+vPrMh+MlnJEsfAf1s+fpcsCivuBr30MeB1cKAYe8Jb
	Bam3p4vSItjUKMEjzvym6yoSyWLJ8Se2d32g6TsA2EepAq/WY27o7pytSVdxhym4ajWn5kjS7A=
	=
X-Google-Smtp-Source: AGHT+IHPWqYjn9MimH1P+Pyv+53F84pwYNK/yl/0rbjY4BL7b9DkAH4O74JY5ubkLMkSpdZVYH0QgxujeQ==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6902:2b8a:b0:e03:2217:3c8f with SMTP id
 3f1490d57ef6-e0bde21f848mr21913276.2.1722889045783; Mon, 05 Aug 2024 13:17:25
 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:16:58 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-4-tavip@google.com>
Subject: [RFC PATCH 03/23] scripts: add script to generate C header files from
 SVD XML files
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: 9hHZNfzopLQO

From: Stefan Stanacar <stefanst@google.com>

From: Stefan Stanacar <stefanst@google.com>

The CMSIS System View Description format(CMSIS-SVD) is an XML based
description of Arm Cortex-M microcontrollers provided and maintained
by sillicon vendors. It includes details such as peripherals registers
(down to bitfields), peripheral register block addresses, reset
values, etc.

This script uses this information to create header files that makes it
easier to emulate peripherals.

The script can be used to create either peripheral specific headers or
board / system specific information. The script generated headers are
similar to the SVDConv utility.

Peripheral specific headers contains information such as register
layout, register names and reset values for registers:

  typedef struct {
    ...
    union {
      uint32_t PSELID;              /* 0x00000FF8 Peripheral Select and
                                     * Flexcomm module ID */
      struct {
        uint32_t PERSEL : 3;        /* [2..0] Peripheral Select */
        uint32_t LOCK : 1;          /* [3..3] Lock the peripheral select */
        uint32_t USARTPRESENT : 1;  /* [4..4] USART present indicator */
        uint32_t SPIPRESENT : 1;    /* [5..5] SPI present indicator */
        uint32_t I2CPRESENT : 1;    /* [6..6] I2C present indicator */
        uint32_t I2SPRESENT : 1;    /* [7..7] I2S Present */
        uint32_t : 4;
        uint32_t ID : 20;           /* [31..12] Flexcomm ID */
      } PSELID_b;
    };
    ...
  } FLEXCOMM_Type;                  /* Size = 4096 (0x1000) */

  #define FLEXCOMM_PSELID_PERSEL_Pos (0UL)
  #define FLEXCOMM_PSELID_PERSEL_Msk (0x7UL)
  #define FLEXCOMM_PSELID_LOCK_Pos (3UL)
  #define FLEXCOMM_PSELID_LOCK_Msk (0x8UL)
  ...

  typedef enum {                /* FLEXCOMM_PSELID_LOCK */
    /* Peripheral select can be changed by software. */
    FLEXCOMM_PSELID_LOCK_UNLOCKED = 0,
    /* Peripheral select is locked and cannot be changed until this
     * Flexcomm module or the entire device is reset. */
    FLEXCOMM_PSELID_LOCK_LOCKED = 1,
  } FLEXCOMM_PSELID_LOCK_Enum;
  ...

  #define FLEXCOMM_REGISTER_NAMES_ARRAY(_name) \
    const char *_name[sizeof(FLEXCOMM_Type)] = { \
        [4088 ... 4091] = "PSELID", \
        [4092 ... 4095] = "PID", \
    }

Board specific headers contains information about peripheral base
register addresses.

Signed-off-by: Stefan Stanacar <stefanst@google.com>
Signed-off-by: Octavian Purdila <tavip@google.com>
---
 configure                 |   2 +-
 meson.build               |   4 +
 python/setup.cfg          |   1 +
 python/tests/minreqs.txt  |   3 +
 pythondeps.toml           |   3 +
 scripts/svd-gen-header.py | 342 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 354 insertions(+), 1 deletion(-)
 create mode 100755 scripts/svd-gen-header.py

diff --git a/configure b/configure
index 5ad1674ca5..811bfa5d54 100755
--- a/configure
+++ b/configure
@@ -956,7 +956,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
 # Finish preparing the virtual environment using vendored .whl files
 
 $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
-     ${source_path}/pythondeps.toml meson || exit 1
+     ${source_path}/pythondeps.toml meson svd-gen-header || exit 1
 
 # At this point, we expect Meson to be installed and available.
 # We expect mkvenv or pip to have created pyvenv/bin/meson for us.
diff --git a/meson.build b/meson.build
index ec59effca2..dee587483b 100644
--- a/meson.build
+++ b/meson.build
@@ -3235,6 +3235,10 @@ tracetool_depends = files(
   'scripts/tracetool/vcpu.py'
 )
 
+svd_gen_header = [
+  python, files('scripts/svd-gen-header.py')
+]
+
 qemu_version_cmd = [find_program('scripts/qemu-version.sh'),
                     meson.current_source_dir(),
                     get_option('pkgversion'), meson.project_version()]
diff --git a/python/setup.cfg b/python/setup.cfg
index 48668609d3..bc830c541a 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -45,6 +45,7 @@ devel =
     urwid >= 2.1.2
     urwid-readline >= 0.13
     Pygments >= 2.9.0
+    pysvd >= 0.2.3
 
 # Provides qom-fuse functionality
 fuse =
diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
index a3f423efd8..7993fcd23c 100644
--- a/python/tests/minreqs.txt
+++ b/python/tests/minreqs.txt
@@ -22,6 +22,9 @@ distlib==0.3.6
 # Dependencies for FUSE support for qom-fuse
 fusepy==2.0.4
 
+# Dependencies for svd-gen-regs
+pysvd==0.2.3
+
 # Test-runners, utilities, etc.
 avocado-framework==90.0
 
diff --git a/pythondeps.toml b/pythondeps.toml
index 9c16602d30..8416b17650 100644
--- a/pythondeps.toml
+++ b/pythondeps.toml
@@ -32,3 +32,6 @@ sphinx_rtd_theme = { accepted = ">=0.5", installed = "1.1.1" }
 # avocado-framework, for example right now the limit is 92.x.
 avocado-framework = { accepted = "(>=88.1, <93.0)", installed = "88.1", canary = "avocado" }
 pycdlib = { accepted = ">=1.11.0" }
+
+[svd-gen-header]
+pysvd = { accepted = ">=0.2.3.", installed = "0.2.3" }
diff --git a/scripts/svd-gen-header.py b/scripts/svd-gen-header.py
new file mode 100755
index 0000000000..ab8cb4b665
--- /dev/null
+++ b/scripts/svd-gen-header.py
@@ -0,0 +1,342 @@
+#!/usr/bin/env python3
+
+# Copyright 2024 Google LLC
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# Use this script to generate a C header file from an SVD xml
+#
+# Two mode of operations are supported: peripheral and system.
+#
+# When running in peripheral mode a header for a specific peripheral
+# is going to be generated. It will define a type and structure with
+# all of the available registers at the bitfield level. An array that
+# contains the reigster names indexed by address is also going to be
+# generated as well as a function to initialize registers to their
+# reset values.
+#
+# Invocation example:
+#
+# svd_gen_header -i MIMXRT595S_cm33.xml -o flexcomm.h -p FLEXCOMM0 -t FLEXCOMM
+#
+# When running in system mode a header for a specific system /
+# platform will be generated. It will define register base addresses
+# and interrupt numbers for selected peripherals.
+#
+# Invocation example:
+#
+# svd_gen_header -i MIMXRT595S_cm33.xml -o rt500.h -s RT500 -p FLEXCOMM0 \
+#                -p CLKCTL0 -p CLKCTL1
+#
+
+import argparse
+import datetime
+import re
+import os
+import sys
+import xml.etree.ElementTree
+import pysvd
+
+data_type_by_bits = {
+    8: "uint8_t",
+    16: "uint16_t",
+    32: "uint32_t",
+}
+
+
+def get_register_array_name_and_size(register):
+    """Return register name and register array size.
+
+    The SVD can define register arrays and pysvd encodes the whole set
+    as as regular register with their name prepended by [<array size>].
+
+    Returns a tuple with the register name and the size of the array or
+    zero if this is not a register set.
+
+    """
+
+    split = re.split(r"[\[\]]", register.name)
+    return (split[0], int(split[1]) if len(split) > 1 else 0)
+
+
+def generate_register(register):
+    """Generate register data.
+
+    This include a field for accessing the full 32bits as we as
+    bitfield based register fields.
+
+    """
+
+    data_type = data_type_by_bits[register.size]
+
+    out = f"    /* 0x{register.addressOffset:08X} {register.description} */\n"
+    out += "    union {\n"
+    out += f"        {data_type} {register.name};\n"
+    out += "        struct {\n"
+
+    fields = sorted(register.fields, key=lambda field: field.bitOffset)
+    last_msb = -1
+    for field in fields:
+        reserve_bits = 0
+        lsb = field.bitOffset
+        msb = field.bitWidth + lsb - 1
+
+        if last_msb == -1 and lsb > 0:
+            reserve_bits = lsb
+
+        if last_msb != -1 and (lsb - last_msb) > 1:
+            reserve_bits = lsb - last_msb - 1
+
+        if reserve_bits > 0:
+            out += f"            {data_type}:{reserve_bits};\n"
+
+        out += f"            /* [{msb}..{lsb}] {field.description} */\n"
+        out += f"            {data_type} {field.name} : {field.bitWidth};\n"
+
+        last_msb = msb
+
+    if register.size - last_msb > 1:
+        out += f"            {data_type}:{register.size - last_msb - 1};\n"
+
+    reg_name, reg_array_size = get_register_array_name_and_size(register)
+    if reg_array_size > 0:
+        out += f"        }} {reg_name}_b[{reg_array_size}];\n"
+    else:
+        out += f"        }} {reg_name}_b;\n"
+    out += "    };\n\n"
+
+    return out
+
+
+def generate_pos_and_msk_defines(name, periph):
+    """Generate Pos and Msk defines"""
+
+    out = "\n"
+    for reg in periph.registers:
+        for field in reg.fields:
+            reg_name, _ = get_register_array_name_and_size(reg)
+            field_name = f"{name}_{reg_name}_{field.name}"
+            out += f"#define {field_name}_Pos ({field.bitOffset}UL)\n"
+            mask = ((1 << field.bitWidth) - 1) << field.bitOffset
+            out += f"#define {field_name}_Msk (0x{mask:x}UL)\n"
+
+    return out
+
+
+def generate_enum_values(name, periph):
+    """Generate enum values"""
+
+    out = "\n"
+    for reg in periph.registers:
+        reg_name, _ = get_register_array_name_and_size(reg)
+        for field in reg.fields:
+            if hasattr(field, "enumeratedValues"):
+                out += "\n"
+                out += "typedef enum {\n"
+                for enum in field.enumeratedValues.enumeratedValues:
+                    enum_name = f"{name}_{reg_name}_{field.name}_{enum.name}"
+                    out += f"    /* {enum.description} */\n"
+                    out += f"    {enum_name} = {enum.value},\n"
+                out += f"}} {name}_{reg_name}_{field.name}_Enum;\n"
+
+    return out
+
+
+def generate_register_names_array_macro(name, periph):
+    """Generate register names array macro"""
+
+    out = f"#define {name}_REGISTER_NAMES_ARRAY(_name) \\\n"
+    out += f"    const char *_name[sizeof({name}_Type)] = {{ \\\n"
+    for reg in periph.registers:
+        reg_name, reg_array_size = get_register_array_name_and_size(reg)
+        if reg_array_size > 0:
+            for i in range(0, reg_array_size):
+                start = reg.addressOffset + i * reg.size // 8
+                stop = reg.addressOffset + (i + 1) * reg.size // 8 - 1
+                out += f'        [{start} ... {stop}] = "{reg_name}{i}", \\\n'
+        else:
+            start = reg.addressOffset
+            stop = reg.addressOffset + reg.size // 8 - 1
+            out += f'        [{start} ... {stop}] = "{reg.name}", \\\n'
+    out += "    }\n"
+
+    return out
+
+
+def generate_reset_registers_function(name, periph):
+    """Generate reset registers function"""
+
+    out = "\n"
+    fname = f"{name.lower()}_reset_registers"
+    out += f"static inline void {fname}({name}_Type *regs)\n"
+    out += "{\n"
+    for reg in periph.registers:
+        reg_name, reg_array_size = get_register_array_name_and_size(reg)
+        if reg_array_size > 0:
+            for i in range(0, int(reg_array_size)):
+                out += f"    regs->{reg_name}[{i}] = {hex(reg.resetValue)};\n"
+        else:
+            out += f"    regs->{reg_name} = {hex(reg.resetValue)};\n"
+    out += "}\n"
+
+    return out
+
+
+def generate_peripheral_header(periph, name):
+    """Generate peripheral header
+
+    The following information is generated:
+
+    * typedef with all of the available registers and register fields,
+    position and mask defines for register fields.
+
+    * enum values that encode register fields options.
+
+    * a macro that defines the register names indexed by the relative
+    address of the register.
+
+    * a function that sets the registers to their reset values
+
+    """
+
+    out = f"/* {name} - {periph.description} */\n\n"
+    out += "typedef struct {\n"
+
+    last_reg_offset = 0
+    cnt = 0
+    for reg in periph.registers:
+        reserved_words = 0
+        if (reg.addressOffset - last_reg_offset) > 0:
+            reserved_words = int((reg.addressOffset - last_reg_offset) // 4)
+            cnt += 1
+
+        if cnt:
+            show_count = cnt
+        else:
+            show_count = ""
+
+        if reserved_words == 1:
+            out += f"    uint32_t RESERVED{show_count};\n\n"
+        elif reserved_words > 1:
+            out += f"    uint32_t RESERVED{show_count}[{reserved_words}];\n\n"
+
+        out += generate_register(reg)
+        last_reg_offset = reg.addressOffset + reg.size // 8
+
+    size = periph.addressBlocks[0].size
+    out += f"}} {name}_Type; /* Size = {size} (0x{size:X}) */\n"
+
+    out += "\n\n"
+
+    out += generate_pos_and_msk_defines(name, periph)
+
+    out += generate_enum_values(name, periph)
+
+    out += generate_register_names_array_macro(name, periph)
+
+    out += generate_reset_registers_function(name, periph)
+
+    return out
+
+
+def get_same_class_peripherals(svd, periph):
+    """Get a list of peripherals that are instances of the same class."""
+
+    return [periph] + [
+        p
+        for p in svd.peripherals
+        if p.derivedFrom and p.derivedFrom.name == periph.name
+    ]
+
+
+def generate_system_header(system, svd, periph):
+    """Generate base and irq defines for given list of peripherals"""
+
+    out = ""
+
+    for p in get_same_class_peripherals(svd, periph):
+        out += f"#define {system}_{p.name}_BASE 0x{p.baseAddress:X}UL\n"
+    out += "\n"
+
+    for p in get_same_class_peripherals(svd, periph):
+        for irq in p.interrupts:
+            out += f"#define {system}_{irq.name}_IRQn 0x{irq.value}UL\n"
+    out += "\n"
+
+    return out
+
+
+def main():
+    """Script to generate C header file from an SVD file"""
+
+    parser = argparse.ArgumentParser()
+    parser.add_argument(
+        "-i", "--input", type=str, help="Input SVD file", required=True
+    )
+    parser.add_argument(
+        "-o", "--output", type=str, help="Output .h file", required=True
+    )
+    parser.add_argument(
+        "-p",
+        "--peripheral",
+        action="append",
+        help="peripheral name from the SVD file",
+        required=True,
+    )
+    parser.add_argument(
+        "-t",
+        "--type-name",
+        type=str,
+        help="name to be used for peripheral definitions",
+        required=False,
+    )
+    parser.add_argument(
+        "-s",
+        "--system",
+        type=str,
+        help="name to be used for the system definitions",
+        required=False,
+    )
+
+    args = parser.parse_args()
+
+    node = xml.etree.ElementTree.parse(args.input).getroot()
+    svd = pysvd.element.Device(node)
+
+    # Write license header
+    out = "/*\n"
+    license_text = svd.licenseText.split("\\n")
+    for line in license_text:
+        sline = f" * {line.strip()}"
+        out += f"{sline.rstrip()}\n"
+
+    now = datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")
+    out += f" * @note Automatically generated by {os.path.basename(__file__)}"
+    out += f" on {now} UTC from {os.path.basename(args.input)}.\n"
+    out += " *\n */\n\n"
+
+    # Write some generic defines
+    out += "#pragma once\n\n"
+
+    for name in args.peripheral:
+        periph = svd.find(name)
+        if periph:
+            if args.system:
+                out += generate_system_header(args.system, svd, periph)
+            else:
+                out += generate_peripheral_header(
+                    periph, args.type_name if args.type_name else periph.name
+                )
+        else:
+            print(f"No such peripheral: {name}")
+            return 1
+
+    with open(args.output, "w", encoding="ascii") as output:
+        output.write(out)
+
+    return 0
+
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.46.0.rc2.264.g509ed76dc8-goog
