Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp363977ejs;
        Wed, 16 Aug 2023 06:40:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:938b:b0:141:69d:8041 with SMTP id x11-20020a056a20938b00b00141069d8041mr2814750pzh.48.1692193238137;
        Wed, 16 Aug 2023 06:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193238; cv=none;
        d=google.com; s=arc-20160816;
        b=jOWXZRt90AeVay9/Hi8Hs0jUENT/hkEBMUq4AdaxnLFCpxWYckIr1dN9yPC2SktsIL
         nIPcW7qgeSl35zsooViUwAkFLNxObgpF/iz94rmQnEqB7bMDv+RwsVkXSFQiRehEi2oC
         oo6RbOzt1gI+bC6IehbzY21AOiMzPW1FLobpldJo80CgOGdA83ZLN6VD51GAzJePAnhz
         c1lG67iHY3hdG7zB9SqNTDZOWUm7cAB9iu4wnXd9SGsBb4YjUodhvwc8o0QKb9IqZyv3
         Gh6Kq4iZXVMn8JWfZGBZjfv1208QYconDitthCqBywGrMYUY1HGIhdUp3zQF3mbcbzAz
         O5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=z8UVT1MvBicNsRq3g5a7d7cc9ylMRBv6P2CCLmFMWUGj/YuxioVG9qiSNzSkz12UPs
         8xlHv2Ay3EIjXfZQXBXf6WxkPkA9pJxWLQ75HSS3b7ss+vkm4LcYMM1rWuv8NWu2V/+3
         Of3S0pbRtDWmFQJDVPmStmVvD2F/1Zy+vVXUgmyvi2CjB17aT+U/bdxWNWBKXZMm46XJ
         LWyDtVWbegSqaC0HiLSsDWE0S+rDbshMG0iKcE6VVdiSapnRm8GRUYJXTwkvqLbs4nI6
         rScjIxk9tUp0z/nGoGpPpybGbH878DtZlrzdCTZ4J5cYlZb4oHTD5esDNPtRtA70icpi
         +gyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=gY0LUUSG;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z8-20020aa79908000000b00687aff29a0bsor11822147pff.3.2023.08.16.06.40.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:40:38 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=gY0LUUSG;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193237; x=1692798037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        b=gY0LUUSGh878mt5smGpgdgYPFPElzs8fVItt6x0bjxRUXamcfrVdISPRs+l6xc1eAt
         5wxxyS1JafsvBcTGdyURyNNrrNAqCPp7ePjIlJQ3S0IT7ewQlujAh3j6BBb5s7slL/C3
         ztpXYLMLVROiVP50cFrlZ8X/yAu16JkngzSsJluxf95vab2p6j1StAjKIu6dAT3MJg1T
         nDrpXdCBv7Sso71eVinNEEF2/RCXyJTRvl6t79k4L/4gLP39l9Z9IuAoKUh5k4Hs26/P
         GF4l0xuMK5zKJV2xmq7wP17TnI4x+NcCz7kntgHQq3KFJsKDRmwu0nKumMMzX/BlbRKd
         DB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193237; x=1692798037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqwUBKCsJIu6Kok3irpDq8wqJUl9JGbLYq58wXaDnQ0=;
        b=XbQgDipuX34m0VaFWIrlyMXmQyogXRkVxkltUqPiPjuL75q37Ko2Xtnk9iUFo10ilh
         S2sFsImSG5m2l7yl8Cld5jHHnvUfzxzRUO/Jn9tm07RGZxAgEL9Lli6UA8KNPny8/+lu
         FzZHa7gso6mfpS9hwMadCpMMkAohuS/vEjlax9+0Hmz7ajqYChkM33a/F061vN3Uwex7
         n8a2PIS7FFQI57PVSfNBFxMTl3WPLLeHY6EnO8l8LmsDjE9y7/UZ+NwQrgIyqlP2wN92
         JhIjZnXtCmqvemJohF8fK/CaZD5NN/boXk/ubFFy1rrxZTnd0zToVtk6CeR2SHxyDQnY
         39ug==
X-Gm-Message-State: AOJu0Yx7Y3AwTBW9rvcoFYo2fWCtDlSmvBWOMYJTcKwKxd7qDxQgq0xy
	HvLVKDcG/hBXEMHYw5af2ySS/Q==
X-Google-Smtp-Source: AGHT+IEykPySooFxFAxt3OcAgaH+Rek1l5Fkz+ca6srVwpZib+NnSN+yTrTByAjkHjNExY23hbCkBg==
X-Received: by 2002:a05:6a20:748b:b0:140:a6ec:b55d with SMTP id p11-20020a056a20748b00b00140a6ecb55dmr2814715pzd.15.1692193237642;
        Wed, 16 Aug 2023 06:40:37 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:40:37 -0700 (PDT)
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
Subject: [PATCH v3 03/25] gdbstub: Add num_regs member to GDBFeature
Date: Wed, 16 Aug 2023 22:39:13 +0900
Message-ID: <20230816133938.18310-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7reDWgCux4UI

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
