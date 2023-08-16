Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365049ejs;
        Wed, 16 Aug 2023 06:42:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:35c8:b0:143:51ee:b142 with SMTP id ba8-20020a056a2135c800b0014351eeb142mr1735554pzc.59.1692193340917;
        Wed, 16 Aug 2023 06:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193340; cv=none;
        d=google.com; s=arc-20160816;
        b=Ptr9LGzpETDclUUf0hfOAae2O+06J7LeCV84F7PmcqeYBIiL68t5+b0WWx9mr+Q3Sn
         dPipw6T90lGjddHNb1mKevD1TIZyClVzeWvKGTicwjoLF+7ZgOQscmNUWs/dZ/zYSsPx
         Rrwts43qU6bgTfyXJvedx4TY5qQCwgnBHTB5WW3sDMWgqC7RKe/QjGYi9fO/VlbVw4oE
         rY1aKvzS51Jv40qu18tbhdEzJl1DMVZ2XDXPH/W7egYonJ726F5ZEcy6LmiwIoOl4vJw
         W7D8/D0MZmoTotudTJZJnTUusBiB6JFPsQO++AP9H7SFpi+6Nls90P1UarpuJohhsuHS
         HhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LoU2pS/znq+kjt+yrgvrxMpANXrwQzKAPttvmhpfpts=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=royldIstnshHXyQyWaLz2YX48ZOFFwiIZFXjJ9W0trP8UyXimUO3qEJiFMpwAzOptE
         vhmxJ/QBJAd6uZJHRSZV1bVnJhQ/bG0CQKAFNXu0Ix8uwpVY5IigjhMpkKiN7gus03md
         rlIcsgJp0lOCOnuegqPiZq8oiSgA/XatIFM9K0+9KxDkPbFBKwuseEKEJ5WTiTHrGdZ5
         wPgbkooFY9uWKgqcfaPaly81rC84l5I2H1WOl4tLLYtuBX8gHKqkOX8OI36NWeEp55wC
         1gjym1y8sQkMp1NET5cTh+9qh0z5OE9EPQhnRrygo1aW2vUESIH2T0l6OEue9/T566rG
         eXuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=dL0piSXX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u72-20020a63794b000000b00565dd068152sor1829451pgc.8.2023.08.16.06.42.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:42:20 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=dL0piSXX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193340; x=1692798140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoU2pS/znq+kjt+yrgvrxMpANXrwQzKAPttvmhpfpts=;
        b=dL0piSXXpBJvuNXShqVnu09g1FrmM45clKUEBwID7vM0Z9U06VBkhTlyPwVmE9naWP
         oazBoP9wnM5Pthb6ZpU4+w4b5SKxa+vljLaQgZ/mbEiePaUTqGK3Hh8CEWA66PgXlb3x
         Td972ZLI3rJ2IWpzjMEFkKzRQagAkSORs0uoayv967cE6aPZLc6kDRLYVXM0d0z4Jwgc
         2UkvnHqhzA8eQ9snjyeUpuSmVLyi+Jm+E0IxjH5B6L2rpP+5QOVV8gMdNUzvvAoh3SeX
         tbehLN4Y5EGzwLvwOfN7o29dbhaHHnSlyPTmAHbvA6V4+vRFamvOrZx4fbXJatEFx6Tj
         Goug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193340; x=1692798140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoU2pS/znq+kjt+yrgvrxMpANXrwQzKAPttvmhpfpts=;
        b=KKEEEAVBBUwfg4FCALGRQNVHwU194TPJCHteJtB63K0QBR79KCAYx9rrPzP20BhuHM
         NNkBNJtSgJ0quRPy0ZUACqCgBoZSOsiZZ7kmoyBqujRSEW+jYLmVwNduv4uukeoCvQSW
         aqa9E7tf7J0un1xTIkykTSyItGn3YtBO34oNSXnBPx02zUD45lOwOrOPAYeZ0/pfaFaj
         9Zi26wuUrvqtwvwoBpajdjdkXzAgHXSESkmidTfJZl4yttdPfEx+Ey6JyRwZfBl58Ytu
         rBCMhqQt0SGFGDJ3HlL0hMrE2IFkLw18xV1EcH+h4CoU24hNQqwAvjrnw5ZcOmedSzmc
         2gaQ==
X-Gm-Message-State: AOJu0YxGT0b+uPf1Wrs3NlzJjDxm9AeJlkxK/LxvbjZLlt8qaeG7J76o
	SPMh51UTqPcBK8xznthpa46xWg==
