Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1532288ejc;
        Fri, 13 Oct 2023 07:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVeOmbA+7pvEdkrJR80JFDpmAVaAVXdQ+6SB8RwrM8NWIRa/yoCFbwv6zKbOBrhlFSt7JW
X-Received: by 2002:a05:620a:45a5:b0:774:186f:4d82 with SMTP id bp37-20020a05620a45a500b00774186f4d82mr32555042qkb.50.1697205900513;
        Fri, 13 Oct 2023 07:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205900; cv=none;
        d=google.com; s=arc-20160816;
        b=r9lFkie5wgESHocFE03WdDZJW5KM/0VmauYzQy3/Gv42Eb6KtRd92eVa5tFaxIKfL0
         UXOzPxfIukfBqFkTiPR6MLquAz00j3r8Ca+uBKY59/PPTTgp24N9j6MfOrNLoHXr8hRa
         Nw50hjKufbR7K4cgQyEjtyzKgAwy6HWZrJBehNhljX2SDgjjD0LX184L2dFojosydbtP
         8jiLkKu80E7MzkOcUC3QA4nC231imJn/nRsxJ4PDWTnL3Q6wonHepRkr94wIRR8fl1R/
         UfWiFYjdp3X2YPI876VLLRkqKHDQv6THXOcqwP3soR9oYkvFi5oNQ1Qz6PokqXKabAsr
         fGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QrvfAY2mn68woULbVz677TRglvUf81ZbqsLucDKzz7I=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=V4F84HDhAbfN6fXgqIrpyr7V/Jinog4WhT9S8g06ieI+11wpujodBihhztrz0ixKjD
         e5xdEeSBVzNY/aEJCaWeRF5qd/6eYAZIxvkep0tIAX84VZsqnfFkyogT+ToyX3unBRiK
         MhmXDSRy1gOWzFBb9IjK5zADrIUGo4Md0+2Z4nG2S0eRvmZWPHCZlfDbg4YTPv9kxEFF
         4I4PDTqZL2V9jV1GUeWPQg0+xXws2k3psdLSdUFNmIqjKJlKhPvgbD9z/8kTYtXw/Ocs
         RqQHn8iSONvj7kRZf8ZnHZa7AiEf6tzVjM5Axhq7RDODL2m84M1SEOJ/5jSzSAfwb0ZN
         6Rcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BuR4CrcQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ef7-20020a05620a808700b00767b7c58ac4si1235027qkb.605.2023.10.13.07.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BuR4CrcQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrImD-0002pY-9K; Fri, 13 Oct 2023 10:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlS-0000ka-NN
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:03:43 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlL-0002dO-JM
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:03:42 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so354346966b.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205813; x=1697810613; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrvfAY2mn68woULbVz677TRglvUf81ZbqsLucDKzz7I=;
 b=BuR4CrcQgvTLeeaTMb8Bk3H5XdhPsgW98bz4La7ZOnNL3QvJersAfWaAy0I1UN+AXZ
 LXqF9y/SKBSrq5nkyRn81BiVFwp19C3XvwOx8T8wIfOa+FXb8wcfmq950jUuTqKb9tkm
 w49Fn6qLw/Xcly8Qklr83OCeG7SQZq26Ymkv16BN0B7dIzKxrCT2Yk6E/FCHhCsYewD1
 ktx6dYgzD/pdwTxruhG5Tx1qo1Rog2qa9+JNkoHSkBuLh4E1mDCPaJdlcAZe0oosaBgC
 8Cbz8ETlCMttoJ78NEwqhQP1O+M2DCyTDu3QWV2lT8sZOTmX5h9FFCZrY5koN3Dvfd4z
 E0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205813; x=1697810613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrvfAY2mn68woULbVz677TRglvUf81ZbqsLucDKzz7I=;
 b=R+1wfP9alDMQwJ83TQFL1bsY3elSq/dwmWZdIj5uAbMlhRO0R9DII0T2Z5q1Ku/bj7
 eQhI53UYoJ054fUKYb7CQ6bxdEtAmfTgP9ouAo2wfYhHHo9m+RcO/8hvhINvt+HOpMSK
 1jyzdt9GWbVrA4BRhYKw/Ak+CzTaqByguJIqBsxnYD/FzpnF8i2ubnubFp6HYU24JB1x
 P6wi9MfljXvy9In/o9TGnYPWC9rjAKTWt2yrIt++XfNt9TyMU7mFfnq28lrjwrob6vWo
 VwUa6bqroNkh+WRq2wZ739DK426hkxE60wCvEJHmgKCregvDxBT4HD7Z5Gm1eScTgx7Z
 ek4g==
X-Gm-Message-State: AOJu0YxhG2tKHvKi9/yf1Y0u0mDxv3qAGpr6I9GMRNlc3xnkFXl5ebUb
 HHRo9MrFtdBdvLuQVmQEx3Zlvg==
X-Received: by 2002:a17:906:23f2:b0:9b2:6db8:e0fa with SMTP id
 j18-20020a17090623f200b009b26db8e0famr22738729ejg.41.1697205813224; 
 Fri, 13 Oct 2023 07:03:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a170906b20800b009adce1c97ccsm12437059ejz.53.2023.10.13.07.03.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:32 -0700 (PDT)
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
Subject: [PATCH v2 14/16] target/mips: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Fri, 13 Oct 2023 16:01:13 +0200
Message-ID: <20231013140116.255-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
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
X-TUID: 7C3qU1JgELhU

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

