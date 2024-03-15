Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989579eju;
        Fri, 15 Mar 2024 06:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcgQ6vPtdZAT0S3hULZgJBHDfDD55x5gYjdfcvJFBObIW2+61WPUCr4rxL1moj7KnwLThUJI7Oxi7C90xUdHGjhhW/wMce
X-Received: by 2002:a19:9152:0:b0:513:c223:f0e4 with SMTP id y18-20020a199152000000b00513c223f0e4mr2449471lfj.10.1710508222147;
        Fri, 15 Mar 2024 06:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508222; cv=none;
        d=google.com; s=arc-20160816;
        b=QCJUrr2T1rH3FJQKg8bFeqODeci+r4Vd0Yp1E3aPl4vjtbjm/+FIHwn4vtTVUC9YjL
         eaRYo0vEk+WhveGO8mCeACijBHErv0GZZ56VHusPpw0a9eyoXWUqaljTMa74kUlBPoUV
         1M5/gibzeKh817UTOYGt5KndWkJWqHLOujrn3tt10wf2TbrESu0pB2fxnEuXy0EX+LLu
         BDndc+0/jiXSugfMseTnj2Yw2gqtTzKRO0z/4jB3WrsL5D/Jzg8ikJegJGYkL+ben3K+
         a16r1mL15plIGGR3bfgQ2psaDuvKMr2yd7TnXPvVBKkql/8DGk73yjvXtU0qQeF9cb0D
         f8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=juKrFHTenueZGgaczYCixm7yTPX2XVgDuiXA1GdKgho=;
        fh=I2sIgDZIVFGF+p8TCZb41LgxPy4tdHwEAZSipQwyPnc=;
        b=BCAumuamrqf+Vt88R0r56jpPe3jIYA0aqhKMLOAVlEix/B2jLxbpvQCFA3HwpFQjRA
         v5Kf7mvo6tiMjB7foFZHD2KBFOAvt5A/e4Tukl6Ei3Gus+HHgt2600tGMM7tcJjY5UT5
         FZ/fcXyv4yHExPymhGGPgYpv7nsJzfqgW5c+SXxg+skYn/pXxe8Gd5s/fjl6GjUsmCfJ
         mBwMsXVeZNd9/dOrCpSisyRGghyDAm6Uez2c4S4FkhqG6DJSt7g2iBQ42RIiSdbHQMam
         zqwt1p0RbkMJPyjIlEwIu26vwLCvbD21vD1yd59NfM0ubCOkbFsTHSfDBeofBoLVgQDT
         mpxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmrnK+Dt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h7-20020ac25967000000b005135b81f304sor1106655lfp.24.2024.03.15.06.10.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmrnK+Dt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508221; x=1711113021; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juKrFHTenueZGgaczYCixm7yTPX2XVgDuiXA1GdKgho=;
        b=OmrnK+Dt6M/v3OWr0P2XOriVHWLQswVvUzZqz7S5T8tINTynTrmeR8JxcSq07C9pw5
         DKQuycLk8pjR6tFmnPpIHGeo7WoSamLX9ApMSx85lkg0E0gsDy3kLPkCXwE2EKWRjiZj
         XHvlRuhqNWIkROXaMMHI8BFsKSHp4gnE5AXPMNbE01nuKef4XmeyX3UnOdN13UqRWcSt
         2Jl8medIbKODEsX4rsLy8f04pMYW0Mhl/9ZbKPtOmtmhqIT5zbn0SfTbYHv7dK7i4q3V
         yKhqGXzsVPiPMaSoSrnikXojsQ3FWSVXXXNAwCROwPVVpUYqPNbh2TFx7ebyv2IxqIQc
         Y9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508221; x=1711113021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juKrFHTenueZGgaczYCixm7yTPX2XVgDuiXA1GdKgho=;
        b=wyT5KQelXcyaMJNu6Bq1HVGfJfp6e/ZH9EA6TJZ8X7koPcKUJ1RRFMXiw8z41mLc5Q
         Y8xg+s8Fl4487Cbhn56hFz2NvNeYGTOwrVVHlDD+zhuW97/B/KSSQEFZmjlwDNrLem/B
         87PHvs9zqtefU9J7mvmHXS/iRNs/rqMonbbbk+WZUiD+BxXV67Yfnn5x4B879lsx112i
         v9rEmnl2uVXN+hKrv+R9ddXsT280A38GVk4W2fTsYBJ+tBPdU+YmitPKqrcZrE8LR+Xf
         Ycuh8ukXWLUdgsUH1QPvKkzpG1oTSg1v7ZxvrvTP+qbfsrsJeS4HAhQERQHJ4OqHC2JO
         lsKg==
