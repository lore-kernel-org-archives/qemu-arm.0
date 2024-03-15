Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990589eju;
        Fri, 15 Mar 2024 06:11:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaUtQFntcF6usrtt7Zeg5lHYFzt6kWMAwvFLBnAyA19TXukagYYaaWEuujA5K0uMnHiROtE5SU9VIIXN9rMUOGF21CJo+6
X-Received: by 2002:a17:907:9709:b0:a46:7bd3:c7b2 with SMTP id jg9-20020a170907970900b00a467bd3c7b2mr2651522ejc.5.1710508296972;
        Fri, 15 Mar 2024 06:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508296; cv=none;
        d=google.com; s=arc-20160816;
        b=h5+prdsqyM3Bq0+9DsE79ZGDE5sRTfX5WyKkpAMHIHwMvisqLW2x26iYpV9QH7+I6G
         6lPebVxo4NbEHqUVp9NAi/DpeQeUMBple69CDpIf8ySHHmHS5VVle08Z//pZasKPNhm3
         yHB07oWq2RPJ0CExPTMuhUWkhtr0vN20IxCnf7CFZ4snEumqV4ohCzZ1muZ1FwLOk2t7
         yzQ+kK37X/WF1utSC0ZeqMqOIHwa3I23DpRPceFCbqf47i9HcGNfYild/bvM+DJpSQnU
         zjF08nLzyjD/sRX6Zn4rOnP58Epwyg3xqG0xEXm91QPmFq4FOBC4pQiCUsNsKh85dftI
         ND3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vnvuw2s/qwtrAi1idHX4CvaMd4PeKiJ3xN49FEYysNQ=;
        fh=ImPpHrrmP3d92KvcrNN4fkK2xot31BEcVRSLeiyp6tk=;
        b=hnccvlzbBqzybuSgklqV2ojMn4iitNovUfQQU7vdWpkamXHKzp54dIBTEz8wBP73QV
         KXsNU8ZeKFQsWDqIW1ehBWX8823k4YmWgBVVBxQ5CXvqeDot6msecKT/718a+abALgzn
         kfLP9SXPFRLoZtG/5XnZ+VwCNkylmWl/UWz+HYKmUJVe89vucziRmOiYDv1t6dACK/KH
         UL18hAZcvMXVHt8FHTGIAgM1PE06HP8/qGEUZ1msVyuCm7cZtqOmzS9gGVOBwrV3f/Cr
         +obg76Ad5nzhtaMGaBoYR9jZOOYu0JrlQlNL3aEHVRbztF35DGJYhpEtCagOK7L3E8Cp
         qxUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cj2KJtCo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cb18-20020a170906a45200b00a462744cafbsor1230071ejb.7.2024.03.15.06.11.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cj2KJtCo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508296; x=1711113096; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnvuw2s/qwtrAi1idHX4CvaMd4PeKiJ3xN49FEYysNQ=;
        b=Cj2KJtCozNEkLsH13jzd6vLbWBcIrKbo9WdiqZ03ufvdmtAlYNa/LuofPDeFMP5Tlo
         l8ytL6ZEwRT23apY5sy5HRvAepb5OfS20xRKOVFHDrhFB2V97w8rUYnzLOfGq4VP/Ii8
         gcRzASTCL60BKX5GO/2ZJdzAPIWFOEbIdUr2eJ1aV4SEZunOYSHaK+6KWv1w6ofs56DA
         JHDM/LiPDivz3RJOp6bp/e6e0C7TMzb6U0arJ2bfVWgRsFjya+WWBPzfu9kjY3D868O4
         x/nU9G4b87z1ODTInQ5RRlP0ufpl/n1qymAyPLyKyS/041cLljEq2POOvX7Ifj+pi0Jx
         BiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508296; x=1711113096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnvuw2s/qwtrAi1idHX4CvaMd4PeKiJ3xN49FEYysNQ=;
        b=dBnNbuw9i2YuesgE7sTqKttgSiF/CP1VOtg8TxPtwaqRr3DgUKyaZVL6T77+SKRFod
         DN7qxO+MkHJLrYk4mUYUz9XnXAaBg0KnIst7biUrfckgLFeFdEHV68Eh0M0hZdnHCPqK
         YoTXDHqkbyMW0Wxl+wmN+WyAD6H054jNIfPx5fA4zQsRrzJB+jypa3esiEGA0f8HkRQP
         kn2p1ODnWzewKW7xg100Ooj55BodUYr2T2PKjBiY8r+RYVTRW9cufp1LsMnYcg3cEkiF
         nQ7Iz3BDzOS3y6CGI4zMrX+bYf6TdeGkeJy1IqbQAtzF0gw/T/JSEi359P0ier+NeJ2m
         VWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlZC27r6DRJLSVCg4or0QomdiDeEmbkhIXnBvdV/qalSyE0GuNQVSMHBt9WrUo1Fr/Z9iC+FGa173ldmizeg/aSIuHK4Bk