X-Google-Smtp-Source: AGHT+IFLp2aEC2TKIdJM1ahnC1nevUCd8qPpGWVeOoVFE918g8rIKGLF3x7hTxd7IWZjmNejkW0fRA==
X-Received: by 2002:a05:6a21:35c8:b0:143:51ee:b142 with SMTP id ba8-20020a056a2135c800b0014351eeb142mr1735537pzc.59.1692193340436;
        Wed, 16 Aug 2023 06:42:20 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:42:20 -0700 (PDT)
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
Subject: [PATCH v3 14/25] gdbstub: Dynamically allocate target.xml buffer
Date: Wed, 16 Aug 2023 22:39:24 +0900
Message-ID: <20230816133938.18310-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HtfmphGoCVb3

There is no guarantee that target.xml fits in 1024 bytes, and the fixed
buffer length requires tedious buffer overflow check. Dynamically
allocate the target.xml buffer to resolve these problems.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/internals.h |  2 +-
 gdbstub/gdbstub.c   | 44 ++++++++++++++++++++++++--------------------
 gdbstub/softmmu.c   |  2 +-
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index f2b46cce41..4876ebd74f 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -33,7 +33,7 @@ typedef struct GDBProcess {
     uint32_t pid;
     bool attached;
 
-    char target_xml[1024];
+    char *target_xml;
 } GDBProcess;
 
 enum RSState {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index c2ce970c98..452b5bf0ef 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -366,33 +366,37 @@ static const char *get_feature_xml(const char *p, const char **newp,
 
     name = NULL;
     if (strncmp(p, "target.xml", len) == 0) {
-        char *buf = process->target_xml;
-        const size_t buf_sz = sizeof(process->target_xml);
-
         /* Generate the XML description for this CPU.  */
-        if (!buf[0]) {
+        if (!process->target_xml) {
+            g_autoptr(GPtrArray) a = g_ptr_array_new_with_free_func(g_free);
             GDBRegisterState *r;
 
-            pstrcat(buf, buf_sz,
-                    "<?xml version=\"1.0\"?>"
-                    "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
-                    "<target>");
+            g_ptr_array_add(
+                a,
+                g_strdup("<?xml version=\"1.0\"?>"
+                         "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
+                         "<target>"));
             if (cc->gdb_arch_name) {
-                pstrcat(buf, buf_sz, "<architecture>");
-                pstrcat(buf, buf_sz, cc->gdb_arch_name(cpu));
-                pstrcat(buf, buf_sz, "</architecture>");
+                g_ptr_array_add(
+                    a,
+                    g_markup_printf_escaped("<architecture>%s</architecture>",
+                                            cc->gdb_arch_name(cpu)));
             }
-            pstrcat(buf, buf_sz, "<xi:include href=\"");
-            pstrcat(buf, buf_sz, cc->gdb_core_feature->xmlname);
-            pstrcat(buf, buf_sz, "\"/>");
+            g_ptr_array_add(
+                a,
+                g_markup_printf_escaped("<xi:include href=\"%s\"/>",
+                                        cc->gdb_core_feature->xmlname));
             for (r = cpu->gdb_regs; r; r = r->next) {
-                pstrcat(buf, buf_sz, "<xi:include href=\"");
-                pstrcat(buf, buf_sz, r->feature->xmlname);
-                pstrcat(buf, buf_sz, "\"/>");
+                g_ptr_array_add(
+                    a,
+                    g_markup_printf_escaped("<xi:include href=\"%s\"/>",
+                                            r->feature->xmlname));
             }
-            pstrcat(buf, buf_sz, "</target>");
+            g_ptr_array_add(a, g_strdup("</target>"));
+            g_ptr_array_add(a, NULL);
+            process->target_xml = g_strjoinv(NULL, (void *)a->pdata);
         }
-        return buf;
+        return process->target_xml;
     }
     if (cc->gdb_get_dynamic_xml) {
         char *xmlname = g_strndup(p, len);
@@ -2270,6 +2274,6 @@ void gdb_create_default_process(GDBState *s)
     process = &s->processes[s->process_num - 1];
     process->pid = pid;
     process->attached = false;
-    process->target_xml[0] = '\0';
+    process->target_xml = NULL;
 }
 
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index f509b7285d..5282324764 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -293,7 +293,7 @@ static int find_cpu_clusters(Object *child, void *opaque)
         assert(cluster->cluster_id != UINT32_MAX);
         process->pid = cluster->cluster_id + 1;
         process->attached = false;
-        process->target_xml[0] = '\0';
+        process->target_xml = NULL;
 
         return 0;
     }
-- 
2.41.0
