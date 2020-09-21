Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3752916lfq;
        Mon, 21 Sep 2020 00:59:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj/91rhexnPDU6IF6Ge0e0CgGo+5Zzw0apLdx2S9pGmW1d8Wiz17dSvsTW/QF+DhLXxlVz
X-Received: by 2002:a25:c5d3:: with SMTP id v202mr22471630ybe.338.1600675160411;
        Mon, 21 Sep 2020 00:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600675160; cv=none;
        d=google.com; s=arc-20160816;
        b=SGQctrqy7agirlqKIIya0BfXqkRH27pMi3iLevvYMRqDrYwf4Ma9gIR/OZk/8Ojqx1
         Gd7Ropo2EGurRYA0yinuw3TwAAvwu7Zdtifs6eGSpNZQXs8lFao/kE02+XDKY/DUf8Yl
         u07L9hyKV7qy6oyy+0AZRSb+VVuji32UMMVXHPzY/ZpKZxoIDmRPeDf+qyDxWd/jwg7c
         IX+YNqMat9A6QeBUi2TgXUrkh52X5gupKpafXvbRvkOdLcR4xde5UgIpcQDN46yAcERS
         93vOP21S5FYZ9i0UFwW8y/IXu8+gUEu7aINeRgpfUNY3cbfbMrlQuLN4pxLXk2HrXBdg
         ncgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cW7dIGVbLQRxcINm7s/47MM1xbv6QEuEycp0D1/7E0k=;
        b=TQspaA7ekyqBmmrtAWB6wrTlFIWM+FIqSVQimhq01W3PIdhliPgIzNhtRQHioBfmqX
         9vjHJDg+KO93AMJ7OQcPX2Jp/MYdHKlgJQJ54erikd5Y9m9tjNZIVyxGYClSB5AuhuAV
         QGu9cPCPJj5qGzmQxkh4RBWnSU3m+x7P9Syu7XGeOEEdim7IX5VR9c9XFn1xkRxS/rA8
         8U8Hhclj134XbN0Ej3VDx6REdQzBAkOXXiBXLmKX3jUJ4tjw/4ogPTnmBhaXM3o6XVPr
         ysCzu/bjb8kMB3DCCDCK7zSGlRt4EThnTU3LzE1+V+gS7Wzk34IPMFOZXTMtWUJX26Hg
         H59g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gpgXzVVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r79si8965622ybc.23.2020.09.21.00.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 00:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gpgXzVVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKGjH-0007Nq-R6
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 03:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKGgd-0004TS-Ch; Mon, 21 Sep 2020 03:56:36 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKGgb-0005tc-UP; Mon, 21 Sep 2020 03:56:35 -0400
Received: by mail-wm1-x342.google.com with SMTP id w2so11140255wmi.1;
 Mon, 21 Sep 2020 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cW7dIGVbLQRxcINm7s/47MM1xbv6QEuEycp0D1/7E0k=;
 b=gpgXzVVOO+zBlYb0re2X/evLPDGwyGDIhqHOJnk/q7YD7/asCH0I8PpUlA3uGmRUr/
 RdKKNBldda8vjCpLtwP5f94sXXbM6q2HFVgGQxwJU3lc37zedSznVzsBV3Y6F1gtPum9
 EP1kN50X3WeiXDrmVJM1u4Y5vFCWmuSd08pt+2QPJJ/gG7mNxbCMwf+CLJJbXruYBlQ4
 bWWUhvqGU+XFVIV4QixSPpQBXNxy6kIlUWCk3RmFslRgdRLOqJdoB1lDXxjJZQIJjiF/
 EwPNtfOPHO/FxiLDUo7JQvWI5MIDUuwm2j5GpBvZVr1ecebpD+82AWYChomr2RCrOydN
 SXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cW7dIGVbLQRxcINm7s/47MM1xbv6QEuEycp0D1/7E0k=;
 b=g0w4BueLNs2HMLbewAo8xQReYDSlAJxjHhrlhn8Gqdqx3biBNJFCCFVXCd+FffPurd
 MhU9PWXWvSYTo08p2GAgQqGYu/8B2eOROTnVnaM/Ys0dvIDFGTF8mwwewWKEUbiyuNBj
 l9g3HAJ2hyja1iPGXiBenKMmhpDw3ak4BRRqamZoKTxAY/5e2gN1Q6LIdQwZd5mLOa/N
 4IjqOlS4DKUTH8Czqn4VsLin+y1ySZSlGJ2/m2ctY4HJPui9w6tivS4lpDqCAVW+5OJz
 ussZ09k1oYQWBkBPga01RYhGzZJHnuU38woZmvNLs0ZdDHvYXJUOoaqVcpC/7eh8Hs82
 jK8g==
X-Gm-Message-State: AOAM533qnfB0uvCajixM9qWyOPEWBnp6pZkGsAZeFYdjXkPwHjmBZBTy
 gX4bcGhvmlQbxiTJTyi9NlaHHgl94eQ=
X-Received: by 2002:a05:600c:215:: with SMTP id
 21mr28514189wmi.105.1600674991610; 
 Mon, 21 Sep 2020 00:56:31 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id o15sm17807538wmh.29.2020.09.21.00.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 00:56:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] hw/arm/raspi: Display the board revision in the
 machine description
Date: Mon, 21 Sep 2020 09:56:21 +0200
Message-Id: <20200921075628.466506-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921075628.466506-1-f4bug@amsat.org>
References: <20200921075628.466506-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JCka+hEPmR6y

Display the board revision in the machine description.

Before:

  $ qemu-system-aarch64 -M help | fgrep raspi
  raspi2               Raspberry Pi 2B
  raspi3               Raspberry Pi 3B

After:

  raspi2               Raspberry Pi 2B (revision 1.1)
  raspi3               Raspberry Pi 3B (revision 1.2)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 811eaf52ff5..46d9ed7f054 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -312,7 +312,9 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     uint32_t board_rev = (uint32_t)(uintptr_t)data;
 
     rmc->board_rev = board_rev;
-    mc->desc = g_strdup_printf("Raspberry Pi %s", board_type(board_rev));
+    mc->desc = g_strdup_printf("Raspberry Pi %s (revision 1.%u)",
+                               board_type(board_rev),
+                               FIELD_EX32(board_rev, REV_CODE, REVISION));
     mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
-- 
2.26.2