X-Forwarded-Encrypted: i=1; AJvYcCU0T2e6ZXjdjWn3vnYbxBQScZuQACyMh0WPK2ppStLe83H9F4mh904z8dVaHyU8LmUc8YlcV3PJ4hB5G16wm9qVm/r60ZzR
X-Gm-Message-State: AOJu0YyE5RgypwqRZdmR0Cto5I5YQg1L6Uf6izJW54Vz9FaSuKIf8gF4
	6nOLVCTIhWmWV4oWdtvFC+IpnmhlNtPZzPjpZCXLqg/WaxZy2CbWZUZan3ckdm+qSg==
X-Google-Smtp-Source: AGHT+IG/fkrm3CO2MahErI9fFc2gtBPFkzwyIu619VO5D+ezRzl3dqx8ZqO1u+VaQLLAaFAD47y0KA==
X-Received: by 2002:a19:f807:0:b0:513:2bea:d0e0 with SMTP id a7-20020a19f807000000b005132bead0e0mr2965749lff.62.1710508221669;
        Fri, 15 Mar 2024 06:10:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b00a4671d37717sm1605908ejv.52.2024.03.15.06.10.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:21 -0700 (PDT)
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
Subject: [PATCH-for-9.1 10/21] qapi: Make CpuModel* definitions target agnostic
Date: Fri, 15 Mar 2024 14:08:58 +0100
Message-ID: <20240315130910.15750-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EbCB/z5UvrKM

CpuModelInfo, CpuModelExpansionType and CpuModelCompareResult
are not restricted to any particular target. Define them in
machine.json to generate them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/machine-target.json | 78 ---------------------------------------
 qapi/machine.json        | 79 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 78 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 5f17b25d50..0412400df3 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -6,84 +6,6 @@
 
 { 'include': 'machine.json' }
 
