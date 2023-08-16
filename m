Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp364345ejs;
        Wed, 16 Aug 2023 06:41:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e16:b0:687:427c:1ac8 with SMTP id fc22-20020a056a002e1600b00687427c1ac8mr2659523pfb.8.1692193275711;
        Wed, 16 Aug 2023 06:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193275; cv=none;
        d=google.com; s=arc-20160816;
        b=CWLnZ+715C3PvoghGJQ4DRYzBZ6Lt4a+eFqcpEM/IOtgMLBhq0jlcF+GLoEvqAT/U4
         0Xl4J1YrSlTa2+WHs9Xaot6vEozz5x8jGIgjTna+9Oo7GidH9eI31OY1rJZy2TZSAFok
         mbJN5KYjzLzDJvlr3d7rfv+SRpnTZ3O3PSkU6hcJ2+YrK34fyNgXvHHHLo0urFLxV2Ji
         XqUv3LpLDCL/PCKs/eckZu38eK6lNTmIjm+XN2l75ABCXc8KvnnCuPHpfdTzCImG3/XA
         Lofye56+sEqCz4Y/AiRJFmokQ2iTroR04/tPaOs49LBDC3NAAYx5JTeZ14s6UNZXPmtb
         HJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J9NUjmmUVHXy03kGyd299wa55TND6+t1PgSeJs0BSLU=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=cL5zzqP3BCUXsCMtAMjuO30IyK3hncE/n+3BBdFVR06Ep2AsM099R0PBiKgReMbCQt
         5PMGespVklrK0FrhXGDPVI96RYGR/Hfl0YRHl6SR47hbTDdPaDmWZIwLCuHZCe98U8/5
         Kqq7PPtmvEO4oQ1SrsUd84QiAmspqU4nh2/VJ2lJMqSal7pAbdQq0LiQH17IeyhPKydm
         +NfhQF1LO+SIZtoW/7CtnRFpNQReHrIPe3+za19SxMH6gmK1oRrAJZrko/KzD8ffuDoE
         dfZQavYb5VA/970RjcFU4WHmRuqe8zQ6Qx9Pnv3R/QQoPC8Gx2otfm+1YDpfW5nbDlVN
         dFTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=hJ3MtACN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p189-20020a625bc6000000b00686b7f18654sor6966190pfb.5.2023.08.16.06.41.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:41:15 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=hJ3MtACN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193275; x=1692798075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9NUjmmUVHXy03kGyd299wa55TND6+t1PgSeJs0BSLU=;
        b=hJ3MtACN1nsYq7/mQuEIGAyZ6Xu+bHrXQmY69YkIEWwkBy9gSDTe/8KWy++BTsnj94
         GsumDoEGwNqEXtb9HUo6TK3QdOsiIvrzaaacFhxO+mXdSbgoUngZh5LA6hvJL9vBOXwS
         i2HNr/lik65Jc0FOO6LBbfNnwDWZhAAbCqlx4A8Ivg3k+oT6VJo0hbe0OOEXDX+axQ7w
         MxKfEMuiadaaa063XGdvse5ytKZfMctm0CRAsmQYoiVzuW67VF8a3G91DxhcJIxjeppk
         jqk6zTLH0D7qCuJnJzsv8uUhq1bd822+ddcxxW6BpBO1hI8m7rEgB+9MwevjkzSBA6dM
         A5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193275; x=1692798075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9NUjmmUVHXy03kGyd299wa55TND6+t1PgSeJs0BSLU=;
        b=DbyvIvzHSaUjpErrvPUXX71aNUe5OGf20QuFiF8jOk6YwphTDtC6Ixf9yZo5GSDa2L
         /1Qhtqj5OiU7X4Yrs6E/5mKJBLbsHthpg+MSVYd8FNG2VSuVOGVwDtmzYrdrW+tLLj49
         BmIs2AkaDYWk9sjjJlHntFIaTz8flwOy6J6HUlfR9cq1LKOx+BpoX7zPJksUxfExQQT3
         Cb3KH/uXtaZyx+Rm1drrMiU368OTwySYboQpSCRd3UvnzgD+zCNHI1nRUXBbgHtPmm8K
         vutMvItiOzN39pCSHkb+SatL46CTCK1YykbEMj5QFBoz2FBy0bmemlQKT+uKtregbA3q
         8z9Q==
