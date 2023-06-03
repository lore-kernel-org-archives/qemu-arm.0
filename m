Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545919ejb;
        Fri, 2 Jun 2023 19:39:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5fDfVSQun7GqmxdlqMkUZ9rVUlEt8y3pp+SaIsMrif4RTED1YeVC5npWOGUiGFcNYkdATS
X-Received: by 2002:a05:6214:400d:b0:628:78fe:c9da with SMTP id kd13-20020a056214400d00b0062878fec9damr327723qvb.27.1685759980188;
        Fri, 02 Jun 2023 19:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759980; cv=none;
        d=google.com; s=arc-20160816;
        b=tySqeajQsVhEQspIRld0wDE6hYXC25bjph8UEZr4vEgNoy7jmIENFOYtQeyvFYVdQT
         /+njK1ESQBXjYL9O9TPjsZmpdOQFIAV7xVUCq0ycwW270YSTbwfTTBcpZorrObkdgEnK
         MtomsBlN/cn+154RVehEwEFP//S73hWrs2aT0mwjXIVKgxPEiiB1AxBKBE4Quu0kvNNi
         g24J9A9PLh3rPsttraLjWwn7RAuFBxUhQbZkbANRL3Pr7qEW6VyQYiAfp4idq9EeYF56
         rEf3BpDCHLYTLzS0jQipW22ssitJQbc9T3MrADMJnjHC/O+qJF3LgRxa18bjoapx+4xS
         ZtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L7j1qOyZnLIkCNuPi4WOfNPianJuONVzsXzr21BD5RU=;
        b=OjqOfaY9+TqxTIAGbnuIhnAlmAkEzxL6+lDPQIHTvClmLZnuUm5waD9hyprzWIOj/T
         re8I1ChRj9g8TQfD5+PrlKJPBqhCKZQd91ZqGVuSUfbNbeH+NtRzCerxPLmvSYJQkH+b
         Iyeen7tCjajYHguH01hiGHFJQ/wECFwmh5RMZIADo570b2hJ70D+T37/rKnxKiwxw4Mz
         TTro1PDFkBaT4rI5Zk3Z6tLRq3ZvtBxhe3L8DUU4XLCZdF43/IUE2zCAKCuRP20MqjK5
         zvkcgXx1HqYFf3M2W3jAI5QOT6TGNfdOA4GQtU6k7aqVXHwT7VKKHis+816rjcdrSefu
         0+fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7XQIc+V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12-20020ad45f4c000000b006238459f915si1767497qvg.230.2023.06.02.19.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7XQIc+V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5H7n-0003o1-Cc; Fri, 02 Jun 2023 22:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6x-0000pP-Dh
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:35:26 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Y-0004vp-EV
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:35:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2564dc37c3eso3107502a91.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jun 2023 19:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759694; x=1688351694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7j1qOyZnLIkCNuPi4WOfNPianJuONVzsXzr21BD5RU=;
 b=O7XQIc+VPk/DPm7uOmMGUPM6X5YgzjqL1G4pHzDjguIF3VSyyFwzx/wpMTF7NtKMDe
 iMNBVUTD14uSa8ib51gTeqCYLUQ4M82/qjQmNs3Ok32il0rQSkXnrwXQ+aXe1sZ3fhrq
 zwiMf8hOVvDypYq/lX+LF7KlMO4pGzeNsNXF4eRT7YRiG7htAktF4DSw3bwgx0E8ZpWa
 wA/506oE/55hv55OFgvELFPiWUST9/zrWsnMBC9nORdIRlr5rfgoKClLJfpH/ydReGdX
 rMP5Nsa3Lc8YYGEEhWPPR4Ba/rXyYBmwTlDXHKdwcK7hkNOxFe3W3FhPL3RAl1HUIV66
 TqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759694; x=1688351694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7j1qOyZnLIkCNuPi4WOfNPianJuONVzsXzr21BD5RU=;
 b=k9YNuUCY5FtBhOBEJgulld6edNpQMG3KKfS+1uEEM8wiJYbRQT7YYKAiw3eaz6AeNH
 AuBUR1lU9cPQxYwKpsJd4R/XTZh9koi0BmQPWEA+QEq/hyEUv2KQZ7S+H6BCzcwoEFTX
 qOsjH9cGOCy837C+yJTVhR5TmHVTyrrk8ExDiUit7yGocnqIiXxNVpTaXdbsXzFZF4MU
 r6vRFZvn50QLNGtb/9vVzj5ZZcfDZct4OcX1IVClIEfFQeG8icVKF2K2HiCmOJvwx208
 c2+jp2X6qk61fvRWb1yLUW8XNXNByQMoYw5GRPWMr0m0kCWCtfff1anHWbHnmlErTSHi
 FIFA==
X-Gm-Message-State: AC+VfDwmHNVJVS4mKAN9CI8KOM4eSa4eEo6KuZbdZpbe+6njVmx0+FrW
 NMjWyPW4SF+80J8lmL9zVo68nn7THmb/owcQh18=
X-Received: by 2002:a17:90a:4ca4:b0:23f:962e:825d with SMTP id
 k33-20020a17090a4ca400b0023f962e825dmr1510097pjh.1.1685759694215; 
 Fri, 02 Jun 2023 19:34:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 29/35] target/ppc: Use aesdec_ISB_ISR_AK_IMC
Date: Fri,  2 Jun 2023 19:34:20 -0700
Message-Id: <20230603023426.1064431-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IbrXbhMMeyvG

This implements the VNCIPHER instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index c7f8b39e9a..8ae10ad748 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2953,22 +2953,11 @@ void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    /* This differs from what is written in ISA V2.07.  The RTL is */
-    /* incorrect and will be fixed in V2.07B.                      */
-    int i;
-    ppc_avr_t tmp;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u8) {
-        tmp.VsrB(i) = b->VsrB(i) ^ AES_isbox[a->VsrB(AES_ishifts[i])];
-    }
-
-    VECTOR_FOR_INORDER_I(i, u32) {
-        r->VsrW(i) =
-            AES_imc[tmp.VsrB(4 * i + 0)][0] ^
-            AES_imc[tmp.VsrB(4 * i + 1)][1] ^
-            AES_imc[tmp.VsrB(4 * i + 2)][2] ^
-            AES_imc[tmp.VsrB(4 * i + 3)][3];
-    }
+    aesdec_ISB_ISR_AK_IMC(ad, st, rk, true);
 }
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1

