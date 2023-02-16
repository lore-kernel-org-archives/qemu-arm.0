Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp439461ejb;
        Thu, 16 Feb 2023 04:27:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8sxrtp2ZNgbeMVWruP9meAT4YNGFCsBFTb+aCrfv+1TlevpMl+Qam1/x5n7yN9hU8VYSIO
X-Received: by 2002:ac8:5c82:0:b0:3a5:1ea1:bae2 with SMTP id r2-20020ac85c82000000b003a51ea1bae2mr9926875qta.34.1676550424953;
        Thu, 16 Feb 2023 04:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676550424; cv=none;
        d=google.com; s=arc-20160816;
        b=ejgWfcp/LbcvJWv21/rF0mjE6TTBa+uHjDThyrnVTc4K/s8G4JrFtTF9ssSZzfEeg0
         Tgl8SQZVoNtGmCH9ieOcjHRBysV0A5OR3W3lteuOGx8ioLDI36TTfGwUafEBM8qagSiJ
         4D+0XRWB0Fm4EXz0M0KfaJLEnjC1pWv94M6re6tgdfOoBzdgiIiotfjhFiX1XIryKmlM
         JudXU2InPWslUzFH6FJTu9zfdaF/cAwAlVKV8ZswyO64YTEv7VPLlABJlUJlaW/cYoH8
         9za6MmcfHtXmaiF8s7M26o8a/9UA8Tg9QxGsb7OT2jHfNs9JtZU2klS2ENc5vmzvNWGC
         BweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vXaKAK994idnw+4qe0vPaymYezvQPE1zxpNZ2GlwOtY=;
        b=mx4Y3jIeW2ae1urelkwvyzaoz5hbE2sBthzlRjyHEJ1VfXnPhkIpVRqNEzp/AZhxTL
         VS+qAOFcgvzeYKBgpnYB47jpYx6AjOGqAuVa2GF8jVZTYaGgxb3j1tfdYGaQDMSjAzX5
         cNVB/BjjwwkU/ITrf3hpWWT1c0Hf6WiVA4lN0XcMo9AYJY4q5l/0URhavOsQd/m7xSgS
         e/pgXdoklwH1c4lTI7uEQPaFFAB2f0QLHQUF5J4yE5wkTf5xRhzdBF2Rntfc5E2wUZiz
         zITx1iu366Yp26Nrrx8t/yjg7l72VgkPReAzOpM4+zCkqR7+t8dphR7G6elmA60YVQ+o
         4F5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYhiLdvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020ac857d0000000b003b9bcfd81d3si1521475qta.530.2023.02.16.04.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 04:27:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYhiLdvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSdKj-0002m6-Vv; Thu, 16 Feb 2023 07:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKh-0002iv-R2
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:25:51 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKg-00086N-3h
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:25:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id by3so1653081wrb.10
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 04:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXaKAK994idnw+4qe0vPaymYezvQPE1zxpNZ2GlwOtY=;
 b=TYhiLdvIy3/9XqbcRntWNxRyLPiuO0xeG0JeiBg3qJFr4UXK/4jjCe5YpO1MCqhBAS
 xN2jBf77sOM5tplhAc4nm8JkJW/XDWCDDIkobOPk+YVb0A1pFPCHx9mDDAhyJHdbFYY0
 zrS2PBh2TdDwCBSRqDKlJxA2hnL9EtGY3aGcC9Hk3w8sbiJQUPS1cSs/qZYwt6MWCUYi
 mkQaM6ALL74/ItMmwtrWiJA/s/a696+u4sSjKtmDFJz4oVt/X+gBLGRn2QULUv8iq9Yk
 +Lrgm/QJ3IdInzT3ZJoChp2qrBh4niSOcO21EKYL3LAoaUM8Xv5If9Y+3Gxuecwjp1Gb
 dtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vXaKAK994idnw+4qe0vPaymYezvQPE1zxpNZ2GlwOtY=;
 b=qY2KGbtQdVqQld4AcAH5ct2kZy6denDvV48KNiHMGXDLSR0ir3i13YwsbH5yTHfD1z
 7OjWuJs6E5iWusUqng/4kDHyfwGVh9zNkzlvyoE0p5mzthZPBpXoONuklSVuG1hLQzwG
 q0gc3Kb5WNlUoYzZuc54UlnKKBBlxezKYDEmJmtQTdFkygebJhp9KMyihhue8uKsJ7Z6
 xeOFjSGyvksRcHYmh/uMkNuThkp6dHKSvSVWAzWkoyIQoNRNumS+tfVdIBDhnN3RcEDJ
 IelrL0aeuC3CwssGQvwhl8aLJz1bd8MG8wSZWwBRVYsPlpovoyvPbRFQfmYbVDahBk/r
 ImHg==