X-Gm-Message-State: AOJu0YxidGDtRV8o/jBO5qWecb1ANITXzVc1bQvUK3Qr344XSXimXt16
	i3H7pOddRRvvBgHRmlj4PLx16g==
X-Google-Smtp-Source: AGHT+IHIYHv/NqJ9AysQA1Z2e/44Ks9b3BqgNgwtM+Rpgb/FcX0fjx+O4zRWsadS63qu4efnBJeojQ==
X-Received: by 2002:a05:6a00:23d5:b0:666:c1ab:d6e5 with SMTP id g21-20020a056a0023d500b00666c1abd6e5mr2386984pfc.16.1692193275064;
        Wed, 16 Aug 2023 06:41:15 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:41:14 -0700 (PDT)
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
Subject: [PATCH v3 07/25] gdbstub: Introduce GDBFeatureBuilder
Date: Wed, 16 Aug 2023 22:39:17 +0900
Message-ID: <20230816133938.18310-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R/JJwBCbeby/

GDBFeatureBuilder unifies the logic to generate dynamic GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h | 20 ++++++++++++++
 gdbstub/gdbstub.c      | 59 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index d0dcc99ed4..1f4608d4f9 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -16,6 +16,11 @@ typedef struct GDBFeature {
     int num_regs;
 } GDBFeature;
 
+typedef struct GDBFeatureBuilder {
+    GDBFeature *feature;
+    GPtrArray *xml;
+} GDBFeatureBuilder;
+
 
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
@@ -34,6 +39,21 @@ void gdb_register_coprocessor(CPUState *cpu,
  */
 int gdbserver_start(const char *port_or_device);
 
+void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
+                              const char *name, const char *xmlname);
+
+void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
+                                    const char *format, ...)
+    G_GNUC_PRINTF(2, 3);
+
+void gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
+                                    const char *name,
+                                    int bitsize,
+                                    const char *type,
+                                    const char *group);
+
+void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
+
 const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
 void gdb_set_stop_cpu(CPUState *cpu);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 293e8ea439..32e88de431 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -414,6 +414,65 @@ static const char *get_feature_xml(const char *p, const char **newp,
     return name ? gdb_static_features[i].xml : NULL;
 }
 
+void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
+                              const char *name, const char *xmlname)
+{
+    char *header = g_markup_printf_escaped(
+        "<?xml version=\"1.0\"?>"
+        "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
+        "<feature name=\"%s\">",
+        name);
+
+    builder->feature = feature;
+    builder->xml = g_ptr_array_new();
+    g_ptr_array_add(builder->xml, header);
+    feature->xmlname = xmlname;
+    feature->num_regs = 0;
+}
+
+void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
+                                    const char *format, ...)
+{
+    va_list ap;
+    va_start(ap, format);
+    g_ptr_array_add(builder->xml, g_markup_vprintf_escaped(format, ap));
+    va_end(ap);
+}
+
+void gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
+                                    const char *name,
+                                    int bitsize,
+                                    const char *type,
+                                    const char *group)
+{
+    if (group) {
+        gdb_feature_builder_append_tag(
+            builder,
+            "<reg name=\"%s\" bitsize=\"%d\" type=\"%s\" group=\"%s\"/>",
+            name, bitsize, type, group);
+    } else {
+        gdb_feature_builder_append_tag(
+            builder, "<reg name=\"%s\" bitsize=\"%d\" type=\"%s\"/>",
+            name, bitsize, type);
+    }
+
+    builder->feature->num_regs++;
+}
+
+void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
+{
+    g_ptr_array_add(builder->xml, (void *)"</feature>");
+    g_ptr_array_add(builder->xml, NULL);
+
+    builder->feature->xml = g_strjoinv(NULL, (void *)builder->xml->pdata);
+
+    for (guint i = 0; i < builder->xml->len - 2; i++) {
+        g_free(g_ptr_array_index(builder->xml, i));
+    }
+
+    g_ptr_array_free(builder->xml, TRUE);
+}
+
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
 {
     const GDBFeature *feature;
-- 
2.41.0
