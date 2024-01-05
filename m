Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp793209ejo;
        Fri, 5 Jan 2024 07:46:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMJK25NfxxMdNG1Cw8jQ7X6lFdT9Rl55FFN2fXGnBmX9c4LOG6Fu9FpyLv/c8Ynvef2Cdz
X-Received: by 2002:a05:6871:650b:b0:204:f6c8:2c94 with SMTP id rl11-20020a056871650b00b00204f6c82c94mr2162190oab.27.1704469598947;
        Fri, 05 Jan 2024 07:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469598; cv=none;
        d=google.com; s=arc-20160816;
        b=BF5PktiMo1p5RogqdC1zZdFTl/2lJc65HNsmn85gYzfw9hF6tSn6VkeDkNRdR09bd/
         p9JGgJmdFgeVvxxhrI7z6U9rYAn1UgV+JRISNHHh4ClT7ZSTtzcD+HK+FY++vk2JyjVV
         iIXjo6bxBay/6pKFDXQMcEvxH/lfLUpBkdOiqm5UyIkiPOijnvRYKJ52KGdKR2YbI1Y8
         QmdAGDdfBEomMbNgFiw32A8MgjPk9Lt1CxkN5fmYoSTxQ42UFb/KNDfj1xaPklTiuh1e
         OPyOCl4z5cuQT5kvCj/thfRY165KE15DW7PH92ECvb0kDfkLbtWKHWgPp6mojtbnN70+
         cK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yaDY8QYkk1W3Mtkw1yjFTsfcx0RHMGOL7zHOvOfrIZM=;
        fh=a1xN/CgOl3bPnNtSzkcbaUmnvDqm/pwVthvBJ5ZcXso=;
        b=u3NDwm5fj1fuCnyFAW10osARe4XaBxbTvD4H8NQjyLbUHMpf8YIrj0peVoybJWx9vi
         hjY3lM9f4N0npJLKzFJh8CXeSRanEMpqfMbf7f2NQBnuCTouTJBOojQ1EX/dw1KYeecv
         YwmcYStF32iBS5fb6NIjBZ+EZPVfMvULqks1wrtwN5HkvE1HmkRhMasA9KOgl9Y2AQ6o
         sOUmvU8OnaNCi9eMvlEonLR6CV4q5nhayd+m5QicaPBJMKvnkWCpoj9dNmygc7hZS2RR
         4MeZFU1XZmgIE2ecReqSkOojPPw06KOuPXiYIgrt9nDBBc0bxufSwDjVXj8HH8gj8zN1
         ihVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0UxCDTe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05620a25d400b00781905b2671si2034395qko.72.2024.01.05.07.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:46:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0UxCDTe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmNS-0008PC-Ml; Fri, 05 Jan 2024 10:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNQ-00087K-KK
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:52 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNN-0003Mo-8n
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d88fff7faso14847895e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469486; x=1705074286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yaDY8QYkk1W3Mtkw1yjFTsfcx0RHMGOL7zHOvOfrIZM=;
 b=e0UxCDTe7uC6Btd804/EDt7+PG+Ds0D00DG/EVBQrzOpEe6+QkvJ0DdQ1yGT0xMxU0
 9AtLoRfcZSHlExD4IvNCcjuOIrD/DiOpy0Stbt2tLIaf7aQ4PolGj5kVd0skddfr4qpn
 TtBXQYvfHcNPNDCVH6RgBaWkhxMwbOdKuym0iN7dE73005aeQgZojXflBXNwmiFUlhg4
 KFIpm/iRGxopyZN21KKqOyt3rkPiQRfa7NFqw8uOmm6mb2saDC1sKiZQFQI97I+xWZdh
 Pa3l01zBGOt3podG0IFl4+5ZMxq56KJP+XERACQTScimEqejRxmXqOE7/EbpRCZhEhxk
 GCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469486; x=1705074286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yaDY8QYkk1W3Mtkw1yjFTsfcx0RHMGOL7zHOvOfrIZM=;
 b=jONeeHvcVYarBVO2Zgd+D1CMzyBYz6s6auIsbTeD9nnqXzEXnz+MZyb2KsSEZ+dLJY
 8qURJNBl625vUZ4Ran6ZQgBSHDCLPRcXRMAyCUVe83mhHnI+xTYzeTvqdW2FTKZhf7DE
 iHtaMlKAZWC0X+yN+515eKddEp8/yG3wyTwqQau8OJu5mgDXu7XqkY+FCQvta8/r+RdS
 AV7h70ohnAiYE/SYWguah4u8MFI4n9QT70raqszy/HZBAv8NeFmYIW/xUS+kLTJlKJqW
 vI6fInVFkkwZH4EymbE299n8K+V+ORJG1NcV1fmjEvPhrQxbQVNKUrf6ByECOI1oU+wF
 oupQ==
X-Gm-Message-State: AOJu0YzEH2M1mbuZo52Wjy6qhzx0WR02vdPCVw3bdAMPau/mD5xWeWKW
 jKZmtNBqt13XQWIETVhFng0YARGf1RX8+w==
X-Received: by 2002:a05:600c:450d:b0:40d:938e:6b49 with SMTP id
 t13-20020a05600c450d00b0040d938e6b49mr697221wmo.131.1704469486736; 
 Fri, 05 Jan 2024 07:44:46 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b0040e375604ecsm1940574wmo.31.2024.01.05.07.44.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PULL 16/71] target/openrisc: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:09 +0100
Message-ID: <20240105154307.21385-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
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
X-TUID: WI2RyzonrsAQ

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-or1k -cpu ?
Available CPUs:
  or1200
  any

After it's applied:

[gshan@gshan q]$ ./build/qemu-or1k -cpu ?
Available CPUs:
  any
  or1200

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-17-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/cpu.h |  3 ---
 target/openrisc/cpu.c | 42 ------------------------------------------
 2 files changed, 45 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index dedeb89f8e..b454014ddd 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -299,15 +299,12 @@ struct ArchCPU {
     CPUOpenRISCState env;
 };
 
-void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void openrisc_translate_init(void);
 int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 
-#define cpu_list cpu_openrisc_list
-
 #ifndef CONFIG_USER_ONLY
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index f7d53c592a..381ebe00d3 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -253,48 +253,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops = &openrisc_tcg_ops;
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint openrisc_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_OPENRISC_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_OPENRISC_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void openrisc_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename,
-                     strlen(typename) - strlen("-" TYPE_OPENRISC_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void cpu_openrisc_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_OPENRISC_CPU, false);
-    list = g_slist_sort(list, openrisc_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, openrisc_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_OPENRISC_CPU_TYPE(cpu_model, initfn) \
     {                                               \
         .parent = TYPE_OPENRISC_CPU,                \
-- 
2.41.0

