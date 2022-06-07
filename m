Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1802767lfb;
        Mon, 6 Jun 2022 19:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiywIo1reSY+1INtv4u4ZDZ/cMerlLBe4nGVg2ILGww8g+skcXWs/IXmBGQb2G8pe2/MME
X-Received: by 2002:a05:620a:2a16:b0:6a5:8dec:580a with SMTP id o22-20020a05620a2a1600b006a58dec580amr16944698qkp.513.1654570078362;
        Mon, 06 Jun 2022 19:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570078; cv=none;
        d=google.com; s=arc-20160816;
        b=k5qUk+4rsEIemVeQdESeR1ofVcwjJqd4XGbxZlGu+7HGQmbDPdB2a/z2gOXqQOjsoG
         00agmXQSA2iCbuQ9WzHf4jJK1EA5OlDUs9Gkh0T9PrSQ9M7Fm2M42M/OGPvQl9Rw8RiA
         mRZsJzzXwewCivWcv1drT0uW6fS/ZKSG4+T3sh0cY7jA27jWJqPgSPqPbbH22+iIL50Q
         Wcyy4c0tI9Wzj9zvD4n/Slb33FfVUc2Sthiy17yyjREKBzkLqnU+5rzYrjKenj8GCwJT
         dPCQLgVWRL7gm5fGXtodUiJ3Vt/5U7zb6XeQDb63Z3CWQk5PC3FrhfSPsDveU+LRwabe
         973A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y1ecqEXef6x1OOkP5g4sCp0l9ZohLFq9hOapJwU8Vz0=;
        b=zYZv7rrshT8zfE5Kjwb1NfJDuNhxGIlUjoO7GNUa76jaLW7eNQM44QBgbHcBCvuvXQ
         ej9e0cv30e27LlQL/lHQA2BqO8UI82miiIUoPSa1RvMtmDBXgQk7n2No1SVKcc4qA8j1
         RvEyD02iyHMoGWY8ALeouOmgnygLWV4gEV8Aj/sQ9XBQpwXd8ET8Oap6I2PUH0hnWXCe
         dB+3kSsxhRJ+zQOKR4hft5R/4vakXEdJB3dWF9JS/ICAR70Lop62d9tjh6AjOQODoT1B
         Bpm7saeg1YpSmW0tn7YR6EmgiMX6XeDruZ3DPbSnEE6TxhiRBvZNAhR3Lalq/UeWtxiP
         QIaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKJix4h9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp35-20020a05622a1ba300b00304ed45d8d9si2367388qtb.211.2022.06.06.19.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKJix4h9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPG9-0006VJ-Mo
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFr-0006UB-PH
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:40 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFp-0000Gg-V8
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id e24so14463894pjt.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1ecqEXef6x1OOkP5g4sCp0l9ZohLFq9hOapJwU8Vz0=;
 b=SKJix4h9gjX9RrqgkCRm3YyOqQUJs0R6mqrG+WtD1HkURfrZzYhkyhOJlH634Sw7BY
 FccVHEX46W5GzKUq6Avfj7XlHdRFLKQTHLG8vuZLQ5FXeLhPTmMnUkb8TKnQg36dQPRO
 EdJtPPb1K+Sd9VGygKLWOGy9sqZlNHzlyq+PBmXviWRSw8IxA6UW1vr3LTvmRN94gB1A
 KV3pjQpZ86WsMtOntsi+U1icEuxbbeQfVu9lMPcNgGjZlaeTgdPTIAKIZZL31BQHKpDm
 EPEXUtmNOAfUBTYARyTNaZN3+0Sq1QU8vMXzmn7cpeRxMPWYc4y8zo+F+v/cHEgZhtLa
 afaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1ecqEXef6x1OOkP5g4sCp0l9ZohLFq9hOapJwU8Vz0=;
 b=6VuUxX3imPjSywAqVLmYEq2UpeQ1VluS7gEOwxfF8DC040k/5wnhFVwzEa4C+76Gws
 y4bh0W3ws15BxidZ0fYNYBFWvm1XUrivgjfERK5ZlnkLFT+SIZkZYplTSLaPuCyoLqid
 3rvyRKiu3IEACHnToBl/hJVP4RRkzhZyAWw0dm7Lshk1mYWrh+FhaYqyDz8ojm2/McL/
 tF2/ZTGQngslaHvj1zZc7SToqNj9Ym5XUZjanazhXWv3G2ln5Fpp15x7bpBGwWZD0aNL
 dYBPY5MSRyigErVkhWC0DxrovZlPOEe0bVN55IwZ/z1aBxyfXY3RYJ7LtusSBPBjNX3D
 vRXQ==
