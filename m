Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1164821lfa;
        Mon, 12 Oct 2020 08:59:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1PGH3JhySMhLIS+z5V81XpkxUcKQ7sQfq0gETHxwgBEJMBUlJuvpLf+Jo7JqFnr24s5Ma
X-Received: by 2002:a25:ade0:: with SMTP id d32mr10292761ybe.132.1602518347171;
        Mon, 12 Oct 2020 08:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602518347; cv=none;
        d=google.com; s=arc-20160816;
        b=T7kPVwPu6Iz5RyveMq4X9aBxRu7TH1sj6XpPpdRLZcUOI+6u9Dc8eaS4uq+7NnAt2T
         v0xucP2+e7BqERCSm1DltEBFvVeXUZ5K0ROUj4ctmzVSKPYHR4HuNO6TsXdixmj1BxzX
         U7Z3j16bDAOjShv4zyWrC37vnCaa1Asvc6tPRCbUPLSCitBzIy3VnnGbDMr8fMhZI4Bp
         FvRxQJBAo69+b7s3vwNd619iBoMSucsO9nBFTFttV4qvs/IrUM1Ssawzuej+TIbOzDmT
         vZoZM8gnIInEalzZB0ExDDlIvHKqXd4qMl3gwqGpxIs7VKAuem0qEfPNiVa4KINjKvMN
         K3lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9dCI9vVIHjGOIU15u/YnihvSC4K6HLaW4rgzCu/bPQI=;
        b=suzrFRP9+2hVkvqhHLUUxWzaTf6NfBAXNZgd1lP/vWuq9vbGX3ZqS3t8ADWducE707
         jYh9XIsTUPEbdADxdhF+0fFrUt+UbmuN1To+PlBmM0zXnOUQSW1gj2F41SI9tt5E8p52
         57fyBrohqTWs7YXoQHNGgOL+2ZAyc+joO6LW1J0uIVq9AZWoefLWXmhV22jwlPtXV5GM
         8a4kC+3ITMqACWV4flS2lUkjpBTDrUy4fFiaqg+c0P687DaX3URChoGvswqt/zdd7LsG
         gSaYg6Wv3XwBeXTyjHLAQ16TzFembtHc09mEgFFxvY/5hCwML/AL2pNZsYWpjTNsAG/7
         DeYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lljcsCmP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si15122914ybt.365.2020.10.12.08.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lljcsCmP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS0E6-0006bC-J4
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztZ-0003V5-C2
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:37:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztX-0007lB-8o
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:37:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id i1so13574500wro.1
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dCI9vVIHjGOIU15u/YnihvSC4K6HLaW4rgzCu/bPQI=;
 b=lljcsCmP0fkpHKYyW+GVLzuO7pU6NoYK52YAUzPypHUg5y2XMHbcMAkf2CktXd6hG5
 ecr0XaLQDSmrCBO8fCm6cCmcpu6samPUYiIo+PlexavyrkAIeX4Gd5xpndCsiAISZx2v
 xPv2ISdFbAMzdYAXgHyp7UyyHWofqrCXWHt71E5yH8tIbtRlZkFp73yvv1IEE9REIBGQ
 iO0BGNo3mKF0cG1WHvU+/xs+c34nMrDylCphKercMcQ96ci0P2E/dgURZm6ME5m7GX9F
 2/m/y9BOd1yxxqdBlCXKOlMtHFGhpvT8+PaJwblyyKXbA/L4Gerfc2pv4YoyBnYF7XqQ
 673g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dCI9vVIHjGOIU15u/YnihvSC4K6HLaW4rgzCu/bPQI=;
 b=uIVx7OFIJwPpM69sjPq60rsU/ZCjrRAVag97PpybcSnvhHuSAyN+FPtw9uYPqmkzsg
 Vu6iFkBc5+0svcLxjNs8O8JZErTjPB3fdpRl1ZIB27kjZAL+23/uDpurSsF/UBkUYn/c
 dWuB6c3mDLsKpN130DKkF6nRDxtgBxDmrFx1FA5aNb1Q1Otn6lkllYeNCYM3gMUXnydr
 KxapNGRGGNGwT9hpXkJ8bTz5OGfmgAZt+Uk5bXynRpFIVQrTwpwJl5OBEy3h5v7EY6kT
 A3Vp+KN3xirgtXrDNwpzfueXkzekyK/sQmVrCEWVuC2BrSPEyGDpKnCcRrNQbWZvaA7Y
 x5lw==
X-Gm-Message-State: AOAM530uZ8daIAOCN7Yl+TYwuiQ0u7i7uSpHUYlet7oNdzoWdpbUjw0H
 HW+rnbpE4cAjsr5/rrdqjEx7PA==
X-Received: by 2002:adf:f305:: with SMTP id i5mr25152926wro.346.1602517069740; 
 Mon, 12 Oct 2020 08:37:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm7095961wmd.14.2020.10.12.08.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:37:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/10] decodetree: Fix codegen for non-overlapping group
 inside overlapping group
Date: Mon, 12 Oct 2020 16:37:37 +0100
Message-Id: <20201012153746.9996-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153746.9996-1-peter.maydell@linaro.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZAx/a7/vgwMK

For nested groups like:

  {
    [
      pattern 1
      pattern 2
    ]
    pattern 3
  }

the intended behaviour is that patterns 1 and 2 must not
overlap with each other; if the insn matches neither then
we fall through to pattern 3 as the next thing in the
outer overlapping group.

Currently we generate incorrect code for this situation,
because in the code path for a failed match inside the
inner non-overlapping group we generate a "return" statement,
which causes decode to stop entirely rather than continuing
to the next thing in the outer group.

Generate a "break" instead, so that decode flow behaves
as required for this nested group case.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/decodetree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 60fd3b5e5f6..c1bf3cfa85f 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -548,7 +548,7 @@ class Tree:
             output(ind, '    /* ',
                    str_match_bits(innerbits, innermask), ' */\n')
             s.output_code(i + 4, extracted, innerbits, innermask)
-            output(ind, '    return false;\n')
+            output(ind, '    break;\n')
         output(ind, '}\n')
 # end Tree
 
-- 
2.20.1

