Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp885316ejq;
        Sat, 6 May 2023 00:28:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5aWo0iWOrQ3DPsV2i34viDKaVbHu6bAgyP2EW1AyM7hfyl9bsTfBD1GFbMbn8o3uWK1jQw
X-Received: by 2002:a05:6214:1942:b0:5a2:63a1:ecb2 with SMTP id q2-20020a056214194200b005a263a1ecb2mr7418335qvk.43.1683358109451;
        Sat, 06 May 2023 00:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683358109; cv=none;
        d=google.com; s=arc-20160816;
        b=WRmsc/sXA8MTT4IEUFepMytSEZI5TuT+9ZgW/cHNupd8DNfFoBExCT2mYd2C/CjeKE
         KgeVoQeMc6ZFqtidVEE+g2qyK1UR70juwllssJzrKxJEKFgohSQoTIMtw2ZdIcwf7aTx
         tf7Z4hxXhWSvvt3XNXr3aifWGNWfr6Ypy9onr0WFaoYxpvfsqiaSaqKsHWuZd+tX9jZH
         IddZYe3vJwq7Ml3/p1zAvJxnrsaelNxUtWHzHEoaHo8pOYdQMJvYm7OkzeCWdN9PlOPf
         Cs0APQTmlBhiJ68fwrHXD/IuOHYY5W99RYUpiXySl0eDbOgAT+IKcXcrUhzYottPsO6b
         ypaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
        b=gE72cF5kR4jrpOIM+ltfON7ea7/lhoAnq+tRte6IM4K8gv8odQbRKzLBebqggRfhCR
         BQmjMUVh37JP9bTqIQVOAuIjDWxaCXgnltQ4mya+LgD8ux5G+hH78blWqaQwtinH5JTS
         eOPtjgLfXk+deqI+CE+z2d+bURMTJGZjKiDpkXful7atNXAp0uOgzC0gwdU9As7YNxpz
         kZcWgcF2JdhvrSDE/mvM5H8rOe0qEURpTyx27olVguPPtIHXEBH6jmQdtpPJN1QbVOhk
         ts3eGvC/fdK9dvwdCNWKUTn4xdoZlDo+J95iQxJztMgHr1FeWoA1vFkM8qDrvb5//LIN
         +x+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AlTo+1iI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05621421a600b005a5d3019540si1244461qvc.119.2023.05.06.00.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AlTo+1iI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCGc-00060L-FA; Sat, 06 May 2023 03:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGX-0005kZ-0s
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:37 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFv-0004Lt-Ng
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so1716862f8f.0
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357779; x=1685949779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=AlTo+1iIaFMaKTLUngVBwZ7LoNaDenv9K07t7v4Drur3M+qp3yNmfrrwBBARTUlOVG
 TP789aXPGsX1hnLD1vfJimaK76dMQS40aecOt7gjlhwq6gtVY4j2dYhSF9jhWx3+yZM3
 sEHSmzKFPNvIIu3x0N/XkqqIeaA+W0d2ilsRAP8v6ljc8sJttI4rWg7hHxuNfzKHYA6z
 0AmT1SEbQ/k9UEBBlloPGtxLlhNPM2PqeWykt0i4fvdSzQb26X6GFT/35nFqihBnHIz6
 E0Y0N1SB65JbVUZQlRr/UmS1Rc7qU7UcFmCzd6v7E7vKlBRCbL3iTSZX2FNhqTi+yggA
 08lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357779; x=1685949779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=e//lbHiPxUxWaZQzVsm0edeabasOnyo7EFzf6cPAd/4YA3kn8SSMfubPPXpQwdOGMf
 s4BedpBQK5kZpZygAy1T96as1RfcIHLgT+tUpwEx0m8ZyV7rYCc4WGMfnAnnvnsIXoPR
 LEUHOYS9Zvyw1YJoz/DVCrlPgkBnWNH6S5rpv0IByf4LREMKGkITbhdUOdoR/bx4egof
 mUTIFIRfpd9HBKi2PIY/qVITs0xBfr+XYY83yeWJAdVIP03Wxg4qwte1bqae1/4VdNrC
 KuUYt0x3kU1vZSnrBNpgXnihKLFTLH7ukH6FgttYk7Da7+z+pvh2BKe3k/RiO7wHUqn5
 G68A==
X-Gm-Message-State: AC+VfDwi1kC3mNhK2Dt9AQzJ1g9L0sHc0+lf2yZ4O5gYQFdLL0TnK8BO
 OlgW7gvfs5VQRbr0INSvqpgV5g==
X-Received: by 2002:adf:df0c:0:b0:307:5912:789 with SMTP id
 y12-20020adfdf0c000000b0030759120789mr2872297wrl.66.1683357778828; 
 Sat, 06 May 2023 00:22:58 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 29/30] tcg/s390x: Use ALGFR in constructing softmmu host
 address
Date: Sat,  6 May 2023 08:22:34 +0100
Message-Id: <20230506072235.597467-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: sJLWca2u0Ot9

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dfcf4d9e34..dd13326670 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1853,10 +1854,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        h->base = TCG_REG_R3;
+        tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
+        h->base = TCG_REG_NONE;
+    } else {
+        h->base = addr_reg;
     }
     h->disp = 0;
 #else
-- 
2.34.1

