Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5264868wrt;
        Tue, 2 Oct 2018 09:36:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61E7xYTE0mkFhPH2FIUxynKMJ41kUARntA9JD0ykvDlSKL9uGl2VpYgu2aeVtxDEEwCpIyx
X-Received: by 2002:ae9:dd82:: with SMTP id r124-v6mr12959972qkf.57.1538498175401;
        Tue, 02 Oct 2018 09:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498175; cv=none;
        d=google.com; s=arc-20160816;
        b=sxF8ZeT4WQohc9Z/agg08+iC3d0dhst3ZbM280i9NTB/5OVcryZcfA3TvVN3Iwul8l
         KbwYoVZTXgAO9wwP7QzIqV3Zj/j/MZaXMEK5p3RmSxnwJ+y+3CNo6pTzt1Tb1/mB3xgx
         58+bLPjw5ZveEY0dB27/cYmEQN/TeLcT3gupJHe6Zxbr6wNBuQsc347LNsOPnXaHwN8K
         tRqhN81Dxblij5eITYA4wxpgqSCI+wkkX64qAWGa74er1HGCszx8+WSd488mrcLBETID
         /6UurKYgu3JrNsavTVb7U6VSvYf6t6DaIo3rQhnnJCrhWnx39ixMsBBPw82CQTbjWwgU
         xI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=5SPPZPQlCE4vnTEmLDUArQeO34NcBkogPdKxUojbBi0=;
        b=YiP9CaCAoqwIF3jvqhzTFxJdcGQ6pbm2ezUSq9GSZc0hOeWCCYnsxaDWe3QDk3eKrJ
         cEfj8MKt1VIEzn6yDoMJOtq1qoUkiQf9lFDO5HwC5vyZR5NDXjD7XJabLqDhvaBvZyhJ
         QQKtDV6Ht/VkLJeJ5dJzhBFfT6ZYND60U8Mgs/MM/3bzDB91+xjlrIKhzCuGEgyGRAgB
         irxzDLq6rNGDxkJvKwRSuSaH+GgAa2UZtiBFjoauaFS5ZQl5fhFUZW9p8H2Puy/+qMb9
         rcqdqJShQfNl07N21aEYv51Lg+QRIEPuqD/OKV87eAmKfIxo9k+ZQ0X2CNHBR6+NmZHu
         5AZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q36-v6si4770653qvh.74.2018.10.02.09.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Neg-0006ZT-Pf
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:36:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7NeU-0006Yn-Iq
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7NeT-0004zN-OE
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7NeT-0004yW-FA; Tue, 02 Oct 2018 12:36:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7NeR-0007GF-1S; Tue, 02 Oct 2018 17:35:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:43 +0100
Message-Id: <20181002163556.10279-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/13] target/arm: Implement v8M stack limit
 checks
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
X-TUID: fU3zkCt8rko/

This patchset implements the v8M stack limit checking
feature, which is the last missing piece of the v8M
architectural support.

Note that the stack limit triggers when the SP value
is changed to something below the limit, not when
a load or store is performed below the limit. It's
also done only for certain instructions that update
SP, not for every possible way to change SP. For
loads and stores which do writeback to SP there are
also some rules about what parts of the load/store
are permitted to happen if the check triggers -- we
keep things simple by taking the approach of doing
the check first so that no accesses are done.

We take a straightforward approach to implementing
the checks: generating a call to a helper function
which does the comparison and might raise an exception.
This obviously imposes some overhead for the common
case where the limit isn't being breached, but
generating code for a compare-and-conditionally-call
seemed too tricky to insert into the existing code...

thanks
-- PMM

Peter Maydell (13):
  target/arm: Define new TBFLAG for v8M stack checking
  target/arm: Define new EXCP type for v8M stack overflows
  target/arm: Move v7m_using_psp() to internals.h
  target/arm: Add v8M stack checks on ADD/SUB/MOV of SP
  target/arm: Add some comments in Thumb decode
  target/arm: Add v8M stack checks on exception entry
  target/arm: Add v8M stack limit checks on NS function calls
  target/arm: Add v8M stack checks for LDRD/STRD (imm)
  target/arm: Add v8M stack checks for Thumb2 LDM/STM
  target/arm: Add v8M stack checks for T32 load/store single
  target/arm: Add v8M stack checks for Thumb push/pop
  target/arm: Add v8M stack checks for VLDM/VSTM
  target/arm: Add v8M stack checks for MSR to SP_NS

 target/arm/cpu.h       |   9 ++
 target/arm/helper.h    |   2 +
 target/arm/internals.h |  38 ++++++++
 target/arm/translate.h |   1 +
 target/arm/helper.c    |  99 ++++++++++++++++-----
 target/arm/op_helper.c |  23 ++++-
 target/arm/translate.c | 198 +++++++++++++++++++++++++++++++++++++----
 7 files changed, 330 insertions(+), 40 deletions(-)

-- 
2.19.0

