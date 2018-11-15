Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7086187wrw;
        Thu, 15 Nov 2018 06:42:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5fS3/7t+VRZ8755MEcWJXGhIm7Ymt2w78pdTcet4aEVfT3+/FMfMWYHh2rbVqWV9vd/fZKf
X-Received: by 2002:ac8:3fb8:: with SMTP id d53mr6098264qtk.46.1542292968033;
        Thu, 15 Nov 2018 06:42:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542292968; cv=none;
        d=google.com; s=arc-20160816;
        b=N4NZGrpvSOlFJWJsWrNsc4/ZDMwFzUdInBTIisRbw2lm5T+Q2G4ZgHmhdCeJaecDdm
         tnvufGtNh5HeiPTcEi8nAHuozoRVbvL4LwrE5H1zCJ1jJL89zm4hfY4xe+4X4/4IvT05
         z9GejNzfclV3TRDPyS8R2uC5gIeXcxB8uocDk43SERb2MO3n0uK6HUneCy3+G0Odb03j
         yvY6BceZAroKCfYscr49srpflZDS499Nov2tFTB5JLgCLI8GoRAxhN1EoUgFN4Zsanv3
         /0mzosWF4SlpAJL4LpmumCr8sNr/1gpob8QQ40bSX6isWhJzw6ZMewnYPM+Oh//RFr/5
         wWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aELANUpFdqU9MxksPJ6FaWWyoXaCA6R+18KGRIivLrg=;
        b=g8X7loFFx6m63Kn/U2kLpwxmlISLeHsIY9zMxrTHeZw7cDIYWAT/rdwcqzpXXBQT8h
         6ijueX4o1CZgDC21XE95pc9Yx3kGrdVd7gIq71OqCJDqKKMlpq4bRY+vYMso288i4tZK
         HzXcLG4oZeDGuq1oYE6/uSCI2BdfSrN8z5joWrrgpasXWsWKBZ7tdWyRH442BzscWXYw
         i4nC4U1XSH3Q7RHONWbqQg2G0bW1DL6/16Na1cA3sd10qJ41wlihijgqA4Y0wsJSdipT
         RHtfkRE+9D3f7Wb27n8yB1S1ncZBG3fanE1pw+fIFcf5nON3MKInloaqZ2dEMVgVLz8L
         B+pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v8si849995qkb.11.2018.11.15.06.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 06:42:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNIr1-0002hB-Ey
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 09:42:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gNIkN-0005VM-94
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:35:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gNIkM-0005wz-4q
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:35:55 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gNIkL-0005m2-U5; Thu, 15 Nov 2018 09:35:54 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gNIk7-0001Wq-Hx; Thu, 15 Nov 2018 14:35:39 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 14:35:34 +0000
Message-Id: <20181115143535.5885-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115143535.5885-1-peter.maydell@linaro.org>
References: <20181115143535.5885-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.1 1/2] hw/block/onenand: Fix off-by-one
 error allowing out-of-bounds read
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
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FEsrawPsAwXN

An off-by-one error in a switch case in onenand_read() allowed
a misbehaving guest to read off the end of a block of memory.

NB: the onenand device is used only by the "n800" and "n810"
machines, which are usable only with TCG, not KVM, so this is
not a security issue.

Reported-by: Thomas Huth <thuth@redhat.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I tweaked RTH's suggested fix to use an 0xbffe offset so
we don't overrun on an access to 0xbfff either.

 hw/block/onenand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 0cb8d7fa135..49ef68c9b14 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -608,7 +608,7 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
     int offset = addr >> s->shift;
 
     switch (offset) {
-    case 0x0000 ... 0xc000:
+    case 0x0000 ... 0xbffe:
         return lduw_le_p(s->boot[0] + addr);
 
     case 0xf000:	/* Manufacturer ID */
-- 
2.19.1

