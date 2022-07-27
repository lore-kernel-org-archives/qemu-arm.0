Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp577919lfg;
        Wed, 27 Jul 2022 15:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vsbXh419Mw8Z6LeEkW60zMysCIsFtf44YmMEBv3Qe66FXSJ4StNcN0KjpqICElIRWMQ4JW
X-Received: by 2002:a05:620a:400f:b0:6af:53bc:7311 with SMTP id h15-20020a05620a400f00b006af53bc7311mr18187557qko.305.1658961634491;
        Wed, 27 Jul 2022 15:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658961634; cv=none;
        d=google.com; s=arc-20160816;
        b=sUMnuBgVjCgVPmxTn2eAnvEUl1xYZ0RgxbWdewoMXUTENASHKVosGYAHqONPYC9EV1
         JDfLy9tAzBdo3ibOdoJ/MuhNjY3b6dEYi+dn8eTmOZpOjs+JMIBvMtet6YNQLiAAczh8
         DsFCSbtzioT7Fl5S3ycs5hv7/z8u4LmSCmttsQ5lNvjaXC5pMbvOja1FEXsBZVTNPOqW
         O+kslxY8mWUO9qcLTJPDtqn/ujzV3tXv6MO5Hk40VgGPnO4JA/aivzHzDGcwG9n3oae1
         RwKdHbZE2yOo4rvQGij3Md6/RBnw35uEF5gXUVVh4eFyNNsELmEnQfPbGDFZxLwGfqzP
         am2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=vO0kXKTMcwuUpIAUwc4vhAKwy0T9O85OT6Aj1EYvbQQ=;
        b=Z32JkGegVejbZUYtxzYVXuRPL1J1X+QvAAIZPefOLLOoDPuUvxXu2TuhKHJPu9EJ50
         jNaABlJgRISBqzjgqW35o9q3m76rqTobschB7VQeYgBdSnKiYNDG0HHMZS3w1p4Xa9zD
         nwK4JU9j1+TxQg6BkdjTEoT1AU1Hx/XFLM67eQU3fYmSyQ9aSBtCJrFUE2XqxBVTaadq
         vtmYBpQKnU/aV9/VWJA3fIoSRXd2NmFR03NbuRZqSC2VYGPNfDg5SEbQrqkbCgGzHLFQ
         n9E0NCl3NGJLCO1oGomV1mUiPZH5DpVDFQmgmnQ54PKiyrY/sRg59xC2EjcqcAFAMF2Q
         NUwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c188-20020ae9edc5000000b006b57d8d7b6csi10705243qkg.360.2022.07.27.15.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 15:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGphh-00052b-Vs
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 18:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgU-0003gt-9t; Wed, 27 Jul 2022 18:39:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:52748 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgR-0007uj-Gs; Wed, 27 Jul 2022 18:39:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oGpgI-002cQt-0E;
 Wed, 27 Jul 2022 23:39:06 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v3 1/5] device_tree: add qemu_fdt_setprop_strings() helper
Date: Wed, 27 Jul 2022 23:39:01 +0100
Message-Id: <20220727223905.624285-2-qemu@ben.fluff.org>
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
X-TUID: 8ullqjJrnSVy

Add a helper to set a property from a set of strings
to reduce the following code:

    static const char * const clint_compat[2] = {
        "sifive,clint0", "riscv,clint0"
    };

    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
        (char **)&clint_compat, ARRAY_SIZE(clint_compat));

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
v3;
 - fix return value for the call
 - add better help text
v2:
 - fix node/path in comment
---
 include/sysemu/device_tree.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index ef060a9759..83bdfe390e 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -87,6 +87,25 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
                                   const char *prop, char **array, int len);
 
+/**
+ * qemu_fdt_setprop_strings: set a property from a set of strings
+ *
+ * @fdt: pointer to the dt blob
+ * @path: node name
+ * @prop: property array
+ *
+ * This is a helper for the qemu_fdt_setprop_string_array() function
+ * which takes a va-arg set of strings instead of having to setup a
+ * single use string array.
+ */
+#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
+    ({ int __ret; do {                                          \
+        static const char * const __strs[] = { __VA_ARGS__ };   \
+        __ret = qemu_fdt_setprop_string_array(fdt, path, prop,  \
+                (char **)&__strs, ARRAY_SIZE(__strs));          \
+     } while(0); __ret; })
+
+
 int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *property,
                              const char *target_node_path);
-- 
2.35.1

