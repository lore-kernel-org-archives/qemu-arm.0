Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2308487wrr;
        Mon, 11 Nov 2019 22:41:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzG6pMjwMBC+udGdkC0hOv+W8paknHDwaalSPkgo5XRE+xwX2fLMeYTmg2KanAuLXXlweJ1
X-Received: by 2002:a50:9b43:: with SMTP id a3mr31049878edj.73.1573540910626;
        Mon, 11 Nov 2019 22:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573540910; cv=none;
        d=google.com; s=arc-20160816;
        b=dkiwlB4DF5m8f5SolCJt63LztnAbF2FvkX0UY+86Eh6T/+JKD/nEvqAOeuB5igbjTl
         QHJU+e5k2Td5bKVywgO79oL5D5PHaORzxW+8ztCYzEDSmxDDVhkA7+NQ6mugO9cKh3Pe
         kuheSV/6443WTFAQrlYzNolD2VwRlmk9XhgYeK5/xVPXbKQ2ucR/9p1yOvYWZZ7ITKtG
         fG7ekT6Dk8hxchL1LNaK6Y/3xLMfxRfXA7GdzIJr7W7yu7qvjx7PXlyl3rzztar+dUbX
         crAF1TdSs7GsIw5GR6NaxNJHU+Q9Hdsd4ibpVv9FG18xmoQF0m+ACmGMtxJMdTtulPXT
         2CjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vr7OAtLxystNKN+NrjrWHkCNh0LuFiDiJrrJhFdZUC4=;
        b=hQKQv/u+Q3HYGxh4d6g4/yA6uIKhynLK2IGjumFiugdm6E+HoYN58aSo+XbNjnp6tg
         BJ0elSHaqbyftkO5asz1hK1ljhoIUfhO8SudvVF5nQZ4CFbZpiZCoDJjSjo84JftkJL5
         m5Uv+WhTPbaMiV6SFaCnF5lmWhnh0VQ/qa+RbQQzqhMISkRP6p6vWxVVC0VBUAOpV3kX
         4re3P1rkNYA30PEQy2O4t4TFzKQjNRfL9SChAV+wYM6h9qVNsZkueJTXg9H3ZD9gJS9b
         ySu8pHCk3wb8QzRUGEfFOqbCnT2UawgV2Bl4LHbhhxhqPqz2r+f10ItPMgmdfkuEWbWo
         FnSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y2s50m4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pv22si10725502ejb.337.2019.11.11.22.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 22:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y2s50m4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUPs5-0003JW-JB
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 01:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrT-0003IX-85
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 01:41:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrS-0007LB-8D
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 01:41:11 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUPrS-0007Kk-3B; Tue, 12 Nov 2019 01:41:10 -0500
Received: by mail-pl1-x643.google.com with SMTP id az9so8114328plb.11;
 Mon, 11 Nov 2019 22:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vr7OAtLxystNKN+NrjrWHkCNh0LuFiDiJrrJhFdZUC4=;
 b=Y2s50m4XrJwxyYZCwg/2AbvgQCUbirg5dt4UAGPRf8gcoYyGkAZatDg7Jd7koF5vfL
 8ylFG/aB2RoXMg+3UIKdC9iad4ApxBLuWkf1aIfCoP15tAKa/3+5Y6kMAKjJQhAyj1Hk
 604YQoKDzssLUMb/glsO8Av9GHyPF4u1xXvja3JUcas5+n74eg4UgKXiZH9yTLIhsJdL
 Zljnlw+sHVRiBxNN3wATc0cIwSn57CcsoxD70hVKeG/avKdbOGOKLOP6zponC+Ollwsy
 iyVq3z+I19zQjjE9zxCf7/pkktGyeznQbcrVLSxwy85QUE6iXBfM2Nv98r8p7+UPE6rC
 YAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vr7OAtLxystNKN+NrjrWHkCNh0LuFiDiJrrJhFdZUC4=;
 b=mpT8ff0FwDcFOViEmbuHx5aoPRJ74SUVleErykGCpzxpOCBuul/nDxPUAGZ4I6lLEz
 1uJsgbW9BzFIoA3fL5JN6q96ubuFfME2a627QF911q2TSu26prw2Mtay5Hj642/krnzB
 nyLEhJqGOGfjUGvi51/j1YvPSvUQ/jhsKDd78lur3WCmsWvmi68bX8H93Ok3KSBf6RHZ
 4yW2X4Dqqs2mtbdo8L5OFMc3F7Riq5Ys4t7Uq5Ek56mYk+7/+LKLgzvVLwd0WSDBynlJ
 I73bo5kTljSn2331iy5N549BrqgN71xrNMFeyo6mtrjcoGPB2Xk43TOCKhz3zjWB2XcX
 JGPw==
X-Gm-Message-State: APjAAAUgNb+S0uBnWoXr+RnyqbdUUbOEmjGJbfR7jiiSuOR45SEKK+Gh
 saJg2/dTQhr+qgLDuyy1mqQ=
X-Received: by 2002:a17:902:326:: with SMTP id
 35mr6518256pld.248.1573540868881; 
 Mon, 11 Nov 2019 22:41:08 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id q8sm16375590pgg.15.2019.11.11.22.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:41:08 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/4] aspeed/sdmc: Make ast2600 default 1G
Date: Tue, 12 Nov 2019 17:10:55 +1030
Message-Id: <20191112064058.13275-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112064058.13275-1-joel@jms.id.au>
References: <20191112064058.13275-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7yQuCYHlgVOC

Most boards have this much.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sdmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index f3a63a2e01db..2df3244b53c8 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -208,10 +208,10 @@ static int ast2600_rambits(AspeedSDMCState *s)
     }
 
     /* use a common default */
-    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
+    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 1024M",
                 s->ram_size);
-    s->ram_size = 512 << 20;
-    return ASPEED_SDMC_AST2600_512MB;
+    s->ram_size = 1024 << 20;
+    return ASPEED_SDMC_AST2600_1024MB;
 }
 
 static void aspeed_sdmc_reset(DeviceState *dev)
-- 
2.24.0

