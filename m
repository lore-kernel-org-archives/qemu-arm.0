Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206608ejb;
        Wed, 2 Aug 2023 01:48:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:240a:b0:64f:35c8:8584 with SMTP id z10-20020a056a00240a00b0064f35c88584mr18178711pfh.18.1690966111677;
        Wed, 02 Aug 2023 01:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966111; cv=none;
        d=google.com; s=arc-20160816;
        b=re+fxHKEyH3Nd7tWa0TD3FekLA+WUMxQwXcOsNHCsNIMRBW/KD0tf5s8C4UDKB4qZx
         yParLqa9B1L20MjTN1MSwNOW9/axA5XCP3rhJE+zWIop/S00vFJN12idNQciL+cAuwNU
         BsfVInyeYjvqwtKuXrKzEpV5VL+qp8wtyEuiWD4zmVmWIbkOPFviZfVPCkSRlKXjw/t5
         U+ipuKKxOqbqfxE8CrlGfwRoR+Xrdr5x2ssSm0TbWg/yo2qLeHgVc+KyeM80+HNDiN9+
         URDURQ1wR6JHU1HckUjRqOfeDHgP9qdUEWahgC7D/s7ndG8bzJlk1ilZfWTTnsbA+Myc
         IbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gCc1m+1u4UvLkSCROs1ORKKsW+fn0ilT0PSDkSbe4xs=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=AwwL58nGSbF2LKudpC4ltrqbFg6iLIntdKx7j0AEytcwcK/7eKf2xHr0GcGXNowtcg
         XJs6LMhc1h9/wIJnYLChZQPvok4wlF0lhlHlMwa08fPcBc+jYsbCosmE+6DGXpu2ADcv
         XQJCgOGGvCDjuTBJguYOUh9JAVHLASI3zL07G0ob6FQHXQXSJLpfvGaJoMPgHBw3GJgK
         afLA5EEfAd3R8BRdSwW9vD/hZqtJyDNMWJehTApeGc7yEa2FH7ps6daDUOkbEm85rn3f
         NRl2zGjSEByYsfdUdPzVlVKMWAfPGWdTSNuCB9/pj+JCqoKVDUQYkMA/v/mrPpxYo6Tq
         kN7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=IUJEbhsa;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t19-20020aa79473000000b0068741a6f4b9sor3315098pfq.5.2023.08.02.01.48.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:48:31 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=IUJEbhsa;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966111; x=1691570911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCc1m+1u4UvLkSCROs1ORKKsW+fn0ilT0PSDkSbe4xs=;
        b=IUJEbhsalejJ+OztBTcBeuyom3Qm+km+ogMM/ZU0/9+THAZ4ViAw7G9MQDwbqBq90k
         ECvezMafzc1zNyix/cBaeDfzYELcQmj6PMZ5GTWxnhRsjzEQugcTbo6Qqf1Rd+d/xnIl
         xwFVGtUJgunpCz6Uc6r3C3HhkjnEfdM00G4XpRUFQOSmibfKMRGagbiuBVtw2blcXccg
         uAQqSzCL4/5q83eeT/21yBMe1ZClEn+wTdW9E0kBq/clJlYL3gJGZIb050BZH14lVqFw
         HfHOqv3ESbzM9nw7WdwWaNv7XSPqgCD+udX+TeE+RL5RnmHRS20f2dgJsNlRgj5o4++b
         4Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966111; x=1691570911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCc1m+1u4UvLkSCROs1ORKKsW+fn0ilT0PSDkSbe4xs=;
        b=gn1gT91AeFGD5MCsde0iAKo4b1NHcwRBoh7XzwPzNjbRTfA9KNwz2jRaRWXNTcKX8j
         90g0GwB+CerjBlDyLVnjmV9cTYpWpm63xQL0zRd/qEot06kjMVgjGQSq/oBbQVKV8oCG
         dLBqAkOA0E1gILGi7p6rpONAZKFfS9Tw82/5KvJ4a0C8R0qOe2n/OEeaOD/VgT4TN68z
         INo40CgXJuwTwPxd0Vv/MWtqvfuaEezU8wqxjk0ZdQAoI83zNHTQCTfg8kLwtXs7GOBs
         GWm38RJpWXeLodr3dxODmHI3jg+em/iCkRBEEDRSTyvxM/2U6+29yB0nlZHEB48UznNX
         a2FQ==
X-Gm-Message-State: ABy/qLb1To2CCsn1PEv7j9R5/oEtw9+0tyQqEvADvSxNbY3NSIAdWJMw
	LvKuH1KULvBUDvHdg3cqQ5cyQg==
X-Google-Smtp-Source: APBJJlGA0cDNIJlNalBTL8lVjVOL7XXK7R6kLlA4eqXCofDi2IWymFHyEGup9YgQ3I+FvOG+jmnmzA==
X-Received: by 2002:a05:6a00:1351:b0:675:8f71:290a with SMTP id k17-20020a056a00135100b006758f71290amr20461967pfu.34.1690966111142;
        Wed, 02 Aug 2023 01:48:31 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:48:30 -0700 (PDT)
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
Subject: [PATCH v2 12/24] gdbstub: Simplify XML lookup
Date: Wed,  2 Aug 2023 17:46:00 +0900
Message-ID: <20230802084614.23619-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: B2g6wcPbiE7p

Now we know all instances of GDBFeature that is used in CPU so we can
traverse them to find XML. This removes the need for a CPU-specific
lookup function for dynamic XMLs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e49bb06a6d..9955f996ac 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -354,8 +354,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
                                    GDBProcess *process)
 {
     size_t len;
-    int i;
-    const char *name;
+    GDBRegisterState *r;
     CPUState *cpu = gdb_get_first_cpu_in_process(process);
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
@@ -364,15 +363,12 @@ static const char *get_feature_xml(const char *p, const char **newp,
         len++;
     *newp = p + len;
 
-    name = NULL;
     if (strncmp(p, "target.xml", len) == 0) {
         char *buf = process->target_xml;
         const size_t buf_sz = sizeof(process->target_xml);
 
         /* Generate the XML description for this CPU.  */
         if (!buf[0]) {
-            GDBRegisterState *r;
-
             pstrcat(buf, buf_sz,
                     "<?xml version=\"1.0\"?>"
                     "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
@@ -389,28 +385,22 @@ static const char *get_feature_xml(const char *p, const char **newp,
             pstrcat(buf, buf_sz, "\"/>");
             for (r = cpu->gdb_regs; r; r = r->next) {
                 pstrcat(buf, buf_sz, "<xi:include href=\"");
-                pstrcat(buf, buf_sz, r->feature->xml);
+                pstrcat(buf, buf_sz, r->feature->xmlname);
                 pstrcat(buf, buf_sz, "\"/>");
             }
             pstrcat(buf, buf_sz, "</target>");
         }
         return buf;
     }
-    if (cc->gdb_get_dynamic_xml) {
-        char *xmlname = g_strndup(p, len);
-        const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
-
-        g_free(xmlname);
-        if (xml) {
-            return xml;
-        }
+    if (strncmp(p, cc->gdb_core_feature->xmlname, len) == 0) {
+        return cc->gdb_core_feature->xml;
     }
-    for (i = 0; ; i++) {
-        name = gdb_static_features[i].xmlname;
-        if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
-            break;
+    for (r = cpu->gdb_regs; r; r = r->next) {
+        if (strncmp(p, r->feature->xmlname, len) == 0) {
+            return r->feature->xml;
+        }
     }
-    return name ? gdb_static_features[i].xml : NULL;
+    return NULL;
 }
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
-- 
2.41.0
