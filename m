Received: by 10.28.91.67 with SMTP id p64csp819821wmb;
        Wed, 28 Feb 2018 08:48:42 -0800 (PST)
X-Google-Smtp-Source: AG47ELtYcG92J3fI/OeUU68PY0UrEjFgoBnteL0Jx5GIbZQbc4EDLXtnAZByppvoPluQfwKYeHSJ
X-Received: by 2002:a25:8806:: with SMTP id c6-v6mr3932500ybl.238.1519836522338;
        Wed, 28 Feb 2018 08:48:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519836522; cv=none;
        d=google.com; s=arc-20160816;
        b=GE+z7KsQx+1GACNEpb50F28xyY/bPlMek5sGYnoAZiEJNF/wpth/K+YcRQ2CCupjsg
         l6PchDpL7qJDXAJC9GY5/oZ4gkziJa+GyXOdDnELhJBZAetPjHnZthWkj9E13nzM+cb/
         HpShxdQzhefVWIOz+ZIealyKebk6NREjaneuE+u7WA/ojqnxWtnMgvbx0ZKHH+O23OUi
         P+yxAUHWMLrzseufPt8sND0OmJSYommSlT5NX+AF/04cCGOdmZJd3w8gM49D/Hgf9lYj
         Tg4oDSvSZR4zKD3Q9iz+TGgS/vU1qUrm78Q7heh6pzj+KJ3/XBeFAT2GqBp2SWOLVhy3
         GdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Ikd4yfm9Om4MC+SXJvg6wkAJLhmDC/ivc4uftczw75g=;
        b=SKUQXQoMkX/FcqSlfElh/7LsvsIDUr/87v6EfUAxPc0sp3A1SnPfFbbZ4QUflEsQZF
         E/dbfXLArlTbV84cnI7tAfUwNXHSbCQaF34NKc02SdgnGYy30Qtyjc0ofJfnmxCFNitU
         9SqMBqSJb6ZsdoNaJcqqQChKKRSYzflykkvh5ciG4VMFmP6/HGlgBayTfTGEEWXHaGoC
         24A/jJGjsDAL7NLRBbMLwowhlaNI+7NJzYe/FDtrNrEhI7on6h8vKZmp0bNG9TzXH1bn
         1rId1HJcnmY/OqKr86M2spRG8CuO6keSTgKEcmJFO0GBUtkzgFFFvCZzX+OkAO9OiM9D
         0TTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bnx5MbfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g64si329708ywb.342.2018.02.28.08.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 08:48:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bnx5MbfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er4uH-0000ge-QF
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 11:48:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4u0-0000fm-AR
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4tx-000717-68
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:24 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er4tw-0006zU-V0
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:21 -0500
Received: by mail-pf0-x241.google.com with SMTP id y186so1225465pfb.2
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 08:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Ikd4yfm9Om4MC+SXJvg6wkAJLhmDC/ivc4uftczw75g=;
	b=Bnx5MbfMj+/10mVHdQzljhd7VdP1ba8cVJRaa4/fGr1+Biym9VLooDnoDksKr8gR2i
	DsssWFWQ7+WRI77ge+Ey8/RJhlMBDF4nPbuZVdMW8dv5EVPqcDiZQuvT6cJbCf78TEAs
	u2ebWVhYJebhLi8UOJYerP4ABWRCKqmNlwih8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ikd4yfm9Om4MC+SXJvg6wkAJLhmDC/ivc4uftczw75g=;
	b=kaCWjc0LcEYz4fXLYBIdXETKZUwx3wHqmltEsh/B6NU2r8eN9qBLxjWYLn0DGBaiif
	4AeSxuVTQp1J1Th2Tg1SDKihJ64jduhO7m1J1FZWy3zV/EUoUaHj9+eXjzH71nsG7AN2
	BNVrMO7PUSkv39zXOIelQRUuahajwD2ndubjVksupJ6S+6X6lYIbY8TPSU/L4+k7m8WK
	r8IfbY0kzojBSh21D2yRXFO3If+x9WYCjqYas+0TAOM+JKwiKXV/4rJXuQ7x6bCJSkKZ
	5wA6FkuUeO2oZSmxwQkeKMoTEPTwSona2CsSQn/cm57ZvNoMw1jdxSXLwuUHP9yuLitT
	re7A==
X-Gm-Message-State: APf1xPATmIQbCRszEel/ALjA5D+mL0GubWZ6HwChEX3t++TWgpI0NG+P
	Zupg1M3tMODEJxy2OYvPl+snsg==
X-Received: by 10.99.114.80 with SMTP id c16mr14723720pgn.436.1519836498954;
	Wed, 28 Feb 2018 08:48:18 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id p9sm4123698pgs.89.2018.02.28.08.48.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 08:48:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 08:48:12 -0800
Message-Id: <20180228164816.24110-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [RISU 0/3] ARM additions for v8.1-simd and v8.3-compnum
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +3kieGPFdQYN

I've rebased these onto master.  There don't seem to be any
consistent examples of how extensions are to be named in this
new group-enabled world, but it's my opinion that the bike
shed should be green.

Since fp16 support is not yet present on the AArch32 side,
I have disabled generation of those instructions here.


r~


Richard Henderson (3):
  Add aa64 sqrdml[as]h
  Add aa64 fcadd + fcmla
  Add arm and thumb vqrdml[as]h, vcadd, vcmla

 aarch64.risu | 37 +++++++++++++++++++++++++++++++++++++
 arm.risu     | 25 +++++++++++++++++++++++++
 thumb.risu   | 25 +++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

-- 
2.14.3

