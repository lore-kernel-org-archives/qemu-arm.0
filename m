Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7196881eje;
        Wed, 19 Jul 2023 08:58:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG4qHSgLsicoSA/uzTpy4jWMdldNd7iEEewIpZo9SgWmtP7lTg+Tj6jAnyEZJuXjDCzUuEY
X-Received: by 2002:a05:620a:4387:b0:765:73e8:da9b with SMTP id a7-20020a05620a438700b0076573e8da9bmr16524686qkp.78.1689782280909;
        Wed, 19 Jul 2023 08:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689782280; cv=none;
        d=google.com; s=arc-20160816;
        b=yLVUZ2L0wvZF0NSXqD7f3yOKywjfppXE0Ic8ElpPzoM+YsBNKCTFB9APNI4gjy7gGA
         pq9kRCpWv4e0zQUBWM/0qOinrQAkixLvG38dL+cY5k+UcNdR+kPLWtpYLRjGQU3myJPE
         VctbmmNM4jQ9Sbwox4A05wfGxPT1O2uaTE/wpF4yHO2vqVy26xk3K+ZtQQLhKCrwK/h0
         cDZwtdFlZbX7PCZdwRSyJcb5X3hskqFAYr7NgDvVCPAbH40zkTPe0uhreQ34zd4yl2Vw
         fAKMT4TH2qvPRT2ubPKXjG1a0E4PMUfqsXPpvyvZylT7ZwqkK7Pbq8fJ0+t3BzzyV4Mk
         100g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=JuHkd755TxaRlWG5RlSsbScpQRuzOZpdpHhnh7Tq8Bo=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=V8GjHQU6LuPB+5kK1r1S7e6EHrvvdxvnK2BRolgrXMeYfFnGwo4AeU1rxG38fmx/XG
         j+sZsQqkz8XY7x/WgijD8QND6wRplJ8GmA97UwiWlf9r2Z5fIja03WKdof2yzhLT4zuq
         Pfr7ukEtlJP4wrc6s6CbUk0Z3vgpjS4RWvyvtLT5HFbkEVvviPKQyDvLCuEV0J44dcmJ
         P6isESofRxFyEtP1ZijJ5JAEt+4aRpR40KEC32jIsD387howdAl3vbI228SCvZf1bF0K
         WdNIHZVMB1at4SZbiXqMP1I2Ok317hl6wM97Hx2WUlOVLMUPMvWTMH9aatI0duVZBqmb
         6LHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=il98BA0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a37f504000000b00766f96afaaasi2799028qkk.701.2023.07.19.08.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jul 2023 08:58:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=il98BA0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qM9Xq-00036R-Ab; Wed, 19 Jul 2023 11:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xo-000360-RS
 for qemu-arm@nongnu.org; Wed, 19 Jul 2023 11:56:53 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xl-0007IQ-89
 for qemu-arm@nongnu.org; Wed, 19 Jul 2023 11:56:52 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b74fa5e7d7so110738781fa.2
 for <qemu-arm@nongnu.org>; Wed, 19 Jul 2023 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689782205; x=1690387005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JuHkd755TxaRlWG5RlSsbScpQRuzOZpdpHhnh7Tq8Bo=;
 b=il98BA0FoIm/w5G8f7ZCiE11M+cfZsGcff0ybwbYZCIA1/NGinxOyETlFzoiswdkj3
 s4TYHYKEz9T6h/26L+vG/NJOHRYJWY+U5XVXJVopNFjTrpXcy/ijFFKfKWISdQrBECvM
 l5/XLZHHMPM01GhI7DgsFTHVl7hsXMEZIWOmHNeOvaeSbF69lUsGp085C42orBOfhdBC
 EFYlqGGdOyOU7Lwck3eJly0TwlesCpR/aB7NlBU5vsE2Ky7dHO9hrnQAqx8vDUFjaFx8
 0Kt3UKAHDN3wfIxoLGx6HtKwiqOoLCRdnmG3VEws/RxryoO0sWUJAXetsc07Xq5tVe1T
 GFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689782205; x=1690387005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JuHkd755TxaRlWG5RlSsbScpQRuzOZpdpHhnh7Tq8Bo=;
 b=VDTNOFX5NfsqRvzO5oIOFob5PNNPWrW1cbD1NtTGVDW4Oa0BlCPpbjd069juHHZwC3
 i1RpMsjQO3svtjbD8R0kZkq0EDG/4qq0Kdp8WPgCw6EpQC/ugVou1Ygh343UIDwZw5jA
 QbvG+6Zyrkg9sq2MzkDZNPLOa+WXU30rMAtO7jt8kaDsaPrIBl+NPjoEmcmcB9ZFykKv
 TDruoRUaAaudIRCUexWzxB3IA+oFutIQUNZ1zWNnc9q4cRYgmGX3bhLS3TRFNIeJaUIP
 N3tfc+edF6h+pmcPFSF1wLL0KFjukbdhFkeYz96mfurDPix70fvdsjqml5P9cDKirEaJ
 W4cw==
X-Gm-Message-State: ABy/qLakDxUEYcd0kXa3fTPnJUkyxsBa+pU3rRqZM/K+2toOkm065Z9j
 v/U0s/8zGE/Y/ho3Tfh7ZUwr2Q==
X-Received: by 2002:a2e:9919:0:b0:2b6:fe3c:c3af with SMTP id
 v25-20020a2e9919000000b002b6fe3cc3afmr274730lji.27.1689782205210; 
 Wed, 19 Jul 2023 08:56:45 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a1c790e000000b003fc3b03caa4sm2351006wme.0.2023.07.19.08.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 08:56:44 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 0/5] target/arm: Fixes for RME
Date: Wed, 19 Jul 2023 16:30:14 +0100
Message-ID: <20230719153018.1456180-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=jean-philippe@linaro.org; helo=mail-lj1-x235.google.com
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
X-TUID: Gg5Gz+GL9rJZ

With these patches I'm able to boot a Realm guest under
"-cpu max,x-rme=on". They are based on Peter's series which fixes
handling of NSTable:
https://lore.kernel.org/qemu-devel/20230714154648.327466-1-peter.maydell@linaro.org/


Running a Realm guest requires components at EL3 and R-EL2. Some rough
support for TF-A and RMM is available here:
https://jpbrucker.net/git/tf-a/log/?h=qemu-rme
https://jpbrucker.net/git/rmm/log/?h=qemu-rme
I'll clean this up before sending it out.

I also need to manually disable FEAT_SME in QEMU in order to boot this,
otherwise the Linux host fails to boot because hyp-stub accesses to SME
regs are trapped to EL3, which doesn't support RME+SME at the moment.
The right fix is probably in TF-A but I haven't investigated yet.

Jean-Philippe Brucker (5):
  target/arm/ptw: Load stage-2 tables from realm physical space
  target/arm/helper: Fix vae2_tlbmask()
  target/arm: Skip granule protection checks for AT instructions
  target/arm: Pass security space rather than flag for AT instructions
  target/arm/helper: Implement CNTHCTL_EL2.CNT[VP]MASK

 target/arm/internals.h | 25 ++++++++------
 target/arm/helper.c    | 78 ++++++++++++++++++++++++++++--------------
 target/arm/ptw.c       | 19 ++++++----
 3 files changed, 79 insertions(+), 43 deletions(-)

-- 
2.41.0

