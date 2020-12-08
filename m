Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4236518lfb;
        Tue, 8 Dec 2020 10:06:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZB9KePWVeZ1OdDeQGCyOZWt4AJ4TQsCEKKGBL/DHnJGcWVy4VaFi6x1uOzjWojzAPP0tn
X-Received: by 2002:a25:6dd5:: with SMTP id i204mr33737908ybc.267.1607450814053;
        Tue, 08 Dec 2020 10:06:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450814; cv=none;
        d=google.com; s=arc-20160816;
        b=FB2zI/0r0XNdkyoZRChpJZa45vrTKp0mNEBeGme9OepoMmghaETmMmGLuonuT5VGSy
         XUCtaJ3rt2fkuNe7u18gG+5TOGDufjTjlcc1SNfc1mFn3f3QhrhsHkOCp4lBmCDwgnE0
         xhpnqOyoecHFbBU2S+U49kIQxaVGSgreYIP3sdbe97nZasACaMDwnFfKip9Mek7cRX5C
         vGzaleS7dstOB6Tet4bo4t88OVpQYo3Up0pcWR6Xpec7Xd/ajZi1+vcgyxxakhTDjoDf
         WldRgofbIJBsBthZdTdEFNlTDGXigDCr6HWCnU67eTH2BFxDlmiBgAUNeZoJm4MGiqyc
         ploA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ST8z3iXy65XpIqpPPS3C3oOPVYpkO0PbHbv3ibdmUyU=;
        b=WblDi8L86N9DQ2+M+D/0kUng/oYNRALHnODdEG+/b3FGHDjErO4jj6TuydmxhWcItp
         sCLcKeTQg9p2Kj3BynOv2Gz2GIu6i5YLBJySpU6LwtxV3RH+MJeRBA+QTchJMm7Wrrnx
         TSIFIO63WNXRHK8+fRQX6/eq9X2fBEvu1rTd7iVn8KMTdCWAZdMt0pNOApgyewdTWVy4
         YPhmN2wlJattVYB0ul+QUvkINT9Sk1exWXKmO3I6X0b9H55oh5/1uBG/hVucOMAfom99
         AEQLda2KeKRnTANuDtp3/oy67vCnehfBi89kCpFzva0Qow/DUV+0XFn0O+VkgV+e3xB9
         ARLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zaamZuy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w141si16780280ybe.12.2020.12.08.10.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:06:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zaamZuy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhO1-0003ZC-E7
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIt-0007Ux-0j
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:35 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIo-0006LD-Fq
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:34 -0500
Received: by mail-ot1-x343.google.com with SMTP id b62so16618409otc.5
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ST8z3iXy65XpIqpPPS3C3oOPVYpkO0PbHbv3ibdmUyU=;
 b=zaamZuy2WtYxIW4kqK4LXrhb+L/YXJImcZ/LNoUVfWeGghEp65FmFu/kq75QaoE3+e
 7LtKzOpiTbAaVwU8p5gd2vypSR1ahrxEBnbwWwPMwRd8Q15LYeR31BmwmdWJeppmxkyY
 CERSrukQjLwVxAjyljTKLZAwkSf7eCxlhUj3fQDYO7sJchGXa6xg8Zd0QUx65rDqE4Vv
 kvpxUez+e2oCjsUHRxlstUxwceqaOP0R3fvdyxhkP3Cz5o+MTUYfbegSeKv+S4ciGdKp
 vNV2kp719gV7iQxA7uQVnWPNzrcHixhkgSEFcFon3R3kaNmGZdnFumvpLJf94qzsWNT0
 hgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ST8z3iXy65XpIqpPPS3C3oOPVYpkO0PbHbv3ibdmUyU=;
 b=Vd9Ms+9wTlHoMb33N2Bm0TVkQuNeqMJpJTOwm+0Dt9I7lTXYhV8Do1UZVotj1Jplnn
 WUemVc6fWadgJkhwDCGGiMs+AlMoQgbHcyXKJ/BHZz4QMSKtwHI3cbFm702nbkguerhn
 cGh59GbzojmSk111+4TFq3RLIJxphjhjtldsMkVHyaaM+7qz5Msol3NOXl9g3mQUsq82
 Tp7ytdE4z5s2hZhO6li8fCqApY3uXTw4oYy8/Pm1ys3c4C/06fCdSEZGGzCkLOrDuvjI
 k6D5FBdSKbJtVgXm7DcYJLLWeUdHXH+jqTnc/PxmQhoP4GrxbwNuFR8kMYyL1dRj5QQc
 lQtg==
X-Gm-Message-State: AOAM5309+hHYklo4CkVlUYeoyxh7fOW9LMWB7l0YqJ/gWfh/h7bfD8L6
 GPusFOARX01H1cMY8fcDn+CLWg==
X-Received: by 2002:a05:6830:1610:: with SMTP id
 g16mr8736901otr.345.1607450488559; 
 Tue, 08 Dec 2020 10:01:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] target/arm: Fix SCTLR_B test for TCGv_i64 load/store
Date: Tue,  8 Dec 2020 12:00:59 -0600
Message-Id: <20201208180118.157911-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: inI82YhRjGYl

Just because operating on a TCGv_i64 temporary does not
mean that we're performing a 64-bit operation.  Restrict
the frobbing to actual 64-bit operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f35d376341..ef9192cf6b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -949,7 +949,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
 
@@ -968,7 +968,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-- 
2.25.1

