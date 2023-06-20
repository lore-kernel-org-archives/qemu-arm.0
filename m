Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp201249ejt;
        Tue, 20 Jun 2023 04:14:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hnZcJgyKJSx1lNDvmNFk9ezVNj/G8xUfDVilXW76PE54dcqA35wW4Vj+DR5ZmS+3ICMR/
X-Received: by 2002:a05:620a:40c3:b0:75b:23a0:e7d8 with SMTP id g3-20020a05620a40c300b0075b23a0e7d8mr13934265qko.57.1687259676927;
        Tue, 20 Jun 2023 04:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259676; cv=none;
        d=google.com; s=arc-20160816;
        b=iiCAJlXwkQGF5T//1y2hrwWd664DEn8nRP31jJnVCmRc8cSztEsg6mGu/MKCzSGdq5
         1mwOvs+C8j+TDa5F8f631qTiFH8Z8d0Ks4MVZf82sgB+5lbXfdG06iovmJay4ncuYaut
         ScoxaUp65OyN2J5KuDDiAdNtuEy61We0sIug4/MvCq1MJBcltnxenNwZcAfJWQQTog57
         +rMvxejcBMr4LlRvGj4SuqtKbdpJfeeCqPYrRNZBWl1giwz/I+vm6BoAtKjUBV6XnXg/
         NwYusnPT6sMBU5t6wciGdxc1hUZuPGRV7W+KtxTzys7eMeS6QgCIe6gaO0OWtM5w7b2F
         uyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CXOtR+skbBy3g0n+KA4k0jDRJwr6870/fEeTqXEf6Vk=;
        b=DEU1wrN2gIlULlv5vhXw5NctXNPrKDZ1ur9NEiXSGu3hA7ZOkvXY02abkWymhkPrnB
         N0r4GlsOqm+9cZqRyJqFpraoGosKNL6Gg2JaASbAkkosL5ciblFDmIfAMslbIjBSSVsF
         vi9CjDf/qz5UDKoO6szsvUeU38oOzHvN6Q+qagJEGcQe+Cv7HsVfdYX/y85XjvFrMC5W
         363R1MViRXq4w0KXpQacCGO2w5q78zxMxl0JndS158IlOC8HIg79rvUNraHaDywIpStw
         jiSuLTkoo3vm8U1V016FHiZnQeFnn+qH+aE7W9dNIcF1m0yWp6u4IEzzuHEBj/P6uAAz
         oj4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CsckY/3o";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17-20020a05620a113100b007607c9f6b32si725009qkk.199.2023.06.20.04.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CsckY/3o";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBZDi-00065G-88; Tue, 20 Jun 2023 07:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDf-00062o-Lh
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:19 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDc-0004FD-4R
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:19 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98802908fedso415220666b.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259294; x=1689851294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXOtR+skbBy3g0n+KA4k0jDRJwr6870/fEeTqXEf6Vk=;
 b=CsckY/3o3nLyfBEzy/Wcg8Q2mo/JhZk7WYc7hQKd3JqcDbu8XKJl689fgJWtmzpttl
 3fCNlv+61vMkrebTpLg5YtA5Y7vmdD7t4flcSCl7YyVJk8TKgtw9VrUgUkhLvobHCOSu
 FwclqOdOz8XjIEUG8dXOlWf2kjRIkfdTxMaIHwdD4bZwXlSOC2cHK6AYosNlrRQMNj94
 r0KXH5spim2Fteb8F4fK2DqoXggSlTsykGUcl9jr3t9aPKQPxPaPmm5gJQCmPKjGVmKv
 i/uJaUv4t0U6wN2P9Kp90k0Ps+XM4jZpUKEnKZ31AaR4wrnO3b4t1aGMP1TH3SGorHtt
 krqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259294; x=1689851294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CXOtR+skbBy3g0n+KA4k0jDRJwr6870/fEeTqXEf6Vk=;
 b=fTb4WqCbiUOYa4gXR+MZEIk0tojwy/KVym2ywxhiPBeGbV0cGoykz54EJd6MGWJAaj
 RI4KjKYTIz7NRIZtwZbIqZFQMs3hch5gA6kZlTWkbQ3aQ2HXYDZZLsYfRF5AJA5rYQft
 GTMbTLdK0CF/Ihml7g1Bv0KaFlhKDLP6V0zftjGKUgUdJ+Y46vW20sQtSOhZBsWk8NJo
 NWW4L5swla9bOtR8vYtGEI9pcT0lqLvULI5Adpx+TM28Fd8csaF/lL3i7DFRmlUU5r4a
 FsYa0WQLHlVsLSEINr2h6gUaxeBhD8RXHG2NJl5iBRrPEtV7NPadq++xi2UoIJIGuacX
 MX/g==
X-Gm-Message-State: AC+VfDyBwiOjXYiaZYUK0mrQnfm2cb/Gbc5YkHRq4Shh2TzYyoA/0/bs
 5VqVLue2EFX1zryKBrlCfBKtYeNntCL2B4Ea3/krvF/8
X-Received: by 2002:a17:907:1c96:b0:96f:8439:6143 with SMTP id
 nb22-20020a1709071c9600b0096f84396143mr11867211ejc.40.1687259294633; 
 Tue, 20 Jun 2023 04:08:14 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 09/37] target/ppc: Use aesenc_SB_SR_AK
Date: Tue, 20 Jun 2023 13:07:30 +0200
Message-Id: <20230620110758.787479-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YM0zhxCbLhe4

This implements the VCIPHERLAST instruction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index d97a7f1f28..34257e9d76 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -25,6 +25,7 @@
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "fpu/softfloat.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
@@ -2947,13 +2948,7 @@ void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
-
-    VECTOR_FOR_INORDER_I(i, u8) {
-        result.VsrB(i) = b->VsrB(i) ^ (AES_sbox[a->VsrB(AES_shifts[i])]);
-    }
-    *r = result;
+    aesenc_SB_SR_AK((AESState *)r, (AESState *)a, (AESState *)b, true);
 }
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1

