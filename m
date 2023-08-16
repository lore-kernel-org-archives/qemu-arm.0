Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp413056ejs;
        Wed, 16 Aug 2023 07:53:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:148e:b0:687:189c:4e3d with SMTP id v14-20020a056a00148e00b00687189c4e3dmr2532238pfu.10.1692197584483;
        Wed, 16 Aug 2023 07:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197584; cv=none;
        d=google.com; s=arc-20160816;
        b=axpMZjPHjm9h2vOZDLgjXgEtGzIB/YRVEuy4RYohAS8/cHVkP5yTjNN4YpH4Eddqub
         0tyn8EYxGhc3eAZ8XDpLBYn/ErlZt6TZR161bg/ULfRuEvWjz6fPcV1+riW4EEGROfzK
         s+ycB9IUtrBGht0X12QVXiKCJ1TYsypkhR8MwYGFvccunAz7zxubnf2wCebUsP3dxnjm
         5JTow2YwBYkOtuFurl+ojskGrnxmdCcZfSn8zc93vS/acUqaRoDRUr3YRxq3mC8jOb49
         f6vKZsqJJApYIO5fkft/rP7X5MRiNSLtfnn6ysxkrMrQ0fulcuSlBLPD5OtC28qUNzYE
         chHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=UO8WNG4dD80uajwSxNmbOpahg6K/DatKoUIuaMtvB1UV0b9PNFlenKSWaRNIpnF/jw
         1cZA326gRgGVCXqimxjVnayR5fCkLCbfWe8wRoJ8AINrG7vL61a5+fm2JMW68UVHNw4g
         c1/DX4CLbzG/Ve/kP8orgzNFVCnQeu45Oa5O599RLMQ/9M9j+h3PrJmU3VRnuXfwJAfM
         zXqrj9+7HIhjZ0YuLQEQcxrHC5qTIIbs5Jl4eAQMJwsS++ZCvbZgW65d7vIWYuE5ITtI
         WM6fpJq2cpQw58YLijr+4ceD+UziQnDaz7JeDCB8tvN1BBCMZFi4kTj63/rGvxK00Hxp
         w+lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=xCImB5v5;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x23-20020aa79ad7000000b00687b5378393sor6848836pfp.8.2023.08.16.07.53.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:53:04 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=xCImB5v5;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197584; x=1692802384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        b=xCImB5v5maAEizBxYrL++QyPLtpfkKhGwmGWVebpN15hlVtBjPauFwhD5ixf0KBwMk
         sIKtdNEvH2wQOesAAQsf5FA98L5Cmi2AghDnnPAoOuxLtMM7ibKpgdHsFNIM00eg4/eV
         M1Tng7gTNhUmHYwJX70f3otQYGkNNwuQuq7syuxlkaO6YrFSDji2yMTCxo0WVlQtAL2o
         v1Z0Jr1xQBYUXURz0ACmoVGysez/cKx5aJbnABv+4zFDs9kHTRrdfTZCOMm0E5S39pdT
         e5tMSJaK1udB5tB7QP3qYBYwR2hwFor9AeW0hebaEERIXsqlDoOJsUKL8JA9ty0t2Na1
         0Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197584; x=1692802384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        b=LnwKVL0lucuD9hmdNeJsUtrFyFEOloWkPEe8LfAhHnFTXatjArqKH0urXPfKBw3hlp
         7mbMAIF9JUZyGjSMca5tEeLyxp1u1XdB3q7yCnU6gjKuHQxqjWDsSRpplZM7KfEaxuvv
         +iVORIGfWdeUjKlcOJjonZ9I0ylDk2//R7zCRb9qIzBH25YHitLNrvf7y82pQlfRQyIn
         c0aLXCfJXQKNZUMIqozDtV9k/bx1ZbYpmFALWQo81pBNHewX81pL4tuFBSYJByQEXVeM
         9qOwEjAyd50KvjoMyDv5VXsJGoMLLpVGinpWsYROVcxxekV2k4QtZqRy6I2BKQI6TnJJ
         HiDA==
X-Gm-Message-State: AOJu0YzJqk00aF4Qq3ILGDPRjznUUMP6dwwgexOr2sztbTcKRrKKnYG4
	jLiA0h089q3cLz4jVmN2HcUetw==
X-Google-Smtp-Source: AGHT+IF136Ut7u8F19vMuGhsXspxaXkVuzAyk+qpMrK6l25QgUWT+DrFPsCrMtLv5a3md/bGqcreAw==
X-Received: by 2002:a05:6a00:1587:b0:687:1c2c:7cf7 with SMTP id u7-20020a056a00158700b006871c2c7cf7mr2738945pfk.19.1692197583989;
        Wed, 16 Aug 2023 07:53:03 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:53:03 -0700 (PDT)
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
Subject: [PATCH v4 05/25] target/arm: Move the reference to arm-core.xml
Date: Wed, 16 Aug 2023 23:51:26 +0900
Message-ID: <20230816145155.21049-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /zqoaYWEEWI1

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
