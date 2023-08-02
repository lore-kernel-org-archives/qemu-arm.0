Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206001ejb;
        Wed, 2 Aug 2023 01:47:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1893:b0:687:6184:deed with SMTP id x19-20020a056a00189300b006876184deedmr1757904pfh.22.1690966026448;
        Wed, 02 Aug 2023 01:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966026; cv=none;
        d=google.com; s=arc-20160816;
        b=f4GxspTPu5Z/etmO/JfVHGaLpS0FSe57kkX4eBMCFp+ALa2JsxeSnHqcNJug8ghCan
         w/DRNJJNnwXWGnpbKjjfDnXdMinXfS4K7VefWjxcLoenGqm+3750ybpXStwrW1Tyr5BU
         TdvPBmsAOsO2Hkn4dKXsU6lEJ507AOihU0BlvE5qfeY5BW9+NMxqYKM+IN8+/HUD94Oc
         CCc+l8xJyJNR1jPFqOKEa6zEJ4cEfpf+41UvFrjHQmDYa9ynVNHizJuDkfeUEfj8jPJZ
         AVu4USF3a2CczkrHsO/UPEuwwMTK8+qKTgzWrOVuVQYsvjNX5TJN57PrHzwdVxBl/5Ta
         97qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zTBgY964k8VXNYb9VGNlkEmpxpnjsuPBBlVtKq+L/Io=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=1GpgzKFgwJbPsp1Jyy1pYszyL2iW41donc2ftjfo80VRKIra4NauuyQqEP6XtkPY3m
         lBImyhmG4SdTwUgIr21cbT+usNAA7JFysAKrmEVllyZBP9Kr2MWFXJ/rjlzs7c1u+Wks
         3tdx7aZh1J8N6Ir9y3PZsH3p0qzBG5DZA7KSSph/zoOk6IPkyBCnO8+2RlT28MOh4ink
         XoHYc0f5qICIkaaB9JqGWRn5/8p4r5Z2aSBGhrTq+7l4YSt7dM3bXde5wQUZ7wQZQomN
         IpTJoyQ+76cMKxMKQNmAr27XvGGbAUKH4r+No9DCXg5K4oRw9kr5obcsuqO0ZLgTjgCH
         S6iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=OttrSR8J;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q7-20020aa79827000000b00682ac98b49dsor5709740pfl.12.2023.08.02.01.47.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:47:06 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=OttrSR8J;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966026; x=1691570826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTBgY964k8VXNYb9VGNlkEmpxpnjsuPBBlVtKq+L/Io=;
        b=OttrSR8JUkKtPBGuD39KMjovIn2JEUobFUctPa7T057KBsa8zgy79KRbVLHcGQ7N6G
         v72bcYIn1+OPkUNshy9kOO3cth2+oFfJilRmuJBq87HbDuv0rcfzOxNXnQLbk6Xw5Dpr
         CV7JBygGE4g+qyQfUUQWZ00rh/5Kb1GY+ulKEFBv0RnValT/uYmKUVthd88zzV5EfKFw
         6wOej+rXHteFRbmGqPkMS8+f6/6b1Hv+WVYE0YDIsAw1Pxw5V6sLnqutdAwv443Mm588
         SR1SVPUFk0Tq3l9EowXJUwmrxAKRiK/x150u/cQNWN1HKzrSojZk1vmjr3X7u37RuHq/
         jknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966026; x=1691570826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTBgY964k8VXNYb9VGNlkEmpxpnjsuPBBlVtKq+L/Io=;
        b=XRJ+G823CLeyAmbxdEvy7gH4JqGytlsbP7Pi8wrpnAB/wS/U+kobHGrq5Lw2Oyhomc
         qtuF/dkpBbnqyJud9e/QmHbZse1o+ogzTsOJ7J2CTrTMfO+UCVh/HAolhgT78zkSqudh
         JLuEdZqVmboWwwvdNjOu5tdt9KOAhD/HObuvxO2vfnbGeOUlfDlQR1sepzDygMvK9hcT
         qd2gjKgSEYOgL3rjJ6XxpSb6q+P3mwJGls3APhwPSgPRMxxzEaK5htlzSqRdA00rCawn
         WeqPBuQr2iHQyirYAnY30sc9LwekkcxXaIbi3TMvjFyfHtSrHlErDP3nqRKKB4abwxeW
         x92A==
X-Gm-Message-State: ABy/qLa6/3QwPBhsSqczsoRyVo/nD8DwseIOiH6bnmxMKlB+CM1byTwl
	0OVF1Il3R3LPvL8VGO3V8580Wg==
X-Google-Smtp-Source: APBJJlEgaOGw2+VVq4s38WdeLGvh03plnA1wEWOz2wnFmKGpUcZfXL103bjvunVpryZsoWEVwyfy7w==
X-Received: by 2002:a05:6a00:15d6:b0:682:a62a:ec36 with SMTP id o22-20020a056a0015d600b00682a62aec36mr19141012pfu.15.1690966025894;
        Wed, 02 Aug 2023 01:47:05 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:47:05 -0700 (PDT)
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
Subject: [PATCH v2 03/24] gdbstub: Add num_regs member to GDBFeature
Date: Wed,  2 Aug 2023 17:45:51 +0900
Message-ID: <20230802084614.23619-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CIV7CicE1rAK

Currently the number of registers exposed to GDB is written as magic
numbers in code. Derive the number of registers GDB actually see from
XML files to replace the magic numbers in code later.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
