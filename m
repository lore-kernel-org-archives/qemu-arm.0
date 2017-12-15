Received: by 10.223.159.74 with SMTP id f10csp7093025wrg;
        Thu, 14 Dec 2017 19:20:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBouwhdJ0QjSTPoay9Bdd7GLvAYQLp2wgitTAWWLqOo19EERaHFhALd6/VbBFEsdWWjOpWOQK
X-Received: by 10.129.62.36 with SMTP id l36mr5962087ywa.158.1513308024507;
        Thu, 14 Dec 2017 19:20:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308024; cv=none;
        d=google.com; s=arc-20160816;
        b=aFC+K+e0XdJQrA5apWLrSKmXVlCrsmSXJtGs2bZfVTylcMm0biZh2G1MHR3njtQj1j
         dPB9/Q2JG1R08YL+1hQG5jDh5B896tXBA6MIcgai2pap6Rt7pEN+ozCvqJTwZsUCNbag
         BWHI81OlP4C8eK/5qLqg0xUwf/IDyZJicu3rCu0Hydc17+p2oRR5Bwh8xKPN/3BiBVWb
         fY/mhUTEKeDU49Sg19yq/YToeSDQW3bX8bjeqpn53wOC6+wUiNcf8P2TlC+z9ddjKxjZ
         ewnm9B1tCToqbk76fnulVHrt2OxnQqc7veR1iL0S5h0zo8ij4nNdYV6F+zTm656KQWJv
         P0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cUSSu3Rj98aRB6QbKpeuT03zqU/X3iAO05SFJixMsx0=;
        b=GaCuNtREKdlVx/g7dZv5KRuoPNeUYTQIvtVBTxxre9Om6QWkMtSMQssf8hMz96kbjw
         qmtyix3+6v6T0UQeuUwgclROBeDfA5wvba5mUNjewJCK8M1z+ftgC6q22VcGS7er2MUv
         IfkDGGzdCrwNJyIitHFsEyBKomTnbZvL/U/A0kHQIt+QsuZXnTM7qQLubwzlgxxXjUkI
         WGmcxSvfNnAswqBDdWCKwAi1KiydGvSWjpIkEeYYc7TjJIgUZ7mgpQezRs73YYTOHKul
         48rlPp62eqOIn0NwAl9Lnp5Tk7eJKO+ofSHogQOP9jhnIn/kZgIYjs9PfFID6+hieOnY
         8uyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g90j3cSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8si1071573ybl.385.2017.12.14.19.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:20:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g90j3cSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgXv-0000VL-Rs
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:20:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUN-0005v9-T6
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUM-0001DL-Uz
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:43 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:42396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUI-00017t-MJ; Thu, 14 Dec 2017 22:16:38 -0500
Received: by mail-qk0-x244.google.com with SMTP id a193so131785qkc.9;
	Thu, 14 Dec 2017 19:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cUSSu3Rj98aRB6QbKpeuT03zqU/X3iAO05SFJixMsx0=;
	b=g90j3cSLzniaGdwNfgoIHxrchQI0Hiig7U6ix8RJ1Mg2HDwZK134U7PMKCnQpRMdxz
	bGAm1oi3xpveKnhAs9JjN+A6brS3Gjf1m1Tg3aE8dyGCVSRvSie5tdh2vC0G+2SSt6BF
	W25JA+85ZZYHoJmRP3enJqfJxx5lVTScBZtdivUUYNuWH4t1LVQvEWahYf6r8YhjDYlR
	HF1OaFhPOjrtv02h58pl+w0RUB11eDuQTRAc4RZf6ry+hilH2tKIyqL0DXwH+h7ovqfR
	pmWPb54q7quAouT0Vy6WppQ/fl1BjYBTa3t5JB7nk56ednfGruPcJJ9dSyYzcxiiD1dQ
	qM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cUSSu3Rj98aRB6QbKpeuT03zqU/X3iAO05SFJixMsx0=;
	b=JkG2DUfAWIe4ofoyftcGZhDq3/RcKvvb80/zqrW5BpmP2iDLBe5s4xS2VOJNCrwdeS
	8g9voWzjDEkHN3U9+Ha/WDLRPLyLjrp3C4PZ+jHLcYzk51RE39ThrBAHJBtxUgF1f1aU
	wvyCxNQnLD0wUy71Bx+tqak0TnwbWCT7TxwGYUfOTmA6qxHBbe/3CaJtGPXJyPO8yTdi
	2et2vBnn6/gWwxgE53MpFIFjdcIMM+hYjLsYhs4+fx/gAy7/3oEkGuT41D35u0o6VTHE
	BynUc2WFEMv2Nw2opMteVhs5dzf42kUGUAyskx7sfZPIII6Cg7OfOGYSulFbcZo5I1Ay
	PLJA==
X-Gm-Message-State: AKGB3mJheCQhJy0sPJqSLmE6bVZ8g7oTiX5Knd8AnhrsMXh1ki0Tt8zi
	/wzbyJigudI8cFJvbf811gI=
X-Received: by 10.55.166.81 with SMTP id p78mr19355359qke.191.1513307798179;
	Thu, 14 Dec 2017 19:16:38 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:35 -0300
Message-Id: <20171215031547.31006-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v2 08/20] sdhci: use qemu_log_mask(UNIMP) instead
 of fprintf()
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: upLsoICf6hGG

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 53c1f11855..ca71a70148 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -945,7 +945,8 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = (SD_HOST_SPECv2_VERS << 16) | sdhci_slotint(s);
         break;
     default:
-        ERRPRINT("bad %ub read: addr[0x%04x]\n", size, (int)offset);
+        qemu_log_mask(LOG_UNIMP, "SDHC rd_%ub @0x%02" HWADDR_PRIx " "
+                      "not implemented\n", size, offset);
         break;
     }
 
@@ -1149,8 +1150,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         sdhci_update_irq(s);
         break;
     default:
-        ERRPRINT("bad %ub write offset: addr[0x%04x] <- %u(0x%x)\n",
-                 size, (int)offset, value >> shift, value >> shift);
+        qemu_log_mask(LOG_UNIMP, "SDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0x%08x "
+                      "not implemented\n", size, offset, value >> shift);
         break;
     }
     DPRINT_L2("write %ub: addr[0x%04x] <- %u(0x%x)\n",
-- 
2.15.1

