Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp919157wrq;
        Wed, 6 Jun 2018 07:50:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK5CXPTv1nHmpSBAZjWOYPq6vKn/sEFXiSrF4Klt2k3u/LFEZVcY1kvnK6sAgbv/cW/Qkun
X-Received: by 2002:ac8:4712:: with SMTP id f18-v6mr2900255qtp.397.1528296647149;
        Wed, 06 Jun 2018 07:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528296647; cv=none;
        d=google.com; s=arc-20160816;
        b=0mreeEJSCPlTa0oR5m6MTDh2YuuGflA9jpWOlDytLxdO7zVGE998rGxQ4figtilsNO
         E5SnKDN5q/LbNb3awalDWjq+byzBcGppTD3a+RuWBckhsOWZKTdobNcXmsVZCXg9RdxX
         h41e+5d73pEHjq4dBLmTn21pmRKHJSk/9+iEVjXk0k5VTpmqI+chBpIXsMYqpY3u1W4/
         te0oMUiFLg0YvLYVk4Xkm18nws/X/A1h6xVIasmbkaxa4xw/a/CviObJZkyjT7h/4DVD
         b/YW1kPrGeTHBdURcdWAcb+yZhn7W8z3shCGha0HBHhnT8zqwZJKY91bs2vBnnDcCqH9
         cBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=VzM7ulCxdp2/oGjm5mGtYSnkMZ5QqkvVG+bYy3141AY=;
        b=oTaqLacKuegecWWgcQA+UEU0dUhwkmismvRqyYzW1YY6uzQ/JlzUROHMEBrxrUmBaP
         OaTm3r8cXIa2CsrPHqozi2SNEH/M4t0EqfT8xgBPMxi4LBoQnlwKgI9aZxVwTr1JPnpZ
         QiSnLH7D+kQeIcf1jhC2LHzT0AmacSGSq0jZjOmQO6GVNgcPoVxWLizSCGA0IjXfS2RG
         muUSDcg4Nent4canA2JUoRybYh1i4u2gs4anWhOHd5B21GzCMbKOwgN94txdctOVParY
         miutMBnA+hjZm+DtOdbQpqKr1wXxkfdYF5tAirGNT7mj61HfqSKKMuQapkjR84ohT0Ht
         RZ4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MERRes43;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j34-v6si2738696qvc.201.2018.06.06.07.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 07:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MERRes43;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQZlu-0006jy-Ng
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 10:50:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZiY-0004m9-Gk
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 10:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZiV-00018j-Cr
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 10:47:18 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35401)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZiV-00018X-5h; Wed, 06 Jun 2018 10:47:15 -0400
Received: by mail-qt0-x241.google.com with SMTP id s9-v6so6609786qtg.2;
	Wed, 06 Jun 2018 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VzM7ulCxdp2/oGjm5mGtYSnkMZ5QqkvVG+bYy3141AY=;
	b=MERRes43avJKDINr5dm6eQAUm5zL/vIsLtXtLKROc1jQ+sNYKnlctFLU484jOJ39/A
	9d+LkS2BM8v5GsotSCeAx6RV7qHjEXUm1A+mX1L12BRTT9qPcWQYhfxiUY1kYQ7gXPq2
	tItWBkCcV4jExGRauzqr4iwRm1R+ptoT3RvKMSrhu3Rd6gjLOAcKO0AByFBLdj4+OhQp
	cmg2f5EsDqimoisIuSKFk5tIKmHHG3uw9r5FZYNxVdzHUY5Z+cI5rb17ILKN0q8QRwvB
	1Xlg78fjKen9ylL7AxbgD6IPOjzYVhLD3Mz5e1lmjvDz4w3Z078F2G8wDj5X70ig4SmD
	kBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=VzM7ulCxdp2/oGjm5mGtYSnkMZ5QqkvVG+bYy3141AY=;
	b=M6fl74TZB6DdC1Q/az3/oQETM61v04VUvtyzNPbXo+lR9HK3dvWCJ9VZxC/aGU9E0q
	mhyIFhuLrQ6nKhk7G4zQ2Rz6p6Yxgh0TVJN/1Eneqg2mxb72fkWlZAkRsH1GQvgcNV5B
	Wk7we9irZuTRNmG5FBNA7JzY8jEiiYrPl6doT6P5Fhen/xkd26DV2ZyQzFpg+Yj+VFmY
	PRPlMP5adGFUt3qc92nEf2icxH3NrHwuFoqu1N4zYk2S4na6JnaFHAf+hkRqTfXxT+Qo
	pSHZ3B21XEpy3hcgO4PjFUZKUiHJXEVBZY1AmM39D/iYhCJlgzKF3PGJx2x/MtVKyJ4C
	DTVg==
X-Gm-Message-State: APt69E10KS7iOecUgM3rKO3xAcLh97JGDZjlLIdzA3LShjbIg6LqRlu7
	0iQ6Xb8dVsNkAiweZMWn3R8=
X-Received: by 2002:ac8:668c:: with SMTP id d12-v6mr3144305qtp.5.1528296434372;
	Wed, 06 Jun 2018 07:47:14 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	v22-v6sm20060002qtg.46.2018.06.06.07.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 07:47:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Wed,  6 Jun 2018 11:47:06 -0300
Message-Id: <20180606144706.29732-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH] MAINTAINERS: Adopt the Gumstix
 computers-on-module machines
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /06TKfqhHgnS

These COMs are hard to find, and the companie dropped the support
few years ago.

Per the "Gumstix Product Changes, Known Issues, and EOL" pdf:

- Phasing out: PXA270-based Verdex product line
  September 2012

- Phasing out: PXA255-based Basix & Connex
  September 2009

However there are still booting SD card image availables, very
convenient to stress test the QEMU SD card implementation.
Therefore I volunteer to keep an eye on this file, while it
is useful for testing.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41cd3736a9..1825deb762 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -491,9 +491,10 @@ F: include/hw/arm/digic.h
 F: hw/*/digic*
 
 Gumstix
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 L: qemu-devel@nongnu.org
 L: qemu-arm@nongnu.org
-S: Orphan
+S: Odd Fixes
 F: hw/arm/gumstix.c
 
 i.MX31
-- 
2.17.1

