Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp412852ejs;
        Wed, 16 Aug 2023 07:52:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:440d:b0:12e:4d86:c017 with SMTP id ce13-20020a056a20440d00b0012e4d86c017mr3083366pzb.10.1692197565859;
        Wed, 16 Aug 2023 07:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197565; cv=none;
        d=google.com; s=arc-20160816;
        b=x153qyEfQ7xahrnqbDUya8e1cuXecc7V30mplHfREBHSa9LHOtRmuYDuoF2oH0pzqb
         iugoHLxl/0FnBxUEgYy2qUIum6mfKNRlkaoPbkHEFVKun9Ty8cw7oegeQl8gd07CKVB2
         Xt4fyjjMBsn3ur7nvLvwZ/diVAlN3xhUI0Wz3Niv2sGR6Evgk4LV9e+xo/PRz4WQ3xhT
         asa5plic+RYnF0CvErKgfN4TyWGI1xGTtATt+0J8benx61W2RBnJNZD5vRy9aE8Hf4IZ
         r7uRBCaY94pbPj5NrnSOgYKZQ//n3y7EsJ162RWnPrwmYbC+pHRTaPTYkyHcGl+xxasF
         H6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=QfEeJ1/mCRGupGWwvGr+m8XFeWcIxkug8fe8VzS5eGljUkdnUmeBrz2hQJzNzKis1t
         YunAETVjFmYyHTRXY0DJ5AN9sgNwBr/QHnqpi/Osia2/3NDbzO60hbldbnKjfy2nJEMn
         jEtsZ0PmktEth954xUUMjJmF+9hwLh/oKW13fhX8dcEBHuhAkT0MiBpbr9YC4UZ0Zi9v
         Lhff0NOjOszO0AbBF1NWT9/E2pHOLsvA1XvM+sBcbd+AEWbKbBHv5583OoLhPCY8OO7m
         b1hAXs7497nmfRgf1jvmC9F/8BeXEwt9OKUa/oKLLcvWVWfmQmgEFxsNhUhwC2W/lo6j
         ENrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="Y0/1peXz";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q16-20020aa79610000000b0068736a44aabsor11753374pfg.10.2023.08.16.07.52.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:52:45 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="Y0/1peXz";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197565; x=1692802365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        b=Y0/1peXzSs4juY9ymgumb5RiSvn27fHcwAKJy2ZTGrBeRn819iCH4nljP47QRA4Vxg
         40x7+5r+XfiPGBkZXcnfvCQ9uqAFHzUNWAZpDhpHzdbT5Q0nIPXG8HErXfQZIjQjJfzv
         o0ItrgPHttMEcQB6Ux7G0YWWB1snPmmHP09fH/D3ReCsxce+1ZGkAsn2LDchA7RblP7n
         zQ/cIUgkuVMazDBweDx5VH2Ni2/6l5M60vOYncc9S+Jr+UsKJY0wS2yFjb4rxeLRb9r7
         2SoVeos2JmEswJDmRGDnFADAa1IbdAN+sRrSues6d3ioN23P8fJUmNUYv4v/qLMC8lB4
         jhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197565; x=1692802365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        b=iZnRbrdHDcyTQWinQCQbC5Mi+wOHxxkMICnLIYZDY6iLPq0NuQS6Ik+VuroIRyc87k
         DB7L1WmdP5AygkObPk9pTITCSN8g/zt5elfuSEC4HNFsGll7kJaVebf1xRQHdQg+7Buj
         Xdy2MnOxuGFNEypfvaGJ3PBfr6J35j1Iah90HM4n/zK0/FuWQdVaFlciCJw5dhiUmdaf
         YOy24gMqQe+hn7l5k6H+dgNgo5CoIDNptmVmsHyOVhy8B5wQjUN5NuzH4blD5xz6S4HU
         w6cUnH/UsZsgFOIxHbtcLi0VlTDDY1aLHGXwKA16siwzDo4Ig52uDrOsHPPp3U0MZ7ja
         w0Kw==
X-Gm-Message-State: AOJu0YwPXFkEtRt+Sj4BXfHNqp0zgm2grVA1OYWRpUQah9YL0myIzI08
	EebAquKwa7OeEBMC6yvRlm+SHA==
X-Google-Smtp-Source: AGHT+IEhJ4BtQBo9Fd+dpB+PERq1IPryRWmwgf25koKSBcnkGRiPIJLkSwaQcvy/u89B/gdB6Kif/A==
X-Received: by 2002:a05:6a00:24c7:b0:67a:8fc7:1b61 with SMTP id d7-20020a056a0024c700b0067a8fc71b61mr2510244pfv.11.1692197565072;
        Wed, 16 Aug 2023 07:52:45 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:52:44 -0700 (PDT)
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
Subject: [PATCH v4 03/25] gdbstub: Add num_regs member to GDBFeature
Date: Wed, 16 Aug 2023 23:51:24 +0900
Message-ID: <20230816145155.21049-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AZYRBUDyqZeF

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
