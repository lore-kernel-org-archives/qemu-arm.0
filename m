Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp286412ejb;
        Thu, 22 Dec 2022 13:56:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu5bsXtG6YCAJlKb3zizIa692CbxWmeEv99z5pWFZk0FGR/YcwDi6neia1eI598ckNQQ13v
X-Received: by 2002:a05:622a:17cf:b0:39c:da20:d4a5 with SMTP id u15-20020a05622a17cf00b0039cda20d4a5mr9490064qtk.58.1671746186074;
        Thu, 22 Dec 2022 13:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671746186; cv=none;
        d=google.com; s=arc-20160816;
        b=UPHPPz3cwtzw1rk1ErVo34w99KTG7TyalOwy8jt7m74ObgmzOj88vrb0yZgr66Oa7S
         QcZB/fuKhVFPjWIAWEigKacuD5A2yKSNjplXfdYTwlzd1EQba57aZFHDzmZ21Qq2E8sR
         NiTjx284AVybTMf5bJSvDuSEttHeYITmhgER+DTerBRYfTkvevcLWsrIqH2N5yJIzY3e
         T7PzOWoomtv1XSvbcBiJNH5Ufg1xGqgktUnjRrX8qXAuTjlh6jSIZk4JUHfi6FD1QRAU
         Y+4+F115C/am9DDHDpFnxiQVitObxzeGYydWWuN1KCFCaSHe1Ajtu5vEUhJjJr8CQTYo
         5tkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WO7iVynT/sEzTHQRGzivhFt/eqGQoyfPA70WfNKwLOg=;
        b=Ahm3DF0SI+Jcf6RtqhnXQHah0XyFCHAs6QBERve9CTIwnMXHTtaOjchik9Q8YLLrSP
         FMQf8XqKMFNxjQu/uwZlSMITSLVvhtOLdLnOjEkbk0UsJUeWfvWn1b9096jKEQeCSAbz
         qXeBBiD+CDpHwZbLo0/lbed0L3HfP0U7uNV301cF8UkJPvTGJUsPXAl6BCOTFn1cc3sE
         WkoPIqNSFHnNPf4AdvnWqN1ftVEWf68AN+iKVTfPj/ND+MzEZkp3xmfJqKq7X5EgmNjb
         6WULp2hKh9Rmq9qRKtvuqM401AHk+sI/Pz8J0MFcSqY1WLyQOZo6RTBQb/gOGdKkXH9J
         1NRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8aK67xY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020ac856ec000000b003a7fa3cc911si666387qtu.67.2022.12.22.13.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Dec 2022 13:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8aK67xY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p8TXw-000607-8u; Thu, 22 Dec 2022 16:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TXu-0005zk-PM
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 16:56:10 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TXs-00079D-Sq
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 16:56:10 -0500
Received: by mail-ej1-x634.google.com with SMTP id ud5so7976978ejc.4
 for <qemu-arm@nongnu.org>; Thu, 22 Dec 2022 13:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WO7iVynT/sEzTHQRGzivhFt/eqGQoyfPA70WfNKwLOg=;
 b=r8aK67xYtN7byddt2ja6SDNAZSuUkzinXBmBfDN6EXe9Hi6j7BaDxLCL2/xXx3IanF
 08Wh+sUQVipBtmii0Pemt/DWy8qK11Lkzaasa8aeTXfU2eQcpsXnv13VS1SUt39VIY+A
 /WeQupkoRFe4NCBsKymdyayfdRYH4IkOZ1eLRIpHm0x3Xa0gvAVWaWGjxTkg5Nqc0YFI
 LmTBW0eW6heCKhoB5IlTY+gI66Wyy3wexGCSVgLzAhoCTj4T8b3W5QqYF+l8dzBmZ7lw
 3qrUDYvWa3iibIEeGLkOv0Rg1fEMkkRXd0ivrXte7ACWAx9K4FsFX5i/fNdDA8HlkcoL
 3KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WO7iVynT/sEzTHQRGzivhFt/eqGQoyfPA70WfNKwLOg=;
 b=iPt9f9U5HSaERma5fd07de1L9R6/tEuJ7KiiK78hNLaDysqZZXeQU7j7FFWRsiXj2L
 /6MfybV/jtHoDnYb2F4LkvGTAGD4fGWobvUa5iLOUTi/JWQ7p4g8Ow182WoeFwfI611m
 E4lfBoQJFHpz042eTvwjWqWf0XIWt9Qmb4X7Xm3+3CsB1GBVkQ1VKKJwEGnfVArz+Fuf
 1hc7TGSXhK2EYQgBhP8x7+je+Umv8GcpV/AVweuviQl8zJHUieLSqvj2VZ/twMyTb5I7
 yzLDts8TT4NlVBYogatX427o7kepnr1c6VRP8EZofBSdupgxrr2GEe9op2c4UQjzA1Hz
 Ktyw==
