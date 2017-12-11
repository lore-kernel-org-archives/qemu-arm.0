Received: by 10.223.159.74 with SMTP id f10csp3052716wrg;
        Mon, 11 Dec 2017 13:31:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBovEs9rMXq7JH3/13iDDC18V45VsuN07V3QUU6MhuGSqp9kFgvb3onjiBvc0qlzJoO/cPLPd
X-Received: by 10.129.222.6 with SMTP id k6mr1397987ywj.197.1513027878468;
        Mon, 11 Dec 2017 13:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513027878; cv=none;
        d=google.com; s=arc-20160816;
        b=DnYRkozdqDLr4a2/f+DR02AQCcqTkqM6qeYgk+vImgm/mAQRsGf8asI5MLkc+SQCss
         LyLOKnFu/Jb5cNtp9sQqeClJqjq0gczzVDKxGD9IPnL1rdr/VdqF6FN8ZhwJ5HK/DJoW
         Z0+f2jkOcr6Q/MBBr5GH/vjDECRMpeWWlnn/nXHRVaI2b8iu76xlBi8JkElG4oIBwayJ
         tb7UYeEoohrU+l8PQMi3h4aTSS+5tlRs1z7SDe8RTZYFv7RqEiAcSRhJsT5wbYABhk/5
         IOu+PSAy6qsRz6tnxp7+GkPIzquLyGfq2a8yQQG9G6LAK4aPNnMgHvrusuJw5wRhyg3M
         MASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
        b=scHcS5Wy0cjIgRAALWPvVAlq4q5hG3buK0WNHsxIFtiut9VJsrQd3ABFIxV+4ILSYU
         QboKNxrqiC3WPOnK0/jviET99L4gKZXs7+t2Egh7FGeUSwBwLXo2P993+2oWtEV3G3CL
         w551Mmx5PA/NPcCngD7yRBGh5YCv+eUpKY6Ka+hKe3U6ZvdOkBSw4/9JTi1n5QcMaoqV
         2OpccoT+dSCoIQbNHfXYtwmGyo8WXmsXDVDHD4VhpqTkyA/+zR+06V+IjEie2+Z3QFwa
         P8XQ2YVXfftdgZ5JXS7UvHGZmLzERQCjoH3MX5ZgsUtg8ECoj6CFVsFYkWRjMrQ9SMV4
         1aOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XLPG4n0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f133si278328ybf.253.2017.12.11.13.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XLPG4n0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVfR-0000lW-NS
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:31:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf5-0000iQ-Gq
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf4-00044O-DT
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:55 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVf4-00043C-7G; Mon, 11 Dec 2017 16:30:54 -0500
Received: by mail-pf0-x242.google.com with SMTP id j124so12531506pfc.2;
	Mon, 11 Dec 2017 13:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
	b=XLPG4n0SfNfCfhNA4+dmaEYJpbIFUMUSHjtYrtgBiXjRqGZYodtUrOYBHSxj0Badql
	zgIuvipKFe0M3+GzJXfTgLhqymmPOz6DAytG5D9WoUB/YiNwt+60qRKhYPoinFOnwwWx
	SiD4R0G+gNpY/JOP6RYYsk3wICbvMVuzeyA1XDBW5dAiVYT0PjoujG3FsKne9jgHV8bR
	dadiyz7wvJ+w9KbqHK7z6NMxtHAql6gQM9R++dQpx9/+1b9kl+xFD8q8fFouQHzXeScw
	REvmPnex+401w2bDamuk8QUbgonhHHggu7yQv1uLik8CKKwFTLfP0KCALm3PbSAwsxi3
	I3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
	b=gR4A5wTpNFsmKwSe9zs8JWvxhPb+3+ANBSIgAYF3KzygcCK9pF3wJKlDnxZVYbLbTy
	YQGkZYZ64gmn5AWHVgV9cSR/c/NCHr2tlQSbSKm0u/oBqk4eDzxdXQiJ/YDGd9AGIQhq
	wy1D2tqVdBcV6nY/ye2H4uoG+pAgrq0I02i+9qFIiRcJWrgM0hRRBHz67xhk2qar5dw3
	E8UkCSsG4MNEjvSRj0CJzcZpFkV+hstO6P/izrsqaoTC92aLK7aOqPlndXeEfg3SxC4y
	WJxmWZx2Aa89eQkWyy3QKde/qetyJyE/ucEau4GHgdMg7gmbkprjdyGEPt0nUHWYzIHL
	KdjQ==
X-Gm-Message-State: AKGB3mIeydrzOPEaGNzFsJ7hiM7GSZiapSKym+DUegIqWoAVxw7qGlOP
	N49NjWU19vGowdpcUTAGA/GamNyq
X-Received: by 10.159.245.145 with SMTP id a17mr1670308pls.276.1513027853089; 
	Mon, 11 Dec 2017 13:30:53 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:52 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:29:59 -0800
Message-Id: <20171211213007.7353-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH 05/13] imx_fec: Use ENET_FTRL to determine
 truncation length
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N6cH8YgcuVtn

Frame truncation length, TRUNC_FL, is determined by the contents of
ENET_FTRL register, so convert the code to use it instead of a
hardcoded constant.

To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
increase the value of the latter to its theoretical maximum of 16K.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 4 ++--
 include/hw/net/imx_fec.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 56cb72273c..50da91bf9e 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1052,8 +1052,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     crc_ptr = (uint8_t *) &crc;
 
     /* Huge frames are truncted.  */
-    if (size > ENET_MAX_FRAME_SIZE) {
-        size = ENET_MAX_FRAME_SIZE;
+    if (size > s->regs[ENET_FTRL]) {
+        size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
     }
 
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 67993870a2..a390d704a6 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -86,7 +86,6 @@
 #define ENET_TCCR3             393
 #define ENET_MAX               400
 
-#define ENET_MAX_FRAME_SIZE    2032
 
 /* EIR and EIMR */
 #define ENET_INT_HB            (1 << 31)
@@ -155,6 +154,8 @@
 #define ENET_RCR_NLC           (1 << 30)
 #define ENET_RCR_GRS           (1 << 31)
 
+#define ENET_MAX_FRAME_SIZE    (1 << ENET_RCR_MAX_FL_LENGTH)
+
 /* TCR */
 #define ENET_TCR_GTS           (1 << 0)
 #define ENET_TCR_FDEN          (1 << 2)
-- 
2.14.3

