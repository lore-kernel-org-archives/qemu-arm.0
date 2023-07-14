Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4132595eje;
        Fri, 14 Jul 2023 08:47:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHzr8e//V/q7p1SQX4xQVPV8VoevUMi33rcpyQm1zRaI4V1VjWCEJJJ70xa+wZqRXBxuhzC
X-Received: by 2002:a05:622a:18a7:b0:400:797e:d690 with SMTP id v39-20020a05622a18a700b00400797ed690mr7145081qtc.1.1689349633729;
        Fri, 14 Jul 2023 08:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349633; cv=none;
        d=google.com; s=arc-20160816;
        b=VI5nDxoXXvlC0cB3zeTkdc3Iis2kWAr+WdZLzfhzRUFuouMAzkX9VEYh7jr5tF7iEj
         oHo1GvSPy2SWbNE0SW8Zh377XY2atIHQqMHTmlRNDwCfE23d8v4YkAa4I/gOcK1cVLEq
         HlG88bQQVK2T26GGrNzMUGHsJeqEqDG4vawemz/tOeBsANFWXJvexM1g9MKNKcGosZIo
         +D1Meq2KNzTHTCejVTl6PafxajQVhl6i86otsezPBeDCcHYjBdObdUG6j8x6Jbw9Se2C
         XOaftxPdqSp5L8igL4YCXTzjHh593KwKWIvhtUtcC/qpKQjyqTAZSqhLZULQEJKy8kRF
         pVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=e/EJg2t+NohoMxOA2O/a5DEFZTUDueNlOq7nEQNzI7k=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=zLy4QQmoeHyaqYWUtaGAFFmEROP3aCJCraZqAhZfuUcpBuwBZWfbJdOwE5lldIlos4
         jrufHEF/bA83rZQsjP3Sx+JCI4xeVEN2lCfXVZmAodqjTlyRLgT0g4LTrnFQRyStuqHY
         FefhklbSy6DQPCyenTs7SWxM/W6iZ8AFgENEKVdCbLHFWObeqw0xy8tMLDWbTvQXg/Df
         V7myt/6KfSpHvxW84RrAaGQUHqB6Pj9+MFNTOGq8NWwv/CfgthqrQ/HcjelUqNRGI0Tx
         2VZWAV8trDLw3Nfy6oKln8geYZYWxgU9O2KkG86xW/WzTTEk7myqYlIq7snEXb2iGofJ
         kXLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJv+EczJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020ac87fc2000000b00403a4483ec6si4604115qtk.757.2023.07.14.08.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJv+EczJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0S-0007B7-Jq; Fri, 14 Jul 2023 11:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0Q-0007AM-VE
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0P-00074w-BP
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:54 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-307d20548adso2119294f8f.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349611; x=1691941611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=e/EJg2t+NohoMxOA2O/a5DEFZTUDueNlOq7nEQNzI7k=;
 b=tJv+EczJol1fQAcGCVyIz44Ukac7ek/zW9YqYGlQ8JMGoOfyhgOb3i0RO/nn0lNdDF
 ffpC+EpZN4p39s6u2GpHgo7DQE00cc4DcSO5GePbGzgvmcHCVGMMLB0X8sgtcaUyBtJL
 jR+Q6Ingft46lkwDfjPJi2CamtqnPhdFJ91sPkfmlV2+5iKyqVOqIlZqOzOhGv8Xrf2C
 U98Czwzn/hStPdhakSNFpSy/eveaUy49qp82iopF9YYeFGkXKhM7M3hhS72FIa7ktFYb
 91rPO2gV+3LWypF7QydSJZCLI8yC6v65q9nUA96noP1y4tYyjb0hOrJEZu452UNRBPAw
 lqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349611; x=1691941611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e/EJg2t+NohoMxOA2O/a5DEFZTUDueNlOq7nEQNzI7k=;
 b=aJFEjIDxOiGutG4xfXN4/zWgmaOW69RuPF4ZYIWafRyEqVwWpsEjtADTID7SyUK1au
 mo9Qf67a+CWCJFytbHcOBeraVFYFShNjYFuJonJ0aQY0SYeJme1/FO2gZbiUZ/j2y/M/
 qLBEO5bdaXjLk8tnr9hZikzd7PRMRFE/PZQ0aNvaPVvunJxrY3m+XynTKJ6q59qTvnzY
 J5ls1G8ZdJ5A1vRQFfFc5P9cXYvi5d1VIhpmQhadYJ7hNs78/KrOxHoituPOBLiNxdwp
 5/7pClWk3Ou11/DkOYvmBymKfpOuoXrLzdMR9jPYH/1yVJetDzfzgr+bU3na4D1KXsPq
 GIvg==
