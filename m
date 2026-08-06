Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D75C56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:27:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1sE-0001UT-JI; Thu, 06 Aug 2026 13:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sA-0001TX-SM
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:14 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1s9-0000c7-Dq
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:14 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-84e0688b859so883732b3a.0
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037232; x=1786642032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WqajPQTG7itpX0uialCEvblZ720tl5DXhZwKWpR7UXE=;
 b=aSPkYcrZ0q4l/vuIe3gIbV4+VlYrmNfQC0EXyL07s75+yegKFxvOArczyRIqkrib0X
 MskB+CWLJQO1wycTbIEb3wrcZkv6eTDYqWOz5hMPquYyqKZG2HY1OQXzLxeUznCCaTeS
 YDYu795KY7FBRWe9bg1wy7kLMUOoG/3IKw7uQfGMuQ0vbzZX6TAu2izcbZb1hqNKEM38
 zczrUDtOzO/1vcShbN3TXgLCzyN48qEvAbJDZKz/4n7KBqXFdB2pIWhmtgwVKPTYe2q5
 Sb6UsdON899kghEheIgzMPJpQLsuH2ucdEiNvX5GxEvtH8RZZHrfHOFyyTv7c3NL+nS6
 BrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037232; x=1786642032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WqajPQTG7itpX0uialCEvblZ720tl5DXhZwKWpR7UXE=;
 b=dIljrZWskxoB+oUHUfgsLhdIeM2B88hxW5cBQW/qzj8Gqr4Z5nRNFRG+4iwKpCCmj3
 r4mtD5ZGLxD33AYLhdyo0LvJfTrozb2sotQV5FP3yJM+Nmeh8W5uPj6fL8JSgB//o8Gx
 ac9Z9KWGIQYmSgP6Uw69szzFUzGtPbH6gX6sHsOEweiB6ZG7ELamIOpmLKzelKKo/Tb/
 ZjBI7/c/0BxrZfHfLiCDj1djdmrnNe3n/R0S1Utr8UUef/ALFoD2R6RuB2tMNr73A5nk
 7kSP/ZWFHyCg2HDCFqPVjaq/NGG4D4buH0onSz/6iv9kJSlVPMhyMDb/RifiTmtxp36J
 HqSA==
X-Gm-Message-State: AOJu0Yy/vobP71QOiEd3x6P1MSA9f9bw11O3Z1ax2svN+T2TPHUHMlw2
 NYMgjgONLte3R3q1W6s0S1BybJHEmVjPddlOdH1oTZvKoB4n2YXv+RM9s1CpKCwio1F3akWGaWd
 SL10O
X-Gm-Gg: AR+sD10Vku0aWbpTRgIOC+8x0+xWldDdg5BwZLegEaZFZvZAZRbWXNR8W0nMKrQyWX0
 crE5+6NmaamRjbiQzsCezXSM3OeTKB4JQ/U5D0cjmQBSiQRJM/wuo7OtZd20DH1tbpEGlTZhYCg
 BrryD3GKxyWdXFq+S9wzdRxJMeLvnYscxF1cY/sfgnHdC/G7L4mQ8bpziO92IqpJVqXRqK8vq9X
 2T+uiKkD3Ukkss/vvCAP2Nc6oln7ZjUFPuGjFrBHD2HabgxfJdoKr/s9/ZLL4pKan2sF0qhTpt3
 Sst7n6K5ZqDASonBKqVRrEi/1NyQMuSP2cy+0d+zub32MmkxOwUDlDFv1ZrAOefdUgRTdgovD/p
 xbRNt+DNRakZyEI7hRfOq90upBSRWOsNRi2DQiVOZ8B9omt1rcPNfioVdK0LJe79uaaMyoYzNGO
 x2TPtx3+Dhp+2rLhIc8nkLZ5Qqw5Tvt4RLDeCU1On7DPYOqtIy83Dy4r/xc7LmreygMeiHt2GUS
 M92XtlqYqOmspW3h3tY
X-Received: by 2002:a05:6a00:2406:b0:847:712d:19ac with SMTP id
 d2e1a72fcca58-84f2e0226demr17579056b3a.8.1786037231751; 
 Thu, 06 Aug 2026 10:27:11 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f45389e68sm1803272b3a.4.2026.08.06.10.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:27:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/6] target/arm: Implement FEAT_FGWTE3
Date: Thu,  6 Aug 2026 10:27:03 -0700
Message-ID: <20260806172709.333300-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Based-on: 20260806163939.328201-1-richard.henderson@linaro.org
("[PATCH 0/7] target/arm: Introduce cpu types max-v8 and max-v9")

Changes for v2:
  - Rebase on the max-v9 split.
  - Review comment fixups.
  - Set fgt for MECID_RL_A_EL3.

r~

Richard Henderson (6):
  target/arm: Add FGWTE3_EL3
  target/arm: Add FGWTE3_EL3 bit definitions
  target/arm: Add FGWTE3 FGT bit definitions
  target/arm: Implement FGWTE3 traps
  target/arm: Set fgt in cpregs for FGWTE3
  target/arm: Enable FEAT_FGWTE3 for -cpu max

 target/arm/cpregs.h            | 56 +++++++++++++++++++++++++++
 target/arm/cpu-features.h      |  5 +++
 target/arm/cpu.h               |  2 +-
 target/arm/cpregs-gcs.c        |  5 ++-
 target/arm/helper.c            | 69 ++++++++++++++++++++++------------
 target/arm/tcg/cpu64.c         |  1 +
 target/arm/tcg/op_helper.c     | 40 +++++++++++++-------
 target/arm/tcg/translate-a64.c | 16 +++++++-
 docs/system/arm/emulation.rst  |  1 +
 9 files changed, 155 insertions(+), 40 deletions(-)

-- 
2.43.0


