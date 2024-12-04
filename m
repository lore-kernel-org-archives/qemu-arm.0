Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp490059njb;
        Wed, 4 Dec 2024 12:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqRWOvk8ZvQ0Uly/CjM05GRbv/P4U5RHMRcfnvwlMmZGtGCUMn/xBvjc+NN7mWHY74IhmWV7AKpaDfWg==@linaro.org
X-Google-Smtp-Source: AGHT+IGbwK9VLYU0ETgE3VWh0EahWrfhVQJYJoBGnX5UAjvUkVteI3RQH5JImGq16DXMob50Hex/
X-Received: by 2002:ac8:580c:0:b0:466:84a8:6883 with SMTP id d75a77b69052e-4670c080244mr102621001cf.12.1733344155036;
        Wed, 04 Dec 2024 12:29:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344155; cv=none;
        d=google.com; s=arc-20240605;
        b=TKN7MdQdU9v+vqcZXBKEHTdpZ+pTTW8LGZmNFyHdcX68fAMdOayKAAxxKX1uQzVPBt
         fj7Bdk4qaS1MexqVkLoC1eeBtwXUGI/TXVVKsX4DmevfndYorAPrPW7Pfz7nIemAQMJF
         moijQRbuGvaH7cFcAknyHQz3j/QXMSVaRo2FDtfDHMUN1AB1F6g3E0kfK83P3sHjsCi+
         3AfUHKcvK8QY3DhF99F5Xx4gYPMp8tIH3xAU6muGjWDkalwCQnGEjntwYI6W+Rhya4v/
         BdOlRm1f6HAGjVoOhYe+fKVLGIwZmZyBBPdXF+CQzZmMHXDKGBGPgsgn8yU0bOB+spIi
         ekzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nkZKIsDoSM+ma8HKWntZmvOsZaSUYdAuJc6HKLqlim0=;
        fh=lmF7elc67EfnUByx2Lmcbselk+YSnlgKnucs7BFqGDY=;
        b=iz+J4ZmyIvkHb+bXI/syKtGpfKUr9wqOCBjTiKMPaWe70ZdlRmHvbvnITmMiOjS0NB
         r+GXw9pAItMEOWfOF/o+hLp5squ1MvYK2fX52ZVJJN+bjYsLokLmBv2ZVCoNkSu99hqp
         Qw17sspUgq3NcK60HsIrCVi1qL3U8JgAqcqkTh33t91wZveU//VIykDyUc8PtErS5eWd
         4HptUYKiVXnQAldWZobaMFYptnZbz6uPXuOlsCgoNXxlzZ3lVYTW/W5ecYZyhml0aDKa
         3UHzRC9Pimz8wb2krLv+2GSSt37+bxd6s0br9GZmHxpjsBKfWebBRvdbfY87ahlPe8Qq
         mg1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Fuc/JnqI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4104edfsi204137741cf.304.2024.12.04.12.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:29:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Fuc/JnqI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvye-00021U-LL; Wed, 04 Dec 2024 15:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyb-0001ne-Bb
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:28:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyZ-0001sd-GU
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:28:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4349e4e252dso2105405e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344078; x=1733948878; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nkZKIsDoSM+ma8HKWntZmvOsZaSUYdAuJc6HKLqlim0=;
 b=Fuc/JnqIq+P3ZFsiJXKia+YbnDZNJXx2TMWxs+P4uPXgYocFq3FaoBEzPaJoas2g0m
 tGy165DtIyut5TOZ5373dHiLm4igInBSCTi60EgEScAQhZwfhDXvLo+z5q46hXG+2kUX
 KXj8kejMkXQs/BUD4k2rJjnqoNsRFGuS9xcmPmP3skdrioog0UKDQ1sl4kSQaZ1FW5h0
 tbjvvEUYXZPgY7XMmmS+EU6oZbLPrWIWaaZL2a/s4nSGGsaPY4hnR++T6KMNn2jnQ4li
 HwM8+z4qIFH7j31UKjWFHxY8vbBGfIbDGZkvkSjbesPQXrozDi+6PUZ6lh8a9LR5IKcx
 faIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344078; x=1733948878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nkZKIsDoSM+ma8HKWntZmvOsZaSUYdAuJc6HKLqlim0=;
 b=XLKkXsX7AoB0vibUZcFOpOriBws1+MApS5glkpC4nCN8mdJOSeR8v/L8u+EaLMToRn
 j8C1Ew3DwsqmAT+Aon/fNLv0klml1V/yh2uJvZio0h1b0XzhhOb0cHkdEb6b6RgIsWFb
 TTzcoLbMNzAQlRLAnpxPbsRNHnt66VnAJ+x2PhaaIvyaxqSpuMM61uRqpv8W8IqgPHoy
 tcVjZEk9DY5HgMbOgXopn1xaSD3wX0Q7yh4oADh1dEgVxOh12N3JQNBFPQuH7TvbgGRI
 LQ5Dx63v4tUYBjvFj3nuRm0AtaG+6hdUm+W0CEcseW9NoZhWTalNHGk1dDoFIWlknKvu
 y5ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxwzPtYLSyVgs71SOW1QwHO1KiBaGt2Q3l8SNm5Tp9BfyqE5uI4S5VrFVeDIfoMF0wQApYDXrA4A==@nongnu.org
