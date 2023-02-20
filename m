Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706698ejb;
        Mon, 20 Feb 2023 15:27:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/ioyRvHNdjJ6cabLCp66FWoSlh239DdFnSsKsIOi8GZ9kUXCM3rzpoC8JpOrO3tQk1OmQ2
X-Received: by 2002:a05:6214:2268:b0:538:a431:862e with SMTP id gs8-20020a056214226800b00538a431862emr7903900qvb.19.1676935653335;
        Mon, 20 Feb 2023 15:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935653; cv=none;
        d=google.com; s=arc-20160816;
        b=vC8b1muXY2kUdLK7xfShpvHEtu02RqSPV7yG4PKw0R8B4hwCsELejJXlhBhXyTfqog
         0vjTkEdSvixFsm4iF+9jUOvI5QEZi/NJ5UMyCNkfsOSlXCLnfR3S0O1+TKHT03KZ2e0E
         ZJKA1aWbs9+9nnASFvOfzCSg3lFIiYPW/Drra+aEolR5IzVAyu/wMUayM1NMt+FuFWdy
         eE5Uwa9eWErt5c11XyvpbdyVjNq6NNexv+Roc9LdIIFViAGTOiNRIUy5thf+Clu64mVE
         6JIT53sKB2Hpid6XG95/zR0Blc0OE3li//aLMLrWbm8GK6utpo47fFl0MpCKzgi6ovbe
         Hwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=t9yw/E43hG1ECC7dOsdcRXTK3p/swP0xBKKuJw06hJ8=;
        b=AQI0Mdvge72tgUR4cGkKRajOFYmOzGBaqE31GRxWKzwim510K7MLRas1E4npSnIzpZ
         O/4fVDW0RXUDanyD82aX4jc0bJfeGHT7kxTkDtRchg4iGqGpO6WBNZvjImDlO6kYp6Eg
         S8d5j7r+4laH1kM4Pl1J8QVVRtIU5GKVdhfaAxMVv9XATkcuhi8UvGZ2anKZSPE24RI+
         WgfoBp4Lb17iYZaJ4gwZBNIyEGxihWtwD0ZH0PWCOFpkQxboIhPzW/M+uRirIgdzAZSP
         AcAlWiBlvBVms/qYcNfP0YHz77Px1xcaCPwMCkK4dzShg8tAXxGeLjMVLQtzH70TnwP3
         PG2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdQgFmm1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020a0cf288000000b0056e9dd2cf29si4182811qvl.530.2023.02.20.15.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdQgFmm1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYL-0003fN-Pb; Mon, 20 Feb 2023 18:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYJ-0003eF-41
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:35 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYH-0000H2-1W
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:34 -0500
Received: by mail-pj1-x1043.google.com with SMTP id cp9so3981620pjb.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t9yw/E43hG1ECC7dOsdcRXTK3p/swP0xBKKuJw06hJ8=;
 b=IdQgFmm1oKz7zEq2UDrLixMm+IWlU9QQknTocq1ryfG+MVS+UWWbQIMs7qGx0L/3cr
 imnh+eUSAQ01V4wBDjZnJnzPrtchmAix2FemgbySgTRbZ79+A0ytcgb0WXjCVUwdFS6g
 3D0fdjPsR0V9S7yqU3+lke3NzGcmOon98LrWQ3nlL1xGf3YwOUEhLoC4fv2R4GJufzMT
 nXgVB3MpKR/Id1EE2WXGtX3G9vv8hJM97HBuVPgJFonBS3xIOxFqaqgbQuqqjjXIVdJA
 5B9PxSUUBU6d4VBIaG4NM2VjPZBZPinCydEA7darEpCcw7gr01WjJ2A9VduXb6wVsdX0
 sr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t9yw/E43hG1ECC7dOsdcRXTK3p/swP0xBKKuJw06hJ8=;
 b=5ZtShx0zNFK938FEb7U8M16wj28geWNRqsrFFJv1zlBtNwqNTbfWbquPSaKQE3v3OO
 dP0upomLjnMLdfjleymYGI1NRoRkyq3YN9PmngUmiIxIBRRHt9RYWMi6ZZ4bVXizo8H+
 FZyFPoekukxDsgv+0QtiSSOtis7FpvAYNlT6YST7ON/bN9DQNvlXG1AvY2um/++ZfD4B
 2n+ThO+dWMpjxmXCv6eO4zBVG4amuxtUgnrgK7Hx0wflZQjxuH5u2NhCZhrfs+i+E0bt
 9bLbKGHIiJCYjpI3OdI7FUNZhy96QDLfEs5K3/yLhF5/SYenOzGJSF8eE5gZMuTy2hj7
 o+sg==
X-Gm-Message-State: AO0yUKWl0YL00UqP3mz970OJ7GdODH2wc2zAXoXUC5qVAqdjep+brNy/
 V+6XKF6kZd7EzvRYXfhy8M6qKXbKtBCfnqkHPBdMgg==
X-Received: by 2002:a17:902:d487:b0:19a:a6c4:6403 with SMTP id
 c7-20020a170902d48700b0019aa6c46403mr4772590plg.1.1676935591287; 
 Mon, 20 Feb 2023 15:26:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/21] target/arm: Implement FEAT_RME
Date: Mon, 20 Feb 2023 13:26:05 -1000
Message-Id: <20230220232626.429947-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XJl0ESLOWlA/

This is based on mainline, without any extra ARMv9-A dependencies
which are still under development.  This is good enough to pass
all of the tests within

    https://github.com/Huawei/Huawei_CCA_QEMU

Changes for v2:
  * Drop "Fix pmsav8 stage2 secure parameter".
  * Incorporate review feedback.
  * Mark last two patches as "NOTFORMERGE".


r~


Richard Henderson (21):
  target/arm: Rewrite check_s2_mmu_setup
  target/arm: Add isar_feature_aa64_rme
  target/arm: Update SCR and HCR for RME
  target/arm: SCR_EL3.NS may be RES1
  target/arm: Add RME cpregs
  target/arm: Introduce ARMSecuritySpace
  include/exec/memattrs: Add two bits of space to MemTxAttrs
  target/arm: Adjust the order of Phys and Stage2 ARMMMUIdx
  target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
  target/arm: Pipe ARMSecuritySpace through ptw.c
  target/arm: NSTable is RES0 for the RME EL3 regime
  target/arm: Handle Block and Page bits for security space
  target/arm: Handle no-execute for Realm and Root regimes
  target/arm: Use get_phys_addr_with_struct in S1_ptw_translate
  target/arm: Move s1_is_el0 into S1Translate
  target/arm: Use get_phys_addr_with_struct for stage2
  target/arm: Add GPC syndrome
  target/arm: Implement GPC exceptions
  target/arm: Implement the granule protection check
  target/arm: Enable RME for -cpu max
  hw/arm/virt: Add some memory for Realm Management Monitor

 include/exec/memattrs.h |   9 +-
 include/hw/arm/virt.h   |   2 +
 target/arm/cpu-param.h  |   2 +-
 target/arm/cpu.h        | 148 ++++++--
 target/arm/internals.h  |  27 ++
 target/arm/syndrome.h   |  10 +
 hw/arm/virt.c           |  43 +++
 target/arm/cpu.c        |   4 +
 target/arm/cpu64.c      |  37 ++
 target/arm/helper.c     | 155 ++++++++-
 target/arm/ptw.c        | 748 ++++++++++++++++++++++++++++++----------
 target/arm/tlb_helper.c |  96 +++++-
 12 files changed, 1058 insertions(+), 223 deletions(-)

-- 
2.34.1

