Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp430681njb;
        Thu, 8 May 2025 06:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdTVGHeimNVTGnfSKsG1rNir0RSarTfP1ZTJi1UjKxJrI1pKEnY4Ezq0sTrf+G5R+zGnFDNcsKlOa/LA==@linaro.org
X-Google-Smtp-Source: AGHT+IEgvSlqnUdGIk3IFjhWnVKGkCEWFDfu/ROcZSGpZLdC3gW0phvKSeydVBWGaS5o8IRSvC6R
X-Received: by 2002:a05:6214:c46:b0:6f2:b7cd:7cac with SMTP id 6a1803df08f44-6f542aedcb1mr112231386d6.31.1746711796811;
        Thu, 08 May 2025 06:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711796; cv=none;
        d=google.com; s=arc-20240605;
        b=VBMlq8i9i0YzhRlnjeEpLx3xKKLUm0zjD39kxOKCyEJeAxrtMoMmGAFyRFGrriCTJU
         YU451jVqBpEOhohmKYGFsRdQ0b96Poa+WYTcedFXIQ5R2qmm+cLjjtzNtVa/x+i52bcE
         bN0iGddF2WogzsR/RfAzYzs0CRPF0s/GznVKGDxbdMyMPWPEkOyWPYznO12mcKXq3Uyg
         PKpg9jtgxBpQ0z424VNdBGBp15KzjQYbOioaFBXFQpEmfevaV4nlH9jdRTZmbH4WduZe
         kgNInmaj3tHhwjDwQGNX3tYIf6JsQjOb1A1IhMi/dH0WweBlODpogY7ygGCltOosjNt2
         OAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4ftaUxFMOJWyPcpYYJywN7GZrXuW4pScDj+n5IUMy18=;
        fh=HIGSeA29hFY6PU25c7yD3mhhqNJxGGHGf2z1hdo/NR4=;
        b=QOwIkC/K+ZwefDx8jwhWoeF/a8I/+wr7qNmnwZc+pguzuXVHB2H6Ay7DiVKkqEsh8w
         tl5/eI5Sz48+1+GALcOfOMspD3GDqz19/dhA5AV917Nuqf8TeSHxpse3Vrgh9pJ8Hc+r
         dzWpuqxYeJsCPH+aSq0LDHuKG7nbc7Gq/gEBXZRuozSvzM/EEA8YLfr5IlAo9eidZ6Bn
         D54gEcWCo6eo8VKQA6BnM5LTFe3NIvkUDzIdvFvhS0i7sUzEYDDsXFFmTBgU9dsZJ3PN
         e0reF3nGJ/ZaxWdDKCRf6A5IRqcEOneJ5/hdMx36I9yjDi52czTVPnDT3EZE9DYEIPbt
         bP3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vRQBUfY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f542902e2esi43679136d6.447.2025.05.08.06.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vRQBUfY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1Wt-0005Y3-UI; Thu, 08 May 2025 09:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Wq-0005LD-Uy
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:43:12 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Wo-0004om-F2
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:43:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-227b828de00so9655525ad.1
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711789; x=1747316589; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ftaUxFMOJWyPcpYYJywN7GZrXuW4pScDj+n5IUMy18=;
 b=vRQBUfY7jAiZ/J9ugccgjCUdR2u2+nXIZQmL6kBfZAk1ZSeSh40LZ90aLQO21+IioW
 NxITz0Ciu37fwZuRs0SmjXn4L+SHfg9LpPlfsGwKSf8hx89j4OpWj+Nj/LE4QnVEMDu9
 jyGJTrDaUWeQGJS3nFpa/R1GGzn9+rRBuLgZ5Dhh23JVMd++guV8hgb6aGFp08zeuiTG
 1wISoj/yVpC0Wi03MjPimedKboyOhUokIrI91iqhe1yXUs7HakMfYYRax2u7GL1qk2ge
 N4b4XHmb+DQz8s7sT8qWusXWtRIB8hXDSmCP10t8L+sp63Ql1gieW9Vb/UF0LvK2utJQ
 z9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711789; x=1747316589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ftaUxFMOJWyPcpYYJywN7GZrXuW4pScDj+n5IUMy18=;
 b=RCC4ugYWQoQ1MIn7scF3m8gqxlKZ9BN5q3u9uZgf6h4hx8e/u0boJRRPeGIRSItJ+H
 zaQsi+8k/S7FArU8cK0QeIfs1LE/ofhiAPoYNiVjC1D5kmsxv8ji9f5zZByJ/BDYdNIN
 FX9WiJJkro9nC8cm3sgc2CGUQ91hTDGmSt0WG6b8UdiXL4vYrvvpZdg+9wO2+XqAYa4Z
 euiHYeGMjXEEE1RW6uYq3M556jXE9O61vrFW+gv+JivbGGIQe7IP9VmerfvbkNF4Lzzb
 gXM6NWvZQH9d4x21Z182jKNh2rfXHUqc64njDnH5hcEsNet/jBCXeFvN/Ku48Z7Pn7O5
 auMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW69wY5pVpHYJO0iX6xpcThHFdkmoa/ZO80qsIf8XtkKPQ853AP0tMHS+JL1xhb4iAuY31nmrRnRA==@nongnu.org
