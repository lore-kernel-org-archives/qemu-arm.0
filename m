Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp707ejr;
        Tue, 10 Oct 2023 02:33:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlbh936zFHFCp/q/4yrhLAagAN04kYPkZa2oW0vPK4JLTH4oga+e14z7LFLhhnHiziuCnd
X-Received: by 2002:a05:620a:410c:b0:768:1e00:76c4 with SMTP id j12-20020a05620a410c00b007681e0076c4mr20169009qko.51.1696930407582;
        Tue, 10 Oct 2023 02:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930407; cv=none;
        d=google.com; s=arc-20160816;
        b=b8PJgjCUllDz7WtsBDgM6w5yO8b9s41gqacYE3rvGX7wg1bQay0LAFrIFLQzKWRSLu
         Ops+y3TJr+YktF4fMe+axXi9Qh4e9KAQ2khtrdXLk5LvVMjek9N96O5d693xBbsDNxcC
         nRUBhFu71iFCkbTx+l4ox13xvYw8KxDpG6to9wveQDwdMJ1txne6sa/5f+LyG0PZlSfY
         GSIDdx7x+7MC0AVEV8a1Y+tv9Ll/6+0ehk+EZkuts70CKnEDWh06izjYtBCv1OgDgGFN
         HlXvCp/AQJytXCA/CMlyknzsFD0wh/pEGNGHNgpfDDNGKDaW61SBRHGNJf21y2B0JfQr
         +ErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tk9A1YgmUEhePfUQuP/u39GWl+8N7M6SEkDP1DuJALQ=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=0etBrYfVPyDLNbaEhSsdjioqmHLvQ6xVACXxYtyvH12uUkjAo+GOr62QruP1nNxGSl
         owOmLkdTeZSaZJtwNFn7mQm1f0zigdc1XpR3txi+DLea2K4gDBvO1NHxrnI+dr8R9G6O
         BqQKLMRaNPCO4dryI19ZYfnI9pP1MsgD7YgXqFb0/Jnxqr2uojFZ3hkHMlsrElCKE1nP
         estzrpajLd0Oo8m6oPS49Fiew1JlJGsGPM7a0/FSD1bPHa6UXZexA03HU+Zz8JMVcj9C
         WnIYVW71lv0kyclzbCynRQvsjDH7ZvUMKzrSfs5ygk3xJHNv8jSWL0kBJhsxp3wQYxDz
         3sbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VhZ8do2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5-20020a05620a260500b00773b7d9a01esi7056981qko.72.2023.10.10.02.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VhZ8do2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq95s-0005Ad-JI; Tue, 10 Oct 2023 05:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq95W-0003eW-Nr
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:31:43 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq95T-0008WL-Cv
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:31:38 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso929352666b.0
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930293; x=1697535093; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tk9A1YgmUEhePfUQuP/u39GWl+8N7M6SEkDP1DuJALQ=;
 b=VhZ8do2bP6xfOUFxDBsbFeEin7qokPoTz5QPOLAxYYhwD3Uj3fy38CeYpUlhoeZCuo
 wEnAedFGpo27uo+Rd7d5XKjHp5+em10wStTjDMGE2+wpuJLC5AArF0c9rMw/3zu8zFqO
 B/nJYkyL1O5pyB+619vEzO/Cls/xr+SRjf3Wl3n5wsit6NtqKAomiffK6FFP9QXckqKT
 bDoPX8E0zPlCBOYzlxh1o0KXgZZU5/ti87xnIgLjlN53fX9wLzglmq/hH1lQ/OGFELnl
 DSVDe44Nm8GqB6buCzekYz4fzsDqVlnUFLdFTBXDfeB4INY9OV9t2MtPmWTMFgr2oJBE
 iIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930293; x=1697535093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tk9A1YgmUEhePfUQuP/u39GWl+8N7M6SEkDP1DuJALQ=;
 b=R1ktq1oX67W0L55dIEHbQY1sdES6XsuWEtwfy5K9uLg30pfnz8UXug/IkcVcGTJVSG
 xvP62DMHfjAllVL6v1X3ll+o/NTSMGTU8iK6HOwKyn+bBQCdZjJopPed5vAj3dx64xF3
 KvjiN29Bqo5EWFcTzg1SLDwADGCRQi8e+e0U+0Qa4GAt6BSc34c1APr8Qfmi/fb+ViZm
 qwq+BftMuBuwNagAdF+s7iJn8yvFtGqCkFMrb9Qh5uO9YIrUkrhMdx+AkArF66SYE0+T
 vQOIn5dMtkiDG9Cr8N7lzdf5nNF01DH9Sqo1OFo5IHGEILRhdxWu8nEFaAky1rQEH2eF
 rm4w==
