Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989676eju;
        Fri, 15 Mar 2024 06:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyxihE+XyLR/onuDfisRiJu+N1yWczdLlef2mE6Fpxrqff3AdvTVfyRn1ojgEL/Z1yqg/gfruyexazMYt43n0EDZTeR6Ir
X-Received: by 2002:a17:906:ba84:b0:a46:74d2:a0c3 with SMTP id cu4-20020a170906ba8400b00a4674d2a0c3mr3979227ejd.4.1710508228861;
        Fri, 15 Mar 2024 06:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508228; cv=none;
        d=google.com; s=arc-20160816;
        b=CwT/5r0cf8TAqMRDLV/3AVmMdjHN5Qlm3T6YXng7AmrLfXPXr2whjFfA7FdBJqVXJh
         LqaDKUU0GRSa315w7SkEI9uCQufMFo5FCeoRXZo8/45MVI7y0Xqbw3LpCgN0+M97AOlj
         aMTT8sH1q5apTQ5JwnlMfU5zasDHvf0t/tW71DsctRiriWCRDx2eLyk8t2EE3lIk50Ky
         jL0k3y63CnA1yZY1CatntDplqfLBCuxPB+wWqxvpQv8oo+r64x6QTA74DSpuzhuim1BE
         gK9Ifvlt7AaRcxN7lGL/MBlWy2rtne9g7ZvNY+G12kbsUwKXzc2rHy4C/r3rSyKkDZEx
         q0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3PuQ6WSEYLWnTCNPDldZo+Ppk/XGMtRnTbQuxwxDUsU=;
        fh=9GZw7/gRCHip1mozbXYnsf+wJlR+LxkhShhMciwE8ao=;
        b=e8QvmVPrvO2ossNPpZ2GV6rMpLSQhN5mQwnjWS9TGHqt3FXOx8YeugRqbvf60KCbR5
         96POo5P81TcgwasTCPZjC+n/f2yyqUAUiH89RGndtFDZZ6z8NGA8nXRGCBAhsQF/Ka3b
         YiZApRiU3NYvYTOgejEPm4j8Zl3bVdZzofEppMecyS6XfL+VXglD/FXlKysavSZoH7f0
         D+o2mAp48FTDrWR7MJuYJqBOAk1gNfr3KIoeEP3l9gK93r7IX3TgiFk2O2Jib1pyu18I
         uSrVoK8+MqSWcKpmN6OcmZ4NN32mkv0nmM1KFSFUgIsb4hArYmc2Or/9mhR8BE4h2Kft
         Iq/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPdl1pTp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lh6-20020a170906f8c600b00a465fa3eaccsor1302229ejb.19.2024.03.15.06.10.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPdl1pTp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508228; x=1711113028; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PuQ6WSEYLWnTCNPDldZo+Ppk/XGMtRnTbQuxwxDUsU=;
        b=dPdl1pTplyrSTz2ZFGssI40IhHivtvmmyWzBjdux3Q1IBS1avbpOuchIPhumRRPuRs
         4nVGGQQa+TGoZN79cbILNsJdxDlbUpwNLGIY1BRrCOiz040eK3kLJGHsxdM5gRG/zL5o
         6aT8w+HbSILPgocqTrsg8F3UcWzmHNw0qIzgI086i01K5hDcayIZS/u/5LgxIHIFWnZg
         LFMshWgZt2b3MyjtyyzNNGxfgXJENUzqK2az133zgMH/pASEdAl13o0dMKmAMLrv7c0B
         MPAlP8KSmN5WNOijJnb7wOcX/eVMwdi2pzo1T+TnhZ6on87MCyZ3BWlhfiWLZxD1QEne
         YYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508228; x=1711113028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PuQ6WSEYLWnTCNPDldZo+Ppk/XGMtRnTbQuxwxDUsU=;
        b=c39IbR0GL1vhc76Kdebh4Empax9GKXCmPPJ27KXwNxmy9cWf03KsXfxIDwRHnA8xGs
         doM0pMPmUNV34FMd64eyZUZKCODgcZh4pcM0HrEdxOz4zP54iH6HsB9krBEmdA/Nkui9
         PI/7PoNrV2/XtkjReS8u+tnfTC+eU5UFjOICNRhX8SZniTG5EP7idnqK0G1pWS0PM8pV
         cucC7oHF8JHyL1LyLbWY1UL5wECZFZeWfYj6xQ8yD7kCAa5SvyIqIrzghR0XnPYMY4DE
         bsLPfs5nxIZTxDZcaHLFLZ/JGvBVxTb7INp87B0xlcdFC/yD36ur0QODi180gKQfJK1h
         YxdA==
