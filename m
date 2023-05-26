Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp812514ejb;
        Thu, 25 May 2023 17:24:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4oVy5RCRErYHcSEMmF1/yTT5StVOWiOpvql0ixdRhc3ue//rtBTLyG/NWhBX7/MylOyMLb
X-Received: by 2002:a05:622a:512:b0:3f6:9114:f47b with SMTP id l18-20020a05622a051200b003f69114f47bmr80884qtx.1.1685060699076;
        Thu, 25 May 2023 17:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685060699; cv=none;
        d=google.com; s=arc-20160816;
        b=kf0+TiA/gH/XjOWRiRQZAFaOGTTbBuGPp/vv1oWYFBbxJWRxFBPF0HpV+c9mSFVmg4
         k2+Alo6Fezl1iqFS9GQNH/BWXZvgu1MOqDIrwRt0rZpnWVJX/9rEAtngs8zvWI0jVsbd
         kBwlv0nvuIc3LrXE4xnENfcgfxiU7LYixx7IF9Ei1/vjmrlJls2e2QINJ6T8zaq3fybJ
         XilTBA+xwqDjWzt/UWuunzwJatXYijTvXdtyzDpll/ixYjS9TneYDyRpgl4pJ0pGgYSz
         UuGcX1SpERI783dR3fz5CtCyIb5vsX6+bv6mLe34eDiqzlPBuQSD6c7pKSSM+XRc/9oH
         pLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S6NQFZiOtbz6npGqiyw8uq/rNuokDU9J11iDsc0p5sk=;
        b=ozQsHcY3Khwz46C8hXGtr5H47FbMzEO/NXHZANTl5uyywhBjYvfUeBpJPGPzX1n2J1
         RZ6PLfAbUtaHhtWaDtry2v2ZsMCfRZnDskkuiuLMIplB7miX+StJQi3QDNoFWN9cgfdK
         OONidQZByx10bkj2AtvvlFM9+oYmTvN74v46L95DM8If/g1Ztt8ChyPvdFaXQW1BOfzr
         05Z0VMR8dyGyQ0KESPc/SGdlCp3SU2bSMHeYUcPl/DuUfmfyr++4dLPNdGrCYyX0ubqZ
         ENohm+VPpg4ZuKizG8vlJBLgp9yFEvMfuIzdxVOTnwNRPTvOklP1/QVGr8ZmJyByuaHy
         EWIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEk6Pwrp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05622a178e00b003eef480cdabsi912549qtk.725.2023.05.25.17.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 17:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEk6Pwrp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2LFQ-0002g9-Dy; Thu, 25 May 2023 20:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFP-0002fb-5g
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:59 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFG-0002DJ-I8
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:58 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64d24136685so252619b3a.1
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 17:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685060629; x=1687652629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S6NQFZiOtbz6npGqiyw8uq/rNuokDU9J11iDsc0p5sk=;
 b=NEk6PwrpN1tWfEBYxVopvFRF1iSf5H5UL3yV8vltA+oSrwiIfIcNoWKJf/aGJrB2eZ
 3i68wjSdFNpjBd93m4oxq9hN//7Q2H0Uu4CIJ8DRGlLMcA/okrI985niyK6JqR1cTVJg
 maX4aABJhCnnAMk0n9DNMkwb7arE7EXUrD4He+4kg+jmlA9PBkvrMyLynII85yiMizzU
 G4TZwnmlGEQxmEeh5w2mAb0d0prYUZ+JWT/EVhBBTWjaq+Nb1nWiOflRsarhNeP9rLWE
 C0D0gMFgI2OjJtK9aK/CsO+TCa4D95hChq9xywyX8/FpTnmXhUBpiovE43dItN8uv1zB
 3EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685060629; x=1687652629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6NQFZiOtbz6npGqiyw8uq/rNuokDU9J11iDsc0p5sk=;
 b=NCvSjADw81R4CF+Bv5H3mkfQCZQij+1i2FWcU1APmVJLwy0kDdYV31BKZ+jbf09ZZu
 RX9fIoGLHiZhBhEEytDDUCP0lNuxMMkNvME/3g4IyfKWevlzBJYsRohi7uWNalzIkPi4
 /IgfkyoR4Bnd0IIeIMyAqd+fc9uhYH4OjUKLop8mUwvEG6rAT2w8tp5AllIsZkZfVi+K
 /rGmd4/lBLRgOeQ95Lq36xTJTZMzKa+ry1TCSFFvt55AXsYfj0n0vgKQ2rx/cFL0lcI2
 0KuGygEQJO/539RHGLA3VdEMrSqe0RK+3bKBXViYoxdZFw54sKsHI7XBhaCAiCnarGt2
 0E9A==
