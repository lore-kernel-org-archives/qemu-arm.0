Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5206276lfh;
        Thu, 2 Jun 2022 15:10:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyBLYP0R/L5UFOdmRPQg0PqG/Gvg9SvNGy98lkzCt2cGet7EALJdRFHU/EYKJkScyebJg4
X-Received: by 2002:ac8:5b03:0:b0:304:bddb:b11 with SMTP id m3-20020ac85b03000000b00304bddb0b11mr5311893qtw.487.1654207827676;
        Thu, 02 Jun 2022 15:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207827; cv=none;
        d=google.com; s=arc-20160816;
        b=wY3WYOpKmq0IjcDQzcmSH9EcjBRfI2K0Uy1XNuPGog3sgz17ZwnwHPNCgrTTXDQjxZ
         lvj8Amfj4k6H6izxkNXSkeCXMAX+pOn5VamGARt+prj0k5w8ae4dHRqpyTigYwkal8+x
         QZpk9Wb1DnzMpvbrxK8l8HIo+xaUkWDhthuZwz8Jh5q/pTD8VOTqCMVZ3mNHsXeky8sq
         0ayjcsDD7RGZ0Ra5bA7Lc27LkZfc9u+AIUln4PAJW6fL9/wDPLXcw3Ccxj4TP8xvkuK2
         pKC907nMJ3XcL1wbtDqZEA29A9i1Fc0nPtlqmBnfBeteCII1ZoeHnS5rIo369yzaadi2
         Uixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iCOG6DsXO7r1GwfN6wKfqvV2SzATr8uc1yKAbhFIADk=;
        b=yfmZYHhP4vurS+Rl68LkAx55XOItKOOFdN908h6zdpmKg0mvG+cJHeths057GLMg0g
         EZuy4evSIR5srhFFzKCDp2Dr/hAEq284w3T6g0tuzhn0Jz4mjVGcXy42CCIfsppcfvkk
         5euA+iIWeKCaKEqUc61lwrpJmby7U4oJ/GoDnK5c/jnudmiNNzmLDb9hNH7eh0VFJbbp
         wXh02dEA6DwiefkXoPdVH3z0Ecpqskw6qhdbNqpmU14NhM+O+c/yFNup5IMeMZIBNYvA
         EVv31pDUB6WbXiKWbETxM/LerqvAwkAboL2XMtGGAldqlvLLdZnP5oETbUjt31Yz4J5d
         sUlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHTZ1Ajz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a0562140d0600b004648d177159si2223180qvh.368.2022.06.02.15.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:10:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHTZ1Ajz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwt1P-0002fj-0x
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh3-0004y2-91
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:25 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh0-0000DM-Sd
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:24 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so5890128pjs.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCOG6DsXO7r1GwfN6wKfqvV2SzATr8uc1yKAbhFIADk=;
 b=WHTZ1AjzKSx6vBe8d+WassEtCMBWyrCv8R6MB+aGns5aLIh5dmWbrYAqAlEBvrNUf2
 fZrLPelzQtSjTOWqIP9zHrBzt4d9bDw5tVqB+kGZ//G1jWb0PebijjU0rbE4CcqndRVK
 Jz1U3/zO9I2nRWkLlJFUfgYdYg1GhxPiYLK0kQJROvJjh0WU7cXcfKHBECrtUBA/vQFv
 6gsFuzPg8uJN6Zi4InFl3v21YNIZpwCusaO90FjClSqlYvupr6vC94a4zdL5ioHTeo/b
 ZxUzDwnwJm3BTu/iF1xEOMALbgLkz+fQAU+9RQeSpYMGvS1nEt66xSCxlzv6bKaQDqVD
 5U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCOG6DsXO7r1GwfN6wKfqvV2SzATr8uc1yKAbhFIADk=;
 b=kMweEnijR7eEhupRCPoPSHEA0wn2pfay20szB5CHxW3qIe1TWexqu0Me0UXENqloPT
 ZF8mfSpUucfIhrcD84rq+yshV+pWJq8PfaHuwkYeeaCEOCjj6f1FWyCuQMEaEhIXXPnB
 A04oN7ghJzubRXLz+j+T4QFgMXV4LwF5sAqGPx11WvCkSALQ/izFlUfBDEuvFTyroPvK
 ivELUXgRi/IjUvXQN5VZA1ScxyVZ1TtRg02kT8aIq/vy3fJHhhyZp+6IbMcJoOsUpAvc
 kn5XY7qZVrca5m0SYuFJHHCdx4Fa+Pshf6oRcrft6NnTzWDqXJcxPTt4r021FFVdlZXI
 TiQw==
X-Gm-Message-State: AOAM530aRBVXcb6UzHM6XwLO30MqzTX/kAaY0Y55gNLeNbPwnMWiCmdv
 wKXHgH8ZVTvodoOueO9t6G3bvg==
X-Received: by 2002:a17:903:288:b0:15f:a13:dfd5 with SMTP id
 j8-20020a170903028800b0015f0a13dfd5mr7035089plr.55.1654206561568; 
 Thu, 02 Jun 2022 14:49:21 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 31/71] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
Date: Thu,  2 Jun 2022 14:48:13 -0700
Message-Id: <20220602214853.496211-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 11z1N3X8S9Dz

Keep all of the error messages together.  This does mean that
when setting many sve length properties we'll only generate
one error, but we only really need one.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 51c5d8d4bc..e18f585fa7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -487,8 +487,13 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                                   "using only sve<N> properties.\n");
             } else {
                 error_setg(errp, "cannot enable sve%d", vq * 128);
-                error_append_hint(errp, "This CPU does not support "
-                                  "the vector length %d-bits.\n", vq * 128);
+                if (vq_supported) {
+                    error_append_hint(errp, "This CPU does not support "
+                                      "the vector length %d-bits.\n", vq * 128);
+                } else {
+                    error_append_hint(errp, "SVE not supported by KVM "
+                                      "on this host\n");
+                }
             }
             return;
         } else {
@@ -606,12 +611,6 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot enable %s", name);
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
     cpu->sve_vq_map = deposit32(cpu->sve_vq_map, vq - 1, 1, value);
     cpu->sve_vq_init |= 1 << (vq - 1);
 }
-- 
2.34.1

