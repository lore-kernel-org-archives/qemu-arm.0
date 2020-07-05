Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4334258lfm;
        Sun, 5 Jul 2020 13:48:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXJXRhn44+Jc97X75y3MGimmEVrkRGnjV7EtTmirT25lDFL41OiWD7rh+aXhIkSE/xc3E4
X-Received: by 2002:a25:8089:: with SMTP id n9mr12317513ybk.44.1593982099890;
        Sun, 05 Jul 2020 13:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593982099; cv=none;
        d=google.com; s=arc-20160816;
        b=vLBGcGi9JD62znY/v87S0F+T0l7RuBypy4G/ZhYE+etucYnYcaQ3a+8AEXmK0gf1AF
         uQiBQalz+1KYO4FWs8qs5zoTIlwhi2UhEraSMBCcRN6xDNad3yJF1xqYuZs72ebkszdj
         kue1RkWqFMTvxrlcSIdurdm+EvJ371FkymdXcj3VNyG199q8n+xkx0Emkd0X+1+wEhNc
         hP79jQCxwRqH0Kuo5NfNGg7nxtAJiSV86ATRQA3aUnrACXFwfW/sfHRB0AlTp8poXy6B
         ZzLmADMxIQ0Lo+s4TUHD+t/jY7SuXiYQYorJ5hpp7Q7PX3BiVf+Fum4eKBxPLA5eqVBK
         xnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6rxTtNzGxZKeUz8u/465WGrq0JGlEJZidTb9y8deq6c=;
        b=amrzEH5xlqgAMHuFE9OoEDPK0cAB6WDyKyxy59AiGDRL6er7E6cmeVA0LHOkwoAN7b
         ohlyhQt+HVFc9GWUp0beh3JEyLK6E8DBaXiHjoAy4Fl7KWNCpRHb8GdG8DR9848nPkgq
         LnpPmd4WzD8ooWrm4iB5naWA1KRQBRZdzbcliaG2wZgBUKSZonCo0JLmla2J5mJDJKF/
         GEm0hSrWXfkVb39NbUVpqFUREzkQXL+zciOBrlk72hhK7aKtI6C+YARFMCJfRqqckhUF
         O7vFUln9bzzksLV4T5gOnpz+61A36FZ0STX8OY3sS11TMeCgf/gjgxCSF/usgOTn/WHm
         zi4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kT1j+IAI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si16642285ybb.75.2020.07.05.13.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 13:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kT1j+IAI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsBYh-0006Fz-7I
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 16:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBX5-0004T8-RU; Sun, 05 Jul 2020 16:46:39 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBX4-0000pH-6M; Sun, 05 Jul 2020 16:46:39 -0400
Received: by mail-wm1-x343.google.com with SMTP id f18so39594739wml.3;
 Sun, 05 Jul 2020 13:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6rxTtNzGxZKeUz8u/465WGrq0JGlEJZidTb9y8deq6c=;
 b=kT1j+IAINJp7ET0x51OC/MutF4L7mkS5pCL+JGPwLNniC8TM6Ri7o5a9xToazhcOTI
 lzMg36zKQNqHJMib3Cub0vAkeA9bHaKwha7Dccc4Sx0FRjLwN8SBEb/aoXyXa2Lhzf9Q
 ierLrYARMMXpjWl9S6FDg9xYHNMgsBgo/rl6vlc+hrJbMvaHng+5df1I0S3hmFpJZhy7
 RJM43IgBWG8L3VHNG42x2NSKU/YzESwdiR433jvZdfi/uQZArT+kGkt5PHkpxsPVjOnJ
 Qi3OXVcILGjSqEU5vWIE/gd5advfeCSdlDJLZlto5DotH1CQD/YCFpze6VT4puP2W5Bo
 yQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6rxTtNzGxZKeUz8u/465WGrq0JGlEJZidTb9y8deq6c=;
 b=qhrx7fhr5T2QLezImpODrq7pWtjSbg82YjSCevbKf3aUo1mdVYd9pi4A4d3BgNzCnw
 qS003ArLUHDmD5SgktemIkw/P0WHbrem+s2v3YMzfdTaTvSg/PM7u0RUGBUtoBkAV9/o
 C/tRNFSDXmJfJamCqfBnJH/YkISQ4sL4V84GUZ9Bumlq2JNEnzQkynDUgHmXWJ/8oRvm
 LRNe4IMVtBgKfKyCFbpaz1snP0ybUl9OIhAqWbeFQmpQEck0Kw+LGCp9G9lI5gRBGMfT
 W5TJowthVkYlOXvUvkl5evy9xMSTl7IzF9o/0+khiYl+anBP/i+CpiO1MhwKPJWdGhdP
 2e/A==
X-Gm-Message-State: AOAM531FVuYxRwxshUhsnCp5BX3iRe2hMNLTli8Eix/BsYaxBgfLFF4B
 aYvmrgjo0tsJrwNixJQnDbxTQ6/TIUU=
X-Received: by 2002:a1c:a986:: with SMTP id
 s128mr49169383wme.121.1593981996400; 
 Sun, 05 Jul 2020 13:46:36 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g144sm51397817wme.2.2020.07.05.13.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 13:46:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/10] hw/sd/pl181: Add TODO to use Fifo32 API
Date: Sun,  5 Jul 2020 22:46:23 +0200
Message-Id: <20200705204630.4133-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705204630.4133-1-f4bug@amsat.org>
References: <20200705204630.4133-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7BuJF6QBnh2P

Add TODO to use Fifo32 API from "qemu/fifo32.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/pl181.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 3fc2cdd71a..86219c851d 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -57,7 +57,7 @@ typedef struct PL181State {
        http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=4446/1
      */
     int32_t linux_hack;
-    uint32_t fifo[PL181_FIFO_LEN];
+    uint32_t fifo[PL181_FIFO_LEN]; /* TODO use Fifo32 */
     qemu_irq irq[2];
     /* GPIO outputs for 'card is readonly' and 'card inserted' */
     qemu_irq cardstatus[2];
-- 
2.21.3

