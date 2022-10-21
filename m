Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp880702ejn;
        Thu, 20 Oct 2022 23:03:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6dl4iPOtSzLhw8rdmpDpHphFqkdDhujD7by7jc2qXFyJ+7y4pZ+Nf2k83x0Y2VxSZxaw8X
X-Received: by 2002:a05:620a:258a:b0:6cf:ca19:1ec2 with SMTP id x10-20020a05620a258a00b006cfca191ec2mr12883535qko.630.1666332205041;
        Thu, 20 Oct 2022 23:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666332205; cv=none;
        d=google.com; s=arc-20160816;
        b=Xe/CxSXmIDbtofHnnSY1g0o8EZGLkrqbLcyuvLTzcz04lhFWowI48sXITLyVQOB9Cv
         T5whCSHXHx9eIhyQDCJI8D0S5iUKUWMwDu5Yc0hk1qP558LNrSGDEERZ6xfgrPPrbfl/
         U94p7VXVdkeD3+JhmQ3neBcPGrrPVQZ0UKWRPAR0GJecUBQWY7hggThc33OYJ2bQ8FIB
         HdLi20Pg964HNSdyXWwgUwW0GZ+gSIpIUfA3+6h03dtkqZvmC4fjlSMgSdj2+qODhbop
         4A/8QpFUvkEquqKMYWjPhW5mK4+4NqNNMWxg9ftLHRywJz+QpOxMYQaKhbxAENM8l1xn
         BqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=UCzHEKgd0cqn/X8p1FTJkrSOpBscaOTNx4AtEm3g4uc=;
        b=I+kRLnEqnvK6rPcPDVsHAdkna3syRdpvQO0yaXlMMyD8e0qqIJyLbrpbL+jB6dSqXy
         tB1ib4S/qsPxctOdODhqlYfbghji9lfru/QcMt5Cf7Pq7JRfWWzXpfAxuBdjq6SAjShx
         sRcVo32oLBiRnF0HxgKjDqGoYuiNesSADOA7kvNAhRmCtX/7NdNN7d4fmlULsSMfxgW2
         ZVkhRwQpvRB1FUebBmQEf732x0dpAmc6lZ93iScSCjjX1KKKJPUH40L7IvJM8tRffwnK
         SDX9QR/32RUjqe3Z7HasVGEJjRl2YR3+0bqg6pn84M0XJQhYS79NXwXRfjtIWVo67/Nr
         GhOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020a05620a28d600b006cc634e53dbsi13244721qkp.270.2022.10.20.23.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 23:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oll7q-0002N5-Uk
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 02:03:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oll2y-00013l-MV
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 01:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2v-00011a-RW; Fri, 21 Oct 2022 01:58:17 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074Q-2q; Fri, 21 Oct 2022 01:58:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0O-2H;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v5 1/6] device_tree: add qemu_fdt_setprop_strings() helper
Date: Fri, 21 Oct 2022 06:58:03 +0100
Message-Id: <20221021055808.342055-2-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021055808.342055-1-qemu@ben.fluff.org>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.4, PDS_RDNS_DYNAMIC_FP=0.01,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-TUID: LrpXRY6Md/g+

Add a helper to set a property from a set of strings
to reduce the following code:

    static const char * const clint_compat[2] = {
        "sifive,clint0", "riscv,clint0"
    };

    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
        (char **)&clint_compat, ARRAY_SIZE(clint_compat));

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
v4:
 - go back to the non-return call, no-one is using the result
v3;
 - fix return value for the call
 - add better help text
v2:
 - fix node/path in comment
---
 include/sysemu/device_tree.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index e7c5441f56..cb49df471b 100644
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
+    do {                                                        \
+        static const char * const __strs[] = { __VA_ARGS__ };   \
+        qemu_fdt_setprop_string_array(fdt, path, prop,          \
+                (char **)&__strs, ARRAY_SIZE(__strs));          \
+     } while(0)
+
+
 int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *property,
                              const char *target_node_path);
-- 
2.35.1

