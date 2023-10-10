Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp164ejr;
        Tue, 10 Oct 2023 02:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5ixPX3BSTUrRotVi4x1IQT+Ns9LGqJniMdMgYea94DU5v+b2aTvZZ/Mf7/747OyZrsnn0
X-Received: by 2002:a05:622a:1a9a:b0:418:1165:e947 with SMTP id s26-20020a05622a1a9a00b004181165e947mr24277641qtc.49.1696930336447;
        Tue, 10 Oct 2023 02:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930336; cv=none;
        d=google.com; s=arc-20160816;
        b=Fs4en1Vr+absJ8lnwmzGiDyFK2UmBBx1XjRkJ+MXvCgvF4c8/B09oST/+0bU+pZLn7
         tLcNlZDQUCc/wV8iSvlnxeh0v7ZqL5ZdXGE2VZanAaWv+BdVjk9PPecQ1gL99SpaPlnl
         OCO/mLNdZBa/U5K94b00wXO8W0eTWNF8bw/YWaneIejm7Tqljnz3NjcY1dw1Mx0A8K68
         Pg34sxVncP062kPdH3Z25HxqDsLYieO/AjV021LkvaGkyym896T6Jg9WolaAFrFSoq6b
         w+wwctNMhtU/6ZDKxCvG6BzyMM/M41EyXbbhq87WBVbM3gYE1qz+y4wmTPFyQikwEvl6
         ybSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tGDIRmDFCC3SzHQp/xiOV97Tov37+momJ53r+jvT974=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=yG+JbfH74a9YF0W5yGFT70D8r46UaLPVWEwB4faG8nMz/79KTJcG++Bw9BU9p6zA7s
         qwv7QTrp1OPClBxMXE8gsnRGnJ+UgGTutjBmbyKxArXo0HC7auBVjK4hqBwdQkupEFf6
         9MAlfti4GpxdTos1BIgPS7sgl3fatAcIROAmXaDJcsApKmVNzqCe0DbWySSlzLRuOCy9
         N1Dmi/UcPgjo51X8okpTEg8hPU4l3BHcBQv/n2sY0lL1RDoHL3vXIPWlTQB6SBALZIYI
         RP6USyfKklJt+/OlW03s0bnK5Vg9oYzzO2aZ+QvVK/rnt9c+RmxIrgKCpV+/Pjz4neDE
         K32w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQd8MQoD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u29-20020a05622a199d00b0040e6d846b65si7080435qtc.238.2023.10.10.02.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQd8MQoD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq95J-0002jP-8x; Tue, 10 Oct 2023 05:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94r-0001FA-7B
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:30:57 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94f-0008DO-LA
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:30:49 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9b9ad5760b9so919266366b.3
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930244; x=1697535044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGDIRmDFCC3SzHQp/xiOV97Tov37+momJ53r+jvT974=;
 b=xQd8MQoDOWF0fREbiwL/c5Kj62Jpbr9o33zDUjg1Rb8/MefzGDvunMEM3S4RltVzWu
 iuUY4Y6AxeZqXTRoaMehNG2v3/4YsyaVtwRuy/gZfr0oM2OK5ENTJU3dYzNe1rZW68Iv
 FDSBMGicR8G0j+hq6zcp4+iaDETtdJG8yfs+6R3oFmO3qBIIsn/zGLsI0iwATbQ6P+7q
 PL4ddaEbpVafWkzVxm/6eXsfVzcUNX4UBWGI7S/tt/hDqLLPcDIFKQ6KsuuyAOuHbmCO
 e5sIC7sQQ8oeK3F4n2B7bzPkxnjrYX872fnW5u7479lvVjMgyK1jN3LaK+IMC9kwfHvq
 nbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930244; x=1697535044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tGDIRmDFCC3SzHQp/xiOV97Tov37+momJ53r+jvT974=;
 b=tkWfAJrfuxeRfBJYr+4jEdNdSC36LcbOrkUGeyI5UQKOiP2LpNSnW4wvANntFMsbHV
 YP2v7dtlOkWc7uc40gCrKyiH8/e12kgr1Xq4Dg/mm/YAQL0v/MMPikC20M8IR0gSs9OF
 5PD5atiHxd55oC01/SyovL1BaP+GGy3ICNlreRtRDfLHjC115W5MaaOSrXnXZRJYFxhx
 oQSgqP7b5v/BMVU0tU6kDZ/YFSWdHy4RUlDKm3MjcsL6ycZcSPez4eyczRgVnI8zKV9K
 GXncLWBHbD+4f3Q8SgXNtN8hRT8+V0UrBut1g2iO08JwwDrFYexa8ivFJYKnRpOwp6vr
 kQjA==
X-Gm-Message-State: AOJu0YzPfeDQkd4zDZz8QRJTqieAjuQ+sUrC/e71+UMjcCO8fdbriOMA
 zYju2H1/FCWlOeN+HCVWZE63/g==
X-Received: by 2002:a17:906:8a77:b0:9b3:308:d046 with SMTP id
 hy23-20020a1709068a7700b009b30308d046mr15417914ejc.61.1696930244444; 
 Tue, 10 Oct 2023 02:30:44 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 st12-20020a170907c08c00b009b9f87b34b6sm6753332ejc.189.2023.10.10.02.30.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:30:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 12/18] target/mips: Declare CPU QOM types using DEFINE_TYPES()
 macro
Date: Tue, 10 Oct 2023 11:28:54 +0200
Message-ID: <20231010092901.99189-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FCsOBF40CI6u

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index a0023edd43..83ee54f766 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -595,17 +595,21 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 #endif /* CONFIG_TCG */
 }
 
-static const TypeInfo mips_cpu_type_info = {
-    .name = TYPE_MIPS_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(MIPSCPU),
-    .instance_align = __alignof(MIPSCPU),
-    .instance_init = mips_cpu_initfn,
-    .abstract = true,
-    .class_size = sizeof(MIPSCPUClass),
-    .class_init = mips_cpu_class_init,
+static const TypeInfo mips_cpu_types[] = {
+    {
+        .name           = TYPE_MIPS_CPU,
+        .parent         = TYPE_CPU,
+        .instance_size  = sizeof(MIPSCPU),
+        .instance_align = __alignof(MIPSCPU),
+        .instance_init  = mips_cpu_initfn,
+        .abstract       = true,
+        .class_size     = sizeof(MIPSCPUClass),
+        .class_init     = mips_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(mips_cpu_types)
+
 static void mips_cpu_cpudef_class_init(ObjectClass *oc, void *data)
 {
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(oc);
@@ -630,7 +634,6 @@ static void mips_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&mips_cpu_type_info);
     for (i = 0; i < mips_defs_number; i++) {
         mips_register_cpudef_type(&mips_defs[i]);
     }
-- 
2.41.0

