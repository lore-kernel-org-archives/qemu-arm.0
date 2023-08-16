Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp364159ejs;
        Wed, 16 Aug 2023 06:40:57 -0700 (PDT)
X-Received: by 2002:a05:6808:1910:b0:3a7:b1de:bb70 with SMTP id bf16-20020a056808191000b003a7b1debb70mr3056705oib.6.1692193256873;
        Wed, 16 Aug 2023 06:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193256; cv=none;
        d=google.com; s=arc-20160816;
        b=NxEy7zPf7IwoGjHbtVLaw8+5tPOr5oECBsxqVEegElmA3xKwM7dwyRhHQQg35FEwDF
         UdOthbPnfYcZSOK/xHxrOFyFlOU8YFwzxODOg7vsaofA5F4WRVyz4a4Nay8AcblCiohE
         vyDCZlZsJB1u2MfnwSlqVtTqbLUChLjTi8qLoS2PkCfDtgpwHJjOrskPKyalMDYn5VmE
         uzGvmLeV6D+g/UnAsi7UOmliUg8QPfmIQVRFd1LH6zAJ+Nvj+pSdPRga6ruwaZMTvl9Z
         VPIBUchSF1Q4mqbXzAjEmsC6Lxv9v7jPZumUwLj4IRQ8e6HNJXBS6uiXq6OWZaWIzM2e
         y0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=f+z10a71/CyUatFh4NObFXdRc/HTCKZ37uq0htXQc7ge41fN80nwyU1CMhXO18zqX2
         TvSRjt/Dv/bA+mAABv/Mao6yrXdN+SoecsTbHisl6NymyfVpSnPQdcH+hjdqrguiKWYA
         1Tik0iDMI3JQemB8DoXaaQRTWPBUQ4uJRq6L9E3Jf/l6OH/8JZytY9ao0ho4RW1//4Fu
         XcmTtwRArmps2huq2YpJHyhl9fB4tIGTL+sh3HImPp/Wv5qsEKyJsdjcXm2Z+NCz5kWk
         0Hk3QY8KmfTiBsEr0bqvz0A3kvgQJhZgqdCd4HXO4rC4EfjwCsve2ZhBqtDeiyFwTGCx
         dMiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=KB+ZhSsG;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o7-20020a05680803c700b0039ee08b9e20sor8615874oie.8.2023.08.16.06.40.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:40:56 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=KB+ZhSsG;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193256; x=1692798056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        b=KB+ZhSsGWWNlUgmIiGVU0IV0uRlGbkE0kmuM4ahSNEAyMhCiiqtQF3EQPd1ytNNqgt
         1YbbUWh4AMCoAPRH/+3M1xUlzNZkdTIKph5hITkFWf7cs29YkoAl6T8Eqgu4qPmBLpsU
         1mT8L7hRfqPMtAT6usZMQGNnVJ//UJyFjB+AEPBssrQKUlqJ/ADHCBT6V55rafUNUFMW
         hLz2WgrbB+QDCCuBbXp8Shjog3Qui4Ed04new4IG+CpoflWWLtb8vTEWckf6zWsEDtNo
         cw/z6sk1enaKaFbGcHE0ZE+bTtaV16MtLS5G3HK52QBFEKUWJfnd4tO8vWYEA8pl44rj
         +L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193256; x=1692798056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        b=iuyaU5+Ygz39nKicwFdBicOBW5bZXjqohQbts5JcKbYizlki63o5zUoKvB8SZks/rD
         hvT/CiuB1y4DBO5JMtZRY3Mf71QMWCceHGvLRgktlkYTJEbR2Wum8OLwhwCfj6mJenkp
         RmEAeNtQv8Uu5to8PONppZURk0YPCUW72HqPknxdwvgPCzwYf8elkADrAQhg7F4I3lZ/
         OQDxaD61djd9c7Y/wmZsI1Hgpj8Vb2NAkgJt2XzGr2HuWLC1OOBd8V+btBoOhxPTzVPc
         laeq0pgoCr2OeyijCZ9rRA/2nvv/YBSGEt0yvECSy2BDBvMe2UXEX30DLX1fcHraKXG5
         SjuQ==
X-Gm-Message-State: AOJu0YxItveBtN1EdvdyhDJ1dQNWvdE5bXryeOfYFUDRuO7f+B5Tye/3
	q6IrlVKyO/P/Ico5IG3xqWlIwx4SmAGAXEdpGWY=
X-Google-Smtp-Source: AGHT+IFTUvui/nl/vsy6zAXPwCT3gqu/lH1t7o2otH3xEHC7Ko4K5o8auN7iMm8kKlAKxvkKSQvHpg==
X-Received: by 2002:a05:6808:3c2:b0:3a7:6213:6898 with SMTP id o2-20020a05680803c200b003a762136898mr2007034oie.12.1692193256475;
        Wed, 16 Aug 2023 06:40:56 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:40:56 -0700 (PDT)
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
Subject: [PATCH v3 05/25] target/arm: Move the reference to arm-core.xml
Date: Wed, 16 Aug 2023 22:39:15 +0900
Message-ID: <20230816133938.18310-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2sdQQgZ40Dfn

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
