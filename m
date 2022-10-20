Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp835427ejn;
        Wed, 19 Oct 2022 20:18:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vnpx/5FiAu/eFVIZ6iZUIMjpkagbZB0uMNFvU9abuDNZAnWJ/TNoj/xvrDuCygVGp2rEm
X-Received: by 2002:ac8:580d:0:b0:39c:ebdd:cf11 with SMTP id g13-20020ac8580d000000b0039cebddcf11mr9320172qtg.244.1666235909376;
        Wed, 19 Oct 2022 20:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666235909; cv=none;
        d=google.com; s=arc-20160816;
        b=XSQUUuROSNCrGfKDkKHO2EAO+iisGozcu/IHi5+faNIVR6w9IDQYetIr+XkPc7jYvT
         o5HoPCAmEqRksgdoQP3QcDagJYcpLQwNyu6jhos6zkopIpYyaiFCRa3/zz7cFa0F0NCU
         9ydCRCoZ+d8Hi271rCDYHULjRDFBfx8EWcByT1VXOhFOtjrIw6P6f8oWqiuOMw/k8m/j
         dWA0siAkgJPpaGMVKY09xjH6A4U2TRHhHcbm6R7+e7dUTrD6p1ksFhFyIVR0905DNYNd
         fcQ37+lppRoYSC++Z4KhCVgAbbGFD9rX4FUAEyE7b9yj5HSIzbUMmPJaDzeoJ57YajL1
         7UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ohFQCQpeXMu6R+T7z0YSzuyg9SbPtZF25Tq+jDJspNk=;
        b=uhauCBJ9TOwkDbBcNrc46llzpk26OPMs/y9ElGQnvrjsjH7Wu3fT2hP9vGH2wCnqR/
         dd1lO5w32WWbj5kQT40M27Ibd7J42Rf6bCQ2kGQ8thh6YUjq8lwaueuO7Hch9oL39a4N
         T6h3o8yUXGh74pp6lU28XBKXb1VbTRdQNUt1xLoymPpUnKfyy/C+EwBv6CnVhWDoVuC0
         h8feFDojVSAaL0jIM3Z0vZ2VEHAC38sAtM1UAPTumcV0fx7Jd4lXVQFlCP+WUfAzfBYd
         teGbmQtO9bFFU1iLtjrR2KwIPPFGCx3m4INulrNfpKP+ceNBI5vbKvpCVwhb7962V1au
         1QgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ctyT+qfQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo4-20020ad45944000000b004ad378c43c4si9708481qvb.356.2022.10.19.20.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 20:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ctyT+qfQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olM4i-0001r7-Ta
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:18:28 -0400
Received: from [::1] (port=60736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olLzR-0005WW-QP
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLtn-0002kK-NY
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:12 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:47044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLtm-0001m0-AL
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:11 -0400
Received: by mail-pf1-x429.google.com with SMTP id y8so19014589pfp.13
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ohFQCQpeXMu6R+T7z0YSzuyg9SbPtZF25Tq+jDJspNk=;
 b=ctyT+qfQ+wr1a5QudoOuDYSUNZxy4ZCKm4jtBpnyWBFRz92May/Vc4Z5N05o92CBH4
 5J8Odxex9BFtwgJaMyRAjGau8fBatxb3pJCit8rhiAi1PohdyGqR1TnK8epDOcSYh5yD
 OmzRzWiSbeOx5eGi1TtWsDeT8hsJIKwajMD/PiukXCGj4Teb4ZqkI1yGqFiO5o2eeOsV
 /y4Thd9u3RY2ezfefrez9jMHJiwcyw8G3dGDaZl/e07y7gIjrpkBU9VtygriNUycfaBM
 sBqyujhb3HxrI2MhsDiOVQluFZFAfVzJ/fzriNA9+jrDN0yYmywUox4mSHA/WHFu8JVF
 k3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohFQCQpeXMu6R+T7z0YSzuyg9SbPtZF25Tq+jDJspNk=;
 b=7TGkaCmjSKwBEUQciI5f7b9GNhpuHKDVEU+GB2kwK2ADz0inVM9ulnDyeS8IJ1hzIF
 dDCJAuG+ByuFxUGYSt0OnTafoh2PeDfc8H0hVtOvvQHNiR43jv+Hip859S292ibKRV2e
 bQgW+vH1hF/KBWRWNlbV8+il4b+qAVBLYHrtt6bjwGuwT37vpevvZ7Q2YLhbpLLpz074
 i+r+24FhXaBqjR+w4QLrb/7B2xmUxTahGEerdJ94zdQBeq0HGFOtKMghZh804ckGycWl
 SiA25LZWHDB1cLiRSHSv2WgDn1+yFwn82a5/GTp1GcfzYO1U86XmdOAKAWovxUpTNiYT
 KziA==
X-Gm-Message-State: ACrzQf2gg+ZxAtA2+rNCYhOUFF6wsAaCVtmaP33OEVlaE1AVDCuP45yG
 pNN8kpltx5bQzXgevUUXLM8hNTUo02+ypAZu
X-Received: by 2002:a63:db49:0:b0:439:246e:8091 with SMTP id
 x9-20020a63db49000000b00439246e8091mr10054333pgi.295.1666235228884; 
 Wed, 19 Oct 2022 20:07:08 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 0/9] target/arm: pc-relative translation blocks
Date: Thu, 20 Oct 2022 13:06:32 +1000
Message-Id: <20221020030641.2066807-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tcp9f2GI/+wK

This is the Arm specific changes required to reduce the
amount of translation for address space randomization.

Changes for v8:
  * Add a comment to both gen_goto_tb concerning the ordering
    of the pc update vs the goto_tb opcode.

r~

Richard Henderson (9):
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Remove gen_exception_internal_insn pc argument
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 target/arm/cpu-param.h        |   1 +
 target/arm/translate-a32.h    |   2 +-
 target/arm/translate.h        |  66 +++++++-
 target/arm/cpu.c              |  23 +--
 target/arm/translate-a64.c    | 199 ++++++++++++++----------
 target/arm/translate-m-nocp.c |   8 +-
 target/arm/translate-mve.c    |   2 +-
 target/arm/translate-vfp.c    |  10 +-
 target/arm/translate.c        | 284 ++++++++++++++++++++--------------
 9 files changed, 367 insertions(+), 228 deletions(-)

-- 
2.34.1

