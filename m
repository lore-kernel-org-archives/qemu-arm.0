Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2894738ejy;
        Tue, 4 Jul 2023 06:07:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7FmVyhSE0wwA0G3Iv/ozYWexNZ//oVEVx0IHCvjPUTQp9C2lJJLD7J3rYhdf8yh4jhp5wX
X-Received: by 2002:a05:6214:e48:b0:623:8494:9945 with SMTP id o8-20020a0562140e4800b0062384949945mr19728419qvc.26.1688476066570;
        Tue, 04 Jul 2023 06:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688476066; cv=none;
        d=google.com; s=arc-20160816;
        b=nEF89jNunT4AGyT8TF/zZzwmyuxsrJDFWaoRlVZs8HXU2MX3yvlBM9zoTbbPiY2igm
         /u7anJ3Oj9Ztoo3Q7J6J/WrQWPcnYAngJZFgH4tPcPZAQuOLiQuYGuTtPl/UXBHwpv4G
         HY0JPAF+BaLf/cEFPJ4dqDtz1Je+5lCbs+L0X8Vhq4ka9t/UfWr6BYc9DEKKub86TOnM
         8Os8qYAiGjGDHGZa9CN4EEHx9nMs6ggtotZ47cS5uPD4S1o/HsFcYhK1EOgkoLhG+Xb2
         DuUzsFLrYzNSnk6IHoBX3pgpyLxN7VaAIHLtqkbJTgjd0Ho6mqfqegVRP2CEOJp6P+oM
         LrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8zLjpDD0zK/WJbpqRspbFIMqr9DpD2291ImUv+z4BQM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=I94S7yqTU4WHYAiv/5r0a1nNnDRPjwzE04njP+zPPEY+mD5sZO/mLyK7M0pSr1VZdx
         lMxh++TRVu/nukaXs8jl34eZOuTXN5LN94ebfNTYXLk+7RKNRVK6B1g6gChz2YmkqhVB
         S64ANHwKKr6AW6+YEDj6T69AofVwcYonK9bdEIAZz/UpX7dqq+t235m3m9PnJQbEIRwB
         F/721QQUUI3EeqA3nuQ/HX1vm+bNVneGhWHm8b7V11I1G0LJEiWUwI9VtHnlqelc23ZN
         pbgvYqMp/RPbkVe2Mr3HWgwDOMHKhayr0b3wmC3pU4bgfKZ9w+NjY0vdDkZFgFc15vcQ
         pfKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SggdcBin;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a0562140dc400b0063509af2b18si13218896qvt.176.2023.07.04.06.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 06:07:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SggdcBin;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGfk7-0001Rf-JO; Tue, 04 Jul 2023 09:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGfk6-0001Qm-BN
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:06:54 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGfk4-0003Tk-71
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:06:54 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc0981755so63098495e9.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688476010; x=1691068010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=8zLjpDD0zK/WJbpqRspbFIMqr9DpD2291ImUv+z4BQM=;
 b=SggdcBinL57/rnHpmdWFILW/jf7OEbkbiEUEsENSY8xeOioXU5Ge0ci88w3n8op/Hl
 sGfz6sXajFjyENPLXJU0n27PnkjA/SzSP/N/MVf3UAn+dujavIiOJbdc1N9PWYNgP2Wo
 3M0B4nkzNrGQFSUQTy19BZTO3foRR9PxuCXSq/+RCEYzAUEPKAhPian4DulS5JXv442r
 9rzmEF/2cZj+5ViQQXsRJ+KwfT0TAlD+rcd2GBOTMYjJTctB7sQCHzPW5S7bzhmExkUQ
 HF9GuYNo7AgC/PSCt5VxGRzLrfoP1LLntiSCplcKthTAyp0GADhHxY6bQSkP2ycyqD11
 z3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688476010; x=1691068010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8zLjpDD0zK/WJbpqRspbFIMqr9DpD2291ImUv+z4BQM=;
 b=MTOYY/84E3l4D31yejeiVwqbOl55l5ogdmJox+dauUW0ISWYn/YNVavAEbPCUi2n4O
 7lUt43nZeBo8UGq7/XQo5xEpb5H0z7DXkvm3hj3lVKMwFFqQ6YLR+bs5vkp41nH5jEFT
 Kf3Qsoq3+GSdLg1wQ9hD3hjCCnAjOqQF8RtoXFIjTDEK1nOL0sGshumgWpbVGNMd+XdG
 G4KPmKBkuQFZxx1L9c7aegnLWSQW5N1V4SBUoaWjOpqAzbiHA7d3j1JsGZOm6tDdxITf
 UA3M1ot4D7qPnAXuRJ64jIaY9ILVcg23seWuTlwG//1bO7nqsX8yRziWw0c4/nXAuZZT
 xsLg==
X-Gm-Message-State: ABy/qLaK9s+aQaVFc30Agmzo+D2uegwu7+AGv6AforBPUi6g+W0aC15R
 ZDyAiZIIzGHikxCb34bD98TUWSAGTH3aQQFUNC8=
X-Received: by 2002:a5d:6647:0:b0:314:362d:6d7b with SMTP id
 f7-20020a5d6647000000b00314362d6d7bmr5573655wrw.19.1688476009866; 
 Tue, 04 Jul 2023 06:06:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 a10-20020adfeeca000000b00314103d6daesm15834737wrp.47.2023.07.04.06.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 06:06:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Implement Cortex Neoverse-V1
Date: Tue,  4 Jul 2023 14:06:45 +0100
Message-Id: <20230704130647.2842917-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B51sY4j/gzoR


This patchset implements the Cortex Neoverse-V1 CPU type, as a
representative Armv8.3 (+ some extras from 8.4) CPU matching real
hardware.  The main thing we were waiting for to be able to define
this was FEAT_LSE2, and that is now supported.

There are a few things the real hardware implements that QEMU does
not yet, which patch 1 ensures we don't advertise to the guest:

  * FEAT_TRF (Self-hosted Trace Extension)
  * Trace Macrocell system register access
  * Memory mapped trace
  * FEAT_AMU (Activity Monitors Extension)
  * FEAT_MPAM (Memory Partitioning and Monitoring Extension)
  * FEAT_NV (Nested Virtualization)

Most of these, like FEAT_SPE which we were already suppressing, are
"introspection/trace" type features which QEMU is unlikely to ever
implement.  The odd-one-out here is FEAT_NV -- we could implement
that and at some point we probably will.
                
Patch 2 then implements the CPU itself.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Suppress more TCG unimplemented features in ID registers
  target/arm: Define neoverse-v1

 docs/system/arm/virt.rst |   1 +
 hw/arm/sbsa-ref.c        |   1 +
 hw/arm/virt.c            |   1 +
 target/arm/cpu.c         |  33 ++++++++--
 target/arm/tcg/cpu64.c   | 128 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 160 insertions(+), 4 deletions(-)

-- 
2.34.1