X-Gm-Message-State: AOJu0YyM+bLnJSIIg6WTvyg8RH1h+h2MBcAiGyvweUnRH0PLNt+XKFjD
 HrkjAeKo/esslyF/XPUoUU9UvEw7lrS8T0PpI+7wYg==
X-Received: by 2002:a17:906:3119:b0:9ae:546f:d9ad with SMTP id
 25-20020a170906311900b009ae546fd9admr15298793ejx.18.1696930293589; 
 Tue, 10 Oct 2023 02:31:33 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 e5-20020a17090681c500b00993a37aebc5sm8090599ejx.50.2023.10.10.02.31.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:31:33 -0700 (PDT)
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
Subject: [PATCH 18/18] target/sparc: Make SPARC_CPU common to new
 SPARC32_CPU/SPARC64_CPU types
Date: Tue, 10 Oct 2023 11:29:00 +0200
Message-ID: <20231010092901.99189-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: 3OSE+T10wc3/

"target/foo/cpu-qom.h" can not use any target specific definitions.

Currently "target/sparc/cpu-qom.h" defines TYPE_SPARC_CPU
depending on the sparc(32)/sparc64 build type. This doesn't
scale in a heterogeneous context where we need to access both
types concurrently.

In order to do that, introduce the new SPARC32_CPU / SPARC64_CPU
types, both inheriting a common TYPE_SPARC_CPU base type.

Keep the current CPU types registered in sparc_register_cpudef_type()
as 32 or 64-bit, depending on the binary built.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu-qom.h |  9 ++++-----
 target/sparc/cpu.h     |  3 +++
 target/sparc/cpu.c     | 12 +++++++++++-
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index 86b24a254a..d08fbd4ddc 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -23,13 +23,12 @@
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
-#ifdef TARGET_SPARC64
-#define TYPE_SPARC_CPU "sparc64-cpu"
-#else
 #define TYPE_SPARC_CPU "sparc-cpu"
-#endif
+#define TYPE_SPARC32_CPU "sparc32-cpu"
+#define TYPE_SPARC64_CPU "sparc64-cpu"
 
-OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
+OBJECT_DECLARE_CPU_TYPE(SPARC32CPU, SPARCCPUClass, SPARC32_CPU)
+OBJECT_DECLARE_CPU_TYPE(SPARC64CPU, SPARCCPUClass, SPARC64_CPU)
 
 #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
 #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 924e83b9ce..0f94e5a442 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -12,6 +12,9 @@
 #define TARGET_DPREGS 32
 #endif
 
+/* Abstract QOM SPARC CPU, not exposed to other targets */
+OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
+
 /*#define EXCP_INTERRUPT 0x100*/
 
 /* Windowed register indexes.  */
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 1e66413e94..7d060ba488 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -934,6 +934,12 @@ static const TypeInfo sparc_cpu_types[] = {
         .abstract       = true,
         .class_size     = sizeof(SPARCCPUClass),
         .class_init     = sparc_cpu_class_init,
+    }, {
+        .name           = TYPE_SPARC32_CPU,
+        .parent         = TYPE_SPARC_CPU,
+    }, {
+        .name           = TYPE_SPARC64_CPU,
+        .parent         = TYPE_SPARC_CPU,
     }
 };
 
@@ -950,7 +956,11 @@ static void sparc_register_cpudef_type(const struct sparc_def_t *def)
     char *typename = sparc_cpu_type_name(def->name);
     TypeInfo ti = {
         .name = typename,
-        .parent = TYPE_SPARC_CPU,
+#ifdef TARGET_SPARC64
+        .parent = TYPE_SPARC64_CPU,
+#else
+        .parent = TYPE_SPARC32_CPU,
+#endif
         .class_init = sparc_cpu_cpudef_class_init,
         .class_data = (void *)def,
     };
-- 
2.41.0

