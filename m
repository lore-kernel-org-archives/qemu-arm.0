Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1228789lfh;
        Fri, 27 May 2022 12:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRdiHPJw1Wb3bXoLvOpQ3Bwk5snNti3lUuGzu9pXvpO42ub6wYyiONTEi3qfuy3Gi5rFaV
X-Received: by 2002:ac8:5f0b:0:b0:2f9:3e0c:b569 with SMTP id x11-20020ac85f0b000000b002f93e0cb569mr19205709qta.663.1653678332273;
        Fri, 27 May 2022 12:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678332; cv=none;
        d=google.com; s=arc-20160816;
        b=maOBlmPCneWlLGbTwwXBgwOV4Mo06u1Bzakr7V5PrxPN1Q9D5fbv8Iub9+hfrHMjuW
         lz8gstlTHdBffPqZF6j+Z9O471V+4/S3CiTqdyRyOrgntGeBALNThHFGWDdAaYM8LG7x
         Xi0sZ3GBWuD5E88ZVxtyR8CtuzdEy77Wmgk9E9s6B3QSM92EYiyAyoB0ssozryM1obzn
         9ph85J8BRzMHwPGsz6irsMl5KjFCmlwRTXjV5yGRWVjd0/FE8PbRBeDJH9yRgvcrBnYN
         ZxZz+IiV9dGXkz7JNkrdTnSudiDhjSvcZWc/PfOtwyBRnFt1MjLtWswpQs83Jnw4qdL7
         szqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=02JdN4H2o9VVqutTBt0Mh0X95ZgODcZg43p8fFQRzHM=;
        b=GD/jQnHWZJ2LP2eDf+Yw7qisE1PfWV219JPylnnrFMKI5oCiQEPoUWGSfTuzfPwS/i
         VMz8BEwN56am7v15SzuY6WkslZizulK4gnNkVPpp7RlW3Sf6yvxAYEI1azS8Cec+43YG
         RHC2BNDuNhdrCLl7mzI4TADRdZzenmKtzk/+32nELRP7kHuHVWCGT5bV1JtqxVAzXtAN
         HJI4xVqUMwYdI2CaPiiKfhG16RfU+oJppuDkJqvZNPVVc0fA1ge8Ra+O+Wq3sOQK5nA7
         VPoLpcB4n4DnuyuFFfoBSQHSC03iBu+MWWZess7aImipDD7/kUc31ADqwZC5Jtt2nlpw
         N5bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJdTzXZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05622a00cd00b002f3d54e1a9esi3207844qtw.389.2022.05.27.12.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJdTzXZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufH9-0008FB-Ni
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003bC-Av
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004RU-EF
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:19 -0400
Received: by mail-pf1-x430.google.com with SMTP id b135so4961597pfb.12
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=02JdN4H2o9VVqutTBt0Mh0X95ZgODcZg43p8fFQRzHM=;
 b=OJdTzXZDnRXl5kF7BnDeRyw3dqW5oZx9eRV5aNjMU9GBAjeHIB3iepqhnNaPYhRP6H
 91jVFRxaA0jwwM6oRV3nwOtNR+7eEk8WrNfhNE2kBbEqSouwpWMMx1N9xvazkOG9eWtl
 A4FqTucj0xqOgv7NX+TaZVUKWb6Rrbc08MZq7ti4idlloy++E1BLe12VSJkk5PZSuPsw
 ntDiXvnN7D/OOoxmRG7liic9npNluLWQ4rpP070SRVpTCTIn3b/K8ocL+Nw26feJhV8n
 2PjvseHl6oym7BzJyCmBlBcXB/ineY2XILCYLShBmFiRZSIEytRO0rxzSuUpRxOIp60c
 Fsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=02JdN4H2o9VVqutTBt0Mh0X95ZgODcZg43p8fFQRzHM=;
 b=Gu1En3E/1i5ql8g6DcOe7HF5WWMvxPq9dayoIcUsxt4U3v6DsTW4/9qrMI2hYUEgoo
 thO5fdGh2t4SYyRh+XiNGxkBUfHopz4Wl2V52wJo88PzIw+j6vVifHTL+/mZaJaXxZ7Q
 Pwo7+G7bkylmc01u7pfPvFtrH/8R2iKEI+/9ykRWDvI2aSFauKjiT7JhLyOpR6iSlBrQ
 05WAnW6x4JQFf909NndzNjpO+IdZlIIec6nObBdAcMCWWyGELHtsvKcFHbkACWyvsKG2
 Dyo8OEUW/8ammQl/UdNBWGULn6I/43aRg8Gvm4BBceO4xEV/MymNpV+3KYZke/oKbTC8
 n/HQ==
X-Gm-Message-State: AOAM533wave6z966GiQ65SeDzH0O+JTmQ5L809/M6PwvWwUTnyNsEPZZ
 3kXl1ej1njgHqV2auBzpJjSeYg==
X-Received: by 2002:a05:6a00:3023:b0:518:4721:13c6 with SMTP id
 ay35-20020a056a00302300b00518472113c6mr41382051pfb.34.1653675785497; 
 Fri, 27 May 2022 11:23:05 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 061/114] target/arm: Use TRANS_FEAT for do_clast_fp
Date: Fri, 27 May 2022 11:18:14 -0700
Message-Id: <20220527181907.189259-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: g5fnQMO03Ay2

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5135866798..21c2bd099d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2542,15 +2542,8 @@ static bool do_clast_fp(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_fp(s, a, false);
-}
-
-static bool trans_CLASTB_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_fp(s, a, true);
-}
+TRANS_FEAT(CLASTA_v, aa64_sve, do_clast_fp, a, false)
+TRANS_FEAT(CLASTB_v, aa64_sve, do_clast_fp, a, true)
 
 /* Compute CLAST for a Xreg.  */
 static bool do_clast_general(DisasContext *s, arg_rpr_esz *a, bool before)
-- 
2.34.1

