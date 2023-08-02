Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206932ejb;
        Wed, 2 Aug 2023 01:49:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:b48:b0:687:2f80:86d5 with SMTP id p8-20020a056a000b4800b006872f8086d5mr11165923pfo.13.1690966159249;
        Wed, 02 Aug 2023 01:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966159; cv=none;
        d=google.com; s=arc-20160816;
        b=EqLelCrhsgJF1rJfwAZnECdXnZaY2iy3YDgXehjr/Ow8ozWcPW69TYmbTCnvCLwA6a
         E4CVvD0xJxYekhSFDsFzS8xPEwQfDV3G2L12KRH6cAPNBU4m1L0pMncnPGGaZmD2IBZz
         P8O8GO/UGCDj4AKXWkRP56tN7D2zIhmSe+zULKQNFlhqIhhlgwabXmuqT1tJUcxb6hMV
         jLOv8e1Haecr3+tb/+WmnxyFB3sqkrjsPQf9oX/Cf3plAqNPgiALpx8wDkjLBOG2mV83
         sIuqGugvOP4/JRD1dtjlJdB/m/mX91EVONIziiYd3MfMrGhQwoCGc3MSIEfCC5IwhaY6
         SbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i68gTXndm5g2JBfGSVbcpcLCWh9EafQ06rBdOr/hNg8=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=P4f4BCJKlB2ECL5KKgM/aFWJ4uxPzqMbhrr7hq0VNWXL0sBmMFo9n88XakVAdwisKI
         lUAGVW8YFuvu2l/lUGnKSass4WNArMXUeX+7Yglz5bjvfMEiJ8GjigczJORaJtZyAhhk
         FM3liXifKmi7jDcJ5NUtoTAr7CcICSG0VYIAgagvZavNbH1po7d9zpGOeY0txpgErsMA
         2FVHJv2vf2+ckjmsr208p8GmYm5RCfm3uUGuq8yOciX3HTQuKxnKcZaj0vSd2V0N01EP
         5Yl3jGB+d5hmnn2Z/Bcx9HToE4HSfhDF6hId3LsVSgY5NJKcTSIkEdDenYQtoERhtWhC
         2ZGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=zPbHPJIK;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g8-20020aa79dc8000000b00686c5dcde55sor5618512pfq.8.2023.08.02.01.49.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:49:19 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=zPbHPJIK;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966159; x=1691570959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i68gTXndm5g2JBfGSVbcpcLCWh9EafQ06rBdOr/hNg8=;
        b=zPbHPJIK6FiXB+zkQYrl1p4vc47YNlZwx4dsVHkLtpH8gEsibkyaoAcPHCP7E+T81T
         L3p3hXRqqnwTNsn2Pugvt7W/sFitJomOKLBDXYmmtHA/HiLTWRUO7efyYkY0+vOV9Swl
         l5emdPACZeKr4XDUOKY8Ez3rFXfKMMR7GMj+GgyFI1cWRk0u2qfBMlNbSE144AyGWYaY
         r8tS0Bmi0IopraG2dAQ0/jYX4fF+aWFo+vnbVkI665YKC/B9eZhuDFZ2IwpWN4PdpgdT
         V1EoHZcEvKsL/thbLXSUVr7N+8vvXvmuTGaLrFpKVQe5P01KiI0RnDlY8YE7hlI6L4qg
         r4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966159; x=1691570959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i68gTXndm5g2JBfGSVbcpcLCWh9EafQ06rBdOr/hNg8=;
        b=B6q/HUeWiGnyokG2MMY24Ah3QuxLuBgHYAj82hn/uYHcs7Wil1NzJ82Qwc2JAgY8ck
         bow7CeDX8rNbllV8r8B4ZFGOG93EUU5lAajg+N8XX0VCyqq+WMT5ghB9W4IFW959SY49
         cM3BJJ9I923QW5mmKXzS/iKWL27XFrAWuW69bi5gwE00hscRSUVrLrzTCgvSN7xQkPza
         q8ACw2o/lItuOB15M5LVAEXNmqu/BsnJ0b5BXaGURewTZYoqpfCCyf1ewOeC75Ndx2tM
         7HP7tAXHH2yddcNvspeVtK3Oxc/GgbHZFShBxxnjXY3txsjAJY6aF9dNsCKruNSPrnFR
         0khA==
X-Gm-Message-State: ABy/qLbJOYfW1WgbrZ5Wnug4JHiTGuRtxrIESaoXQ5QB72McyiYXMn5y
	hyNYTHPujXOiAjG80RPbzcwM1Q==
X-Google-Smtp-Source: APBJJlFs/0Lyyo2poP1hVg2sI/C2SNqfz80TTITgo28IlbyxFxJl+qWlt1UT3L35LNW+0usyWMJOJA==
X-Received: by 2002:a05:6a20:5526:b0:137:3803:33c with SMTP id ko38-20020a056a20552600b001373803033cmr13298373pzb.54.1690966158768;
        Wed, 02 Aug 2023 01:49:18 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:49:18 -0700 (PDT)
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
Subject: [PATCH v2 17/24] target/riscv: Fill new members of GDBFeature
Date: Wed,  2 Aug 2023 17:46:05 +0900
Message-ID: <20230802084614.23619-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gJ0dpwZtE/hf

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
