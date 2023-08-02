Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206860ejb;
        Wed, 2 Aug 2023 01:49:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a5:b0:132:d09f:1716 with SMTP id o37-20020a056a2072a500b00132d09f1716mr15961441pzk.2.1690966149774;
        Wed, 02 Aug 2023 01:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966149; cv=none;
        d=google.com; s=arc-20160816;
        b=c5k+WVMqGDq3or1WNgn5Ck5n5+/cI6EPXS5rlgcaX6Co+VdFXx8GEUEXyYVsQeO2iw
         0fU/qccvLhO+UyeE8L2Mw69Y+dszMtMwxP2Mosz1VMlIqwvpNiwHBN6x2z9/GuuxrfeR
         ISpV0TH+M3eJkZM+IsGvgLYyCnz/H+qN9vLCkJhgyj6zgi8RiJ2M3M0wJqVurpvqrOhm
         0M72iHRpCZiHT7Dsf/mH4V43X37Z5QjyFmcvR4IA8dA0WhzC6mrzcjhIdiX6zEDokQfN
         LfGJMba/Af01vENIH2LsxKLOwNMFff348Y1+J7kMjZBgypkuYAwD65ff0F8bbihym2aU
         4VXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=lKh+mDF0MkNjrix+y5RDcRISEDLENPrxw/dp4ZaZ91j4U0b4/IS5vQBCFMlpVvcThL
         VbJVBKCaakwH2hIlvVj4tYJ8iKj3Zb10OkAy++38yi7QoUYl5DYbpU6WmWWVxoJGIsiz
         BCGaUcvsif+LMdAHjflNWwgqAkftK73fbxYbV34smpFJroERLUkb39bzUS8bQmkS6hwg
         qYUZAbmmgjUDtIiEqcJrEOkU9jTYjEk3r8aDJB88MgVMdq+PBe4rfjainsp6vOtwwBpU
         Ggkbq5NepnUMfQa3gQXMlHmx5dQS6KgCGQCYFYSGYoPws/ZFjy/5KWFH79Cu0Jg9qTKW
         b6pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=32iKauRL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bw10-20020a056a00408a00b00671393078a9sor357163pfb.3.2023.08.02.01.49.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:49:09 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=32iKauRL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966149; x=1691570949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
        b=32iKauRLm81dMdupNHGvMeT0jcPCTs2ygcH6qGMBFC/EttM1MJZitTxUaJtFLsCECS
         nDjDMQ9PhulSU3lH/qEOj+I7DcwiunIKOlu5ogkiUbJYpBRy5Vn1B8LIINuz5Wdt51+r
         N9f/c++u7xCtFn2Z8aOZASMRn1+LaEttNIb/CVT2lg3jSpmuKvYMDW6a55ILoh4JYXda
         tOxozn4pLEwGIk71uMj2x9YC3KuDsdOAOe92R5uwwMybzGZgQoz3BMIFzooYwPbTX+Qn
         0vAY8AazAOtizEqZsEfOlefKV8N+Ucs6taGYeOvY+Ue+A0R2oCo3/IOT4OHbAlso2A7u
         TUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966149; x=1691570949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
        b=c8O4Gyhw7Y8U/A4rY1590dznaencRUkwr9RT5r0nHxIs93LCQDUvAfsXwyeTeMbNc3
         SC6/XprSvPtpHErllRg6MKzANABjDFaaTcv7uTO3fcbYqPKYiMCh0U3z/Oa52MsWjGj2
         bO4KqOT4G6Hyg9pZRlzA7k5P+yN8mJ/EWq61HIbEgITrO/OBXs2fYNjOpBFImB75ctD9
         ZVZEwrwya1IubuGZvr6O6SDj/vAdYNV+bILpYxTAqFDLhqpEpLh0Fp3omNS5B2mKFSzQ
         6MU9h2p/d5+COUnHVSYv4NUvMPicUs8to3ugP0rUeGK8PKeeH001Fmt9OttiJQ2go0cQ
         ATHw==
X-Gm-Message-State: ABy/qLaztr4WzuSltoTTnAaV64kqX9NrnxDTfFaCYdtTk83MHucdRFlF
	1dx+zIyVg/6quNHB9nwRYzMH0A==
X-Google-Smtp-Source: APBJJlHOTYRm37ZBlokXGWWoGIFh/LaeDtcj+HzwoToZ0gPsZdSfjpIdmRQWrLaDADrsY5eJUpsINA==
X-Received: by 2002:a05:6a00:1f0f:b0:67a:72d5:3365 with SMTP id be15-20020a056a001f0f00b0067a72d53365mr16066677pfb.6.1690966149354;
        Wed, 02 Aug 2023 01:49:09 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:49:09 -0700 (PDT)
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
Subject: [PATCH v2 16/24] target/ppc: Fill new members of GDBFeature
Date: Wed,  2 Aug 2023 17:46:04 +0900
Message-ID: <20230802084614.23619-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GtL2oST4BBUM

These members will be used to help plugins to identify registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/ppc/gdbstub.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 19c4935260..ac4ed12371 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -323,7 +323,7 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
     GString *xml;
-    char *spr_name;
+    const char **regs;
     unsigned int num_regs = 0;
     int i;
 
@@ -350,6 +350,7 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
         return;
     }
 
+    regs = g_new(const char *, num_regs);
     xml = g_string_new("<?xml version=\"1.0\"?>");
     g_string_append(xml, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append(xml, "<feature name=\"org.qemu.power.spr\">");
@@ -361,9 +362,8 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
             continue;
         }
 
-        spr_name = g_ascii_strdown(spr->name, -1);
-        g_string_append_printf(xml, "<reg name=\"%s\"", spr_name);
-        g_free(spr_name);
+        regs[spr->gdb_id] = g_ascii_strdown(spr->name, -1);
+        g_string_append_printf(xml, "<reg name=\"%s\"", regs[spr->gdb_id]);
 
         g_string_append_printf(xml, " bitsize=\"%d\"", TARGET_LONG_BITS);
         g_string_append(xml, " group=\"spr\"/>");
@@ -371,6 +371,8 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
 
     g_string_append(xml, "</feature>");
 
+    pcc->gdb_spr.name = "org.qemu.power.spr";
+    pcc->gdb_spr.regs = regs;
     pcc->gdb_spr.num_regs = num_regs;
     pcc->gdb_spr.xmlname = "power-spr.xml";
     pcc->gdb_spr.xml = g_string_free(xml, false);
-- 
2.41.0
