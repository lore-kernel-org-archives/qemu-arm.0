Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1158137lfm;
        Mon, 17 May 2021 03:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJfdSmW+6Ao70ZhL03UgqlBeT4FZTREPKu/wjpeJchPEQBcMTD4Y6kALBUD+bFXUQ005Uf
X-Received: by 2002:a25:16c2:: with SMTP id 185mr80359720ybw.24.1621249100458;
        Mon, 17 May 2021 03:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621249100; cv=none;
        d=google.com; s=arc-20160816;
        b=05qS6RnjmYAEYE7K0k1i3gJAfWFGD5aSDUcT04A/odCondA2uvC5uZJPCNVBMBQiRx
         iopvspITMWWxsNArdlNLtVEepriyWqc/qq0sHcuUK+715TGJqG+SFp7kCvn3a4zl9sS2
         sWjR2xXSwxirLn/Mxh1p2f6YFvAoLT3WcVFnEsTk+E++p86CbcdVP6l1u0/KRh8ac8Uc
         UBTxqpfHJaJZI72KsW3+gxgd8NvylbplIMrn6nHxnPbg2i2KmNoF4WOSLIjKIeRQqiam
         6cvZ5CbBYedlgqP/WIIwEZXDFjcBohEVxcWo4deRXKBmlGWlHkVLPDcwFA0UI4T8rAYr
         cpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=numJYWQfN9cjP4y3FBe1McH7f7YrqdT6BscR7duwZVs=;
        b=UuERERyBXgoMjqKPlkWjlw0ksUon/XsCEF7prBGPzD4ksAhAvncdC3QH4btNX9grVs
         Z5SZ5huOrDKZJFr2DNifBYj/PGBRJFE5cBvW99g0Oku74X9AscT1k4Zgy9ifeGBBbkR8
         Tsq4q1h8zOjQfkbY+ejB/MeZ0S+d9F8zg/C1+o9Fq5tzysKX7zXn6amAguxt91QIBsFQ
         Z3WI1fFyY1nkwClqqYq1Z9UYCiXWp/wgoZE0XqveqQHjMb6/CtCWSrmFCCv/1ilvUUBl
         G+ux5giCxQwkyh+pChom+3olX8hJcQXQhvGpIRjU+pED5GRHF4fVaZ4o8+43vIF/R8UK
         BtPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PjPIsEmr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si18748197ybf.422.2021.05.17.03.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 03:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PjPIsEmr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liax1-00018Z-Mk
	for alex.bennee@linaro.org; Mon, 17 May 2021 06:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarP-0005xS-0n; Mon, 17 May 2021 06:52:31 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarN-0006hd-BZ; Mon, 17 May 2021 06:52:30 -0400
Received: by mail-wm1-x32d.google.com with SMTP id b7so2714319wmh.5;
 Mon, 17 May 2021 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=numJYWQfN9cjP4y3FBe1McH7f7YrqdT6BscR7duwZVs=;
 b=PjPIsEmrl335FJg+p+NxwQla9zW8A5KcKXnlX0P1PCNzYPtTQOTNAltDsuUQ+UATZ6
 GWNhnGQY3iCRH0E3fSh5VcxfGfdikuMZfyoovt7O2NODXr5ZzV2/UfQVLeEehANfLgGo
 yN5EceicQeG3ghsmcB/fwMLa/4zSmvFAsu4u64/mS3a0uzwAmCTtuxoCOU1egTRdv9aP
 QQAs4Jw7OkwmbxSL4UZV8zFgKaBD4J26div+p/ddz8P68LVFttmIHcl7LL6eVCH94KkN
 Y3sGMJB6NxxW6Lv75q6F/+5+W57Wt1fPGTBOMWFORxLgg/JZifflZHvZ6WlgxOu5A3/D
 qWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=numJYWQfN9cjP4y3FBe1McH7f7YrqdT6BscR7duwZVs=;
 b=RZX2z1i+bwaMnoC2z2m4IXXDFZoNMmLndjs1TlNCnQkZdb3JMr/hxKXMFPyR7YdsKF
 UkpSKZne3zgaJZr/uyOwaaSfvmZ+zkDsqzA5r7cF557uUagdN6PHT0xmldylPCV1y6ai
 i1aux8KftAuufjOtie8zDZf9JLvctPLYrmRcYLSjRt78QYxhcuTVXvVJf65wthYySJD1
 UkUU5BqcSlneIAyyJgECyYPd7Da2h1Ypesw28KT4mNuNj9DJrGIsEdz7/vhXsYgU7C0t
 t/tQKE4bdTMpIefq6iNLij0AifhTu0NE32wcdnRHv3/6dkz12DTUkQU35WLSri3mfNDx
 y8LQ==
X-Gm-Message-State: AOAM531qPrQlcT+dJo9u6jvhLgq1BDwcdh0YPvCpNLx8TH8nzMW0y0xI
 V+zZdUziSYd6ml86W7oE/kDprMTBXZh19Q==
X-Received: by 2002:a1c:a7c2:: with SMTP id
 q185mr32839778wme.112.1621248746260; 
 Mon, 17 May 2021 03:52:26 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c15sm17019645wrd.49.2021.05.17.03.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/23] cpu: Directly use get_paging_enabled() fallback
 handlers in place
Date: Mon, 17 May 2021 12:51:26 +0200
Message-Id: <20210517105140.1062037-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w45TmROMyy+p

No code uses CPUClass::get_paging_enabled() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_paging_enabled'
  hw/core/cpu.c:74:    return cc->get_paging_enabled(cpu);
  hw/core/cpu.c:438:    k->get_paging_enabled = cpu_common_get_paging_enabled;
  target/i386/cpu.c:7418:    cc->get_paging_enabled = x86_cpu_get_paging_enabled;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu-common.c | 13 -------------
 hw/core/cpu-sysemu.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 5913ffe22be..2aa6b8cffca 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -66,18 +66,6 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
-bool cpu_paging_enabled(const CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return cc->get_paging_enabled(cpu);
-}
-
-static bool cpu_common_get_paging_enabled(const CPUState *cpu)
-{
-    return false;
-}
-
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp)
 {
@@ -316,7 +304,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 7f3a3574943..931ba46354d 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -22,6 +22,17 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 
+bool cpu_paging_enabled(const CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_paging_enabled) {
+        return cc->get_paging_enabled(cpu);
+    }
+
+    return false;
+}
+
 hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
-- 
2.26.3

