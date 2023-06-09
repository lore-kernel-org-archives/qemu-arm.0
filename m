Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp290222ejb;
        Fri, 9 Jun 2023 03:50:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wJjZ4O17KTwrUFnsUnhRA1zjMIivu0iN/w/w8xtdMdYLfdDQaqXacxZ1Vs79Z9qQKlSJ1
X-Received: by 2002:a05:6214:62e:b0:625:aa48:fb75 with SMTP id a14-20020a056214062e00b00625aa48fb75mr977565qvx.63.1686307836778;
        Fri, 09 Jun 2023 03:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307836; cv=none;
        d=google.com; s=arc-20160816;
        b=FOGcQR7b1U8pWZD5o9xLa928Te477rNHs13KRRcdWdaYUK1AtGF1RWQaHR9FPk7O77
         TW0DENSeheq1ZXjW+CL7TDZwQnUoUo5nzIq2Ch5xlAYcTqxhKMDEUNQ2RF+/dTTZoDv5
         fTOITZ7bOAsC4enH2YE4rVNB4b9qwjWj5PyTeF/lFEXUoqRBbLoQpvVMDsQ8Qdcf82RQ
         wbuDyCRaZm/9lIT4jen9TMsDgjmU+ynJLR6I1KdA8XTLfSqfLl6iNkXtk0tvWVxVtlHv
         1/g/WnBKspXeeXgDyDO34JCb6MXT8UFJZLusXuzJ1JScJEUDrZAiOvWkuPc5NXThcyh+
         lwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cZtN3aInDSVaLd3+4eaeBHGfQDr+jXLji29WVAcNhFg=;
        b=sSJu/9Of5J9lGWQFY7gV2iNRRkk3hNl4IwnEejk74aGtFEmcQ0Jo4tgpU2HQ3LdYTU
         Tdw/lbM8X4UzpbQ850+4ovHDOtRm5h003Kq7aiPahai+VZraw2zBHgm8IPZPi/4wGkqG
         r7LhDn+tj5dHkn+ch1tRap6jSaJiWx0tF7gLZasew4ogbnbfqdkN4X89E23yZceU/L4q
         OxXdzNoQw+1h10X+NyXkL65jVB1nwh6AFMD2fPiuZSQuvvZTbRTeCuqzZcnV7mBuIFe5
         dyIQo/s3RwwDvm6a5RDnOmfynnl/aXLHyZ/fLwtFwAilrnz9jtcFfFx4F1UKK+VW5GKD
         LNPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtpnVc0C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a056214076b00b005f24d617fb3si2088828qvz.370.2023.06.09.03.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtpnVc0C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7Zfs-0004tr-8N; Fri, 09 Jun 2023 06:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zfq-0004kX-Rm
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 06:48:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zfp-0001ZO-1q
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 06:48:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-307d20548adso1135057f8f.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jun 2023 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307731; x=1688899731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cZtN3aInDSVaLd3+4eaeBHGfQDr+jXLji29WVAcNhFg=;
 b=UtpnVc0CahFgA9XXKgaPfiHatZOmVtVo1dizriXXP7nNQ237K8HxuwjSjECVgY6y/R
 7gAdOE2eE1Kjo7FSiZTJQVM0cj+cgV+9mwn0Uerjcb37kgy3Fw7oQBuJFh+FAhEpc/Vm
 uTZdBfrHlxldU22BymtQRVD4iQeqDso54TG/8pNiVMHlOq677/UIIuHCCeWzo2L9UVZl
 hF1e7wU0gTUKfBGKkBomvFsE6RN7q4OETx5mdSiSGF2230GMZIgM1hADWWUW6aS8ntxc
 4CjB5TS8udC+T8ZHWcc1rq4bYjMFzXm6nBZVl6+zih+x6VWT9IlbuGFvjCUVI8D7FRLr
 pP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307731; x=1688899731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cZtN3aInDSVaLd3+4eaeBHGfQDr+jXLji29WVAcNhFg=;
 b=HNScW4MKbrxs3a7ba4E0Enh0xhOvE2wfnarnyQfDH9VWOzMpafTf6QbzTrm8bm0NIC
 20tSqgfU1Z/XOGp5tCDsR5812qx9EOP53fcq14vr5OXLxu/huEmWJFiRLqsAl43JZXTt
 6dT0YlHPtQsvwHeb3qBNziqA9oyD2eDp/wQ75YIhN2EsUyN76xVM1bQD5MG5YLV20eSt
 G5HXs3cibDtjl213w8gta77CwkXiEt4EboQK5Qf1d8ZkCEDEz3MSn4Z8o4gtpLvn0bkI
 tzSyPAAehOxpxUpzSBe0TNPDbSXb0kMDkJWS5+MtdU+N4WUbZ7aWeq1QETJKNkg5xdhd
 VtRg==
X-Gm-Message-State: AC+VfDx53TaDNELg0W0LlHtZxAYZdj86gR+f7Z1GeP20lmq/FbSbVelo
 nCakit2TRzdcOKAclAVLriWpfj8VrzP56IcvEH2gOA==
X-Received: by 2002:a5d:52d1:0:b0:309:50e7:7d0 with SMTP id
 r17-20020a5d52d1000000b0030950e707d0mr618418wrv.31.1686307731428; 
 Fri, 09 Jun 2023 03:48:51 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a5d6e81000000b0030e5ccaec84sm4162044wrz.32.2023.06.09.03.48.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:48:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/22] target/arm/tcg: Reduce 'helper-neon.h.inc' inclusion
Date: Fri,  9 Jun 2023 12:47:09 +0200
Message-Id: <20230609104717.95555-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: AclD+Wct99kE

Instead of including helper-neon.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h             | 1 -
 target/arm/tcg/neon_helper.c    | 6 +++++-
 target/arm/tcg/translate-a64.c  | 5 +++++
 target/arm/tcg/translate-neon.c | 6 ++++++
 target/arm/tcg/translate-sme.c  | 5 +++++
 target/arm/tcg/translate.c      | 5 +++++
 target/arm/tcg/vec_helper.c     | 5 +++++
 7 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2cf25f0605..82c34df538 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -608,5 +608,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-sme.h.inc"
 #endif
 
-#include "tcg/helper-neon.h.inc"
 #include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index 0a4ab3e42c..3346a897ad 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -9,10 +9,14 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "vec_internal.h"
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 98bcd15188..06ad40a568 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -31,6 +31,11 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
 
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 6823e4c744..a820afb90d 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -29,6 +29,12 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 /* Include the generated Neon decoder */
 #include "decode-neon-dp.c.inc"
 #include "decode-neon-ls.c.inc"
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index d0054e3f77..9419aaca4a 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -21,6 +21,11 @@
 #include "translate.h"
 #include "translate-a64.h"
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 /*
  * Include the generated decoder.
  */
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index a352fced6e..7bfced1bc6 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -29,6 +29,11 @@
 #include "cpregs.h"
 #include "exec/helper-proto.h"
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index d7d6643846..9b00085095 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -30,6 +30,11 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-neon.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 /*
  * Data for expanding active predicate bits to bytes, for byte elements.
  *
-- 
2.38.1

