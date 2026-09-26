Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF33CC9831E
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:04:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMRS-0004gM-IQ; Sat, 26 Sep 2026 03:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQl-00037f-Aj
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:47 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQj-0000YG-Rg
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:43 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-340fbf9c1c6so928404eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406160; x=1791010960; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jxrQ5VcJdTOUL5YWm4kLgy6rCzJqiug70440yB9Q+rE=;
 b=Z0qgd1r+0DnnGZia8Kw/h/nG2mK80X/EhBlXuALgkEVCB6VfeV+gWcdXMnA/Y3Holm
 a26g7ylSgnxYryrQcNm59F56mf2M6Dci/tRBFCC+CSvaXwkRWA2qt5geCGr24tb6Xx47
 aDkX/i0ehFjqjaHP+UsIqpAvlXx22x1Q84gnoJ6dQupNI9MuUv2tKHWcgy0nULx1f+ox
 H6uqnYY7p94L1MwtJ+/H22VBpuztqifiVA2XbbM/26b0u/7Eo/ueY7U1BRi2n35TK/+9
 Q3C0RUpgFpgFelwEfe0uye3jcITOUn13zoEc1X7iiJjft+qWiVHWov91YOOBaXUYegtL
 G8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406160; x=1791010960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jxrQ5VcJdTOUL5YWm4kLgy6rCzJqiug70440yB9Q+rE=;
 b=WeoCsA8fnoXeSoTZ5+fyuWcoBCL3pgpwHGVr+MdQ3lVZDAu0L7OOVybT6gnF8xaGv7
 louVjX0A9Yfyia64+P12iNbtmBDVlGvbWZHkB9FJ5xQJDmCndcNwnZpHMkqQhMyrTOxx
 2BM6IV3dgAVGgMBFPT1rvac5Bq7L/tvAkn9qo7ng11OBFHTkX1Evc3Zeb1ctF/0W3YGc
 Q81tEfpFwTZWv0TQWP/CFVbfawSw9je6Cn64RooLjJgjIgb0FZeuI2mwEVwrz6EMqdky
 KVgNyn6UTmbTp0+k7tv/7RLR2vASi4FhcUDZwreMU6G7M3e4t8l1vcJmevRi6XNtR5G8
 +IgQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8/l0eMkfVW8Bdbt7VW/cQcDeqCYMObsin3z73LtQTMuX6ALSe//Q0Vd5TBogLgd2rf3RRt24nAA==@nongnu.org
X-Gm-Message-State: AFuF++n/R7nGvbNyano7Me0f+OYqUM6yW1bP5DFkk7XPVleDcsIbvSkV
 xcaBNOoanR0ruIsgdVUxjHy/c5RukwvSw9Ga+lpjnNfLaiDUHWOwdkzpd0xuZd6k
X-Gm-Gg: AYBFou2Q5yUKCEIKAo7j5baG9W/JiLMqNGsOr4AaHswfSfIKHYTzjYF0ouF/jwEqMbo
 yv9HkZEhrS84gyCY55Aso1hN9JCa/WkB8dPrNRkoIDmE6Fp6M0paalo4Jd6Ifsz9whnw/5e3KTd
 hKJgsuDILuyqxIymkrmthqP5oOhws4bxJce4bz+1ku/moU8APdl/TqM119Ka2JNyXwG2dliU3zD
 1A1HP5/Z/RWHSDE+TCFfLkKrQJcUKIggybK2E5rcc6GdWYDmDxVigDVY81EpbbbDEq3Bchl290K
 0WQX5FWvkU6hznOXer5+Y+3MKrm5gvRiJ61XV4hoz0Gtxyv3O2IUpLZkANUpXRGjNpfCbU5znG9
 iwo+mjJjuXV91qgWUk0TriGZ72ssN1+QVZjf4f3uHuP7s8Opc1PEbH2mCVTSKZrc3bGEpofkiWx
 GoFULRM8d/7S7z3Y+EUqzJshX8rItGOqgPVvUnXONGKCwLa/D5ZxE7B/KvkvDCHj/7+SgC46Mi8
 6dPOPG6tic3xFoHFk9WCbLuUdMV2Kk=
X-Received: by 2002:a05:7301:71aa:b0:33b:ef77:a1c1 with SMTP id
 5a478bee46e88-34271d8cce7mr1958172eec.22.1790406160457; 
 Sat, 26 Sep 2026 00:02:40 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:02:39 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 24/55] tcg: dispatch tcg_gen_gvec_dup_tl at runtime
Date: Sat, 26 Sep 2026 15:00:23 +0800
Message-ID: <20260926070057.1234-25-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Replace the TARGET_LONG_BITS alias in tcg-op-gvec.h with a static
inline. The duplicate follows tl_is_64() and casts through
tcg_i64_from_tl and tcg_i32_from_tl.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/tcg/tcg-op-gvec.h | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index d82ba6dfaac..96e73178558 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -9,17 +9,16 @@
 #define TCG_TCG_OP_GVEC_H
 
 #include "tcg/tcg-op-gvec-common.h"
+#include "tcg/tcg-op-mem.h"
 
-#ifndef TARGET_LONG_BITS
-#error must include QEMU headers
-#endif
-
-#if TARGET_LONG_BITS == 64
-#define tcg_gen_gvec_dup_tl  tcg_gen_gvec_dup_i64
-#elif TARGET_LONG_BITS == 32
-#define tcg_gen_gvec_dup_tl  tcg_gen_gvec_dup_i32
-#else
-# error
-#endif
+static inline void tcg_gen_gvec_dup_tl(unsigned vece, uint32_t dofs,
+                                       uint32_t s, uint32_t m, TCGv c)
+{
+    if (tl_is_64()) {
+        tcg_gen_gvec_dup_i64(vece, dofs, s, m, tcg_i64_from_tl(c));
+    } else {
+        tcg_gen_gvec_dup_i32(vece, dofs, s, m, tcg_i32_from_tl(c));
+    }
+}
 
 #endif
-- 
2.52.0.windows.1


