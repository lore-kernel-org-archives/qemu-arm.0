Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025238ejb;
        Mon, 31 Jul 2023 01:44:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d87:b0:138:48d7:4a31 with SMTP id bj7-20020a056a213d8700b0013848d74a31mr10439838pzc.62.1690793081692;
        Mon, 31 Jul 2023 01:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793081; cv=none;
        d=google.com; s=arc-20160816;
        b=ffnKnZpGhetx1vbR+H1V3dVqHNTu6F0QQ+4yug6KuHx7qoJV9FxZAPlj5ApK1fCHVB
         VjZNAdPY5Kz1edGaHt6yxXk7CtEN6ZqbFdOw0pW3miyVtidpQ+Tx7TpoT68KGdn9rPKN
         2YShdxVixhvKUm2kLLJmK7/due5HT7qVxnwtCO9hqslFjzStC/mTIvNNG14y4xL7SUHz
         VXMbyFYk/ngepSbFnEbohXNqJl2MBT1njExX9wriEjgLypqg/8XDaVU2ft5nlv5hl82S
         5H1HRVlPaq5vTNBu2CS33cmeSnmdqCzaXiJZGJUwkkz8RmQ42FZQc6WdwARfNsC0URY2
         EVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mAUxS0KeO+VW3iT7G7DIpYMmx9Vycw64xBFZFbBxFBY=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=S8ZMUVTyLyK4We0FYu2UpHhANacSW/DS779dvROPHd79OFidwSiATBKCXa+Lle993E
         0GYq8d3HsnfMsCeJhSxjsfEtPZw6wCiVxkDB3C9J7DXI2brbEzKc67oMwTD2tXY6CTcH
         2zwNYFNc2OpnGzpEYrnMGZi4DS/9DuFkD0jncBk7u2Zht/7P86OZ4P29Fmd8Wg+aAO9F
         Qz6ycm3ZLKxmdoUWv7bXLcYoMdtMQB9hi3tonrWf/rqg4QJ2uDaZZubYu2CXK+xrtsbL
         sLk4ZlZRS0yDO14lkXYjXhK6h8dHD5UOiwBo8gTNtqW9z2Oia9+HkBt43TqgLb5d78Ob
         lGaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=sZAYMXRQ;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w144-20020a627b96000000b00667730375dasor5371066pfc.11.2023.07.31.01.44.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:44:41 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=sZAYMXRQ;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793081; x=1691397881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAUxS0KeO+VW3iT7G7DIpYMmx9Vycw64xBFZFbBxFBY=;
        b=sZAYMXRQ2QP58O7r7eLfLf8bIc5vVQO9DWQlq0Aj7mnVTxdhjXocdms5g+rSp8iqUC
         lA3xlXJ+2Gwn89LpI7mCrxFnVUqoOyaCH2bQtKCFiERUNxpoMvM2YXtRD1LqD9MHFMJE
         yAtWti54NEdg9AueYEHGa9PgEWe9RMwolD6WGFYcCjKqBBTli7cpg8Ga3hbE5TnA4rLE
         cnVfPPNXd7d8Vel3ANoOffEH4KBAzGUWyGSEjm4/NqK/7l6XY7CiDG4tQDkLi//XprQC
         tTjY+nXZx6c5R33SXY+3FERz30nqjnTRYiOBRqriInDwEWNF0E8XDrZLSkvGbK9zc1zC
         8Q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793081; x=1691397881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAUxS0KeO+VW3iT7G7DIpYMmx9Vycw64xBFZFbBxFBY=;
        b=EPg5j6WlYxZUqsSXNN9Ykck49jHTZUsBvFtyuN/Wu//Lt7V58DO8qCDKGL8J2H/a5O
         z6uIy6AB1/r0eh6W0+YNXS/m1CUDIlnLQn8+W4ieRB6qKRrwJkPoChfE9NenJZC0maJr
         +aGx4j0p3aeF2U55BWHocvXD929888fln9ZH9+uIWTK+YlD59NobTOqKogmOs/tbXPne
         NDKKY27cHZ/NGi9gIDCqdOQngs/gZ+DLEsY7qM6GaWhYrlK0GzvJmM4MnRxTtWSfKeri
         hePLdBNk9jTfDuf/wn0MbivuK/j5/UCTEFE4WcT3atilsOZHnAMqN5rcWVVIJY2d+1to
         bDgg==
X-Gm-Message-State: ABy/qLZwjnyDJGl8M4bTGDgI78CAhYTeu//C4ktNxwABD149hCNfOvLD
	LUZq29JeIdtpIiVrgv0zhOfJnQ==
X-Google-Smtp-Source: APBJJlEfNRDWb5o5QOCUiZse9TFpK7En7HOFMM5Uo1l8I9NrY9s4LILfkkaDU6f6ZALg1acFnqXFWA==
X-Received: by 2002:a05:6a00:1351:b0:675:8f71:290a with SMTP id k17-20020a056a00135100b006758f71290amr12463128pfu.34.1690793081090;
        Mon, 31 Jul 2023 01:44:41 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:44:40 -0700 (PDT)
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 03/24] gdbstub: Add num_regs member to GDBFeature
Date: Mon, 31 Jul 2023 17:43:30 +0900
Message-ID: <20230731084354.115015-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lm9dWm8lKpUp

Currently the number of registers exposed to GDB is written as magic
numbers in code. Derive the number of registers GDB actually see from
XML files to replace the magic numbers in code later.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h  |  1 +
 scripts/feature_to_c.py | 46 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index bd5bc91dda..22e5add5b1 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -13,6 +13,7 @@
 typedef struct GDBFeature {
     const char *xmlname;
     const char *xml;
+    int num_regs;
 } GDBFeature;
 
 
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
index 5a5b49367b..8eb8c81cf8 100755
--- a/scripts/feature_to_c.py
+++ b/scripts/feature_to_c.py
@@ -1,6 +1,6 @@
 #!/usr/bin/env python3
 
-import os, sys
+import os, sys, xml.etree.ElementTree
 
 def writeliteral(indent, bytes):
     sys.stdout.write(' ' * indent)
@@ -35,10 +35,52 @@ def writeliteral(indent, bytes):
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
