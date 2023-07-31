Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2026108ejb;
        Mon, 31 Jul 2023 01:46:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c4:b0:687:4927:3df7 with SMTP id f4-20020a056a0022c400b0068749273df7mr477802pfj.20.1690793209378;
        Mon, 31 Jul 2023 01:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793209; cv=none;
        d=google.com; s=arc-20160816;
        b=zsx4LMEgarc5OVB3M/yjkRuQU1R5JuAViDWfETCy/1/TRCJ0nFcKZcOQJcvJ48ey9K
         6on92zPwSDo+uuWYkEjipoBDBPaEG+d2Rs/HoGkdmrBylQXR+GAHEnw+dh6GfDPyaMeV
         OkN0mZJYIUTaKj1LrB64n7w+hpcwHhtUHTHhlaA72L0kHqXjFZG2l8Ak2KI9WrN1xqk+
         NeVvII9NOQFdhqc4icN4BbjPwojgyEvDh8Q47yFX4yNY1nji0Zp00U3vMY7v5RL32n8S
         VFXzQjQvghtcNTf5Lx/NLk5XfxWz2f0nPLW4GQaAcoIzxUxKkeReuNdbW2JMflMp+9TM
         exqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i68gTXndm5g2JBfGSVbcpcLCWh9EafQ06rBdOr/hNg8=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=OYHbC0xDAj1lr/A5KmxGu2gNNN+5vY4bfKOD5edmKro5XvnWlbYDA4o8zYb6tgWyqJ
         AGHbRJ7337AKG+zwYNG5zxdqjT9RWsryi0NmFat/YtVZ4BwlQT+Eru5OgrdLj5IA671p
         VogZa5W+vhHd0NkabrWM+MSbDbp3RKNaVMj87Qsj8316LXeXmL82ZcOH0GMpVJaC5cQx
         hHeNG84w1VBaCyv+Hfl5hPHDtqiUTfpL1O5uGWvnjsHgjgVNBvPggg/QxqZqLDrrkYEm
         5o50TuSWDKeZzNJHmifw2NGks05PzdSaOI6sdLCf8RIMjWcc5GVXS5sd4UXhh9eTQ3KL
         mlJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="nC6x/hrD";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b21-20020aa79515000000b0065ba0464406sor5409705pfp.1.2023.07.31.01.46.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:46:49 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="nC6x/hrD";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793209; x=1691398009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i68gTXndm5g2JBfGSVbcpcLCWh9EafQ06rBdOr/hNg8=;
        b=nC6x/hrDw7RM2hyF01kPWOTN+B1vxbMARwlG2R+cm3uzFEtTGTvvv0hAHUbOiWJSm1
         +oZD6x/27ed4ARu5S8X8QI6AXv590W8WESkEvqBL+kNvnQFwNBc2v6geEX4g89mtkatO
         aaT/WoMCebIPOX05W7SrSC2Y0YD+Xw8sBSjHpHLp90kU9kQijGZFI7zp67qHR+CP093V
         8lfb7qbBkqRvL1/gLBZSv5PjkhCH8PO4SyULmD7E+8SvDp9CgFCcZyhfmC8Kl+7+fRnQ
         8cwgClpr3Cqdfn0sJZEndReB0DNsCIOPZwA9VRaa9X7UET6eGJ8jG3/tqiW+I0eRG5ZV
         mIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793209; x=1691398009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i68gTXndm5g2JBfGSVbcpcLCWh9EafQ06rBdOr/hNg8=;
        b=QpbpZJ64ljFN05SOySILevRFOmbZsyxoUrRRGqzry9XYlqAjiwBWEaE1z6HhiJ7taU
         2vltnu2gVgvlAy8TK8UrmjuRi0uM49r30jC9sS5xfuo7NTWn9Jt3X814Xv66Xthz7ilE
         Mz7A0xW3gkqjFd/SVPyEqk3AK94IIf7auDZd1hBgFO+Yva/8dL1MOE2r8RoZwwtiB2/i
         sRFAHr9cs98e5SZO6iK7/mcsowzhqmT7V6FOc4xmXbP7mvhVjsgDgVDThhjWVZw9UecI
         3d/cep6qsgXw34aMoEhdLRc/SAYijeAHCSYn3sU3m/sazxoMewOUMQ6GYliWVMoYeT5P
         mpxQ==
