Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1046686ejc;
        Mon, 22 Aug 2022 10:37:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4HI3uR4dSzwJfHaEBL9lRo6Oy8jEkAw5wZ7s/5F+0MlytXFZ3awp6m7o4f2Re+zPKmaXSy
X-Received: by 2002:a05:622a:287:b0:343:6e93:ac49 with SMTP id z7-20020a05622a028700b003436e93ac49mr16690282qtw.75.1661189854354;
        Mon, 22 Aug 2022 10:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661189854; cv=none;
        d=google.com; s=arc-20160816;
        b=uD65UkSag0/MCGes8UZ7/HCwSLYHqB0DoK/A7AyU7twaxREqXpEZWWsQH9bDJg2tuQ
         CK63J/umy3g+I9TmgkVJ5eh+5VZmel3B4Q6Fp7J22+GS2R3tRz2a8xleN6Ip7ZSzaL4c
         JKr08fHSikhr4TefT/bSGG+cy1zi3y+9Z9sYpCmatGBnoI5V/EtI4GzgVrA8X5G+GKEz
         lq1DpjBSRN0lXz0M2tbcH7lD32uL6UlIYeb+fqs8b3h5txny03Z2ThO+9UEYLY/ODJkg
         BORgqT7He8hgCx14+KRThrB2vuH354MMJ927s1QfPSWtP17uMUYAF23w/G2OSygdoPz0
         c6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iTCmXn4zbNmqsU+EjRI1sB7Q7oTW2VW8cDEmCqjn7r0=;
        b=sW0np1GKa/1A72nXCgYhNpKfVY9Tzd69CAAy3tD6ZJ0HdKfIMpphSdwaHjilJcMcbd
         4SzT2t9IpCzW6dbvxg91WyN3M/UcgTRDiExHHdQjdkkB+NaxgbCmfbA4lOGZ/D/J5eFa
         HdLzF7Gp5I6NmpNV3BsL647ecDdR3R5tKxXJQuffZAZs/1N7Qt3RXAAR2lqjoVUMZ5vy
         2yhZn+gPWXNBuBQPYnyD7LFNCJDHXQBkIzCD3x9so3l9ZBQ732HicNwJVdUDiH8+YB9J
         keAAMPCjL5jYtF9YuPuSjGhvDdnsydyqRTxOlnQE2a91kr8TNFlXeWItqFO7pU5EGpMK
         JfGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmhb5D62;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020a056214076500b00494d400c2f8si306083qvz.320.2022.08.22.10.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmhb5D62;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQBMj-0006Qm-Q1
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ox-0004ki-Kq
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:43 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9On-0001g4-R7
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:38 -0400
Received: by mail-pg1-x536.google.com with SMTP id r69so9697813pgr.2
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=iTCmXn4zbNmqsU+EjRI1sB7Q7oTW2VW8cDEmCqjn7r0=;
 b=gmhb5D62NZ02NLF9hoI4VJ+2R15BL+HlllsDEsFan9cYG1NgmzjrppTHnBPH88aBxB
 ZqhbRBGQKPM7srEQ8+EOjmyjBek1fl6c2TbX/ACuyce0thUf7sxquvUjU2Y+JqekrVJL
 WjoBVdZE5vZluFDFa4GYZ/bw3dkMVLpxU6PH5FC7gmmGIutFl7sxYZO7SlLx1feD8/kn
 iWblGzxupaDKSERA0g3ZZo2/CWA+Z5qFo1peX+ej9h+skO0mkpmwTbPjFxCT8IRNfW0H
 tZaJxoEN6zIkPwRaxyKvl2Knw0RtvmG3Z7DIyFd4gdVKiHBNFmFoTpv2gvScqDmaJKay
 cAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=iTCmXn4zbNmqsU+EjRI1sB7Q7oTW2VW8cDEmCqjn7r0=;
 b=X1jtoLTpE7MwB55+m+FWedohzrv5BO0qo8ND2I3zMsgfWG8ri7CjPh2dJLctO2fefv
 D/do6DcD6wvET6noB9fpYIdmzSpq2EhPs8ax8Nvex8F4VcfjKubLhHOFCfjknYdrKUJw
 5K98mskMy7qXM54b2AtKmAgmYAaVp/5tcUw3t3OhXYWpmhOYWMWUk/YOZeOP7E1Yerxx
 iqpk01Ku3rbRVTlwkRmpU2/uZsvMP/5UQ/vXIVxkkyX9KXn3fz5BDRYMn47Ub+z+sRAz
 iMRBnmLw36SvytNiYINV8Z43bZBZpf9XLiW/Z6crDvmSY/IlFv5TszOBHTdBfoEn732n
 JtKA==
X-Gm-Message-State: ACgBeo2iF9sNcWQQp6+TY+d7NIz69sO5LYCQc12K84Rx3Hqx4Nvlx6mW
 AgUmV7VCrht/0ah2MpGPjDKyfA==
X-Received: by 2002:a05:6a00:1a:b0:536:d522:dbf1 with SMTP id
 h26-20020a056a00001a00b00536d522dbf1mr2283516pfk.42.1661182291838; 
 Mon, 22 Aug 2022 08:31:31 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 56/66] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Mon, 22 Aug 2022 08:27:31 -0700
Message-Id: <20220822152741.1617527-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: LJ1/WCa41kIK

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8fb4baf604..4a1a45d424 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4079,6 +4079,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.34.1

