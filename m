Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp635ejr;
        Tue, 10 Oct 2023 02:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBtLdSZxktDXlM7CF3P8l06pjRwtmVSa/LB4PIsg99U83X7EdgM9KWZ3/sH4+mRn7NGDg+
X-Received: by 2002:a05:622a:1453:b0:418:1588:2653 with SMTP id v19-20020a05622a145300b0041815882653mr22950005qtx.12.1696930398310;
        Tue, 10 Oct 2023 02:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930398; cv=none;
        d=google.com; s=arc-20160816;
        b=qDhtjN3dpjeno2f9BhgVacqjrGEK+Q4bib4Bhjpl6QB1XDTgEvgbvYGsMQMOcCdgWy
         Gr4fLcYTzxC5ah9AczPhcygRBHvJf5mPNE/II73pV9n3op45AJvIRTKYmzUSxFqlL1h8
         dsbrUwHZkXAjPBKOFHIDP9wl/XW1/mmKmzruZNccK/eTpF/g5AOIcdc23Aec2xMPXlo7
         9XhUiWkUUCk0NIaZKXHSZ64VOYqJupPf1sS9wL0aOKA1dm9OtpK6sDDs8NiUf5WG1TF5
         u5i5VuVkAlWaXCPC/7W36hPvp/mgxfIZ8NidSOcXx9kC9tOrQN9bzaPKXAJh62XhCPfI
         /tDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BMy5FMNiGQxFcppEwI4sVWirnEfoYMzZHwDGKyKUC/Q=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=R2C/TAJ3ZDyi+FKuWH9I8PIGvnlXzEKrRTum/8RkEMuAitz/57Swag7bVBa0rknPm9
         Y1fxbhNT9OgaVQD7quwkR/X7rTk6JhyDNCwxfQCHV03+bLfT0dRFOxrHyzSObsdYt9hY
         1SDHzsw5V6i3G4tKkBFA2f0fs+vngSN5cPm1mlVDMyt/7qayYL+P1h5Pgz8T6N8RO8lI
         +RYUHFdHNSsfcxRVHDbR2oVH7aTDgmkwWDmNEOW34f5X/B7VsFSeRpu+9DIJvgliwkVr
         tG6j8ywNqPjMuPajb9xCh7ib9BHFrosDObDoEOaTtr6FE12vOYkcvl2kxpJ418G5Obv/
         Lx/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vQAeosbc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17-20020a05622a149100b00417d1b9910dsi7243742qtx.709.2023.10.10.02.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:33:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vQAeosbc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qq95H-0002VL-Hk; Tue, 10 Oct 2023 05:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94z-0001Sz-8k
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 05:31:09 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94v-0008Er-L4
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 05:31:05 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso981933666b.2
 for <qemu-devel@nongnu.org>; Tue, 10 Oct 2023 02:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930253; x=1697535053; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMy5FMNiGQxFcppEwI4sVWirnEfoYMzZHwDGKyKUC/Q=;
 b=vQAeosbcx/gWGLPn5elfBxfxK6Lfxbm1mUZsba/ISTIyf+z5UgNIcLhU/fxtJqMQ9j
 hFCkNOQnjq5oqQgQyfdOrgpt6pkIijrfxp3bRpHyWTejLXz3qs8xYFIerYHTx2QlkeQh
 F9EHqRNDOWqiG6SwOtyizs42mUJpCRUcF5RstWRqCCP5yP9P9Vl5Spqa9Hz/u/rqxb5B
 WC1TdIRSS9JUvVryq80rJ8VZfTDHl5Wzti2fKH7Y5WiB82avek5oGBSU7sDjCVbs+ncK
 NQ8sIUbeVW5jgNvQDbD+G5QeulTPpTP6l847fNOKPf4eNMRU23lnfohoGy9vFb25wUB6
 L+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930253; x=1697535053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMy5FMNiGQxFcppEwI4sVWirnEfoYMzZHwDGKyKUC/Q=;
 b=Kz9JukRBE62GoMy/QzIRNyQb1FnTtdyFtQ6/RFAMXkTmbQAgTutlUlEWs188RPkh8w
 CjP7KLjeLVYAf7DwtBrDq258PNlstEbzcNvIMeFdpp1r55XUnfHqiAYkKyjLdyu2oiXp
 zpF0wzY8UJ2A390smUmj5l17PL9zBsm3oazyrVE/ElN2uCdftqkAnb41rjEqL+pTceqP
 Ew8TZTjSw5kDznMrS6Vd5omUTTW3YCYCQbs7yL34QY8n17emSOKhQFitvTNEA80bMtv+
 07XuRqUJFsJHdSemZH58PxkOoK6ebtQSDl+wnXcAb7Ofi89D/Nx8ueBnHIL4UAi3sGki
 67YQ==
