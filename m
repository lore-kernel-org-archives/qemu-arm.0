Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp792155ejo;
        Fri, 5 Jan 2024 07:44:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuSKwZb5IcJ4vWPK/fvIgQs0LS4OvqhYVVxS3cceJtq5AFxe9cxLYT6EiY66Zi351V+nBP
X-Received: by 2002:ae9:f81a:0:b0:77f:4e1b:4b03 with SMTP id x26-20020ae9f81a000000b0077f4e1b4b03mr2180918qkh.156.1704469490227;
        Fri, 05 Jan 2024 07:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469490; cv=none;
        d=google.com; s=arc-20160816;
        b=0Z6lS8Z0dThunQa5Q6fdKWcaHazlMf8vbprH43qWClfJVfXbKnjSqSVLnwt3dBd3Y3
         BULrHBnd8SEz95703gxfji9KCeUinoFIHTHyLs6/K9du6cqHOw+38j2Dk9qm+PAeavyE
         BUz0CQ5NZIGEqCo3pvFmgAyv/tEh1Kd+VOw5Nf90BcXgqhDhY2prTEaGbQW4q935kMxp
         PhnWbz5v7F8NgGKQ8Fja0xgFTrTTWt9R1zFdnRmnBlfbj6gTc/LyPzKQFEI5cQJBNh7x
         FoYisa2NZP5euinizxNWAxFNRxYlw+RwsULEfhKD/qYQzuoMStrrpngDf6dM4NG2Oybn
         pPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7xMSbSX6JUqisE+ZC80AlkX0gZxRGpO/C3MZvmfxXXw=;
        fh=V7uVG1DgPEiI/Dn5AyTMYxZqYu+WhPESNN5nDmV3BtE=;
        b=jovK64G6p9G+gR5UigT26jDtRg6EuZzsrXoUKwP30yBghgvF08t/af7k8Gs+z6IYVg
         OIJBn+II2Zc+SWuCdSXEwZWWM0LZ8vXojoO5sKAOx+UcHdiMFAYgDg9W2FHm01PgwfHm
         pIgG+1rLi8Yh2xok3cVvCItLAVX2reMexz1a+eW/9byBempMCjAGQdGFVzMQ2RIyRbf3
         73aUc5aMankxucOBwtzeuI0Uz1gK3wUsS8yIBNqmy8L6LOcIG2Ot+BiGy/WoArCzPpLX
         cwXDL9taHB3kiO7XhfJepFHCXXScqtIIObOTHsFlW7u6quNfPpGHhRmvRYRz34Tq4DR0
         kbdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXY91qUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea11-20020a05620a488b00b00781634089c1si1982301qkb.521.2024.01.05.07.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:44:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXY91qUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmNC-0006lI-Tq; Fri, 05 Jan 2024 10:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNA-0006UB-LY
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:36 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmN8-0003Kh-SO
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e3712d259so10384735e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469473; x=1705074273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xMSbSX6JUqisE+ZC80AlkX0gZxRGpO/C3MZvmfxXXw=;
 b=LXY91qUUH1TUmvuQBu09q4hAozPHbS2k9DAfDt+/kStq0aiWQuk8boP1tWxU2Iz0Mh
 2Z0HidpLfbAgEh17zxkdnnTO4ZQfFVJx4MHAnX3PKLxnNlSwXMUpnmQYfZgSZ5sOYVLZ
 WpARwsXsNNln+7mHTjrtxAUXSVnFfHrsggqDP67xhFo7+v1Hf2ngjOz924Wxvl62fZxk
 K8+Vik8J75c/9euLvAyAHXR2QUaervBwNX2FCxkN2I+UEF/F8ol+SFH8RFmvQmCUIsf4
 1FRXD9L4RLmCt1GABjhBFmDLrWAHa6Yf8iNcWA2PHyTfU/iAyZ17VvmWA0MRD9pkzCci
 0+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469473; x=1705074273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xMSbSX6JUqisE+ZC80AlkX0gZxRGpO/C3MZvmfxXXw=;
 b=pHSuF8aM3FiHdXskGCXYFx0qBU/lP3g/q0p2q/QQpUP2+0udgWQYf0ZzsPVGOPOo2z
 hUpXIz+PGRoYTwAYLU6Yfjn2mzDMCX5pYIvZtNhEZk/x3YgesCRVrcLocD93iAUsGk2r
 8rdkJcQm7FD/yy7krT2IAfTjnWynyIjeCCTASqcK/0WvDViwsrPdkYokGVxlKVCbMyjI
 m0eMHMPo9ErWLLFFOTvS+6eSg43/DgcuGuGx2//Rwi7OlJStnPuXEbH347zuVO0aE4uw
 wqQVYuiuF62fbjTQd9MWGdEZrQtqZAnTi3GAL7loiT6XxONVPh3M4t2DpkALyzDtcI48
 vgoA==
X-Gm-Message-State: AOJu0Yx55aq1+rt+Wp0dIUKqzNoyUG4TTwrSRhQ6GE0HneLpBtPVo2tl
 B10HlpHg5RmlHq7qYWT9qy6RrslID+KahP0hpOt6mhRaFkY=
X-Received: by 2002:a05:600c:19c7:b0:40c:2671:1553 with SMTP id
 u7-20020a05600c19c700b0040c26711553mr827570wmq.36.1704469473620; 
 Fri, 05 Jan 2024 07:44:33 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 fm26-20020a05600c0c1a00b0040d5e53d7c3sm1972654wmb.23.2024.01.05.07.44.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 14/71] target/m68k: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:07 +0100
Message-ID: <20240105154307.21385-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: T8yzxxZsiqMG

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-m68k -cpu ?
cfv4e
m5206
m5208
m68000
m68010
m68020
m68030
m68040
m68060
any

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-m68k -cpu ?
Available CPUs:
  any
  cfv4e
  m5206
  m5208
  m68000
  m68010
  m68020
  m68030
  m68040
  m68060

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-15-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/cpu.h    |  4 ----
 target/m68k/helper.c | 40 ----------------------------------------
 2 files changed, 44 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 6cfc696d2b..d13427b0fe 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -556,8 +556,6 @@ static inline bool m68k_feature(CPUM68KState *env, int feature)
     return (env->features & BIT_ULL(feature)) != 0;
 }
 
-void m68k_cpu_list(void);
-
 void register_m68k_insns (CPUM68KState *env);
 
 enum {
@@ -576,8 +574,6 @@ enum {
 
 #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
 
-#define cpu_list m68k_cpu_list
-
 /* MMU modes definitions */
 #define MMU_KERNEL_IDX 0
 #define MMU_USER_IDX 1
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 0a1544cd68..14508dfa11 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -29,46 +29,6 @@
 
 #define SIGNBIT (1u << 31)
 
-/* Sort alphabetically, except for "any". */
-static gint m68k_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_M68K_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_M68K_CPU) == 0) {
-        return -1;
-    } else {
-        return strcasecmp(name_a, name_b);
-    }
-}
-
-static void m68k_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *c = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(c);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_M68K_CPU));
-    qemu_printf("%s\n", name);
-    g_free(name);
-}
-
-void m68k_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_M68K_CPU, false);
-    list = g_slist_sort(list, m68k_cpu_list_compare);
-    g_slist_foreach(list, m68k_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
 {
     if (n < 8) {
-- 
2.41.0

