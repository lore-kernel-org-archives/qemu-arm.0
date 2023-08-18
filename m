Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp1529360ejs;
        Thu, 17 Aug 2023 20:37:50 -0700 (PDT)
X-Received: by 2002:a05:6808:4d7:b0:3a7:9666:2a60 with SMTP id a23-20020a05680804d700b003a796662a60mr1396784oie.51.1692329870431;
        Thu, 17 Aug 2023 20:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692329870; cv=none;
        d=google.com; s=arc-20160816;
        b=PnCe4UFLa+/w2lvErDWl1yq5crRYtbaJSmC8ZQZHKQwp7bfYKggZmllgnkkh4nSA0H
         ggGsUjSY0uU55jH/IYCPrAWdbx8YOKa5KOKthdTE+9rsjz16pL0uL8QF+UsHodnk4iR/
         WzpGCUOCNe/Wj2f1EH1JO/mfcxvjOq3avssFWCXGAvlHh91hJgGquyg2AklP6gbT5np/
         5XEKyWXSKw73kgKuw0kLCFZ8q4oc4OQwsdqm19Jokq9101ffpPEB2n7XK2Er7YVf96Mx
         Fw4Zv0/8tmXUgKTGIR/27VRFO8axmtwr9VyQdVXFwUkJ+IgA7FWPjZ31Hq3mfUYZgw8g
         YdwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H1emdzczPX1kf85OC8CWYij+GP4tyOMLxPaUXdolahU=;
        fh=l+jVdA1Sv8scjpkNyWzFrXT4tT9tJSJi8l+2DA+sO28=;
        b=ETh0m7bO2R6j+ok5qqb+QujpjADlLZ0a5EhcPVWmThDGaEolLHf7ZLWh2kj1jrG2RK
         EhH5fcN34tTbHMv9qORilXEGLs6bkLlscQHKYOVnFeU48yLU6NM/q8TvKY13TZdrr0CT
         Bz8YyvvhqdpoUOd8jBw7JMVxmNVuAYSDIoVFz37eZYcuuke+cI9CeP76J6IoE4ivRx31
         AP28qEN70PHLKyH9CuK9/++1wJs2Ur4hDvrTtQLo7HPjZvLn/q73p++RvhD0i5xgmH9o
         U4yy/4JrnitUz+W59T7B9VqBx7G9GKPq7w+D7iVI4TB+SnF9l6Kxam5KmMy90rPloZKV
         3uxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=qZ6EGnFu;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2-20020aca0f02000000b003a412404e36sor684953oip.7.2023.08.17.20.37.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Aug 2023 20:37:50 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=qZ6EGnFu;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692329870; x=1692934670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1emdzczPX1kf85OC8CWYij+GP4tyOMLxPaUXdolahU=;
        b=qZ6EGnFut/wssFFasxWCRqHd4MrJ0jEMOMuLpPVufS+CDrHWVwzaOv82OEcrtLDG6K
         cCaGcDJfODTKHz09XjRYjMOCkNhHBXLlh1IjExuEwPjlju8FwzcQdlG2ke65etfaaOkd
         ttm3KMQaCDuQI32vaKx0OHo/3GSDK8hr7Hw6+Te0TfuEaIXS49X1Wrxzq0hyIBy9BZOZ
         nmk22VYKzDyk5jqhG/NdB3gKHdP13Zw1IHJW3ADNZ+5uvbbDCsR3u5fqVnMX5HCsd0zQ
         MzVxhByHHD8MbBLNhOgopNhTrA7Ggag7feF0mwt7kf7n9PTaVks0bVoTiQ9a58un7ozV
         nF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692329870; x=1692934670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1emdzczPX1kf85OC8CWYij+GP4tyOMLxPaUXdolahU=;
        b=WPic02N2tFw0zXEzhQuuV5U1WcOF5wT/bItKbzUEACjURycvqoP1eEMhwC+ip7u8E4
         okxKnZIqNdqbzqsO7lTMOyj7sRlxcjRsMrA8Fl6CD9OU72n3Y21LojyrvX4lYYY1nO/m
         3ZZSUC38omGeilKjRgjbiZXV+ZSJhODVukpVX+G5KM528ddDfTEcAM5gNO8X1GKNOJUM
         lvSeFj+pngsqdJaID8nYQf6OE4hcTaTJcMvjRyMwjjdVulaljcKYsATn4PiDEgvPovrR
         wSzeLU4xceLslol7gXMTVktM5okFRQX9OVRxFSSDXEhTUHj9w2Nz48+me6vOXBoG+mne
         0+6g==
X-Gm-Message-State: AOJu0Ywa6UEL6ClU1XrXcgmxBIRf4puDDySvxsiANk1JRbserZVOSxj4
	B4u/K9rIXHohTOpCKxjpeJRhrrIGqUcHogdnSys=
