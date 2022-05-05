Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp768431lfj;
        Wed, 4 May 2022 20:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2SnSDsJ+aZxMz4RVK/wWgDaJ2yBe4ixhz2MI+ceTF4CENnp1q/EkeMYW2xyinbkg8dk24
X-Received: by 2002:a05:6214:500f:b0:458:51c0:ac8e with SMTP id jo15-20020a056214500f00b0045851c0ac8emr20763923qvb.3.1651720429267;
        Wed, 04 May 2022 20:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651720429; cv=none;
        d=google.com; s=arc-20160816;
        b=C2Oqy61tv2BNO6rqry6QuF/LOFJOMhehO0SqIgzaTw3obIdHteb+HtxkrXfRVXVude
         FxEF99FdDXDYMpN/eRnoWyHE1skUKao3IA8SgjXPtUKB9Zi7NhQr83PmiqAl52o5py1/
         mm9Sr0bgnf1L1MpV0nIyNmQnrfjceHpyl0kNP2AeyNAjPX/sFnonFyrxiWUvfTk2Cp6E
         vuzEQ8bRakrftmBcgAdndcWCGAKCfAh1Ojhh8xjqbcOYQfrs/nVdQuAsXUs9q8Buf7pZ
         hBwWkswH4nnH4kn978nwfyTOKGsZwXYHVa0iq7SNYAJPbBN60gx91Uk/ihAtibwZH7jE
         1R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6J5MbFV9+5QDZTer5mv6673ScD1edhPGc7IfKgoHBC8=;
        b=ppQajpo6z+/h+NPalJDfKXRa5goVuha5g0yJGGJaorJZGVSOUdBqm37mm1W/tpS43T
         4v6ecUXCsfG4L+fJqFZG9IE/07DrX44T3aSfz6h+nRzDxaBUqDFayV8yC00d0e8SfZB0
         ht1dGPlPr79YL5hWEl/adSSWEOUn1NTSgmtzRya3eDPMbufTs/s+09dm5Et8nhFPFCLW
         2njYc/bXFgz1sTjWYCBoMxulf+EiimgvUh+ecbaxrDWGWHiSPHZ8N3xlE2nF+T6X6w4t
         n+aeUFXXB7IHJUWwg4fpfsdq/j0nZrA/fTFT9tPJQq+n9pRMFGib+b4XZUYxWHSkaeaO
         b3ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sfc.wide.ad.jp header.s=mail1 header.b=JEVdgLPo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=sfc.wide.ad.jp
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020a0cea81000000b0045a88d4f792si186842qvp.285.2022.05.04.20.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 May 2022 20:13:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sfc.wide.ad.jp header.s=mail1 header.b=JEVdgLPo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=sfc.wide.ad.jp
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmRw4-0002qX-QT
	for alex.bennee@linaro.org; Wed, 04 May 2022 23:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkei@sfc.wide.ad.jp>)
 id 1nmRvC-0002AF-P7; Wed, 04 May 2022 23:12:54 -0400
Received: from mail1.sfc.wide.ad.jp ([2001:200:0:8803:203:178:142:133]:47920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkei@sfc.wide.ad.jp>)
 id 1nmRv8-0006Va-0K; Wed, 04 May 2022 23:12:53 -0400
Received: from localhost (h219-110-166-078.catv02.itscom.jp [219.110.166.78])
 (Authenticated sender: mkei)
 by mail1.sfc.wide.ad.jp (Postfix) with ESMTPSA id 25C4A4655;
 Thu,  5 May 2022 12:12:43 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sfc.wide.ad.jp;
 s=mail1; t=1651720363;
 bh=KSqF29AEingAgln34VcmqF+WeN8XhSc84wgbRg18ENE=;
 h=From:To:Cc:Subject:Date:From;
 b=JEVdgLPofyhCF0CpgJ1j2RYKGLrEoHNp24GJpJ/1sZK9DPPFVqqOlEcE926PKeLSe
 qBBrni8gIMy9vGNhHeoPcdprMUx8ow+7zDJv9bP+QstxRSUw+4QAQbuj7vhiTuOazs
 Xq9UcT0Gpcdm3fq1SkCagIeVy/oAth6Lx+fKGMxkxcBFNXyCKSBURScyTxl6cpl7St
 gjwUFynqsflB5Ln2NbJPJE5MgNdGEXuT7F9NqdJHyR3X7X/9G8amJfQD/WAbZSXOkq
 90rXLV8OAX9I/3dl9DgclM67onViqau6L7ndgQXh0EGYTklu2Scxuu6UfVvUp8tOdR
 Vj8xUlqgzGn0A==
From: mkei@sfc.wide.ad.jp
To: qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Keisuke Iida <mkei@sfc.wide.ad.jp>
Subject: [PATCH] target/arm: fix s2mmu input size check
Date: Thu,  5 May 2022 12:12:34 +0900
Message-Id: <20220505031234.20349-1-mkei@sfc.wide.ad.jp>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:200:0:8803:203:178:142:133;
 envelope-from=mkei@sfc.wide.ad.jp; helo=mail1.sfc.wide.ad.jp
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: u5DTMY+SsnOf

From: Keisuke Iida <mkei@sfc.wide.ad.jp>

The maximum IPA size('inputsize') is constrained by the implemented PA size that is
specified by ID_AA64MMFR0_EL1.PARange. Please reference Arm Architecture Reference
Manual for A-profile architecture "Supported IPA size" on page D5-4788.

Signed-off-by: Keisuke Iida <mkei@sfc.wide.ad.jp>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5a244c3ed9..868e7a2c0b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11116,7 +11116,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }
 
         /* Inputsize checks.  */
-        if (inputsize > outputsize &&
+        if (inputsize > arm_pamax(cpu) &&
             (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
-- 
2.34.1

