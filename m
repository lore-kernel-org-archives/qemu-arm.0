Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2978743wrg;
        Fri, 24 May 2019 05:43:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoBzqhmCv/fxfnolqccT7frMryH8CYTMlW5x2SWEDWQwaFbw6GBU7/7hQXzb5kaxZmip7Z
X-Received: by 2002:a17:907:20ed:: with SMTP id rh13mr63206520ejb.5.1558701786436;
        Fri, 24 May 2019 05:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558701786; cv=none;
        d=google.com; s=arc-20160816;
        b=HibpdnTmTNz7U1pG2p67OO+8LQqlCetgjLLv6Otl47zurMd+LOKUEETY19pQsy+5Mc
         UsNComYSeZYdpO+JuNlVgtAA4C371MxMMw3rv9dSYXya/CXn8GlEAoSJCUumSZ3D4FrF
         XJYTg2AEwZUaD+LUUEZ6JJJ9PtTVdbEnP+t0/nEQJIxhVQOQcRkcjxfksJV1Wj0SpVob
         0P+/Rc46lOF+NYVgBBZjj5+34q4eUlWTLlh9XdphVBpGecszylimojMAcHuLGYaT2QcM
         nmizOSaHoj5xbqyuxkYsCmg1NJa3oxUu+aZ8Ta8TBLbrh78XEf4YsytsiJL0EpG9YwNk
         yhYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=Wpm2sQhYIfIk/OCN8Lhc9DkJO4UyQ5qxNO30ipqpQyo=;
        b=MqU+kCNbYISzprzvlvgMzWrxujI/UJ29OUjjGVwGUh8JFOZyVylE4sLRqtv0X64oYn
         4OPDtCM5I+jkkYs+qHAsJwyE+OGmmIZ65jlimXWGbTKfqWDVbHfZDZJvN8JHNQueaWkG
         EQNuITH+V+scHSaFX0iXNpBWZG1BhQHFOmzjB8UB28PcF09KBjm7VwMnJkOBPtEqJ+2A
         4g/Ax4u8fi3CO7LXndJcwhxf2ZF6ioF39GYbufJ7Y183mA8IsZ68Fgcf6LfS285bLYbX
         OdvmQkk2ym8anMbSDotJGnLLOyNovy5TYBdy0ljGkal+FWA09AMx0MypH1k8ZUJrXxp/
         /G0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lv+acOeY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y36si1793572edc.165.2019.05.24.05.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 05:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lv+acOeY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hU9XN-0007IQ-CV
	for alex.bennee@linaro.org; Fri, 24 May 2019 08:43:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9XB-0007IB-II
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9XA-0006Ks-Lv
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51612)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hU9XA-0006KI-Eb
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f10so1816619wmb.1
	for <qemu-arm@nongnu.org>; Fri, 24 May 2019 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Wpm2sQhYIfIk/OCN8Lhc9DkJO4UyQ5qxNO30ipqpQyo=;
	b=Lv+acOeYB2G5acMbaEj56suh5rss25PSFHiGKuFycUP4OxIiTUhTj5JJ1vIKO+Uyef
	wmaQgpNPs41mDcFQKh7Ydblf1lmiYsvcF5oRUFVqKpmM+1iR6O0ZTkH+2biGE8a0K2n+
	1z2mDn9IF9X77fTPy/kVuPZn+wcKnWeJISDnuDL8WajPgwHPhXuEFDTzD2dnqU+l2hMj
	Z9uedALieSl9FvZZd9j6LUwXjVsr9lAMu4HxUlsijTn+scWsqIO3VGrIvdloHbmKVw7t
	CwEOAMMp6fAriWDGbqRJ7NqNBkcfbSdZZvMkZRzbQOcgBm11x6NvIfh1vkX8uayMo3xo
	XGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Wpm2sQhYIfIk/OCN8Lhc9DkJO4UyQ5qxNO30ipqpQyo=;
	b=lbMj4OBq84tPwH/+8jb8HYi5f0Fx0Rvwx9YBQvpm0eAElCVe34xMgOwC8oIEUfyBKh
	PekMFOGLVsXn8oMRPqSrb3eChN/Omd1+YsVqLC4ykUgMdV7F/gX29kgSMq79h3pkpeup
	sX6Vq/1zHaVHAjIrNdrZ3oD65gsq+VssRAV9NGI2teQ3pZ3HWnDVPUftRBUZQJVmXmYX
	IvJ3nmHAKfF6OloUGn9jcfDHL2vYtngzHMJmAn5DfLjH21JuG8nBCHjofzysOqJYX+Ps
	aIHZCarhNa6PQbqnE5eeP3EU/rqFrs1pPb6oDWYcyV7kzmsvPBtA/83YtJT4Io4Norao
	ikXA==
X-Gm-Message-State: APjAAAUwL9VkpsEM40rVTCWAKO+eCXAjat59j/nrkwO/domTwRzpk9y0
	yWMqH2BZemRLyjzXOz7/84u76Pt6xrlV9g==
X-Received: by 2002:a05:600c:21c1:: with SMTP id
	x1mr16146269wmj.5.1558701771017; 
	Fri, 24 May 2019 05:42:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id t12sm2969854wro.2.2019.05.24.05.42.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 05:42:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 May 2019 13:42:46 +0100
Message-Id: <20190524124248.28394-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32a
Subject: [Qemu-arm] [PATCH v2 0/2] hw/intc/arm_gicv3: Some simple bugfixes
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xQePj7nPbell

This patchset fixes a couple of simple bugs in our GICv3
implementation.

Changes since v1:
 * patches 3 and 4 from the old patchset are now in master
 * patch 1 now covers both the read and write functions

I've also just noticed (via grep for IDREGS) that we made
the same decode mistake in the SMMUv3. I'll send that out
as a separate patch.

thanks
-- PMM


Peter Maydell (2):
  hw/intc/arm_gicv3: Fix decoding of ID register range
  hw/intc/arm_gicv3: GICD_TYPER.SecurityExtn is RAZ if GICD_CTLR.DS == 1

 hw/intc/arm_gicv3_dist.c   | 12 +++++++++---
 hw/intc/arm_gicv3_redist.c |  4 ++--
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.20.1

