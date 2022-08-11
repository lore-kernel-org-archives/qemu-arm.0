Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp651500ejf;
        Thu, 11 Aug 2022 10:17:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7kcYDRbXq8VSGaJyavMZ6Wml3m7Uzh6pECZohLlV27IPWSY35pWEZqLp9IHbVFR83blh17
X-Received: by 2002:a37:9606:0:b0:6b9:8a88:b2bd with SMTP id y6-20020a379606000000b006b98a88b2bdmr8844103qkd.381.1660238239845;
        Thu, 11 Aug 2022 10:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660238239; cv=none;
        d=google.com; s=arc-20160816;
        b=l2ak9CetZ1fSNwuabbf9A4+3d4oTIXDpIhnksxB/JBGM4jjJgKGOA1YzHwE2E5UACi
         pvuiPSg4+vKJ5pu3ow/1YDrlxl8uqqFrvxujldKD/uxaFQfad7tnWl+HiIZE8AkV+6qw
         iui+1zMmFO1kN55iraiNWalnEcz+7iLJ9/3bThMF8gJ2b3kfUiZt7mJuUsAKQR+fdY/C
         8M7ZWwx4blaAv0FWrITh5ozCe0OkWO89TH7Y4jmCET26kO/unLkW99hgDdxF1GJogtQz
         wyRCIP9tXeKtyxyRP8Phao0a2ctzADyZg4qXwHwreCxX2xyemHwQGv5VNH0LtoISQbTM
         RL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LAPtWKrKaZqjEi+4+qsyZ39lAOW3AbKKlekZOCCWKzU=;
        b=AaxPvf4x78bT8eI8f6EBd95cUetXL6rdr7qDJJLiRepA119/bpteogp6MM5R0pbyuz
         FNeh3s0kAVlF5aZ+JUD7Y3qvnCM58ia9qG7tvUYRiDdV5xdpyxokdBahN/rWUveqg70E
         r0gXQkEd4BHvuk9houj6KwxulFXW5krsjJkzKLm88Oagh4N89YxbiK1145EkxKgeX+3r
         8jYEC3RZ/2OJ5Hl2j49hV2s5YhaANPnL/TAFRvBlzmf00df+ydFoS9IwjBKXoOmeU2SG
         Mcv2rdRvvgNDo5Rqp5tj9/LJSYlo5VTxf4tZYTBmtguUTpIWOA0Y2w4NEfVW5rmWZk1W
         tG6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pGRI/RsF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020ac85a44000000b0031ee3fceb62si2317016qta.524.2022.08.11.10.17.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:17:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pGRI/RsF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBo7-0000GJ-AJ
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnH-0006mY-Cq
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:27 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnE-0000sH-2l
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso3044146wma.2
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=LAPtWKrKaZqjEi+4+qsyZ39lAOW3AbKKlekZOCCWKzU=;
 b=pGRI/RsFcnnKlcZ0VsCfUSq1w7tIY9lfBhEqS3zVmdv0LncpOaFuB0Fkg7gDZLUAEt
 DV0dpunuy4zlOTbEpDvcxyeO3FRSnZ+KhHBCn0Z/vgmA3ecqk3nI/blrb/StPNJWp68V
 7F509+FXi00Sivz9Fe2k9+KW6LmWfUM8mFWFOxSUoHJWUCymmqNFPrTmgIcsapG9urhv
 VdfQzQ+C2PHtZzs8UdWM0WLKQfPVn2ERGyX4QxQYjdPOChnI7aRfVVLUguGo2POhVL2G
 7bDzAFcEnLSwEKb0SByQb4fcEarut9336NFbPB1eNa7CqbhxEMpgXgYINVLNWBU4CdWf
 u4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=LAPtWKrKaZqjEi+4+qsyZ39lAOW3AbKKlekZOCCWKzU=;
 b=S/I4rffq1FmS3JVQmWNwefYpbzfV442fR5W7SgcHzi9svvZ3OKZMYWEqNVKwLyMS9t
 X232fTQjEgfHrfLwRXkTdc9AGr/xpOPSFNM0i/16oryYw55mUoleP3Am61TN9EfwqobU
 4U/TgTU8fOqUjKBCLhkB/LCsGEC5rkYkJeQaYr+ns8tL26Pj5AhEkHSiURvuFnCCSMc0
 daAgaTCJM5YZzujqUeOHY2ATDXb3fxiN6NPYIDguOao7aWWrTwgdeCKctfoS+NR+AhEU
 vvAjYaDQ/a07692T01l/xIh4LU37Casr6DfsqWxE/BxD0ddtJRASVtgfQ5DxHHTwLO4K
 tZUg==
X-Gm-Message-State: ACgBeo3mrtLgeISrK8Ez/Jyv377csiKr9sx5nlDhnjDcLwHoOGXbi5NA
 Mfi76Se1CnrXzU0WpAJK4iAFbiFV0tjfQg==
X-Received: by 2002:a1c:541b:0:b0:3a5:411:5575 with SMTP id
 i27-20020a1c541b000000b003a504115575mr139082wmb.65.1660238181177; 
 Thu, 11 Aug 2022 10:16:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/10] target/arm: Implement FEAT_PMUv3p5
Date: Thu, 11 Aug 2022 18:16:09 +0100
Message-Id: <20220811171619.1154755-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: u8p8E3R2NzTj

This patchset implements the Armv8.5 feature FEAT_PMUv3p5, which is
a set of minor enhancements to the PMU:
 * EL2 and EL3 can now prohibit the cycle counter from counting
   when in EL2 or when Secure, using new MDCR_EL2.HCCD and
   MDCR_EL3.SCCD bits
 * event counters are now 64 bits, with the overflow detection
   configurably at the 32 bit or 64 bit mark

It also fixes a set of bugs in the existing PMU emulation which I
discovered while trying to test my additions.

This is of course all intended for 7.2.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Don't corrupt high half of PMOVSR when cycle counter
    overflows
  target/arm: Correct value returned by pmu_counter_mask()
  target/arm: Don't mishandle count when enabling or disabling PMU
    counters
  target/arm: Ignore PMCR.D when PMCR.LC is set
  target/arm: Honour MDCR_EL2.HPMD in Secure EL2
  target/arm: Detect overflow when calculating next PMU interrupt
  target/arm: Rename pmu_8_n feature test functions
  target/arm: Implement FEAT_PMUv3p5 cycle counter disable bits
  target/arm: Support 64-bit event counters for FEAT_PMUv3p5
  target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'

 target/arm/cpu.h       |  37 ++++++--
 target/arm/internals.h |   5 +-
 target/arm/cpu64.c     |   2 +-
 target/arm/cpu_tcg.c   |   2 +-
 target/arm/helper.c    | 197 ++++++++++++++++++++++++++++++++---------
 5 files changed, 190 insertions(+), 53 deletions(-)

-- 
2.25.1

