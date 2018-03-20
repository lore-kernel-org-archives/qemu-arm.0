Received: by 10.28.91.67 with SMTP id p64csp3851232wmb;
        Tue, 20 Mar 2018 06:43:53 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt0HAOutOY7WipkZxc1usI7EDYNXW18FdBybB9E4PLHtKneaCoBmoHJVVJ/edfbLX8iGzKe
X-Received: by 10.200.47.26 with SMTP id j26mr24019400qta.185.1521553433487;
        Tue, 20 Mar 2018 06:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521553433; cv=none;
        d=google.com; s=arc-20160816;
        b=L6rqp+OZsiCDRxOuH1fv7FqQPDFnqCoAAUNYzUpZsppcxrTXJjwdrOuHEeqarqB/Q5
         3CT17UM/uT4js51l8C0DpRD9b6ycjUrvyM/NhCIV5B3evuLCwTw9xHGjKhp6vlgXkjy/
         pZitlYA8T9VAvmoavBaKe6Uc//80yPT/FBNlsiGLxn4sE30UPIgtZHixkuyu23wtxNqd
         842si5QzQPJ85i4qDQakHIppoOJyl3t6+IfiioGR/lv84WkzJl6+4SAFwlkX3CkD/fmz
         nPv0UTBImyxcMzbAatIUw+Q/0fPu5FpjTijhWihAIyoTzpI8HVCctA4g4oSNea5Odth4
         WUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=4fyeBlO5OTiykrXtlGBpTz57K69M8NxeMtC9eFtPfDc=;
        b=sgrZhimYD0X3SJqrz1s4raqQkxWBPdbEVSK2ZtMc4XpMulAWAey/KeEHfYPk/VEVKy
         5pvQYSovlaqViW5dwHSGCbxbfGH1JDaSDyb5O5MtvgBiqf0g6nwaYD7XWiKXMQ3f4KxD
         99Q6zD3TkbeUjD5j4TZDa6Ejh8o1QR/r6cscq7kXiwvuMVNGOWQpUaIs+jZUD0kAIfNK
         cp1DcqfgTei10Uxltg0Fj7fzgFBhcmUeBpyHTut1fpemI115LcVLuApdvfdO1achzaYM
         cGig4EmuR8ZDfED0fRn3Z1doy71qcJchGXwflO4Wm7YEoVeaAXMhSrlo66WXDRvW9s8w
         +O6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v46si603365qtc.228.2018.03.20.06.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHYP-0004WO-13
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:43:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHW8-0003A5-PD
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 09:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHW2-000425-QY
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 09:41:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eyHW0-0003s8-02; Tue, 20 Mar 2018 09:41:24 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eyHVs-00044B-1L; Tue, 20 Mar 2018 13:41:16 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Mar 2018 13:41:10 +0000
Message-Id: <20180320134114.30418-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH for-2.12 0/4] Fix various BRK/BKPT related bugs
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uTUWNHYlK/BP

The main aim of this patchset is to fix the bug reported in
https://bugs.launchpad.net/qemu/+bug/1756927 where we don't
report the correct FSR when a BKPT instruction causes us to
take an exception to AArch32 with LPAE enabled. The other
patches fix some minor bugs found along the way:

 * we weren't honouring MDCR_EL2.TDE when delivering an
   exception caused by a BRK or BKPT insn, so we'd always
   send it to EL1 even if it should have gone to EL2
 * our logic to decide whether to report a short-format or
   long-format LPAE for hardware breakpoint and watchpoint
   exceptions would get it wrong in some corner cases: we could
   select the short format because we're at EL0 and the EL1
   translation regime is not using LPAE, but then route the
   debug exception to EL2 because of MDCR_EL2.TDE and hand
   EL2 the wrong format FSR.
 * when taking a debug exception in AArch32, we would set the
   guest visible IFAR to whatever old value was lying around
   in env->exception.vaddress. IFAR in this situation is
   architecturally UNKNOWN, but letting it be possibly set
   to an old value that the guest shouldn't be able to see
   at its current security/exception level is not permitted,
   and setting it to a non-deterministic value is bad for
   record-and-replay.

(This patchset further reduces the set of places that are
calling the somewhat dubious extended_addresses_enabled()
function. The last callsite is in the CONTEXTIDR write
function, and that should probably be updated something along
the lines of the ideas I wrote in this email last year:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg491671.html
but that is a cleanup for another day.)

thanks
-- PMM

Peter Maydell (4):
  target/arm: Honour MDCR_EL2.TDE when routing exceptions due to
    BKPT/BRK
  target/arm: Factor out code to calculate FSR for debug exceptions
  target/arm: Set FSR for BKPT, BRK when raising exception
  target/arm: Always set FAR to a known unknown value for debug
    exceptions

 target/arm/helper.h        |  1 +
 target/arm/internals.h     | 25 +++++++++++++++++++++++++
 target/arm/helper.c        |  1 -
 target/arm/op_helper.c     | 33 ++++++++++++++++++++++-----------
 target/arm/translate-a64.c | 15 +++++++++++++--
 target/arm/translate.c     | 19 ++++++++++++++-----
 6 files changed, 75 insertions(+), 19 deletions(-)

-- 
2.16.2