X-Gm-Message-State: AC+VfDxg2fkMfVlPxuhFCy3x97zNUD+v5kdRrrxR0l7NRVsWwnDZmRi0
 yVOq3QDDIoRIwjccY10Ux7SnLw==
X-Received: by 2002:aa7:8891:0:b0:63b:54e4:871b with SMTP id
 z17-20020aa78891000000b0063b54e4871bmr3705pfe.8.1685060628738; 
 Thu, 25 May 2023 17:23:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s188-20020a635ec5000000b0053491d92b65sm1675593pgb.84.2023.05.25.17.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:23:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 16/16] accel/tcg: Add aarch64 store_atom_insert_al16
Date: Thu, 25 May 2023 17:23:34 -0700
Message-Id: <20230526002334.1760495-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526002334.1760495-1-richard.henderson@linaro.org>
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: fULiBryHqoID

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/aarch64/host/store-insert-al16.h | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 host/include/aarch64/host/store-insert-al16.h

diff --git a/host/include/aarch64/host/store-insert-al16.h b/host/include/aarch64/host/store-insert-al16.h
new file mode 100644
index 0000000000..1943155bc6
--- /dev/null
+++ b/host/include/aarch64/host/store-insert-al16.h
@@ -0,0 +1,47 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Atomic store insert into 128-bit, AArch64 version.
+ *
+ * Copyright (C) 2023 Linaro, Ltd.
+ */
+
+#ifndef AARCH64_STORE_INSERT_AL16_H
+#define AARCH64_STORE_INSERT_AL16_H
+
+/**
+ * store_atom_insert_al16:
+ * @p: host address
+ * @val: shifted value to store
+ * @msk: mask for value to store
+ *
+ * Atomically store @val to @p masked by @msk.
+ */
+static inline void ATTRIBUTE_ATOMIC128_OPT
+store_atom_insert_al16(Int128 *ps, Int128 val, Int128 msk)
+{
+    /*
+     * GCC only implements __sync* primitives for int128 on aarch64.
+     * We can do better without the barriers, and integrating the
+     * arithmetic into the load-exclusive/store-conditional pair.
+     */
+    uint64_t tl, th, vl, vh, ml, mh;
+    uint32_t fail;
+
+    qemu_build_assert(!HOST_BIG_ENDIAN);
+    vl = int128_getlo(val);
+    vh = int128_gethi(val);
+    ml = int128_getlo(msk);
+    mh = int128_gethi(msk);
+
+    asm("0: ldxp %[l], %[h], %[mem]\n\t"
+        "bic %[l], %[l], %[ml]\n\t"
+        "bic %[h], %[h], %[mh]\n\t"
+        "orr %[l], %[l], %[vl]\n\t"
+        "orr %[h], %[h], %[vh]\n\t"
+        "stxp %w[f], %[l], %[h], %[mem]\n\t"
+        "cbnz %w[f], 0b\n"
+        : [mem] "+Q"(*ps), [f] "=&r"(fail), [l] "=&r"(tl), [h] "=&r"(th)
+        : [vl] "r"(vl), [vh] "r"(vh), [ml] "r"(ml), [mh] "r"(mh));
+}
+
+#endif /* AARCH64_STORE_INSERT_AL16_H */
-- 
2.34.1

