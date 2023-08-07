Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1483745ejb;
        Mon, 7 Aug 2023 07:15:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4A5Tino/kMGE2rrZ1aL89lgsAtqorVw8FVeOSa8VrF/WvTqtTQ+rOnni9giUrvvzh83KS
X-Received: by 2002:a05:620a:284d:b0:76c:c563:cd7e with SMTP id h13-20020a05620a284d00b0076cc563cd7emr11891766qkp.61.1691417752987;
        Mon, 07 Aug 2023 07:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417752; cv=none;
        d=google.com; s=arc-20160816;
        b=0j+tIEVd0qvl9JOGhcVeU3OaAEBWZzndHki1uEAPIEY4e5oSQAsX1x3VircMOu2hWf
         R0Dk3AQQt3SfLkWvqhxCGP3giRjG83fNyY8OJy3VH0ow9xYx1vBlg+YeR6erquet3/Y5
         FxwdpmC7qrTPHH1zPvoV91Y2PnpfUHBl9HNCN1Q3snJMZl7VGtkOZVTC0xf0y3RepZRh
         yuLFyxcjLAABHy/W+CYVn7jM27SQxDbgA6AX+PKdv6YG7vvSCMqCt2eh/wp4KxzqVFXW
         HDvquSdRyvNz39oTZ393Iq89vUY2m0IFc+dmJUPVw4TqGPXICFKY36Ys0ibKlJKJPYuV
         31gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=f9tizgWmwswfKOu+cgNjVcEdMF1Xn+daiPSP9q+Z8ZE=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=PotHqEm++CnURF4ZqLEEQNghVVML7Ljg2+jJ9NMmzNN9ygebX66FAtAJCf5gouGeRO
         VOIgyD8P2AST5OunrbtpZHQNqy8ZmgKfKBU5rVkwWfnZA1cUpE8nPCIm9H5BjEGOvlea
         Go7JSsYUXYRJqdFoaK40txjDAqzqUn/c4l7rrUHle7yhfWG405a32gfBD52ecAFzl+OE
         KTVvESeMTnH/8H6ZMHSpNIHOa7rSA7NR+O3bA5uDcExmsSJT84wi2pagGeBxWXGvyYOT
         KfNrIMEbjFrsGV5DdbOMaqZLcpjBJMGG0tNu6XWsd0TQcRfYkxoRuDdmwonS1ARgRj1S
         La/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p9rcZRTB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a05620a288d00b007673771fa5dsi5126048qkp.491.2023.08.07.07.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p9rcZRTB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT11D-0000Dz-1v; Mon, 07 Aug 2023 10:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT10z-000070-Oq
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT10w-0005Qp-He
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe5695b180so12751045e9.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417716; x=1692022516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=f9tizgWmwswfKOu+cgNjVcEdMF1Xn+daiPSP9q+Z8ZE=;
 b=p9rcZRTBeieaHL+BJsJLO7dahJwcjjghxx6q18PYSKE9AWGmhdet5aTsarn5db5Gn5
 ItAGExS8FZqz6ufTxCl29CwoOcYJbKwHg3gilZtU5KgvPRAV9sfrgfQOgCh6Ha7FwsGO
 +O9F62W5/yWGPrsHEJvVMNWDJbOBqs1nbUL6mzJa87SwQafbywCNEUruyxwb+u8b5+dn
 I8Qln5QzWRvUNnw1jm0G1P46F3ICtn5voZYjoX7klD1uTbof7HZyT4f2CHSKfuIXTvy6
 ARbCFBvB5LFM6MJKsU9IXp/Tkq1V65qr4Tp9RnvN/vrbm08bxRbRYO8I26GPtoG1ZGhy
 Jxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417716; x=1692022516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f9tizgWmwswfKOu+cgNjVcEdMF1Xn+daiPSP9q+Z8ZE=;
 b=PUK7XFlvXO2wI+naSpDeLi8rVfNIzm0bQtv7l/N3/5ZhiQdOPU23kQ/7ZcshLgZiDh
 AZoe0uikiUzH0bYZiBdxvFhJR4+ql1yuL+lqA0hbZLMC9yYlAunXo+3XzaSA5wmnR9ae
 m+CYV1R26dcPLhwS04mh5M/KmtHJDl4D62phQTVTzqAcdwtTJWdYPrIrGI6mxZ8fXXHN
 67DBdhUhqc3vm95Kd/i2NcOQRPo7Tyy4+0XcwNcSToa8QESnGPUTSZ9ttt4EBGhQ4yYz
 85n/lDpr75D+KcZiTQXhiVCdLkIbAapHcFx1z6aURvik7qrQqwu4YWGJpSpf4Bf39tsN
 RZSw==
X-Gm-Message-State: AOJu0YzVgOTn3VrcwQtWmFDaoynfOSKd8fsHV/NuvQ9yohzlYoRgeAVj
 CedARpMtPaVTQm2bKibz48E7I0ToBY4cjGCZxng=
X-Received: by 2002:a05:600c:2193:b0:3fb:f926:4937 with SMTP id
 e19-20020a05600c219300b003fbf9264937mr5737546wme.31.1691417716489; 
 Mon, 07 Aug 2023 07:15:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] target/arm/ptw: Cleanups and a few bugfixes
Date: Mon,  7 Aug 2023 15:14:59 +0100
Message-Id: <20230807141514.19075-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: X20/x4YV/4vR

While I was fixing a ptw bug recently, I noticed that we had a
somewhat confusing mix of ptw->in_space and ptw->in_secure, where in
theory the two are supposed to be in sync and you can figure out the
in_secure state from the in_space.  This patch series' principal aim
is to clean that up by removing the in_secure and out_secure fields
in the S1Translate struct.

The first three patches are fixes for (minor) bugs I noticed
while I was trying to do this refactoring because they're
in or around places that were using in_secure.
The next four are basically plumbing: passing ARMSecurityState
arguments instead of boolean is_secure arguments.
The next four patches then can get rid of uses of the
in_secure and out_secure fields and drop them entirely.
Finally, the last four patches are minor bug fixes for
various corner cases that I noticed while I was testing this.

Changes v1->v2:
 * in patch 6, avoid calling arm_hcr_el2_eff_secstate()
   with ARMSS_Root, rather than making it return 0
 * new patch 7 ("Pass an ARMSecuritySpace to
   arm_is_el2_enabled_secstate()")

Only patches 6 and 7 still need review.

thanks
-- PMM

Peter Maydell (15):
  target/arm/ptw: Don't set fi->s1ptw for UnsuppAtomicUpdate fault
  target/arm/ptw: Don't report GPC faults on stage 1 ptw as stage2
    faults
  target/arm/ptw: Set s1ns bit in fault info more consistently
  target/arm/ptw: Pass ptw into get_phys_addr_pmsa*() and
    get_phys_addr_disabled()
  target/arm/ptw: Pass ARMSecurityState to regime_translation_disabled()
  target/arm/ptw: Pass an ARMSecuritySpace to arm_hcr_el2_eff_secstate()
  target/arm: Pass an ARMSecuritySpace to arm_is_el2_enabled_secstate()
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

 target/arm/cpu.h    |  15 ++--
 target/arm/helper.c |  23 +++++-
 target/arm/ptw.c    | 192 +++++++++++++++++++++++++++-----------------
 3 files changed, 146 insertions(+), 84 deletions(-)

-- 
2.34.1

