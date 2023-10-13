Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1532892ejc;
        Fri, 13 Oct 2023 07:05:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPGTjRvfNYrt9FrXBTliqC1ehFvs37LYhrDOqk8Z47d/KAIVsqZxHsP37Ja8TJxFMEJscl
X-Received: by 2002:a05:6214:5ece:b0:65c:fec4:30a1 with SMTP id mn14-20020a0562145ece00b0065cfec430a1mr29384977qvb.55.1697205939304;
        Fri, 13 Oct 2023 07:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205939; cv=none;
        d=google.com; s=arc-20160816;
        b=0OCaRRdxm6PppOSUaX6EuRYUjIXSst/8Ra8A4sfXyqHT1LDH63Wl5DpohVZexXehbf
         tx/2rM+kOuSvFsTUpK7nfysLsE1KnUR7rCwymAfH+p7LQGLPBtwU2QexJBZDqBFqKQZH
         4xz1M1xPCRrkdfVyHupTPKqf9Akaa4HT4oaP60nlC6geaSYg7sd4BNuB7CgBZnrbMH0o
         XNo3NKeMtm/V33KWVgrUEH1+up+yXZwUrs1AP17EI0hOoiBCPPwSpkd3ASqemwibgBib
         OaA0iYNK1juiEkjmm7z/A3XPM3zq/fVBpc0csPppPmw0wR7TQQcUl3CLkSDymtSDlRrH
         63Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XHKXv6KA5uR9pwP6emCinBR3kfpLZBEMec/UWasLWx0=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=j9TpiXAirO8OBtQDdhAj5VZPDuAIu6lJ9OXnIomKcLLMxtsm93lty3LYieEkcu5wFE
         UwUUxBtGBVvhLHlrXr/aVCHv0+Y509Qw7BE17/1B4Ng+QPcNRdgJgg8K0de1wBwFXwfA
         PolyYz22To3stzxLyFzBAHizz5u+ive5SFjPfZ/b1RQF5DwcFmsysHnIPlbENI5MwYbr
         tHWoh+N1yuDWZ7Bg7SuWoocXfgemXebX1JcmnfWU/64g3NfpT8rpqyQBxD6ahO07Yjb0
         Ipvars6QRP48nv6HUmej4bftrPAc4NPP2JKQJo/bVigtzw8sEFV/04vy5VsOlLbGkHyM
         DMAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w1S/4yvj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt17-20020ad455d1000000b0065af2299bafsi1202879qvb.276.2023.10.13.07.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w1S/4yvj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrImY-000559-RS; Fri, 13 Oct 2023 10:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlO-0000iG-2z
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 10:03:41 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlD-0002ZL-I6
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 10:03:37 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53dd3f169d8so3723569a12.3
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205804; x=1697810604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHKXv6KA5uR9pwP6emCinBR3kfpLZBEMec/UWasLWx0=;
 b=w1S/4yvj0W2gC2wnjLq9Dqrvp+k9UpLHMlopUDxWhxfTJpKTJrc3ckeTafmPswLLi9
 tHPm2GhEizm1BM0w9WkyDget/4Per1UaYXLZkX60g7i/KMELn4pPq3lJA8tw5b8MKyTk
 6f4hg/7eSCMCz8rGn0/ogMx0e+AHKfgb56+U1imoqJ83N4Wi3uI4u/H4p5b3a+myT/We
 4WARw0G+KZa+fS/aXPkJhGjUyQezQteWmvxenBlsKtQ8J3B4BSVxMJzHzsoURWkSZ/gk
 SevpKG/BxQkk6l09phoOIPKtXer53nGh0vYATlr8libYJ2Kw/+cTGt/isNEiOLgLe9xH
 Pfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205804; x=1697810604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHKXv6KA5uR9pwP6emCinBR3kfpLZBEMec/UWasLWx0=;
 b=mNujYAvQZJB2VXrUwNoWipYRG3OHqYHdFdAhLvixdK8i1Y0O7tBKwkAeHMW6wSmMkE
 gctWPn7NC1obLrFN0Iq1DgQm0x0a7JLl+ui1qFjF3RziE5GWcGwPzZ2qtm2itPtHNaoK
 YG6fmwF9AMHpKLYDAXbHcgBERjPpTfwC5MMvOJcuaaoPSpWiSftQ9tQLcBsZuW+vK8tu
 iff7w+tq1jnbqQzy94tvfUvHr6x3cYttLkD9F3DiG4UxR1k4IMy5SMceJesVQ9giesgS
 csxOcM4JCAiTaLR9GQkYD8QaeAd3uyE5EALOVSdhsDhA2eualZamUHCbw9kQCMIarP4A
 N3CQ==
X-Gm-Message-State: AOJu0YxkjzySiTSsXvyMeixv2Gf9uAH4x2PomqxWiN248f111I9SlVjd
 9BaI+e21FamIIp9ne6VULMdFaNMDPob1f/4i9ZM=
X-Received: by 2002:a05:6402:3805:b0:53d:ad13:72f6 with SMTP id
 es5-20020a056402380500b0053dad1372f6mr8866731edb.30.1697205804492; 
 Fri, 13 Oct 2023 07:03:24 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 s7-20020aa7c547000000b0052348d74865sm11465680edr.61.2023.10.13.07.03.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:24 -0700 (PDT)
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
Subject: [PATCH v2 13/16] target/i386: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Fri, 13 Oct 2023 16:01:12 +0200
Message-ID: <20231013140116.255-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: 9RrMTfJPR1Os

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.c | 50 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3aab05ddad..81b05d421c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4990,13 +4990,6 @@ static void max_x86_cpu_initfn(Object *obj)
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
@@ -8018,19 +8011,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
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
@@ -8042,22 +8022,38 @@ static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
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

