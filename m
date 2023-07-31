Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025334ejb;
        Mon, 31 Jul 2023 01:45:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:2192:b0:664:aff0:240 with SMTP id h18-20020a056a00219200b00664aff00240mr10086897pfi.33.1690793099752;
        Mon, 31 Jul 2023 01:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793099; cv=none;
        d=google.com; s=arc-20160816;
        b=zYi6jijctmXKym59pIWQl5jOLggMIaln++rFytnQNSuoSb6jVoiFHCZWg/d88x6GeA
         vgZFoX50ZqSLO13mYJBGsZ21HKTgBkOnyEaR4ACU+C8lg6O17HgpQF4HAK5WmlcEdURi
         VReZAFdD6pRh/Nqw1mzb0etzx0LkwpB7numy6uFLMShmBvqgvoqXuA73Gq72iGnOoMmS
         2HpjuAOo/cVA0ZW/wkj70ayly9rivRQZX56Hky/pQT3hTylFZ1ZGGqYSAcjGBYPBcyhd
         +V8OSfoOqXZs+EHHRJ8Ckx94ZDUnT3+dXiDwc0dNk4HoATSB5CbYuPd7Jtg/gIepx9Di
         4iRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=0BFKVlUt042uqRePrhdZHBRI9Pq2EUABmGxOrx5DhNfN0xX2KmOHXYP423mAV5U7sK
         eUyB1chkAKUORDTwCMMTBiffSWCM4hJn5M3FMT22FKn66lXmjnDjoiKTOt/9/e6GhnUx
         K8r3vTnd7cR/TvUviaoNuZyGQBwVH5e4MmbClP8as2RJ9IiL6/Hw16jqnB3mXdtwS/+N
         4HMxYkm0gLl72ntx3e5aYvnFiTcXXJsEl814W5iaG1hXrFVE3aos3jIfl7h0r0XAwdLI
         Zv0fJj+6H7AWCgNkeDVvCiqiXZWGr19iNXLipB9RdJ7OvtaPIYUW5vqSuhHbJWANweG4
         8rBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=gxR7Ttu2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e14-20020a63370e000000b00563d74a9c4fsor2552234pga.8.2023.07.31.01.44.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:44:59 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=gxR7Ttu2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793099; x=1691397899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        b=gxR7Ttu22Iqb0VqXs37tl4tlLHU25qnpcDDxZGAU0myX3WhqdjAcSODi5D4BdWEhV9
         q1NP4eldp7rRXuISIhAsTOT6j1nGAfjVhOD4AY1Tlpdntu8fnRFYCtgG6BsJcFAWhxBK
         pmNHmwAWY5/E92jOZDblL4SfwgT7aXg0wZHHRbk++R/6DXHmf0ksi0JnGV5sytXymYDW
         CskQXrlTqv3otcEo8jUkqHRFMmklqB9kQg2XIJ/PWSEoBF9GTOlOW+9dhj+4+78AwEPw
         w2sy3Vl0rUey4jzPlgGoATQ5USR23UgjFv4dPsdW8Sni7qOzDftnl6fPVYqDoVm5R3u2
         /8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793099; x=1691397899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        b=glbQU0pU2jrjUvTE9vcV1gyQYXmDRxwDJLrGU9ELVH0aW0sZu9atfWpuvQkiqMeS+U
         0oTLmjdXpwmhs7au3/GDCERY8oVe2APn0RpPiPafFXewXU+RHr59Web0yTA+elfhZwa9
         rxlOZrQrkXnW22MqXKMgLlFeCWTh2tnNbbYYTUkc72ZPPuhCr4xOfNMP+p0UgoUtzcPP
         oj/ba058g1WQui4OEAS+s3zXui1CqNp0XfmBdgEzFIvEPC93l9geNVEJtcU14YbNKUre
         a0bDaX6wfQHdrCdkYoIZr0RsMZ+q7xKr1VtmR2y7zbSbVreS/uFKXic5n+5kCorkLQ2U
         MHcA==
X-Gm-Message-State: ABy/qLYnpNK3nQTkkSJa6nYeqVJ0vxqh2GrcwCfT8E3nhG5kBP1SptXs
	x/rgNi5ysz/z0IAOTuKkJ4mg6g==
X-Google-Smtp-Source: APBJJlHb4am5urBinc9EACtCaDLw8vzdkChKaTSTz/oic5Zk1jghpHuUG0giPtiisUhV6YED/Nk53Q==
X-Received: by 2002:a05:6a20:552a:b0:13d:ee19:7717 with SMTP id ko42-20020a056a20552a00b0013dee197717mr1032425pzb.19.1690793099313;
        Mon, 31 Jul 2023 01:44:59 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:44:58 -0700 (PDT)
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
Subject: [RFC PATCH 05/24] target/arm: Move the reference to arm-core.xml
Date: Mon, 31 Jul 2023 17:43:32 +0900
Message-ID: <20230731084354.115015-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KQJirv42Sfeb

Some subclasses overwrite gdb_core_xml_file member but others don't.
Always initialize the member in the subclasses for consistency.

This especially helps for AArch64; in a following change, the file
specified by gdb_core_xml_file is always looked up even if it's going to
be overwritten later. Looking up arm-core.xml results in an error as
it will not be embedded in the AArch64 build.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 93c28d50e5..d71a162070 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2354,7 +2354,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2376,8 +2375,10 @@ static void arm_cpu_instance_init(Object *obj)
 static void cpu_register_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    CPUClass *cc = CPU_CLASS(acc);
 
     acc->info = data;
+    cc->gdb_core_xml_file = "arm-core.xml";
 }
 
 void arm_cpu_register(const ARMCPUInfo *info)
-- 
2.41.0
