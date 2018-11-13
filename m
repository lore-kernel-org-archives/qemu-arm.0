Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4624457wrw;
        Tue, 13 Nov 2018 09:15:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5f4+G1T70+10fBxekf/PC38j1HmDqSjSuYYLNM7XIX0lwTELBtv7INlNaIaxldzq3LbvvaG
X-Received: by 2002:ac8:468f:: with SMTP id g15mr5735409qto.363.1542129306493;
        Tue, 13 Nov 2018 09:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129306; cv=none;
        d=google.com; s=arc-20160816;
        b=yUJZkchJUmOQkEv11NYRExVqym75AyGhU7zx59EeYjXXF6MnrfG7G3DQ+yBiEp2gY7
         9n7Z1fGiSADNnQXP7OinJCuhji6mXi7GHQH4dhbIr8OH87H/UdLO3xtNnCNsHLOLJJYD
         IznPidSWPwb3nIqrxzA2dL7Zmu2zRK0p96mNMCqYkVX5oUbBDNFVcelwmymAvO6b0IzJ
         yFUQpbDPZF7GF2rmWuCBaku9kHnL562ipcjixZsnDky98tHPAuH7kveqGiln+v/TooZ+
         /1UsVOj6gzG3kE1uh+UahyDQyHi7UzLiyJIeoL25euaaKJeQy7YLfopUzAbYaNjYbnb+
         Tpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=AzKWLEHM17VI0o4jLQ/tT6arGYhwQMv+0wJ/UZsxmjA=;
        b=hkD6d/VvMkrIb+c/AtxDqlu3O9e25cPpFC3vEsgLabnMLXquyL2tgIl1DJdeu9IdWX
         rAA3Sget1tBOBkkiNPUcooVdEVhcxGvF2clPeOqoai9MzacF5zQ8DQy6MTCsdxKkfw8j
         yDHxaJSKUiCxIp/OqhcT5QN39ikhz62ofVbRRv94mT+VBhrqLtorrgOQHjBD88vQqOhi
         oeRbvCyxv5U3+gH0YmqHs2b85r1BHOzJ6mdq7rOTeawizFpOixa6Odn+n4re839YimgR
         b61xu6pngqNW7RfMAaTLm/qv82iSgVxnYGy88Fv+SHCTUmeNvw0shXgPPXN7Q/X3hrTr
         MWLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f12-v6si876156qth.324.2018.11.13.09.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcHK-0006in-0L
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:15:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAj-0007T6-K7
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:08:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbwl-0003zR-So
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 11:53:53 -0500
Received: from mga06.intel.com ([134.134.136.31]:62850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbwd-0003nD-Qq; Tue, 13 Nov 2018 11:53:44 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922086"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:22 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:34 +0100
Message-Id: <20181113165247.4806-1-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH 00/13] Support disabling TCG on ARM
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	richard.henderson@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PNkt64V5sCOP

This patchset allows for building and running ARM targets with TCG
disabled. It splits the target/arm/helper.c file into logical TCG and
non TCG dependent files so that one can build and run QEMU binaries with
or without TCG enabled.

The rationale behind this work comes from the NEMU project where we're
trying to only support x86 and ARM 64-bit architectures, without
including the TCG code base. We can only do so if we can build and run
ARM binaries with TCG disabled.

The patches are also available here:
https://github.com/intel/nemu/tree/topic/upstream/arm-tcg-disable

Philippe Mathieu-Daudé (2):
  target: arm: Add copyright boilerplate
  target: arm: Remove unused headers

Samuel Ortiz (11):
  target: arm: Move all v7m helpers into their own file
  target: arm: Move all interrupt and exception handlers into their own
    file
  target: arm: Move the DC ZVA helper into op_helper
  target: arm: Make ARM TLB filling routine static
  target: arm: Remove the LDST headers
  target: arm: Move all VFP helpers into their own file
  target: arm: Move CPU state dumping routines to helper.c
  target: arm: Move watchpoints APIs to helper.c
  target: arm: Define TCG dependent functions when TCG is enabled
  target: arm: Makefile cleanup
  target: arm: Do not build TCG objects when TCG is off

 target/arm/internals.h     |   60 +-
 target/arm/translate.h     |    7 -
 target/arm/cpu.c           |    8 +-
 target/arm/excp_helper.c   |  550 +++
 target/arm/helper.c        | 8467 ++++++++++++------------------------
 target/arm/m_helper.c      | 1892 ++++++++
 target/arm/op_helper.c     |  326 +-
 target/arm/translate-a64.c |  125 -
 target/arm/translate.c     |   87 -
 target/arm/vfp_helper.c    |  893 ++++
 target/arm/Makefile.objs   |   19 +-
 11 files changed, 6262 insertions(+), 6172 deletions(-)
 create mode 100644 target/arm/excp_helper.c
 create mode 100644 target/arm/m_helper.c
 create mode 100644 target/arm/vfp_helper.c

-- 
2.19.1