X-Gm-Message-State: ABy/qLbaHs1o08rBM0Qw3TFLzdanC0BE+hR2xJIT+lIDrTDlrVCXOBb1
	q0umP3RKmyvR302f5KCDH6/8YQ==
X-Google-Smtp-Source: APBJJlGZcLds9//79Mo+76iCBHc3jp3+Z0ypqGuVU/Ww43E+kmyH9WV6RDVLVGfmft7WqgMHYa9iyg==
X-Received: by 2002:a05:6a20:5510:b0:11d:8a8f:655d with SMTP id ko16-20020a056a20551000b0011d8a8f655dmr9020629pzb.4.1690793208923;
        Mon, 31 Jul 2023 01:46:48 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:46:48 -0700 (PDT)
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
Subject: [RFC PATCH 17/24] target/riscv: Fill new members of GDBFeature
Date: Mon, 31 Jul 2023 17:43:44 +0900
Message-ID: <20230731084354.115015-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IvzEJCbzoErt

These members will be used to help plugins to identify registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/gdbstub.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 224c69ea99..b3d4d4de3e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -217,6 +217,7 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     GString *s = g_string_new(NULL);
+    const char **regs = g_new(const char *, CSR_TABLE_SIZE);
     riscv_csr_predicate_fn predicate;
     int bitsize = 16 << env->misa_mxl_max;
     int i;
@@ -240,11 +241,10 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
         }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            if (csr_ops[i].name) {
-                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
-            } else {
-                g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
-            }
+            regs[i] =
+                csr_ops[i].name ?
+                    csr_ops[i].name : g_strdup_printf("csr%03x", i);
+            g_string_append_printf(s, "<reg name=\"%s\"", regs[i]);
             g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
             g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
         }
@@ -252,6 +252,8 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 
     g_string_append_printf(s, "</feature>");
 
+    cpu->dyn_csr_feature.name = "org.gnu.gdb.riscv.csr";
+    cpu->dyn_csr_feature.regs = regs;
     cpu->dyn_csr_feature.num_regs = CSR_TABLE_SIZE;
     cpu->dyn_csr_feature.xmlname = "riscv-csr.xml";
     cpu->dyn_csr_feature.xml = g_string_free(s, false);
@@ -268,10 +270,12 @@ static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
     RISCVCPU *cpu = RISCV_CPU(cs);
     GString *s = g_string_new(NULL);
     g_autoptr(GString) ts = g_string_new("");
+    const char **regs;
     int reg_width = cpu->cfg.vlen;
     int i;
 
     cpu->dyn_vreg_feature.num_regs = 32;
+    regs = g_new(const char *, cpu->dyn_vreg_feature.num_regs);
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
@@ -297,15 +301,18 @@ static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 
     /* Define vector registers */
     for (i = 0; i < cpu->dyn_vreg_feature.num_regs; i++) {
+        regs[i] = g_strdup_printf("v%d", i);
         g_string_append_printf(s,
-                               "<reg name=\"v%d\" bitsize=\"%d\""
+                               "<reg name=\"%s\" bitsize=\"%d\""
                                " regnum=\"%d\" group=\"vector\""
                                " type=\"riscv_vector\"/>",
-                               i, reg_width, base_reg++);
+                               regs[i], reg_width, base_reg++);
     }
 
     g_string_append_printf(s, "</feature>");
 
+    cpu->dyn_vreg_feature.name = "org.gnu.gdb.riscv.vector";
+    cpu->dyn_vreg_feature.regs = regs;
     cpu->dyn_vreg_feature.xmlname = "riscv-vector.xml";
     cpu->dyn_vreg_feature.xml = g_string_free(s, false);
     return &cpu->dyn_vreg_feature;
-- 
2.41.0