X-Forwarded-Encrypted: i=1; AJvYcCWi70FGrMXUhLAOP1TgeHR7XUNlbT98nGVSOreirV4JIsXAcOZcmY27q1n3/fP0wn8Itl+i1VcuT9BGV/i1BQYX/peTw9Jq
X-Gm-Message-State: AOJu0YwL4rwLmW5VDKdwznAwSDC6fsU8M1+muWym6iN0vtRfGz7NqoQ6
	TYhefqJQbdoAjdbwVr+38E5lAWf8iVv6Fw8yekzvpy2CvD9S5Jnzeny/EEl/IL+OSQ==
X-Google-Smtp-Source: AGHT+IHgeAMf1+cGAIhix5rGRpA+zqYrLpk7WoUtK15pKAlNv3sQvH3L0f0P3bef1BLZ9RiIeTQhug==
X-Received: by 2002:a17:906:f845:b0:a3e:8300:1af3 with SMTP id ks5-20020a170906f84500b00a3e83001af3mr3107382ejb.30.1710508228508;
        Fri, 15 Mar 2024 06:10:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id jl27-20020a17090775db00b00a45c9945251sm1696627ejc.192.2024.03.15.06.10.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:28 -0700 (PDT)
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
	Eric Blake <eblake@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH-for-9.1 11/21] qapi: Make CpuDefinitionInfo target agnostic
Date: Fri, 15 Mar 2024 14:08:59 +0100
Message-ID: <20240315130910.15750-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XqbvuvRlpH7h

Generate the CpuDefinitionInfo type once for all targets.
In few commits @query-cpu-definitions will become generic
and all target will return their CPUs list.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/machine-target.json | 69 ----------------------------------------
 qapi/machine.json        | 63 ++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 69 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 0412400df3..7480921d33 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -212,75 +212,6 @@
                    'TARGET_LOONGARCH64',
                    'TARGET_RISCV' ] } }
 
-##
-# @CpuDefinitionInfo:
-#
-# Virtual CPU definition.
-#
-# @name: the name of the CPU definition
-#
-# @migration-safe: whether a CPU definition can be safely used for
-#     migration in combination with a QEMU compatibility machine when
-#     migrating between different QEMU versions and between hosts with
-#     different sets of (hardware or software) capabilities.  If not
-#     provided, information is not available and callers should not
-#     assume the CPU definition to be migration-safe.  (since 2.8)
-#
-# @static: whether a CPU definition is static and will not change
-#     depending on QEMU version, machine type, machine options and
-#     accelerator options.  A static model is always migration-safe.
-#     (since 2.8)
-#
-# @unavailable-features: List of properties that prevent the CPU model
-#     from running in the current host.  (since 2.8)
-#
-# @typename: Type name that can be used as argument to
-#     @device-list-properties, to introspect properties configurable
-#     using -cpu or -global.  (since 2.9)
-#
-# @alias-of: Name of CPU model this model is an alias for.  The target
-#     of the CPU model alias may change depending on the machine type.
-#     Management software is supposed to translate CPU model aliases
-#     in the VM configuration, because aliases may stop being
-#     migration-safe in the future (since 4.1)
-#
-# @deprecated: If true, this CPU model is deprecated and may be
-#     removed in in some future version of QEMU according to the QEMU
-#     deprecation policy.  (since 5.2)
-#
-# @unavailable-features is a list of QOM property names that represent
-# CPU model attributes that prevent the CPU from running.  If the QOM
-# property is read-only, that means there's no known way to make the
-# CPU model run in the current host.  Implementations that choose not
-# to provide specific information return the property name "type". If
-# the property is read-write, it means that it MAY be possible to run
-# the CPU model in the current host if that property is changed.
-# Management software can use it as hints to suggest or choose an
-# alternative for the user, or just to generate meaningful error
-# messages explaining why the CPU model can't be used.  If
-# @unavailable-features is an empty list, the CPU model is runnable
-# using the current host and machine-type.  If @unavailable-features
-# is not present, runnability information for the CPU is not
-# available.
-#
-# Since: 1.2
-##
-{ 'struct': 'CpuDefinitionInfo',
-  'data': { 'name': 'str',
-            '*migration-safe': 'bool',
-            'static': 'bool',
-            '*unavailable-features': [ 'str' ],
-            'typename': 'str',
-            '*alias-of' : 'str',
-            'deprecated' : 'bool' },
-  'if': { 'any': [ 'TARGET_PPC',
-                   'TARGET_ARM',
-                   'TARGET_I386',
-                   'TARGET_S390X',
-                   'TARGET_MIPS',
-                   'TARGET_LOONGARCH64',
-                   'TARGET_RISCV' ] } }
-
 ##
 # @query-cpu-definitions:
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 65702c2c78..9c44b8fa82 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -10,6 +10,69 @@
 
 { 'include': 'common.json' }
 
