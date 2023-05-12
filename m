Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4841737ejq;
        Fri, 12 May 2023 07:41:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5bn8QotCMcLsUvw6FZMTZ2Gr6pLyjW8iAdB00D6ZlmxsfKNRGb4J9Clc0tZTs/UdJaJkJw
X-Received: by 2002:a05:6214:5007:b0:61b:743c:34f6 with SMTP id jo7-20020a056214500700b0061b743c34f6mr43146115qvb.30.1683902498087;
        Fri, 12 May 2023 07:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902498; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0peeQphesNSeTRWZGkRVj5h8xgvhzzb/k52DO5/9c9PuvrtOx/maTGkfpoyCNeqX7
         TqVM4OgczFR7LIZYeATi+oJ/02qljo38vDlw/Mw4ObUBo5+/ThpMSlfY4MlhxoXpbHGv
         g4w0iKY71ow7TBwEC8v3qS890bKnexaNphLUMVOY74R7wLHnPyVRHga3FTbyxtzcIMlD
         aGVWqoZycMz+fRrmYM1JHtlzvdYvF8E9w/4FPlhfMDabrO/g64OxnzYQffWZ5gY6LzOD
         w0UAGN4DkWBnbLavzkcxDQytPl6PrRQhx6dsurvXXFOPvfNUN2r4qU/sQ4r5rUGn02yu
         97jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=eaIC9UXC4kSNwW8Av+WYAsaqnXQaSZWXWeboMHPSfhM=;
        b=gK7rYC3VfLYLIYUgiYV1+ecB5J/hmaUyZQrIkFRwp5AHjeoQQMasQOe5IxKH2wm9em
         6wWDwgoN7Y0P/pBMK9ZYDBNNAPx5aGw4vCeui8eIcZVpGG+P4tVxfsyEnQMVAkXp1OeY
         +H3vnxRuv3QKrtZz3TVlnU75Od0ZPjlvSFG6QA5FQQJ/x00A4BoHfhxCVNyqgOrqxiQW
         /DWkpcPl8l/W484ImIctziqJSGNQdAHwl1IFtdj3Dl4aE7qwdBzfBoshLu/MvTvn+aRO
         HNJMi4JGzA5QB3TN+Z/RAKYjhzNm8pndyqAT2VT2VRvaO+/Cm/uQjKQSJP4D10xnewYW
         nK4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d2AppyMy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf14-20020a0562140e8e00b005e625695a7csi5617781qvb.91.2023.05.12.07.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d2AppyMy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxJ-0006lO-II; Fri, 12 May 2023 10:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxI-0006l6-Sa
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxF-0004gs-JI
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f4ad71b00eso21721505e9.2
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902467; x=1686494467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eaIC9UXC4kSNwW8Av+WYAsaqnXQaSZWXWeboMHPSfhM=;
 b=d2AppyMy1uXM1t6x+x9I9iEhVT0CL9cAPLsy4o5ggR5cMTcTNvhfgvCGGRqll/TJDU
 dkyIeH6mFNH4c2PjL/mY81Bga7kurAkhCF3h/3pe4j5SSvKa13emweLiP2MGdm3c4zdt
 23cQJJoGjKmtlaXiXbhqZl1Pffu9oHKlJoXsw8T86AgmckTYclLHo3CkB1G4zV4hqO5i
 uBNbXeNzTaNLthSWR5FhUBRglBPUD0+IEO1QRtYSEGiQFZRsH+w7Cgpym+SJbZ8BuxHu
 aOEvmX0hpa3XWbV2YLQwRFlPm+BWBYzdq2E6043zGS9yfcHvGyPjV+Uq7e1mNthpWbzP
 P4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902467; x=1686494467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eaIC9UXC4kSNwW8Av+WYAsaqnXQaSZWXWeboMHPSfhM=;
 b=KrScjiLDhhE9CVXH6K8n+B6Pa8YaxKkMu29/atSto2jYkI2TsWBDBcvSSE9EChTEfE
 u4KpgBVYG+tnJoBvlAdjAEkKUiXJ7yyoZ5hfGdxDM4MFtqlkpjBd19uYsIsXI8XuQR+C
 sMtDkkK58lFG9LNOMve32p4eNrwJ+eBGeOkhMAWJZJguV9fe4SDBnPF21uDoiiykq8MV
 uDp2sTfeYnacg5GZAOdR1+jvXIaxdPknqVoHWFT6xMTJNb3P/jLsVQ+PrOldvqwRzxB2
 Kv9xUG81VmSxGTAEXcT/+T2gaAB279lRHg3/ViaJ/2iC3kncec2TSUKB/VmuVfb7GkGt
 Ub1w==