X-Gm-Message-State: AOJu0YxPJS9toFrakqQA18eGQNGVWhnHECoeJjnCZ1DkzI8wksF71iSl
 qP1jIG4OvU78lZg4HuxbqvKLaPTkj1ygPi25ah4+SQ==
X-Received: by 2002:a17:906:23e2:b0:9b9:b12c:133d with SMTP id
 j2-20020a17090623e200b009b9b12c133dmr12410325ejg.53.1696930252760; 
 Tue, 10 Oct 2023 02:30:52 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 op13-20020a170906bced00b009a13fdc139fsm8181867ejb.183.2023.10.10.02.30.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:30:52 -0700 (PDT)
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
Subject: [PATCH 13/18] target/ppc: Declare CPU QOM types using DEFINE_TYPES()
 macro
Date: Tue, 10 Oct 2023 11:28:55 +0200
Message-ID: <20231010092901.99189-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: TRfV9Xuk7yrm

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu_init.c | 52 +++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 40fe14a6c2..055436c141 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7408,39 +7408,34 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-static const TypeInfo ppc_cpu_type_info = {
-    .name = TYPE_POWERPC_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(PowerPCCPU),
-    .instance_align = __alignof__(PowerPCCPU),
-    .instance_init = ppc_cpu_instance_init,
-    .instance_finalize = ppc_cpu_instance_finalize,
-    .abstract = true,
-    .class_size = sizeof(PowerPCCPUClass),
-    .class_init = ppc_cpu_class_init,
+static const TypeInfo ppc_cpu_types[] = {
+    {
+        .name           = TYPE_POWERPC_CPU,
+        .parent         = TYPE_CPU,
+        .abstract       = true,
+        .instance_size  = sizeof(PowerPCCPU),
+        .instance_align = __alignof__(PowerPCCPU),
+        .instance_init  = ppc_cpu_instance_init,
+        .instance_finalize = ppc_cpu_instance_finalize,
+        .class_size     = sizeof(PowerPCCPUClass),
+        .class_init     = ppc_cpu_class_init,
 #ifndef CONFIG_USER_ONLY
-    .interfaces = (InterfaceInfo[]) {
-          { TYPE_INTERRUPT_STATS_PROVIDER },
-          { }
+        .interfaces     = (InterfaceInfo[]) {
+              { TYPE_INTERRUPT_STATS_PROVIDER },
+              { }
+        },
+#endif
+    },
+#ifndef CONFIG_USER_ONLY
+    {
+        .name           = TYPE_PPC_VIRTUAL_HYPERVISOR,
+        .parent         = TYPE_INTERFACE,
+        .class_size     = sizeof(PPCVirtualHypervisorClass),
     },
 #endif
 };
 
-#ifndef CONFIG_USER_ONLY
-static const TypeInfo ppc_vhyp_type_info = {
-    .name = TYPE_PPC_VIRTUAL_HYPERVISOR,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(PPCVirtualHypervisorClass),
-};
-#endif
-
-static void ppc_cpu_register_types(void)
-{
-    type_register_static(&ppc_cpu_type_info);
-#ifndef CONFIG_USER_ONLY
-    type_register_static(&ppc_vhyp_type_info);
-#endif
-}
+DEFINE_TYPES(ppc_cpu_types)
 
 void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
@@ -7635,4 +7630,3 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #undef RGPL
 #undef RFPL
 }
-type_init(ppc_cpu_register_types)
-- 
2.41.0

