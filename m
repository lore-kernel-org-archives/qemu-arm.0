Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206160ejb;
        Wed, 2 Aug 2023 01:47:25 -0700 (PDT)
X-Received: by 2002:a05:6808:901:b0:3a7:5b1d:9470 with SMTP id w1-20020a056808090100b003a75b1d9470mr843649oih.53.1690966045392;
        Wed, 02 Aug 2023 01:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966045; cv=none;
        d=google.com; s=arc-20160816;
        b=LJwomMasCDDf4FOVBIerlDKu7rkOG5GL4bTepmm/tFWDD3TeQNUyN9UT3uAuidhkkF
         jQHMDy+x/E6kEndaO1+5f032+6SIbfQ5Xv7oCkLufcy9IyCKqMELwJuMftu6Dapo1emq
         IKb9yL/ndQ/9NB5CQ/1SkcgJ3SI4Aw2ptZop48OoGj57Q8cukXQjB+oEHYD27gYTDafH
         oxLHhBSbUEQhH+j1UhWGy8FwSGBgGWCmzn91IGZBISvXT+Rv6XTxMleL6wi3+QUyy5SS
         5pn+Z2G8FBl4DSW6uUfc8wdvSElz7kG+RACnN5y26ui0csG6v5rAenjHik0ued4GNdRg
         FHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=kw0VnDs7k4lMmG0MokuKH87xFCkx/sgc8HTv00zlbNA9C5uuJKCq+NA60Ai+Rs5Q3F
         OCMuaJGJdehQcpOTwvQuOf5grF0CqAvNXjrUzVB1r7Vkjn+FLPGPwJHeK7Ol4H/IU3Jk
         +hgWgOMsJ6/4yHkoKlJpav/cGmRdUm+kNRXGrUuN1qvXNwOH59ROglodSPuC08XB+c9M
         TPW8G1Zc3F6DTRaeH/stbXbHrzb57aWsI099QH5uQms6XUdvr2L8zXf/Ob5SfwWZv7IF
         eMSbrjdcaBaNV929wFfQRve92YZmGMyaURqLqYc0wyupXgMJUQ8AxcYqGnmXMKdn4Uvb
         wunQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="FMdOtL/t";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 65-20020a621744000000b006410a66b32dsor27895pfx.2.2023.08.02.01.47.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:47:25 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="FMdOtL/t";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966045; x=1691570845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        b=FMdOtL/tD7myXj/IdXUWwv0OhCLMI76GrQgmfKiVNmlzOagEusQ18knV0LFpznwcXC
         DyzZFhhDmlo/cxyYG0CVFRJi+IEbg5FlaFj730D+neuNjDSl9hY0CbQTrQKuAao857DQ
         uh1fNvG2wijrfjxMjFMmu8Ogq5VtZzrLzMl9B5hiRqst5aB9iPuQm8WDveR9UwwQNPbf
         CGksAi83FeUTBJG3DG2kJ4PNKVrqsDIKvJn5QIXEjzuG7UcnOZ4J7dbMb0pBR/ply01i
         q1qG0KOEG8bxi+0tybLTkqjvOAL/yctjfcX5aYjfxpAmwZ70Qrj17bwL+u8q2n/0tFNo
         /5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966045; x=1691570845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8QC8ufyB7xcDBCvHI4qa5+GakxSnSbOuWxZo6h21Sw=;
        b=EaOjwSSaAR3q23rqItUB8CTSDClMRS2ZBu8EHXMwiRiWNRzYlXk8nRRopSQmvlxSVo
         pafihOGsBThlHB870izADnaTEbJlrpCkFN03wA7pkT5C74KDjLikDjbfQQI/C1PMB83t
         EWP3CpZfvUkfbOFNXfk2Vv7iLUuqU+C7HMJI64ElxuS7VsT3BT59k6XhvnNYsdMvnni7
         df/ReiMK3VL84/mFUgHQ8VCaTuT9/IuHnjfyDOuR2I0ixT3Alw3b/EbAVez9/pgReFi3
         UBnCF8vYmvBCfhZsM/d7dtaWGQI1bYTEdcXstV21SIQsMLQ9t5LwTzM13VAlNgzWTBGa
         QeTg==
X-Gm-Message-State: ABy/qLaOWWw8c1AuAPII0AgVE4ZEz3FHoMZzpIK58+URGx3ZPqa2L9tl
	SO0FBVLgwpuJXswKR7WA88BKfA==
X-Google-Smtp-Source: APBJJlEnnRto9xXYMTw1Q9C6BrUErHR1qtyByJ2JLC0h5olSPzr/TyKXwrhsJo9ViZgu/OvWOjAe9g==
X-Received: by 2002:a05:6a00:1947:b0:680:6d16:8f8c with SMTP id s7-20020a056a00194700b006806d168f8cmr14888398pfk.32.1690966044899;
        Wed, 02 Aug 2023 01:47:24 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:47:24 -0700 (PDT)
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
Subject: [PATCH v2 05/24] target/arm: Move the reference to arm-core.xml
Date: Wed,  2 Aug 2023 17:45:53 +0900
Message-ID: <20230802084614.23619-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OJaV93bBr20Z

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
