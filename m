Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp607638lfc;
        Tue, 13 Jul 2021 06:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8zHMhhl5c8CthImwZz+/Go7XoirmRc5121LJ96VmLG1TQH8bhXc6Hdv1s5eQajbI69rf6
X-Received: by 2002:a7b:cd17:: with SMTP id f23mr5286017wmj.106.1626184440878;
        Tue, 13 Jul 2021 06:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184440; cv=none;
        d=google.com; s=arc-20160816;
        b=zUBKXHHWMV2khcMw+YvP/W6OjWblEy8shOgMAw9IR6IZLwVla9BS97+NNNY27l+Ghx
         o0c4NLiVRastsJlpQdUPuvTHYeUJaJujxHdpPothDxUQJ1nG3kC55RGdUm0KjkTIeDmS
         wKbUQH6R+Pd22wZ9yhsy6Gx4rk2Yq+eWa94+3QXDZVK1PVUOHVDtb1g0o4DeJ/JW656S
         HBDcXm51V69NpdrjtSwF4Rn+Idp5P8AzSg4lwq5KXWPZwdgSL2+2sOctMgHwLY7Ghf3+
         +tZWOdrNXiMBivq2gWlp6WnDJVw0WnWzIbSdSO1X8dPJ1g0gaYWUpBDK+9pjEtRjzjcq
         oAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1gNwG3Zi1TKHMAG22ECIQQgeqEd5OSlOPRogN4sXV3U=;
        b=bBDAVcQ0zNaXWydmMeri9H9Xu4DFJwS9EBE7l7MsTziQG0pEfZ/+iSZMln+4Cczq//
         Vxk8iJK+SjoD99oqLB4rrEGiZAJk07hW8iUtTOqKdOoDbhbDX6nGWX8220OuVcl6k5nN
         8+6hlIP0MJZ77IlzgjiDkcdW0BN2a6UrPUteO3tmptB1/UYDYR3S6bycf1cEhdgKlGOX
         JWUWs2LH7ICLanOgYgNhQINrx8JIlT8hCJFE24SBdmoCSXeAtcEuxebznAnosNCbc6Gn
         rHULAQQGRzQeP2ieCEDizddmjFQt8gzl0/jz3Z3mYIObK7/1I/zn4EqqSK280D/MM/VR
         k/1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SzkjwbeV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si3694447wma.62.2021.07.13.06.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SzkjwbeV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3IrH-0006tL-Rt
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibj-0000E3-8r
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:56 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibb-0003lY-Ng
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:54 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m11-20020a05600c3b0bb0290228f19cb433so1673675wms.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1gNwG3Zi1TKHMAG22ECIQQgeqEd5OSlOPRogN4sXV3U=;
 b=SzkjwbeV5NY2Czucw6R8O20ODa2S0ch9gQy7W+0wNORcS4GYP1hV+0bIUe8rQD002i
 GsauIVXKmJnItq3OAjMaiTGlw9bjL6vUP+Ghx2VBpN5ShH3E8gcNIRkh2IV+rn1sZrHH
 i/l8y47q+nVV/tOCJB4EnZPOJmj8H0rWEh6Eh7nJlYwJ99fF9HqFyvpwPOeTYBif2tWr
 AMPgkC+WA+iCa1GsvAOVRTQ1XIPBrsRGhl462sIXrAEIpiBffsR1d4wxHC5Pk//WotJn
 tWkF7xC/LyITCTlqy/rn66GyWLlhqrghsUGL88FcpCWKI0W7hUunkg0wA2VY/VVNa9kE
 cVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gNwG3Zi1TKHMAG22ECIQQgeqEd5OSlOPRogN4sXV3U=;
 b=LZ5jmJzS3iMMTOyTxh9LavkltYRuWWgVITtmrf9awPgpUMqEvDhhGlffyoUQLSbf2A
 cQ7Z1662Bkt8j//cAk4Jpu1hfe+1D3JeBtWhrgYTUZSMDM7EazvNBf0/PtmSk9Vvni0U
 dzOfo+Z8BL9OrtvoNrJMp0UJq3yGoQ6QO1ImZj7HFsopiq+HYKVXVXOmvqFHkKRJ/YQg
 QiugYAWPtSab7411W+8MQ1ygMy0/iKvcQN8gwX94b1Hi3d8CNudw8hmFQaZhtmtfTkeA
 0X1xl/imRiyPBFiUpcn1xg10f/m6ue/Z3L7Ul4A5BoQQU2tK5/gSB8zB1M6EYZnvncnt
 6AEg==
