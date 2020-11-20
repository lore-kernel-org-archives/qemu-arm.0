Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1399155lfb;
        Fri, 20 Nov 2020 07:26:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhvHTMyuOW9aTJCjN6euVMJ8QZ2xeHVSntm4xnQF04sbDBiybR7s1Usd3TZUAK8Smhkt6U
X-Received: by 2002:a25:8884:: with SMTP id d4mr23962015ybl.58.1605885973518;
        Fri, 20 Nov 2020 07:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605885973; cv=none;
        d=google.com; s=arc-20160816;
        b=k7P2yB3HWILqbN26qwaEarSvAWIDZtejCeg2ua4Lu3xT0Exfyrzcr+Jkh0cNvMcstZ
         rXobW/fWs22dkgBHXYu2FTkxrl1XR4UizCTfPct7BXglrCbp7hiVtwrYawJtpwux0reX
         fTOzVMYMKIWsG8SoBYlNfMc6Cwx6Qi28kZDVHw/kjQjA11vSVHjgKk7R905EMPNF8uNF
         0auJ9Meh9BkyfzRizonmTYHvTNrO9SqDu9BUfASIiQFBEeNAJ0AgueTJrhK5jpmub6uy
         W/c5I7on+QqeJOxnj18WvvAYA1ZHrLcnRgka1v2qM+QMEsK9kqQRG8wOXZkBSJbeWhaZ
         WVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OFxYRRko5wDlndgHLT3zQ815TN8hN9Ueg8Jn6ELnMyE=;
        b=Itjt6fBB7GqmfmMIJ3xRIlaX+B3d8RfNYa55tJeA4Q1Df192pH+6i9OiBBOMiKZTny
         qrpTJWb+y/OiLdG43juGsv8z0/H4cbkmSDbfN6fK3Mz7v9I9iBi9AUYAX1oEBb4XsAgf
         RrBucHm2cpDfyN2+our31IE2Zympgl7KVC29W5AttC9TtFOSTJQn4Z5r6RkB2GLm4sz4
         +lk5ykAFAzLkIuLUJvgEOSYiGldWflhH0x1qOgtKTnJyOHKxTrSGyxvvBJPuFnUCSyUC
         +Z+lCCfFC2KOSU502WGYAtOUOiLQqkp1JI5CJIab5eI73xRENdRGz+J25m3hmybAj9C9
         F7hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XkHJtSIt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 200si3148900ybd.332.2020.11.20.07.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XkHJtSIt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8Ie-0001oN-SG
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8Ei-0005E4-51; Fri, 20 Nov 2020 10:22:08 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8Eg-0001xa-6S; Fri, 20 Nov 2020 10:22:07 -0500
Received: by mail-wm1-x341.google.com with SMTP id w24so10143696wmi.0;
 Fri, 20 Nov 2020 07:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFxYRRko5wDlndgHLT3zQ815TN8hN9Ueg8Jn6ELnMyE=;
 b=XkHJtSIteZPocXev2ZtLyGV4+rwDC1DCkjq8OpES5ndeSpMSNkJSz+aaao9MaWcdyg
 bw8dkiyubGmks/kQKSWIbiijkuW2FjmphqPVZQBK5b+rgkOzDG04SVtjrPQD4wAGox8W
 t1ksm2BUVXIFPRtStMGFDzt8CpJq4L0vozunljQA4DWpKa6DGCOX3qRROnxDZiJJehf8
 50wRudvARfaN0WrrvZikHOcrRHN58mtU2mXLv+Q4PeY3K9AXTl/okWF1dVHuKbpOdXEL
 vnmkHW8/sQ0iweMYHR9FoDsXmRUZjfz2lP6Ho/RN5P5aJupoUCDG+ltnvqZ53lOQeSW4
 jvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OFxYRRko5wDlndgHLT3zQ815TN8hN9Ueg8Jn6ELnMyE=;
 b=hORqxnJ4YrNJ7GxkPUv7jzc99NMy/UmnnvG4CNcocAPHLWjFnmu0jEwRnAFckEj+T3
 lO4SgvbRtL3xMZHLGeOhMTNsK0idf0HbqqSu7ZsexJnU3ck2/otyRbE1YNpALwnhm/6T
 /t8AVhmCw4kffYyNsHEzVfXnRaPkyWf8eP0IRwSa8KzD7Qyy6eh0s4hpLlyJRWu56gMK
 Yt8EB2oMS37+LcYAd7s78H/naJyyntjGSJGQ/twuVefvq2FYJimWKnOnfTOljscIAixm
 6r/YFQKpqeYuDbqP3HxTyPnown0+iGmSHtQwgNwK8IdxVMwlZxYfFhMaxkPuvR5691Yy
 Ji7w==
X-Gm-Message-State: AOAM533v9mYmDjT1WxNhKAdmM8cNfBHFer+D0DWHOmIcpC7ZYJMhqw9D
 Oa7aS6s8u9j1XpBYMcg1i6bJveLLU/g=
X-Received: by 2002:a1c:5401:: with SMTP id i1mr11161952wmb.65.1605885724009; 
 Fri, 20 Nov 2020 07:22:04 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id b8sm5847688wrv.57.2020.11.20.07.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:22:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.2 4/4] docs/system/arm: Document the Sharp Zaurus
 SL-6000
Date: Fri, 20 Nov 2020 16:21:40 +0100
Message-Id: <20201120152140.2493197-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120152140.2493197-1-f4bug@amsat.org>
References: <20201120152140.2493197-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HVVynEVkZdpH

List the 'tosa' machine with the XScale-based PDAs models.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/arm/xscale.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/xscale.rst b/docs/system/arm/xscale.rst
index 89ec93e904e..2dd2f8f9a56 100644
--- a/docs/system/arm/xscale.rst
+++ b/docs/system/arm/xscale.rst
@@ -1,16 +1,19 @@
-Sharp XScale-based PDA models (``akita``, ``borzoi``, ``spitz``, ``terrier``)
-=============================================================================
+Sharp XScale-based PDA models (``tosa``, ``spitz``, ``akita``, ``borzoi``, ``terrier``)
+=======================================================================================
+
+The Sharp Zaurus SL-6000 (``tosa``), released in 2005, was a PDA based on the
+PXA255.
 
 The XScale-based clamshell PDA models (\"Spitz\", \"Akita\", \"Borzoi\"
 and \"Terrier\") emulation includes the following peripherals:
 
--  Intel PXA270 System-on-chip (ARMv5TE core)
+-  Intel PXA255/PXA270 System-on-chip (ARMv5TE core)
 
--  NAND Flash memory
+-  NAND Flash memory - not in \"Tosa\"
 
 -  IBM/Hitachi DSCM microdrive in a PXA PCMCIA slot - not in \"Akita\"
 
--  On-chip OHCI USB controller
+-  On-chip OHCI USB controller - not in \"Tosa\"
 
 -  On-chip LCD controller
 
-- 
2.26.2

