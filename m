Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3313693ejf;
        Tue, 9 Aug 2022 12:11:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5kLOIW94Okbj0mqQ22tTmEVFhRnhe1PoR6RBsDZtV/CXJl6PikXX7IVv6cE5nLHqjr8HoD
X-Received: by 2002:a05:6214:e81:b0:476:8403:d044 with SMTP id hf1-20020a0562140e8100b004768403d044mr20556899qvb.18.1660072314276;
        Tue, 09 Aug 2022 12:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660072314; cv=none;
        d=google.com; s=arc-20160816;
        b=PWmkesFXCU1Uw2u4sowj+cuURZCKjGVi6dmrpKXkHEsx6XldFDAWR97d+wbl6K0NIT
         mWYVPbmIn5QF7cxgXxCl2yeSg42QmkQka0R3oJCbsW8hAyP2AGl9N6eDdcExhd8gCeP+
         9dUbv8pqlE58Av8pSlhXKj43Tp+QoivjLgvv/f221y0hbrcv9orm/oKhDTBb0ttrdvE1
         72cOlhja8VQjBRmXctwMoPs0ZS6obrdg4QAzFvkJeI6oHEr/Jexm3W6p0wzwiXZqe8de
         r99p3R+v654LzTeLSUuUovUH0tvnCvcQUNXtVzgOv9bxwtLR5TKp/FnecG5YcKZkzh2y
         hNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=2k2XfnTnBHoPPx3RIqF/J0uStfuwV/whNXvVqTCzkLk=;
        b=POINWQ5w4PhXOllTT+Tcf23c4GqtYJbsK4bNHfWCKgvhfW0NcM7p8dQ7FMsU3ojMTh
         XUsEkoeaioSStjU56hQYhDT9jQaPnMMqKLTKMpqMCfkscm3I2oiiVBTT6GwVIt6z1nc1
         lHVuun/U0PFXZw90eDN7MQqSXg3NY0agS4K8oGsOG3N0rrzEXyma/Bpz2qBjESTwMP8R
         oP7S83wSB59XbhyBCMcWXvYyRCY3EzCLT9JgWqZ7+8pLr4OUajlL7TV0EutCmPbjoHeb
         2HJFvHT+4xF4g1opw2RPxS3PONtlpRkZOGJh+UXEjj8Q0jODnRN+JEGUe0IQiweVKS44
         lnsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020ac81492000000b0033f447145bbsi8298153qtj.309.2022.08.09.12.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 12:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUdt-0004cQ-Pp
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 15:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ8-0007KV-F5; Tue, 09 Aug 2022 14:57:41 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:57398 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ6-0003AY-IV; Tue, 09 Aug 2022 14:57:40 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oLUQ1-0039Dt-0b;
 Tue, 09 Aug 2022 19:57:33 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v4 1/6] device_tree: add qemu_fdt_setprop_strings() helper
Date: Tue,  9 Aug 2022 19:56:35 +0100
Message-Id: <20220809185639.750345-2-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220809185639.750345-1-qemu@ben.fluff.org>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zchKqCWcPaYX

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
index ef060a9759..d5c05b5ebb 100644
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

