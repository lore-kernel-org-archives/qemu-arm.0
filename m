Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4027124lfg;
        Mon, 28 Jun 2021 06:59:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9OeomObcPR5g3pzF30/KbmjEc6XL8FOD5DNA91JPJY2lQBxRBEEXR24QbVRdAMnrfpMFi
X-Received: by 2002:a5d:9059:: with SMTP id v25mr20987231ioq.113.1624888740743;
        Mon, 28 Jun 2021 06:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624888740; cv=none;
        d=google.com; s=arc-20160816;
        b=QdayX8FKoHnJozkC+jUzKbB5sfcD53HyE73EoZ0YNBNrTay+cQRNPuxEcxjW6BLjXE
         jl5M/YW0uYeQVQ77kEFt3J9UShlyXKT/YOXwhLrlAAGYRtQyqRSo0huRFLOfckuHJN9h
         NSXDlX09NDGY+EwAtDLXgz1VTH4nj0C7gCcKI8Kj0+XOW9TU72ngiLzFIOmt8C1q0or8
         chULw3TSP2t90pBMac7lNgY3wTuK92pAWcHCXZvDmfNNsPKYUU2iNFe8WlPSSoF9G5oZ
         XAaZdP38X6jbRccHgdc2xUplSEmAng0wgRQoshXCeVeGiS0ggcUN2S1zwHLwekXkREAj
         EF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UtewGl0K+eTZVJgD9VxEV2gHGwexdZngsmOi5Ju2Gis=;
        b=Xep79ADKiM1H3iTbL5A9lHYFCPMvyaVcjkDPD2Bq1GdKHryE6mi0YkxMYhEfySrg77
         rZHDRPYYm8NXueVuZGj5BzzjWSg1PlVOc5XfieexAgwvsPxk9Auf0y3YYrCBd+O9vN5I
         bPJusxME7jIYh2M13oa64f5WLdoXHMOK//X9gpyQ/RLlEETtjhI39q/rWQ0BKhWU16WP
         SVT7ED8JjfyGzW5rL2jepL0UNIMkMzDqbIVIHRel+0sQWzQstcAdLY/eaeRW/dPs5RrV
         WhyIvDoVhqcyXH7E3qeO5bfUgsI0Uw8kNByPl6ufaQBZpk1zT3vbuFzbO9TPkB8si4Fp
         1i5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fGwRW3zy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si3708929jaj.54.2021.06.28.06.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 06:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fGwRW3zy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxrmt-0002cn-Ng
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 09:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmb-0002aX-IT
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:58:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmZ-0005zr-Ml
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:58:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id l8so12634772wry.13
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UtewGl0K+eTZVJgD9VxEV2gHGwexdZngsmOi5Ju2Gis=;
 b=fGwRW3zy44IjsK6sXnWBbTZ82bAIFLIV+QKEu+9xufiAl+7uZX4m8Y1mXNKjLWhA7E
 Ue8d5CMrIqFyOAtSSiPDFCmdhKhLcdGgAq0pL1k4dNPO95FNLMfW2y2JkvTOLp02tk7u
 2JKfHxxhlWw8nPonv8M723e10ka1ipW4nUvRb34VY2BGK+hWmWA9GtqcTbDt19b5EETt
 OEcUbNm40I8HVUCteo+0XQhjrI3UjkL+whv7nHBeQZPUveYxaYBr6VsE2UBByX1tDCs2
 A2SZSFRlR7lwC5n/scRfIdY8+rkriAOaVi4BUBGfgvzol7HaLsuBL7Mv11V+9IbxBCYa
 g/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtewGl0K+eTZVJgD9VxEV2gHGwexdZngsmOi5Ju2Gis=;
 b=LiKDQhkTtEICsIW5lQNTw08tPVcYF1PL8xZ/3XukE0oct14Ebzj1Yy8Mn58AOLgiTN
 hBkHqF5rAwwnIlHxI36zGYCV7us2jYRKvfxGTioUSu0RJvZdnJiKykpKpTfonx7erUeD
 Rdib91YV2ebA53j3BPZow+aUcuWKDDE1atB0yg2hxbzE3Vq6W+IBqYPi03m3Ladn9zXn
 PyjkmHk7A9TRiYAJZDyLYjRkg7WqNwxzloOtYM6joUEUjLQrMjserxWDpNxD9rSfr97Y
 yyey8JpCevj9CDhZLpH5d72Aaf70J63/3ME1D/NCbk7OCGB0A3P4T4KF98BA+0XzFKhW
 8TNg==
X-Gm-Message-State: AOAM530KlpxdG6h7JC61gIjhLKDhYC1Iz138YwTucOfvUHeKQ+T3JO4+
 M6gYSuoSvgXFf8lOezrSBvBQe3xiohZ3IsKT
X-Received: by 2002:adf:f84a:: with SMTP id d10mr26653006wrq.34.1624888718277; 
 Mon, 28 Jun 2021 06:58:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/18] target/arm: Fix MVE widening/narrowing VLDR/VSTR offset
 calculation
Date: Mon, 28 Jun 2021 14:58:18 +0100
Message-Id: <20210628135835.6690-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kX0fFWQnHLx7

In do_ldst(), the calculation of the offset needs to be based on the
size of the memory access, not the size of the elements in the
vector.  This meant we were getting it wrong for the widening and
narrowing variants of the various VLDR and VSTR insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 67462bdf27d..e9a5442a724 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -120,7 +120,8 @@ static bool mve_skip_first_beat(DisasContext *s)
     }
 }
 
-static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
+static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn,
+                    unsigned msize)
 {
     TCGv_i32 addr;
     uint32_t offset;
@@ -141,7 +142,7 @@ static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
         return true;
     }
 
-    offset = a->imm << a->size;
+    offset = a->imm << msize;
     if (!a->a) {
         offset = -offset;
     }
@@ -178,22 +179,22 @@ static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
         { gen_helper_mve_vstrw, gen_helper_mve_vldrw },
         { NULL, NULL }
     };
-    return do_ldst(s, a, ldstfns[a->size][a->l]);
+    return do_ldst(s, a, ldstfns[a->size][a->l], a->size);
 }
 
-#define DO_VLDST_WIDE_NARROW(OP, SLD, ULD, ST)                  \
+#define DO_VLDST_WIDE_NARROW(OP, SLD, ULD, ST, MSIZE)           \
     static bool trans_##OP(DisasContext *s, arg_VLDR_VSTR *a)   \
     {                                                           \
         static MVEGenLdStFn * const ldstfns[2][2] = {           \
             { gen_helper_mve_##ST, gen_helper_mve_##SLD },      \
             { NULL, gen_helper_mve_##ULD },                     \
         };                                                      \
-        return do_ldst(s, a, ldstfns[a->u][a->l]);              \
+        return do_ldst(s, a, ldstfns[a->u][a->l], MSIZE);       \
     }
 
-DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
-DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
-DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
+DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h, MO_8)
+DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w, MO_8)
+DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w, MO_16)
 
 static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
 {
-- 
2.20.1

