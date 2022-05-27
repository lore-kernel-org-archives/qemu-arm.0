Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1229810lfh;
        Fri, 27 May 2022 12:06:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1Sr5Q2CSq7DT2h/AB56tvT4eVgAoHXr6Lmo63SVwsy3xSmN88HM4ePDLiPGmSKbwkjPZM
X-Received: by 2002:ac8:4e4d:0:b0:2f9:2f21:5868 with SMTP id e13-20020ac84e4d000000b002f92f215868mr24672877qtw.97.1653678419508;
        Fri, 27 May 2022 12:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678419; cv=none;
        d=google.com; s=arc-20160816;
        b=zOFkv+nkgrlCCc0QXX5Ew+0Fx3GGU4UAp1XSdyRIrsofyPqBBUQtF+V5BLxgiQM2BO
         lBoMivVuHl4b7VmSbnzbpR1u1nphh/jAR21he3KUdXSsSF5DwUkZDqrIMD0jXF5sFkuM
         g/hPBr+rRaRMJwqFXHrsBYW5Y+lBoyxYPav+YG5R9I/81ZUouAcsUx4zAFYafEEqK1QI
         Qcpi2k5IMkbXIwGofMS1Y1OErPtu4T3dkzUK3cx6g9rkv2ay1HdElEzW9XArIXNWFSUE
         HDNbwsaNqGxxG02EoLBhIaEpbGRD72hJKwzuUFotT9vf8t9erRTNwt0y1rRVHBl+v/nd
         qYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=im78Upxg0zk5dU+V0gmuH6hKFndyvPtO+XBJ2vNwYI4=;
        b=V1yIrrKqfhhMX5BMD1LSoDyeFVN9ycEscjmK9G8wu/viXa7Fb7bSEvht+i63dMQslK
         eamtF+iDhethX2mK22UQ9SVtYEMt2u1LCPwhM7LbV8dgNhxmpGIuTIN5R3WUgUWFEGst
         vYcVHLzGhJaE4W4F364bFcVZL8R9lWoCoN46oumQVOIgr1b4m/aV3ND0XIT6pksU18kS
         /mwaM/X0f0oAD115xRMA03U6k90J3KfLkbq6oxYJvQoXMQvqHqmZr2dixG3iYar+X7uF
         to1zM9VB2boNRIcruvEKHNI8FUrCO/+eBZ2cm+rs20ia9kJRL7zw+LfPthh4/rT0M+zi
         EHSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nt1X8aHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20-20020a37a614000000b006a59642897bsi3161492qke.109.2022.05.27.12.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nt1X8aHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufIY-0003L5-V9
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecO-0003eu-Bs
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:24 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecA-0004LV-0M
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:24 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so5022251pjt.4
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=im78Upxg0zk5dU+V0gmuH6hKFndyvPtO+XBJ2vNwYI4=;
 b=nt1X8aHmD4aXJTjIRG6UzHL6ui/OcC1OEMbZ0MySrYj2XTFoCsVvrnyr+eKHRKI5Qq
 q3OMpVYz1tBCqoP89WFeArc7lI6kHTxW7RUR/uOK1rFZ0HsOnQhTIEnUJCxZVe9MF6Ur
 nrMgHKjQZsabJKhIDYsCQxYK/3BfQ0vPAj39cpVGS6d8ZM0SSZJN0OEL/TwfAqKxBYfM
 y2gKSvqO70kkuheottcsJpHjSwnMkrQn0UGCb9kXTC1ou0GvvfH4D9uIoaLvTLkIj9Ax
 +JMPyKOqOurW33JdeYaKRYG49+8MGfSppda+khMKYQ/n743IyANJ4DuemPqXf4Csyuhe
 N0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=im78Upxg0zk5dU+V0gmuH6hKFndyvPtO+XBJ2vNwYI4=;
 b=mZI2LTge/vR4/5gHcS8n1zPq1tYtfxBW++oMYTiamTOCb+x083SW6ybSE9PnVUwgfO
 jpa91X+o+6g/gQTsZAI2CHjXECnAbXI71m3dQLzbKxu6LGaDx+DDqUllMXtfMMVG504d
 ULBM1M55dG3UbopH8dI+JFPN/R7640NuCXS3yTIIRunU1/xF98uu/sPM6ElNilAc9LhE
 BGhvkwNywyJMVdlQfFWVD75/iiG4UfXkieYvfuEotxxV/arhCuaGjOnvQpQLobo6x7mE
 6a9wwb8t1Rvwy9iwHUbcItrbN4sgr6SYC3qZqxBSs1+Rnvpp+Qua7nfq9UPRf6qZtFdy
 HPTQ==
X-Gm-Message-State: AOAM53249DKL3kczoBz+jZTx87kYwGOTVvgQStWTFjyLpfUFbOPBnn/p
 7WP89Vhx7XLEZVFKPkbeti+c3oXKA5f+JQ==
X-Received: by 2002:a17:902:7087:b0:161:88a4:db37 with SMTP id
 z7-20020a170902708700b0016188a4db37mr43916014plk.131.1653675789018; 
 Fri, 27 May 2022 11:23:09 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 065/114] target/arm: Use TRANS_FEAT for SPLICE
Date: Fri, 27 May 2022 11:18:18 -0700
Message-Id: <20220527181907.189259-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +PKLgNk2en8T

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index caa587506c..8eb70fd56f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2658,20 +2658,11 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
-static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
-{
-    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                             a->rd, a->rn, a->rm, a->pg, a->esz);
-}
+TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
+           gen_helper_sve_splice, a, a->esz)
 
-static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                             a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
-}
+TRANS_FEAT(SPLICE_sve2, aa64_sve2, gen_gvec_ool_zzzp, gen_helper_sve_splice,
+           a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz)
 
 /*
  *** SVE Integer Compare - Vectors Group
-- 
2.34.1