X-Gm-Message-State: AOJu0Ywd+zhqrx7I8uH7kq4DCmRu/OKl6rjXV996pkDliyBJDIMqpgeO
 LymuS/IspNMiRN2g1faLMuMGFXQPINUe0mnkFexzVzvixcdMfwJyVdMJyVXv49s=
X-Gm-Gg: ASbGnctzEmqHd0GDkfVIpk6ADuaDMg/d7NyrubRO4EiCx6/l4rBCF3NQrUtPmo5xWim
 jovWcpVODZw6NCywlKyyAnh+/q8rsbCsGXUB1NAzs9iPneYAm5NHSG+4L3S0mjVtKMLp4izE0sD
 /XxK/Ljqvlljix3nfIbM0rItmVWETlOacsWOml2rG/nCR3QuKXabqqFGceY38dMPI0TdXLc2vE3
 NcIa9/bSxX5BlFgu2KpZkNiLdS2YawLRqTudMdhkrF8v3sqDbMQsAXg3XFT+7oRiZQbC3I2Hsj6
 P2BwTN2BHi5zlALZyX2qsb9DRmqK/2wK2ZDx8y15XkHsYW0bx664B9/PU0BNIYBqVj4McJaWKK0
 2myz//OD88aHN0Go=
X-Received: by 2002:a17:903:2310:b0:223:62f5:fd44 with SMTP id
 d9443c01a7336-22e5ec997b4mr119109545ad.40.1746711787379; 
 Thu, 08 May 2025 06:43:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b22b0594a67sm240599a12.23.2025.05.08.06.42.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:43:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 19/27] target/i386/cpu: Remove
 CPUX86State::full_cpuid_auto_level field
Date: Thu,  8 May 2025 15:35:42 +0200
Message-ID: <20250508133550.81391-20-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: 7Pg10UxkROMk

