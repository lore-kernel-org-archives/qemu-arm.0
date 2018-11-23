Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2060569wrt;
        Fri, 23 Nov 2018 05:55:33 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VxsZrJ4b85SAc1o3DUe22w3UX2DIQzD9okrH0IyZoa3MpX1Y97yKWJ3TUlFSNw5NK7x6yi
X-Received: by 2002:a25:952:: with SMTP id u18-v6mr15993126ybm.464.1542981333676;
        Fri, 23 Nov 2018 05:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542981333; cv=none;
        d=google.com; s=arc-20160816;
        b=WhoZEEdV01SeJPx0u/SNrdB7HMl/d5Wx8PQpBqr2xZ/1szHOJ0hUTcJ16xpq98I3Og
         QZu4CKJrsEKMhOF67sSMlssswXrXl98jNg68+ayvvH8LNMb0cIAMIiMh2z6FEhJjM87z
         i8geYzVZf0ZzvgTUKysxh0/9RUm0REFk+SooEZeP2gD4guxZJz3Ua81erWmGcf2NHXKn
         BKfNdlAPjS9TqEoozB4Veh1bnnlBynC0MD7iS3+vT/MDEhFx3QtaFQOPsrs9jjny1DuW
         mfm6KPO/lTFy5tCtXgV7l2QnyBib+FeyQXqme7fea/BnfMEHav5xvcCt/hybKGlXem4q
         Tv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=5rBzU99sTDhXLym0PVw34EWlgg8w487vwR92ZnMscJU=;
        b=Yw3WcvREt7MD6jQuBqc73IoQDjlfYAGVhTh39R6rhwW2327pHs8WHGmRDixItMSuC5
         sbtmiHOzTsqwSSDwIcZlSNtusC3PyVAUnxZIPaS29zXRDgwS7Hl4kvoxhEZRQYqzhNcs
         YyxKGaa+sRz4gQzUDcfG+bANJ/6mtxaB71AqiDBI+qGGW4MDGORoSuC+fGOpvs7HsAbA
         yi7DaUxRyWNajzARC9danBVfDYPGcSaIreXe5jTlku7bVByYPfU4mzVZPNZ0wzHOoZ7r
         k7f2UIQhZ/ArLUgscO3ByRdKO7M8dGITiFrdew/ViesHu/lkydB2rJkypwTevkoF4drY
         CO9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="pS/GkbTx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u206-v6si16615250ybb.341.2018.11.23.05.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 05:55:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="pS/GkbTx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQBvh-0006si-5M
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 08:55:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQBv9-0006sN-Jt
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 08:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQBv4-0002Lj-2n
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 08:54:59 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:38215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gQBv3-0002KK-S9; Fri, 23 Nov 2018 08:54:54 -0500
Received: by mail-lj1-x22f.google.com with SMTP id c19-v6so10743564lja.5;
	Fri, 23 Nov 2018 05:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5rBzU99sTDhXLym0PVw34EWlgg8w487vwR92ZnMscJU=;
	b=pS/GkbTxryqzacc/nHrnr7lL+chZ8QThCPwIRyAkYX03RZP35oPGb5/Q/ChDCNsYxI
	M75HQAStJimgD17Ah3STFFl6VqS5sDk268rHsNn1xenqL4NRy/pBmjMBOW2IWFthwv12
	pyhz/PfBpL2fJJ0l4k/fKTsObjrafS/D7OSgg+FzbVdDyoJ9h7CxT37kW6gyUcmIZ2ob
	/hnxwbFCQcqdThcUEba5zOiRTCYtdw8KaRf//cYklZ64KMvqmurjrzdPz+8wBg4tHA4Z
	OQ66C6s4KYrjt+sUsIgP6NyWwV4VypI/uSCoI+IcsRbTWKm9uopPmW2P1a0pRT0mS0eR
	eZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5rBzU99sTDhXLym0PVw34EWlgg8w487vwR92ZnMscJU=;
	b=IEAJLaHudURsUfdtYEOUlPlq5bplJwq0BnglUN7Mbg+sCQuXLL78+m1NL8oZg7WDST
	gnjTWYzOT/6AXiYPC2KMeRKU+lFqNAjMYRPPWavM7OQ5Zl7SPrrhBcZaW38OklAkW8BG
	+lHka8PA2k/80gF3MUIKBlk6vN4kZAvwirbFiksQMzy/z2SJcjGAAH/BzP0jEmlzQYZh
	lEWQesp4EkO/cjPG8rG5IwvBYEd+VzvU+SyF/N+THmRkiRlIm2YJc34NKTlIjcRRtfFX
	8U8xNmFPDz+qM14UTohvyfCygzvMsjFRp1D8NNoWMAJ3OIejS3KC8hzN9GhD7crW7jSc
	86EA==
X-Gm-Message-State: AA+aEWZ+pz6F1wkZGXfCN5z74B0WbOMTiZY2MW58IdH9Pam8wCjt2mBc
	nWPSx8GtcQYKb812chLhAYkuqE+8
X-Received: by 2002:a2e:4745:: with SMTP id
	u66-v6mr9544382lja.37.1542981292180; 
	Fri, 23 Nov 2018 05:54:52 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	z7-v6sm3897789lji.42.2018.11.23.05.54.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 05:54:51 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 23 Nov 2018 14:54:49 +0100
Message-Id: <20181123135450.24829-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::22f
Subject: [Qemu-devel] [PATCH v1 0/1] net: cadence_gem: Remove incorrect
 assert()
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
	frederic.konrad@adacore.com, muhammad_bilal@mentor.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nmMI7JBR4fLx

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This fixes an issue with the GEM models reported by Bilal.
If a GEM's receiver is disabled, we shouldn't be asserting on
descriptor processing.

Cheers,
Edgar

Edgar E. Iglesias (1):
  net: cadence_gem: Remove incorrect assert()

 hw/net/cadence_gem.c | 1 -
 1 file changed, 1 deletion(-)

-- 
2.17.1

