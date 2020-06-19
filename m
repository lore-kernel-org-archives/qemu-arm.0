Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp789406lfm;
        Fri, 19 Jun 2020 10:22:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQDv2L05AMAWkJguUfwXvgfKHoC0j32FINB2f/xZedeeMFsP4qcc2a5e/ukegys4SAlZsM
X-Received: by 2002:a25:d08c:: with SMTP id h134mr8019694ybg.513.1592587369888;
        Fri, 19 Jun 2020 10:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592587369; cv=none;
        d=google.com; s=arc-20160816;
        b=i/d/930ApjKK7CHKMufSQmlJx7UNtArhgQzN4F1O/H3B2dwX75mD7O2t4nF9NDfOzu
         ZxRRoM/FeDrJM1FjKhhQ10ElLoAT0QWITElM2FMfKAZX/hNCEYWsS6+RjRx1j9/0/7I7
         mfN+OuHtVfiSYWbZodRtvZJBpkP7CCnJU+FTQzEWCCM+RT1NWdF3p6PjHXaWQan9Pj9K
         UVRg2rGnfE+V7Mx1ITmPHZ9F9Je+Iq90LSaY5+a3xB5aidBL6qoEcH5W89VZKq6B2a67
         xSDvPjtOcI8w62qEkC2fZNxS+bZQS5BkurFBt1R/rg3qmaOt0oZNqB8/soujWl44CeUd
         LTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=cWBE60YDRt2ipaIUjY7lGwhDyWZ8nYNoAEL9KqLFAz4=;
        b=yhBp5EKXiWFapFFD/A1Ykfhk95EXfA8E4m9Dgl0sZDeMrROVYq0zwTLwKYW3dWtMv4
         abzhT6EslLr35703W4Qfmnp+d9x4HsTfX9I2SYluAmka+tMIZK+esYjRIGcnZFaKul02
         i26xPSs/MCiZA1ce7fgC5XwKVV2GdB2j3lN6iUiS+BquXS/LhpPCcm3FmQ1ITR6dpEr3
         +ggWFyjWuhNfBlfb+s7uaHu8BK8SxDNDr77ilIrkdZwIgTL8djWOogXxTSBW/kpaV1DI
         zoKwZlJOwgRi4v9+qnqB/H+pHEqi+7laiS0i4GiEVP30eL6xczsyDdXxYSFnxA/Mjwdn
         htiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aFwdICJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t34si5590263ybt.276.2020.06.19.10.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 10:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aFwdICJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmKj3-0001o7-4O
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 13:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmKcL-0004vU-2J
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 13:15:53 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmKcJ-0005s5-ER
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 13:15:52 -0400
Received: by mail-wr1-x441.google.com with SMTP id q2so7976192wrv.8
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cWBE60YDRt2ipaIUjY7lGwhDyWZ8nYNoAEL9KqLFAz4=;
 b=aFwdICJYC7NHfE9XAykfgh/re6iB6JMqXnPtaqf6etlqk6jtZo6tC2KdATJtTawV7C
 fzbGZPgj9u2+VaFaFqg+5bW4hrS6QvuzdWz1D0iiOW2dW2yDCnDROF1mLT78js0h2q4H
 B4tObXrN/XcVqo0NBUm0OaEJXulxqbmnjJSeqtS0cAfpwtboL7xkY8EFeJAUW20FV/ld
 9DJPSu7S40sVnbSxcAbmOQE7XJoJFf27hwWVQJmINr1YVA1REcFmCQLB3WL+7DZfIYvP
 lkNf0WyeavWpRiQn14z6qSO7GlNYo4EjU60Jm0ok3q2SXiFWKUlUxNTG1x9fVsByXo3f
 clKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cWBE60YDRt2ipaIUjY7lGwhDyWZ8nYNoAEL9KqLFAz4=;
 b=IcFIlX3TbVyBnyAqJgpY0P1ovpbGREdW9lGKlpl8vaQ7D4uVTW77pEYar2lbmMH+DY
 Y7UItxdilOc2DrTUTEraT1shwNVHwq1MNkKXclhCJnap4fEaRwS8UnIAc3W7hDvSD4Fu
 M00sHMrbjM0zXW67kc2bg7izhzs8ZQqfBwrEMiribMg329SaBpSOfoxj1r7D0AqUQa17
 EyNeDIirwTp0VSoUCmUAVfpsXpMuBMxmBep/3N1XKSANgNnjW0xazPQfW7zFdKj86l5e
 6FOzVtkaRwQHHcP8eZgMICaFFsl1EpQVQufNr4hE691KssoqviFrXfcBYACFlZzQf2Iq
 GCbw==
X-Gm-Message-State: AOAM530qXZypWBXkKANWzv3ynEU0sbHcHye/XBn+uBWLizgu/4b9sfRd
 ubuUSjYo5ACUNbl75RpD7xeJ1pKw4LtZaQ==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr5528879wrt.29.1592586949692;
 Fri, 19 Jun 2020 10:15:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l17sm7083180wmi.3.2020.06.19.10.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 10:15:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Remove dead code relating to SABA and UABA
Date: Fri, 19 Jun 2020 18:15:47 +0100
Message-Id: <20200619171547.29780-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iwZEH3OI8lx7

In commit cfdb2c0c95ae9205b0 ("target/arm: Vectorize SABA/UABA") we
replaced the old handling of SABA/UABA with a vectorized implementation
which returns early rather than falling into the loop-ever-elements
code. We forgot to delete the part of the old looping code that
did the accumulate step, and Coverity correctly warns (CID 1428955)
that this code is now dead. Delete it.

Fixes: cfdb2c0c95ae9205b0
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a0e72ad6942..01d59164d68 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11370,18 +11370,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 genfn(tcg_res, tcg_op1, tcg_op2);
             }
 
-            if (opcode == 0xf) {
-                /* SABA, UABA: accumulating ops */
-                static NeonGenTwoOpFn * const fns[3] = {
-                    gen_helper_neon_add_u8,
-                    gen_helper_neon_add_u16,
-                    tcg_gen_add_i32,
-                };
-
-                read_vec_element_i32(s, tcg_op1, rd, pass, MO_32);
-                fns[size](tcg_res, tcg_op1, tcg_res);
-            }
-
             write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
 
             tcg_temp_free_i32(tcg_res);
-- 
2.20.1

