Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0898C5B56A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 19:15:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtrx6-0002Hq-DR; Tue, 11 Aug 2026 15:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtrwy-0002FZ-Ow
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 15:15:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtrww-00028h-16
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 15:15:48 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2d004f135b1so4115655ad.3
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786475744; x=1787080544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oGQa5u97Tf6cvRlX6RYNQHfqzZ112KA8RU1f9as2cNQ=;
 b=BjDgeJKh/xjaAXgMXP7VynTD5L9CZ9JaAArxDaw0+4orPOEaiBNjysTHCAPdxt/dUg
 MTfcD2F0zf9LBVy4bSy2YL+xDoEJpzUyjMsCP3d47oRzTaoV5Vx7gjgwnQQDs2lF3EJ7
 HHwwKUfXi10CGQf7Mm4fAO6kxng7NR0OPD8jR5SUdGFWPIeaiUtmpebJqBvKSXauiAJb
 B8aNQZoVn9aqUHWzHPR8uCNx/7pcm2E3NPHB8v3euyatzsWelo2w8e+Ea/aXHEO9cbjr
 MQEfip3Atwq7XA0pC3bJ2VwlLw+8nvmByBwsRBmH9B2egh3VeeL/laRrfoOuVzhTzWc+
 ysig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786475744; x=1787080544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oGQa5u97Tf6cvRlX6RYNQHfqzZ112KA8RU1f9as2cNQ=;
 b=sydPkdbMf83LeCNya7kqVju7TqFCNsHKpzqh1Iw3DguEc7AsnRfGuamOB9YHp5+Tgk
 d1Hs9PEBzdumHJlz+8sF0FwePcNDyK3ieBDeKbwqLU/+5MHAyFLEwUcm2tPJHX+gFgHs
 5jixi5SLAVtvdxC2Bzq2k55z/NNcZBsSfbV46mVHb6/qiAdH1cJYV3gSfJK2pT165eOj
 KBR5PRhm1+JMUUQV7VUG9C2HOhVr5oW2Qu9HKXfzkdpVBf9ejyebLFmCnOarg2gXJXWB
 Fv1dSBjClrkpzS7xYG85uj7ZPzEw6XRythIPyzWBFRdw6/W2Cf2QYtQtpudmwicLYG8L
 6OKg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro5jbkLjezEBESgsRHSKXUCHibaNhbG1fmYTjolDSacDXkLBbrIYj7hA31TUZc2tIfNNxWpGw9ycQ==@nongnu.org
X-Gm-Message-State: AOJu0YwkAtmWdibgsdsW/lP/mFR8UlgG2xMHjM542IaWn8a4sGYW09hN
 LL+NiUd764dkwBa0nQyt49p8N0E+7Y7KGRy35qhmoLcrTB/7UIB+wnqZLVQrAUSomO4=
X-Gm-Gg: AR+sD12PmCH46b4wykBqpHXQwPB5qOnBENFUUT+nfANlbfqRm+GzE7uTQjNuIe9nEWo
 svxWV53TpiO0Oh+9hLmd49vuIvBovm5WLrJVgtyWPo4Pv2+SzB6/p4VN37+rIkKolvIPBvruwsq
 B8N79S1vuH9rslS+vllqXVyinJbV9Qf5TMxYNZVgne4pndIIXAqrQpz7cJn+k06xBAe1/K11pl7
 9SzDdCxXWMSRbnu2/kj+UB29dby4+TjNRc6ScxVyKwJNv2S19ZWX9NgJoF3YzxNPxk+R1LvDe0B
 HyVc49V3mk+03UlVUrRPOVKdi3Xq1ckgnxzmCxNJ9KnUwooV1jAvsc89WtbD3dAf6pfQhwyp+Nq
 kVvawVxaDkjRKJrTFm0IuOvK6cJExwlegDQ14EV719eF9DjKH3Drgljvw+xShBCtzT3iImsBy3c
 b27PXsH8d2iXQzK6qyvg43Z8eA89bpbJs4qVG0PRz6FjtXJwJuWtJQ846pMlZSE7Yf7RaTPJkiA
 yFM8mYVZI/IrzvS/bvA
X-Received: by 2002:a17:90b:3c8c:b0:37d:ee77:78ac with SMTP id
 98e67ed59e1d1-392f484a46bmr2499163a91.19.1786475744420; 
 Tue, 11 Aug 2026 12:15:44 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392f97fc409sm209668a91.1.2026.08.11.12.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 12:15:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yang.yanjun1@sanechips.com.cn,
	qemu-arm@nongnu.org
Subject: [PATCH v2 3/3] tests/tcg/aarch64: Add regression test for
 whilewr/whilerw
Date: Tue, 11 Aug 2026 12:15:40 -0700
Message-ID: <20260811191540.79882-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811191540.79882-1-richard.henderson@linaro.org>
References: <20260811191540.79882-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/sve-while-ptr.c | 28 ++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  5 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/sve-while-ptr.c

diff --git a/tests/tcg/aarch64/sve-while-ptr.c b/tests/tcg/aarch64/sve-while-ptr.c
new file mode 100644
index 0000000000..7db3b9cc03
--- /dev/null
+++ b/tests/tcg/aarch64/sve-while-ptr.c
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* WHILEWR / WHILERW regression test */
+
+#include <sys/prctl.h>
+#include <assert.h>
+
+int main(int argc, char **argv)
+{
+    unsigned short p;
+    int set_vl_ret;
+
+    set_vl_ret = prctl(PR_SVE_SET_VL, 16, 0, 0, 0, 0);
+    assert(set_vl_ret == 16);
+
+    p = 0xdead;
+    asm("whilewr p0.s, %0, %1\n\t"
+        "str p0, [%2]"
+        : : "r"(8), "r"(11), "r"(&p) : "memory", "p0");
+    assert(p == 0x1111);
+
+    p = 0xdead;
+    asm("whilerw p0.s, %0, %1\n\t"
+        "str p0, [%2]"
+        : : "r"(8), "r"(11), "r"(&p) : "memory", "p0");
+    assert(p == 0x1111);
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 32f2689273..6cc81bf854 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -203,8 +203,9 @@ endif
 endif
 
 ifneq ($(CROSS_CC_HAS_SVE2),)
-AARCH64_TESTS += test-826
-test-826: CFLAGS += $(CROSS_CC_HAS_SVE2)
+SVE2_TESTS = test-826 sve-while-ptr
+$(SVE2_TESTS): CFLAGS += $(CROSS_CC_HAS_SVE2)
+AARCH64_TESTS += $(SVE2_TESTS)
 endif
 
 TESTS += $(AARCH64_TESTS)
-- 
2.43.0


