Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5114831ejc;
        Mon, 27 Feb 2023 14:59:00 -0800 (PST)
X-Google-Smtp-Source: AK7set82QiOBEiyE1i067WTeO49sk4fOY9oZNrqAZfpM/HkQ4FY95Mosi2Eu09A44cJJj7/QPIiU
X-Received: by 2002:a05:622a:1987:b0:3ac:fba0:cde with SMTP id u7-20020a05622a198700b003acfba00cdemr1835665qtc.22.1677538739936;
        Mon, 27 Feb 2023 14:58:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677538739; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcFO7Y7AXcHQv9Kw9gqxawIAOpZxaax1k3iDw3ZNi+vBy6/ZcNBrsVjjZtroTdUQL4
         tsBZucUWNhmHKESBjEeiKsbj0JBlgyGU1WGW/IrQfHYq1SkhX3/fLB7Cx2yBnf76UdTV
         Wf9BFbiAak/nbf0bJOSWQsV9R7aTlokDcBV2ZAU4C+KKmgf5BpTdvF6aSQJUbmJDAotq
         z0wn04kuQUCOLsyWagKjJZpLiVa5x2pvIhhP7wP2WeXLPoWZtXKeBq/fVjB+hPWqaobK
         xbSWv6/D5ViUzC4eLf1M4/1uEj9VczgExPMTHoUdeUXwCPFTSyBBmLt/XKk67tCQlfxV
         UHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=J33WqVqAxFla+dpmD2MbLyNB18FeHqj+AFmY8xo8oOg=;
        b=f1RKNrCMkoep4FiYbFR0MVWfSC+GJlMXXNEAouej7SOGaBisbLmFuzmaKYt3my89l3
         xKpxWAjjScd7naSwlqT5yR9M6DwpdhzL58Mw7b5ebP3gXdYEI4MAhKNPAZgNYBx4gIGt
         abMm2n/YbDaaV6lyMhU8s4HlRhhP6/ezpHvkO4E8c+N2tdWWFRKYJrLLYjaelv3eURJd
         X7pgKC7RR5G0VGFsLnq7uzgfatTFkbl3ZEsnPNEZCa/ZSiTwK8xcnpcGKRLmrZ3LvTJ3
         iB0l+t2IQGzrE13rJfRqiNEbSql1Z4YRaoLjpr5cjtOZA9d4jKBDo2W6deqcuw91o0ka
         QZiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q9Ddh4nA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020ac85b8b000000b003bd0aeddbdfsi7204715qta.66.2023.02.27.14.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 14:58:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q9Ddh4nA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmSC-0001Qy-SJ; Mon, 27 Feb 2023 17:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmSA-0001PE-UI
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 17:58:42 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmS9-0008VM-1B
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 17:58:42 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so7770809pjp.2
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 14:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J33WqVqAxFla+dpmD2MbLyNB18FeHqj+AFmY8xo8oOg=;
 b=Q9Ddh4nAqUVNIP3p/merUIIeqsHyMC0zpe6gxHTvWWr2TRkPXf/W0fQF6n6bnhN14x
 UuohiUN5eRTOL05z8hKraKpy6Tu1jlASLyT+aifFtUtaWCXejSbmZ1OGa8efZNFDtDTN
 vgmyIebL/NWQG2v3G+Ab1m26wtrcEGJw1w/P8Qp9Ngbaqq0cBj53WFCLtHbgjCol9FSf
 VAgtXymBGNuub9b+a+L6bkEA7LRqJz8YQIZ53+FjeTHm+gxjNLrhWVS5CU4ihjVDl8Yj
 5wK1sHe7Sd04b2jNJtPafLUMVMUgjPwyiJ63AqTXy+bRrXdtiAM4f3I1ApPhHwSbXIne
 vzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J33WqVqAxFla+dpmD2MbLyNB18FeHqj+AFmY8xo8oOg=;
 b=Y+K34Sc6G2hl87UB6S7vHBT8QOkZxCQHtC1D1zLaki6pYJg5Tyg9Bsd/e3rjwhne/4
 u/LS9RUgxBBntBU4E6yy/IHgsVBiRNAyUmouIObMRt6XGU4d0nzv0IUYuddDXfhSYSUi
 6qnG4SP2/FgLZI1iPyiYVngOL/2G+ZmhqFvhjgqPnSxPxHbA7Kk7qAU1wJ4qvLBjHzSk
 049cfGGFnulSvJDhWi2jv1KDA77Uq1kvPaXysWJYJBTMZdXL8m3x90IUR0US1h9blrms
 0CNPW19WYAuPxV1fZ8abJUo7Jj0Q7Hfk4hNC8DOnAMB1JTHHyeI0lcTPmQRU4zWRsm6o
 asJg==
X-Gm-Message-State: AO0yUKVfEkqvpnRtl/w14Dc5MYO91o8x4n/fwSuqTkTZyRVK76hgvSm9
 Ajj/AQEjks2LODo1U/Jd24pkDg==
X-Received: by 2002:a05:6a20:c323:b0:c7:1da3:e3a with SMTP id
 dk35-20020a056a20c32300b000c71da30e3amr924967pzb.16.1677538718760; 
 Mon, 27 Feb 2023 14:58:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a6566c2000000b00503000f0492sm4441050pgw.14.2023.02.27.14.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 14:58:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 2/4] target/arm: Stub arm_hcr_el2_eff for m-profile
Date: Mon, 27 Feb 2023 12:58:30 -1000
Message-Id: <20230227225832.816605-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227225832.816605-1-richard.henderson@linaro.org>
References: <20230227225832.816605-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uMFFfV/Nd65B

M-profile doesn't have HCR_EL2.  While we could test features
before each call, zero is a generally safe return value to
disable the code in the caller.  This test is required to
avoid an assert in arm_is_secure_below_el3.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 14af7ba095..bd12efd392 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5788,6 +5788,9 @@ uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
 
 uint64_t arm_hcr_el2_eff(CPUARMState *env)
 {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return 0;
+    }
     return arm_hcr_el2_eff_secstate(env, arm_is_secure_below_el3(env));
 }
 
-- 
2.34.1