X-Gm-Message-State: AO0yUKXRwxwE1dNNg6ye37UNamhwMtqwNdL3wCer2b0wNQa73PxZp2Lm
 H2NTXHrpxlPYQ1v+27D+QnXknw==
X-Received: by 2002:a5d:6a8e:0:b0:2c5:561e:809b with SMTP id
 s14-20020a5d6a8e000000b002c5561e809bmr3715424wru.66.1676550349391; 
 Thu, 16 Feb 2023 04:25:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a5d46c1000000b002c57384dfe0sm1369835wrs.113.2023.02.16.04.25.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 04:25:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 4/5] hw/nmi: Simplify nmi_monitor_handle() and do_nmi()
Date: Thu, 16 Feb 2023 13:25:23 +0100
Message-Id: <20230216122524.67212-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216122524.67212-1-philmd@linaro.org>
References: <20230216122524.67212-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uzcnDUkR21rd

Since the previous commit, object_child_foreach_recursive()'s
handler takes an Error* argument and return a boolean. We can
remove these fields from the do_nmi_s structure, which then
only contains the 'int cpu_index' field.
Directly pass 'cpu_index' as context, removing 'struct do_nmi_s'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: please double-check...

 hw/core/nmi.c | 41 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/hw/core/nmi.c b/hw/core/nmi.c
index fa74c405f7..f5a6483e89 100644
--- a/hw/core/nmi.c
+++ b/hw/core/nmi.c
@@ -26,51 +26,22 @@
 #include "qemu/module.h"
 #include "monitor/monitor.h"
 
-struct do_nmi_s {
-    int cpu_index;
-    Error *err;
-    bool handled;
-};
-
-static void nmi_children(Object *o, struct do_nmi_s *ns);
-
 static bool do_nmi(Object *o, void *opaque, Error **errp)
 {
-    struct do_nmi_s *ns = opaque;
+    int *cpu_index = opaque;
     NMIState *n = (NMIState *) object_dynamic_cast(o, TYPE_NMI);
 
-    if (n) {
-        NMIClass *nc = NMI_GET_CLASS(n);
-
-        ns->handled = true;
-        if (!nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err)) {
-            return false;
-        }
+    if (!n) {
+        error_setg(errp, QERR_UNSUPPORTED);
+        return false;
     }
-    nmi_children(o, ns);
 
-    return true;
-}
-
-static void nmi_children(Object *o, struct do_nmi_s *ns)
-{
-    object_child_foreach(o, do_nmi, ns, NULL);
+    return NMI_GET_CLASS(n)->nmi_monitor_handler(n, *cpu_index, errp);
 }
 
 void nmi_monitor_handle(int cpu_index, Error **errp)
 {
-    struct do_nmi_s ns = {
-        .cpu_index = cpu_index,
-        .err = NULL,
-        .handled = false
-    };
-
-    nmi_children(object_get_root(), &ns);
-    if (ns.handled) {
-        error_propagate(errp, ns.err);
-    } else {
-        error_setg(errp, QERR_UNSUPPORTED);
-    }
+    object_child_foreach_recursive(object_get_root(), do_nmi, &cpu_index, errp);
 }
 
 static const TypeInfo nmi_info = {
-- 
2.38.1