X-Gm-Message-State: AOJu0YxrU0CRvuccQIGyVxvO4z172aJuIOiEmCIfWLmpTaigvo4eSU4u
 LMgRCzew1VzJHvXRP34jPtPL1brHevvDg9prHxjlpYOCkH0nhtq5VyhOjf/7j8o=
X-Gm-Gg: ASbGncsdTuPDl6zQ83o62eG9Szkt0mmdluNXaBXn4kwZzoOA1ffejZbHC8Jj7/LMs+m
 eHfJlt19lgssitmIPH08LSJeAHOg7ygisOa0hVajt+QogGRpSRuyym45UVVCLDyPqrQFa+khjU3
 LGLBJgDg4T6Se3w/YBtuaG7rYnQCJnFrtvCqGexKLY297gM5fbdRWOKORPLdZOlwesWWOJywcJ1
 vNIcAy1R9rEWi2HDPuFnKqbd47Ci4aec6LowxgKx5m7Jt440+FnCxGaAGwMWQr0JYkK58RWnU+w
 +NDeECX1+VeO2MBZPjBHesul
X-Received: by 2002:a05:600c:4748:b0:431:59ab:15cf with SMTP id
 5b1f17b1804b1-434d09c37bcmr69319945e9.19.1733344078096; 
 Wed, 04 Dec 2024 12:27:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52cbd16sm34950775e9.41.2024.12.04.12.27.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/20] target: Implement CPUClass::datapath_is_big_endian
 (little-endian)
Date: Wed,  4 Dec 2024 21:25:56 +0100
Message-ID: <20241204202602.58083-15-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: bVTiNuNCc4uc

For all targets which have endianness architecturally
predefined as little endian (built using TARGET_BIG_ENDIAN=n),
their datapath_is_big_endian() handler simply returns %false.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/cpu.c     | 6 ++++++
 target/avr/cpu.c       | 7 ++++++-
 target/i386/cpu.c      | 6 ++++++
 target/loongarch/cpu.c | 6 ++++++
 target/tricore/cpu.c   | 6 ++++++
 5 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 5d75c941f7a..ee844a4c455 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -27,6 +27,11 @@
 #include "fpu/softfloat.h"
 
 
+static bool alpha_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
 {
     CPUAlphaState *env = cpu_env(cs);
@@ -247,6 +252,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
+    cc->datapath_is_big_endian = alpha_cpu_datapath_is_big_endian;
     cc->has_work = alpha_cpu_has_work;
     cc->mmu_index = alpha_cpu_mmu_index;
     cc->dump_state = alpha_cpu_dump_state;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 3132842d565..f32f1bee61f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -159,6 +159,11 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(cpu_model);
 }
 
+static bool avr_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     CPUAVRState *env = cpu_env(cs);
@@ -230,7 +235,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = avr_cpu_class_by_name;
-
+    cc->datapath_is_big_endian = avr_cpu_datapath_is_big_endian;
     cc->has_work = avr_cpu_has_work;
     cc->mmu_index = avr_cpu_mmu_index;
     cc->dump_state = avr_cpu_dump_state;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3725dbbc4b3..f783d311579 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2008,6 +2008,11 @@ static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
     return cpu_model_from_type(class_name);
 }
 
+static bool x86_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 typedef struct X86CPUVersionDefinition {
     X86CPUVersion version;
     const char *alias;
@@ -8588,6 +8593,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
+    cc->datapath_is_big_endian = x86_cpu_datapath_is_big_endian;
     cc->has_work = x86_cpu_has_work;
     cc->mmu_index = x86_cpu_mmu_index;
     cc->dump_state = x86_cpu_dump_state;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 57cc4f314bf..b9cf0091546 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -742,6 +742,11 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+static bool loongarch_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     CPULoongArchState *env = cpu_env(cs);
@@ -836,6 +841,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
                                        &lacc->parent_phases);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
+    cc->datapath_is_big_endian = loongarch_cpu_datapath_is_big_endian;
     cc->has_work = loongarch_cpu_has_work;
     cc->mmu_index = loongarch_cpu_mmu_index;
     cc->dump_state = loongarch_cpu_dump_state;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 1a261715907..ba53d83f662 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -29,6 +29,11 @@ static inline void set_feature(CPUTriCoreState *env, int feature)
     env->features |= 1ULL << feature;
 }
 
+static bool tricore_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 static const gchar *tricore_gdb_arch_name(CPUState *cs)
 {
     return "tricore";
@@ -191,6 +196,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
     cc->class_by_name = tricore_cpu_class_by_name;
+    cc->datapath_is_big_endian = tricore_cpu_datapath_is_big_endian;
     cc->has_work = tricore_cpu_has_work;
     cc->mmu_index = tricore_cpu_mmu_index;
 
-- 
2.45.2