X-Gm-Message-State: AC+VfDylqEvITHESMPtWeJR9Es50MndkzXR7k+K8qECO1RdGqFqKpQzi
 fLh6UUTEEGx1jinyobF4hP7GWxMqnw59niqZZAE=
X-Received: by 2002:a05:600c:2101:b0:3f4:2174:b28f with SMTP id
 u1-20020a05600c210100b003f42174b28fmr13676773wml.2.1683902467612; 
 Fri, 12 May 2023 07:41:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 00/20] target/arm: Start conversion of A64 decoder to
 decodetree
Date: Fri, 12 May 2023 15:40:46 +0100
Message-Id: <20230512144106.3608981-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: uGnK7Ehbl+s5

The A64 decoder is still an old-school hand-written one.
It's not too badly structured as these things go, but it's
still been noticeably harder to both add new instructions to
and to review patches for than a decodetree decoder. (This
is particularly clear when you have to review a patch that
adds an insn both to A32 and A64 -- one half of the patch
is a lot easier to understand than the other.)

I was looking at FEAT_MOPS, which is in the A64 load/store
area of the instruction set, and I really didn't fancy trying
to fit it into the old decoder. The instruction set is not
standing still, so we're going to have to keep adding
instructions for the foreseeable future. We should make
our lives easier by biting the bullet and converting this
to decodetree.

Past experience is that a decodetree conversion works out
to a lot of patches, so this series is just the first part,
which converts data-processing-immediate and branch insns.
Most of the first half is some older work from Richard Henderson,
which I rebased and tweaked a little. I definitely want to
convert the whole of the integer decode, but I might leave
the FP/SIMD insns for later.

thanks
-- PMM

Peter Maydell (11):
  target/arm: Create decodetree skeleton for A64
  target/arm: Pull calls to disas_sve() and disas_sme() out of legacy
    decoder
  target/arm: Convert Extract instructions to decodetree
  target/arm: Convert unconditional branch immediate to decodetree
  target/arm: Convert CBZ, CBNZ to decodetree
  target/arm: Convert TBZ, TBNZ to decodetree
  target/arm: Convert conditional branch insns to decodetree
  target/arm: Convert BR, BLR, RET to decodetree
  target/arm: Convert BRA[AB]Z, BLR[AB]Z, RETA[AB] to decodetree
  target/arm: Convert BRAA, BRAB, BLRAA, BLRAB to decodetree
  target/arm: Convert ERET, ERETAA, ERETAB to decodetree

Richard Henderson (9):
  target/arm: Split out disas_a64_legacy
  target/arm: Convert PC-rel addressing to decodetree
  target/arm: Split gen_add_CC and gen_sub_CC
  target/arm: Convert Add/subtract (immediate) to decodetree
  target/arm: Convert Add/subtract (immediate with tags) to decodetree
  target/arm: Replace bitmask64 with MAKE_64BIT_MASK
  target/arm: Convert Logical (immediate) to decodetree
  target/arm: Convert Move wide (immediate) to decodetree
  target/arm: Convert Bitfield to decodetree

 target/arm/tcg/translate.h     |    5 +
 target/arm/tcg/a64.decode      |  156 ++++
 target/arm/tcg/translate-a64.c | 1318 ++++++++++++++------------------
 target/arm/tcg/meson.build     |    1 +
 4 files changed, 729 insertions(+), 751 deletions(-)
 create mode 100644 target/arm/tcg/a64.decode

-- 
2.34.1

