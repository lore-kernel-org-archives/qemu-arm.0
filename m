Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365548ejs;
        Wed, 16 Aug 2023 06:43:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7781:b0:13e:9451:53ee with SMTP id bd1-20020a056a21778100b0013e945153eemr2088681pzc.38.1692193397708;
        Wed, 16 Aug 2023 06:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193397; cv=none;
        d=google.com; s=arc-20160816;
        b=z4YkJexpZVK2eWVOQpoJd8GvlY1Ek+b/tQuv2393ZaNBVju2/zM8a9jkkIU4i+Pi2E
         Z0xk4BfW7EDaG4QfsPpYFm8oO+XHnSpKItDeFWzAQkZLHIKyhvRw245TyOxnmAkttPsI
         nmSTHIwubIyMuxr8FtH2IfzmgyjEJpEMif+zv/nnSUqE/3w3wWWdSJWu8zQQS4veiGkA
         dtXmPzSnB316UCPtz3fI/GeaWuclpVPG4AHbOnRZSx5imW+gt5N/OEXTM/bLcJrjldxj
         XfwXuPDf7XU5PNjPnr5+WjX/hFZH9x1KQn3Xf7vyigK6g86BYiv17kUGHbCPC9uVjwYR
         0gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FeKiYP9xrSKexWAO9b8A0nNhOs6FhnCu3ht5OqePfRY=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=fgDPNWOEAeZIom4p92icQWuINQN6S/A7gKi/tDCobamxWu0d07VFkcybbMH+HMLCdU
         qo768iUkUrv52Qnw6dvjd5XI2Qk+Tzd+o9KGopjUnvgEup2YMbjb+rsuW96nEBGBKSEV
         amMkZdlkusCcV7MVfTL6hiSSJfuYtxBTp8zzaiCFfzxUbeXxXtUqgpP5yvJ+8GYioZxS
         8uSJQz/lWzJQwZZ221IR1FoldOjNDAMiMmad7+Iiofh4l74EwGRj1xZJXP9K9gC5rS3m
         tBtIyoOiV43R0Ve7ksygAXkCQtfILNlPgoU1lwhS5vanS9FQdVOJ+L3ARE4pIia0HCUr
         3DRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=zG4Vpa+1;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q6-20020a656a86000000b00553c0de36f0sor6831032pgu.10.2023.08.16.06.43.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:43:17 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=zG4Vpa+1;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193396; x=1692798196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeKiYP9xrSKexWAO9b8A0nNhOs6FhnCu3ht5OqePfRY=;
        b=zG4Vpa+1bHJWs5uT7JEFhopN09hzSdvwrr51pIbR8uIWP2z+tTju1TsfSnRPUjLSGg
         l7SBDjihWmYWtMsT/jahQBi8dTX8SikraOjSzkx41dbNwRvbS7ma2rWOS7brJk0YEDfq
         WWvFXN4c6J08+uIo7cyXWo2w4A7czuzVmoqq8vtSCh7Z7EGduVavIMxrtxnGIp0mGjcz
         Lg0WjAIRPgaaTwrEI96mhVCKa0/12yKd7FME8gHhvmJLS92U9kqf1RRmhFb1RH9wLNoH
         FQvP4/AbEDTmGMAnXtjEBHoHLuDM+6IHt4DAZxi2RiNQtfHMs3v7gKCH1TTTl/5H+DT3
         Zb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193396; x=1692798196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeKiYP9xrSKexWAO9b8A0nNhOs6FhnCu3ht5OqePfRY=;
        b=fgZF2cTemZ3d03Y9N4O4K8F0S4yZZ7cYADtsHG9A+SZ2W+woNMTTr4Ps+Q0I48dh7X
         Hlg8v+bF36pk8Wkw1U/ic40cVgO2/S6BnMLFVlbFJiRfsaUXNwE+o4cv9oV7r7NUqaF9
         clvq39M8qNcSr0gur/T4Lwto6+nvSTTYjPCU4nzmFQN61bCpjQKpUJg4hEd5rwPyldKC
         gt4JcV1hqY9WM1lft2exOSqUSoUETrp8eVRChq+NokBXdastRHEoeKbOOxMCIcs/8wdS
         2UQvjEEvwtuLLMs2k6WvfdSCU/lz5AWDN3Rq3FtM12EJiBcvyUGIp3Ce5QOqEsf3YMp2
         2GjA==
X-Gm-Message-State: AOJu0YzmAgJ38UrlafiOwgiv4HnApYrOzUUmK2YLX2HF97S/jRa3mP+i
	yhpHtT2Yw/K2gL865g+E5e3akg==
X-Google-Smtp-Source: AGHT+IGtEhNmlyU4gpOyiAuSErTWEb4DF6l1/uj7/5GgR03iJXKDK9tbyR4hSxGerYyDp1LAsF5JjA==
X-Received: by 2002:a05:6a20:3953:b0:140:6979:295d with SMTP id r19-20020a056a20395300b001406979295dmr2266571pzg.2.1692193396610;
        Wed, 16 Aug 2023 06:43:16 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:43:16 -0700 (PDT)
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
Subject: [PATCH v3 20/25] gdbstub: Expose functions to read registers
Date: Wed, 16 Aug 2023 22:39:30 +0900
Message-ID: <20230816133938.18310-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cwCFdUisjDnW

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