-##
-# @CpuModelInfo:
-#
-# Virtual CPU model.
-#
-# A CPU model consists of the name of a CPU definition, to which delta
-# changes are applied (e.g. features added/removed). Most magic values
-# that an architecture might require should be hidden behind the name.
-# However, if required, architectures can expose relevant properties.
-#
-# @name: the name of the CPU definition the model is based on
-#
-# @props: a dictionary of QOM properties to be applied
-#
-# Since: 2.8
-##
-{ 'struct': 'CpuModelInfo',
-  'data': { 'name': 'str',
-            '*props': 'any' } }
-
-##
-# @CpuModelExpansionType:
-#
-# An enumeration of CPU model expansion types.
-#
-# @static: Expand to a static CPU model, a combination of a static
-#     base model name and property delta changes.  As the static base
-#     model will never change, the expanded CPU model will be the
-#     same, independent of QEMU version, machine type, machine
-#     options, and accelerator options.  Therefore, the resulting
-#     model can be used by tooling without having to specify a
-#     compatibility machine - e.g. when displaying the "host" model.
-#     The @static CPU models are migration-safe.
-#
-# @full: Expand all properties.  The produced model is not guaranteed
-#     to be migration-safe, but allows tooling to get an insight and
-#     work with model details.
-#
-# Note: When a non-migration-safe CPU model is expanded in static
-#     mode, some features enabled by the CPU model may be omitted,
-#     because they can't be implemented by a static CPU model
-#     definition (e.g. cache info passthrough and PMU passthrough in
-#     x86). If you need an accurate representation of the features
-#     enabled by a non-migration-safe CPU model, use @full.  If you
-#     need a static representation that will keep ABI compatibility
-#     even when changing QEMU version or machine-type, use @static
-#     (but keep in mind that some features may be omitted).
-#
-# Since: 2.8
-##
-{ 'enum': 'CpuModelExpansionType',
-  'data': [ 'static', 'full' ] }
-
-##
-# @CpuModelCompareResult:
-#
-# An enumeration of CPU model comparison results.  The result is
-# usually calculated using e.g. CPU features or CPU generations.
-#
-# @incompatible: If model A is incompatible to model B, model A is not
-#     guaranteed to run where model B runs and the other way around.
-#
-# @identical: If model A is identical to model B, model A is
-#     guaranteed to run where model B runs and the other way around.
-#
-# @superset: If model A is a superset of model B, model B is
-#     guaranteed to run where model A runs.  There are no guarantees
-#     about the other way.
-#
-# @subset: If model A is a subset of model B, model A is guaranteed to
-#     run where model B runs.  There are no guarantees about the other
-#     way.
-#
-# Since: 2.8
-##
-{ 'enum': 'CpuModelCompareResult',
-  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
-
 ##
 # @CpuModelBaselineInfo:
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 4bc38e86fd..65702c2c78 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -10,6 +10,85 @@
 
 { 'include': 'common.json' }
 
+##
+# @CpuModelInfo:
+#
+# Virtual CPU model.
+#
+# A CPU model consists of the name of a CPU definition, to which delta
+# changes are applied (e.g. features added/removed). Most magic values
+# that an architecture might require should be hidden behind the name.
+# However, if required, architectures can expose relevant properties.
+#
+# @name: the name of the CPU definition the model is based on
+#
+# @props: a dictionary of QOM properties to be applied
+#
+# Since: 2.8
+##
+{ 'struct': 'CpuModelInfo',
+  'data': { 'name': 'str',
+            '*props': 'any' }
+}
+
+##
+# @CpuModelExpansionType:
+#
+# An enumeration of CPU model expansion types.
+#
+# @static: Expand to a static CPU model, a combination of a static
+#     base model name and property delta changes.  As the static base
+#     model will never change, the expanded CPU model will be the
+#     same, independent of QEMU version, machine type, machine
+#     options, and accelerator options.  Therefore, the resulting
+#     model can be used by tooling without having to specify a
+#     compatibility machine - e.g. when displaying the "host" model.
+#     The @static CPU models are migration-safe.
+#
+# @full: Expand all properties.  The produced model is not guaranteed
+#     to be migration-safe, but allows tooling to get an insight and
+#     work with model details.
+#
+# Note: When a non-migration-safe CPU model is expanded in static
+#     mode, some features enabled by the CPU model may be omitted,
+#     because they can't be implemented by a static CPU model
+#     definition (e.g. cache info passthrough and PMU passthrough in
+#     x86). If you need an accurate representation of the features
+#     enabled by a non-migration-safe CPU model, use @full.  If you
+#     need a static representation that will keep ABI compatibility
+#     even when changing QEMU version or machine-type, use @static
+#     (but keep in mind that some features may be omitted).
+#
+# Since: 2.8
+##
+{ 'enum': 'CpuModelExpansionType',
+  'data': [ 'static', 'full' ] }
+
+##
+# @CpuModelCompareResult:
+#
+# An enumeration of CPU model comparison results.  The result is
+# usually calculated using e.g. CPU features or CPU generations.
+#
+# @incompatible: If model A is incompatible to model B, model A is not
+#     guaranteed to run where model B runs and the other way around.
+#
+# @identical: If model A is identical to model B, model A is
+#     guaranteed to run where model B runs and the other way around.
+#
+# @superset: If model A is a superset of model B, model B is
+#     guaranteed to run where model A runs.  There are no guarantees
+#     about the other way.
+#
+# @subset: If model A is a subset of model B, model A is guaranteed to
+#     run where model B runs.  There are no guarantees about the other
+#     way.
+#
+# Since: 2.8
+##
+{ 'enum': 'CpuModelCompareResult',
+  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
+
 ##
 # @SysEmuTarget:
 #
-- 
2.41.0
