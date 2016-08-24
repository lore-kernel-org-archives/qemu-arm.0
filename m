Received: by 10.25.21.156 with SMTP id 28csp114387lfv;
        Tue, 23 Aug 2016 21:19:57 -0700 (PDT)
X-Received: by 10.55.212.150 with SMTP id s22mr984129qks.219.1472012397733;
        Tue, 23 Aug 2016 21:19:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u65si5066991qkl.88.2016.08.23.21.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPfR-0007RA-39
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:19:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfD-0007Jt-1T
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPf8-0004fc-LC
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:19:42 -0400
Received: from mail-qt0-f194.google.com ([209.85.216.194]:35583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcPf3-0004dR-6S; Wed, 24 Aug 2016 00:19:33 -0400
Received: by mail-qt0-f194.google.com with SMTP id q11so198940qtb.2;
	Tue, 23 Aug 2016 21:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=jM4lTOvFlSV63UC3alxo/RpSOlWw20xFVVe4AfDfeC0=;
	b=otksVw7xQsbviwydT+OMjhlOcqunCjVvehGQlftPWakZEvCpjaFJ/gP7ZuXtzuRIbe
	sse4jcWhDtuag3X6tchLlLwGoe+E7F9lU8eXM0iHQfu74/clm6CJeQYM1p2GOqh+Dp1Z
	KIb+Edf5K8+ncLrsA6ik9Jp7u9vJv4ZwnBVHDLFLbMhKxIFjqSTS/kz/DB1yU3HNSm7E
	7Kj1nJqITWfOn3XFV5upmPcWCPKBGWtRvfs24wEzYgGBARqSJyoTuDhevNBxZnxp15E6
	S2EUxh7T2o8qG6Z6pwmQbuFsU85N96rI8fLwfctZuh+vh2Ob9Oe4axckCyJz18dPBDwv
	yuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=jM4lTOvFlSV63UC3alxo/RpSOlWw20xFVVe4AfDfeC0=;
	b=CWmIF7HgWwYTAdz8N+2h0l4hiSr7YFU4Z9wOn2D8oSSp7NbLlyNFSgUkGAA9dnXqjd
	6HmXsR4XBjjWViaV59qEkPPhCYgXNsL1u9TT3RXlBOvUZWHOqNAmDNdSyMW6PiVOsXBl
	jUuMG3RIZMTk+o0aBO+3lRKkz5LNVd0JyK5fofOhDJoDhuONAbqxbCH0S3Et6LGr4fmD
	RK01FeYc+Cqy5Fy+EGK84LWeUDn0fowjhltVwpq/+1eEnGwoI6LnhrJcfJgY9S+ZJmOB
	yX3AmGYYvEiK/UlJ8WvZuaelFb7POCaQaP3s3X9pinrgWVABMIZbisO/jpC8iaNpXm4n
	nDCQ==
X-Gm-Message-State: AE9vXwMIV9U9pmBORuycVRgVuJw/UyMQzRqXxZd3f9/HUqlRJ+cDpDZvy+6PvJK4InP7ew==
X-Received: by 10.237.37.58 with SMTP id v55mr1062339qtc.9.1472012312383;
	Tue, 23 Aug 2016 21:18:32 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id t36sm3677369qtd.3.2016.08.23.21.18.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:18:31 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue, 23 Aug 2016 21:17:52 -0700
Message-Id: <1472012279-20581-1-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.194
Subject: [Qemu-arm] [PATCH 0/7] Improve buffer_is_zero
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
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, vijay.kilari@gmail.com,
	peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +K8Xi+zOdb4q

Patches 1-3 remove the use of ifunc from the implementation.

Patch 5 adjusts the x86 implementation a bit more to take
advantage of ptest (in sse4.1) and unaligned accesses (in avx1).

Patches 2 and 6 are the result of my conversation with Vijaya
Kumar with respect to ThunderX.

Patch 7 is the result of seeing some really really horrible code
produced for ppc64le (gcc 4.9 and mainline).

This has had limited testing.  What I don't know is the best way
to benchmark this -- the only way I know to trigger this is via
the console, by hand, which doesn't make for reasonable timing.


r~


Richard Henderson (7):
  cutils: Remove SPLAT macro
  cutils: Export only buffer_is_zero
  cutils: Rearrange buffer_is_zero acceleration
  cutils: Add generic prefetch
  cutils: Rewrite x86 buffer zero checking
  cutils: Rewrite aarch64 buffer zero checking
  cutils: Rewrite ppc buffer zero checking

 configure             |  21 +-
 include/qemu/cutils.h |   2 -
 migration/ram.c       |   2 +-
 migration/rdma.c      |   5 +-
 util/cutils.c         | 526 +++++++++++++++++++++++++++++++++-----------------
 5 files changed, 352 insertions(+), 204 deletions(-)

-- 
2.7.4