X-Gm-Message-State: ABy/qLYAHq2acEd+za2vkqWh06itrXvJCXDxzBrdxnTMcJ8RoQJXWgeW
 QLx/nuV2tVbwfoU6G4n5P4jqUw0KB699T8OuSI4=
X-Received: by 2002:a05:6000:1cce:b0:309:1532:8287 with SMTP id
 bf14-20020a0560001cce00b0030915328287mr4136703wrb.19.1689349610961; 
 Fri, 14 Jul 2023 08:46:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/14] target/arm/ptw: Cleanups and a few bugfixes
Date: Fri, 14 Jul 2023 16:46:34 +0100
Message-Id: <20230714154648.327466-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xZ90tIobDLVB

Based-on: 20230710152130.3928330-1-peter.maydell@linaro.org
("target/arm: Fix ptw bugs introduced by FEAT_RME changes")

While I was fixing the ptw bug in the series above, I noticed
that we had a somewhat confusing mix of ptw->in_space and
ptw->in_secure, where in theory the two are supposed to be
in sync and you can figure out the in_secure state from the
in_space. This patch series' principal aim is to clean that
up by removing the in_secure and out_secure fields in the
S1Translate struct.

The first three patches are fixes for (minor) bugs I noticed
while I was trying to do this refactoring because they're
in or around places that were using in_secure.
The next three are basically plumbing: passing ARMSecurityState
arguments instead of boolean is_secure arguments.
The next four patches then can get rid of uses of the
in_secure and out_secure fields and drop them entirely.
Finally, the last four patches are minor bug fixes for
various corner cases that I noticed while I was testing this.

I don't expect to land this series until we reopen for
8.2 development, but I might as well put it out on the
list for review, since I've written it.

thanks
-- PMM

Peter Maydell (14):
  target/arm/ptw: Don't set fi->s1ptw for UnsuppAtomicUpdate fault
  target/arm/ptw: Don't report GPC faults on stage 1 ptw as stage2
    faults
  target/arm/ptw: Set s1ns bit in fault info more consistently
  target/arm/ptw: Pass ptw into get_phys_addr_pmsa*() and
    get_phys_addr_disabled()
  target/arm/ptw: Pass ARMSecurityState to regime_translation_disabled()
  target/arm/ptw: Pass an ARMSecuritySpace to arm_hcr_el2_eff_secstate()
  target/arm/ptw: Only fold in NSTable bit effects in Secure state
  target/arm/ptw: Remove last uses of ptw->in_secure
  target/arm/ptw: Remove S1Translate::in_secure
  target/arm/ptw: Drop S1Translate::out_secure
  target/arm/ptw: Set attributes correctly for MMU disabled data
    accesses
  target/arm/ptw: Check for block descriptors at invalid levels
  target/arm/ptw: Report stage 2 fault level for stage 2 faults on stage
    1 ptw
  target/arm: Adjust PAR_EL1.SH for Device and Normal-NC memory types

 target/arm/cpu.h    |   2 +-
 target/arm/helper.c |  22 ++++-
 target/arm/ptw.c    | 190 +++++++++++++++++++++++++++-----------------
 3 files changed, 135 insertions(+), 79 deletions(-)

-- 
2.34.1

