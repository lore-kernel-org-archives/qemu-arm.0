Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2026042ejb;
        Mon, 31 Jul 2023 01:46:40 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:767:81fc:c6b8 with SMTP id x11-20020a05620a258b00b0076781fcc6b8mr10593023qko.6.1690793200460;
        Mon, 31 Jul 2023 01:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793200; cv=none;
        d=google.com; s=arc-20160816;
        b=pvw3BGUROvHlqMYHMsU4sg1Bq8TmNBZJVsVL4ot1cdBp7ejjDrhy1pTeI9udvfp/Hu
         P0nY7beC6p7BjBZEQtQ4GB8SQ7C8qtlRNXQrCtSTZxtF2VTn47kEKXt8D1G+Bsonp9C1
         uxjZEX0bhx4SolJ/9tWGPjJG2vlO2SD++q0Sn2OZpBC9AiakygrgQNMdgtndn4l6GmSH
         Gi5kfMT/WkAimnzF+SihwOmDO4BqZFEfI3CVW7AILfpeNKzGo7lMZW9uO8as4fgyckJu
         DvqO0pbVasonBoOXkXXUGJMYSGgreight7WB1cH7LGJlejyy4qesPTnk0v+Dr8hbYXPa
         yYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=AxaQE3ZtqHJwSGTKzWq++vsXvVwgSroAqY1d3wm/fGaQAR1byLvqr6OEZpF9lxh0ga
         212ZX7Mq9Un7mFHiKZrpOArXg7gvpk4WGnJ42MghP8p1EmITURqQeznKM/kG3/hc1ZU8
         dkLNFl0fQGcia55XZnwlV+CLSSSJ7jGbqdpW31wrAcvXVa6hEVM03fZtEJFh6CjoGuR6
         kI3j69aabahRefuXedz3NzrIvSvCwz2osGAlWwoJTyw/SOe5jp04xPt4w0mR25VhkOMG
         Pp/iR/FQqGAzuUzex2lsEpqXbU62TEak9zcN7QA4jHrrTutrsVkullEJUZg9ad8g009j
         kTjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=0yconEKz;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4-20020a621804000000b00686deffa763sor3450156pfy.5.2023.07.31.01.46.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:46:40 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=0yconEKz;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793200; x=1691398000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
        b=0yconEKzvH6iMivH8TVS1PccUnN5hRxSWAfLCX0uRxT+jSYfIZrLGyRyMTsQ4B85WS
         iS/9TevFK1qxkLJav5HBR2cEW8s+yWBV0YaGKX6ByHkJKkzkqqg82Xe0iI3W2zrMBtia
         mwlJNTjQaR2uxyfwehuN4MfKMHqrSyfXNEEs28yqHXWM1s4Ba3hT7gwat66rShm6JyOK
         djpkupwmEmKVjwONvvs4OCZqB5bVsjJgXDGimRSJNBi2WMe2VIp9KNHrZKL7RErO1SUT
         zbsxZmX5VJ5/fjirEmGNUelThco4t5IOIfXuVymxwsoGPWoKSTdAh6h6YiUXZrJJ3buF
         +M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793200; x=1691398000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
        b=EhMJgaTlLyUS2oYWuESZeJlKyCuxmLTARZKKFmz0x31SSbqAQrT4byK781zpTEbD3i
         M9DRJXPPXoCkWJ9HwNzAlVmakqh8goPoaPtkM5Hf/wy1k1cU5ttWizEAFhzg9WYjSaHU
         Dte4apkHF5rZN1eUrlfhuOiSxuGz6lJsWk3MQtdPCM6RTIDjgB2gUTQ0LfgrrqM97TJP
         Ui0fJCGfDqhO8aNv0AR+R4rRcToD+Fv4vcrjE5K77kDdVlA8ZXg5+d+OZzJZ1NlRi9yJ
         bHV85gj+sfyKFSy0sNgkMG90OkxDVlE99y2HTzvsvy1KYjFeltTgzsETWTdTsKrnGEmt
         45kw==
X-Gm-Message-State: ABy/qLYZ2unZUa5lpbY38nsXYknQKWs19/0AXdQPaUEs/1cHELM3gMxy
	b9ihQuTAYdnR5SHNH1Jo2somBA==
X-Google-Smtp-Source: APBJJlGqgcWI52kGX5FDVyWHcYVegjUSKTSw98VXjn25LmP/9ZYyTct+mU1oS+j1/xeQwY1xDgZMFQ==
X-Received: by 2002:a05:6a00:1785:b0:679:bc89:e45 with SMTP id s5-20020a056a00178500b00679bc890e45mr10732242pfg.6.1690793199926;
        Mon, 31 Jul 2023 01:46:39 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:46:39 -0700 (PDT)
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
Subject: [RFC PATCH 16/24] target/ppc: Fill new members of GDBFeature
Date: Mon, 31 Jul 2023 17:43:43 +0900
Message-ID: <20230731084354.115015-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4SDerNlzRxuI

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
