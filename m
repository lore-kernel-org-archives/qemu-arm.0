Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp690311ejb;
        Fri, 31 Mar 2023 07:51:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350YsRJn47pFB3qMulFBvg7Q0B8cVPKDLRMQB7EKvE2kxeVexgzOanXmvPn0eCjLdR4g0/XlT
X-Received: by 2002:ac8:5c88:0:b0:3e4:eb03:687d with SMTP id r8-20020ac85c88000000b003e4eb03687dmr27187428qta.44.1680274301377;
        Fri, 31 Mar 2023 07:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680274301; cv=none;
        d=google.com; s=arc-20160816;
        b=p2Jrwk3iYP+gU/fMh0W9dBkZN5yIXIoC7MUVoeJU+5hBYAtYFr04gL/VmLwTcXdk9K
         lMexLnM7h6NSk3z94CZFo0ke9i1zfJsAxKwyy6VHZvcCwsrQxAyg01IlmR0iLBoKoimy
         wrFbIRVon6F6ETft0lRPBjxxNOC1cp9j1jNgKoBUxqDhSEREFBIonlJdLjbJ8Ls/+RTE
         EENRRWr4BH31qv0ZGLW7QAXMvul0bkVVv9EWS/hEyPpdQ66lCBYql1RyAGXNvEQfgXeM
         SanN/1GXQr1bCK6HHK38MELvghZOQfAWkCayNVM+uP1UZKatw0LcVtSqcJTzpayaYILW
         KOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=BOarpuRm+IrqDu6sABKN3WM6NwFaVVCdOuZfwYDzPeU=;
        b=z1rV2kB20fcM2T+tR0mG+4trLjX9P4kwiSPOxaNuRnJpLy8CNJys63yGkiGszuOAu6
         HanIeC1tc2we01GHwp8L3TQabFD+Bk/MkKd4nVtug3jUv2DCbkEHm0fcuUveYQ1tBvjv
         o2HWagV659UaiJLlXvzgU3q8Xr0uPZzgj3BPWWJwSHr0btYmByENTkX5Gf7LTnSiA9Du
         osKw9DOr2C+dr/K73/qQn/aIjsMWCEdHKQpciPbr19s9Rry0hOc2yyFfDVrVouoaz0EF
         stO3Y+GU2Fm3baA06S6bC6NJ5eloYVIg6yt+eDU1+PDmUFZuE2NCE/rOgT9qhUavS1Iy
         FGVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1JOJE1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22-20020a05622a031600b003e4e4725b94si1682251qtw.565.2023.03.31.07.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 07:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1JOJE1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piG5c-0000ZM-41; Fri, 31 Mar 2023 10:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5a-0000Z4-A1
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 10:50:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5Y-0000bR-MS
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 10:50:50 -0400
Received: by mail-wr1-x435.google.com with SMTP id t4so17460778wra.7
 for <qemu-arm@nongnu.org>; Fri, 31 Mar 2023 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=BOarpuRm+IrqDu6sABKN3WM6NwFaVVCdOuZfwYDzPeU=;
 b=n1JOJE1Je+HZ8lb87dYTbgKp0VQ9bh0p2LVnr95M5Qz6QUshiGF2jqWbVsH8Rt7RxJ
 O0k1LgokcipvLe7d/tgaST2rQCNymXA6pTEHlM0eH/QijDetKoLg4iWEcZRPx0pSePmP
 TbFXLKZz9lfhcLkigdTMZSWp3coOUWx3qwf0mg6O8bGMkJXw5yVwQGJpOSFvNnOPeh6F
 VCqheVBglzK5nWATNnySsl7F0mDxPPN0MeRWXPJPhbDIOQf7eViwTrpLHlzAttffDZNR
 yOtYg6OiwUGqSecUvdyWb8+ZUCjy3j1CQhnmyXROactxbecJ7ucOcsU9i8dzrvXNXEb6
 FqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOarpuRm+IrqDu6sABKN3WM6NwFaVVCdOuZfwYDzPeU=;
 b=1GceeHkaNR42kPje2eoh8NE0ON6RjXOmumzoS1PPqfHY77J87yLX/D/JEAGzCkPhH+
 4+V/tYJu3VWzNydVXLsI2QaMNTY9TxvWTpwHB06sy6uc+sjlPAcBzR1C99sqpZPNRFkk
 csMBNx3FwfsD0q4TXm2kFCakt5R1QBJipLpG/f8QoxBO14ylrfYaUnnvRleYK2J2QyUl
 Rtwt+zYw3WZu8lP9SZmCUH1iYgR/aMYWobqCz8CRYKOgcB7/9bPSEHHJ+ON5AP8EtE//
 oWjce/1yTIWffqC+qsiJkp1y43l3T+WtclSpWH/o8IdeNUxM8yDz5u9lF0lCqb3LMRDA
 vG8w==
X-Gm-Message-State: AAQBX9fUdbe5RBPpxrPKVBHtVJWJhffcLLzMioYQIrXayQasCBRtZsve
 i787+Ng4IiTQl6RPEzucj2i2jwW8O9U6NIRCzcU=
X-Received: by 2002:a5d:5392:0:b0:2db:9ccf:f9f5 with SMTP id
 d18-20020a5d5392000000b002db9ccff9f5mr21601955wrv.0.1680274246907; 
 Fri, 31 Mar 2023 07:50:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b002cfe685bfd6sm2339831wrv.108.2023.03.31.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:50:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Fix ESR_EL2 buglet, implement FEAT_PAN3
Date: Fri, 31 Mar 2023 15:50:42 +0100
Message-Id: <20230331145045.2584941-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uqf9AoerJ8rO

The main purpose of this patchset is to implement FEAT_PAN3,
which allows the guest to force privileged code to not be able
to access memory that can be executed by user code. (This is
an extension of the existing FEAT_PAN which denies access
if user code could read or write the memory.) That is all
done in patch 3.

Patches 1 and 2 fix a buglet in our ESR_EL2 syndrome reporting
that I happened to notice while testing the FEAT_PAN3 code:
we were reporting the detailed instruction syndrome information
for all data aborts reported to EL2, whereas the architecture
requires this to happen only for stage-2 aborts, not stage-1
aborts.

This is all for-8.1 material -- the syndrome bug is minor
and has been around forever so isn't worth trying to fix
for 8.0 at this point in the release cycle.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Pass ARMMMUFaultInfo to merge_syn_data_abort()
  target/arm: Don't set ISV when reporting stage 1 faults in ESR_EL2
  target/arm: Implement FEAT_PAN3

 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/cpu64.c            |  2 +-
 target/arm/ptw.c              | 14 +++++++++++++-
 target/arm/tcg/tlb_helper.c   | 26 ++++++++++++++++----------
 5 files changed, 36 insertions(+), 12 deletions(-)

-- 
2.34.1

 
