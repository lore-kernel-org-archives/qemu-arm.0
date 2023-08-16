Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414166ejs;
        Wed, 16 Aug 2023 07:54:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:8421:b0:125:517c:4f18 with SMTP id c33-20020a056a20842100b00125517c4f18mr2475229pzd.8.1692197699483;
        Wed, 16 Aug 2023 07:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197699; cv=none;
        d=google.com; s=arc-20160816;
        b=DHdIpXCJB1+8IkhII/L9JJx5cvASTgd3PwQOn4PynSYcH1Xd5FROOKL3pjjRK5Ol2o
         +HZ1LMzMl5kb148eOm8H1ZU/FwF1bRAC0ImYXvxdoAxRo/E1K4fpWtcXnAMVQ6Tl1m5U
         VfSS3mHgyr3bgo2JAWbMg+scxyaYqoziIm6p767Ss+ZQOO9LA/GvePbjG/0zp1elUR6U
         OIylUTRxvHgy6Dvu0ptBWFMAs3co4RLmyaubRMUaGVanlAxrd1PM2xajP7tHZWOmVsSS
         4pQ+oXzzx0hijzufQ4XT0gSLRgPr3Y/6Zfj2O8q/7cXyWA7m49lSYO/eyw4omi5yl4EE
         4Ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6gfAeaNLA+PIokoYBBdAB0dQ8PQLZuwdbWdYv4LmQmA=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=dTPIYgZ5kcw5gDIPVQ89LLPmwK1jCCI2iNBG6+V4OTykrmu7V97Gf6riBnvkOw8Inp
         t16jnax8FqEo3aOjdrgVXqrwcLFb9f7WsCpY2GUFIsXt1v6eZINR0nftNIgtvOcZSE5a
         h9l3Pa4v+3q644yAzQdo9AzkpdcShEFVHYQOaXDiBAqrHz9ZczW6mwU9Avyj6oMZEBu5
         ZuYUdqKe6Ea3AzJt9Aufn3izq+vV3xgqlOPPZ7Ex5fi3tllJHW/ffKvU4VqIp1ie9Pu4
         8h4Maasq1sId1mVDqNFbWmSoAhJ4YlmNsOfltQpiqRBGVjTj4R0bOU+feKuF1G9k4g3d
         wmPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Brp3Z2k7;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k27-20020aa79d1b000000b00687c4dd9ef9sor8650554pfp.2.2023.08.16.07.54.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:54:59 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Brp3Z2k7;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197699; x=1692802499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gfAeaNLA+PIokoYBBdAB0dQ8PQLZuwdbWdYv4LmQmA=;
        b=Brp3Z2k7g8vqxTbdVQ/dJfcjW0h+j3yDqeIGxnVuhim7kQCZLaF8dhiHLfZEjP0Mvs
         6pyDN3b8PLLFlz8ZIIfYw+ZZjrU4jk730W8u3s7aELABk7mpaIM+iiNmSSoTe7DMQgz8
         Zb0EUeprTaEyY8JklH0qzNum4Oh2TbvP283SEOTbH/0jeTLaN9Atd1KQ+PfvJPv4NWm2
         xk7GpEyfp8ew3V29WzyeVLEu1cs7/aT+WzEviBiAbnLlz2U8IrtJFLQ3kcGVYhUl1IMZ
         3rQoQdrDV7OixVtw1szynCb0qGIMCLjSNdm6YCKgg5vIKwaXy0uKzdR5kwtu3ZgvE8a2
         ZqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197699; x=1692802499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gfAeaNLA+PIokoYBBdAB0dQ8PQLZuwdbWdYv4LmQmA=;
        b=grrYQWYWi1gKsHAF1uDse3l3m1n65BGKfiLgs19e/ix8dT5ES+VnT4OG7EDEQvXs5d
         ow/uiXJMBrsmg4P/ST7Mjj1BWYvUL2PGSbDBrDBO1x1FkaBD74KXbWtH6FEi+LhviDd4
         7mmvZi+LZX2p+AJm6c3XSgbuJ2oZQapp3TKlv90l2s2m6ovqkexiJduIYCdoNMX8Jm9d
         XAcsU6NcGTip2BgFT+m/nZejQY1mY2pHqUQj7cIh4jYHsjAo6IyaygXsyW+W0XiTdMnd
         wBVJDbpzIDasAsF2YWiJUJoCGU3u2be9nPgWQKu73dMAmz1m/RhxUdpXvki54yDRKHjy
         onvQ==
X-Gm-Message-State: AOJu0Yyqjv75XITLK86RbINq5ZPcbafnEfpm2uhxGu1nDmDjyQGHYbp+
	D3nXeU+GfjrbIzWe/0Wv9e9QIg==
X-Google-Smtp-Source: AGHT+IEis8qqHjy39MXx9xGdlx82+/3PxpX6nkH6Ik1MHFYleCZFpA59/fYnIBPFIBGb4Mw284yU7A==
X-Received: by 2002:a05:6a20:a123:b0:13e:6447:ce45 with SMTP id q35-20020a056a20a12300b0013e6447ce45mr2385259pzk.43.1692197698996;
        Wed, 16 Aug 2023 07:54:58 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:54:58 -0700 (PDT)
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
Subject: [PATCH v4 17/25] gdbstub: Add members to identify registers to GDBFeature
Date: Wed, 16 Aug 2023 23:51:38 +0900
Message-ID: <20230816145155.21049-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: zrgCeKrku/7V

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
