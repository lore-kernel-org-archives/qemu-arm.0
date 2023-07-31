Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025797ejb;
        Mon, 31 Jul 2023 01:46:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:76c:b0aa:cfd1 with SMTP id x18-20020a05620a449200b0076cb0aacfd1mr3158727qkp.37.1690793164494;
        Mon, 31 Jul 2023 01:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793164; cv=none;
        d=google.com; s=arc-20160816;
        b=qxcAb5vNYFCgFChM/cuHFN7pkXQ8I5MZnq0kk3HzL68xkJMhhTqiK03JixC3kiiVjA
         f4hUpVzFWdrc/ukIylzONNO2MO00MC3X/4tFriyxXxI9q3Ea+9u2xLiFU/n7eOoll1Ks
         G7VI9KfLReQWKhgvPRUZuEkhbtgI2jzmYA82u1dfHjb1d58gkin7HRtDfmEeZMI/2M9G
         2EqbGZuxcgHIP11QLpdtmfNacpUGkzJIENGKileWetHajFEQgEb/0auj3q3xLNfO6nUP
         AJCXeXWNNrlFgLqQSjMaATj2RexF/dWpogDsAlZ+9taM3Z08ERzrc/u0OVRXGxSpELi9
         6Ysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2cCfolvh7idEXgF4TdLd2iHCvw9onhY6ET+lKLovyso=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=hXSQe8pORvSpmKOoeYCRneuJR+EJ58YKNTflLOYe194EIeL10u8v7gpozcRSWnsdOS
         IeBWmXr3NCO6/RMSa64mW8P//gbKp4LSgaknK3+GSiAc/97MbByzw9ookYvoPAPB5+c9
         59FA1k5Vz0AU5mGS8p5NXzAbnJx2HjS1o3j4vqoDQZRI6IqZqAWasB91n+bUjSFkMgCQ
         qO+sPyEsFiu7/hfKOWiHQHQQzDtsIEX5deTXfEtFAgeUoZb5T+CwC0BTO9Y2MnXGJpHA
         2RpE+E87sUVszG9VavlA9PUG/9Dk33C63lmzOvKb34md18JhMeBbzp+JPebjmxwGMdj/
         EGqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=SP9Njlmk;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a7-20020a624d07000000b00686daa8f228sor3523559pfb.10.2023.07.31.01.46.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:46:04 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=SP9Njlmk;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793164; x=1691397964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cCfolvh7idEXgF4TdLd2iHCvw9onhY6ET+lKLovyso=;
        b=SP9NjlmknQRt8bmqOt4+KZgBltXZrqoplF5HNUbp1ftNii9+BBx8WsYRJcjGeLNn/1
         FbK6CKC2czHwrzuCR76MTeafDEXOtKGxNUoAsCoESgBIyXZrfyJrdx14Ch3OJWVNcnts
         E6q3oLO/PxBU8PmWiVc7y8YwUD7Kx3dSKy4TuSFTfCK1GRnOvh2cPhavYSXfyyv3YOUe
         9XO/ckQ734cPkVbhf64rYBMQJmkIUKltmnEuLdXZNVCCv/BWhD9WA8HypmNm5k9xwBq4
         EAjUDI/BjMnd6XDFf5MV04HP2l8vQMsq84YDD0vl3CbvSLyuFqck6QMElaa3AGOT19n/
         8ESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793164; x=1691397964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cCfolvh7idEXgF4TdLd2iHCvw9onhY6ET+lKLovyso=;
        b=cIMEEjtrMDdcPHz2J4sfturMBn4uyI4PweajbJ8XwHvsMIR5yc6xgGTTD8ujIIuSft
         9/wSI5g0wk0fIVxkCI/iXFggUeND0RVxNSbOd35E98Bgf72OpyVMjVzPjgT7BrD72Dvb
         ZoGau/jHxee3Y44IFVsYG3EN/6ljLHI+2LD1gz4Y/Jdh+438OAr2IeLiZpsfx2fOWTjO
         pAPASqP4XjeR9SYLqDnE35Bhqs4bCVMZVtgBi3TYgyd3AIFCq9k88fMwviJWvDydLKSo
         pul8+qdgstvBq5oE4eHzzbZqEaKmz0IkLJTr9vTdj68gcLtItcDac5LmrmcLMsIov25F
         bLjA==
X-Gm-Message-State: ABy/qLaCNbQTtTfoibR3gAQkYAqJ0snmRpQQt1DbRUCLZnPZ96NamfJN
	2fRHJDAFu5QsqzGCQ7+JTz3B9Q==
X-Google-Smtp-Source: APBJJlFMxBusi1wYx3a81pCvpSrp8aDs7saPi8oPhnUOMgwU6xu9h9csse0tazK95hVbdV7IY51PDg==
X-Received: by 2002:a05:6a20:4299:b0:133:2fb2:917d with SMTP id o25-20020a056a20429900b001332fb2917dmr10174620pzj.5.1690793163948;
        Mon, 31 Jul 2023 01:46:03 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:46:03 -0700 (PDT)
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
Subject: [RFC PATCH 12/24] gdbstub: Simplify XML lookup
Date: Mon, 31 Jul 2023 17:43:39 +0900
Message-ID: <20230731084354.115015-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cqqq3hmQej4U

Now we know all instances of GDBFeature that is used in CPU so we can
traverse them to find XML. This removes the need for a CPU-specific
lookup function for dynamic XMLs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 182efe7e0f..e5bb2c89ba 100644
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
-        name = gdb_features[i].xmlname;
-        if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
-            break;
+    for (r = cpu->gdb_regs; r; r = r->next) {
+        if (strncmp(p, r->feature->xmlname, len) == 0) {
+            return r->feature->xml;
+        }
     }
-    return name ? gdb_features[i].xml : NULL;
+    return NULL;
 }
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
-- 
2.41.0
