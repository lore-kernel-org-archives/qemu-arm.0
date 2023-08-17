Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp839088ejs;
        Wed, 16 Aug 2023 22:31:14 -0700 (PDT)
X-Received: by 2002:a05:6830:1d7c:b0:6bc:f85e:ab0 with SMTP id l28-20020a0568301d7c00b006bcf85e0ab0mr4119542oti.3.1692250273935;
        Wed, 16 Aug 2023 22:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692250273; cv=none;
        d=google.com; s=arc-20160816;
        b=xPjc0yLsiRCnbNL2dpPYC1wY80T0q5POkdyonb6Tu7dT5qobYCRmX3SSC+/w1Z5zpy
         1MTF4FZrYHoNs48r/Tp3LSPZ3F+p48k8xsV9SOREA3frKdDefKVopI5rO4FtWZBmfbX3
         ynZNcmmLGcI8pjiPRT4Ikygcn+6pfep4ScHTgxLPZzjToNRX0jNVPGAZ1XngX+dqtWzm
         4jV7m+jMd9qlXAENPdeB14yjAJ40mvmDDaqva7rlM7V8XZBGHpLUz0ziJBRJ1ewgSIlF
         gIF/8beOZAarwOg5blCb/KLGrX625Sq5TcKRJTSBwpsxq1sY8Swq/YqpIz7bHB+36QOC
         s/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=Xhad7WjvPx7eVfbj1VHVyVRROZCVff1giugoiMuvUlKOMzY5YL8ziPaYh6uYAvEQ2n
         ssvw2u4VJKu0bX7dKlFL+vYC/NrQ0zwZJsWSWLz69ef4ZQdtET2/47vQ8D6gxi4kZrEA
         Qv72g+geBvdwmVOlwPLfi2TH2EfpPtKJPTDSoszSfRhwqfoLlnSjrywdskr94+SCMEQs
         w9uJsyVxnqnyrZsW5vklnMoTwFlACDbrfzkwKUiltD0LqQFNJmcGWHSyz1GmGMlTuYA8
         125z7/2oXWGM/D8FXBaVt1WO9XoAUDQduiHxk3Lj4KxmlJH3mfZJcitC6HGBj39Ip5Qk
         bHXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="1gu5/KBt";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n7-20020a9d7107000000b006bd0802ef85sor8075598otj.21.2023.08.16.22.31.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 22:31:13 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="1gu5/KBt";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692250273; x=1692855073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        b=1gu5/KBtHaxsjhSshR4TffmkUjm9NNZqkA2HPqW47cQkgYgjBIwJ1rEYLhK2dMrbfk
         KCpEEVFKK6kW2W3VBB+K/2m9mjsRav0hCsIBVA7zS3EPEwSTzNh4JfSMfprwnCX1LBGN
         cuYWA8Ft3VtloG2xnFrYOD/lW+NKkKJB3bf3auwbxr5P+1xUiybf4/xgh7Tc8BcnZV2I
         O4SlFoBoybwhodyGt0zAr0kyYpXJ4pc2ehBMvgtq1rionxX9fwEIZYmOf/GGrAS6HvQb
         MuhziZ4+uhHfeXXGLbU/UcXAeSNQdVsUqqhV8hO5r2IW2xoazbF0wKAHyWjlMwpEYQiG
         nvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692250273; x=1692855073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        b=PeH/tH8w2dyx404zCJfyTZM+MBiTR40gr1OdF+O2u8ozUjt1QZ8v9FUVG6igXsmOwJ
         /LZtXMXeIbpyh0zI4Ojzk2f55LfAvB+QQlrT6FrwL9Egf5fDBb9NyTOCutHMOEikoXOw
         mjAMz+SjKEsKFMRz6mUNnFdW8uYuUItnFoCJG4sufhw5LLgdEgsMdNcp4He2nABWb9Ys
         +XIE1VolRvSHpiL4w9/vDeHBS5jYPrqgc8Li7gpIgU/14BtKBuKD91au6BWnWbRiaiYo
         Kg+hbfSRUID39AruYZZ7w3OEKBy4Upb/P3rM6ISyJFNhVzdGg5sLhFwF7F/EOEn7QRfv
         avGQ==
