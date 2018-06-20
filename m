Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp750042wrq;
        Wed, 20 Jun 2018 06:09:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLXNsaA7h57xC3nw4Jrhjimsp+LCk8ZbrzILq/5WAo+x9WmQFTIrzkPR1ioOaCdy97zjL3+
X-Received: by 2002:a0c:81cc:: with SMTP id 12-v6mr17837245qve.4.1529500190103;
        Wed, 20 Jun 2018 06:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500190; cv=none;
        d=google.com; s=arc-20160816;
        b=eHw0ILASxzkiwsa7YJoCcxI8TGmlUxszXNI5gmotculTp4l2C3heYicpSFGz9GGlh7
         syDHk6dmPuddPTOe+PeeGkJiiOvk0AI5UcGvyZMnLnG7OaZjDhfy5McmJLpX26oFENm5
         fUQ9CCwvrHEEBErKidj297o65dC7rE3IhdQeu+3url9Z3p/JSLPzbdDU/9bZRZLBqGFD
         Yq3GJ1DfqYnMGaR5s9RfUH1TPa371yCJzvVOOKyL17KUWM5yodsX7Q1m4tYZdVgDzDB9
         tqeWjdbFQSKDsihokiCv/MYvXFfrkQczf91fIwx6bEPB8PPX9c1xa2Dp6PZ2ko6DNenv
         yDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=gEWWYkZr8RbNLx9r6j9U8VzUItI7DKstEIgldBtDTAQ=;
        b=w7DV1YrYahcYmUvTxt0CzWAbcrMNGlhui1LD3CPTRVzK0YSXSOulRGi4/4T5FbmukE
         +3qmVfs05Dc4uJ1TlC7jE8deXT7+1zFw352ro6eQMuoOAW25c2am2DxPCjseMOsEb8X5
         MsJwtwW//erPvhqj0boX54nq1xrT1ERJcNk/d3v6JIdsObVoruW8CXCHaH4ZY0398ZZ0
         31LMoGfHuAXncRHN/YemTi8IkXv10Ovi1WNWRfpwVwVVhJyUyWZwY336Fj5Ig7qXiqk6
         Q3l+1JKS/U948M7CqJBZbBYqazZRUoxDmtDzTUY5Te+SLiVxypf2WyUDIup2AjADUOFv
         rSAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4-v6si2140293qkg.258.2018.06.20.06.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVcrt-0005qm-IF
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:09:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fVcoi-0003L9-UE
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fVcoh-00051F-TI
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:06:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42842)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fVcoh-0004vT-MG; Wed, 20 Jun 2018 09:06:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fVcoW-0001VZ-Fg; Wed, 20 Jun 2018 14:06:20 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 20 Jun 2018 14:06:16 +0100
Message-Id: <20180620130619.11362-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] Support M-profile MPU regions smaller than 1K
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SOLZUsQLtwRs

The Arm M-profile MPU allows the guest to specify access
permissions at a very fine granularity (down to a 32-byte
alignment for region start and and addresses). Currently
we insist that regions are page-aligned because the core
TCG code can't handle anything else.

This patchset relaxes that restriction, so that we can handle
small MPU regions for reading and writing (but not yet for
execution). It does that by  marking the TLB entry for any
page which includes a small region with a flag TLB_RECHECK.
This flag causes us to always take the slow-path for accesses.
In the slow path we can then special case them to always call
tlb_fill() again, so we have the correct information for the
exact address being accessed.

Patch 1 adds support to the accel/tcg code. Patch 2 then
enables using it for the PMSAv7 (v7M) MPU, and patch 3
does the same for the PMSAv8 (v8M) MPU and SAU.
Because we don't yet support execution from small regions,
the PMSA code has some corner cases where it retains the
previous behaviour so we don't break previously-working
guests:
 * if the MPU region is small, we don't mark it PROT_EXEC
   even if the guest asked for it (so execution will cause
   an MPU exception)
 * we ignore the fact that the SAU region might be smaller
   than a page

(Unfortunately the old code *intended* to make small-region
accesses non-executable but due to bugs didn't actually
succeed in doing that, so this might possibly cause some
previously working-by-accident code to break.)
 
I would ideally in future like to add execution support, but
this is somewhat tricky. My rough sketch for it looks like:
 * get_page_addr_code() should return -1 for "not actually
   a full page of RAM" (deleting all the current tricky code
   for trying to handle it being a memory region or unmapped)
 * its callsites in the TB hashtable lookup code should handle
   -1 by returning "no TB found"
 * the weird call to get_page_addr_code() in the xtensa itlb_hit_test
   helper should be replaced by a call to tlb_fill() or some
   xtensa-internal function (I think all it is trying to do is
   cause the exceptions for MMU faults)
 * tb_gen_code() should in this case generate a one-instruction
   TB and tell its caller not to cache it
 * the translate.c code for targets that need this probably needs
   fixing up to make sure it can handle the case of "the load
   code byte/word/etc functions might return failure or cause
   an exception"

This would also have the advantage that it naturally allows
you to execute (slowly) from any MMIO region, and we could drop
the broken request-mmio-pointer machinery.

In any case that is too much for 3.0, I think; I'd like to get this
R/W small-region code into 3.0, though.

thanks
-- PMM

Peter Maydell (3):
  tcg: Support MMU protection regions smaller than TARGET_PAGE_SIZE
  target/arm: Set page (region) size in get_phys_addr_pmsav7()
  target/arm: Handle small regions in get_phys_addr_pmsav8()

 accel/tcg/softmmu_template.h |  24 ++++---
 include/exec/cpu-all.h       |   5 +-
 accel/tcg/cputlb.c           | 131 +++++++++++++++++++++++++++++------
 target/arm/helper.c          | 115 +++++++++++++++++++++---------
 4 files changed, 211 insertions(+), 64 deletions(-)

-- 
2.17.1