X-Gm-Message-State: AOJu0YwngSPvStDxrg5vBpJr2bath+IVWiMq7T6OCi3iCrgZ2soiWm1l
	azWI05/03+khFuK9qDX1U0W1itA90+E5iDPbOgBd6uSRDh3exlizeftg5maIIU9fZg==
X-Google-Smtp-Source: AGHT+IHkrsOXMB0KMEhHFjzPwy0HpwYtgpPqcJhRXSdQ9oxhn/KVwMnS7VrOrtYo7QVAmF/CxxOTZw==
X-Received: by 2002:a17:906:a3d5:b0:a46:1f6d:2fef with SMTP id ca21-20020a170906a3d500b00a461f6d2fefmr3544428ejb.42.1710508296617;
        Fri, 15 Mar 2024 06:11:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709064a1700b00a462e5d8d4asm1676475eju.114.2024.03.15.06.11.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:11:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eric Blake <eblake@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH-for-9.1 21/21] qapi: Make @query-cpu-definitions target-agnostic
Date: Fri, 15 Mar 2024 14:09:09 +0100
Message-ID: <20240315130910.15750-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pnFC4nt5mGUT

All targets use the generic_query_cpu_definitions() method,
which is not target-specific. Make the command target agnostic
by moving it to machine.json. Rename generic_query_cpu_definitions
as qmp_query_cpu_definitions.

This is an introspection change for the target that were not
implementing qmp_query_cpu_definitions(): now query-cpu-definitions
returns an their CPUs list.

Example with SH4 before:

  { "execute": "query-cpu-definitions" }

  { "error": {"class": "CommandNotFound", "desc": "The command query-cpu-definitions has not been found"} }

and after:

  { "execute": "query-cpu-definitions" }

  { "return": [
          {"name": "sh7751r", "typename": "sh7751r-superh-cpu", "static": false, "deprecated": false},
          {"name": "sh7750r", "typename": "sh7750r-superh-cpu", "static": false, "deprecated": false},
          {"name": "sh7785", "typename": "sh7785-superh-cpu", "static": false, "deprecated": false}
      ]
  }

However this allows heterogeneous emulation to return a correct list.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Well, not all target got converted, I left the s390x one for later :)
---
 MAINTAINERS                           |  1 -
 qapi/machine-target.json              | 18 ------------------
 qapi/machine.json                     | 11 +++++++++++
 include/qapi/commands-target-compat.h | 14 --------------
 system/cpu-qmp-cmds.c                 |  4 ++--
 target/arm/arm-qmp-cmds.c             |  6 ------
 target/i386/cpu.c                     |  6 ------
 target/loongarch/loongarch-qmp-cmds.c |  6 ------
 target/mips/sysemu/mips-qmp-cmds.c    |  9 ---------
 target/ppc/ppc-qmp-cmds.c             |  7 -------
 target/riscv/riscv-qmp-cmds.c         |  6 ------
 11 files changed, 13 insertions(+), 75 deletions(-)
 delete mode 100644 include/qapi/commands-target-compat.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 39d7c14d98..71f446311b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1895,7 +1895,6 @@ F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
-F: include/qapi/commands-target-compat.h
 F: include/sysemu/numa.h
 F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 7480921d33..2065972d8a 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -212,24 +212,6 @@
                    'TARGET_LOONGARCH64',
                    'TARGET_RISCV' ] } }
 
-##
-# @query-cpu-definitions:
-#
-# Return a list of supported virtual CPU definitions
-#
-# Returns: a list of CpuDefinitionInfo
-#
-# Since: 1.2
-##
-{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
-  'if': { 'any': [ 'TARGET_PPC',
-                   'TARGET_ARM',
-                   'TARGET_I386',
-                   'TARGET_S390X',
-                   'TARGET_MIPS',
-                   'TARGET_LOONGARCH64',
-                   'TARGET_RISCV' ] } }
-
 ##
 # @CpuS390Polarization:
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 9c44b8fa82..987c64f8e7 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -73,6 +73,17 @@
             'deprecated' : 'bool' }
 }
 
