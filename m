Received: by 2002:a17:906:fa85:b0:9b6:5cec:e61e with SMTP id lt5csp14123ejb;
        Tue, 10 Oct 2023 02:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdiWBfIRuK2lTb168TEg8MPyWix4W+PmAef+XBFSMYLW+pgO6Eg4y6xPO7oVgo7JsTwJQ7
X-Received: by 2002:ac8:7e90:0:b0:3f8:71aa:f11d with SMTP id w16-20020ac87e90000000b003f871aaf11dmr22594958qtj.37.1696930304728;
        Tue, 10 Oct 2023 02:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930304; cv=none;
        d=google.com; s=arc-20160816;
        b=L4zWOZrP/JUrnTr8zZbYfW9Q5beavavx7v7/sxwC1XOkqGNBPFztFWRk9kUZtb87Pw
         Ja7HkfXiaMINOAMP8RilUR8xeUehILjj7DHXsPUDE6ge3z4d02W2pijEvQbJ+pf9C5FM
         pwb3EXunCusEH4Xw6ikT48GRofJsDSUPmjgsqoY9HH9vmRqO0E1Ea/xsUKYCg+ZSqjpY
         wcasEC0YQh+jUguHeJXJE5enTMUYByO3WXuxH59rS2xcdXsdBTCfQHu6GE+6c5rbAA0P
         wtOUnL9IwZ7rDJIP87+ZTe3Z1oNE4uFUR0y5HmZmhrMAJoQHLnsamkayx13OHTrmsrqA
         4PCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1MyuGXLiWN8UopdjDzgIKzA4UsMWUE83156ltUpzRtA=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=fiTpIpB52WH9jGizxudC3h9UJO2FrKnAdey8SIIZnI8f8kvmz9Hgprjo+pM9Hwm6SV
         CVdSaJKCJh3/2kvFNShgPni6KL+/XxM0oKwi9brRP1YNvCtezyCkOaYscWouhEUfE82d
         r3296uqwvbP7xbwcqvxaARlRQQ4us5QAFG8Y418LZILCHxJ1dDKa4GsaOS6mrrPm4TsT
         pzXCI9YUYpAssg0lQg/ACuBAJoeXq0UrGrUvf6AtYEoKB4upW6tKkMuvSUnmKGyeT8SH
         CqZQfmxF8E73KAKawGUpDpJRHWwAzKhgg8KRaEiS7PDyrP0wk099rFwywI5jDc19jkhx
         EjQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BT9Xud44;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020ac85d8f000000b004199186909bsi7382237qtx.722.2023.10.10.02.31.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:31:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BT9Xud44;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qq95B-0001bc-Mx; Tue, 10 Oct 2023 05:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94a-0000x0-Ku
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 05:30:47 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94X-0008CR-CA
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 05:30:40 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5334f9a56f6so9335017a12.3
 for <qemu-devel@nongnu.org>; Tue, 10 Oct 2023 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930235; x=1697535035; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1MyuGXLiWN8UopdjDzgIKzA4UsMWUE83156ltUpzRtA=;
 b=BT9Xud44n8xIvrKVzwCBoSajeXijG9k6H21tmRLG3wVEXR7x4TJHauLK6ZnbDDHcqy
 7joRHEjC3Oov6c0B7ZsDzX6LearpywX7smEVpgjS8W2/BxIWvxSoXC4Kyh3hAJPHK7D8
 krfXPW0KEy9nm8/Ct4aOdJ2ylXZFbNk1slP7xuIc7mu8YmYMxTRGrZjbq6eqNBFToJz/
 ckJC7oEbNG2nXQDJJbXa25DFmK0aLwIs2zXvg1NGWTkKbURNPFWxPgTDrb+/kMzkDbbb
 y7Vqt+SDo4h562E8zjw7QgZymj9SG4VJjZRCj6CUJfTgSJnaz5Bx1qtQXo91PjAvM1S9
 8MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930235; x=1697535035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1MyuGXLiWN8UopdjDzgIKzA4UsMWUE83156ltUpzRtA=;
 b=Hb4HQI2hhS3t/d0DUdvjLxjbQofmuGLh+PQR6rXRSQSVORQM5XyRNSdJh0kbYkaFL2
 AGktz223Xna5paENIL/Lwu+E54wTKVxV6GQJ7LkENfeW24Nv2KxkzaS51PVLEkmUR4wC
 YCV5rph/0Edb9BbzVx8T22pxYBgqWE/kHUpoRN+XnPPNT33KDFyhUXI3e46C8ZqC2wUS
 JcSuljEjW9TDA5EwU2DqE7KP40XXT9HPFG5I/49zPnVxgX1u3/rZDV3YF4McmeWbYRWc
 q9/6OYUx0kpRFCr5ELH6AcjYDNgjl7ITUWYbrmwUl3BV4HIs/NtZVEz7/MJO4xZ4FxDW
 8kDg==
