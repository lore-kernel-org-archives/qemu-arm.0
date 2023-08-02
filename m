Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp207125ejb;
        Wed, 2 Aug 2023 01:49:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:66c4:b0:134:1b21:b2e9 with SMTP id ze4-20020a056a2166c400b001341b21b2e9mr13494205pzb.21.1690966188083;
        Wed, 02 Aug 2023 01:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966188; cv=none;
        d=google.com; s=arc-20160816;
        b=ynRXjVAx5PEJnszpN9lemLNweRVLFVZ6abxoL86HxkOCWYGGNs+USJDE646ga8a2BA
         jsqgWbhKbiWGua1AAhxS1ypJnb63tOnTFNWOm5moHapTIQOjK0FS5q4a5XagncmBNtQ9
         m7dWyNyiQVLIXqXLVzeE3LPkTaGtD4vNC3l3sqq1ZvoMowYWCJbhKvmr3R5/ZyVMzTfx
         FKHBcJMRY/yFjh/m3mY+7+rQfJ3ze1b7a7i0HbfQlj6o6ymaiImPSynGZgo826CAs1ty
         ber0L6X0SNrHuKWN7cNNpf8oXXzSmFMV7FsxQtcG11mTYwK7n5pInv6mrGHycggovbg2
         gobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=b1wI6pbT+UOvNduKCMCkfq23k895sVylyUMgvMoltAI=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=njfsPgt5F5L4oJ97uzdedVix32EpRBDj+9ysdnxk6a6cDi1ATJT9VA8vAr6PyZQpdy
         WSSK/qLwHo6Yhjf0EwXg9usOpgYBLHcBJI6J41AEk8XMD/WRFUwWgqtS+pxT3IDIZT2V
         JFQAtZKpzhXlfg4ffvsq7yyM9FpoJSazKT/mi+YlCnNWwGQw/UcqoqSyZtVR1IhgbXLp
         uTwW3X5wl9WmDLUiRJfCzbRuH8gw/XDVjKZcL0aCNtmHNpj2wxSMYOU4WQMBJZgNliO0
         4nt415ncDue/Tmy+7UZXWZRD5xKpmepK3e8S/rHXlcAQGJY6jfmSU/Usne7hvTruK7qq
         zB0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=i7IvH2YN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k29-20020aa79d1d000000b00686ba4ad5a3sor5441362pfp.0.2023.08.02.01.49.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:49:48 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=i7IvH2YN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966187; x=1691570987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1wI6pbT+UOvNduKCMCkfq23k895sVylyUMgvMoltAI=;
        b=i7IvH2YNE7Fbek3+xcRbwdyMf+UMhgDfWnFXIqDtHy9An+D9BuS6csAdsYfmvZMovp
         s3CZsvzqvZtMGUxO3MooQ3U8oiwe7IyIlAIS0rxInvVxc38L6tmYwRAurNPUA2cetf0N
         spcomepRsHP7/5mIi+CQxxra5sBZjMbvCl+EyfJA5Qk4kfn8VUQYlFVS3YLpk3MB2AqG
         8eAj1zUHNkPZ/glsl5+nT5n5P0m804GfhEk2scyRZK6xLByYl1whMJIwmBW5WhbX2SpY
         Ggc8jajpPLrZV+rOvwJ/mmYX+aXIMqWx+zS93qwB+QFpdXrrLQvIoys5KzbRa/ky5uSm
         sOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966187; x=1691570987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1wI6pbT+UOvNduKCMCkfq23k895sVylyUMgvMoltAI=;
        b=MUNcHEMcfHl1tpNTHx/bW5N9riybqxCZktxkL+tI6GXhr27FjW4kB6jd6On/NKnsaU
         ZUwP0LIBLS1Hh5WGjiGDskP+l4W9DOwhsOmZSltkSlHqbN/ZWTwid0UAy6gjDb24qOqo
         ljgcWZapf4DfIeBhCrlxEpiQBkhNqQPRw7YpAX8WI6g4ii97Xdnbl+zAM8RFwbZLbXPe
         9/TgCkTfni4Ckwynm26DEHpuKUGSMqNTSsVXwjwdJtGKgND3tLJ5YpovdoaEtzqOl66o
         NhfqBSAVxWEbofngKc9oJBJEhs0xDITiM12gAG5rYTsISKgUSnKVfC58hPVoGcCTSJFN
         U3Hw==
X-Gm-Message-State: ABy/qLa+dhmA0b6i4SzcGGRgg6M4ZaSYhqENyGmLfvi5m5l99RQKGZQ8
	23kYnPmiJDuO4sbrNlNyES2LHw==
X-Google-Smtp-Source: APBJJlHs2gxFhAzibAywGj6CvASC/9SoxfmpCfsJv3DymHVWtTmAN7gtXGM6Bwq8kInKr4phCH8C8Q==
X-Received: by 2002:a05:6a00:390f:b0:682:4de1:adcc with SMTP id fh15-20020a056a00390f00b006824de1adccmr15775059pfb.12.1690966187524;
        Wed, 02 Aug 2023 01:49:47 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:49:46 -0700 (PDT)
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
Subject: [PATCH v2 20/24] gdbstub: Expose functions to read registers
Date: Wed,  2 Aug 2023 17:46:08 +0900
Message-ID: <20230802084614.23619-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3c+soy65VH/9

gdb_foreach_feature() enumerates features that are useful to identify
registers. gdb_read_register() actually reads registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h |  6 ++++++
 gdbstub/gdbstub.c      | 38 ++++++++++++++++++++++++++++++--------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index aafbea78ab..86fc0c46f4 100644
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
index 8e0c85d7b0..aa165111db 100644
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
