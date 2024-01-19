Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp878544ejg;
        Fri, 19 Jan 2024 03:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz/+2KN6e8ZscIa77f+kl01EVHoR0za2eVtOBSeFXOLdkxZMsGaXoSy+RnJFTyvWTVdAEu
X-Received: by 2002:a05:6214:d6f:b0:681:121f:de24 with SMTP id 15-20020a0562140d6f00b00681121fde24mr2470083qvs.33.1705664183117;
        Fri, 19 Jan 2024 03:36:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664183; cv=none;
        d=google.com; s=arc-20160816;
        b=JNw4f9aZiBrCUKx/z0Py5OHuBgFvKxX/uY6TI6UOg2i1ksqccSUhamsYHWOIjWGrP0
         98bi+ftSzI/0QkXG/A4RhN7OscwppKhCB772wJRzYejXwa83/Y/R5Eq1So5I1u2oAxnj
         hSzDI1CmcBEscQAx0GZYZHRm+xRL82oqCjmuN3P1oOwdXePdDBFnXa/mPKVXvrT5f3q0
         VlfxAYWuqdbvPyNYk6E3jvg3HnqRbo+MnyXHFl1N5ydi1IjYu4cLd0N5APHePprD24Kv
         tfzkIL4LecNJs3qQJVFQ75pm8YFS22puyJ0/OKHtvffcxGOp8qVKL11ypPjC302k/OoW
         JBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fJxZlcfmNn+4e6fRmCJ3mMuWcpZHQmskZZgo6KbTC98=;
        fh=PGD+nRug3lbQLQRmqJdfXASo9DDbKKfOK2qGXbkwX/w=;
        b=KNZfjBHUh8sBBZyfNPE0vS3ciyNEek7FMX/YVDcWnT1+WR5M9vqF6SDKnbZfDEdD8K
         KfW1KwNUm1uJ9zlI1+w8WSQjXyegRdbPobCJExKyQU42/cnfY8s/qWG4RYHLfCwYcEtr
         tOceCkPzJltf+19ubI3zGC+bsyxT3NNfCQdunFFfKtfGogHDAXLfRRxZiGQQDgk9W2qv
         B03DpImAWESrnOopbrKJOXSX5vWeHLiWFKBnMzRspR6T+wOeZ4iELdMtXY5UlzllTOgN
         9cKGYzt4j+TGCSATFXpCStbJWjEWe80PvFusAIFbj5vSrq+pnNdgL9wlsH1ivedP8naW
         5IiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uc81YsZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11-20020a0ce14b000000b00681778d1495si2761263qvl.47.2024.01.19.03.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:36:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uc81YsZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQn9w-0001m0-Fe; Fri, 19 Jan 2024 06:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9v-0001i6-BV
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9t-00086J-B1
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so409994f8f.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664136; x=1706268936; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJxZlcfmNn+4e6fRmCJ3mMuWcpZHQmskZZgo6KbTC98=;
 b=uc81YsZDaSV6xPI+QOb2Yl2GiVFLxUe25a1VDl5q3lxPNpLQtxRWGJxxE0SL+fkS9c
 y5ICy/oHW05DIy3Y/VbXaJ+ES/EMElvDtyCuBqR7FFBCk0AJLF2u+jFrPYUG3Bev9hfm
 BlvKYA/6rU7VMlpWtixoRK6fsAwmBhWhvyI+1NfojzXyvtmPkcGOIK1VsaRxDuXicmYP
 U2/qkCxfFbeDADr7XzAyoDkj0FZfO2UnyYCVEq4NbYvepwh4zBsSGF2PvuWPTqnzwlrZ
 uYMbTLOZkY2R+y8YvSum7DTXsFa8F2hUaxnLC9s0UBQkCyLZ13OfmH+9l4MlRnwOs4kU
 Y2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664136; x=1706268936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJxZlcfmNn+4e6fRmCJ3mMuWcpZHQmskZZgo6KbTC98=;
 b=HNoQvIkkDgDyjg3mIfwrxlqW+UPUUjnhuHlgwCydMHuOIiHlcGHT02yP82O33IdX53
 t8kKu/e02KKTaNrk3f7n1nAPxXiJePyEalgEfjI5JYHVYV2myR5YI96FqpCnHg/M5/+9
 lAr9ghUP1SXPRVDCJN+Gn288jqTrH2HQG393MhcMjnnAK9fu2HoXP8r9q2PcMe224krZ
 6LWhQNwOlFYytG59ISLoEoivj/hk58AioLHQO/uW+yZWew3Z6MEUy8ulmfcnZqgBWtmd
 L3wQgv+oKFWP6mewmUm/oRoBUSnP35L3qqa8cidG9VZmYiqvYdGUFHGJ8HWW39nOmZUx
 +dGQ==
X-Gm-Message-State: AOJu0YzYGwoRiOzBslJPIiMrNFN4myocqe06y4xknBwxg1xAzn9cG6HL
 ge01j0TPfyC6aCvosD8AbufT8vLEzi7H5t0c8gRySPrwq68nBcujSgrjLy3ff1s=
X-Received: by 2002:adf:e5c7:0:b0:337:c134:61d6 with SMTP id
 a7-20020adfe5c7000000b00337c13461d6mr492360wrn.39.1705664136006; 
 Fri, 19 Jan 2024 03:35:36 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b00337bfaa944bsm6284306wrq.54.2024.01.19.03.35.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/36] tests/tcg/xtensa: add icount/ibreak priority test
Date: Fri, 19 Jan 2024 12:34:35 +0100
Message-ID: <20240119113507.31951-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: ErCDDbcyVDzS

From: Max Filippov <jcmvbkbc@gmail.com>

When icount and ibreak exceptions are due to happen on the same address
icount has higher precedence.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231130171920.3798954-3-jcmvbkbc@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/tcg/xtensa/test_break.S | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/xtensa/test_break.S b/tests/tcg/xtensa/test_break.S
index 3aa18b5cec..4c618feb5b 100644
--- a/tests/tcg/xtensa/test_break.S
+++ b/tests/tcg/xtensa/test_break.S
@@ -129,7 +129,7 @@ test ibreak_remove
 4:
 test_end
 
-test ibreak_priority
+test ibreak_break_priority
     set_vector debug_vector, 2f
     rsil    a2, debug_level - 1
     movi    a2, 1f
@@ -145,6 +145,29 @@ test ibreak_priority
     movi    a3, 0x2
     assert  eq, a2, a3
 test_end
+
+test ibreak_icount_priority
+    set_vector debug_vector, 2f
+    rsil    a2, debug_level - 1
+    movi    a2, 1f
+    wsr     a2, ibreaka0
+    movi    a2, 1
+    wsr     a2, ibreakenable
+    movi    a2, -2
+    wsr     a2, icount
+    movi    a2, 1
+    wsr     a2, icountlevel
+    isync
+    rsil    a2, 0
+    nop
+1:
+    break   0, 0
+    test_fail
+2:
+    rsr     a2, debugcause
+    movi    a3, 0x1
+    assert  eq, a2, a3
+test_end
 #endif
 
 test icount
-- 
2.41.0

