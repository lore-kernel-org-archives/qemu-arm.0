Received: by 10.223.197.9 with SMTP id q9csp2470123wrf;
        Mon, 9 Oct 2017 06:48:58 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA1uTDTua08lDTECij3ofrXn1P7OHnHvHMhJOk7FISLNgfrVkHqhMe8FpnZFO3Exx63HbPS
X-Received: by 10.55.192.204 with SMTP id v73mr9440076qkv.117.1507556938690;
        Mon, 09 Oct 2017 06:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507556938; cv=none;
        d=google.com; s=arc-20160816;
        b=V0FWFW6L7H8Yj37CCjn0d+LalMAtASDzrSicSJjuRgCmIBXwlDDVudFO60DDdjO4aO
         BC5ADe8fHL+ZihX6I1VsByh2iJWgPREk3Tt0FiWcWsO1Mq0dnwsobWsruhNN6WLjGY61
         T4LiBovw5xc59h6Nxiskd65+hHjenH+st4PLLBpv69Xhm4jZpf+sEEjTaB95JWywL01v
         DDoCGqSOS7oNstGf2KwYn0VbahHgV6rWtWMoftshna038/rTc4pzNKGUaOkOIvx9x3h9
         SsV3I/3crGUmRo4iLM6V9hp7ouA1Kba91UKLHz12P/6PVRpNsEcP0RViljmtxD9XLqyO
         XReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=6vqjyy9nKnaLOAAgZuo51kq89B06fjP7ezWbzc6dKq0=;
        b=uFOuR5xxOJXhWmmrGVeJHPpB2HmzF2EPM/5hB/w883CiqN8GZrR1xzfA1mn5rjBRNH
         I4scgN7LVkja7KPwrjRl5jdj4FqV6aD8Yng4sZGe9kh/8DAntztj7mVvsq4jf/ASHLI5
         5e/rbi64z9173W0FrPCbGLQZKpDB3j0hO+u3oCANsQrLbMrr+IpIlVBqDMEEm8MCTfGD
         K5ffOhn5aJOit7XOWEpsaUK48DR3ZuHK6fKx5dwfKVGbdxCAxucXsyd+JIdp4eIspKxh
         euoyysGT67p/BLrqO7BVEewnwohyi4vHkWPwDs+8GWSIbQuBrZRTGQTRW2AVvtathf5p
         LVyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si2721138qke.418.2017.10.09.06.48.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 06:48:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1YQU-0001GK-5J
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 09:48:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQJ-0001GD-Qi
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQJ-00043c-04
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:47 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e1YQI-0003zX-P9; Mon, 09 Oct 2017 09:48:46 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e1YQA-0004WH-7w; Mon, 09 Oct 2017 14:48:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Oct 2017 14:48:30 +0100
Message-Id: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/9] v8M: BLXNS, SG, secure function return
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S3S+gVZaCqUV

This patchset is mostly implementation of SG, BLXNS and secure
function return. Parts of it were in the previous patchset,
but had a bug which I've fixed in the SG implementation where
we read the first half of the insn twice by mistake.

Patch 1 is a new trivial bugfix.
Patches 2-4 were in the previous set; only 2 has changed.
Patches 5-8 perform some refactoring so that we can correctly
implement the behaviour of a handful of Thumb instructions
which must be unconditional even when they appear inside
an IT block: SG, HLT and BKPT.
Patch 9 implements the final edge cases of the SG insn.

The refactoring has the nice property that we don't have to
pass the CPU env pointer into the bulk of the thumb decode
functions any more. I suspect it also might fix bugs in
setting breakpoints on instructions inside IT blocks, though
we haven't had any complaints about that so perhaps gdb
works around it by setting breakpoints on both the cc pass
and cc fail next instructions in an IT block...

Peter Maydell (9):
  target/arm: Add M profile secure MMU index values to
    get_a32_user_mem_index()
  target/arm: Implement SG instruction
  target/arm: Implement BLXNS
  target/arm: Implement secure function return
  target-arm: Don't check for "Thumb2 or M profile" for not-Thumb1
  target/arm: Pull Thumb insn word loads up to top level
  target-arm: Simplify insn_crosses_page()
  target/arm: Support some Thumb insns being always unconditional
  target/arm: Implement SG instruction corner cases

 target/arm/helper.h    |   1 +
 target/arm/internals.h |   8 ++
 target/arm/helper.c    | 306 +++++++++++++++++++++++++++++++++++++++++++++---
 target/arm/translate.c | 310 +++++++++++++++++++++++++++++++++----------------
 4 files changed, 515 insertions(+), 110 deletions(-)

-- 
2.7.4

