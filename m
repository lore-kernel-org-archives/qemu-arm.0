Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206743ejb;
        Wed, 2 Aug 2023 01:48:51 -0700 (PDT)
X-Received: by 2002:a05:6808:3010:b0:3a3:ed41:5ab with SMTP id ay16-20020a056808301000b003a3ed4105abmr17091004oib.9.1690966130896;
        Wed, 02 Aug 2023 01:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966130; cv=none;
        d=google.com; s=arc-20160816;
        b=ylVdaFu04aYVebK4V62izw9Xp10QZttgUDY6Yxkhz88Rzwss2LEa079O0GNSXaZznp
         ezHuY6p9Iae4bq1owbnkLf1XlJXqzneWlTIrCk4yIvmj1aIXmrBMUXEUdTtLLzoIGjSd
         7vhzVeqD0AC5MKzSuR0lGHUG/Wo+O97rlpXRLd+eqPDKs3Mzu653KJpNIh3UqzevyHem
         QFwgGcXjqUrlWfRVcOqyVIx41yOqFhKlaXdN/77WZwb+mdqsR+eeaEbTlGYEsDYqE7/h
         WG04e+viKQLLea7XFcVvGtlfqjRf4+dA/nr3lt4UT4HUXPHty7Vvwmeb289oUbKHW8hX
         lN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3mXpG7RfRm8JlpAYSZCkqg1BzSErUQp+Pq7CWqY/JwI=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=FASG9A+xUZi9ZuzlVhYWrqJQlWv6w6ZPglttZ7OK5Ob1+hxCL/Iw6f3FMc3AAM53ap
         u3JccNruq6+Z+ez/3VgBYBtah1ILpQ09CVOLpJRX5k72Rm73Thb/b+wVIyxpfXLXzAhf
         fsLptGFqIwa95Mpao3pwF6uoKyc50xSag+/8EpG0wKMXMB4Ik6olHIZge/BdFpsiXU3U
         YXx5/xJEVszA1kCc37evimywKfFdCy2gSFGTaC+slAlRB7OrlYoo2q2lqYPbdBovnbFG
         RS/Uk4biQf4wE8h2ZnqPQq8sAJKeD+VZZULloCEO6As7uoFL3K3472RQsFOWvx95+D5n
         SNSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=CrhfxksF;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 12-20020aca090c000000b003a4288a9078sor15328644oij.7.2023.08.02.01.48.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:48:50 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=CrhfxksF;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966130; x=1691570930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mXpG7RfRm8JlpAYSZCkqg1BzSErUQp+Pq7CWqY/JwI=;
        b=CrhfxksF1NFb0q2nze9v1c26xeVhGQQ7irYxosnuSWwpGACUwn+ENg9cUk7h5knF2Q
         +reg8hFWf8jzXgTzWoUi7QDnxmx1ktcUWQBBoKGGRuu5dGBUb5/fGVRkkJSTTqMH7yQr
         i/j1JQSY+hAzf9/cks/CVHHdqGyBfvhE9kJNZeHsczMigBf/mrudwbBG3YPmJOLd1VkJ
         PszOFPiqrCdexxBb2lWsu8sUfeVSXSryU/j4PdQ8Y6JFz6VghghuMGwQCliwxK1LJjv+
         4J5mGX9Aee12hdwLHLOipxjGAUxCiksDVhnbgPkMvAI09N756FiIRGNVDDGohQ2Uoids
         yiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966130; x=1691570930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mXpG7RfRm8JlpAYSZCkqg1BzSErUQp+Pq7CWqY/JwI=;
        b=h4mh5vjS+mZMDRS8G/p2X9f6mErvY7nB6DmsZTQ/a2lK9qQ3MjbpZPEatlLcKKZb4D
         nDPkEX+6z28xREXg5/FUQ0IHe3ob+e1IqRgeA0WJ2pIe3TlTYTZz9/Yqf56Yl2CBkBGj
         PIj5iVTzgUd6MQdmepi0/NAxY4Lqq8FH4KOlgLe2F5694CFRjdhDTrdVD2rc71wQ6wT8
         84xT4WAQbFvgn5cPw5ee4wK9wGQDXNwSypE3T+f2sOEQzA7zgPqdEQ3yLmwpva5QiGMx
         GG1XmJp7LY0AeVKn4IqXgPaTfsmbl+XjHTDtZt3jJKwPcimPvdHGRgdv1h4BX99Ew57G
         xA2A==
X-Gm-Message-State: ABy/qLYb2RLa7Vjb5lsvq8uJfcgvepCsDAf6wtKaKygXhdZQeb2u+FZs
	tgpDWsewdrQa9KMF4CBFuVdaGw==
X-Google-Smtp-Source: APBJJlER6reQfJykuZwjPtzbzzona963n6JmU7xtwhUp5XPbBq9g91pdWRQFRo9OIB6cc9JjfzMZDg==
X-Received: by 2002:aca:f14:0:b0:3a7:8f7:62ee with SMTP id 20-20020aca0f14000000b003a708f762eemr12789666oip.12.1690966129957;
        Wed, 02 Aug 2023 01:48:49 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:48:49 -0700 (PDT)
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
Subject: [PATCH v2 14/24] gdbstub: Add members to identify registers to GDBFeature
Date: Wed,  2 Aug 2023 17:46:02 +0900
Message-ID: <20230802084614.23619-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nL3lFicmttFm

These members will be used to help plugins to identify registers.
The added members in instances of GDBFeature dynamically generated by
CPUs will be filled in later changes.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h  |  2 ++
 scripts/feature_to_c.py | 14 +++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index d6d1c1d5c9..da4b9173a9 100644
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
