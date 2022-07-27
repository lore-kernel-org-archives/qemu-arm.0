Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp577705lfg;
        Wed, 27 Jul 2022 15:39:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzP6AZnHXCrZAbkYiTHYqEWFYS+wCOhejj5ME1Ta1JiBCkvoL86p/N6pfNvtbyliej7ZJ+
X-Received: by 2002:a05:622a:18aa:b0:31e:df7b:275a with SMTP id v42-20020a05622a18aa00b0031edf7b275amr20905764qtc.242.1658961597047;
        Wed, 27 Jul 2022 15:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658961597; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoUks/2RO6GJA3BBdxpV8JGS0IbbbbxQDl8eIeaPD6nDVcHM72Q39gtm83aDQai7lS
         ky/PMFqHbpmRIiolWgPWm7vMayHhaUdAHy5YImtCw3fjgnNWGMLtwZSiSEHZ/ATizKqg
         K5l7cjlfeRSNe4g6we1myh33zr6VBPRZ+h0J1MwjFhMXkWUjyoXMWE9ojfV9I7qX5pmh
         mfSvT/B9a6JwCuMTpkAd41kqjgTrKAx7DJ0njmavlFojLXOBk3dgebXXAxxu1qRyZHGp
         DgC7qOwR5sBEZatREwSbY4Z1iF0ClODvxOxllPW9mJY659/HCzKNs0TMh1WwmfrX73qp
         K8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=5Gfz5/kMJGv5Ow46zP9vGdVcH8wqI9uG01vaaUBktvw=;
        b=KzKAhumqhibebtt0i/dVEyeMHCa1qJvOs/EpB5TrMrtfSY/F3M0dEbnLDKC3X2S/gD
         8xu5OPSAJaJh6sb5FYV8kG+G37GS65Vh90EPeTCpF6Jz3WXmqyjl2MQ638ZK9Cj2xmgf
         JhjeO9QcQguvUUICU2ScJfMEyRuDlW4yacosnYaRDHJMtuW/nbngpgc8pnNL1OeZBC+R
         zWB/KRp4L4m7XM0EMVDNJxSWW1cH8jZdzo97ilYV0dYFsjhiwf0J1vd33myGzCqibvky
         AfBTBLsO6owsI/H0DZkX1b60tG99gh/HQqrIZjvlFVNGOQCszOSBnLaNSiMpEIzAq4+g
         6/Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11-20020ac8710b000000b0031bacd28153si9430169qto.554.2022.07.27.15.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 15:39:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGph6-0003lw-Dy
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 18:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgU-0003gu-B9; Wed, 27 Jul 2022 18:39:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:52722 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgR-0007ul-JX; Wed, 27 Jul 2022 18:39:18 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oGpgI-002cQz-0S;
 Wed, 27 Jul 2022 23:39:06 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v3 3/5] hw/core: use qemu_fdt_setprop_strings()
Date: Wed, 27 Jul 2022 23:39:03 +0100
Message-Id: <20220727223905.624285-4-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727223905.624285-1-qemu@ben.fluff.org>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.187, PDS_RDNS_DYNAMIC_FP=0.001,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4zg4EVR4ShKg

Change to using the qemu_fdt_setprop_strings() helper in
hw/core code.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/core/guest-loader.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index 391c875a29..203090503e 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -56,10 +56,8 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
     qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
 
     if (s->kernel) {
-        const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
+        if (qemu_fdt_setprop_strings(fdt, node, "compatible",
+                                     "multiboot,module", "multiboot,kernel") < 0) {
             error_setg(errp, "couldn't set %s/compatible", node);
             return;
         }
@@ -69,10 +67,8 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
             }
         }
     } else if (s->initrd) {
-        const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
+        if (qemu_fdt_setprop_strings(fdt, node, "compatible",
+                                     "multiboot,module", "multiboot,ramdisk") < 0) {
             error_setg(errp, "couldn't set %s/compatible", node);
             return;
         }
-- 
2.35.1

