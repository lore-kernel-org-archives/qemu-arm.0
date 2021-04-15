Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp775315lfr;
        Thu, 15 Apr 2021 11:27:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfMOE32Y8QyeeQbhJgX6X2hpRmmtLTFAWU7q7lAprTwl13XReAd5ahzXF0dmcwL06PmGT5
X-Received: by 2002:a05:6e02:13d3:: with SMTP id v19mr3691449ilj.56.1618511252436;
        Thu, 15 Apr 2021 11:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618511252; cv=none;
        d=google.com; s=arc-20160816;
        b=nGcdxjgOAgR+RZQrYuzdNVxd3xW3vTq2dWsDYsSJTWXg+WcDvlvBt5Xxwa5qvPrlLU
         oC4/LvEvUl3zq6oo5jsWGgJC61YwoDfeShUeW7hg1ZVoVtxYaOne1jdz/gsg0KTqmhEk
         KWBkDBLqnM25U/HyPkELvY2pmdGU/EGa5N2tO5j4S9l7riqCt9NFwsWmhsOP5nSo1fy2
         NW+kwNPwEkounXbDuNcvDXA4hsbGG0EqW46/ebbJ1JOGdeWN/xDJNsL9vMdN0CrMtUWw
         U00sCe3E1kcC96GLJW2z21SvL/+D70R24xWoQUmzUKHbOvgOiBHhigsH9Qg+E2xqxNcq
         gCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=juT4twg37Pcety9e36P2vwj5M6pr9ePm6rB/ZDzuhtI=;
        b=Vq6VjH7x3J/4k0W0lSYT46K4aZw0NpV13AmXMtuNbMYZK2Z9oiCu/6ZVwGC3J6DRXG
         D/rnRC126oYfuYLK2hHpNd+QPs7voxAJK40wk7xe7ppePW2KYlcv0kk+1a2O6/9CMGkr
         V6XIk/8EYhVChf6dY0Yy+QSpfLqrOlxgRRI0Xu70KAeCBSKPEc15nNcRnYu2vzC7kKhW
         tLwUPCUnOMYAbNJQ04reVHYYZzFG2z/3hVOKwrA2r4X5eSX++4/YskQF1eJc6rPkU5rv
         JJX5IP0nusOt9TEOcsam7EODTJTzwsJk97ZNpUdeIw+SrCRwC25ERtDAEbW0U7+sVrOv
         5EPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2rXsORH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si4309446ilu.8.2021.04.15.11.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 11:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2rXsORH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX6iB-00029o-MS
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 14:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX6ey-0000sz-JP
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:24:12 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX6ep-00013t-GX
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:24:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id n127so1190959wmb.5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=juT4twg37Pcety9e36P2vwj5M6pr9ePm6rB/ZDzuhtI=;
 b=A2rXsORHU+GxNuserKOfpcemw3DkjwSQnxJs/7t1y+pUcCHqzg2V1Thrm84McgKuQk
 uvjAJgSC/nsTl/yrz/pA8rPi8IoEw1bw01kqg59pjSAYJWPb0W6ssI9GW98R19onXXDq
 rpwWOIGG0vCDOh6eAKxxYE/J9KGBjSwWo/VHYFzZAgjItJ3/XJCc0HYhU7oQLIahlhiA
 bB4Wd3sNskN6JZFpOB8jBvmdOD5GnKdvOGHa2jaVGJlgQCv+wwODKsxh9nTYNau/2ML6
 FPyXdbcOy/bWQP0b4X9GMYbUx9m67FEZMOJxMCd5YNF8s8MtxJHgW4kgUl08rSQJySUz
 7hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=juT4twg37Pcety9e36P2vwj5M6pr9ePm6rB/ZDzuhtI=;
 b=mauvGv1JDq5LnJm9DRGnjf2UMnBb5VVUFdSQ0mwUnm6kaXiFzG/vQP7s4zayIgO7eI
 szWKKIsSn+SfvInYLudSs2KsxJaxdCrU+XqHufP2dVvr2yN+JE633/xgnXmKYrj9KKhQ
 zqr2AArYUcQ0DbuamCafzhtswtno8b8UVqIiUzE0QIRfd4SnKf/nPQHlD7qGTbgpew/6
 uZxPe9bt6v4otpcwrlwDPqOyzh79tqKUt03O85McAy73TX1m/L4HlTFvW+stMXPR5YvD
 48qF2U6Q6MmNG3wVZ1b1J7lhQDC1Qj+uD3bvjwXC3upD/8Js5KLuVztOUm+v7pFG3d0l
 8EPQ==
X-Gm-Message-State: AOAM532s1pitNwis7ukFvN9yDbr1LIrpuwcEaZUE2az/T6JrikXLAsWq
 5KAn0T4axaPRItCEML0Hwo09aA==
X-Received: by 2002:a1c:7207:: with SMTP id n7mr4320611wmc.11.1618511035791;
 Thu, 15 Apr 2021 11:23:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g9sm4182907wmh.21.2021.04.15.11.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 11:23:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0?] hw/arm/armsse: Give SSE-300 its own Property array
Date: Thu, 15 Apr 2021 19:23:53 +0100
Message-Id: <20210415182353.8173-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /qPJn62oIDk0

SSE-300 currently shares the SSE-200 Property array. This is
bad principally because the default values of the CPU0_FPU
and CPU0_DSP properties disable the FPU and DSP on the CPU.
That is correct for the SSE-300 but not the SSE-200.
Give the SSE-300 its own Property array with the correct
SSE-300 specific settings:
 * SSE-300 has only one CPU, so no CPU1* properties
 * SSE-300 CPU has FPU and DSP

Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a simple and pretty safe fix, but I don't think it quite
merits doing an rc4 by itself. I think if we do an rc4 for some
other reason it ought to go in, though.

 hw/arm/armsse.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index e5aeb9e485f..170dea8632d 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -84,7 +84,7 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static Property armsse_properties[] = {
+static Property sse200_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
@@ -97,6 +97,17 @@ static Property armsse_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+static Property sse300_properties[] = {
+    DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
+    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
+    DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
+    DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
+    DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static const ARMSSEDeviceInfo iotkit_devices[] = {
     {
         .name = "timer0",
@@ -519,7 +530,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = true,
         .has_cpu_pwrctrl = false,
         .has_sse_counter = false,
-        .props = armsse_properties,
+        .props = sse200_properties,
         .devinfo = sse200_devices,
         .irq_is_common = sse200_irq_is_common,
     },
@@ -537,7 +548,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = true,
         .has_cpu_pwrctrl = true,
         .has_sse_counter = true,
-        .props = armsse_properties,
+        .props = sse300_properties,
         .devinfo = sse300_devices,
         .irq_is_common = sse300_irq_is_common,
     },
-- 
2.20.1

