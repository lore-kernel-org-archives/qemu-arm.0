Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp894767ejn;
        Thu, 20 Oct 2022 23:24:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FvJbheoKBXFVvT2zGj0veCA4+pCUrb9QH9ZswgzBF+77NMOUB0S75wC7IRpdc9f1ygt3k
X-Received: by 2002:a05:622a:1109:b0:39c:1d87:3b6c with SMTP id e9-20020a05622a110900b0039c1d873b6cmr14262968qty.139.1666333472329;
        Thu, 20 Oct 2022 23:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666333472; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8HJPxLMHM8izf51po0cjG8V1hvHQtN2P6aVz9264tJcXTvArc80adkislMTJqebj6
         tx8mtrOAIT9OAle7d1yKc8OANkIAFeC8u5OlAWvDMuDcAN5XHVIMHt2ootXG6WJVw+3/
         DslUFQ1LGZXLsPeOGhofsEnuuP5wifLTYbQUTDioIs1mQI7szgcRdjFQBasD5oNNPzSa
         gAMn1XKGZoE47MKIVGjjxWoeN8Zs7ySsFLBHvzCiY8IP1SjjfZxkWx5XkJ6TK/pr5+e3
         qSS4mpf9zFgUR+MYpWNSO6d/7bqP/kJEonYBktYsLYXw//zPGwKToTOvlzEAw06x9Yh/
         VJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ecs/Vyem+eoDIAn8cJsiFAERBoMarkbTVGrxbcGqKAg=;
        b=IDMdp+vW09aw24DnF+HY8AQkqPd9LAPmyDBXyWiZALqmBftQwxUBU7VYEFEJ8ap+SC
         hzKQNOqRKE+dpWO3BUeeBUtq1V2UB0bEIXNMqMsEcgJacOrZBEZ0RpfR56TJhKp6lUFp
         xerdOjoq0+Buwkxya0n0ySzxvqsc8aVIlSIWZCTIJE7FS57KIKkJBQqlnuQqRQUiJk2S
         WVRi5VfLjsG9UuHYpLZZbmh0LE0IRJL/Uo7kU9ho3Jx5TOtx70wt1tsSCpiwGiKrS3/i
         doOTLtx5+s47OA9pYYPZN9wiIWQ+c2xr2FEilLBoLJFxqOS2DUZVnAseK9j8tXxQdBPY
         skAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a05622a01c500b00399c50c71c2si14004334qtw.12.2022.10.20.23.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 23:24:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ollSJ-0005k8-PK
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 02:24:31 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oll33-00016n-Qe
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 01:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2w-00011g-1b; Fri, 21 Oct 2022 01:58:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074N-5h; Fri, 21 Oct 2022 01:58:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0R-2O;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v5 2/6] hw/core: don't check return on
 qemu_fdt_setprop_string_array()
Date: Fri, 21 Oct 2022 06:58:04 +0100
Message-Id: <20221021055808.342055-3-qemu@ben.fluff.org>
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
X-TUID: sX5jc2fKGEyR

The qemu_fdt_setprop_string_array() does not return error codes and
will call exit() if any of the fdt calls fails (and should print an
error with the node being altered). This is done to prepare for the
change for qemu_fdt_setprop_strings() helper which does not return
any error codes (hw/core/guest-loader.c is the only place where an
return is checked).

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/core/guest-loader.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index 391c875a29..c61ebc4144 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -57,25 +57,17 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
 
     if (s->kernel) {
         const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
-            error_setg(errp, "couldn't set %s/compatible", node);
-            return;
-        }
+        qemu_fdt_setprop_string_array(fdt, node, "compatible",
+                                      (char **) &compat,
+                                      ARRAY_SIZE(compat));
         if (s->args) {
-            if (qemu_fdt_setprop_string(fdt, node, "bootargs", s->args) < 0) {
-                error_setg(errp, "couldn't set %s/bootargs", node);
-            }
+            qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
         }
     } else if (s->initrd) {
         const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
-            error_setg(errp, "couldn't set %s/compatible", node);
-            return;
-        }
+        qemu_fdt_setprop_string_array(fdt, node, "compatible",
+                                      (char **) &compat,
+                                      ARRAY_SIZE(compat));
     }
 }
 
-- 
2.35.1

