Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp592228lfc;
        Sat, 20 Feb 2021 13:29:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysa5qt8ghz659qSllmkzI+12nFG5TcUm4e9Nci7BCmcLvKI1b1L3S24ajtVEVeNi0iEtVJ
X-Received: by 2002:a5b:2c8:: with SMTP id h8mr22437671ybp.364.1613856584800;
        Sat, 20 Feb 2021 13:29:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613856584; cv=none;
        d=google.com; s=arc-20160816;
        b=Zt2cL7XqkZKo5UxejByu3fNgsLvztUbf6VmQFhrvtmhZNZnCxsxKKf4zGV4Hx44HRP
         T7Jw2IrfBrYVZHY+pIBqIR0rUWuzL1z2v+9dwLyjJxD9Y09W5OqljQzWh14gygPMo7ZJ
         vbLL9BT1aeamnIif1pJOpvbayeQPShLkmfrCAcYNG1rBn5jVyB4Hyn++irFhGr92LA2W
         hFJ+b6JcLzFUR9rbipHBFJ61njx/jmBR2J9KMgH74XQluvJzVTZDDIoJOy+bMV4dLY7g
         jLt1/Tl8H3Heb3PfRqKAQNlbJ2iIOYCt9WNSaza5bKnHM3tY5CHcXRO+sRqI3hbEGEeq
         cU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YZlcIqbge5shBdwBo+gxH2PmfFRPNLK7+lY86kmx9Oc=;
        b=xSa9A2kbxQJmDZj6BzV94LzThr2w8moTegaxe1+WxAk5hJu2miOz+KiciXyhCuYQY5
         NJpWn/4UI79uTKTRDli48C3W/hQp3XkzXxGdoW7qnIJD6fYpcYsI5QMLzkiTy1oT1ao2
         kGqQTN4LlhjoBwpNNy0Oc5515Cj2b5e1gecyTTcBDjFd8tI77bV74dv7E22iwO2TPUeu
         EqSKowUePWs0It850t5Dg2TkRGqgH9xHCh3Aby/f6JCEU0iijtAtERxR00ryS2zBNYY+
         nFyKDF4K9ng+UG7vhnnlEX5+fjuX2adtu9AzxEQ5bD268kZQ65ZMfGsGNIDprRX1ub4F
         vCqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X9rwrJvv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si14759645ybp.234.2021.02.20.13.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Feb 2021 13:29:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X9rwrJvv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDZou-0001OH-5c
	for alex.bennee@linaro.org; Sat, 20 Feb 2021 16:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoK-00011p-Mh
 for qemu-arm@nongnu.org; Sat, 20 Feb 2021 16:29:08 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoJ-0003mq-3b
 for qemu-arm@nongnu.org; Sat, 20 Feb 2021 16:29:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id ba1so5352249plb.1
 for <qemu-arm@nongnu.org>; Sat, 20 Feb 2021 13:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YZlcIqbge5shBdwBo+gxH2PmfFRPNLK7+lY86kmx9Oc=;
 b=X9rwrJvvpLPkPiHsw2/TBcuTLcGc/066IQckwwr2PODBMSZtSGwNJXrMRwiMF6Csow
 nEytwxwYPmpxa6CRE5SLUzEZeAxYd8bRUfp6AC6ZRGTTEp2WvrteCbb+ScpyPTx4mBwD
 jccd2UD9TVbZOqNniTr29cVlBIC+xVqXN8iyvpNtcFHaPUuqbAJW6w3wp3fzkWwJCTjy
 p+9wCZ18PeV8AWP5MW1pjhosYW8UA+ey1pF1vfBfjLpTuRK9eWAiZC+PONhPKn3wA3bX
 8Bc1FPyUCYQD1r/S1r+kSpAPQSQYrWuVzEGejxovl+rumT9ipp3oFBU83IZUln79HUUM
 +qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZlcIqbge5shBdwBo+gxH2PmfFRPNLK7+lY86kmx9Oc=;
 b=E35ctPAWTLolJwQ+vGUCgmmtq4SuAUG3bB3KcLGS/NWqsYTniLa9qEp9tBTOc7n+A4
 jwQiF6SczVhCizFRHqg+sxmiUoS+VMYthOEo9nHSt5o4ANPANEismHggrkDEJPsQQ3Iz
 JkpDqFKHMhZJAdiI8NFcO4s2LDRqEOl5oXcNAiMIzbSYJa/2eHVfO340eMgOKaSLkYhL
 lEBgfClsnBlEu4oRxJtHqHZwBjGPSovKl0YbT2Pw0wwRf3d8qhwo694rhWdHC+gM6fEm
 2pIU2coQ+SOs9kbmqb4tic29GtecaEkxVKCzIhYAnroFZiBnt1nPLLj0k5POtSqAZoOY
 xNhg==
X-Gm-Message-State: AOAM533R/CrAYYo6IqIq+sIzEz9Cf7XEldQ4bLJMAjQww8EHxh5qQjB9
 WVJ6Sb8xD4d1aMn3L4DB30+ShfQ8pkpjOw==
X-Received: by 2002:a17:902:e551:b029:de:8dba:84a3 with SMTP id
 n17-20020a170902e551b02900de8dba84a3mr15059086plf.8.1613856545848; 
 Sat, 20 Feb 2021 13:29:05 -0800 (PST)
Received: from localhost.localdomain (24-113-145-216.wavecable.com.
 [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id h186sm9726559pgc.38.2021.02.20.13.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 13:29:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tcg/aarch64: Fix I3617_CMLE0
Date: Sat, 20 Feb 2021 13:29:02 -0800
Message-Id: <20210220212903.20944-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
References: <20210220212903.20944-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z964vTnET4LJ

Fix a typo in the encodeing of the cmle (zero) instruction.

Fixes: 14e4c1e2355 ("tcg/aarch64: Add vector operations")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1376cdc404..903ab97473 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -561,7 +561,7 @@ typedef enum {
     I3617_CMEQ0     = 0x0e209800,
     I3617_CMLT0     = 0x0e20a800,
     I3617_CMGE0     = 0x2e208800,
-    I3617_CMLE0     = 0x2e20a800,
+    I3617_CMLE0     = 0x2e209800,
     I3617_NOT       = 0x2e205800,
     I3617_ABS       = 0x0e20b800,
     I3617_NEG       = 0x2e20b800,
-- 
2.25.1

