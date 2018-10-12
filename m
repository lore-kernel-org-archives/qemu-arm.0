Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp896195wrt;
        Fri, 12 Oct 2018 07:43:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62hUvhtv41VsVNFpIdAQVdKcr47S4NIz8lwNkwUtj5U7G/M7onvBOJ4wcLErxd9z/gkThU6
X-Received: by 2002:a0c:988a:: with SMTP id f10-v6mr6115923qvd.178.1539355384209;
        Fri, 12 Oct 2018 07:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355384; cv=none;
        d=google.com; s=arc-20160816;
        b=dkLWJBk3pE1XsHhifIK+F5tdxx0h9izReXUvz+PxtgVVwZcIJRCLGBx4rXIBaWufpp
         PCQRv9fFhLnqgbLTbJhevfCItw1CaCnNgx6sBSu0Lb2GmeWvNoCtsa0T8traiwlAibIl
         gdS1OwHCMkCs7UjkmK8vnx+1sRe/1L+Fj+ytfVSQ1kJB80cUuOXrH60KZIONqLnsrKt8
         k1nuIdfvLLj5XjQ/irZ44vejgSooN25O3KVAve+yT4NrtddqfoZGX80V4Ziyb+VDDG9y
         I9GI1JD404kOl1Z6cJ3OQq32sx+pmqSEpIxoSAfKsGArqHpnvLiQ9JttoO5fnepJd232
         AyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=su42Lkt+UQvIbI2oZQ358NSI81dgeSkj6ybtZ8Znzfk=;
        b=yFb1WS4pvFfinl4J+TXl+vxqzK9TSmFXoQTDQ+qjFAoWAUpiFVtMl8/lBPEQu7p7HU
         iAzqTWY1flP1ba0AAjuKoyPqIP8nkuWysOBtbJ6BHC4CN/1DINF14InCFcEmQJO8nO7v
         8cXlFDZWvH0h7509D2JrkCr7bK3jpuBQazTvFX+sHCAgcRblVnIW22jNJYty9BZcjpZb
         EWS2CU0LIJlhZNb+OaqlvMxIMZRYwoNUuSRtVte0CNLf1puz1MXD0MTfAKseSpvv5/vp
         aIYOVPU1goXpGvYxQKif21q8r95+19esl/TawYLS8SIcrnrKCkaxZNQ+Oo99JwtnhG7k
         urQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j92-v6si1208446qtb.33.2018.10.12.07.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyed-0007yB-1c
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:43:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeH-0007xA-Vc
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeH-0002mH-7x
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeG-0002ix-Vf; Fri, 12 Oct 2018 10:42:41 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeE-0000NZ-HT; Fri, 12 Oct 2018 15:42:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:25 +0100
Message-Id: <20181012144235.19646-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/10] target/arm: more HCR bits,
 improve syndrome reporting
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qHdwAtmgMh/v

I'm currently trying to track down why my AArch32 Hyp mode
test images don't work, and thought I'd start by patching
a few of the holes we have in our implementation. (Haven't
found the problem yet, sadly.)

This patchset:
 * implements HCR.{FB,DC,VI,VF,PTW}
 * fixes ISR_EL1 in the virtual-interrupts case
 * fixes some syndrome reporting corner cases where AArch32
   or v7 differ from AArch64/v8
 * throws in a couple of minor code cleanups

The remaining unimplemented HCR trap bits (as of v8.0) are:
 * TID0 TID1 TID2 TID3 TIDCP TAC TSW TPC TPU TTLB TVM TRVM TDZ
   -- these are all "trap on various system register accesses"
 * AMO VA
   -- these require support for presenting the guest with a
      virtual asynchronous abort/SError

(We also don't yet implement HCR.TASE, which is interesting
because it requires trapping ASIMD-but-not-FP, which we don't
currently have support for in translate.c. This would also
be needed for CPACR.ASEDIS.)

thanks
-- PMM

Peter Maydell (10):
  target/arm: Improve debug logging of AArch32 exception return
  target/arm: Make switch_mode() file-local
  target/arm: Implement HCR.FB
  target/arm: Implement HCR.DC
  target/arm: ISR_EL1 bits track virtual interrupts if IMO/FMO set
  target/arm: Implement HCR.VI and VF
  target/arm: Implement HCR.PTW
  target/arm: New utility function to extract EC from syndrome
  target/arm: Get IL bit correct for v7 syndrome values
  target/arm: Report correct syndrome for FP/SIMD traps to Hyp mode

 target/arm/internals.h |  45 +++++-
 target/arm/helper.c    | 347 ++++++++++++++++++++++++++++++-----------
 target/arm/kvm64.c     |   2 +-
 target/arm/op_helper.c |   2 +-
 target/arm/translate.c |  15 +-
 5 files changed, 302 insertions(+), 109 deletions(-)

-- 
2.19.0

