Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp794228ejo;
        Fri, 5 Jan 2024 07:48:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqCWG3zEXjOqGTq8GF2NrJJ54N0zvFKX7w9oteS0a9xSn5khEAtI9cBF31bCI7EavHxMs4
X-Received: by 2002:a05:6214:d66:b0:680:5bd4:b4b7 with SMTP id 6-20020a0562140d6600b006805bd4b4b7mr2682999qvs.113.1704469710471;
        Fri, 05 Jan 2024 07:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469710; cv=none;
        d=google.com; s=arc-20160816;
        b=sSQXjZvnKfw68vNEbOk0nYOm9atIYxQXvmG0EnGJl5Xxb7bbmqimzysKFX8fDUFS82
         ge/UAjBS0SUazTqk4sVxC0K7Uelq9jYQZCsIayhs5YCKSURZoYXKGW8Ll1R7Kx2EVYWM
         4Answxl3yDVxCDWT2lwRZU/ggzN83WMXz6PZFL17l2wR0YV5Fd8iKn/LpEnhVWMAxkjD
         yYtTVyhzU2aIFj2mD/jyHzX+k0VsKrClpW4A/2A/EHmClTZmDxpgWSvtsoylaUEUrNoE
         N6Ip2fCXMxk0bN+SRIWCEbj12YwnBFngg/8PLDZ/wMkLNdljInDGD9jRDTuxgk5FQakO
         Bodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T2dHbEy97kiYKLMLDn2+e8bN6W1pBXRM0uBjrESXiSY=;
        fh=tROm31tyoJcOlKLqF+Vl530andyBxyZ444yuWCVrtms=;
        b=SSf7u16W0N4j5R01I+HaKTwuWbtUE7NsGG0tnhfEp0JY/g1P/q3qGO3BGspMGvmfSv
         ShK8TSwvXbzMHY4bLV/7KMI1h1VRPhS0gLaIDZ9Pz2B4tRyqImSJD26uT/zE3X8sBV4P
         xLNnopWNfUe2JPDUZNwgz+2+sJX+gqDqb/0maZUiBaAQ7ASpyLxpnvpN+00xwrk43aiS
         Pszxqe9sMEO7O/l1trKaXIuFvL95Y76fdQcleJAQzleXHMsqAxtVYydmOfHu6ieLRTuM
         uCPiebLCAI1+vLboygSmk6nONjPRPKq+IdwWAnbrRlpi7Vdk8tD3A1M2di+07t7NvRo+
         Cujw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBOGvIPL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020a0ce014000000b0067f1a4469f6si1961118qvk.437.2024.01.05.07.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBOGvIPL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmMo-0005Fa-Ph; Fri, 05 Jan 2024 10:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMi-0004sB-Jp
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:09 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMg-0003Dd-UM
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:08 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e353c8d75so14561945e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469444; x=1705074244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2dHbEy97kiYKLMLDn2+e8bN6W1pBXRM0uBjrESXiSY=;
 b=ZBOGvIPLJTGuTvxZxFQsst4Jj8nIUCkX9RExawr2nM3HtE3xZ54Y1YeQGhRQeHMkTt
 tgk/zCqcNTK29KZEEOo0VRvQdFC/x8bhdxPiMB3Z1MFrW+UmV3B7FZhYUbn5Ru0Dbz82
 dQDXwU7LfDVDdAgD33tZDhmUrrUJTVjA8tgHPQmenjGJ4jeomIi6+NX4Y2OQVks5OjCS
 LWfLbAkhtElDHngHLq3+HHiNtY805W1LCfGzuCOrO4vNHKvlhQVRwEb5oYdDdWaSzBpT
 kX0zd5qcjw6SD+/sVNoWURxBTQTqcU8z6Vr+q9n53AOG2Fy5KZhZbAwYhaog2pp5GJrd
 iB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469444; x=1705074244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T2dHbEy97kiYKLMLDn2+e8bN6W1pBXRM0uBjrESXiSY=;
 b=S+4bgV+dd9IUfqkp5M9puGwg49O0ecAokSv0MHDU6zWcLUKCEFsx9wHE2BqRKSRPNL
 iTxj09/CaY4JAMQMRLSflpEgAxZReBdPk7VKhbP4HSFBZ/nB4nzD+8TLCWNup0Z6G4vL
 r4j30XXBucCkBddj5cAuJyrzdtiz2skz7nfBSFQHyNf/cbOQX+zmebvQLgSsGu3eZWHP
 X9VIG+riQp+RuqN2PUVb4uafug9tMUc+aO/dSb6g6Nnb/N9t7QuKYJDRCCZBCRcAbX3a
 o8ZIYloGwzxijvyQSv4vYJG29owyeBFCmZEaVTxeDK727bsKVV/k2GT/01qU7R0Px07b
 L23A==
X-Gm-Message-State: AOJu0Yw20h1RpkBeIi3Sx3mmumknPyUogHG+wyoe2msUbrwap9K2BET3
 kaG6/PfBi2mFu7MeM5dCvOsAagzZkb+blA==
X-Received: by 2002:a05:600c:8515:b0:40d:5a9f:2b59 with SMTP id
 gw21-20020a05600c851500b0040d5a9f2b59mr1265328wmb.41.1704469444712; 
 Fri, 05 Jan 2024 07:44:04 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0040d887fda00sm1904820wmq.26.2024.01.05.07.44.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL 10/71] target/cris: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:03 +0100
Message-ID: <20240105154307.21385-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: UUapEeM1KN90

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
Available CPUs:
  crisv8
  crisv9
  crisv10
  crisv11
  crisv17
  crisv32

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
Available CPUs:
  crisv10
  crisv11
  crisv17
  crisv32
  crisv8
  crisv9

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-11-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/cris/cpu.h |  3 ---
 target/cris/cpu.c | 38 --------------------------------------
 2 files changed, 41 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 1be7f90319..d830dcac5b 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -287,7 +287,4 @@ static inline void cpu_get_tb_cpu_state(CPUCRISState *env, vaddr *pc,
 				     | X_FLAG | PFIX_FLAG));
 }
 
-#define cpu_list cris_cpu_list
-void cris_cpu_list(void);
-
 #endif
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index a5083a0077..9ba08e8b0c 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -99,44 +99,6 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-/* Sort alphabetically by VR. */
-static gint cris_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    CRISCPUClass *ccc_a = CRIS_CPU_CLASS(a);
-    CRISCPUClass *ccc_b = CRIS_CPU_CLASS(b);
-
-    /*  */
-    if (ccc_a->vr > ccc_b->vr) {
-        return 1;
-    } else if (ccc_a->vr < ccc_b->vr) {
-        return -1;
-    } else {
-        return 0;
-    }
-}
-
-static void cris_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename = object_class_get_name(oc);
-    char *name;
-
-    name = g_strndup(typename, strlen(typename) - strlen(CRIS_CPU_TYPE_SUFFIX));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void cris_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_CRIS_CPU, false);
-    list = g_slist_sort(list, cris_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, cris_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static void cris_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
-- 
2.41.0

