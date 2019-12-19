Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2608810lff;
        Thu, 19 Dec 2019 10:56:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRHCOR9WkSniE/eif9JujRI+xjkVUZuYeMmE+hltXR+i8VoISWMDDRoizGXKh3Y4mC5RCs
X-Received: by 2002:a37:c24c:: with SMTP id j12mr9944670qkm.401.1576781777232;
        Thu, 19 Dec 2019 10:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576781777; cv=none;
        d=google.com; s=arc-20160816;
        b=UIrW02EiaQqCjOjCO011yAybD1MJhvcnzT6sPoV0FYF/ZYX44nd3OIAQ6JUgENDmJa
         DSZizCYn0DvBeGFDrxQqS+cc/xX3ZppfqyYlUNs6RXfdxUZAM0ua/nnXuzg0+x2cH8L7
         4+E17MtyhVKpl7W2LJjmVvDt7gxVsj5CbNw4KIxR4lhuHZAFLLrw3YvFlf36LCaHAcW2
         3fiDPfuumwgzZk7CTuamnXpu7KIOqsP4xxpjKntG4aMpL1xR7N7ulg4I3E2Y6SKzTZWJ
         3EwM9N1pJv1tC46KVp7/GJt+qEnSw2sylhzl3MNeqTuj5VfVNgKafL3HZbuQPYz4y5bL
         kUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VamSeBNb0W35YTaE5KKNIilAYQcTaYH0JIGT88S7LVU=;
        b=fPOKvn7UzYQhQ07GGK9/nGR4J9pJTTtpwW6QYHXQyQqXO6CQPcHvplIWTAKwIDFQNC
         L/SbITu89iOMtt5yUdeMFoZPq3D+ZQZFCBhqfYBVTZeP3iJEK5Yzz2bYXDjLUC1Bw8hZ
         DFL67g+LWzJSmoKlQB5PKkJtPBc0buJ08LilprS31fYoF1jJu7esVpzhRD29bHaNfbC+
         y2zjw2776YiiWuPZLqxqqKsypCIPYjtPznXHfNG86Nuslm8vQwZCRi/KCVoPjHS4njkC
         4Z2EFdje2ECbr81BYHDwGKDKe6RKPPUucb0QAx63+Rxr8eMG1kaELfCqqDuk2Spbb19C
         3xqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lGlEoLZ4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si3584514qtq.354.2019.12.19.10.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 10:56:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lGlEoLZ4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii0y8-00042R-BZ
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 13:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tb-0006ze-Kb
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0ta-0007VT-Jp
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:35 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54934)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0ta-0007Q0-BO; Thu, 19 Dec 2019 13:51:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id b19so6513403wmj.4;
 Thu, 19 Dec 2019 10:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VamSeBNb0W35YTaE5KKNIilAYQcTaYH0JIGT88S7LVU=;
 b=lGlEoLZ4HCVjqxq5Zd6ssPum8e5x3eIbiQJpheWrOxKN3wrx+79F/RLx/vlxq+4i7W
 LpOCvnyKz6ylR8adNjWfnacEyamkPFYJv87LZbZH1mtuIfQ6/qF6hZgUZHZqdxymdxhB
 uBrVjYLtfnTPlTg09rViCGByK7IlCKgql+jqlMiKO9hPtKry/mJ4KHe1ca2wiH8tjyZi
 rovV5W1qLoXynRm9FveDA38efOUnPnJ9dKnvQDnkksSzerFb2Ek6QKmijmdBalS0x0R9
 9GzPMSVLz0kLhshbDTOeTbggNB2T75Z+pnO3IQbdvmdbumKrSCAOnzF7gfkvCrC9zsZX
 3x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VamSeBNb0W35YTaE5KKNIilAYQcTaYH0JIGT88S7LVU=;
 b=jbYRrjmLStT2+Rs4M9x9byoNx4hf8LsLriyG2wvjvAOhITDWs8BZVCVPUQB9m+FreT
 AUGo7OuFQKlZItpTZObApyhY/4qaJ/6VsYM2qYJJWqNMYqKO0TTA3vg0rTRIXslFRVEN
 lr3s62HvNLbJciOYP9hFUCc3TLyBKNTKpiM9U+1hfhaFokuAUubVEgBkjRIcBCfwMaIA
 qHSLPhCU0ZDwFRRJHck6Rr7GnBPw2wBMmkXnYe6TV1Q+395zalqdfUD2w53rdSVUfsKU
 JhxOHRx4zpewnXsCU1UlD1fle4vaSuPQgBhbGsUSrFJgFhUgtdaOu45b8hgNIgTXq515
 S52Q==
X-Gm-Message-State: APjAAAUV5SCG7VvdKACPH90pL+mowS4rXmV6+mHFcxWtfLDPaCh8jezF
 5q49i8DlDuA25SCHOJEze4pF16d9
X-Received: by 2002:a1c:cc06:: with SMTP id h6mr11140075wmb.118.1576781493163; 
 Thu, 19 Dec 2019 10:51:33 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id b67sm7435494wmc.38.2019.12.19.10.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 10:51:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH 03/13] hw/timer/allwinner: Remove unused definitions
Date: Thu, 19 Dec 2019 19:51:17 +0100
Message-Id: <20191219185127.24388-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219185127.24388-1-f4bug@amsat.org>
References: <20191219185127.24388-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pct74peata4v

Keeping unused definition is rather confusing when reviewing.
Remove them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/allwinner-a10-pit.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index 54c40c7db6..e4a644add9 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -10,8 +10,6 @@
 #define AW_PIT_TIMER_MAX        6
 
 #define AW_A10_PIT_TIMER_NR    6
-#define AW_A10_PIT_TIMER_IRQ   0x1
-#define AW_A10_PIT_WDOG_IRQ    0x100
 
 #define AW_A10_PIT_TIMER_IRQ_EN    0
 #define AW_A10_PIT_TIMER_IRQ_ST    0x4
-- 
2.21.0

