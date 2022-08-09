Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3312300ejf;
        Tue, 9 Aug 2022 12:09:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6zLvEMMhefUmAArjp3u002Ud/2D6yPdd22vFEkrsokSOLXpWOkiY8fCJGYidJzbJjs2ARL
X-Received: by 2002:a37:b702:0:b0:6b8:d9ec:3196 with SMTP id h2-20020a37b702000000b006b8d9ec3196mr18076457qkf.660.1660072145899;
        Tue, 09 Aug 2022 12:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660072145; cv=none;
        d=google.com; s=arc-20160816;
        b=Hq9gH8UqY4j5/LjjFhMa4P9HNCNRB/sfgUmuTBj7ZgGt9BU/aY1ej3+qdMObIslNt9
         pWGlEnL4bd+TpoqkEJCffLJ3/6zsxkVqqX8jOFmA/GvQIlpo21Trq34ntcqLQIdXs9EN
         RvsWn+IzUZYeMYovQ+uyvTzb4ilSmLaYKbUAan/L29yxzDscRlwz/M48prlgVbWUicXX
         zCQR/ISPLM5P/pbM2qW0sed17MlDncPmWyB7zrWXkE6ItjPWlc/osMIJa4LLaX2jB0K/
         HPOGIpfv8lVlp37TkZaM4VoCQp1kQIVvi6VpGtX84iVAce5YjhFq+MS7ixMYtqwxoG6b
         XFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ecs/Vyem+eoDIAn8cJsiFAERBoMarkbTVGrxbcGqKAg=;
        b=P17rtVEwwu1Scfd/7aljJC1stDERaumO2hJdRsiFpNwZrtE6ifA5i0gU00Fo07g6Ys
         ne4kit8/fypK9jbB2vkMOpC+1SbUyMD0YNwFaXPpYEKmfof1jm0UToLXmWxhXB1fGAMa
         WuDG5QzwW8EXO97Y3GuxBdiWLv060UozNt43k6tke41HFUze7emKFRO5pSehbsNd4RfF
         0VaQShSM55bsyoC7qL7oshQcJ0ADOP62LeChGXCN6y73gOpbyORqSgr86Hb9BFhv1DE1
         nw0ad4/5FJGIURsEowJ0HmKLEp87t2LShmpLVzuGgCaz3BSeuybnsWm8kbLHLR5oo2Ww
         Q1nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a0562140c8e00b00474892bf9ffsi8512132qvr.439.2022.08.09.12.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 12:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUbB-0001bs-EM
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 15:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQA-0007LN-FT; Tue, 09 Aug 2022 14:57:43 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:57438 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ8-0003C4-VJ; Tue, 09 Aug 2022 14:57:42 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oLUQ1-0039Dw-0i;
 Tue, 09 Aug 2022 19:57:33 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v4 2/6] hw/core: don't check return on
 qemu_fdt_setprop_string_array()
Date: Tue,  9 Aug 2022 19:56:36 +0100
Message-Id: <20220809185639.750345-3-qemu@ben.fluff.org>
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
X-TUID: jY1deTuPvGwZ

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