+##
+# @query-cpu-definitions:
+#
+# Return a list of supported virtual CPU definitions
+#
+# Returns: a list of CpuDefinitionInfo
+#
+# Since: 1.2
+##
+{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'] }
+
 ##
 # @CpuModelInfo:
 #
diff --git a/include/qapi/commands-target-compat.h b/include/qapi/commands-target-compat.h
deleted file mode 100644
index 86d45d8fcc..0000000000
--- a/include/qapi/commands-target-compat.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * QAPI helpers for target specific QMP commands
- *
- * SPDX-FileCopyrightText: 2024 Linaro Ltd.
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-#ifndef QAPI_COMPAT_TARGET_H
-#define QAPI_COMPAT_TARGET_H
-
-#include "qapi/qapi-types-machine.h"
-
-CpuDefinitionInfoList *generic_query_cpu_definitions(Error **errp);
-
-#endif
diff --git a/system/cpu-qmp-cmds.c b/system/cpu-qmp-cmds.c
index daeb131159..049e8b9d35 100644
--- a/system/cpu-qmp-cmds.c
+++ b/system/cpu-qmp-cmds.c
@@ -7,7 +7,7 @@
 
 #include "qemu/osdep.h"
 #include "qom/object.h"
-#include "qapi/commands-target-compat.h"
+#include "qapi/qapi-commands-machine.h"
 #include "sysemu/arch_init.h"
 #include "hw/core/cpu.h"
 #include "hw/core/sysemu-cpu-ops.h"
@@ -53,7 +53,7 @@ static void arch_add_cpu_definitions(CpuDefinitionInfoList **cpu_list,
     }
 }
 
-CpuDefinitionInfoList *generic_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
     CpuDefinitionInfoList *cpu_list = NULL;
 
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index c5091e64ec..ac8d890bc0 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -28,7 +28,6 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qapi-commands-misc-target.h"
-#include "qapi/commands-target-compat.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
 
@@ -220,8 +219,3 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
     return expansion_info;
 }
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    return generic_query_cpu_definitions(errp);
-}
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e5dbd307d8..f26adefd37 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -38,7 +38,6 @@
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/reset.h"
 #include "qapi/qapi-commands-machine-target.h"
-#include "qapi/commands-target-compat.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
@@ -5666,11 +5665,6 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
     QAPI_LIST_PREPEND(*cpu_list, info);
 }
 
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    return generic_query_cpu_definitions(errp);
-}
-
 #endif /* !CONFIG_USER_ONLY */
 
 uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
index ef5aedc1cd..aaed7bbf93 100644
--- a/target/loongarch/loongarch-qmp-cmds.c
+++ b/target/loongarch/loongarch-qmp-cmds.c
@@ -9,17 +9,11 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine-target.h"
-#include "qapi/commands-target-compat.h"
 #include "cpu.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qom/qom-qobject.h"
 
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    return generic_query_cpu_definitions(errp);
-}
-
 static const char *cpu_model_advertised_features[] = {
     "lsx", "lasx", NULL
 };
diff --git a/target/mips/sysemu/mips-qmp-cmds.c b/target/mips/sysemu/mips-qmp-cmds.c
index 329db3a028..c3c775acc6 100644
--- a/target/mips/sysemu/mips-qmp-cmds.c
+++ b/target/mips/sysemu/mips-qmp-cmds.c
@@ -5,12 +5,3 @@
  *
  * SPDX-License-Identifier: LGPL-2.1-or-later
  */
-
-#include "qemu/osdep.h"
-#include "qapi/qapi-commands-machine-target.h"
-#include "qapi/commands-target-compat.h"
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    return generic_query_cpu_definitions(errp);
-}
diff --git a/target/ppc/ppc-qmp-cmds.c b/target/ppc/ppc-qmp-cmds.c
index 267dd84718..f85c4560f9 100644
--- a/target/ppc/ppc-qmp-cmds.c
+++ b/target/ppc/ppc-qmp-cmds.c
@@ -28,8 +28,6 @@
 #include "qemu/ctype.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
-#include "qapi/qapi-commands-machine-target.h"
-#include "qapi/commands-target-compat.h"
 #include "cpu-models.h"
 #include "cpu-qom.h"
 
@@ -195,8 +193,3 @@ void ppc_add_alias_definitions(CpuDefinitionInfoList **cpu_list)
         QAPI_LIST_PREPEND(*cpu_list, info);
     }
 }
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    return generic_query_cpu_definitions(errp);
-}
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 45adc90d3b..170d720b24 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -26,7 +26,6 @@
 
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine-target.h"
-#include "qapi/commands-target-compat.h"
 #include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qobject-input-visitor.h"
@@ -54,11 +53,6 @@ void riscv_cpu_add_definition(gpointer data, gpointer user_data)
     QAPI_LIST_PREPEND(*cpu_list, info);
 }
 
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    return generic_query_cpu_definitions(errp);
-}
-
 static void riscv_check_if_cpu_available(RISCVCPU *cpu, Error **errp)
 {
     if (!riscv_cpu_accelerator_compatible(cpu)) {
-- 
2.41.0
