Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025927ejb;
        Mon, 31 Jul 2023 01:46:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1795:b0:64d:46b2:9a58 with SMTP id s21-20020a056a00179500b0064d46b29a58mr11667143pfg.26.1690793182430;
        Mon, 31 Jul 2023 01:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793182; cv=none;
        d=google.com; s=arc-20160816;
        b=CDxO3yOKQYEzFetLaR5rTF+ZGNyGlVVASQFHa+j1EDWr/uuUUU7hVuzWofC2opR5YA
         G+bzIPPLRxw52VGjk/9DnR2grmn/mid/3ptGUataeWbkRxuc2dpR1sDWezs0qVer6Kfm
         9HaRDDxDVEXPgRXRoFr4iol28oiLysFeMQ+sDX0LH7JpxWDer9omPxrdmkAvMhTT5MWM
         csipK98N+lTfBdo0YlkymorVi5fCQ06UWFPs68rJHhQm9DWkwUM+TySADl5RD5F3/W26
         7eY2i63iddVzZVNwJI/LzyeZuXyXRqet5g3e36Ck36Bqd5PEL9H324Gyym8M8Xz0ot28
         77XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YVDhI8G3XKQpdTKkzfZwxCOShys46nkH8J+TNtUodNs=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=FmG2+G8Ia4aslZcVEPy8Zb+fTFcKHTTIxo4Ixd4cQ5i/YsVbYqZILnKdYbb2hAEDge
         ds11b330X8yXaIpHOS+IZOLVvgyZ21Td3LBKCZd3qSS9u/eC6CmVLZ0veuUcmG5q0p3D
         ae1qxuN8A8prYPDWG1ZZFyQ6E/b6jVlF8HDQZ1EUzCCjeUv84qtgrcMqcLz2XAf6FOsG
         DJ+qiUw16yiGYrcd8qDjQbEDB3Jjb/S2bCRWZ8fUORrdwJiS2KBZ2EF+QIOIpDFHl/bT
         RMSAlvfUq8FtTl3Fa+x50jHjRa1u1fdLmDiTRwdX+o9Rw7FP+aBk2u5wiJCVJ4/0rRMv
         Ni2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Qq6IkFih;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 69-20020a621748000000b006870bbf2706sor4098927pfx.9.2023.07.31.01.46.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:46:22 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Qq6IkFih;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793182; x=1691397982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVDhI8G3XKQpdTKkzfZwxCOShys46nkH8J+TNtUodNs=;
        b=Qq6IkFihp/e4yvxXsyLxNHOGpLnKdliXR0ZAoli2RYnnFbwsfCOikD0T/RvzUHtpPu
         Jae53C8HsgcPLy7aSvsqUs8Pmca/ZmBtgaZtN4/+A1k1ezPGRqOvJBGmHcoqUtwDi8+Z
         VUF99HRZ71RaqkwAxqTkeXwOKLItyfvKZq++hB0wb+/Dcwr4U5E57lS+79vcNzzVw8yB
         34WFykauxL8zqUUtyFQThps7xnv21EyNW7ySHTpqlYD50yRBVIQLEkWXLgpy3+VxoFF/
         dEhFUb5wgVviCb+E742leC7Cb/8MaC3Sse4Gozx3z1XKSb0c/9kXkOzVK39KdqNOUbc9
         7X9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793182; x=1691397982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVDhI8G3XKQpdTKkzfZwxCOShys46nkH8J+TNtUodNs=;
        b=HJCReIvm3NZbB4RJOW5DGVCLCpt31RSeuXpKN4WTo9nJCQ+7+aRf/QrG63+n6dTYpY
         chjs8bbE6mUnxzQvznZKvqRplmdsFiOnnEenYDi/zagt6px2qAbOh1CM1v65CuqxR31L
         3jla5eaLxk3HiiO5Jym1sMATX8xwUDWSpcG+5TKSBr8NQDZM8DRH6GQ9YCrMaauWHEbe
         92xi5IiHUQF7f0GqqopF7LwoHbL0FuUmUdlWugqJFRqqu56sIUJ+b1xaq7Dbp5zD9+bH
         0u2pUww4yB/nhU2tTiylo/ZEAfV2JAYkGEX6CFCv/C89xCYTkuDW3b6iLAVa7XC0qK1/
         7u4g==
X-Gm-Message-State: ABy/qLaXHBHl4pSeeyBJYY8NIYM46x3xP2vgV6oQYpy/CrF0LZisIBlQ
	TKCrnSYXPKjQsEbDwkO0FVh65w==
X-Google-Smtp-Source: APBJJlH0Y0jIbFL2MuYmKot0VnFWzDKlfE/mcBhR0eg7oE9a99MSoZM1t7WwhAqiV8ye1aO92Y3SUg==
X-Received: by 2002:a05:6a00:1351:b0:675:8f71:290a with SMTP id k17-20020a056a00135100b006758f71290amr12466989pfu.34.1690793181961;
        Mon, 31 Jul 2023 01:46:21 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:46:21 -0700 (PDT)
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
Subject: [RFC PATCH 14/24] gdbstub: Add members to identify registers to GDBFeature
Date: Mon, 31 Jul 2023 17:43:41 +0900
Message-ID: <20230731084354.115015-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nmYqZTpWBT4h

These members will be used to help plugins to identify registers.
The added members in instances of GDBFeature dynamically generated by
CPUs will be filled in later changes.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h  |  2 ++
 scripts/feature_to_c.py | 14 +++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 9b3da5b257..6da4af9612 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -13,6 +13,8 @@
 typedef struct GDBFeature {
     const char *xmlname;
     const char *xml;
+    const char *name;
+    const char * const *regs;
     int num_regs;
 } GDBFeature;
 
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
index 8eb8c81cf8..11b1bc05c9 100755
--- a/scripts/feature_to_c.py
+++ b/scripts/feature_to_c.py
@@ -46,7 +46,9 @@ def writeliteral(indent, bytes):
         sys.stderr.write(f'unexpected start tag: {element.tag}\n')
         exit(1)
 
+    feature_name = element.attrib['name']
     regnum = 0
+    regnames = []
     regnums = []
     tags = ['feature']
     for event, element in events:
@@ -63,6 +65,7 @@ def writeliteral(indent, bytes):
                 if 'regnum' in element.attrib:
                     regnum = int(element.attrib['regnum'])
 
+                regnames.append(element.attrib['name'])
                 regnums.append(regnum)
                 regnum += 1
 
@@ -81,6 +84,15 @@ def writeliteral(indent, bytes):
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
