Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2060271wrt;
        Fri, 23 Nov 2018 05:55:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Whc94LhDV2MRhHOt0qKEzaGhg4Q15WXKja6Loskg7ZlgltT5azbF4mISoenxsR020G457L
X-Received: by 2002:a25:8b88:: with SMTP id j8-v6mr15567085ybl.308.1542981316284;
        Fri, 23 Nov 2018 05:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542981316; cv=none;
        d=google.com; s=arc-20160816;
        b=pU9gNtw9m2VKJ5LxQKXO4X4KIfytx3MHrG63L5vyA7YI4hOXVLl88hIcy84cMrvt/d
         b115f3cA1mZr3Cva9ua1T6eJuaA/7Gzu9+3YTXAKKo5T5KZX6CD6ul7UAKGz4G/z1YTP
         +cqabYHwH/767cSkruy65z6f8mJO8aiukgu6BKke9Hjrzd00eWD+sJG+i2x8anD6qQ7Z
         MuY/ze8GhPwrMMB6t3+wcw6gBWojFC2masOP4urnvaYZSLjdQi0izsB6ukVOJ4GJIFpR
         MH5SHcegE4Rjc8iSAYnIektVu5UW+ED8i5GooEPfuSqwnXpStbW/z52PEgqmYKssJMIN
         8uXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fTICeks9SOeth8pci7UiwXWCYMXIXcwIuwXFxU82GuQ=;
        b=cBFu5AeMz1PRnl+5y/pQeEzCzKmqOwgL2it+aFsp8LWTZ3PVhr2l7RKfA76p+V8DJT
         S/q12MX5XK3Z1Ii3tGg+3xx1Guw4wrByLZVN2zanGm7DQ/1iqDirXLL/CXVjYGbnBK0E
         W05hssqAn465sEeRWeThGe/b7ED4qJ3GwCUfAB6EiEkzmXfQsQ50+vn5ETNUkuxVTnnW
         EIBPkaL7at6N52BOgr4XC8R1VZY1WG4WT1YB7vJnbRR0HVTNbR/SkDMbIpxk/ORAd+QV
         Txt7Y+0pC9N4z8Ji8UpUBMT1U5IgTQXN/XD2DK0ollLvnzO5MowloHZOFiuTCdGyor7P
         BeWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tuLDEj9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2-v6si33693146ywb.385.2018.11.23.05.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 05:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tuLDEj9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQBvP-0006tj-Jo
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 08:55:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQBvB-0006sZ-3r
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 08:55:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQBvA-0002Zq-EN
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 08:55:01 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:37215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gQBv5-0002NI-Je; Fri, 23 Nov 2018 08:54:55 -0500
Received: by mail-lj1-x244.google.com with SMTP id e5-v6so10745091lja.4;
	Fri, 23 Nov 2018 05:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fTICeks9SOeth8pci7UiwXWCYMXIXcwIuwXFxU82GuQ=;
	b=tuLDEj9RqaFEyHCwR1i9eeAl9er2QSATunJGfuzmAyrwh3MTGOoJlBkPwBXjQOUR/f
	/NXSVq1Uh0yAiv0uaNrTnZPfsRz0Gy+gmtloski8Oex6tNzsmrXnq94an2M6I4DNfY5G
	Y6dF+BK+tSqE16RsufwjJQqqsxb7SeeyQkpGFAjPTFIAmt1/4eDgbkYqtpruyjQ7bNsa
	wEfZXPGlg3d9JRt9CVi/37P8fpoVsfeFAoVHJz6xe28w5KMA0FKIt+FIY+Jl0d3/0qFT
	kg4hnrJh8lu0XlemL6ddZ5tbkXjB9RwGxnw9FZ40b2uCyQspJq47V6ltA+uyadRT69LB
	BQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fTICeks9SOeth8pci7UiwXWCYMXIXcwIuwXFxU82GuQ=;
	b=XpVF89ZzWOxofOzN3tKQUkg9pfI9pg2v6edmxnL1TckCkGTnoUeypfZ0XpTDmbvH3W
	B/Uw9nO7zfhwwBv/nIIvgYUOau8qy3IEzncQp4Tft2FZID8re7SP7HJcFu5azh2ZmisR
	ZgfRcuJYeUPrBNEbcAV545a0Z2egbZNPwnhbGIdIqwk+8qyVo21sp9WZYEsXhLpYSMIz
	3/son1XpcIQlE6xwFD6tmOKBOK/9l/HCQlNaXYa+STWUj6BDboarNTB/cY4dLoTBzx7+
	31tNj5DKLAuvE7WwvGnyvoeMy2z58kDJBXDJG/ZTmo+ejdj6Lh9i8um2EH189+xOdpGG
	WpOw==
X-Gm-Message-State: AGRZ1gLkGhInNvZZfKusibrxQ0v8eeTAAGJJEpLApDgwv/s2BhK1CZ00
	d8phSrxGorAH4UHvYxWSy3p+bufq
X-Received: by 2002:a2e:9181:: with SMTP id f1-v6mr9841322ljg.64.1542981293745;
	Fri, 23 Nov 2018 05:54:53 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id m77sm6207855lfg.3.2018.11.23.05.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 05:54:52 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 23 Nov 2018 14:54:50 +0100
Message-Id: <20181123135450.24829-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181123135450.24829-1-edgar.iglesias@gmail.com>
References: <20181123135450.24829-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: [Qemu-arm] [PATCH v1 1/1] net: cadence_gem: Remove incorrect
 assert()
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, muhammad_bilal@mentor.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aK1fwvfwIBSg

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Don't assert on RX descriptor settings when the receiver is
disabled. This fixes an issue with incoming packets on an
unused GEM.

Reported-by: mbilal <muhammad_bilal@mentor.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index d95cc27f58..7f63411430 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -979,7 +979,6 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 
         /* Do nothing if receive is not enabled. */
         if (!gem_can_receive(nc)) {
-            assert(!first_desc);
             return -1;
         }
 
-- 
2.17.1

