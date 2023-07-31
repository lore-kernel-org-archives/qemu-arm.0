Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025749ejb;
        Mon, 31 Jul 2023 01:45:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da6:b0:687:41cb:e274 with SMTP id fb38-20020a056a002da600b0068741cbe274mr973972pfb.9.1690793155474;
        Mon, 31 Jul 2023 01:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793155; cv=none;
        d=google.com; s=arc-20160816;
        b=l7k7zt+1zNeu1GSR8QzEcr4j1Q/nx+W8ZxkUoO/6gnlTb6/ySebNtSEu5C5k9aUUR5
         /q2OWIm3O1T+ldiOm8BVTUDQeuEEYDsZqjTC51wugmvDR+CXmy6Nc3kIZKrFtIuF7Ptb
         JxUIVvKCq0pNTc7kbsx+kmpOVv2wurI1RO95e5BKGcTfMtBTQHRtpTD7YJwANFAALhLL
         p9/VM3WNfzFc3tikH0sXJwS40v/3e8yoI+nWhnR3UQv49I4sdu24V7N6AVFs9eO2Eb+A
         SDbrxJFTsGGeKJdqG41sWRn2VEzKal+gROPhLX8ALG5c68jKaXIletbeTMkKYg79Cwz6
         R4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4O5XiL9Naewl5HxRHqjpi1iQMXhF2obFyf/BgvZpyDA=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=faDsCwWEjyA4HrDaGBxMzlSbd9BwQIqZMIyZWN0ac+guC3R6iDI+htw8w4B2JDT1JK
         2s6jmqb4sirmLTmFCS4xapD6zNeBDJ/JFVObPIavUT/nvAFtRDfzovfihquL649OHm43
         w42aFEjf5pnL8+D946OdKXBpk1HdacwZTXVe3jMA4/iaJxQaqfUNcA2L1Nrv7muGINfs
         7If5Vk9sVjQ3I+eonbLHhepu+DXkttRMcm4hcS9JuGwJS4fh7xJXboDnDkPBoP8GcFub
         IC0Vt6lO46utb/Np6+dYnzK0ul5zMOWJZi2yI+GZroR3EJSJOI7jZHchH17/Wr9AxRCS
         6gFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=GJVPZppD;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e10-20020aa7980a000000b0066a4f04ea59sor3535543pfl.4.2023.07.31.01.45.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:45:55 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=GJVPZppD;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793155; x=1691397955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O5XiL9Naewl5HxRHqjpi1iQMXhF2obFyf/BgvZpyDA=;
        b=GJVPZppDfKmYORLuER6EZt8krtL9nEB6KbU1E0vrA9yICHD19t+Sl0r1zzPJH9J2dd
         IvhK5cXJEHQtPnyQC6qPSZ7RQv8TT8BJhLRTZaFIc0ARFhaEQWT0BpwsZyOb0L03CZbF
         dQNiTsLBdsR5VzDIHnh8ejRK8wmTJBDYBHhhtznkAcYXuvQXNdhTQTuH8IYgaZFL7I3M
         eVdl/XWPzz1nrVlid/X16UIXd3bGTVIEtEhXNXe+ztpVIN3YLpzDa4JiJjeLdSFwdaEA
         /114FyCkYzTcia7wH0uMMpsMaMBq5DfC2/pgKQB5snMORo+bxpHZOAbRuZTqDVMekoJN
         ewZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793155; x=1691397955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4O5XiL9Naewl5HxRHqjpi1iQMXhF2obFyf/BgvZpyDA=;
        b=TpeTU3rDOpcpupshzRr/LlkvWev52Oxdo6Zl74PfCjcH5A074KuaWVgGgx5k2iOU6P
         3X5S/vV/JGnEB3YXKNPJQweteCcZmsQS+YA2bt41jnPYjT7s53igt9Utrj/zf9GdRMjT
         Bzn2gJABDKN4r0A36V4uKs4WHuS0QuQG44L+zUijDqmsrEiOO8PJMMS4wmWJy0rfHGsT
         hLmwIuw80bUKn5PK7r7EiT+2e71LKwnRIanYuIeJSEVvA9w2mQEmS7MoH+QfRp6ld/BF
         ogIbYAIO/zv5oPuyesLRY+0dtHw7EdrHy4AlKmhQk5csc1YhNIrWyygQkFx/poTQ5IrB
         QMJw==
X-Gm-Message-State: ABy/qLbMUl5uUuj11sjVU4b6iHrm5Mmu6wVQOiMd/avj40LQ9E9crRZ9
	luSiKgNwJLhcUnWnf9GUdmaofA==
X-Google-Smtp-Source: APBJJlFaXNhraOVLhdxG/o3w8DDHlzViclvmPWpZWDjTqqgWJd4IXLIrj7vVtLRc0eWTdaVZV4puaw==
X-Received: by 2002:a05:6a00:22d3:b0:687:1604:39d2 with SMTP id f19-20020a056a0022d300b00687160439d2mr10574023pfj.10.1690793154902;
        Mon, 31 Jul 2023 01:45:54 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:45:54 -0700 (PDT)
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
Subject: [RFC PATCH 11/24] gdbstub: Use GDBFeature for GDBRegisterState
Date: Mon, 31 Jul 2023 17:43:38 +0900
Message-ID: <20230731084354.115015-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ROjE7Jp5AaA1

Simplify GDBRegisterState by replacing num_regs and xml members with
one member that points to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ab75f6686b..182efe7e0f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -47,10 +47,9 @@
 
 typedef struct GDBRegisterState {
     int base_reg;
-    int num_regs;
     gdb_get_reg_cb get_reg;
     gdb_set_reg_cb set_reg;
-    const char *xml;
+    const GDBFeature *feature;
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
@@ -390,7 +389,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
             pstrcat(buf, buf_sz, "\"/>");
             for (r = cpu->gdb_regs; r; r = r->next) {
                 pstrcat(buf, buf_sz, "<xi:include href=\"");
-                pstrcat(buf, buf_sz, r->xml);
+                pstrcat(buf, buf_sz, r->feature->xml);
                 pstrcat(buf, buf_sz, "\"/>");
             }
             pstrcat(buf, buf_sz, "</target>");
@@ -438,7 +437,7 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
             return r->get_reg(env, buf, reg - r->base_reg);
         }
     }
@@ -456,7 +455,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
             return r->set_reg(env, mem_buf, reg - r->base_reg);
         }
     }
@@ -479,17 +478,16 @@ void gdb_register_coprocessor(CPUState *cpu,
     p = &cpu->gdb_regs;
     while (*p) {
         /* Check for duplicates.  */
-        if (strcmp((*p)->xml, feature->xmlname) == 0)
+        if ((*p)->feature == feature)
             return;
         p = &(*p)->next;
     }
 
     s = g_new0(GDBRegisterState, 1);
     s->base_reg = cpu->gdb_num_regs;
-    s->num_regs = feature->num_regs;
     s->get_reg = get_reg;
     s->set_reg = set_reg;
-    s->xml = feature->xml;
+    s->feature = feature;
 
     /* Add to end of list.  */
     cpu->gdb_num_regs += feature->num_regs;
-- 
2.41.0
