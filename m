Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1197915lfh;
        Fri, 27 May 2022 11:07:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvCB0hfHlgfR70vFvTtyHvgVkx5xOd01W5+wbwh4z8Fy+TnLm8MFByNlEH5V/9a0wVeQ71
X-Received: by 2002:a05:622a:1492:b0:2fb:cb55:8d07 with SMTP id t18-20020a05622a149200b002fbcb558d07mr9834626qtx.233.1653674820666;
        Fri, 27 May 2022 11:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653674820; cv=none;
        d=google.com; s=arc-20160816;
        b=t2MvqfT+QZppfZRxredVpG7Y+3nlUlfn4a/Mk5d2Ev9DvNtg2vqOOSZG/j0Y5T5qyE
         QfeLW19L7Jm53qETg2P/n4GWdak9c3aKrqo9LN5rZrpXsj2CVCIm3Pg2oHWbb2DwRJ6G
         3pLgNHgIj/4Qr+VWjHzVFPw4yq5TNnxQ2q6WLL1wLTccLdPrF2kjbxhUNS2TJ/uXLWVh
         dnPnwwBZ5pjoELkK8XpI6/0ZsoDtGMq+pU71RpSKzwTh9Di0t7iyD+DxIXQ+EuwUoeBm
         lBwi5mGehmAjqFpqHogN8qOlXfw+UjF5HVOPWwAauRaOE3opcn2jA2OZcmr3pmYlHxJP
         Pc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HLtTUIfOEVBdKbxi4BRnlBcf8mL9fpt6kfR6WD0+IXQ=;
        b=vYhuCCJQduyZ7WPX3TqZUgK3cqmM41DZ7/rWqxFO30KxCBviWzfJT6FNRvYEkRYIfe
         AryMPlZN4zAzePVj2FTziLsspkrVEBcqDVRLCUp2PoHZ3hJmnxUqs98Q+58HZaqXg+e9
         mwidh6XZmmuxWvadqm6p3R+jlmRQZCrR51ozJxSWPrgSgSvpWoWEFgeCuyLCPSNySaIZ
         cGvK3664N3MZYeOCfO7XxKgS0tA+i0aNV3JChDs0Oh5Z3nO87Gp0gkCRU6+85tKY91Ch
         /+bD7Tj+Ypfm/c0ZJJDthd08zp27ty+ausYCtKV88chzbVlUXIGDjbGDmRBAHD06V3t6
         8YvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Giw75pVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a0562140d6e00b00461fef4c305si3342911qvs.299.2022.05.27.11.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Giw75pVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueMW-0002zk-1Q
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueLz-0002zX-QQ
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:27 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueLy-0001cO-4g
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:27 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e66so4526368pgc.8
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HLtTUIfOEVBdKbxi4BRnlBcf8mL9fpt6kfR6WD0+IXQ=;
 b=Giw75pVnwmgoRWs+ZdqHFGNusMfyY/QM0WwRdf7WjEX7XczB2cEP/Z94V7PCDVqFvU
 r33pZ9umGPGV88IfxSBCz47Xd9Uo6+bEiqZLHe95fBJAvcI5txQplLQjtGO3AtYrvzF3
 WneKBMagRxVkN7ukxxxlBJZYJDbuHsvWv1htg5HF2Wxcv8rL5+5HoSB6ED3jU+hoN8xG
 HtNKqFxvB1NOUN8TgNF9cPMOZWrfMcVLNksjakGAnsa0QysHLaIFx2nbii2stjmFqx8e
 Wx6a7JsOt0aWIkyyxNMG2eaPZUQdbzvNnfQCdWCS9AYPKxT7bh/yR8P1rf+xjhz8iKxa
 kzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HLtTUIfOEVBdKbxi4BRnlBcf8mL9fpt6kfR6WD0+IXQ=;
 b=N44arYN1ffjib+v6utmQYZHPFREBgBF1yapGSE6SmGjrA83jFk5dFQ8HN5uk11rGv4
 lHWz9hNFnfoNn1g7SyLMYfPTbWnWuIHZ9ftDdh5cqBYygVSafOc1lAUuFyRhwYqVkO1r
 t4qHz/EzTMlPSBLvVZ0y5TX1hjWu6+1m9V0Ihl2XoFcJ219tQ6iN8T49U94whViPlhbk
 q9mDd8zV4JO7E3LLs56w1SW3t6T0wHfQITH3wDaSf0KrErammCHDI4KW8clAC6REU8To
 YkyoHbvfIiFfZbn/ZWxNd9eAgsoetYvfbsjPRkr7YbFDZAHxmT2V0kjqBVbegOttEp2H
 iy9g==
