Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903A7CD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 08:21:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa7zM-0005LE-JJ; Thu, 18 Jun 2026 04:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wa7zH-0005JH-CA
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 04:20:35 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wa7zE-0006Tj-On
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 04:20:35 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-bebac79fff8so74717866b.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 01:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781770828; x=1782375628; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KKSPSnAl7FDN6Zt0DqKlBArO4lCMgimmNAk89edFtyE=;
 b=Vc4KAJ0WlsoBurHu9Y4umBa2mzlh4Ff+XsJY3pgRcBSE9pkR8D0hRhw4rvV7E/7RO2
 ritD9tk9x6gIkKeSYzShYla7ssZHH2wuq8wAl+UABP1BpAX5JqmEkli5styV3ai6gg8u
 a5gTOC/2cOU4jPP9uVcF+rMZdqxs5p/nMmNGAfMMlI3VK5uSiNTS71BMEKxTJM2FS8G7
 A1CgXbwW9E8JiiaftTEdC+SwmqRs/n90O1Y1zWTQaHcrImH3X+7SMMSNXQML2pC9Jv3k
 H6XNoMtRMAcJjSdW5lfHwK3R+e6t7Y8FHEBJkl5YN9Vdcm/FIGi3yFKxDuVRIz4U0M8G
 oCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781770828; x=1782375628;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KKSPSnAl7FDN6Zt0DqKlBArO4lCMgimmNAk89edFtyE=;
 b=pUfF5i5GyZ8KV4puQOuqBUzXfLtco5SmATTTcfMvRqm7ok8y3b1SgGEncGNi2XTwgg
 i+XCus4yBmm7Neu9yc9EYW/PddwyUveF620HJVqzmSLk4cA3JGtp0bIzDMFfemBBdUm2
 V6yMqvWo+KXMM+uf+rDOJJwBhRa+jy2TGFhPgQwj+lqqwMPcVDGEAOOdpTEMWa3rEeXn
 hyzrAV28dn1p0KUM4LjgOEQ7yov1ptkcGOiv4FjWaaxr12vc7GzuutfHGJUlCTizX4g+
 L23Nafgc5fmOjhgGZkYI307UxccPzxBuCyOWchFXvmDFBjv+i/lYJGyJhSE6XwgK5lXp
 C7gw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8up4v9rZUbogxBKQs/DIm9FHaahu9FR4UBgs/lh5wY2iJJubWF+ldeOfBdCV7CBPMxnZq70yfkjQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz92oX7Iw3dmJfOqHT+oklI20g0+IBItuH+/GvR/yqdrk9d2rlN
 nf4bmerfIMYGVl91/8AR4tX9qmB3MWg+QM1qyc++VOHdVAS6GuTaWCNZ5oPR1n42Vl13f2SlAbH
 D2zpbVQI=
X-Gm-Gg: AfdE7cnZmWY1IvA4dHDqHLxhb/8k3mKrMo8WaC8RwDKvb/NIwFWWE2ehWau31i4o+y/
 uA8MoEVwCuJS10DCIY1IqvBu8LPBxXwCQtw832mY4o2vMGccCtffKJCjq/drd1ASYkl/UNt9GLZ
 eF4dgl3MRp5F3P+uyTGbJIgGw0QBUwkCiDgPaFthKbH8Lg8Uj2FUalhhUyZIoH2hQJhgCfrMDlz
 qjUfALIsWdYjPmf8yu8zLsxGJ298vSSwGHrTnefm1WU8ymEtE40JM4pJEEKw2rznVF2rjSxfkqu
 WQWdfhpVlh4RCU5hurdw2NkWcFaunVfRhflaQkPnVYSjKdCLi7uld55gQdxM7LhSYiJNA36vGwB
 WcXOyippRuxCf+sq2uyn0MVA0U3hnXUVPKl2PQwI2QBi0YHYRrDZwr4X49EYrFv3D1cI66GJ4Hv
 VfNiK4AVGv4Cm92Dk=
X-Received: by 2002:a17:906:ee8b:b0:c05:7524:884d with SMTP id
 a640c23a62f3a-c05a73aeffemr462091766b.37.1781770828361; 
 Thu, 18 Jun 2026 01:20:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:a63e:e8c0:5950:f3f9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfe7cc615b7sm854334166b.48.2026.06.18.01.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 01:20:28 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 18 Jun 2026 09:20:25 +0100
Subject: [PATCH 3/3] target/arm/tcg/cpu64.c: Add FEAT_FPRCVT to cpu_max
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-jmac-fprcvt-v1-3-1b4475bacf51@linaro.org>
References: <20260618-jmac-fprcvt-v1-0-1b4475bacf51@linaro.org>
In-Reply-To: <20260618-jmac-fprcvt-v1-0-1b4475bacf51@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/tcg/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index f7a920a202..f259e82dd3 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1269,6 +1269,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = GET_IDREG(isar, ID_AA64ISAR3);
     t = FIELD_DP64(t, ID_AA64ISAR3, FAMINMAX, 1); /* FEAT_FAMINMAX */
+    t = FIELD_DP64(t, ID_AA64ISAR3, FPRCVT, 1);   /* FEAT_FPRCVT */
     SET_IDREG(isar, ID_AA64ISAR3, t);
 
     t = GET_IDREG(isar, ID_AA64PFR0);

-- 
2.43.0


