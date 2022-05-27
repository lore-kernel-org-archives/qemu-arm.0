Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1248303lfh;
        Fri, 27 May 2022 12:43:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5vNhv6QkhFe1j6Hm6dTKlOp1weDd6cGw+NHMhWxIx3XD9GB40xkSudIYgDkd+fOPyfoUh
X-Received: by 2002:a0c:dc8e:0:b0:464:16cc:d700 with SMTP id n14-20020a0cdc8e000000b0046416ccd700mr5529033qvk.122.1653680594068;
        Fri, 27 May 2022 12:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680594; cv=none;
        d=google.com; s=arc-20160816;
        b=nwiMUcJZPqthLbGuzUfeSAF0wzexF7L9KOJ8rD4JIEbwhPHzg7SEvbowOt1UczZSge
         3KeOxrDQ6RimUwMUt8fAlLVUmJY9suErMs1nIQC9ZUbG93a+zLtuZdbKR+AZ8lxkumCk
         cv0KkQumLVNI8k6U0jSGIvU+UQ6jlROncZKAJt2n0FOP/em/IG9k79OzqA55xMdn4O2t
         yu7Z5UjPQT+jLrRO6TLxKYf2Y6XmCj6lte8MwsbSQewKlCFptruTxp4PhHfOycHgxF8J
         zDNKq1ae+PMvQs7RNKwqiPcLFaa8Pj8YXGRespJKwI9iaes1NpIFqjeSaaimSVNgxkML
         QI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cmuDyBoDtlEqQHtk+Dr2h4zUKA0ZCtstTz//A1oZ4S4=;
        b=YW2q98bPMEl+lzaD8hBPQFhbU/WEm0llhH/yuCydXFfxPYrfdGt1MtP+ReXY2m8wyJ
         hhoO05nXNNcxMX36j2xGp0z8UWFETWWwtSP/3iRF6oE6cryTXd+3pPERHOZ2+rurl6GY
         tzk5AjPsOOQ++CxoRhAdi68oBOu1irfXxDisZr0nL0LpyBv/9WR2on9sj1+HbohhSR68
         y3w8Rs3+64NwpM9tp5dVwZ56Y9RcNgBhFfh5fyRcL47rrtZi2amtVL0mMAEGZ8RBDyti
         /0N4qLIlS/2hVZOfadi5wRauxCV8yFo3Ar8MFtkkNrpBkrUsf0Aq4NPfPiDsLDP4X6Rb
         DnkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWPJrobS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020a05620a13ac00b006a004987992si2714875qki.578.2022.05.27.12.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWPJrobS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufrd-0002f5-Co
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecT-0003ji-5B
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Tn-NE
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id cv10so5264722pjb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cmuDyBoDtlEqQHtk+Dr2h4zUKA0ZCtstTz//A1oZ4S4=;
 b=GWPJrobS07pzqw3lH/PBp+vt4GWIZeQRv0LBXxdGUlgGM8dUKgFdceT9ihGiXoJHmw
 SSTwg/QQ4zUTErfw3JYxxz4knoYvMvOnnLi0aabMxFsvV5sheZfJZxzKfyBHpA4SWx2g
 e0SqypwJbmbSbHl0IvLqss8fMiubj22kCUhlR3SKvG2jv38A/eiJ8UIedrBAJCzYOgYZ
 klZ4n5yWOhalhYqrrb29GcNnADM+eMjjb28DkVp+c042BmtY1gz0NpiTQN4QKr5L6B39
 ZBoYMPYwLimC41PPR42tbpH9X1FfbHNbqmZmIbvBuuOgxNdEH6xMXy5TX7Xgvlg79+ZX
 Wa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cmuDyBoDtlEqQHtk+Dr2h4zUKA0ZCtstTz//A1oZ4S4=;
 b=N+p6ITS+8y8uEsVIqcfq6IcxCH6u7DNpoKygZKcuYhTFngNv8/l4CXd0u7h6uAZAa9
 0G9DtLdif/uD2bnxxrukOdd+NrquB8O9B14/G4mA4/zysbuI9tY2v+Tk8zERVWnLynkf
 q/7MWtfXe03zBAriZgoEdfGItOCQkk4gFQY1JBZoLULH9plKOPXz7cfY2Nf8qu6068rH
 oNojg5pren0Lj1y7UNM2mm94pj4lT8/BJ7crF6ZnFRRrHcC4v7HmPhdSbFr/Hm0t5ROS
 IIz5zCEPgVseIqAieEhzErgy7NSIeyQeT1ufw7uy+nK0q+IqeVdFIsY3sarE9Ij/UVw1
 YObQ==
X-Gm-Message-State: AOAM533+QEx0Vf1HK91VcCWJUwsS6ZBpwEX4kSvZjv7ErbhHIk5JNw8k
 m/JglpeDDLZkmRNstwmoSzOytUnq+Q4I+Q==
X-Received: by 2002:a17:90a:ab8d:b0:1e0:a082:b2c7 with SMTP id
 n13-20020a17090aab8d00b001e0a082b2c7mr9535185pjq.17.1653675792036; 
 Fri, 27 May 2022 11:23:12 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 069/114] target/arm: Use TRANS_FEAT for do_brk2, do_brk3
Date: Fri, 27 May 2022 11:18:22 -0700
Message-Id: <20220527181907.189259-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tJTBVnXTHwqd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 45 ++++++++++++--------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 03b2eddd8b..d44b24e988 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2879,40 +2879,23 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
     return true;
 }
 
-static bool trans_BRKPA(DisasContext *s, arg_rprr_s *a)
-{
-    return do_brk3(s, a, gen_helper_sve_brkpa, gen_helper_sve_brkpas);
-}
+TRANS_FEAT(BRKPA, aa64_sve, do_brk3, a,
+           gen_helper_sve_brkpa, gen_helper_sve_brkpas)
+TRANS_FEAT(BRKPB, aa64_sve, do_brk3, a,
+           gen_helper_sve_brkpb, gen_helper_sve_brkpbs)
 
-static bool trans_BRKPB(DisasContext *s, arg_rprr_s *a)
-{
-    return do_brk3(s, a, gen_helper_sve_brkpb, gen_helper_sve_brkpbs);
-}
+TRANS_FEAT(BRKA_m, aa64_sve, do_brk2, a,
+           gen_helper_sve_brka_m, gen_helper_sve_brkas_m)
+TRANS_FEAT(BRKB_m, aa64_sve, do_brk2, a,
+           gen_helper_sve_brkb_m, gen_helper_sve_brkbs_m)
 
-static bool trans_BRKA_m(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brka_m, gen_helper_sve_brkas_m);
-}
+TRANS_FEAT(BRKA_z, aa64_sve, do_brk2, a,
+           gen_helper_sve_brka_z, gen_helper_sve_brkas_z)
+TRANS_FEAT(BRKB_z, aa64_sve, do_brk2, a,
+           gen_helper_sve_brkb_z, gen_helper_sve_brkbs_z)
 
-static bool trans_BRKB_m(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brkb_m, gen_helper_sve_brkbs_m);
-}
-
-static bool trans_BRKA_z(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brka_z, gen_helper_sve_brkas_z);
-}
-
-static bool trans_BRKB_z(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brkb_z, gen_helper_sve_brkbs_z);
-}
-
-static bool trans_BRKN(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brkn, gen_helper_sve_brkns);
-}
+TRANS_FEAT(BRKN, aa64_sve, do_brk2, a,
+           gen_helper_sve_brkn, gen_helper_sve_brkns)
 
 /*
  *** SVE Predicate Count Group
-- 
2.34.1

