Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431328ejo;
        Tue, 12 Dec 2023 22:42:50 -0800 (PST)
X-Received: by 2002:a05:6808:11cf:b0:3ba:41b:bacd with SMTP id p15-20020a05680811cf00b003ba041bbacdmr6444730oiv.105.1702449770317;
        Tue, 12 Dec 2023 22:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449770; cv=none;
        d=google.com; s=arc-20160816;
        b=zOacr7ZcnLVbTMaesFm7MYgwymukmJOIsuxm1UDjmkm24WXJkKEomyiREunm1AQEnE
         FxFU7aHWs9Jyd+qfps1eKfhkpaZXgSkyYQDeFU+2hIiPOhAZoUYdtQkZ75awWDzJWkPK
         mMPsgnlOY5hQx5Jn/NH+haOdPFslFxyaZH/RK0VOc65+Fo9XnHj6L70mTIvJEwzwf7ei
         ckJJemdVXy+PmQ1HBT3878OseGQsDYZLwxnTvChCjPF+ivv9ZVekRIM3snzKrn7BZSps
         ue9wzuh/Q0RLlH1md9hWyL8knuTAe94DRXpLVpKzbCxzoFk7ap8x6jxIsmeKvIQCiO0M
         FFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=O7ILKFsi9ywq2Ox/zLkxDLDmYoxOoBk7KrvuMPbhQDQ=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=g7Nra0MJaHRiX5Gc+1SmhtGbK0Q9h05HVQnJeSZmTFgoipiyDONkW8rZ1xpSGRyl56
         pbryex4643dSbEbKN70U31/69edkb0sov9H7GtaFMSEWVbSkwGvocF09DcLmrFnzLnrj
         SNDAvXEQvyarY86AMnDp2Dvhm3vzCMyk5H5uObVzpVCnUD/BJoZ8/JwAl7tM11MSDg8T
         DKFr7mtfxz6k+EbRqq+06ZxUJP2rymb6duKhUiJeg6NLvZW8nVAVDIUEO9DhuptGxpwk
         lnCiIyrJIw79a09tVWCpiUQj+SyNAGxTUvN/A5o52/euZLrhIjRP0lG8CfAPNaWtQXvU
         AtJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=bbJCp7Jt;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5-20020aca1205000000b003b8b0ee53ccsor8505162ois.18.2023.12.12.22.42.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:42:50 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=bbJCp7Jt;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449770; x=1703054570; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7ILKFsi9ywq2Ox/zLkxDLDmYoxOoBk7KrvuMPbhQDQ=;
        b=bbJCp7JtwPuDVPUw7QKlcPoSks0vXzwOcLn7ozH0sXH/Ew/cn2H4XNsyzaIqq0lVYK
         Hnw7ZowICCFHONwzDna+KKar76yNQGlZaKC/RDoy2dbtkS7p0q3Mn1oa2uYONzTxKJmc
         hgJJcfXL7Lq/QFOtymA4NHrQ9zQBAEwFwR0NsY5Azk7++L73OW0gurNdSck6ICAs9B6p
         z20frM/sjkqNBeqJw95KN7gxArFtIz/6PC7EdDW0Z8MLb4x33KbHrt6G0SflEufXXEgl
         uvPERUHGgng6zakYuZOnLmg8qRCq/KCBCGS2zioPGsymByNWAv91MPXQ3/L6hxmMRJXr
         R01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449770; x=1703054570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7ILKFsi9ywq2Ox/zLkxDLDmYoxOoBk7KrvuMPbhQDQ=;
        b=nbbE+nNHM56tLTxV5DtoouasY7yaWBgZp3UhsQOJoMKqQctqKCg7OCbnUtVRtR0+yO
         1LfeeTquW6/iaqqJL5WsX5+CN+w8V1DSR3FaOFOyS3KKfULJLRVrGkYkd8LRW+wjrwZh
         Rurdyeq761DCao4FXONUa4hsnzh9cRHVaY1wN7X73PK4U8CyZrWGcvSqamiLHnpZq6Vv
         3IcHPTEfS4MtNn+Dn9UdlVu/bTF1mkMZ/2OQZeUPSJRAkKfiWfeZCdrMe3a3uFbbst80
         IOZyovFl6fW797hEqd1wiDsgbqeuyqVBsTwFJIlgyyItLyaPyF/rx9QcirrlOey41i2c
         v//A==
X-Gm-Message-State: AOJu0YyIbNW/l4nrT8hnOQJEkB3SM5Fb08LJl4lI7/swiFV+lK4vW7J3
	igV/pOJtC+G8LUoFCrRoCe659g==
X-Google-Smtp-Source: AGHT+IHUJ7Q22Nuyc2efcKTlcrilmy5Waw8Mz2ngDq6p5F8FeZmi9VKxWxy8Xpi/geONyk1DGBQ4XQ==
X-Received: by 2002:a05:6808:1a23:b0:3b9:db46:8eec with SMTP id bk35-20020a0568081a2300b003b9db468eecmr9404198oib.3.1702449769859;
        Tue, 12 Dec 2023 22:42:49 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id r9-20020a63ec49000000b005b9083b81f0sm9372900pgj.36.2023.12.12.22.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:42:49 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:09 +0900
Subject: [PATCH v17 10/14] gdbstub: Add members to identify registers to
 GDBFeature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-10-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: 8IaAfppEAcwW

These members will be used to help plugins to identify registers.
The added members in instances of GDBFeature dynamically generated by
CPUs will be filled in later changes.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h  |  3 +++
 gdbstub/gdbstub.c       | 12 +++++++++---
 target/riscv/gdbstub.c  |  4 +---
 scripts/feature_to_c.py | 14 +++++++++++++-
 4 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 82a8afa237f0..da9ddfe54c5b 100644
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
     int base_reg;
 } GDBFeatureBuilder;
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 801eba9a0b0b..420ab2a3766b 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -419,9 +419,10 @@ void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
     builder->feature = feature;
     builder->xml = g_ptr_array_new();
     g_ptr_array_add(builder->xml, header);
+    builder->regs = g_ptr_array_new();
     builder->base_reg = base_reg;
     feature->xmlname = xmlname;
-    feature->num_regs = 0;
+    feature->name = name;
 }
 
 void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
@@ -440,10 +441,12 @@ void gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
                                     const char *type,
                                     const char *group)
 {
-    if (builder->feature->num_regs < regnum) {
-        builder->feature->num_regs = regnum;
+    if (builder->regs->len <= regnum) {
+        g_ptr_array_set_size(builder->regs, regnum + 1);
     }
 
+    builder->regs->pdata[regnum] = (gpointer *)name;
+
     if (group) {
         gdb_feature_builder_append_tag(
             builder,
@@ -469,6 +472,9 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
     }
 
     g_ptr_array_free(builder->xml, TRUE);
+
+    builder->feature->num_regs = builder->regs->len;
+    builder->feature->regs = (void *)g_ptr_array_free(builder->regs, FALSE);
 }
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 68d0fdc1fd6c..d9b52ffd09b6 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -266,11 +266,9 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
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
 
             gdb_feature_builder_append_reg(&builder, name, bitsize, i,
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
index e04d6b2df7f7..807af0e685c3 100644
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
2.43.0
