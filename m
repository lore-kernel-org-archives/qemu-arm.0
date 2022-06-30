Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp253643lft;
        Thu, 30 Jun 2022 04:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0kCOwOcPJ5tNYpsWv+6TaF06O2dH+trZ0kxriYUAC67M7vtd4jyYgtdr5kmYTGkUlCQlt
X-Received: by 2002:a37:6453:0:b0:6ae:e740:92c1 with SMTP id y80-20020a376453000000b006aee74092c1mr5671213qkb.174.1656588373900;
        Thu, 30 Jun 2022 04:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588373; cv=none;
        d=google.com; s=arc-20160816;
        b=ViDXtwNNq5+oqZv5we8HN+SlNrLESb1mJmK58Hze2EjvrI8HpFA5MCgd6F/9Sf6VZt
         kv3WMynlaTkrwymPV7zpz0CnzR1bmpSr5tG7z+u3FY2HON5hnBBImfhwSyW7dW10BBmW
         NKNnTMuP9bG8IACagjt6DcQFItZ7RTf/srURhdBonUfdI7FLQWxZBvi5gvPrNrTn3a7m
         UZIU+tYz4IUVlcPgjCR9YF0iWsIYpp71febnIEzc/AhoHH4ZxzB5Dw6wJ9WKI6GAe0Nx
         GBYKGsUl/Kvme46Z2iy+m6oxc8PaGt3EKbn84AxZdOpYs6mpi/S/yxZDfDNmTafJccTP
         w2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=7Zv1KO5xBbPFnINmOyaUo+l1cFTieBhUBQ78twwFOu4=;
        b=Eq06GE6SqbujMX4evst+UQdwpXA72NmaGVLz8x+ZTjvqfphVipD9ZNirs0b7Mx1IIt
         tuylat+5SHPz1McS64E+BQvmLZkhIXTC6NMuCq0istHgaAlzTweIAS4k0JbyFJjcNw3f
         g9MN1xWFqmsdYEMTWgAhP0am+GsW+xQLkaYZi7CTpIgBVkOela4K9dSc+I1VMGK5DpAf
         ZynPVxJHfvZIsbwpR8KO+FyLO6BXFPdbOQp3oj7jdYUBKbL1a0hOH/pqi3cpl41J0di1
         sa9cZP8tRrvnRkXgRhzlV2YBlJLlME9uH/biTUkcpdr9ikEZQI5LOlnZlVibPH8Fta3J
         H/Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a370404000000b006a66f274192si10263985qke.507.2022.06.30.04.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sJJ-0001Vl-Bi
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHn-0007Lv-CP; Thu, 30 Jun 2022 07:24:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHl-000215-JW; Thu, 30 Jun 2022 07:24:39 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZq15Qwz4xXD;
 Thu, 30 Jun 2022 21:24:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZm5Mwhz4xD5;
 Thu, 30 Jun 2022 21:24:32 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 06/27] aspeed/hace: Accumulative mode supported
Date: Thu, 30 Jun 2022 13:23:50 +0200
Message-Id: <20220630112411.1474431-7-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: EMvE5Gfp2Ui6

From: Joel Stanley <joel@jms.id.au>

While the HMAC mode is not modelled, the accumulative mode is.

Accumulative mode is enabled by setting one of the bits in the HMAC
engine command mode part of the register, so fix the unimplemented check
to only look at the upper of the two bits.

Fixes: 5cd7d8564a8b ("aspeed/hace: Support AST2600 HACE")
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627100816.125956-1-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_hace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 731234b78c4c..ac21be306c69 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -338,10 +338,10 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
         int algo;
         data &= ahc->hash_mask;
 
-        if ((data & HASH_HMAC_MASK)) {
+        if ((data & HASH_DIGEST_HMAC)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
-                          __func__, (data & HASH_HMAC_MASK) >> 8);
+                          "%s: HMAC mode not implemented\n",
+                          __func__);
         }
         if (data & BIT(1)) {
             qemu_log_mask(LOG_UNIMP,
-- 
2.35.3

