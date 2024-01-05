Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp793281ejo;
        Fri, 5 Jan 2024 07:46:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqsCay7UQBYE7hqd2mUEbSp0ZURsRPX/GgsdCj+dTuMbWm8JWgglx63OIe1MGkfV3tGg8o
X-Received: by 2002:a9d:4818:0:b0:6db:db0f:9407 with SMTP id c24-20020a9d4818000000b006dbdb0f9407mr2647593otf.8.1704469607082;
        Fri, 05 Jan 2024 07:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469607; cv=none;
        d=google.com; s=arc-20160816;
        b=ljHTSDQvtBk9VOCRTEfKivpBevMaXSxmtaTqpsnfIkJQ4z7Wec6qH1B1sxyzUfJwkG
         Czp4R9JMHEDqmI3ymT6d2Yc3cvRaQch5Auk1FHapCSNpiZDHbX78R2K09e3wo7nD1mLi
         nu1eq8ig8CD78yMlzit5n+pRgUdMq6WJmMfes5lAs3uwbQnolc6hN/Dvip5MoVubPumX
         Jt7IaAAO38t1juOK7DH0lFuYAo4cJXzOCB+1uwSE6v3lunkuq23mnPSv8HUFrAw+7PQ5
         ISYzcMP6Jq3BtXqZkriPxATEjoIBVZLoGgI9QZqrDLlbeAZ4+daFZSEJ0nOs4vFLuy32
         kmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wJixAs+R9evY25N/DNdQZkg5UuMmYpP4W3heU6glhRE=;
        fh=koaf0Gu+9SYZKrYDVjZfGS7VP9KAgrf49CflV3EB0FE=;
        b=lV2SMpRlOfnCX+3V1Hhg688eNl0taBncNqVdnIb8JytQA92MWM5C55//4RbUsqN/TY
         I3XHla6j4PsNROYzPm7Hid0rC63KyAZnEDxqrfudL7uuVWWRUghX3qvhudc/P5nzfR9I
         s0Y5XVNlgw4YoJB2xiEVgpaEqQtuGNBMTNRmLTD5AIaMHfLTKJMjmL7qL0aww3LxY+Ia
         n/Hg+6LKQZWlZDqsuSaA76ofpCifHTC/e3M08qjG2nI+V7DERVnRvGXNullMsleRJ9aa
         odgW5X1p86pnBsueqsHHNDsud7FBxAe713rKNVKy+hMztj7r6D2oPVYkXsqhoDzh/a3r
         MfTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXDd3JGI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020a05622a1a1400b004297c73fcc4si711991qtb.407.2024.01.05.07.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXDd3JGI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmMn-0005Cj-LY; Fri, 05 Jan 2024 10:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMd-0004oT-To
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:05 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMb-0003Cg-UD
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:03 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so17366275e9.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469439; x=1705074239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJixAs+R9evY25N/DNdQZkg5UuMmYpP4W3heU6glhRE=;
 b=dXDd3JGIuaPHal0zUrDxlITmM54qS28iLzvT+rq/Gkdm52HjQzg0GEOVMF9jClL9sV
 eDFlkkG6cUlEIoojkUW2po6dEB4zi5vkfgdMqE1zNAfZ8IPEGvIr+FqDArz/n7YKTmaT
 pX9qcPhG/F+DmmejqoCM8uVfAAGJoeFaZfNCR7lXiVE1NZIWSiRAK6YQ6f241GbAtg+Z
 r8gCue8Kl/YsHkLZ8lnr0UGvzc2xQ8MZqw5qz4LsGD/PCGyATYNCI9yhWThtdEJ5sqfZ
 NjtHaygNVrWm6Qd3fTZnFUFL6Z5nvT7OGIZtCCOeuRLa8gJQxJj2Q5o1eKNEtf7tV6Ts
 lgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469439; x=1705074239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJixAs+R9evY25N/DNdQZkg5UuMmYpP4W3heU6glhRE=;
 b=R6dtb3VFZMIrRB/Ywl8emkr9U7PLeS5fMHRcKBjoilLkoVfnQaK+KgZ1oR8WQqIwCO
 u6inb0DTQtTZKq9mdEN7zev5x5oXGfI+XqAbO6CTqgXdpz0z7ZVMC7tJ0LdGVW9UPS53
 RHgweDTRrsLg7g/WWmdByfbuP1SHk1hslQ/lVlGT+gNLXpJ0mJiTcxfY5GwMXN1oyI+M
 DhaR/LkTp+1eguNEy2HzWvrtVqDYg2BSPr/6rEsAAeYo2LVIDZY5e/UmERu/VQ2wiRs5
 JvGBgznJuD33CNAa0juJueviEaXofLumuahAFTKuBchCywxUkF71hZilRP4KOa6aH3br
 /N/w==
X-Gm-Message-State: AOJu0YxAZlfi6bkoo9eThLXYKD+s2iFizz0KWfq9rMXFzHX4hNJc5Twp
 wH26HrArS0CUOJjzv6Ejurt6NF8FfYmRTA==
X-Received: by 2002:a05:600c:13d6:b0:40d:9336:2991 with SMTP id
 e22-20020a05600c13d600b0040d93362991mr1231609wmg.129.1704469439492; 
 Fri, 05 Jan 2024 07:43:59 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c3b8c00b0040d62f89381sm1929866wms.35.2024.01.05.07.43.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PULL 09/71] target/avr: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:02 +0100
Message-ID: <20240105154307.21385-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: H/JCX1Vi7Ujr

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
avr5-avr-cpu
avr51-avr-cpu
avr6-avr-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
Available CPUs:
  avr5
  avr51
  avr6

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-10-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/avr/cpu.h |  2 --
 target/avr/cpu.c | 15 ---------------
 2 files changed, 17 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 7960c5c57a..7d5dd42575 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -184,7 +184,6 @@ static inline void set_avr_feature(CPUAVRState *env, int feature)
     env->features |= (1U << feature);
 }
 
-#define cpu_list avr_cpu_list
 #define cpu_mmu_index avr_cpu_mmu_index
 
 static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
@@ -194,7 +193,6 @@ static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
 
 void avr_cpu_tcg_init(void);
 
-void avr_cpu_list(void);
 int cpu_avr_exec(CPUState *cpu);
 
 enum {
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 3e478294a6..f5cbdc4a8c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -362,21 +362,6 @@ typedef struct AVRCPUInfo {
 } AVRCPUInfo;
 
 
-static void avr_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-
-    qemu_printf("%s\n", typename);
-}
-
-void avr_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_AVR_CPU, false);
-    g_slist_foreach(list, avr_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_AVR_CPU_TYPE(model, initfn) \
     { \
         .parent = TYPE_AVR_CPU, \
-- 
2.41.0

