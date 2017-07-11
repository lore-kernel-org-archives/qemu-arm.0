Received: by 10.25.44.15 with SMTP id s15csp4220704lfs;
        Mon, 10 Jul 2017 19:58:18 -0700 (PDT)
X-Received: by 10.200.55.208 with SMTP id e16mr7981414qtc.198.1499741898743;
        Mon, 10 Jul 2017 19:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499741898; cv=none;
        d=google.com; s=arc-20160816;
        b=ghXpSeWOuQsa07D2IlYgOpWU4Ql/YfiS57iQk/8GyM2dJxyyV+s62EmKbTyvf0tQjA
         wGS13ViopLHVrCJ6g865N83mAL1KxP781kXcTr7uI+zHWQK8Lq/mJa8g4tnSMdWNjU1T
         0jqQVSqIY7LwvG2e7G/PJw+ntJ0r0lvCaYpYT1EJXLtAhdPvJXL97XZTSCck9wLvSCtj
         1bxjsYoz85FhxCkd7yvuaY9bD33rdwoRxHKRFTAmSfnYjYQBJQP78MkkKUlhpEmaygvu
         pW4XVlABslsdRcXKlxtidjR87un1TdeNSFN3TbuzJcixohPBGoWR+x8hkiPxj+G3o/M0
         GeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=AdqynKjidoZQOij7wSnaWsh9fpjQwTiZylMYgr/2uOA=;
        b=Ipe3PJ0ocuI7hkZ+Z9JPMICRs1CqR5NJFaRBy3+4Fa8DD1DObXUu909pApeLyTtTi2
         XZoneIM2b/YN3IkzZGKiHbz899ho//M5ap7kpg0fNT+4A8yK3NMmy3NVO0r4r6Bic1zm
         irsWJ9cSJxiMtHyPMSmqt6b9gR+UQjeF1YQwXgf1QDx76YFtLFgCEjYpFUDfSiX39EDa
         FpnAWMm0iogc6WB5mI38SLP7zP+wWmtFWOO+rZjDo1WvZ7FQDVIN/S+eI7+cWSTXVa23
         tWQyz/O83sRlcz833OXIUAXC/zv57MpKl1aHIgZD/peMYDhPX4PRFAJGeJHCfGdYrlfi
         NnYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=c13kNgGW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 80si12148615qkg.70.2017.07.10.19.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 19:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=c13kNgGW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUlNQ-0005t9-3U
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 22:58:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlMX-0005a5-3f
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 22:57:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlMT-00008t-Va
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 22:57:21 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUlMT-00008X-R2; Mon, 10 Jul 2017 22:57:17 -0400
Received: by mail-qk0-x241.google.com with SMTP id q66so4223797qki.1;
	Mon, 10 Jul 2017 19:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AdqynKjidoZQOij7wSnaWsh9fpjQwTiZylMYgr/2uOA=;
	b=c13kNgGWuXIdbGOxNVGrAsziY+qIY9vNv2yLQgrDn0PJTH2/XpJGoOiQSfytwj9/qy
	mjoB9/bcAk30Nd2j52i9zWU4Dnfm0KmT5QFW6Md8ivhx6/nznO07pB8OuwjZo+mB0FM6
	k5rGCuBPII6tJBM/H7DZ7CVwikvM0aMMrWa547r+ksTl5yYF4JPUlkAe1QkKw9JrBz+L
	+7maIjxIFqohjU7FSyFKzS1YwjCj/14vvyQXzvAzKVxL0yICHEs98y04xd5tY8f8qqa5
	rIZMa7eMjolFKflD5O8DxW+NbcacfENtf6+V5+4CtV2Mqop52sIMPURhU3CUUCYeHMM9
	svmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=AdqynKjidoZQOij7wSnaWsh9fpjQwTiZylMYgr/2uOA=;
	b=e0ifZFztVOyVWc3ewWHGNhmd52LSr6p2Rf1yQ8AINk8w3eoxul+1xBr1NGjfZxx2bf
	f6J6iROBrkn4aw51NF/DHwfNehhk/mZOtaYzTXzKaiN56vm+bKf7cPTyvXwSNFUMy5OR
	RziJx6NjE1C+tRUkNt5aJX7qWE7KZlKSumTvTkvoTQPI5zg3OMS2GrT7q42GT1CFZp7I
	W5diVThLltlAlpUD8rx0Wrf5cVyl2W4tkQMMgWYns2Zel3KUe56jjhdsuUs1+T8EOxG1
	MxlKYzszCHKIb97xrCaxzfqRvum7LZbiTgdVeIYtbj+s76VPw/DA3gvcu3EqPbVXwcpF
	4ZEw==
X-Gm-Message-State: AIVw110wjdtEObv8hdHW9/C8Bh0TsT03YPmyDk3uzXRLlxBgwzB2TlBr
	eLb//qEJokP0ovcIcHwYsQ==
X-Received: by 10.55.43.160 with SMTP id r32mr3592203qkr.47.1499741836990;
	Mon, 10 Jul 2017 19:57:16 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	w46sm10813234qtw.28.2017.07.10.19.57.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 19:57:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-arm@nongnu.org
Date: Mon, 10 Jul 2017 23:57:00 -0300
Message-Id: <20170711025703.24194-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [RFC PATCH 0/3] disable Xen on ARM (until supported)
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
Cc: Juergen Gross <jgross@suse.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Anthony Xu <anthony.xu@intel.com>, Anoob Soman <anoob.soman@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-arm@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C6eD3hNjZ2zn

Hi,

Those errors were triggered installing libxen v4.8 on debian Stretch
ARM (32b and 64b).

It seems QEMU only support Xen on x86 host.

patch 1 disable PCI Passthrough if not on x86,
patch 2 disable xen_map_cache() on ARM, I don't think it is the correct
way to do it, then
patch 3 add few comments to think about spliting x86 part from arch
agnostic Xen code.

That said, I realize there is no Xen ARM entry in MAINTAINERS, I'll Cc:
X86 maintainers although.

Regards,

Phil.

Philippe Mathieu-Daudé (3):
  configure: disable Xen PCI Passthrough on !x86 archs
  [XXX] xen/mapcache: disable on arm*
  [XXX] xen/pt: comment about !x86 archs

 configure                     | 11 +++++++++--
 hw/xen/xen_pt.c               |  4 ++--
 include/sysemu/xen-mapcache.h |  4 +++-
 3 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.13.2

