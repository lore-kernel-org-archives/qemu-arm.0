Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2026279ejb;
        Mon, 31 Jul 2023 01:47:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1989:b0:682:f48a:7295 with SMTP id d9-20020a056a00198900b00682f48a7295mr9384028pfl.31.1690793236786;
        Mon, 31 Jul 2023 01:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793236; cv=none;
        d=google.com; s=arc-20160816;
        b=ziuhwJzOY/TvEay+kGu5wuMm8PUtIVQClKpZaaF72L4m6d/Pggw2zrz8uY24Wj/hfL
         LyoAwPdw2ZZv4emrRYito+TlgBf8AZzSpjAG3oYRg+17lIjoT5fjfxeg/1jAfsJ8H7ZM
         o97bYZPDmihYZSHZ0i8wrdZDLKsSHwoUDaY3pAqM+8cqCOlYT90h3/KggPjoBfR1aSD/
         cthxIII6zr5fFo5mfLVgfoGAGTLQUEgjjwTEv8f/m4fmnSXlQ7pShpQGcKylQ6sF68T7
         XhuStmGSOnGrR7vLy39nZdhSdfx8ga9rS/1wgut7kTSTWH5TA/aaZUCFIjjYgT0koO2a
         rkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VKGqRmFHlLElcyIKfmdM6E/OloMqOiQP/Nmx8ezyg2c=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=CsbveBWgjkJGN17+ISEQ2ntD8ey7TxAGg8lZujJt+87JGqQX+B7J/PiSU2YqnuDW4e
         +fj6MsHTpLh+AZDFJ3KPItZ04owdOb1LSK4rDbVgBQmo2HB0wZQl+ZrA2aP4HEBMBI8U
         Zr4i6SoroILE0gkbo8SM3ceVNcyG6RsrjtJp3iHwGJS9Y4q6B+NNsqi2t0Sr8JtFDoQ8
         w+8ftr9ql6N1m1tdJGtRXprDCrJuTYYEpvyUZ+YkkI5Hgbn2/TZMp4lakLbcBwY7zIPk
         F54euNIsZZlyMRTLYZPXdIGpr+iH29SyGj/9sN7SUmCyWnbUpq8TYluxFLF0vvk00pMG
         HIsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=gJ5S9Cw9;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a9-20020aa78e89000000b006871817f7a6sor1901473pfr.3.2023.07.31.01.47.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:47:16 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=gJ5S9Cw9;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793236; x=1691398036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKGqRmFHlLElcyIKfmdM6E/OloMqOiQP/Nmx8ezyg2c=;
        b=gJ5S9Cw9jZyUlNakHoWVELex9gRK+d9tCD1vu1ejgda3LVVYxWLBdHtGKcopy7xkFa
         CPt4Rjc01FhgSxN2hkw6PsUBYMaC8RH8vxkqT0VncAn+w7iDkbcXeBkF5A7rmy/k/TGz
         QdRH3uaZq1s0U8sg4TFNTNLb7jFK9VEobJf8KZLsXv2lxSVGxwCZbH7JrPuJyZG6FOXJ
         Pp8U0mtvOKEkuEE2BAuUI2wFk2d5Edcreca5BzyJsVKqXNbviiIcxDEUoZ5l2uKulUrp
         pvPeeFgdLvfD6z86v03XZPDFtge3hulTbu52Et1S4V9dFAvnbCtqmkHArDXGQsM9jNae
         ZacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793236; x=1691398036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKGqRmFHlLElcyIKfmdM6E/OloMqOiQP/Nmx8ezyg2c=;
        b=gFE1oklfsOqX2Coxg4VzeDlN683mjzqTELfo8VtPJ2ccJpfl9aUHjapuxLWtbpYnMc
         A5CmxMMoqE+wm2Hvylp7rpQTJWeGQTFYTfhXLZGwawufpeR9xK3sf7F3mHkC3H1/odN6
         WXKOp3iktErydZa6q2M7oIZ7XaNtkuVpbJLlIoc6QOORX5seozttGg+F8bBxwPSPTgsw
         GfbGNxbUp5MS4n+7XgE8vghb2R7VTpBX+0Ff9Sa+UXCAQbvwChGfEKp5ri9zJ2Fv0UXE
         2Qwevb+oBbD3I/TVqzEQmJP2HE/UdS9JuwfahqkPvAa3rUFNoG062x+F+R+9LLmnk/5I
         vVRQ==