X-Gm-Message-State: AOJu0Yy3hIlIw/Z/7yHJxkuT89F0jy6YxLllc4HDOxgJH47LH37ovvpm
 stlEEl7FnuuaVqu8XQpkEzSvb/d8SSWLYr3zWiuqjw==
X-Received: by 2002:a17:906:301a:b0:9a5:b814:8254 with SMTP id
 26-20020a170906301a00b009a5b8148254mr15639258ejz.24.1696930235700; 
 Tue, 10 Oct 2023 02:30:35 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 u2-20020a17090617c200b009ad8084e08asm8033134eje.0.2023.10.10.02.30.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:30:35 -0700 (PDT)
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
Subject: [PATCH 11/18] target/i386: Declare CPU QOM types using DEFINE_TYPES()
 macro
Date: Tue, 10 Oct 2023 11:28:53 +0200
Message-ID: <20231010092901.99189-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pw3ed2Td/pkY

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.c | 50 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9fad31b8db..8f1fd5f304 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4989,13 +4989,6 @@ static void max_x86_cpu_initfn(Object *obj)
                             &error_abort);
 }
 
-static const TypeInfo max_x86_cpu_type_info = {
-    .name = X86_CPU_TYPE_NAME("max"),
-    .parent = TYPE_X86_CPU,
-    .instance_init = max_x86_cpu_initfn,
-    .class_init = max_x86_cpu_class_init,
-};
-
 static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
 {
     assert(f->type == CPUID_FEATURE_WORD || f->type == MSR_FEATURE_WORD);
@@ -8017,19 +8010,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     }
 }
 
-static const TypeInfo x86_cpu_type_info = {
-    .name = TYPE_X86_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(X86CPU),
-    .instance_align = __alignof(X86CPU),
-    .instance_init = x86_cpu_initfn,
-    .instance_post_init = x86_cpu_post_initfn,
-
-    .abstract = true,
-    .class_size = sizeof(X86CPUClass),
-    .class_init = x86_cpu_common_class_init,
-};
-
 /* "base" CPU model, used by query-cpu-model-expansion */
 static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
 {
@@ -8041,22 +8021,38 @@ static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
     xcc->ordering = 8;
 }
 
-static const TypeInfo x86_base_cpu_type_info = {
-        .name = X86_CPU_TYPE_NAME("base"),
-        .parent = TYPE_X86_CPU,
-        .class_init = x86_cpu_base_class_init,
+static const TypeInfo x86_cpu_types[] = {
+    {
+        .name           = TYPE_X86_CPU,
+        .parent         = TYPE_CPU,
+        .abstract       = true,
+        .instance_size  = sizeof(X86CPU),
+        .instance_align = __alignof(X86CPU),
+        .instance_init  = x86_cpu_initfn,
+        .instance_post_init = x86_cpu_post_initfn,
+        .class_size     = sizeof(X86CPUClass),
+        .class_init     = x86_cpu_common_class_init,
+    }, {
+        .name           = X86_CPU_TYPE_NAME("base"),
+        .parent         = TYPE_X86_CPU,
+        .class_init     = x86_cpu_base_class_init,
+    }, {
+        .name           = X86_CPU_TYPE_NAME("max"),
+        .parent         = TYPE_X86_CPU,
+        .instance_init  = max_x86_cpu_initfn,
+        .class_init     = max_x86_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(x86_cpu_types)
+
 static void x86_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&x86_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
         x86_register_cpudef_types(&builtin_x86_defs[i]);
     }
-    type_register_static(&max_x86_cpu_type_info);
-    type_register_static(&x86_base_cpu_type_info);
 }
 
 type_init(x86_cpu_register_types)
-- 
2.41.0

