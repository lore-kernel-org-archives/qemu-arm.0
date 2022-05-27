Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1221340lfh;
        Fri, 27 May 2022 11:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRbFwYQqTFujXYqmiNuNy00rwLDAW8UkZWSfHu6vcrFTzggOj4lbsWvmOFoJ3LRr6vfpbg
X-Received: by 2002:a05:6214:20e6:b0:45c:84f2:424c with SMTP id 6-20020a05621420e600b0045c84f2424cmr36200047qvk.101.1653677540977;
        Fri, 27 May 2022 11:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653677540; cv=none;
        d=google.com; s=arc-20160816;
        b=HywZIYote6zNO2gBryle65MeGVoknN3npQnSH0NZanEioaBEBkwO8ejqXG2NALT7/Q
         jrt3+sFy7+V0REaKIHMTAwnvOD3I/++DYQ2JYrNFiB0fnn5KBjYmu+1Nhf/4begwuaMF
         IXeLsX+5AExSAcSx4khHcYoKtKy8TQip82zeWNkex7y93rgH0pFzQa7LSdEuBWN34iAU
         esTMcz1uIQ9E95jqlWOP/Akmfnah99AAO2fqY5SUbTTlnJhzcwbh0Ct8FMBMbCzhghGd
         aQq6DrnfA4XQcLQRUoqEMRnBKejsQPcR/cWWwKAMb3dR9nJzFxPENfx+IWblovNg0eiB
         sv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/89+mpU4GVs0pAHMXaIe+xUvrTlp6qO+k1ForQR6iFY=;
        b=gaO4boEW3KDsZOi1d8MeJtq4zQt1EAMsXXabovzr3NVFBFQg26CufBcYr+0H7Kauwx
         U0FJ3J973cnu0o0AQJoRsyK8lT0j3d8kILdPM3hgmWVQ0C0/2oLmi29J6NTY+VZhL/6S
         zcKBIpa7y2MWbCjeFVK+H80rpcM2k731CwQhU9tupYgsvradLcustNXFBOH/XyHMSAu3
         LPVchXpisBZKWUtC1Yu+d1XB8TIiA6ltL9YsjGWGZJFeah/NHTKc4s1aljD8fegzQ2Fb
         0LAPYZW95WgRHUkamRmHPT+cyfvU63qVQGQR5FO4YN+EyjpWFCWnxj3kv4tLNK7YiTrO
         9Asw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/KzQvze";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020ac85a0c000000b002f91d6964aasi3185778qta.651.2022.05.27.11.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/KzQvze";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuf4O-0003Og-Fi
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0003RA-VC
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:09 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004Ly-NU
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so7788055pja.4
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/89+mpU4GVs0pAHMXaIe+xUvrTlp6qO+k1ForQR6iFY=;
 b=T/KzQvzeeiv5S+St32XWG440N5ZbSvA/fulvgdAu4n6VE019khhYrh4TOdl/Dmr1lM
 +7grzdEeZhk3btWcc9PNgekVBTK/DQWDXYXLLE6EdcZwKRDmvj7RyEe/4FpB9+XZ9v+D
 hgnKZlDsO/rlQdz/1q6V71HThphiGbAFxa7GEvOg3bTPiFh1Twn48BdvpEKpoxBSRaZ6
 EvRF6nkVHU799dCMeL21q3wQNesStJZuMcX2rnqLBV3uayTfNj+FlRWNZKnfa1xfkg23
 mrzfZrFoDw173n5g0P49iGr4XNjCl/l1KxTaFtAWvoS9nADEXrf4FUWTVJ6lvFu5gYgR
 8CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/89+mpU4GVs0pAHMXaIe+xUvrTlp6qO+k1ForQR6iFY=;
 b=JE2iry58X21lpAUSgFnOIoZTXYbRptZpY/z6A/lbo8zp4C1i8WTe4B1eVYgC4rHYbV
 JHNt3cJfVe8qBb2AjBWC8Fmoqfx401tpb4pFr5r6y3P46J2+P+fvnj01/iKQONxj9K/F
 oJJm7tJrDGKlUnsnHpG9JGCA1IGJhPT43p2doa7/yAS1o5XeRScQ4YQYrKRWD8fJPERL
 M47KZWO6m2rgU0J8z33TGOT8rOrA+1CvZlaPVjskr7EGPGxiO/HnlMR/fitM4bp+NAcx
 XQdt6ResUnSmAIy+nm02FQxlu3hnrsPCVcengGZVb0cgxfndHg0MFrcA0i+xXPFGmvif
 k3AQ==
X-Gm-Message-State: AOAM532kvDOB4TPdXpnZM0Rsm0zgr9lmpA/SP8F2ZFXQPXV36xOtLOOZ
 C/UhqOPdkrrRdrldZHVTxSlQFVU2D1e68w==
X-Received: by 2002:a17:90b:4ac1:b0:1df:c71d:510c with SMTP id
 mh1-20020a17090b4ac100b001dfc71d510cmr9505777pjb.118.1653675775994; 
 Fri, 27 May 2022 11:22:55 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 051/114] target/arm: Use TRANS_FEAT for do_predset
Date: Fri, 27 May 2022 11:18:04 -0700
Message-Id: <20220527181907.189259-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Os++xXXvv/QP

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c8eb2c684b..ce6e000f6f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1616,22 +1616,13 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
     return true;
 }
 
-static bool trans_PTRUE(DisasContext *s, arg_PTRUE *a)
-{
-    return do_predset(s, a->esz, a->rd, a->pat, a->s);
-}
+TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
-static bool trans_SETFFR(DisasContext *s, arg_SETFFR *a)
-{
-    /* Note pat == 31 is #all, to set all elements.  */
-    return do_predset(s, 0, FFR_PRED_NUM, 31, false);
-}
+/* Note pat == 31 is #all, to set all elements.  */
+TRANS_FEAT(SETFFR, aa64_sve, do_predset, 0, FFR_PRED_NUM, 31, false)
 
-static bool trans_PFALSE(DisasContext *s, arg_PFALSE *a)
-{
-    /* Note pat == 32 is #unimp, to set no elements.  */
-    return do_predset(s, 0, a->rd, 32, false);
-}
+/* Note pat == 32 is #unimp, to set no elements.  */
+TRANS_FEAT(PFALSE, aa64_sve, do_predset, 0, a->rd, 32, false)
 
 static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
 {
-- 
2.34.1