X-Gm-Message-State: ABy/qLan2H/ABjPPlELGWz5V4Hl4sh3gDnAfg+hdTHhFAnWn+tQFxyw/
	BLpxC9akME2W08zqWHRBjLgVzA==
X-Google-Smtp-Source: APBJJlGpgUS7fCkfqnBEJVFzmloEcHFe98LXemCdllwcT3LxUf+wXFN8nI8bEETPZId/zh5Dk9KKzw==
X-Received: by 2002:a05:6a00:1302:b0:686:bd88:605e with SMTP id j2-20020a056a00130200b00686bd88605emr10960922pfu.11.1690793236352;
        Mon, 31 Jul 2023 01:47:16 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:47:16 -0700 (PDT)
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
Subject: [RFC PATCH 20/24] gdbstub: Expose functions to read registers
Date: Mon, 31 Jul 2023 17:43:47 +0900
Message-ID: <20230731084354.115015-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: j477iDFPo4oG

gdb_foreach_feature() enumerates features that are useful to identify
registers. gdb_read_register() actually reads registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h |  6 ++++++
 gdbstub/gdbstub.c      | 38 ++++++++++++++++++++++++++++++--------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index cbd1e6ead4..5e5789f7bb 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -38,6 +38,12 @@ int gdbserver_start(const char *port_or_device);
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
+void gdb_foreach_feature(CPUState *cpu,
+                         void (* callback)(void *, const GDBFeature *, int),
+                         void *opaque);
+
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg, bool has_xml);
+
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index caef6aabab..5f76ff7271 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -416,14 +416,32 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
     return NULL;
 }
 
-static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
+void gdb_foreach_feature(CPUState *cpu,
+                         void (* callback)(void *, const GDBFeature *, int),
+                         void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    GDBRegisterState *r;
+
+    if (!cc->gdb_core_feature) {
+        return;
+    }
+
+    callback(opaque, cc->gdb_core_feature, 0);
+
+    for (r = cpu->gdb_regs; r; r = r->next) {
+        callback(opaque, r->feature, r->base_reg);
+    }
+}
+
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg, bool has_xml)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUArchState *env = cpu->env_ptr;
     GDBRegisterState *r;
 
     if (reg < cc->gdb_num_core_regs) {
-        return cc->gdb_read_register(cpu, buf, reg, gdb_has_xml);
+        return cc->gdb_read_register(cpu, buf, reg, has_xml);
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
@@ -434,14 +452,15 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     return 0;
 }
 
-static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
+static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg,
+                              bool has_xml)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUArchState *env = cpu->env_ptr;
     GDBRegisterState *r;
 
     if (reg < cc->gdb_num_core_regs) {
-        return cc->gdb_write_register(cpu, mem_buf, reg, gdb_has_xml);
+        return cc->gdb_write_register(cpu, mem_buf, reg, has_xml);
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
@@ -1067,7 +1086,7 @@ static void handle_set_reg(GArray *params, void *user_ctx)
     reg_size = strlen(get_param(params, 1)->data) / 2;
     gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
     gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf->data,
-                       get_param(params, 0)->val_ull);
+                       get_param(params, 0)->val_ull, gdb_has_xml);
     gdb_put_packet("OK");
 }
 
@@ -1087,7 +1106,8 @@ static void handle_get_reg(GArray *params, void *user_ctx)
 
     reg_size = gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 get_param(params, 0)->val_ull);
+                                 get_param(params, 0)->val_ull,
+                                 gdb_has_xml);
     if (!reg_size) {
         gdb_put_packet("E14");
         return;
@@ -1174,7 +1194,8 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
     for (reg_id = 0;
          reg_id < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          reg_id++) {
-        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, reg_id);
+        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, reg_id,
+                                      gdb_has_xml);
         len -= reg_size;
         registers += reg_size;
     }
@@ -1192,7 +1213,8 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
     for (reg_id = 0; reg_id < gdbserver_state.g_cpu->gdb_num_g_regs; reg_id++) {
         len += gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 reg_id);
+                                 reg_id,
+                                 gdb_has_xml);
     }
     g_assert(len == gdbserver_state.mem_buf->len);
 
-- 
2.41.0
