Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414451ejs;
        Wed, 16 Aug 2023 07:55:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8e:b0:13f:b028:7892 with SMTP id s14-20020a056a203d8e00b0013fb0287892mr2279639pzi.2.1692197728133;
        Wed, 16 Aug 2023 07:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197728; cv=none;
        d=google.com; s=arc-20160816;
        b=XGHWpTbwEXzmBRRI9aZHVSPLJVMdodi34doqwWx1kv4JGep64MUGdrstaGAAjx76cy
         vEZv0d7BgWYWIstWh848oZ8sHyPIfIqwVd7piHDwrtbBY7objDVxJSZonEObvEsIdZGf
         /0jfaZPhuHpds8aLzxmqfQaWUfzzNaQ3rgs3Vw5emVF6g5fIbvKYiXq3IMxaXzSNHc1Z
         iDK3Wb8vhFXDoYnlX2fOtkppRPZ8bEmW9qu++0artFoVlsAT9FcLR5RxxMG9Blpo/AoN
         oXzig78eGgFSQ3adMS7LYZ/ZnJJ2pGeg2YzSIRtcAQA06dy7Ymv0cBhhUuECArjwr6hz
         x4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FeKiYP9xrSKexWAO9b8A0nNhOs6FhnCu3ht5OqePfRY=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=Pn2mj01Kl0jipZ6LykP5om7T9MvnkE82csWTp9P3xGapvAuBaRT6IBNP9qAcuJL57F
         hlBS4vC1YIUsshpn5od/ziRPj6HjzQuzWSuiHTr1qXLAAUqaZX1/ndFtUPkaG7Q/F/9E
         dNPcyTPbElBv3kaGVc8ucwOeDItm1LzKC9Xr2po0b6tDNhHdzvV7cE6HmTFq3mNKBpfS
         Elj1hEBCFbbgMk9JA/yuu7E3ZSmLSnTri9GPZci0ixGIh9ihfh9GkGZ0gZSeizQMTc4/
         vfZFqxNW1OeLnMeAy8+FtpB9MtwgQYWlBatZDwwRsiUprV+PARuix4bIfWHZBA80jaMj
         /Arg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=QOSq8rSM;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f23-20020a633817000000b00564c1728061sor6849230pga.10.2023.08.16.07.55.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:55:28 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=QOSq8rSM;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197727; x=1692802527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeKiYP9xrSKexWAO9b8A0nNhOs6FhnCu3ht5OqePfRY=;
        b=QOSq8rSMJwCw4yT4RfS9VQKbsGnKKehRFFaAay8FJlNj+QmUEgOYx51+RRipyd2e+e
         QhrJ1+xX1tm7EFsLJ2GT/iY48GrfpaRQqt1cieHhxtHUut497ZSmhmoRw605pv+Mlx6W
         /Y7w6CSKdWxoRwhRiO9E5EyX5jxFhRgqRDsJmlbbRPz9+KNv1JHQN+YBcMN20yemn348
         sbkgLmE5nQuaDC/TEmywgnUJbaIsGTUoUlQAIXw5x81t0RAJUu6tA1Q1404pu8chbMZP
         if1Vrfb0majla/SBGZFm782mFxEUJANdiXfnSpbG9kpo1/idiPdscn4D1lDi7NeeZbTN
         Lgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197727; x=1692802527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeKiYP9xrSKexWAO9b8A0nNhOs6FhnCu3ht5OqePfRY=;
        b=iBzElCagsBIIs/WEZ3OaKMlVy50YeBQkc2815Z6VcC+eRhkkeqlUkaOd417uvtswT6
         DmId2fnGLbnMBU26haXk/yMu6eHb5ZtNjr00REICo5blpV7qVuLsyvsLEQ5TziLjT6S+
         gnl3gIxH03206VLgoGf9fQks5gArSewRdR3/IfCvNVlFHG7/17zQ0tT+1noxq1lx7c/e
         rya0T2He6SSRRiQj0v1FGYBDR6i6wfsi4DXaPspgpBgDonK1AIOZr/ZbpHd8AdNA3DZt
         BWsCGyCclOGxEL7bW1h++QPEk7GKF5CXomQ72cuSrZtkE5eYi8DTngll1YNwFcsNQqoD
         GTQw==
X-Gm-Message-State: AOJu0YztAz17e8XRiRAJjyrjhsVgMgJo6rE9Anxebxv5zPfQ0wN/yulK
	I5yR3FY6tfxRByDSdBN5AC97yA==
X-Google-Smtp-Source: AGHT+IFJPQo0CowNAlPgDFOH/Tnco/aRBZ747oI79WYdwq3oVrGEE5tawYIyCoDbuI9xrw7iAk4seA==
X-Received: by 2002:a05:6300:8082:b0:12f:1f1f:b506 with SMTP id ap2-20020a056300808200b0012f1f1fb506mr1843860pzc.21.1692197727672;
        Wed, 16 Aug 2023 07:55:27 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:55:27 -0700 (PDT)
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
Subject: [PATCH v4 20/25] gdbstub: Expose functions to read registers
Date: Wed, 16 Aug 2023 23:51:41 +0900
Message-ID: <20230816145155.21049-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: b9NQYK2iJ66T

gdb_foreach_feature() enumerates features that are useful to identify
registers. gdb_read_register() actually reads registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h |  6 ++++++
 gdbstub/gdbstub.c      | 38 ++++++++++++++++++++++++++++++--------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 5cba2933d2..151e9e81c6 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -59,6 +59,12 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
 
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
index 5974af7c8f..e395a58db4 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -483,14 +483,32 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
     abort();
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
@@ -501,14 +519,15 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
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
@@ -1134,7 +1153,7 @@ static void handle_set_reg(GArray *params, void *user_ctx)
     reg_size = strlen(get_param(params, 1)->data) / 2;
     gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
     gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf->data,
-                       get_param(params, 0)->val_ull);
+                       get_param(params, 0)->val_ull, gdb_has_xml);
     gdb_put_packet("OK");
 }
 
@@ -1154,7 +1173,8 @@ static void handle_get_reg(GArray *params, void *user_ctx)
 
     reg_size = gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 get_param(params, 0)->val_ull);
+                                 get_param(params, 0)->val_ull,
+                                 gdb_has_xml);
     if (!reg_size) {
         gdb_put_packet("E14");
         return;
@@ -1241,7 +1261,8 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
     for (reg_id = 0;
          reg_id < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          reg_id++) {
-        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, reg_id);
+        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, reg_id,
+                                      gdb_has_xml);
         len -= reg_size;
         registers += reg_size;
     }
@@ -1259,7 +1280,8 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
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