X-Gm-Message-State: AOAM532jvuVCa5eoXtEWvkUprYm+hhrNk3oQb8rE+59zy6jpGCAGlqtC
 ohhMDAF5SHX+UWRg4crCPNNlwBRhFq/Q3A==
X-Received: by 2002:a17:903:2287:b0:164:83cf:bb15 with SMTP id
 b7-20020a170903228700b0016483cfbb15mr26933421plh.49.1654570055980; 
 Mon, 06 Jun 2022 19:47:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/25] target/arm: tidy exception routing
Date: Mon,  6 Jun 2022 19:47:09 -0700
Message-Id: <20220607024734.541321-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: dJWQtY0mUM73

This is mostly code movement at this point, out of headers
and into op_helper.c and debug_helper.c.  I have dropped all
the bits that change where route_to_el2 is computed -- it
remains in raise_exception alone.

The last patch has the tiniest of bug fixes, which probably
isn't even visible, because we don't ask for fp_exception_el
with el != current without SVE.


r~


Richard Henderson (25):
  target/arm: Mark exception helpers as noreturn
  target/arm: Add coproc parameter to syn_fp_access_trap
  target/arm: Move fp access syndrome adjust out of raise_exception
  target/arm: Move exception_target_el out of line
  target/arm: Move arm_singlestep_active out of line
  target/arm: Move arm_generate_debug_exceptions out of line
  target/arm: Use is_a64 in arm_generate_debug_exceptions
  target/arm: Move exception_bkpt_insn to debug_helper.c
  target/arm: Move arm_debug_exception_fsr to debug_helper.c
  target/arm: Rename helper_exception_with_syndrome
  target/arm: Introduce gen_exception_insn_el_v
  target/arm: Rename gen_exception_insn to gen_exception_insn_el
  target/arm: Introduce gen_exception_insn
  target/arm: Create helper_exception_swstep
  target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
  target/arm: Move gen_exception to translate.c
  target/arm: Rename gen_exception to gen_exception_el
  target/arm: Introduce gen_exception
  target/arm: Introduce gen_exception_el_v
  target/arm: Introduce helper_exception_with_syndrome
  target/arm: Remove default_exception_el
  target/arm: Create raise_exception_debug
  target/arm: Move arm_debug_target_el to debug_helper.c
  target/arm: Rearrange Secure PL1 test in arm_debug_target_el
  target/arm: Fix Secure PL1 tests in fp_exception_el

 target/arm/cpu.h              | 128 +-------------------
 target/arm/helper.h           |   9 +-
 target/arm/internals.h        |  43 +------
 target/arm/syndrome.h         |   7 +-
 target/arm/translate.h        |  46 ++-----
 target/arm/debug_helper.c     | 222 ++++++++++++++++++++++++++++++++--
 target/arm/helper.c           |  35 ++----
 target/arm/op_helper.c        |  80 ++++++------
 target/arm/translate-a64.c    |  33 ++---
 target/arm/translate-m-nocp.c |  15 ++-
 target/arm/translate-mve.c    |   3 +-
 target/arm/translate-vfp.c    |  20 ++-
 target/arm/translate.c        | 106 ++++++++--------
 13 files changed, 391 insertions(+), 356 deletions(-)

-- 
2.34.1

