Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1649733ejc;
        Fri, 11 Aug 2023 14:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKkc18pH1Emyi4o/Rx5IyOVrGMFy80T1G4b9RKCPJ7BwqsOtJzN0kR07IKf6QeyN+s6Jen
X-Received: by 2002:a0c:b39d:0:b0:63f:61dc:3013 with SMTP id t29-20020a0cb39d000000b0063f61dc3013mr1368655qve.1.1691790161327;
        Fri, 11 Aug 2023 14:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691790161; cv=none;
        d=google.com; s=arc-20160816;
        b=otdPpBJpPLyimg1bXpmqDgghZyUdWssRdYq4OHskGpScALUV5p/lA9iFWSoKj+FDEe
         jZih9qhpgGWvMbdufXJTmDDDMzhFA2HaThVzCLhR+r3DIl4a34zncfWsUbu+E6iwYrBD
         Xx95qBHZCac/tO4k8UGMgAdHnkyN1y8x29TE0WSUSNxPMKE10fP108CfbtRsAGiLwZrE
         gSKlgC7IT5sY5gGq9A7nQz6Z9BZa2x8zLF+bQ5VGsy9PkI6busd3Ps09ACvrY/rIoict
         VUhouqSQ8pVXH+DdzFMCCJoGYHP2q9V/CUcDT7LIjo1NEmprIv2/Z3gnUvXrBTChbMp7
         00Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LE9h0+JfIrr87JPl4JPF+OrALN1dYoTWFGst92ndGEg=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=E3h445cpQscFzCl/bNosp2KhCAWHzJUUGTg/0fmu8WjyRM5oTnQkHbrvFdMyAtr/pP
         Z8BiNMTkJky8irXFX//MRmFpGIhkpD8t58IUvwy9IidM0HpS61Fp5jCaKxzvONxnDlmh
         eYWubk5imdXyehibpE14cImqsSsi1FDb/Iyn3OawOzhzej1PYNHGzl+Srkcu160rBLTD
         P8JE+G7FbRGfdbX/fiX5MrzoSF9pLkey8YsgrtOxVtwanKFXVhN5RmcwRE54SQfFUPc+
         AJ8gNGCXiUykuxco1FUjesZ6DA1iZatYjtbGARhURh5jVuP5N/i4ua8qORDEDhxvuVLs
         Nu8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DbkIMus2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020a0ce4cd000000b0063cdd7394f1si2707582qvm.474.2023.08.11.14.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 14:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DbkIMus2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUZsK-0003EB-2i; Fri, 11 Aug 2023 17:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsH-0003Ap-9B
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:49 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsB-00027n-Gb
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:49 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-564b8ea94c1so1612178a12.1
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 14:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691790033; x=1692394833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LE9h0+JfIrr87JPl4JPF+OrALN1dYoTWFGst92ndGEg=;
 b=DbkIMus2kema7j7uKiMy8f7oJ6D89W9BgSdYxZqM71Vsl7XZpsG9b2MZ2p/SuaeUYP
 nBDBBz88p91h2zKEXeukuNPOJylbOfNw5CA8KaOsGckq5KaH73h8tNb84Ttr0/NZTv+g
 MVXfNu/OfK5IdGWVeFg3WuGv12mvSEYcx2zJhPyd0LyzDWYIFaX+Gk4E70b9FrQ4RCHM
 L/VhoejbyzWHzJZTQhG3kpVimbk32yDZg2qWuD8ZnRFdJJyUC5o7bOSz55diZoCHHqJK
 L+bbbCCvI4isj4fatycAKGeWQ8KUcjlFmK6lPIyrkKbu2Ck36lTQkL18+midFnCtydov
 lucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691790033; x=1692394833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LE9h0+JfIrr87JPl4JPF+OrALN1dYoTWFGst92ndGEg=;
 b=Bs00fLh/51tpj2vwV2C0rLDcBJINKNEStD+agL4kSmYU5QQL8Qn0UV9N0ELtdLqQnf
 zlg28Gip0z2CycqlaMEhz/ixzB//AWgU+5XcWTXwUIeWI85Iu1NWgxbghHPoZCzCfGQj
 KW1v07QxqcpF1oVs3CbjOKw3fEVeRHB9vHqT2tn5UnkZEhArE1c1FQ02P8lNe1VygYX0
 /SdG9KP8IgkhvaJBVMzvHMxiv1x9mQxKX2jAkBQ6/NdXV/jK63gs3R88kUYFyfm0lija
 XLemuWLAnIAaLMegeNM0AXWUk8RZ+EEwl0IbL77Ctjf41GcD1/JHpJV2qynpm7DBIFX6
 NxOA==
X-Gm-Message-State: AOJu0YyewYkEl6Q+WmX6wXl38kfEjbP/y/tGR6BU0TBw5lVLEVS4nknl
 rdwfPj35yBTsls0EVwcf1nm8/bOdpF3sbPqBLP4=
X-Received: by 2002:a17:90b:3c4:b0:268:10a3:cea8 with SMTP id
 go4-20020a17090b03c400b0026810a3cea8mr2277924pjb.9.1691790032879; 
 Fri, 11 Aug 2023 14:40:32 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 gk18-20020a17090b119200b00263ba6a248bsm5723840pjb.1.2023.08.11.14.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 14:40:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/11] target/arm: Implement cortex-a710
Date: Fri, 11 Aug 2023 14:40:20 -0700
Message-Id: <20230811214031.171020-1-richard.henderson@linaro.org>
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
X-TUID: d8WUjiyABe/+

This is one of the first generation Armv9 cores, and gives us something
concrete to test in that area.  Notably, it supports MTE.

Changes for v2:
  * Check GMBS during realize.
  * Fix access checks for neoverse implementation registers.
    Mostly just traps EL1/EL2 if EL2/EL3 enabled.
  * Add make_ccsidr64 helper.
  * Reduce MTE with no tag memory to MTE=1.
  * Suppress FEAT_TRBE.
  * Implement HPDS2 as a no-op.
  * Rewrite a710 implementation registers; do try to share code with
    neoverse, because the traps are different.  This of course solves
    the renaming and renumbering issues too.


r~


Richard Henderson (11):
  target/arm: Reduce dcz_blocksize to uint8_t
  target/arm: Allow cpu to configure GM blocksize
  target/arm: Support more GM blocksizes
  target/arm: When tag memory is not present, set MTE=1
  target/arm: Introduce make_ccsidr64
  target/arm: Apply access checks to neoverse-n1 special registers
  target/arm: Apply access checks to neoverse-v1 special registers
  target/arm: Implement RMR_EL3 for neoverse-v1
  target/arm: Suppress FEAT_TRBE (Trace Buffer Extension)
  target/arm: Implement FEAT_HPDS2 as a no-op
  target/arm: Implement cortex-a710

 docs/system/arm/emulation.rst  |   1 +
 docs/system/arm/virt.rst       |   1 +
 target/arm/cpregs.h            |   2 +
 target/arm/cpu.h               |   5 +-
 target/arm/internals.h         |   6 -
 target/arm/tcg/translate.h     |   2 +
 hw/arm/virt.c                  |   1 +
 target/arm/cpu.c               |  28 ++-
 target/arm/helper.c            |  15 +-
 target/arm/tcg/cpu32.c         |   2 +-
 target/arm/tcg/cpu64.c         | 347 ++++++++++++++++++++++++++++++---
 target/arm/tcg/mte_helper.c    |  90 +++++++--
 target/arm/tcg/translate-a64.c |   5 +-
 13 files changed, 437 insertions(+), 68 deletions(-)

-- 
2.34.1