X-Gm-Message-State: AOAM531Gu8VKDzRT2oCfA3IklEHXjPNbwYNGq8owye6BrZxI+6RBKdDv
 /r9dPk7tU+RgVqCHDPe5IeuZGknjtVQ5/g==
X-Received: by 2002:a63:5304:0:b0:3fb:92eb:8e90 with SMTP id
 h4-20020a635304000000b003fb92eb8e90mr5954130pgb.36.1653674784465; 
 Fri, 27 May 2022 11:06:24 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/15] target/arm: SME prep patches
Date: Fri, 27 May 2022 11:06:08 -0700
Message-Id: <20220527180623.185261-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9yTB2+pLgT1s

Based-on: 20220523204742.740932-1-richard.henderson@linaro.org
("target/arm: tidy exception routing")

Changes for v3:
  * Two patch upstream,
  * Have linux-user use the digested SVE_LEN from hflags (pmm)
  * Use el_is_in_host in sve_vqm1_for_el, mirror how I intend
    do use it for streaming sve.
  * Export a bunch of functions which will be used by sme_helper.c.


r~
  

Richard Henderson (15):
  target/arm: Rename TBFLAG_A64 ZCR_LEN to SVE_LEN
  linux-user/aarch64: Use SVE_LEN from hflags
  target/arm: Do not use aarch64_sve_zcr_get_valid_len in reset
  target/arm: Merge aarch64_sve_zcr_get_valid_len into caller
  target/arm: Use uint32_t instead of bitmap for sve vq's
  target/arm: Rename sve_zcr_len_for_el to sve_vqm1_for_el
  target/arm: Remove fp checks from sve_exception_el
  target/arm: Add el_is_in_host
  target/arm: Use el_is_in_host for sve_vqm1_for_el
  target/arm: Split out load/store primitives to sve_ldst_internal.h
  target/arm: Export sve contiguous ldst support functions
  target/arm: Move expand_pred_b to vec_internal.h
  target/arm: Use expand_pred_b in mve_helper.c
  target/arm: Move expand_pred_h to vec_internal.h
  target/arm: Export bfdotadd from vec_helper.c

 linux-user/aarch64/target_prctl.h |  19 ++-
 target/arm/cpu.h                  |  11 +-
 target/arm/internals.h            |  18 +--
 target/arm/kvm_arm.h              |   7 +-
 target/arm/sve_ldst_internal.h    | 221 ++++++++++++++++++++++++++++
 target/arm/vec_internal.h         |  17 ++-
 linux-user/aarch64/signal.c       |   4 +-
 target/arm/arch_dump.c            |   2 +-
 target/arm/cpu.c                  |   5 +-
 target/arm/cpu64.c                | 117 ++++++++-------
 target/arm/gdbstub64.c            |   2 +-
 target/arm/helper.c               | 126 ++++++++--------
 target/arm/kvm64.c                |  36 +----
 target/arm/mve_helper.c           |   6 +-
 target/arm/sve_helper.c           | 232 +++---------------------------
 target/arm/translate-a64.c        |   2 +-
 target/arm/vec_helper.c           |  28 +++-
 17 files changed, 444 insertions(+), 409 deletions(-)
 create mode 100644 target/arm/sve_ldst_internal.h

-- 
2.34.1