+##
+# @CpuDefinitionInfo:
+#
+# Virtual CPU definition.
+#
+# @name: the name of the CPU definition
+#
+# @migration-safe: whether a CPU definition can be safely used for
+#     migration in combination with a QEMU compatibility machine when
+#     migrating between different QEMU versions and between hosts with
+#     different sets of (hardware or software) capabilities.  If not
+#     provided, information is not available and callers should not
+#     assume the CPU definition to be migration-safe.  (since 2.8)
+#
+# @static: whether a CPU definition is static and will not change
+#     depending on QEMU version, machine type, machine options and
+#     accelerator options.  A static model is always migration-safe.
+#     (since 2.8)
+#
+# @unavailable-features: List of properties that prevent the CPU model
+#     from running in the current host.  (since 2.8)
+#
+# @typename: Type name that can be used as argument to
+#     @device-list-properties, to introspect properties configurable
+#     using -cpu or -global.  (since 2.9)
+#
+# @alias-of: Name of CPU model this model is an alias for.  The target
+#     of the CPU model alias may change depending on the machine type.
+#     Management software is supposed to translate CPU model aliases
+#     in the VM configuration, because aliases may stop being
+#     migration-safe in the future (since 4.1)
+#
+# @deprecated: If true, this CPU model is deprecated and may be
+#     removed in in some future version of QEMU according to the QEMU
+#     deprecation policy.  (since 5.2)
+#
+# @unavailable-features is a list of QOM property names that represent
+# CPU model attributes that prevent the CPU from running.  If the QOM
+# property is read-only, that means there's no known way to make the
+# CPU model run in the current host.  Implementations that choose not
+# to provide specific information return the property name "type". If
+# the property is read-write, it means that it MAY be possible to run
+# the CPU model in the current host if that property is changed.
+# Management software can use it as hints to suggest or choose an
+# alternative for the user, or just to generate meaningful error
+# messages explaining why the CPU model can't be used.  If
+# @unavailable-features is an empty list, the CPU model is runnable
+# using the current host and machine-type.  If @unavailable-features
+# is not present, runnability information for the CPU is not
+# available.
+#
+# Since: 1.2
+##
+{ 'struct': 'CpuDefinitionInfo',
+  'data': { 'name': 'str',
+            '*migration-safe': 'bool',
+            'static': 'bool',
+            '*unavailable-features': [ 'str' ],
+            'typename': 'str',
+            '*alias-of' : 'str',
+            'deprecated' : 'bool' }
+}
+
 ##
 # @CpuModelInfo:
 #
-- 
2.41.0