The CPUX86State::full_cpuid_auto_level boolean was only
disabled for the pc-q35-2.7 and pc-i440fx-2.7 machines,
which got removed. Being now always %true, we can remove
it and simplify x86_cpu_expand_features().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.h |   3 --
 target/i386/cpu.c | 106 ++++++++++++++++++++++------------------------
 2 files changed, 51 insertions(+), 58 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7585407da54..b5cbd91c156 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2241,9 +2241,6 @@ struct ArchCPU {
      */
     bool legacy_multi_node;
 
-    /* Enable auto level-increase for all CPUID leaves */
-    bool full_cpuid_auto_level;
-
     /* Only advertise CPUID leaves defined by the vendor */
     bool vendor_cpuid_only;
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fb505d13122..6b9a1f2251a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7843,68 +7843,65 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
 
     /* CPUID[EAX=7,ECX=0].EBX always increased level automatically: */
     x86_cpu_adjust_feat_level(cpu, FEAT_7_0_EBX);
-    if (cpu->full_cpuid_auto_level) {
-        x86_cpu_adjust_feat_level(cpu, FEAT_1_EDX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_1_ECX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_6_EAX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_7_0_ECX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EAX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EDX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_7_2_EDX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_EDX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_ECX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0007_EDX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0008_EBX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_C000_0001_EDX);
-        x86_cpu_adjust_feat_level(cpu, FEAT_SVM);
-        x86_cpu_adjust_feat_level(cpu, FEAT_XSAVE);
+    x86_cpu_adjust_feat_level(cpu, FEAT_1_EDX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_1_ECX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_6_EAX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_7_0_ECX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EAX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EDX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_7_2_EDX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_EDX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_ECX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0007_EDX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0008_EBX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_C000_0001_EDX);
+    x86_cpu_adjust_feat_level(cpu, FEAT_SVM);
+    x86_cpu_adjust_feat_level(cpu, FEAT_XSAVE);
 
-        /* Intel Processor Trace requires CPUID[0x14] */
-        if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
-            if (cpu->intel_pt_auto_level) {
-                x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
-            } else if (cpu->env.cpuid_min_level < 0x14) {
-                mark_unavailable_features(cpu, FEAT_7_0_EBX,
-                    CPUID_7_0_EBX_INTEL_PT,
-                    "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...,intel-pt=on,min-level=0x14\"");
-            }
+    /* Intel Processor Trace requires CPUID[0x14] */
+    if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
+        if (cpu->intel_pt_auto_level) {
+            x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
+        } else if (cpu->env.cpuid_min_level < 0x14) {
+            mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT,
+                "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...,intel-pt=on,min-level=0x14\"");
         }
+    }
 
-        /*
-         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
-         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
-         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, unless
-         * cpu->vendor_cpuid_only has been unset for compatibility with older
-         * machine types.
-         */
-        if (x86_has_extended_topo(env->avail_cpu_topo) &&
-            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
-            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
-        }
+    /*
+     * Intel CPU topology with multi-dies support requires CPUID[0x1F].
+     * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
+     * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, unless
+     * cpu->vendor_cpuid_only has been unset for compatibility with older
+     * machine types.
+     */
+    if (x86_has_extended_topo(env->avail_cpu_topo) &&
+        (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
+        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
+    }
 
-        /* Advanced Vector Extensions 10 (AVX10) requires CPUID[0x24] */
-        if (env->features[FEAT_7_1_EDX] & CPUID_7_1_EDX_AVX10) {
-            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x24);
-        }
+    /* Advanced Vector Extensions 10 (AVX10) requires CPUID[0x24] */
+    if (env->features[FEAT_7_1_EDX] & CPUID_7_1_EDX_AVX10) {
+        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x24);
+    }
 
-        /* SVM requires CPUID[0x8000000A] */
-        if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
-            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000000A);
-        }
+    /* SVM requires CPUID[0x8000000A] */
+    if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
+        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000000A);
+    }
 
-        /* SEV requires CPUID[0x8000001F] */
-        if (sev_enabled()) {
-            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
-        }
+    /* SEV requires CPUID[0x8000001F] */
+    if (sev_enabled()) {
+        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
+    }
 
-        if (env->features[FEAT_8000_0021_EAX]) {
-            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021);
-        }
+    if (env->features[FEAT_8000_0021_EAX]) {
+        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021);
+    }
 
-        /* SGX requires CPUID[0x12] for EPC enumeration */
-        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
-            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
-        }
+    /* SGX requires CPUID[0x12] for EPC enumeration */
+    if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
+        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
     }
 
     /* Set cpuid_*level* based on cpuid_min_*level, if not explicitly set */
@@ -8820,7 +8817,6 @@ static const Property x86_cpu_properties[] = {
     DEFINE_PROP_UINT32("min-xlevel2", X86CPU, env.cpuid_min_xlevel2, 0),
     DEFINE_PROP_UINT8("avx10-version", X86CPU, env.avx10_version, 0),
     DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
-    DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
     DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
     DEFINE_PROP_BOOL("x-vendor-cpuid-only", X86CPU, vendor_cpuid_only, true),
     DEFINE_PROP_BOOL("x-amd-topoext-features-only", X86CPU, amd_topoext_features_only, true),
-- 
2.47.1

