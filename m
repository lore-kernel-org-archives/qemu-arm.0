Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1532235ejc;
        Fri, 13 Oct 2023 07:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH10PHvrGI8XQiJJgZYhXQTJeMTxP3Rh+1k0L8Q2KZy8402hQ0GnPxP5FudWZEgvYAIy//+
X-Received: by 2002:a05:620a:bca:b0:76c:ba61:f8b with SMTP id s10-20020a05620a0bca00b0076cba610f8bmr31548859qki.23.1697205896280;
        Fri, 13 Oct 2023 07:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205896; cv=none;
        d=google.com; s=arc-20160816;
        b=FHz2kkpRpuehjT/4h4KAdBxarKb+1Xo41jJmb3YOkCxf//9Y1/3DiciI8xKxO1yMo4
         XoHEeCJ/FCG6WdB8LSfFrfUHgFvyHN7lkrXoeQcxDVbVOHm/Q3bs87XciGZE6m9NpjaT
         ADpX7Buy33NKQ03Vz+IYep239QNpK2t0X0aXo5O6rt7gf0GNy3Vbjqi8iCJt10mDA8jp
         3HgJgXEzs1+7Mqy8Z21TFkZCm/kx2kNeZy2UTdwrfXSLRG1Sc3q99K4POc3Ab51gqjTs
         6Ya2VG8uqSKwqpqEUtcam002osNvuy/eevnE+E8w/8eI39OZIBJQSvh4yLp3mqYy7S+D
         16Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W4alAtOXM/H/5FX7cyO/SwuIUYprCQ9PCZpIdYP2vGY=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=aTmiWq/3hwVRVVluESWxlwsqtw07B39rK/7NFnsjAWi3thp23SPu/CQSmUHaqcpVyJ
         Vdo2k7cdu/uz7NpaYgmk/ffQXsYFoV3n7/U39iWvONL4wcSelEKxMOge1UEloe73eubO
         jM2BvrYQMWCVtHO35s4brd2w1+CVbQkw4dZR/OxkoQjf88VBIUnEctWABXrudMglweHv
         PIhY1qJUM+YZonIIXnqEwxkkcb2PEwl41Ki4gBYNkGINeaEBd1r8QjAdNJbIcrE6O7wP
         euoskC3+HTkFfssXFun34uDzbbj70fnuESFxE9hE+1eOTkWz+9FcZNNpyaX8sjtRJ9Mp
         46kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P0K0EOKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a05620a410400b0076d88513635si1295028qko.115.2023.10.13.07.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P0K0EOKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrImV-0004kg-1n; Fri, 13 Oct 2023 10:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIli-0000xg-H9
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:04:00 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIle-0002gP-KR
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:03:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so3802262a12.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 07:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205831; x=1697810631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4alAtOXM/H/5FX7cyO/SwuIUYprCQ9PCZpIdYP2vGY=;
 b=P0K0EOKBNNDBU7BITx4q5wgLWKMrIAEvxAY6zGwhsaQ/jB017LuJd1wxmWrbnoqh9U
 fXGvyu8CsFRE+0S3pZzBQl1YhvrqMAXZGFGSa6+o3y505AUBBHIouO8Pi62qQd4USFJn
 gYb4wMwd0Bu1dSdUrSQdC/GpJY6rO2XMcMz1jEAuealT4EDKUkMCXR305D0SZckqav6I
 X14Mlzqkl5a3Pbao9jh9Xi/93OD5fhXrM3Ax+ru2DqTmQ9UKLqCR/cJs+ZzgWhA4Q3yw
 xAtIo3eKFPzYKi6Ck6Aln0X+NetA7bLk0wKP295wZzpLDQWF9NaLVO3Z2qPVaPPfxDXx
 JJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205831; x=1697810631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4alAtOXM/H/5FX7cyO/SwuIUYprCQ9PCZpIdYP2vGY=;
 b=vJxMfaWs8eNtHaF6ZJ0v0/JtVF22WQ0LfXfpCb8dVXls8ITxfIceVso7jcijjrdM8X
 i/BNbd7Exq/pwmHXiiEMwDcviopdKlWHa9FHmdhQv72x6prsrQ6maI4en5Qmk5VONCJm
 bcUsG6wMTqK9J3h91Xh9DrFwzLEEsXwD5Wdx2RmvCgonsGgBjkToLW3qwYV8WEfqFiGv
 7m84znx5eb73qbv+EBqw9+RhQUOZmWRhitnrDoPJwrnkQTddGch0jAZR/ire2WCesHmk
 zvDMnJWs04aom99muW7LR01BwC91cc68kXeYG7R9NZdmF++ZYUl8PZTzQrIOqy4REDKZ
 boDA==
X-Gm-Message-State: AOJu0YwtZfz4/hZUldZrUrxkXu/B38LYbZZRKCc68DEBTo4uJ43JpJc8
 rv6EHDlV4Cl2Q61Ny3zhWGJRFA==
X-Received: by 2002:a17:906:30cc:b0:9a1:c447:3c62 with SMTP id
 b12-20020a17090630cc00b009a1c4473c62mr23478118ejb.49.1697205831758; 
 Fri, 13 Oct 2023 07:03:51 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 gq7-20020a170906e24700b00993664a9987sm12476932ejb.103.2023.10.13.07.03.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 16/16] target/sparc: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Fri, 13 Oct 2023 16:01:15 +0200
Message-ID: <20231013140116.255-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 81+S+xVc5NX2

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 8ba96ae225..1e66413e94 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -924,17 +924,21 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops = &sparc_tcg_ops;
 }
 
-static const TypeInfo sparc_cpu_type_info = {
-    .name = TYPE_SPARC_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(SPARCCPU),
-    .instance_align = __alignof(SPARCCPU),
-    .instance_init = sparc_cpu_initfn,
-    .abstract = true,
-    .class_size = sizeof(SPARCCPUClass),
-    .class_init = sparc_cpu_class_init,
+static const TypeInfo sparc_cpu_types[] = {
+    {
+        .name           = TYPE_SPARC_CPU,
+        .parent         = TYPE_CPU,
+        .instance_size  = sizeof(SPARCCPU),
+        .instance_align = __alignof(SPARCCPU),
+        .instance_init  = sparc_cpu_initfn,
+        .abstract       = true,
+        .class_size     = sizeof(SPARCCPUClass),
+        .class_init     = sparc_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(sparc_cpu_types)
+
 static void sparc_cpu_cpudef_class_init(ObjectClass *oc, void *data)
 {
     SPARCCPUClass *scc = SPARC_CPU_CLASS(oc);
@@ -959,7 +963,6 @@ static void sparc_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&sparc_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(sparc_defs); i++) {
         sparc_register_cpudef_type(&sparc_defs[i]);
     }
-- 
2.41.0

