Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2975521njb;
        Mon, 8 Jul 2024 17:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXFiitirU6pleVzrJSbnaflqN93OOTX7sPYucwurFxm6PjQe+VTLUcIm5BN+1kfWqrYidz4iMZQ9xrhlhaXYisGRooRSLa
X-Google-Smtp-Source: AGHT+IELHsT7J5WHfQjjBUuqdb5OcSIcAmYdebTbQDacqwzLVxfY4/5kxnK4wxAM9haWvjfEXqtD
X-Received: by 2002:ac8:7dc5:0:b0:447:ea30:d45d with SMTP id d75a77b69052e-447fa85cff5mr10258821cf.21.1720483591992;
        Mon, 08 Jul 2024 17:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720483591; cv=none;
        d=google.com; s=arc-20160816;
        b=Ijr70G0vtRUkkt1VWB/kmHH6JUW1mIRcF8l6BBSjMvXc9GGsBU9akta1Tw3pegCxzd
         ATLc21S8WjLR+GXOqDg5ILtjcL+CE5aWNzcBgCr0miqUg2WbL7MMmPG/TyMzYhDUnl0d
         c7avAcyxEaleeR3nWv5aHEGnqm8Q+IHiUCvwsI2oZczmhOLvDQmK0/KhibCtaqnkGUSK
         G5ozcOwRvkgX83YL2xU+gq/+IvofkwZ1A4r6LNRhJ0q9RO9de6xkcV7Bx9wV5kdsO2lR
         snlBXtH504BGeob7U5MkLt8rFG7yB8tCcRAQ4NUDXNw3v29iasJSwWlYfhzf9eUFUPGn
         jCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=c2OghkTw1REHAEP7vFDrkBLyXaG/mrWqn8cqdHwsYNY=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=SObbgdK6llZqR9AkD35f3RKS7G7zyU8PYn6BbvbJv3LNa7Xl/2xWsOsFSAz14YAWuM
         qabe6u/Ze88E+lG+1ucHEf8M3GoGAG7Z1z5B4hoEKOgSYNhhTEHiT9S9kldWVK0kFmAB
         P/XARmTefLG8gJ1cNoXcvDuSeZTWlHspbUgtjEZ4foIrBsFio45IWXB/D9QqrTsh/HfE
         ByE0gpFoVArVCyJWaaxCGO+0V3uMjR53EQPAmrTQvQzNZlKTTWu11CSWOHTIRwexM07H
         O5YHOYlC2b8lyzjGwfe7fhbhZSns1ShiIUnPy2Vcy73l4i9fQQq4+4oMTs6exJGbd+Wg
         U+lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnmN4803;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bc501csi10132511cf.490.2024.07.08.17.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2024 17:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnmN4803;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sQyN8-0006Ji-Vw; Mon, 08 Jul 2024 20:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sQyN7-0006Dy-L1
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 20:06:17 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sQyN4-0001uZ-MM
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 20:06:17 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3d9234b77dfso1620335b6e.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jul 2024 17:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720483573; x=1721088373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c2OghkTw1REHAEP7vFDrkBLyXaG/mrWqn8cqdHwsYNY=;
 b=UnmN4803oYxwwYL9hfrs5AsUDKzNg0YldSqDuQFGsAmAZp6+ocxyAFK+DuCrnzyi5Z
 WXPZjlnjcjPO45ZzCD5B1xYSp1SZ5VdwcjaikuRrL6bHq9WZIyWyuQw1aoAPh9/Av2ol
 0XyyLlx33t3/pS3ct/Qb+Blc190+UJCTnAwxcbzbaPF4OThrg35rt617Eu8JoTi140id
 jdGzzEX//9GAFVhH/Mmm4DnovUv1/rCI3G/aPfCsfTMNyyArv2FQZCf/o47IiWhHA4xW
 8M9WBBlqDj7E+IrMnlPocJ9d755x3E5ZXVS/LD2oZrZTLOWM/zKMyC416AYW+s1oQHOa
 PDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720483573; x=1721088373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c2OghkTw1REHAEP7vFDrkBLyXaG/mrWqn8cqdHwsYNY=;
 b=HSjDVqEmFLI1F+2V4sGGOCHDC7AwC1pnA3BboY9k+EQD8K6mnwInTgmKgnaiDiHv+G
 jBkBgI6saEMne8Ga3EgfuN8aMnyXOtAEfownUOl4ZXYil58LXnjyqaDRz+aZ7YUgmRUs
 +NdyxmSpiZwqNYkAi2dYxJ2wsIR98vIAGWXqZb11UAOtci+qW8zhptpbsReNmLlq+UmA
 31+ze8xVUzTLu85DuFF6vZLBknbWZRdg9qKIeWlW4tGVIFFAiK7uFt+BID0qw02y+OUA
 Za40XCyQrKQ8/nsmvC+P2P/Uzi+FIjwLzUqCz+LljpYy32p6OW5cxKak38zKIVxP1Fza
 Hquw==
X-Gm-Message-State: AOJu0YzIkskemc6v3Ni2z9VQDHII8zFLCBGMpiOq589k70DOW7YDsTmz
 sdguuJEbO4geZkF3chUntoNfsdGka8BGdSQMlEMLqFWHSOFpgA2YcvhzBq2lcVmmmTsnQSaH/13
 WzNs=
X-Received: by 2002:a05:6808:2005:b0:3d6:2de0:8507 with SMTP id
 5614622812f47-3d93c07acdfmr831396b6e.41.1720483571992; 
 Mon, 08 Jul 2024 17:06:11 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d682b3fefsm316617a12.76.2024.07.08.17.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 17:06:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RESEND PATCH 0/6] target/arm: AdvSIMD decodetree conversion, part 3
Date: Mon,  8 Jul 2024 17:06:04 -0700
Message-ID: <20240709000610.382391-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
X-TUID: RKTLFLu1wYIJ

[Sorry about the @qemu.prg typo; resend for anyone replying.]

A small set, but better than waiting for a larger set.
It's a good stopping point, finishing the convertion of

  disas_simd_three_reg_diff
  disas_simd_scalar_three_reg_diff
  disas_simd_indexed


r~


Richard Henderson (6):
  target/arm: Convert SMULL, UMULL, SMLAL, UMLAL, SMLSL, UMLSL to
    decodetree
  target/arm: Convert SADDL, SSUBL, SABDL, SABAL, and unsigned to
    decodetree
  target/arm: Convert SQDMULL, SQDMLAL, SQDMLSL to decodetree
  target/arm: Convert SADDW, SSUBW, UADDW, USUBW to decodetree
  target/arm: Convert ADDHN, SUBHN, RADDHN, RSUBHN to decodetree
  target/arm: Convert PMULL to decodetree

 target/arm/tcg/translate-a64.c | 1155 +++++++++++---------------------
 target/arm/tcg/a64.decode      |   77 +++
 2 files changed, 460 insertions(+), 772 deletions(-)

-- 
2.43.0

