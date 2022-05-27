Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1254472lfh;
        Fri, 27 May 2022 12:57:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypVOLr7CBMrrjFGAssOJUV5ur4qPtYKXEld/yMWtsqbWqBEDeOhQ8oOgijP7415hIssSi4
X-Received: by 2002:a05:6214:e6b:b0:45b:474:1035 with SMTP id jz11-20020a0562140e6b00b0045b04741035mr37163292qvb.39.1653681429489;
        Fri, 27 May 2022 12:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681429; cv=none;
        d=google.com; s=arc-20160816;
        b=zy9garzsVU2/gwYXrNyP/0Y2fE8/DvQ51VWi8TtFyc4VPgcsV4ZmqeymmZLLvHnsqh
         Wx9zPyRy+hgxp82si78EkoWtHC5MUZEo5qU0NdpLnmPCSv1Nlp+p6VOM9XO20tCRUUb/
         X3mtojUACf0fP4OoPtx52TOk3TsCuLvBomCU1rX4InZvndRYtWDZkqQzEvlO+jsTr93G
         ZbOhax12qwXtjPlJXOfQ776aqkT0hhdDvHjtt+bf8I6103PGV13vFq8LnCr/5QM8Hr10
         toAB2pRfuv8eUJ/C2dEpVL3+vzzJhemFbHQSNY19JRsTZ2wqVVb3BtljtdqgB8tm5Nu2
         +69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Pr1PckvI4GfXO3bbXjP+Iw41YIPqzsw06R/vMa2yI4A=;
        b=twi8cxZ45MFf2x737iPDspHhUTqrJuuyv0Zy8WYTTwmUb9RLhk1e5xiKbrF/EQGnBu
         p1hKlhf3+t+4OMvY70vXRFZznHUSG+UoQTf0PxUKPskp78tO20AliDRYutDbrhjqJvTt
         vzQpvjTFWviQmaav5QFlrRy13w5f3A1fIlei/LUbN91AOevjHRHMb6NUI5HTmEtYmQjP
         yPhkkKElm1CZl50YVJyMprv3sx5yYvjZAZQIJB4PSCNu5OlO/8LoxPfTC1cLnUJqOYdm
         ofFFy94m2rY+6yzqXpdnHNAc8QDy4p0lVAsbFevf+hk2W0Og79oO+Ozcc5CXpEifl4hd
         D3tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vhE8HMgk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv3-20020a05621429e300b00461aeef78acsi3072204qvb.168.2022.05.27.12.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vhE8HMgk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nug57-0007Ln-0Y
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefS-0001fT-Bh
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:34 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefN-0005IH-6F
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f18so4856920plg.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pr1PckvI4GfXO3bbXjP+Iw41YIPqzsw06R/vMa2yI4A=;
 b=vhE8HMgkGXIv24j5Zm5Sav9MzwYtP3WwSG1hReEy+D3KB45Z8qdS4Uj6xU6TugivMS
 CfZ2yQO3+gOuvBbNNg2/COBovLHEQIEAC6EPr6yuRzuQFgnzYBMo3aTd1ZIlpIAMP4tB
 B5Ib2TGOaAR7w/acsl7yWEF1kUKUDwOTOfO1I63Mdz2r5T9fF+tUCxzmrekWwn4wkuAk
 T8GbdYwE1zHiBAgkKUnPrSPjS48bFPR4k6MzHoNzA8tTmFrMMT5njEe2zpX55uiuPlTb
 y2Y0l1sxHA6JtzqUvN38tFu7G1cZDjhqZGtEXa6G7sMAbSIjIn8fXCqhhpH/NXhlubLo
 JD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pr1PckvI4GfXO3bbXjP+Iw41YIPqzsw06R/vMa2yI4A=;
 b=i6ljoTh3t3MK84C+GI5PHcqLzwKN0PwX7QfP2+zJtW5R7fW9ZIJXSkOIBPuNDJsxyf
 Qp+0KPcD6Pf2GWPKDnZv95Q0vlRSdIhUUxKrG8txD4/8btgWJB6IxxasY36GMjW+p/yW
 /PMm6L/PwxjYFKDx9VZ9p79IHZg13AxSqYAMXhZSUsC8/fhdVfCXEVF6SjzVwHdoRXx6
 u0GiWvV9+wVcBcEBWnqX++EayEb4NMTZmnBQMqNu5vzmjpEHd+dObEdGamAll6nOnorS
 WPA5q/07fJs/4goTbhZu5ILTJkphWtARHyBgSGkZ2L7eQXpPe3Pumv5Sie/DoPiPzewU
 SCew==
X-Gm-Message-State: AOAM531CIXPyCbs4jA9OgVsVDZJ4drstoUWefl+ac5JjyMXXX0oPYuPN
 /fBfG54Eh8kPBP+EJQlgPHkCfVgjRNmjlw==
X-Received: by 2002:a17:902:e5cb:b0:161:872d:6ed3 with SMTP id
 u11-20020a170902e5cb00b00161872d6ed3mr17325253plf.62.1653675986987; 
 Fri, 27 May 2022 11:26:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 084/114] target/arm: Use TRANS_FEAT for BFMLA
Date: Fri, 27 May 2022 11:18:37 -0700
Message-Id: <20220527181907.189259-85-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TDPMawnt2/X5

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5aa3e477cf..f2939fbeb9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7568,39 +7568,19 @@ TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal,
                               a->rd, a->rn, a->rm, a->ra, sel, FPST_FPCR);
 }
 
-static bool trans_BFMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_BFMLAL_zzzw(s, a, false);
-}
-
-static bool trans_BFMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_BFMLAL_zzzw(s, a, true);
-}
+TRANS_FEAT(BFMLALB_zzzw, aa64_sve_bf16, do_BFMLAL_zzzw, a, false)
+TRANS_FEAT(BFMLALT_zzzw, aa64_sve_bf16, do_BFMLAL_zzzw, a, true)
 
 static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 {
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal_idx,
                               a->rd, a->rn, a->rm, a->ra,
                               (a->index << 1) | sel, FPST_FPCR);
 }
 
-static bool trans_BFMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_BFMLAL_zzxw(s, a, false);
-}
-
-static bool trans_BFMLALT_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_BFMLAL_zzxw(s, a, true);
-}
+TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
+TRANS_FEAT(BFMLALT_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, true)
-- 
2.34.1

