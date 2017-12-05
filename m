Received: by 10.223.159.74 with SMTP id f10csp3218711wrg;
        Tue, 5 Dec 2017 11:46:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYFtbHSrIGPGCI8xfDaQGmt9iENNI7ojHhGDOlVDuM7UGUcksL7wDgq7mmTYyvp3D8HFoIP
X-Received: by 10.37.85.194 with SMTP id j185mr7661779ybb.248.1512503216534;
        Tue, 05 Dec 2017 11:46:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503216; cv=none;
        d=google.com; s=arc-20160816;
        b=B/ZpZV+cx7OXpi1GtrtrfFyVEalVnG8KbyZQEkR9xKM6uFvEmvuN8t9c3p1UlJYd6Y
         NOTnRs8jM+3fvo7C46ZiN8P8AYzOJoL82fLvnuZNecM1Z1qHjZf89exok+W/2r02Hesh
         Iixxr3sr/vVKQzAsvDiN0ooy1iwb1JX4SXFKMmUT1CXGZiLcwDa9mJtIodlLnGB42ZYP
         53FwGGQzUpTSWhWq31iu7PTQWpYqRy6f+59w53ntEgFAJzyo4AfGTCLnaUZZV8V18Ga1
         Z6MrwMf7ue6zbqXoG+zTjrcO+aznrO4hlPOPV7Xo+/PhAYpIgVdbfxqQt6rT8J4RT6pf
         1d7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=g5AUyRzlxParE6j08kI+X3NvZSO3mFiFE0CKd0oLD2g=;
        b=JfEbJBfW+vWna8wAwea+AaI88humJzM4FZNh0Snc1gUFH4jNJKNgF7K7/Dohbk1Xz7
         fBHum5QJrniF33KCddTXZpWRrNNzQnEEp58SVvNfLIIocy+Yx+4vBuuQrtIwMT9ZcIzn
         uGtlqeogqV+fNZT2btepOKg+f1rBvM8Ecld1U3jmq+bAYUeGoaYHNV1zdCO00Owcqw7O
         GyI8+HrGAIpraC/8YnKtvYml4T10XSM8kg6TO0j/CMp+l5O57XdKWY2z03/rDkmyo3c9
         RGU7djVp2V1BsoKxjzfL0qsy+qdy3KZQie986p4nndTaro6ZNqY+L7nhZ87TBYi0dnfC
         1YrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s9si232417ywb.762.2017.12.05.11.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:46:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJB9-0000yw-W0
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:46:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJAx-0000yf-Gf
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJAw-0002Hn-5g
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:43 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJAv-0002CW-Ts; Tue, 05 Dec 2017 14:46:42 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAn-00058c-Oe; Tue, 05 Dec 2017 19:46:33 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:20 +0000
Message-Id: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/12] Refactor get_phys_addr() not to return FSR
 values
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 31EQjnzjfBp8

Currently get_phys_addr() and its various subfunctions return a
hard-coded fault status register value for translation failures. This
is awkward because FSR values these days may be either long-descriptor
format or short-descriptor format.  Worse, the right FSR type to use
doesn't depend only on the translation table being walked -- some
cases, like fault info reported to AArch32 EL2 for some kinds of ATS
operation, must be in long-descriptor format even if the translation
table being walked was short format. We can't get those cases right
with our current approach. (We put in a bodge fix so we could at
least run Xen, in commit 50cd71b0d347c7.)
    
This series does a refactoring of get_phys_addr() so that instead
of returning FSR values it puts information in the existing
ARMMMUFaultInfo structure that is sufficient to construct an
FSR value, and the callers then do that using the right condition
for whatever they're doing. I've included Edgar's patch from back
in June that fixes the handling of ATS instructions, which is most
of the point of the refactoring.

Rather than doing it all in one massive unreviewable patch, the
series is structured as:
 * patch 1: add fields to ARMMMUFaultInfo, and the utility functions
   that return a long or short format FSR given a fault info struct
 * patch 2: stop passing an fsr argument to arm_ld*_ptw(), since
   nothing actually looks at the result. (This breaks a cycle
   arm_ldq_ptw()->S1_ptw_translate()->get_phys_addr_lpae()->arm_ldq_ptw()
   which would otherwise make a stepwise refactoring awkward.)
 * patches 3 to 8: for each of the different subfunctions of
   get_phys_addr(), make them fill in the fault info fields instead
   of an fsr value. Temporarily we add calls to arm_fi_to_sfsc()
   and arm_fi_to_lfsc() at the callsites in get_phys_addr(), since
   the callers of get_phys_addr() still need the fsr values. These
   will go away again in a later patch.
 * patches 9 and 10: change the callers of get_phys_addr() to use
   the info in the fault info struct and ignore the fsr value.
 * patch 11: remove the now unused fsr argument (and the temporary
   calls to arm_fi_to_sfsc()/arm_fi_to_lfsc())
 * patch 12: Edgar's patch for ATS PAR format

Arguably it would be good to push the "create the FSR value"
logic further, into the point where the exception is taken.
(This would let us correct the oddity where for M profile we
get an A/R profile FSR value in arm_v7m_cpu_do_interrupt()
which we then have to convert into the appropriate M profile
fault status bits.) However, migration backcompat makes this
tricky, because at the moment we migrate env->exception.fsr,
and so we'd need to have code just to handle inbound migrations
from old QEMU with an FSR and reconstitute a fault info struct.
So I've stopped here, at least for now.

This whole series sits on top of my v8M TT patchset (which also
had to touch some of the get_phys_addr() code). I've pushed it
to this git branch if that's more convenient:

 https://git.linaro.org/people/peter.maydell/qemu-arm.git fsr-in-faultinfo

I have tested a bit (including a Linux KVM EL2 setup), but more
testing would definitely be useful. Stefano: in particular it would
be good to check this hasn't broken Xen again :-)

Based-on: 1512153879-5291-1-git-send-email-peter.maydell@linaro.org
([PATCH 0/7] armv8m: Implement TT, and other bugfixes)

thanks
-- PMM


Edgar E. Iglesias (1):
  target/arm: Extend PAR format determination

Peter Maydell (11):
  target/arm: Provide fault type enum and FSR conversion functions
  target/arm: Remove fsr argument from arm_ld*_ptw()
  target/arm: Convert get_phys_addr_v5() to not return FSC values
  target/arm: Convert get_phys_addr_v6() to not return FSC values
  target/arm: Convert get_phys_addr_lpae() to not return FSC values
  target/arm: Convert get_phys_addr_pmsav5() to not return FSC values
  target/arm: Convert get_phys_addr_pmsav7() to not return FSC values
  target/arm: Convert get_phys_addr_pmsav8() to not return FSC values
  target/arm: Use ARMMMUFaultInfo in deliver_fault()
  target/arm: Ignore fsr from get_phys_addr() in do_ats_write()
  target/arm: Remove fsr argument from get_phys_addr() and
    arm_tlb_fill()

 target/arm/internals.h | 187 +++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c    | 238 +++++++++++++++++++++++++++----------------------
 target/arm/op_helper.c |  82 +++++------------
 3 files changed, 342 insertions(+), 165 deletions(-)

-- 
2.7.4

