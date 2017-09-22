Received: by 10.223.172.38 with SMTP id v35csp3209408wrc;
        Fri, 22 Sep 2017 07:59:52 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCsrztT5M6Gk5hsM04z5Mhk/U1X0yAZqFtMsgffroVSJXuZdaobHDzQ5X1iLJjB6BSHyQ+Y
X-Received: by 10.200.28.117 with SMTP id j50mr8863825qtk.312.1506092392750;
        Fri, 22 Sep 2017 07:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092392; cv=none;
        d=google.com; s=arc-20160816;
        b=K50Rw6W1zc1plT1Wz1/y2NzyZeiufmOe+xWt+dxU7RRLNrP79V5N6USQMhyI1C7qAb
         S5sZqQainAgz9WjkslGC5eAw6VCKsu4SCIISJ+K0CJwYKy4CkvEHZNu4U5t8W920WH5H
         66SKI7JmuCkoekyYz8qiLRrj9fYGKOASR2ghKVdKr5qiSZXxSwl0pizM5p32+qr/m8Qw
         Uixv/xaLHSEK3W7xxc3qXRMGiCDhI7KsMveAAVxaUkT/wzrnijIyeXjnshuHbOOCGcJN
         3+OO9IbnEzBzHK7yx7Dwr6fgzvbVlkTF5uET5Xa6Ipa6EwhfEG4xlGUmX1Ul6/AWNloj
         3mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Rxab3pt0GdUKepHHbe4Qs0bbkYGpjYX1Z27aGMaul4A=;
        b=URhJShKwfWvOVOZardu7wpdMHcqsrY6Om9YqH2GrxSTkPMJr8v5MF8XYgl67PdNoq+
         nGKXogAgXGO2CDZ56w3ABAQpRCNhnDSX90+84aneoyIdojbQfLB0UMhd/M+R5Xpku2TS
         TkVvP7Vx34rpX/tPhqlnfO19VNaLa9Cb3eUIzmhL859uefjFTYLmMmd7sO3G6TetOeZs
         73x/dQeplLr5Rr4dd3nvEFxGOJG9mgF1eG3FiX97TKJRY7cihvDAfxoNU87sZDJ01szG
         WjyOxGjWY0+XTZw/+RPsQ3Yso1B8GqshJzR1FiWx4WX2Y/7/PyacsfCFyknDPRIjiVqV
         GmDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r50si11588qtk.431.2017.09.22.07.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 07:59:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPQh-0007u9-7O
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 10:59:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQT-0007pL-6z
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQS-0003zn-FJ
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQS-0003yz-7z; Fri, 22 Sep 2017 10:59:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQP-00077k-SZ; Fri, 22 Sep 2017 15:59:29 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:47 +0100
Message-Id: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/20] ARM v8M: exception entry, exit and security
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
X-TUID: /fMNgdMlL8I8

Another week, another set of v8M patches.
This lot adds:
 * v8M and security extension changes in exception entry and exit
 * the Security Attribution Unit
 * SG and BLXNS instructions
 * secure function return
 * and a couple of fixes for bugs in already-in-master changes

Most of this is just plodding through fairly obvious implementation,
but the handling of the SG instruction is a bit funky (see commit
messages in those patches for detail).

This is very nearly enough to get the mbed uvisor example
running (on a hacked-up mps2 setup): I think the main missing
piece for that is that it expects the banked systick device,
which we haven't implemented yet. (There are also various
missing things that I don't think the uvisor exercises.)

thanks
-- PMM

Peter Maydell (20):
  nvic: Clear the vector arrays and prigroup on reset
  target/arm: Don't switch to target stack early in v7M exception return
  target/arm: Prepare for CONTROL.SPSEL being nonzero in Handler mode
  target/arm: Restore security state on exception return
  target/arm: Restore SPSEL to correct CONTROL register on exception
    return
  target/arm: Check for xPSR mismatch usage faults earlier for v8M
  target/arm: Warn about restoring to unaligned stack
  target/arm: Don't warn about exception return with PC low bit set for
    v8M
  target/arm: Add new-in-v8M SFSR and SFAR
  target/arm: Update excret sanity checks for v8M
  target/arm: Add support for restoring v8M additional state context
  target/arm: Add v8M support to exception entry code
  nvic: Implement Security Attribution Unit registers
  target/arm: Implement security attribute lookups for memory accesses
  target/arm: Fix calculation of secure mm_idx values
  target/arm: Factor out "get mmuidx for specified security state"
  target/arm: Implement SG instruction
  target/arm: Implement BLXNS
  target/arm: Implement secure function return
  nvic: Add missing code for writing SHCSR.HARDFAULTPENDED bit

 target/arm/cpu.h       |  60 ++-
 target/arm/helper.h    |   1 +
 target/arm/internals.h |  23 ++
 hw/intc/armv7m_nvic.c  | 158 +++++++-
 target/arm/cpu.c       |  27 ++
 target/arm/helper.c    | 970 ++++++++++++++++++++++++++++++++++++++++++++-----
 target/arm/machine.c   |  16 +
 target/arm/translate.c |  31 +-
 8 files changed, 1181 insertions(+), 105 deletions(-)

-- 
2.7.4

