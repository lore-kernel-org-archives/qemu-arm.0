Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365294ejs;
        Wed, 16 Aug 2023 06:42:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:99a7:b0:134:6839:c497 with SMTP id ve39-20020a056a2199a700b001346839c497mr2233487pzb.11.1692193368757;
        Wed, 16 Aug 2023 06:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193368; cv=none;
        d=google.com; s=arc-20160816;
        b=NiHHc5OqsIosu0TzrnQiUSG+L4yhtuGTnVIRkAdUUhiVUT/yU08KQ0eAlU12E05jOm
         sSQCO5lEIZbr2B/12hK4PSWArY70uO2c1zj79x3NZiO1rNa+u3MMuRFd8OrRTnFt+Tc8
         oQMTuhaWkMx/+lc9LwWaw3R2OGc5y29xKO9ESms2GF7cJrLGy8UuuEwyIv9Jxa/asuIE
         S6P4e4lO0Qh8cZI1BLXf7L+Tv5ju1NZKZOwvLIMH28TSeqq++z5BCMqZaidpizqjGD/+
         zxkCiPEbGF5+6YQ6TYLZlAJFn1SjG8yCTh8TBJImtmtIVqTXRbmTHkPN5J5oGZJ0vxf9
         YQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6gfAeaNLA+PIokoYBBdAB0dQ8PQLZuwdbWdYv4LmQmA=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=CFvxegqd5LwdLmdvBt0RNL+y0Bqi8iXdHFQLh7DyoP8qNxB2KiXCHXlBRW2qbdCsdW
         gPu4EO5M5ZL2URVjJPecvymPXOJ2BMlE2E6jON02h+Ybk9PE5sZ4OJWa5AMrbswFZFv4
         gtWNBVitjWGCvHszxaa6IYb8Oivuc4HgsXGB7eaBfE6Uwie+WaifsmOvL17PJs0HOWeu
         knhhf3mZKvWeUDcGKccr9vi/0fKJrX9/AOWU0jMVzvzGBjR/CTtzCQH8ioA5FPeH6/zD
         s2k5SLeDAmaXE1pd3FRn33CiXioDxWdLO1fQStFk6amLKT2ajfG0wjW3eRQyZeot00V9
         fzkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=p4jIPIW8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i16-20020aa796f0000000b00687b2cd8240sor8523821pfq.12.2023.08.16.06.42.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:42:48 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=p4jIPIW8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193368; x=1692798168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gfAeaNLA+PIokoYBBdAB0dQ8PQLZuwdbWdYv4LmQmA=;
        b=p4jIPIW8F7FZ15gXgrZC0bslxfBNgPtWNcSyqtzraoqaroZwOzPaiIInO0TSmMYZzO
         9xAqaEfDmfZLwfb0fnEmPtLVcNT+DUGPC5gaywX8DrZ9xm9zvJJCjA47A7K4jQknlo9Q
         bw55ibQKAIbh2jEjcBVBBUQ+B9oRxSvDmd21LavG8NQCug3VsVYYb7C04lCLDPStO3Ur
         SUNHiyFzPZcXQkAP1l0Yx2ti90H2QwtO6vSvoT/IJR6nuhxmi081YviOJ6fshy4827Qj
         XKTVZlG5YmKTwzhJ9yms+S+wW1FS3/eCQpdtxn25EG8JmapGcoacFSG3jht+MVs/91o/
         gmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193368; x=1692798168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gfAeaNLA+PIokoYBBdAB0dQ8PQLZuwdbWdYv4LmQmA=;
        b=GgyVPoLb0+O4o7MyB8hp1R8OXFKf3ECxd811bi4P1jIhRnCJjJINcYPcN5/GZiJD0p
         dMtYlTDHpCn3uyOXgARRSx5qt5Iqjmpio3vnPd3yuG5rHnXBrjVQVYp6gkUAJ9nvJhxZ
         KVEhyghC6xmc7iTCI7POTn9xOUsCoPhZouj8KqdFzgD3XGZB/4n9Y8Pvd/cI3imsh0Cy
         5VJZKfizrPnPpEBVDe+YtSBt9G6sEFNzk3IvBKgi+M+ESZZVrQZvqw6L0ZugXdwC55Tk
         a4JSaAkaA802/t1qqKVtYVID6T2/sHCiFwfeaPkpfTmPwQEDU5Rjr39s1GlbdC1kXaTL
         3iSQ==
X-Gm-Message-State: AOJu0YyqPcdESOROzXav2xsaOL/NdkdHxH+056wFi+bdwpcvnr9cKl2B
	xXgeOyr6Ro/VNGThw6dqFMni0A==
X-Google-Smtp-Source: AGHT+IG/nPYMSYK6MQ6Gu1ZAPxNnHYFIvZlhimH4Pb3Ek6ZXKHGwleUsB56z7RG7mu/EGmUiIRX2Hg==
X-Received: by 2002:a05:6a20:258a:b0:125:f3d8:e65b with SMTP id k10-20020a056a20258a00b00125f3d8e65bmr2046108pzd.18.1692193368270;
        Wed, 16 Aug 2023 06:42:48 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:42:48 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 17/25] gdbstub: Add members to identify registers to GDBFeature
Date: Wed, 16 Aug 2023 22:39:27 +0900
Message-ID: <20230816133938.18310-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9bAUxdwUf+lg

These members will be used to help plugins to identify registers.
The added members in instances of GDBFeature dynamically generated by
CPUs will be filled in later changes.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h  |  3 +++
 gdbstub/gdbstub.c       |  8 ++++++--
 target/arm/gdbstub.c    |  2 +-
 scripts/feature_to_c.py | 14 +++++++++++++-
 4 files changed, 23 insertions(+), 4 deletions(-)

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
index ccb4ed9d4b..e4fbdebca4 100644
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