X-Gm-Message-State: AOJu0YxPBGg8TBwkhwPr0/zrIW2Cakf5/2Fz8aw5fHZw2FzTxnvUq7zl
	2o+9kyYu3M21LaWYxfXG5tC8lw==
X-Google-Smtp-Source: AGHT+IF3SYiv+QLBhO40iLnk+nijyWoh0NOYk76NZi+ZZu5c10QkTfpkv1zIIUkiZDdBrVJvdZFvKg==
X-Received: by 2002:a05:6870:4711:b0:1b3:715c:463e with SMTP id b17-20020a056870471100b001b3715c463emr4818745oaq.0.1692250273292;
        Wed, 16 Aug 2023 22:31:13 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j18-20020aa783d2000000b00662610cf7a8sm12339407pfn.172.2023.08.16.22.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 22:31:12 -0700 (PDT)
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
Subject: [PATCH v5 03/26] gdbstub: Add num_regs member to GDBFeature
Date: Thu, 17 Aug 2023 14:29:50 +0900
Message-ID: <20230817053017.24207-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817053017.24207-1-akihiko.odaki@daynix.com>
References: <20230817053017.24207-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: C1XJyLNGBEgH

Currently the number of registers exposed to GDB is written as magic
numbers in code. Derive the number of registers GDB actually see from
XML files to replace the magic numbers in code later.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h  |  1 +
 scripts/feature_to_c.py | 46 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 3f08093321..9b484d7eef 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -13,6 +13,7 @@
 typedef struct GDBFeature {
     const char *xmlname;
     const char *xml;
+    int num_regs;
 } GDBFeature;
 
 
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
index bcbcb83beb..e04d6b2df7 100755
--- a/scripts/feature_to_c.py
+++ b/scripts/feature_to_c.py
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import os, sys
+import os, sys, xml.etree.ElementTree
 
 def writeliteral(indent, bytes):
     sys.stdout.write(' ' * indent)
@@ -39,10 +39,52 @@ def writeliteral(indent, bytes):
     with open(input, 'rb') as file:
         read = file.read()
 
+    parser = xml.etree.ElementTree.XMLPullParser(['start', 'end'])
+    parser.feed(read)
+    events = parser.read_events()
+    event, element = next(events)
+    if event != 'start':
+        sys.stderr.write(f'unexpected event: {event}\n')
+        exit(1)
+    if element.tag != 'feature':
+        sys.stderr.write(f'unexpected start tag: {element.tag}\n')
+        exit(1)
+
+    regnum = 0
+    regnums = []
+    tags = ['feature']
+    for event, element in events:
+        if event == 'end':
+            if element.tag != tags[len(tags) - 1]:
+                sys.stderr.write(f'unexpected end tag: {element.tag}\n')
+                exit(1)
+
+            tags.pop()
+            if element.tag == 'feature':
+                break
+        elif event == 'start':
+            if len(tags) < 2 and element.tag == 'reg':
+                if 'regnum' in element.attrib:
+                    regnum = int(element.attrib['regnum'])
+
+                regnums.append(regnum)
+                regnum += 1
+
+            tags.append(element.tag)
+        else:
+            raise Exception(f'unexpected event: {event}\n')
+
+    if len(tags):
+        sys.stderr.write('unterminated feature tag\n')
+        exit(1)
+
+    base_reg = min(regnums)
+    num_regs = max(regnums) - base_reg + 1 if len(regnums) else 0
+
     sys.stdout.write('    {\n')
     writeliteral(8, bytes(os.path.basename(input), 'utf-8'))
     sys.stdout.write(',\n')
     writeliteral(8, read)
-    sys.stdout.write('\n    },\n')
+    sys.stdout.write(f',\n        {num_regs},\n    }},\n')
 
 sys.stdout.write('    { NULL }\n};\n')
-- 
2.41.0
