Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1305718wrt;
        Wed, 17 Oct 2018 14:40:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63sdZRw6P23IRRGo03iHTkPVr7IqIUhFgPGgbhxLiZ5qhxBfOeUW0O4tnF/PfKdbNNYvLjJ
X-Received: by 2002:aed:3fb9:: with SMTP id s54-v6mr25948024qth.208.1539812445570;
        Wed, 17 Oct 2018 14:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539812445; cv=none;
        d=google.com; s=arc-20160816;
        b=qNBNS5GaxVqxflYsSzTvtqQqVRBSMYxYsaGPgSau4pQnUGG1Me6Ute+ZtejUe4trCp
         mvJslRTwHX7DXdzKMjuKf4FvLCiDCWS6i8MpTnAwVHzZv+qP9gTJ/k4kdu5PLHIYf0lu
         p+cCP1ld84skDSO93J4n1or9sbRpdBjkcP3drPnBEbbvINfXDEG33qx4M/AV/XWDd4Rw
         3CNKJNRMfXTqTXxyBVj2JLnHk8sw1LTAT2J+ATBBWr83XsPPbcEaVUmAiXu/xjYEvJm+
         7q+oLl8UP1UuEsl+mqFyPi15DiY161REG2IiVsqBfCfKmyQxKTSkZvdx42HR5/4IwfoQ
         Omfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=79QZA3/OtgWAsXd13kSpsXnd0tZupP5LpmVb185dkXc=;
        b=I8zyCM9QUyL2VBwPus4NQxoqpF38wI/VF/zV8cdd6catgX2RPQ1qVVTuw66/CGVnmV
         ZDSgNvio7GMvUtoH/eQb0wsFzXLxeA43cO9Zo6DbVdk44JV9+ICYHvr19U90OdQiTRKI
         h8DNxF0WbXcbhfcootqIWn1rCsqNtp8VvuILUZ1HVofO1vA3UlSvdnK5oZ4xTptvr7R4
         XUviwoUQeR2wbkz1j2DNdvjitsTbxrTooQyGWG+yr0eNsF3fRUYBCLSuvD1diNeTM5bb
         KaHeRKR2UcxMF1XCJR7gKSkmMMc4gr8P7SNofq3iAoMtzCsqVOgBRZH64X+CXUb3+M3C
         CgMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kuTozL6B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68-v6si7417314qki.208.2018.10.17.14.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 14:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kuTozL6B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCtYa-0007Hu-UR
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 17:40:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gCtXg-0007FQ-6p
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gCtXc-0007vm-3a
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:39:46 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:32889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gCtXW-0007su-N2; Wed, 17 Oct 2018 17:39:40 -0400
Received: by mail-lj1-x243.google.com with SMTP id z21-v6so25776744ljz.0;
	Wed, 17 Oct 2018 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=79QZA3/OtgWAsXd13kSpsXnd0tZupP5LpmVb185dkXc=;
	b=kuTozL6BTXxhh6kEfzhTV9vOVeBF9foXSlLE21iy9jHm9Zn9Ae2oGeALvyEW2GMpu4
	CSYodaO1O5Ehk1qKvl6A5iYobrol3GAMRw98doBlxrc4HELhV2Gqr2OgPb96BB6Zlrvs
	6bI3KeHA7MmMSDF64zdhY8MMcpTXAhDNdcy/9fwFfAS8hq2BEFL3Lz7Qb3HjFs6RJ66t
	vGvt20fbIqMfaMBwK1gWSEIt06jo+/twL9B4+U4i5qffnge6xKCTvzMpxEQzIJmuM5/Z
	cZr+765veGGg1KyqaEsS6OjFEFdydUaiLOUHPKgKcqMkWkziFFi+Uk6JC/AfI+wiibuj
	qq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=79QZA3/OtgWAsXd13kSpsXnd0tZupP5LpmVb185dkXc=;
	b=URu1GsGs2d3xBTPqz4F5lozmRGWI2kQjcncbyJBEsB6JvQy543l7FzzN/GgZJ267tC
	oSRr0G+rfxU/UUMo96LLraWCmG64HUlLUyk9nj/tDpC4/bkSPMAD6UvAa9xuhpV1DQMe
	2+76M5iI1aAIkAm26Tk6sBrrwKv/eyV0hjlafCJF6cHDp6cNv+Ss+cW7LRbTbYTRgOcp
	XAfBQWo1jUayjSP5P8xTVeJf4nrd6U5lHrcIWjKVnfr5a9uKrZiKZkf2hSF0L+9U7nRi
	k6SNZSf0oC89qHq1M5NiXp5EYBJjg+tRae7dhkzez5Brx3i9nKfwT+bLnimx6m1BAv8C
	CYDg==
X-Gm-Message-State: ABuFfoi+sihNYl54KLkx2oFrr4z6SggWkAY1ZwvKHwWYnQ4LirtMPSfd
	iBnrQd9Zl41++HJ4KHizcvqBmpjd
X-Received: by 2002:a2e:8090:: with SMTP id
	i16-v6mr17558443ljg.168.1539812376814; 
	Wed, 17 Oct 2018 14:39:36 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	f95-v6sm4432072lji.76.2018.10.17.14.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 14:39:35 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Oct 2018 23:39:29 +0200
Message-Id: <20181017213932.19973-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181017213932.19973-1-edgar.iglesias@gmail.com>
References: <20181017213932.19973-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-devel] [PATCH v3 1/4] net: cadence_gem: Announce availability
 of priority queues
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E9TBiKyuUfVp

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Announce the availability of the various priority queues.
This fixes an issue where guest kernels would miss to
configure secondary queues due to inproper feature bits.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 1795998928..16a8455128 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1283,6 +1283,7 @@ static void gem_reset(DeviceState *d)
     int i;
     CadenceGEMState *s = CADENCE_GEM(d);
     const uint8_t *a;
+    uint32_t queues_mask = 0;
 
     DB_PRINT("\n");
 
@@ -1299,7 +1300,12 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
     s->regs[GEM_DESCONF5] = 0x002f2045;
-    s->regs[GEM_DESCONF6] = 0x00000200;
+    s->regs[GEM_DESCONF6] = 0x0;
+
+    if (s->num_priority_queues > 1) {
+        queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
+        s->regs[GEM_DESCONF6] |= queues_mask;
+    }
 
     /* Set MAC address */
     a = &s->conf.macaddr.a[0];
-- 
2.17.1

