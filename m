Received: by 10.25.0.144 with SMTP id 138csp800739lfa;
        Mon, 10 Apr 2017 03:45:23 -0700 (PDT)
X-Received: by 10.200.48.45 with SMTP id f42mr7659416qte.206.1491821123246;
        Mon, 10 Apr 2017 03:45:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si4010139qkb.50.2017.04.10.03.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 03:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxWoy-0001j4-A0
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 06:45:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWoj-0001Ui-DR
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWoi-00084q-69
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:05 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxWoh-000826-Uk; Mon, 10 Apr 2017 06:45:04 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxWji-0005QE-2T; Mon, 10 Apr 2017 11:39:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 11:39:46 +0100
Message-Id: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/7] arm: Implement M profile exception return
 properly
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QTOHfnJXU76l

On M profile, return from exceptions happen when privileged code
executes one of the following function call return instructions:
     * POP or LDM which loads the PC
     * LDR to PC
     * BX register
and the new PC value is 0xFFxxxxxx.
    
QEMU tries to implement this by not treating the instruction
specially but then catching the attempt to execute from the magic
address value.  This is not ideal, because:
 * there are guest visible differences from the architecturally
   specified behaviour (for instance jumping to 0xFFxxxxxx via a
   different instruction should not cause an exception return but it
   will in the QEMU implementation)
 * we have to account for it in various places (like refusing to take
   an interrupt if the PC is at a magic value, and making sure that
   the MPU doesn't deny execution at the magic value addresses)
    
Drop these hacks, and instead implement exception return the way the
architecture specifies -- by having the relevant instructions check
for the magic value and raise the 'do an exception return' QEMU
internal exception immediately.

I realised when I was looking at the MPU patches that the current
mechanism was a bit awkward and needed still more workarounds in
code that really shouldn't have to care about exception-return.
And it turns out that implementing it properly doesn't actually
have very much runtime cost at all.

NB: this is technically speaking a migration compatibility break,
if you were unlucky enough to migrate just after an exception
return when the PC value was one of the magic values, since the
new QEMU will not treat this as "now do exception return".
However we don't guarantee migration compatibility for M profile,
so that's OK.
    
The effect on the generated code is minor:
    
     bx lr, old code (and new code for unprivileged mode):
      TCG:
       mov_i32 tmp5,r14
       movi_i32 tmp6,$0xfffffffffffffffe
       and_i32 pc,tmp5,tmp6
       movi_i32 tmp6,$0x1
       and_i32 tmp5,tmp5,tmp6
       st_i32 tmp5,env,$0x218
       exit_tb $0x0
      x86_64 generated code:
       0x7f2aabe87019:  mov    %ebx,%ebp
       0x7f2aabe8701b:  and    $0xfffffffffffffffe,%ebp
       0x7f2aabe8701e:  mov    %ebp,0x3c(%r14)
       0x7f2aabe87022:  and    $0x1,%ebx
       0x7f2aabe87025:  mov    %ebx,0x218(%r14)
       0x7f2aabe8702c:  xor    %eax,%eax
       0x7f2aabe8702e:  jmpq   0x7f2aabe7c016
    
     bx lr, new code when privileged:
      TCG:
       mov_i32 tmp5,r14
       movi_i32 tmp6,$0xfffffffffffffffe
       and_i32 pc,tmp5,tmp6
       movi_i32 tmp6,$0x1
       and_i32 tmp5,tmp5,tmp6
       st_i32 tmp5,env,$0x218
       movi_i32 tmp5,$0xffffffffff000000
       brcond_i32 pc,tmp5,geu,$L1
       exit_tb $0x0
       set_label $L1
       movi_i32 tmp5,$0x8
       call exception_internal,$0x0,$0,env,tmp5
      x86_64 generated code:
       0x7fe8fa1264e3:  mov    %ebp,%ebx
       0x7fe8fa1264e5:  and    $0xfffffffffffffffe,%ebx
       0x7fe8fa1264e8:  mov    %ebx,0x3c(%r14)
       0x7fe8fa1264ec:  and    $0x1,%ebp
       0x7fe8fa1264ef:  mov    %ebp,0x218(%r14)
       0x7fe8fa1264f6:  cmp    $0xff000000,%ebx
       0x7fe8fa1264fc:  jae    0x7fe8fa126509
       0x7fe8fa126502:  xor    %eax,%eax
       0x7fe8fa126504:  jmpq   0x7fe8fa122016
       0x7fe8fa126509:  mov    %r14,%rdi
       0x7fe8fa12650c:  mov    $0x8,%esi
       0x7fe8fa126511:  mov    $0x56095dbeccf5,%r10
       0x7fe8fa12651b:  callq  *%r10
    
which is a difference of one cmp/branch-not-taken. This will
be lost in the noise of having to exit generated code and
look up the next TB anyway.
    
Patches 1 and 2 are minor bug fixes which remove code paths that
incorrectly called gen_bx(), so we don't have to consider them when
looking at which gen_bx() calls need to be changed to call
gen_bx_excret().  Patches 3 to 5 are minor preliminary refactorings;
patch 6 is the meat of the series; finally patch 7 removes the old
mechanism.

thanks
-- PMM

Peter Maydell (7):
  arm: Don't implement BXJ on M-profile CPUs
  arm: Thumb shift operations should not permit interworking branches
  arm: Factor out "generate right kind of step exception"
  arm: Move gen_set_condexec() and gen_set_pc_im() up in the file
  arm: Move condition-failed codepath generation out of if()
  arm: Implement M profile exception return properly
  arm: Remove workarounds for old M-profile exception return
    implementation

 target/arm/translate.h |   4 ++
 target/arm/cpu.c       |  43 +------------
 target/arm/translate.c | 163 ++++++++++++++++++++++++++++++++-----------------
 3 files changed, 113 insertions(+), 97 deletions(-)

-- 
2.7.4

