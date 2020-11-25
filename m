Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp158376lfb;
        Tue, 24 Nov 2020 20:16:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywPAOGo67zqrdostxE5rl3YUBnzcm2bqbqwOgDAT90ZaaaiU7d0zSsZWf6oRxuE3g1vlhp
X-Received: by 2002:a25:d94:: with SMTP id 142mr1408727ybn.258.1606277804086;
        Tue, 24 Nov 2020 20:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277804; cv=none;
        d=google.com; s=arc-20160816;
        b=iUGFA25th/PPsI2mmf+qDK05zgTG6XV9cC4hBnlEHyDxLPTcSVA/hA63ewBAD1E36w
         jf7itFpYAPYC1oRPvnEVth/i38D2lhcHATi6mf22WwPIB+J12SvyJ5u157+3IDcm57AN
         P0MFsUPw9sF0OHEGpETk8hU7skztogg0JFZvjUGmG0JNkD8wGvYGc0kNbEKMQZ46XGxb
         GBWugPsK7q6oSbmL6tBnoSii4PfcFYAWf3k/D6f6Uu7vnQ/UZrnWA3pxDF9xgIx9fCBP
         rmU8Q/7jifM2hGrnZGYrO0LCVklr95Wdq4zrkq/wWIwps4ZCjvFLEne+euzoBrHVuZPN
         SZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bswwFH6M3LzgrGioTuBuBml8sz+8WXNnbRNFMSINy5c=;
        b=YGxV4ZE3xpLO1u85mRfDN8jDod//6FRbwigLJt2Vjd5LEdu9tg/ZzAAoLIoaqB2il8
         b1eVDuUm9wBQuKx8juVjYtZ+Gbzz3d3Oi7n07kJ1XzmE3wZP//Uj+d0QLI9+/UnHnaZV
         VA6XJqN3JRoVC1DBKoESSPUXjaUID+DvHv1MbAhGSHDAZobYcsV0OEG66ZMBLFgiRmL9
         xmrSkI1+aLNf1AO8iN5z1F9As1apuJu7Wo31dHB3hJt+L8gnmSeYe2FO0XBbZ2jXyLYz
         MtWzhJPG1UmPYgjG31NAufyfPz8rTMec98L8ekUm5TfbAR7Pj9tVX2N+qh/kRNb7bdDK
         4UKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPfStF8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g27si955355ybe.211.2020.11.24.20.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPfStF8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khmEV-0000JG-Cs
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm57-00058p-M0
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:07:01 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm55-000669-TU
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:07:01 -0500
Received: by mail-pl1-x643.google.com with SMTP id s2so447185plr.9
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bswwFH6M3LzgrGioTuBuBml8sz+8WXNnbRNFMSINy5c=;
 b=cPfStF8QWfXHzmeHyUAwYMr95YL+SgbOyg+t/I7RgWFMOjg6Mnj/Uj/PkrlTspdXrr
 vaweJ4fHkxzT7rTzGDD+8QXxlri67W1A9ePAECiLTQRSHdIGEY9rBnjU+ei7Ox8vkgnH
 5qhBHXcknXBh7ZJAeWPJWNdEbX7xwPFR+GrDAbROduL4G2QIhSXa+iovkxal2xkkCYss
 W1qoV1fle1pV88fz9UM08pzFmw6ezytjI5jR5dgGqB/JSoAOOBvcBJ7Dz6jbhXPR8ZNh
 iOnOmVG8dCeYATKrSPhHqCCf6TKwEEVuHmTrGZWNJBpFX4PbYHplCduEjR9u41vydADU
 RFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bswwFH6M3LzgrGioTuBuBml8sz+8WXNnbRNFMSINy5c=;
 b=Q780bpXW8CrUeW7i+aPD1BsyE4lJbEJewof4LVUtNeBiuy/NvDCKoDhW+pVrzZBu+O
 Dq9/VMVB2kMAvBPjsKEj66XAmhQt3FmSSeXSkupFDbDruju8wP0cs/wLRPfgGqM22Q/M
 MG+nk673+Y2XuaxAS3GiJ0dNUuvlStqyoMK4aR/21T1VxhZVb6W5uGG2NzBjlIKSIXoq
 imHYoPSMJdQD5G8lc5FAxdXsrasaeTp+pKlgAzmTMKRKRVbNuQJXF8qpqKUTjmah/PEJ
 LYjJjijI//qGc4kZK2E5lIlNoyhbUkDzKMHfACZw/myKPyYmFJIdoZ7DSTox4JxW3l53
 0wwg==
X-Gm-Message-State: AOAM533isqk9OlyrUtDnRojh/UiFezxki8WD6hvQiXKUmx3bTW99zS0a
 zHWY1S3c680bdIPkN0o0P8JEGQ==
X-Received: by 2002:a17:902:ff07:b029:d8:eea2:afae with SMTP id
 f7-20020a170902ff07b02900d8eea2afaemr1604511plj.18.1606277218752; 
 Tue, 24 Nov 2020 20:06:58 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Tue, 24 Nov 2020 20:06:42 -0800
Message-Id: <20201125040642.2339476-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GVXwhnyps1wl

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 39 ++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 330b5fc7b0..160dc3d755 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -602,6 +602,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     int nregs = a->n + 1;
     int vd = a->vd;
     TCGv_i32 addr, tmp;
+    MemOp mop;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -651,25 +652,47 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         return true;
     }
 
+    mop = s->be_data | a->size;
+    if (a->align) {
+        static const MemOp mop_align[] = {
+            MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16
+        };
+
+        switch (nregs) {
+        case 1:
+            mop |= MO_ALIGN;
+            break;
+        case 2:
+            mop |= mop_align[a->size];
+            break;
+        case 3:
+            /* the align field is repurposed for VLD3 */
+            break;
+        case 4:
+            mop |= mop_align[a->size + a->align];
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
-    /*
-     * TODO: if we implemented alignment exceptions, we should check
-     * addr against the alignment encoded in a->align here.
-     */
+
     for (reg = 0; reg < nregs; reg++) {
         if (a->l) {
-            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                            s->be_data | a->size);
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
             neon_store_element(vd, a->reg_idx, a->size, tmp);
         } else { /* Store */
             neon_load_element(tmp, vd, a->reg_idx, a->size);
-            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
-                            s->be_data | a->size);
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
         }
         vd += a->stride;
         tcg_gen_addi_i32(addr, addr, 1 << a->size);
+
+        /* Subsequent memory operations inherit alignment */
+        mop &= ~MO_AMASK;
     }
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(tmp);
-- 
2.25.1

