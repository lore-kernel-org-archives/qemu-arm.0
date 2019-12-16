Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5074450lff;
        Mon, 16 Dec 2019 12:48:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7smKN7VfVCzfDAMz3R2k3wDPMSaoEDGwedOpxaGry9/yhc2+5jV+nFXleNMAOSf7G41Bo
X-Received: by 2002:a05:6214:94b:: with SMTP id dn11mr1358106qvb.12.1576529296113;
        Mon, 16 Dec 2019 12:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576529296; cv=none;
        d=google.com; s=arc-20160816;
        b=D/X7ZXFk/JXQWaRSvLRY+I4sOnubUQd/WO1bC+4h7cZ8HwclnFyqSMKmEwCdNJE6yz
         IvMMXoeiXHUDIU2wUOi2BmYyTn5EkjcVe7BGWC+cIbziRRtbaHju03wE+2pvdUtlME1S
         5zDyNMfgOmc4DY8wz+ywhJMmZ4/XHfMch3pmFMxROIq2ufDo568E2UEHFP7DU2kdIWpf
         w74hHgXgGnzAj3qvm7h00V6GTXGwr04Ww8XRVgCh92K9m9VFEkffGao/3aaYNXUqD4aX
         LDFqcbM1Bkp/QpT6598xqTtfc1t79uS9j6PZBxMOL9r0walNAXXHA0pfh2V/Tl98D4R9
         gQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=NPxzqCREAHr1lTYDaA+kWZitj9lizM0Ql4GFsTrn1n8=;
        b=HcrZRfYp7e1cJXKG8ilSRgRnha24ggI2QdYZVFS67GB0ZjQNPZmH3g4+Vpp0ax2p0v
         XM7SuHKf0S/h6oaZUiu/BW8UwEN4taHgfUDM04b8mHXUjwEny0sc12Ra56vlq0DRC6D6
         hy7BkISSAUr4bAPiPOcAfY5C74nxOMig5I/642UFRxFUvZvHYurRpGB6iP5QqyhSwvkq
         MdhlUs3sH7eZB0g/UMk6/TvusTtqukNJL12cVPhJ2VKdZjTWMC2g8ocyf7Qxr7ncnEDB
         5B8f+Z5HySUDCJP7fywRuAILMlO6chfPN8w3pXuv8OHDSl6IuwPZGxnnNRflg3toHwJE
         2eCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=SAZq1dLa;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 20si11072763qka.118.2019.12.16.12.48.15;
        Mon, 16 Dec 2019 12:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=SAZq1dLa;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A38614A5A3;
	Mon, 16 Dec 2019 15:48:15 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.391
X-Spam-Level: 
X-Spam-Status: No, score=-1.391 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQRn5u7dT++c; Mon, 16 Dec 2019 15:48:14 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6A1834A59B;
	Mon, 16 Dec 2019 15:48:14 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 02BFC4A534
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Dec 2019 15:48:13 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2sve+8Cs8Xr for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Dec 2019 15:48:11 -0500 (EST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id E6BFC4A50F
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Dec 2019 15:48:11 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576529291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Fxv/08Xa0VbcqCSvsm0VgrWIKaPNFsllFhCVnw+YLI=;
 b=SAZq1dLaiyjjq8I1hzXpiBv+2GUA7ikRYoltPQLwXLcaaw1h7gxM7FG20YIqUE1i080/An
 bRF2tGA0lfWaZxWhBnmdqwkLaPh78osqDtjt4K/rB6jKaCsj+j0vbxNbgDw2XxImgmzMTw
 rOqHomWrPBKqWCjzMtsgwYbV++J+/Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-_3L8DJ-vNPWrTcGnvlpMrw-1; Mon, 16 Dec 2019 15:48:09 -0500
X-MC-Unique: _3L8DJ-vNPWrTcGnvlpMrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B4708D811D;
 Mon, 16 Dec 2019 20:48:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C11B5D9C9;
 Mon, 16 Dec 2019 20:48:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH 00/10] KVM: arm64: PMUv3 Event Counter Tests
Date: Mon, 16 Dec 2019 21:47:47 +0100
Message-Id: <20191216204757.4020-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: andre.przywara@arm.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: Y8AHSnkr1vQL

This series implements tests exercising the PMUv3 event counters.
It tests both the 32-bit and 64-bit versions. Overflow interrupts
also are checked. Those tests only are written for arm64.

It allowed to reveal some issues related to SW_INCR implementation
(esp. related to 64-bit implementation), some problems related to
32-bit <-> 64-bit transitions and consistency of enabled states
of odd and event counters.

Overflow interrupt testing relies of one patch from Andre
("arm: gic: Provide per-IRQ helper functions") to enable the
PPI 23, coming from "arm: gic: Test SPIs and interrupt groups"
(https://patchwork.kernel.org/cover/11234975/). Drew kindly
provided "arm64: Provide read/write_sysreg_s".

All PMU tests can be launched with:
./run_tests.sh -g pmu
Tests also can be launched individually. For example:
./arm-run arm/pmu.flat -append 'chained-sw-incr'

With KVM:
- chain-promotion and chained-sw-incr are known to be failing.
- Problems were reported upstream.
With TCG:
- pmu-event-introspection is failing due to missing required events
  (we may remove this from TCG actually)
- chained-sw-incr also fails. I haven't investigated yet.

The series can be found at:
https://github.com/eauger/kut/tree/pmu_event_counters_v1

History:
v1 -> v2:
- Use new report() proto
- Style cleanup
- do not warn about ARM spec recommendations
- add a comment about PMCEID0/1 splits

Andre Przywara (1):
  arm: gic: Provide per-IRQ helper functions

Andrew Jones (1):
  arm64: Provide read/write_sysreg_s

Eric Auger (8):
  arm: pmu: Let pmu tests take a sub-test parameter
  arm: pmu: Add a pmu struct
  arm: pmu: Check Required Event Support
  arm: pmu: Basic event counter Tests
  arm: pmu: Test chained counter
  arm: pmu: test 32-bit <-> 64-bit transitions
  arm/arm64: gic: Introduce setup_irq() helper
  arm: pmu: Test overflow interrupts

 arm/gic.c              |  24 +-
 arm/pmu.c              | 783 ++++++++++++++++++++++++++++++++++++++++-
 arm/unittests.cfg      |  55 ++-
 lib/arm/asm/gic-v3.h   |   2 +
 lib/arm/asm/gic.h      |  12 +
 lib/arm/gic.c          | 101 ++++++
 lib/arm64/asm/sysreg.h |  11 +
 7 files changed, 950 insertions(+), 38 deletions(-)

-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