X-Gm-Message-State: AOAM532QJs7YfKaJcmiSVQ5POnrJemhzLAAQ+zrQlPAfUObKXRtU3cRw
 xYWT1bHNuSd9+oAH5FsFmJbCjw==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr98472wmc.88.1626183466445;
 Tue, 13 Jul 2021 06:37:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 23/34] target/arm: Rename MVEGenDualAccOpFn to
 MVEGenLongDualAccOpFn
Date: Tue, 13 Jul 2021 14:37:15 +0100
Message-Id: <20210713133726.26842-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vbjzMaXl/yfG

The MVEGenDualAccOpFn is a bit misnamed, since it is used for
the "long dual accumulate" operations that use a 64-bit
accumulator. Rename it to MVEGenLongDualAccOpFn so we can
use the former name for the 32-bit accumulator insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ba5b7809b09..22b178296f4 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -38,7 +38,7 @@ typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenTwoOpShiftFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
-typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
+typedef void MVEGenLongDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
@@ -653,7 +653,7 @@ static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
 }
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
-                             MVEGenDualAccOpFn *fn)
+                             MVEGenLongDualAccOpFn *fn)
 {
     TCGv_ptr qn, qm;
     TCGv_i64 rda;
@@ -711,7 +711,7 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
 
 static bool trans_VMLALDAV_S(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[4][2] = {
+    static MVEGenLongDualAccOpFn * const fns[4][2] = {
         { NULL, NULL },
         { gen_helper_mve_vmlaldavsh, gen_helper_mve_vmlaldavxsh },
         { gen_helper_mve_vmlaldavsw, gen_helper_mve_vmlaldavxsw },
@@ -722,7 +722,7 @@ static bool trans_VMLALDAV_S(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[4][2] = {
+    static MVEGenLongDualAccOpFn * const fns[4][2] = {
         { NULL, NULL },
         { gen_helper_mve_vmlaldavuh, NULL },
         { gen_helper_mve_vmlaldavuw, NULL },
@@ -733,7 +733,7 @@ static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[4][2] = {
+    static MVEGenLongDualAccOpFn * const fns[4][2] = {
         { NULL, NULL },
         { gen_helper_mve_vmlsldavsh, gen_helper_mve_vmlsldavxsh },
         { gen_helper_mve_vmlsldavsw, gen_helper_mve_vmlsldavxsw },
@@ -744,7 +744,7 @@ static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VRMLALDAVH_S(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[] = {
+    static MVEGenLongDualAccOpFn * const fns[] = {
         gen_helper_mve_vrmlaldavhsw, gen_helper_mve_vrmlaldavhxsw,
     };
     return do_long_dual_acc(s, a, fns[a->x]);
@@ -752,7 +752,7 @@ static bool trans_VRMLALDAVH_S(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VRMLALDAVH_U(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[] = {
+    static MVEGenLongDualAccOpFn * const fns[] = {
         gen_helper_mve_vrmlaldavhuw, NULL,
     };
     return do_long_dual_acc(s, a, fns[a->x]);
@@ -760,7 +760,7 @@ static bool trans_VRMLALDAVH_U(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[] = {
+    static MVEGenLongDualAccOpFn * const fns[] = {
         gen_helper_mve_vrmlsldavhsw, gen_helper_mve_vrmlsldavhxsw,
     };
     return do_long_dual_acc(s, a, fns[a->x]);
-- 
2.20.1

