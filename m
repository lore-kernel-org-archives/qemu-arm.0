Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp413913ejs;
        Wed, 16 Aug 2023 07:54:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:884:b0:688:4371:2651 with SMTP id q4-20020a056a00088400b0068843712651mr2364911pfj.29.1692197670659;
        Wed, 16 Aug 2023 07:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197670; cv=none;
        d=google.com; s=arc-20160816;
        b=swHHikfCHcIkRnwTG8ft6i6a00RBs2LJ5oLIy3Z2cuNLjq9EH4mC/N+K3uAwNFH6zk
         qg8FDcDUqEepHwUJw1E7KJcnDdIO281ACluJWPPzQ1+zDktirJMq66V1ctAeV0lo/oiW
         Qfn3FSQ6kuhAjzJSMHKZHH0dBUFtdyMrdkWoccFR2W3xMz3g0SJKyDgiptNHSVKswzkb
         /nTdIsbSCcctQZuToK0kJXybMVlHeqwZckzBBnQG5LH3MX31/2QP1izenmLBkPqgS0YK
         w5m6TYK+ScI9k9HRZ+Q5XgGETxpylLbCNmkIrvZ4mrivwMynHHdnoADx23zVnceMBPur
         1JuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LoU2pS/znq+kjt+yrgvrxMpANXrwQzKAPttvmhpfpts=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=oHwMg+l9saOhZSIwdupogjp4y6ZYpCHFwa8gyU1TqEQm1wFiiQRnvlUrI/m2O8L/79
         fgfzjXfeZRE3nNyHZkZi5l4hKz2fvu/2DDAeFcso1v0cHT5hHhVj8io7KeHfxSSJx2lA
         e4TEoDA5qQVoKRhgT7E+XgO2dzWtNe2vynHr1wrJ5JSW1YJmzRFNiODhYd21Po9WdkV/
         EhhdSWKkBf/vSmPmSizRG9A8GumJlNcKx+NKJ/9P1NqNKsMkgel1/V9az7JtM/K4XOLG
         TAvboF32SrxrvpU69ks0sKCwC9ChWjZ7qYNOgFk7oXlQc+BIEnJJdtJGZArP+3IfobP1
         eX5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=p7h56q3C;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y1-20020aa79e01000000b00687ae144514sor6405592pfq.6.2023.08.16.07.54.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:54:30 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=p7h56q3C;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197670; x=1692802470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoU2pS/znq+kjt+yrgvrxMpANXrwQzKAPttvmhpfpts=;
        b=p7h56q3CN2y8bvdvqL0phOohINho2V/FibzQb1lltju1EiT2zLmC1HQ9pizZMKV3+7
         i2aFlBgr4o6wwf6zp1FuC9yndANOhYBWTu6/+iMev76NiZqPnbKvDhOIqDD6c9DRdWVW
         sW84MGflqovhFBaAEc2BMD7NJbj1UpXGPidJR6pLK9FKNZ0PvkakGuPRyR0262PWz4lV
         w4v02iB1E4qWovAAB0ETkgcAnYDQi+sejEqU9FKNRUSZUZDhJkuooxxC66MLA84y8+bt
         PLVTLcc/kUEYy2IKX8YzINp0TKWSYCr+JFtjYXMno2+2+XOD2tJhmEAGZXzbjTIEcYO8
         5b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197670; x=1692802470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoU2pS/znq+kjt+yrgvrxMpANXrwQzKAPttvmhpfpts=;
        b=FrG/8e+Tbd+2RCYIkVtHNn8rOLeozR4dinIk1x53yjPSrZWHzalSNYMTUu0HbQQOk7
         75qa5d5/likl7D1dcknE9hg/beEMAHZxIvbIPklPDUNODE9qkXD+oKatCBaOvRfcZrTd
         nj924g4DKaGP1lUr5Ud74zErikUhWj7uft87FiagxDQ5eKcD7ciz6oVDlQvChd0ocbrF
         hgize3L7YU/HWVefhSDG30O25gmWa8PyjMMw+reKEN9OiQGw2CwQEKILhAkrFONgj9w2
         vC63AtfenHHY0VVEhs5DRXb1H5DggXd9H2FFiPybWtIFN/AWqnSVB0+Xontc+1sJb15I
         LiPw==
X-Gm-Message-State: AOJu0YzlUvkKOZD4lStlBACkv8vbaEQ8xrE+0VpmApEBqa8wkc85WHsQ
	u7+4GWI3CPl2pUpO6tQjx/aZ9Q==
X-Google-Smtp-Source: AGHT+IFv0NlGFErZfdbOhCNMu5daHrtilRFSc7CzUk7SLsVwSyRnmZ/wL9gOiGBfSe0fbHUPZ2Zljw==
X-Received: by 2002:a05:6a00:ad2:b0:668:711a:7d93 with SMTP id c18-20020a056a000ad200b00668711a7d93mr2147423pfl.19.1692197670102;
        Wed, 16 Aug 2023 07:54:30 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:54:29 -0700 (PDT)
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
Subject: [PATCH v4 14/25] gdbstub: Dynamically allocate target.xml buffer
Date: Wed, 16 Aug 2023 23:51:35 +0900
Message-ID: <20230816145155.21049-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gFKP5zUYkf4t

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
