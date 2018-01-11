Received: by 10.28.173.206 with SMTP id w197csp1021445wme;
        Thu, 11 Jan 2018 13:11:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBovHFBsU+aRgnQJnL2NeUkO2dminCB6K4szWb/v0HlIeJhbHlYuSQhxNbL2wOJ81R3IAYNHr
X-Received: by 10.13.215.209 with SMTP id z200mr21403909ywd.173.1515705103793;
        Thu, 11 Jan 2018 13:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515705103; cv=none;
        d=google.com; s=arc-20160816;
        b=v1F+gJijtjhlpTjOOnAkaTTHGqxOoz+zi9/ljlAY/0GxoIT1MpJTfkbdZQewbyBehl
         MF+ZbuWA68mPAIQStTL9ZO4lulpde+yZ436w210qvUN3i6TBVTzUME62k8bq8xzn5tZX
         U6lhqY88flnzVu5g5mrXF7tjhKzC0O/y4YWKixrsBboYF9xmSgjGCrET+VmOZaSAw9VL
         Qrf6VlM/IeZKdxdxkYa/ygrgoArR4dVkXA919trb4bBdVSk0zoywM+qKOzF0aOsQRfGF
         o+NLP7ih2eDQ4ncnpBCr9vsvzzjS05fLQE4aza7iu/nb815pI/2W5usKk5KkkO5UrluF
         V3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KQrViy50QXDxjlnhfpalenR8QfcVDv9s6SuPgHUObj4=;
        b=nCnZxIKX+DVCvB6wglfaNajxslSBtE8N7EW2YrqonbnL/wRBxrZpLUU/Hy3qgANwFm
         9v2xDcdVDsWtMxIkv1PORCUSAA7Mhgn+O6glr+4vWqfm0Prqhv6mP+G4RWYGfgAmo+iN
         gLAtYPILvBw5XzcvgVbDrbTVfax/4azwo1/0XKTRe32XBJoGYhiX9DK8AZNxcN3sk2Zg
         n0b/kBhdtn+PV0plyGOBLaUMQeovtn+PHG2HqN/wrd1yhd0tGEnT3QU7QCadeqhD+lRj
         xMfEzC4Sdzg+8B04NHofkTY9GRR0mqJWrM0MzDEknacA9aReSF+f13O2JqX6xF+cA74i
         Zcrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uXS2+m1q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9si1686256ybm.321.2018.01.11.13.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uXS2+m1q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk8V-0001Sk-4w
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:11:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvM-0006kI-PE
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:58:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvK-00038A-F0
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:58:08 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33645)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvK-00037x-BB; Thu, 11 Jan 2018 15:58:06 -0500
Received: by mail-qk0-x242.google.com with SMTP id i141so6127226qke.0;
	Thu, 11 Jan 2018 12:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KQrViy50QXDxjlnhfpalenR8QfcVDv9s6SuPgHUObj4=;
	b=uXS2+m1qQccrDmc++iSNjqkXD/fn07vzvfBPlO9x3z+iq97KRwATAkcKDXx4TArTUi
	K0W4edpf+DeQZJnP5A3S705/7QUOValNHZmgUsB6qi6FKdJD60TLCkxp+6MM5diK0Swd
	kX6TBClmOjyiDf+1VA+Ck367+uNkAzjju96JelXzI4NDYOUgJVSKW5xP2QkdYXkULcWk
	59wQkCjeZUs96jlFTJ/5Kw5HlELrSW9vLwLPT2pn1g9K4CVF+6EjN0NRO57EzjlNhIZJ
	7og/rKnxL5BPFhWqEaZwnL4UEHQH32uz+06ZgnBrbupE7FOdBDnX01GF+ZitFZ684Nks
	bdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KQrViy50QXDxjlnhfpalenR8QfcVDv9s6SuPgHUObj4=;
	b=nqkc+E0MBNhfNZ/49Vr6b82i4KgHGO2hg6WrST2hoxAYAeZwer0JdDZWAyqhiy10TP
	KnznFwzac44XkAnD5OPN42qGE6qeqqYr3ecNpqi3275AqKrneMtuFx2PxgeO7ZsXQ0dg
	j0VPerc1nEDnCxsb12Ne+wfkA+2e0IlsflKWuYKGQKh0o1ZSSW53NI0KAZ+YNX494UPU
	mzFAspkUIlCmZclVQ73NwMtge/O/m5BttzdM+g8u8VUpAii0F2Hbxy0CqjvOUALI19T/
	c+2F/QwwFhRoDzZP5qufBA3LSEtFE8pLygOUCidrnID8JUzS2Fddpd18FPU6BYoVgzm8
	zPZQ==
X-Gm-Message-State: AKwxytcM/Na03wU9k16CYtlj0XHJlIfBS0LKd3bizYg1kFblvSGBMhzF
	pDeINXk3/lr5r1x1g63msE4=
X-Received: by 10.55.112.199 with SMTP id l190mr32974381qkc.342.1515704285807; 
	Thu, 11 Jan 2018 12:58:05 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.58.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:58:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:21 -0300
Message-Id: <20180111205626.23291-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v6 16/21] sdhci: remove the deprecated
 'capareg' property
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
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7EGZp0L37+95

All SDHCI consumers have been upgraded to set correct properties.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 6593f5d8b5..8e4805c84e 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1190,9 +1190,7 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
     }
     s->version = (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
 
-    if (s->capareg == UINT64_MAX) {
-        sdhci_init_capareg(s, errp);
-    }
+    sdhci_init_capareg(s, errp);
 }
 
 static void sdhci_initfn(SDHCIState *s)
@@ -1338,9 +1336,6 @@ static Property sdhci_properties[] = {
     DEFINE_PROP_UINT8("bus-speed", SDHCIState, cap.sdr, 0),
     DEFINE_PROP_UINT8("driver-strength", SDHCIState, cap.strength, 0),
 
-    /* capareg: deprecated */
-    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
-
     DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
                      false),
-- 
2.15.1

