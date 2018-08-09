Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1877128wru;
        Thu, 9 Aug 2018 06:05:56 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzyqOFLbRmcTgaHZUuT8A8OOP0OhQFr/1OTATW27KCJFZ0aSLGOU0RMdsRqSWt5iiSH2SwP
X-Received: by 2002:a37:6d44:: with SMTP id i65-v6mr1645078qkc.142.1533819956860;
        Thu, 09 Aug 2018 06:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819956; cv=none;
        d=google.com; s=arc-20160816;
        b=L7p+lLpY02o08PRjIhUF9/M43Yvtly+ZHtHHgu4qw1exxPS3PRhWAujj5/x9jcjuxz
         GIIg1DO6gegMrK3ojriU3Xz31vuZfSdEROoqRPMPsGzNqyLnLimCEyMLW4Ot4aJKYulj
         Zcv2JkfxdcFiIvEPKpT4HZNYwrKzXhBvnRsO7WVUIUfoPLIeHDqDpqh2MzVZmomSeRd2
         pU33xoxI4Dp15xnFtRWUo+ZlPLZeO46KEF5dPj+aqvkNcBJbp5603ibBYTYIh/W69oIm
         BdUFkhfyH/vCSRFh5LMKrK17Ns7WiEknatPP4ecvwFyh1j3Q6isn60nvX8gbs1UMCpfT
         0yJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=o2lsAfQxR1xak9QI3ZMA5/nQDsh+ke/ih0MwMFezpFA=;
        b=lEzE4eNUwLtFI0vnr9avw+skh296rAY3SKk7dXF2/hUvxnrhnxf95dDH+qNiirtWDQ
         jqr8SOGXA1impgus61QjZ73+dFt87Bz3ZJlvsgIq/8ACLi83qX2ytsN5ZI3kI03rXq0I
         Z0e0TPvbyLbBvRJRG35ymqiqcyUu5EP8Z6Svc9EN6nJ+DPfobsW1BsehW+a98lpCxYwy
         ZUKwbWMj4VnF6bN/VWtmD4m+5LUyXwahafO2BK3K/o9brGIt6RarzE7/fkJjwA2tKvdB
         tLJEfEC6vqPbe9Vk8yBhoyWDMWpYB06NupL86IC6nsJ4xopHmNyuDU/dDRWOmR0NqeOh
         l1Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si5666131qvj.236.2018.08.09.06.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkdY-0000zi-Ab
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:05:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZS-0005yz-29
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZK-0003Kp-9U
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:42 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZK-0003KI-2N; Thu, 09 Aug 2018 09:01:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZI-0003Le-W1; Thu, 09 Aug 2018 14:01:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:13 +0100
Message-Id: <20180809130115.28951-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 14/16] hw/dma/pl080: Correct bug in register
 address decode logic
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 75QcK74conHO

A bug in the handling of the register address decode logic
for the PL08x meant that we were incorrectly treating
accesses to the DMA channel registers (DMACCxSrcAddr,
DMACCxDestaddr, DMACCxLLI, DMACCxControl, DMACCxConfiguration)
as bad offsets. Fix this long-standing bug.

Fixes: https://bugs.launchpad.net/qemu/+bug/1637974
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This has been around for a long time, identified by code
inspection several years ago in the LP bug. Now I have
some guest code that actually tries to use the PL08x I
can test the fix...
---
 hw/dma/pl080.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index a7aacad74f0..8f92550392b 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -229,7 +229,7 @@ static uint64_t pl080_read(void *opaque, hwaddr offset,
         i = (offset & 0xe0) >> 5;
         if (i >= s->nchannels)
             goto bad_offset;
-        switch (offset >> 2) {
+        switch ((offset >> 2) & 7) {
         case 0: /* SrcAddr */
             return s->chan[i].src;
         case 1: /* DestAddr */
@@ -290,7 +290,7 @@ static void pl080_write(void *opaque, hwaddr offset,
         i = (offset & 0xe0) >> 5;
         if (i >= s->nchannels)
             goto bad_offset;
-        switch (offset >> 2) {
+        switch ((offset >> 2) & 7) {
         case 0: /* SrcAddr */
             s->chan[i].src = value;
             break;
@@ -308,6 +308,7 @@ static void pl080_write(void *opaque, hwaddr offset,
             pl080_run(s);
             break;
         }
+        return;
     }
     switch (offset >> 2) {
     case 2: /* IntTCClear */
-- 
2.17.1