X-Google-Smtp-Source: AGHT+IGQ5Knb+NQmkR+R3mOv8/kdPLfxvKjjiqE1GJbdc0bpk++Hp+etUncd5YdtByD2BtrVgnfNuQ==
X-Received: by 2002:a05:6808:21aa:b0:3a4:225d:8135 with SMTP id be42-20020a05680821aa00b003a4225d8135mr1929676oib.31.1692329869927;
        Thu, 17 Aug 2023 20:37:49 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id c24-20020aa781d8000000b00686a80f431dsm484135pfn.126.2023.08.17.20.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 20:37:49 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH RESEND v5 17/26] gdbstub: Add members to identify registers to GDBFeature
Date: Fri, 18 Aug 2023 12:36:36 +0900
Message-ID: <20230818033648.8326-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818033648.8326-1-akihiko.odaki@daynix.com>
References: <20230818033648.8326-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aE+0HZnmPd5z

These members will be used to help plugins to identify registers.
The added members in instances of GDBFeature dynamically generated by
CPUs will be filled in later changes.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h  |  3 +++
 gdbstub/gdbstub.c       |  8 ++++++--
 target/arm/gdbstub.c    |  2 +-
 target/riscv/gdbstub.c  |  4 +---
 scripts/feature_to_c.py | 14 +++++++++++++-
 5 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 572abada63..f3f2c40b1a 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -13,12 +13,15 @@
 typedef struct GDBFeature {
     const char *xmlname;
     const char *xml;
+    const char *name;
+    const char * const *regs;
     int num_regs;
 } GDBFeature;
 
 typedef struct GDBFeatureBuilder {
     GDBFeature *feature;
     GPtrArray *xml;
+    GPtrArray *regs;
 } GDBFeatureBuilder;
 
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 4648a56088..e52a739491 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -418,9 +418,10 @@ void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
 
     builder->feature = feature;
     builder->xml = g_ptr_array_new();
+    builder->regs = g_ptr_array_new();
     g_ptr_array_add(builder->xml, header);
     feature->xmlname = xmlname;
-    feature->num_regs = 0;
+    feature->name = name;
 }
 
 void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
@@ -449,7 +450,7 @@ void gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
             name, bitsize, type);
     }
 
-    builder->feature->num_regs++;
+    g_ptr_array_add(builder->regs, (void *)name);
 }
 
 void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
@@ -464,6 +465,9 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
     }
 
     g_ptr_array_free(builder->xml, TRUE);
+
+    builder->feature->num_regs = builder->regs->len;
+    builder->feature->regs = (void *)g_ptr_array_free(builder->regs, FALSE);
 }
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index fc5ed89e80..dbc396a88b 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -264,7 +264,7 @@ static void arm_gen_one_feature_sysreg(GDBFeatureBuilder *builder,
                                        ARMCPRegInfo *ri, uint32_t ri_key,
                                        int bitsize)
 {
-    dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] = ri_key;
+    dyn_feature->data.cpregs.keys[builder->regs->len] = ri_key;
 
     gdb_feature_builder_append_reg(builder, ri->name, bitsize,
                                    "int", "cp_regs");
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index d4f9eb1516..a2ec9a3701 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -240,11 +240,9 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs)
         }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            g_autofree char *dynamic_name = NULL;
             name = csr_ops[i].name;
             if (!name) {
-                dynamic_name = g_strdup_printf("csr%03x", i);
-                name = dynamic_name;
+                name = g_strdup_printf("csr%03x", i);
             }
 
             gdb_feature_builder_append_reg(&builder, name, bitsize,
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
index e04d6b2df7..807af0e685 100755
--- a/scripts/feature_to_c.py
+++ b/scripts/feature_to_c.py
@@ -50,7 +50,9 @@ def writeliteral(indent, bytes):
         sys.stderr.write(f'unexpected start tag: {element.tag}\n')
         exit(1)
 
+    feature_name = element.attrib['name']
     regnum = 0
+    regnames = []
     regnums = []
     tags = ['feature']
     for event, element in events:
@@ -67,6 +69,7 @@ def writeliteral(indent, bytes):
                 if 'regnum' in element.attrib:
                     regnum = int(element.attrib['regnum'])
 
+                regnames.append(element.attrib['name'])
                 regnums.append(regnum)
                 regnum += 1
 
@@ -85,6 +88,15 @@ def writeliteral(indent, bytes):
     writeliteral(8, bytes(os.path.basename(input), 'utf-8'))
     sys.stdout.write(',\n')
     writeliteral(8, read)
-    sys.stdout.write(f',\n        {num_regs},\n    }},\n')
+    sys.stdout.write(',\n')
+    writeliteral(8, bytes(feature_name, 'utf-8'))
+    sys.stdout.write(',\n        (const char * const []) {\n')
+
+    for index, regname in enumerate(regnames):
+        sys.stdout.write(f'            [{regnums[index] - base_reg}] =\n')
+        writeliteral(16, bytes(regname, 'utf-8'))
+        sys.stdout.write(',\n')
+
+    sys.stdout.write(f'        }},\n        {num_regs},\n    }},\n')
 
 sys.stdout.write('    { NULL }\n};\n')
-- 
2.41.0