X-Gm-Message-State: AFqh2kpgcgbPBDROQx4EkWmOpzC0YnoUtLe/PlyxsePYXMT+3MVAcVTX
 u5OPsl9mJ/BOzc+MoY7CMOlHog==
X-Received: by 2002:a17:906:d044:b0:7c0:e7a7:50b with SMTP id
 bo4-20020a170906d04400b007c0e7a7050bmr4888865ejb.48.1671746167393; 
 Thu, 22 Dec 2022 13:56:07 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a170906168200b00808c5e283e8sm664876ejd.178.2022.12.22.13.56.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 1/6] hw/arm/aspeed: Fix smpboot[] on big-endian hosts
Date: Thu, 22 Dec 2022 22:55:44 +0100
Message-Id: <20221222215549.86872-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
References: <20221222215549.86872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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
X-TUID: sVSlw1syQFpe

ARM CPUs fetch instructions in little-endian.

smpboot[] encoded instructions are written in little-endian.
This is fine on little-endian host, but on big-endian ones
the smpboot[] array ends swapped. Use the const_le32()
macro so the instructions are always in little-endian in the
smpboot[] array.

Fixes: 9bb6d14081 ("aspeed: Add boot stub for smp booting")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef72..adff9a0d73 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -194,22 +194,22 @@ static void aspeed_write_smpboot(ARMCPU *cpu,
          * r1 = AST_SMP_MBOX_FIELD_ENTRY
          * r0 = AST_SMP_MBOX_FIELD_GOSIGN
          */
-        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
-        0xe21000ff,  /* ands    r0, r0, #255          */
-        0xe59f201c,  /* ldr     r2, [pc, #28]         */
-        0xe1822000,  /* orr     r2, r2, r0            */
+        const_le32(0xee100fb0),     /* mrc     p15, 0, r0, c0, c0, 5 */
+        const_le32(0xe21000ff),     /* ands    r0, r0, #255          */
+        const_le32(0xe59f201c),     /* ldr     r2, [pc, #28]         */
+        const_le32(0xe1822000),     /* orr     r2, r2, r0            */
 
-        0xe59f1018,  /* ldr     r1, [pc, #24]         */
-        0xe59f0018,  /* ldr     r0, [pc, #24]         */
+        const_le32(0xe59f1018),     /* ldr     r1, [pc, #24]         */
+        const_le32(0xe59f0018),     /* ldr     r0, [pc, #24]         */
 
-        0xe320f002,  /* wfe                           */
-        0xe5904000,  /* ldr     r4, [r0]              */
-        0xe1520004,  /* cmp     r2, r4                */
-        0x1afffffb,  /* bne     <wfe>                 */
-        0xe591f000,  /* ldr     pc, [r1]              */
-        AST_SMP_MBOX_GOSIGN,
-        AST_SMP_MBOX_FIELD_ENTRY,
-        AST_SMP_MBOX_FIELD_GOSIGN,
+        const_le32(0xe320f002),     /* wfe                           */
+        const_le32(0xe5904000),     /* ldr     r4, [r0]              */
+        const_le32(0xe1520004),     /* cmp     r2, r4                */
+        const_le32(0x1afffffb),     /* bne     <wfe>                 */
+        const_le32(0xe591f000),     /* ldr     pc, [r1]              */
+        const_le32(AST_SMP_MBOX_GOSIGN),
+        const_le32(AST_SMP_MBOX_FIELD_ENTRY),
+        const_le32(AST_SMP_MBOX_FIELD_GOSIGN)
     };
 
     rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
-- 
2.38.1

