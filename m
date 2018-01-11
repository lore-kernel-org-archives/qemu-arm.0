Received: by 10.28.173.206 with SMTP id w197csp1015034wme;
        Thu, 11 Jan 2018 13:05:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBov/pJutAsTzgzJrJs6F42M9ovcgRK8I9ySmU81gF8RC+2i9aHVNaVCUZl9VgbX2icWJy5eo
X-Received: by 10.37.190.198 with SMTP id k6mr21768931ybm.355.1515704728780;
        Thu, 11 Jan 2018 13:05:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704728; cv=none;
        d=google.com; s=arc-20160816;
        b=J4mtsJ8umU3ML9HXmqSVxLH2+cWFmygeYNhItdsbHABSL/3jAunf93f5L6+D8J8twx
         REC5l3QwdFOQFl9dp4HbD21USvN0XrWK1zFrHXzKv1zmbMgVfPsu2eD9HdfFpw052d1R
         277pGSfUeA92Jh68WUAEp6vv0JolAQagCq9l4ReZo5v5gQ6lJOy5OApFKtDy4IbrsGWw
         qL4jXib+Aj+8aL+vy5my/HWwW7C3OL8alX8Zne06cggp4xJ5q7e+PmtycNe7Z9YPT4mj
         jA8x7ITn34U7q+YWLhOfEdaCppGTEsU+pdUfgqYumJIUKAqB2ZpelfQDvrlFeijzMvFA
         GLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SGgR0OS2pomJ9n9vlY76/WnE2bPd81xUYrJALDxrk1g=;
        b=TUv9UuXRsBKOcIH8sIX1s0E4uflfTLSdCK0yxbUIrioZ9B2EwlLB85jr4vsIZ4Hn+J
         Kt6bWaDD4ur0lmd+BVh5Ah/umvNd9pOvAA+x2wzLV47i696GVuuD6l7xNipbTb4B3wL0
         nvly3Kg5Y/ox+Bm6/8Z3DoMP9z9FvMxcluoLCdYc+Zo3qXThaAXg8Yu2tGrNBOb8Ax0f
         6A41KNrGWIwDn7yjOAv1GzWosa/8SkVAAMoDbQfbbV4kjGsJkCdSqBecJoX+IPGNl1Ob
         +EPRMEOZ7Njv24Mpx8kO4qLhHop49+33MiBHUmIC417HUxhEd+K3Th80EfBdFwFBLqzT
         EkBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ti4sF8Nq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e140si4138040ybh.807.2018.01.11.13.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:05:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ti4sF8Nq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk2S-0003wl-5Z
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:05:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjud-0005hR-4V
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuc-0002WN-Eo
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:23 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:45391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuc-0002Vx-AL; Thu, 11 Jan 2018 15:57:22 -0500
Received: by mail-qt0-x242.google.com with SMTP id g10so3543809qtj.12;
	Thu, 11 Jan 2018 12:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SGgR0OS2pomJ9n9vlY76/WnE2bPd81xUYrJALDxrk1g=;
	b=Ti4sF8NqP5hjl2lCpPEAQNEioeNZVr4evnQjns27eXlEAr0K0cIDys/sX34ZvvQWfq
	BaoVMwBblhHFwebO4M79OQa8eyluit5PYZA7QrT0g5n4iNWKlH/L16UPGASbOrZSZd9/
	8YH+UubIPAA7JqisIiTw2l/Zuiqe83fDFRsNDZTG+rl1oyzUZhxXMsBNKROHcBPAzf2M
	jCc4GeWtaxZV9jzJQ6LtGTleyUpMbpqyOZdweIdmrja9M+6lGLpbI0OJaKCeIupy+Uwb
	Ey89S5JqK5vQC5cqvcrlMPwPzNUFqfGVe+Rk7+3gUVjGfc3+iCcXKJsn2sTw/8iDK1ZG
	WOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=SGgR0OS2pomJ9n9vlY76/WnE2bPd81xUYrJALDxrk1g=;
	b=VLdAMS2pXyGJK/4DQpKy78PrZfFW2AbPKOnXCt5kNafqGZikZ38zj0LIg0rRXOhUYB
	BDs7p++SndyEaNRJTODHCtxdPhnb32Ak3b9lARgrYpnoMuxD+78YwGVwGVoTKQqGyZrH
	8xY/hoJ4XlEN3k4h0y1Pm92P2XhDZW7MTGOxeVlsAjOACv7D/8GCl8HlpukxU7O1awwI
	G/IyQgxAYCAKMEtIiKV658hi15qBucPPNIvgkNDuQat8Dkx1BMiR/XldSqOE8kkzZSrY
	6J1UHL5kjQxEj00aMazczQgsQo78RbIJG+hWRh3/GXt53KBhvH+mZz0P6Q/KwpDtD2C/
	3mqw==
X-Gm-Message-State: AKwxyteUzUPV15g+ZZTK6qRjb/eL4NCZRF4Qn0npIg1NGSTp4Os2uI/r
	fJof3gPwhpMJweRLf212yE0=
X-Received: by 10.237.50.5 with SMTP id y5mr34984784qtd.7.1515704241697;
	Thu, 11 Jan 2018 12:57:21 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:12 -0300
Message-Id: <20180111205626.23291-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v6 07/21] sdhci: Fix 64-bit ADMA2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-devel@nongnu.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KXPVk1eqt37U

From: Sai Pavan Boddu <saipava@xilinx.com>

The 64-bit ADMA address is not converted to the cpu endianes correctly.
This patch fixes the issue and uses a valid mask for the attribute data.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
[AF: Re-write commit message]
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f0a29711f7..ab4ffeca1d 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -617,8 +617,8 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         dscr->length = le16_to_cpu(dscr->length);
         dma_memory_read(&s->dma_as, entry_addr + 4,
                         (uint8_t *)(&dscr->addr), 8);
-        dscr->attr = le64_to_cpu(dscr->attr);
-        dscr->attr &= 0xfffffff8;
+        dscr->addr = le64_to_cpu(dscr->addr);
+        dscr->attr &= (uint8_t) ~0xC0;
         dscr->incr = 12;
         break;
     }
-- 
2.15.1

