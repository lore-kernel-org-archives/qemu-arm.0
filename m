Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp575165ocs;
        Tue, 27 Sep 2022 06:48:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6G2vx1g5euZr97BLtDCGEGAL6zntUnrCFJ/FPH4L81AnRWO97OEi8szeUGwWOF1j/qUnTg
X-Received: by 2002:a0c:e888:0:b0:4aa:a307:4dca with SMTP id b8-20020a0ce888000000b004aaa3074dcamr20960269qvo.91.1664286517075;
        Tue, 27 Sep 2022 06:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664286517; cv=none;
        d=google.com; s=arc-20160816;
        b=PmFSNV946QL56ZDYlNrC9vQ5HrhckhYyf+RzU3NJPGW6LmRDMebB0ffzApeAykXpcI
         zfGPpftVFGHEKkkySQzMf53ha1sNmLMczxsBIlR2jr8Ka2zbao+SiiNppxMqJZbsz3Yf
         cz8jVFFeyJDQ91pMxd4417od7lssdXZ4+VW1lopXoYq4R2xo5b+WJzPwCHEOi7KvnkYI
         5/1ILw8ZxypUR8LKHmBLruUlsrsRf7IMNV3BgSAWFjfg7hoXVDtGi1Uvvx0oA6rr64Ii
         JW2gP1QxSJbnv/1g019DrpuQLoW18fX8tmG0mY/yltkLib/dd32duIk3pBIxjD7h6DQj
         yEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=wu5NZw4GYTu2UuCzrqMkUw7w/wvt4rVM3nGtb/ZJPO4=;
        b=aHP38MsOy9Sx4izTuTAhThJBuVt4Wx6H/QfLjexDIeTXWtPY/cvcxC++favs0jQ6RQ
         jwzs/imBasT6gzx8eeXPKUb+x5vZjaEaFXlZKCjMN5IZp56dihybh/dG5/o6E+CkxF0U
         Lg8HJ8QEZX7/sV0exNPPMgOSXdsJ7r6NBfvwT5fwIlQybnjQf1E405H0LaCbOdTs29wR
         Q4jEOEXssGJM/QNAPC8u2Wau9t75AAtgYvC50E9bpozXZgyqONw1DUiQsjGwi8rPDYEf
         XQhSvSyOIxyqUcqv+gt+v+8OgnCX9JZUdSH7AP+LK5zAIE0wKyxn02fPjquV6n3d2sam
         4uSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWjsVpYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20-20020ac84a94000000b0035a7198aecesi730975qtq.782.2022.09.27.06.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 06:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWjsVpYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odAwu-00052v-JF
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 09:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1od9HI-0006m1-Co
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 08:01:35 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:34794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1od9HF-00085d-Ot
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 08:01:32 -0400
Received: by mail-lf1-x134.google.com with SMTP id j16so15388297lfg.1
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 05:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=wu5NZw4GYTu2UuCzrqMkUw7w/wvt4rVM3nGtb/ZJPO4=;
 b=QWjsVpYvu+sho+Q8PA4NRW9U8HBvcYREfJ8eK10Zll3cqUGlgojPIHgJZid148ak3H
 M58OMlPHknCdvZB1+1GhCOq2vq618vhy3gVm/6zXc70s8i2XqPwrzymKu5Aa630ThR2J
 nak1LpNHYawvP5xHfNIDqopTkDk37lj7Hc80oTgGPznxE/0TRqlugyMS+NlIEGvQ8qXO
 WQiKMGjYaoE8H8TAO9KCu5BsuVpaD9xhtJ4cMV/0MLqQJlgt23F+Dx787FoOenhogZLB
 JuJGL9ZfIfyI7IKtadxfBgQNPNgjDmSdUAJQFqXcMqiZJjEjmdADL78rTtLQZb1Triuo
 eQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=wu5NZw4GYTu2UuCzrqMkUw7w/wvt4rVM3nGtb/ZJPO4=;
 b=tIojcjbt9arfHTqxN9BgmRm3AfUFX+WtH1f4xd1GaoufUVOh7jUMFyruf5pW3gwVNd
 4aRGXaOuyaAE1sUbv9hnOt7gZnTKAvcN5QJkF557tkIGauPdEUClydaTnBUcgTY67nJ8
 fYNnYd5SLMC9Yyp7KAzae84EMM/V5NhWEQ9C3iGGLwI8I+/WLOPf1BBYLOmcHKfai7k7
 zYMHN/fXcaaj2GcgEU9gXqR/+W2rjLwVToSIFP2duUvWK9KukDqCyBBj/nYMeJEkXxvB
 YQIvwcUcKwA5eUM1xVnAoMmM1fiA5uq0eDP4HHzpQlT0TJiHXlHTp9nPVFBSZppA0YOP
 mPrw==
X-Gm-Message-State: ACrzQf1d+XZowVNm03zcQexrG3KClOrFkk64AjPAMw64XIFi0gvK2Us3
 O0a4ihwCVZlWwg5wU8X/X1a1Bw==
X-Received: by 2002:a05:6512:39d1:b0:49f:6084:4414 with SMTP id
 k17-20020a05651239d100b0049f60844414mr11744973lfu.195.1664280086220; 
 Tue, 27 Sep 2022 05:01:26 -0700 (PDT)
Received: from jerome-XPS-13-9310.localdomain (82-64-249-211.subs.proxad.net.
 [82.64.249.211]) by smtp.gmail.com with ESMTPSA id
 t18-20020a192d52000000b004917a30c82bsm143543lft.153.2022.09.27.05.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 05:01:25 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH] target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP
Date: Tue, 27 Sep 2022 14:00:58 +0200
Message-Id: <20220927120058.670901-1-jerome.forissier@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=jerome.forissier@linaro.org; helo=mail-lf1-x134.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FCATJVaGhWzk

SP_EL1 must be kept when EL3 is present but EL2 is not. Therefore mark
it with ARM_CP_EL3_NO_EL2_KEEP.

Fixes: 696ba3771894 ("target/arm: Handle cpreg registration for missing EL")
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a..328d252a84 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4971,7 +4971,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
     { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_ALIAS,
+      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_KEEP,
       .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
     { .name = "SPSel", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
-- 
2.34.1

