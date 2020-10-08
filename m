Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1771049lfq;
        Thu, 8 Oct 2020 16:25:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypLlWBnuGsSK9nxOmNvhm4uiIuC16WPjCRyyHr2BHLKZOpE0G9p3oOZd83o5PR56ifUOlB
X-Received: by 2002:a25:e693:: with SMTP id d141mr15091419ybh.8.1602199537892;
        Thu, 08 Oct 2020 16:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602199537; cv=none;
        d=google.com; s=arc-20160816;
        b=VznP21eCkSUDEVKWG4mm8DRSB6vcCVHwdkAXPyYrV01G5VcaOhvR3jUny6i4ty1wLn
         9aApBTzMA3AYhe9roufX3FZ7GtU+Sl+5jOzS9UEN5BIpTIhXoBKkZF1MGMAS/umNCcxt
         EXnkhSwmqxaoXmI69qBbxRGmkuv5gfmfQSUuv0SpYhdUg3LBZtozfdO9lQUhY0AbkjgY
         nfptC1YVBkVtuiML14eUM9jbi53DvRSwvE0xY1pz/2t1NTC4eJG/eXS+gEHmTbR8EEHd
         44CnX44gDaregN/WhV2pEiB/GqGxt8Apd66AdIWdJXSeQitJAMzWV7nhY016yluivmbI
         S3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=GvbNwDqppFPWenoks7xb2ZqH9HIInY1obMx9e9WOMDE=;
        b=XnUnm4taVTApD9eUNQC37LZzm+bMfxoNEnf3LHPbwwd5Agx4RkuEgQC2lDExDPqHUU
         PSexj434K7G9f2IulFFeMafMYT4og+R2JJP6b23ABQS/nQa480IZqpURgxKTGSQ+/UCw
         c3tqj6QlaJvzvzTEKngOPLRPT1KJbPoPYUjXUGqNmHoGu4iQlLfkM5a474jD6/l45z6g
         8g+nGrUVuHtt4YZwNOBk47A5CJMcEs5oYIu9v62SCWSGdqgTCNKP4m4y9IF+gEn2LEQS
         KEUxzOC6dzYIsPH5wEo0Gz49xd7fnSBcoeqnYHt83z4wgNDSPJ0zzItSRPCkqGZEyZOP
         fb3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=NbQRUtqD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si5954926ybf.156.2020.10.08.16.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 16:25:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=NbQRUtqD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQfI1-0006jd-0e
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 19:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JZ9_XwsKCGQJUMKPPGOQGPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--hskinnemoen.bounces.google.com>)
 id 1kQfEx-0003sZ-DT
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 19:22:27 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:43504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JZ9_XwsKCGQJUMKPPGOQGPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--hskinnemoen.bounces.google.com>)
 id 1kQfEn-0002sN-93
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 19:22:27 -0400
Received: by mail-pg1-x549.google.com with SMTP id j17so4984588pgj.10
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=GvbNwDqppFPWenoks7xb2ZqH9HIInY1obMx9e9WOMDE=;
 b=NbQRUtqDp+8k34zRK3I5QfjS+kFEmS0Sd9rYUV51WR9ue/iFGgKzci/y/6QWwUlPew
 lULJTX3YzWgiuL1CmntJmBnKY97iTqK7s1GJmRpEMWVKrlpHzpFifmTB7kgPE+aQIINi
 irH0lNQO5jIsEkiqzyVdqsgcjV5vkzX9ra86SYspjCvkPBdfPqrDmrvMRGNHq78GsdDU
 6q6Vl1Vqe1zboDW7x46mtCISlAe8Nr4PdIMH/35mgw4t0rwPhcc0U6lr1VSNKV6QuvVP
 3y6nUMuZBaN2BO2sZzXFQuE/yKSmqkMlIa7XgQ+vP1LyIWvpeIwDJ6XD4wzwwknWscBj
 bHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GvbNwDqppFPWenoks7xb2ZqH9HIInY1obMx9e9WOMDE=;
 b=GSjns5E8WqPa8gMS+fyPSUfEBcG4T5WpDL3WEa/8rok0PeEUt+My6VNfXLNF7pmlXC
 R10g76EyAKaE2BbFZqiPXajRKaBrbzLsZwOlM7rr/+cBFPjNGYJK6qqpOwfX20IyNYK8
 pUW+/b49K714/smhAXGHC3w7ncKN+/jdl4fMqwLGMdR1yyob025enT2o95K+yB0iVurt
 V4gshK8A7uqRwaeVYG/41qzLxSDU6z7lN4jRAFEc9dzelCo42OpziSwYO3KHqlaFeBIM
 M29gQk4vFivpXwqrkeLqKswYLXonMb7ht6MknOIK0Tvo1Hky1SLY/kKB+Nxh62lMYDG9
 CTQQ==
X-Gm-Message-State: AOAM530uq2xyxioULHQBv6MmkmlvzdR+W4wqNaQrqjAX/X8D9WJFgNz2
 JQwRvZX0/wKSmJ/osOEN9Vm3CGIN3Spznklm/g==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:a05:6a00:888:b029:13f:f7eb:578c with
 SMTP id q8-20020a056a000888b029013ff7eb578cmr9954809pfj.10.1602199333465;
 Thu, 08 Oct 2020 16:22:13 -0700 (PDT)
Date: Thu,  8 Oct 2020 16:21:50 -0700
In-Reply-To: <20201008232154.94221-1-hskinnemoen@google.com>
Message-Id: <20201008232154.94221-3-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20201008232154.94221-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH 2/6] Move npcm7xx_timer_reached_zero call out of
 npcm7xx_timer_pause
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, f4bug@amsat.org, clg@kaod.org, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3JZ9_XwsKCGQJUMKPPGOQGPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: RK3Y+SjVRra5

This allows us to reuse npcm7xx_timer_pause for the watchdog timer.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/timer/npcm7xx_timer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
index 5703e43d40..2df9e3e496 100644
--- a/hw/timer/npcm7xx_timer.c
+++ b/hw/timer/npcm7xx_timer.c
@@ -157,9 +157,6 @@ static void npcm7xx_timer_pause(NPCM7xxTimer *t)
     timer_del(&t->qtimer);
     now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     t->remaining_ns = t->expires_ns - now;
-    if (t->remaining_ns <= 0) {
-        npcm7xx_timer_reached_zero(t);
-    }
 }
 
 /*
@@ -239,6 +236,9 @@ static void npcm7xx_timer_write_tcsr(NPCM7xxTimer *t, uint32_t new_tcsr)
         } else {
             t->tcsr &= ~NPCM7XX_TCSR_CACT;
             npcm7xx_timer_pause(t);
+            if (t->remaining_ns <= 0) {
+                npcm7xx_timer_reached_zero(t);
+            }
         }
     }
 }
-- 
2.28.0.1011.ga647a8990f-goog

