Received: by 10.25.0.23 with SMTP id 23csp1422218lfa;
        Fri, 16 Jun 2017 11:56:52 -0700 (PDT)
X-Received: by 10.55.138.71 with SMTP id m68mr13998418qkd.192.1497639412764;
        Fri, 16 Jun 2017 11:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497639412; cv=none;
        d=google.com; s=arc-20160816;
        b=kYk+KD9nIjRZW1adyx9WaYvnobhIs5jYoBXX7kikck3+iuMa7al7RyUp2HaO88cpVa
         P1OB+rS7RHU++wpTZ5jsXARBvoULGwxNI9Yo+1dK1ZX6iVkH5ROfx4W4KVB9szucRYj8
         yXQ7R32GsXb8lfHWx0VO2gLw50vTQzTuIZq4/NjCfd3WMm0vJ/FJTyawC1fuwGgqBTaV
         nSYeAJJZcpUGQeeODtsbdIKDg+RCdLiygPaX2/D8T0xAMBEufYkuQjL5XLssa+k5Bx64
         1tLGJ/IxTJfMByW6mdBF4ychu6398mhEWlui4VrgjvSfWkjgAMzWckx/1vcRSehV3sA5
         Ht0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=vTifc4XtbPpXuRhbGGEnEIO/RBhR0D9Sf4twVEqRFpI=;
        b=LqlpCgHrJzQ+ZlMrQOyBu1iMgNSsLpqrDNagCi5tilsyTevdXA+KeJoHofgB7m9V25
         VbUV+itiU34BiRMarwBI4VtDpiF6T8Qy6qWCYAeEveeuPM0/wYXySSF9fnzauLXVg6jd
         hnPJE0WdOCpyybW0uDaWZnyI++cpLtivrhr/oRoP2p1rilyVcEY5ad54Ygcxtt6+sxKj
         kKsfsEnursPSj68Iwy8gj8vTLjNwgzzMlkb2ihv5+AszhYa6sYzXJcxpuCoHsbxYZdft
         b+mXRI+MG7A8xUq5INjRGhhrNsPUwYQ0G9NPn6FRf4AsaZlnXfNnsp1pvvqpbh9es/ya
         JVzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.b=GtzIpZQ6;
       dkim=fail header.i=@messagingengine.com header.b=aUZs2QOU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b91si2168467qkh.185.2017.06.16.11.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 11:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.b=GtzIpZQ6;
       dkim=fail header.i=@messagingengine.com header.b=aUZs2QOU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLwQM-0005Me-40
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 14:56:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLwQG-0005KJ-1x
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 14:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLwQD-00077A-6T
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 14:56:44 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56667)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1dLwQD-00076P-22; Fri, 16 Jun 2017 14:56:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EF63820971;
	Fri, 16 Jun 2017 14:56:39 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 16 Jun 2017 14:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=vTifc4XtbPpXuRhbGGEnEIO/RBh
	R0D9Sf4twVEqRFpI=; b=GtzIpZQ68MLGjC3biHyjeJ5w9cqZhuOiWwUdRhjBX8D
	LzhaFJsCLCYxmCgogAxEECYM+izmr/0junS1fOmDW9/YBedJKoTxUhOD/1e3LYXw
	iAhhjKWlDAiVji/2Ia8kvYgfIMtc+6EsY47KKnLv74WPXCcFfg3RJHEhm3uPHBbA
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=vTifc4
	XtbPpXuRhbGGEnEIO/RBhR0D9Sf4twVEqRFpI=; b=aUZs2QOUA9ldDTPhc0g5cI
	4aylNT0RheUz2FDf09kpJgOZODTnzUpJk4D1dPSuzvLlS2mMP5qsejmeUBK5Cx6q
	azpiTEfdZcCyWZX6mNpgjCUEOvbkrXI8zFP2ASQmo3XyS8dXmC1DHQouAEwvHomx
	Ort8o7Rm28vfHeH79N4wB0AH0OXEITQxTUkwJdzjTO2QITIsHW5O52UKEwIMPa+r
	0Wx1lU4ubfhDCktd92idxY8pufVAxxAKRyei8C36bar7uJNLze+aEbdxKBKlIhmR
	Ou+qJbSiEugQt8a2dbiKPhZTr7NZXpNX9mKgiJSOBXDvStxeAAtECaAqP2pfa8Kg
	==
X-ME-Sender: <xms:5ylEWZ7VF43bQfMKZP1du6MmfYa9-stIehKSSeDsITdgJ-TRy9tEhw>
X-Sasl-enc: mCrpNqZkxK56ERvbXx24Ju7Iao6AaqZgeXpLLiPVk416 1497639399
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id ABA807E7B1;
	Fri, 16 Jun 2017 14:56:39 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 16 Jun 2017 14:56:35 -0400
Message-Id: <1497639397-19453-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.27
Subject: [Qemu-arm] [PATCH v2 0/2] cpu_env in gen-icount
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?q?Llu=C3=ADs=20Vilanova?= <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: exiRd5kVpQ7+

v1: https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg03771.html

Changes from v1:

- Use tcg_ctx.tcg_env instead of passing cpu_env around as suggested
  by Richard.
- Added Richard's R-b tag to patch 1.

Thanks,

		Emilio

