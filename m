Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5624031wrt;
        Tue, 16 Oct 2018 02:37:35 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62tn2LKQH++RTYvmBI7EdR0ritwqNISKGGk/Xk+kdm4iQ8zOVBc0/0SuhJH9wiOVBKTNztC
X-Received: by 2002:ad4:4143:: with SMTP id z3mr11992586qvp.18.1539682655081;
        Tue, 16 Oct 2018 02:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539682655; cv=none;
        d=google.com; s=arc-20160816;
        b=ADiigeTtT21wzqraIzqfDCLLYDtpUR8MNDZ8dnnttbTvat/6JVqh/PeFGmouK8tG5S
         3h9JNIk4O/iGU/bz/E0YVE5QeyndwDZ57rZXYovZdh7GjE5avAPyKMvo9c1d6RbAb073
         2itx21QhvRafVXHacNfQcMZeiBtfx40bgsC4cTmmANk1slG7bRqRZL5xX2xpVjLqpaVf
         t69R23s6jot8Ygq2LwaOSNG+RCTT97L000z4kF9JXaEzyFL/1xlgt2yD7sD3RZKXXnIx
         6c/ysvHz4woDdk0lwqqABBY7K8C6fTMRYVi1Mh5Jc2vHo4LrITQ/6nXXIywVQlxmq2K7
         IaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=vKKDpmWN/34vWO91RistmXTOb7sdY96nkMDgBK+/U2k=;
        b=oVAdBtGEy8wZFI4mYA0snFYblzYoH2PzqSp61o41YkQi1MqPk8uHDP3xGJhqqH0Opw
         0Dh6RvXTY8ZH6aWoMv8YJ9DiVxL1Fgagp5AS1iAB3MHjUscWYSal6AeEBpEsDsQmoO8h
         L0Wb8zOuG1+x2Y7rnu/SO2LSb2BPKJ9Pk2MeOVpKSgBagnLqLkBampjxx6SoWSES9laP
         QT1L93+5xkN7gY0gjd8bxL9tu3j4ZFthQnGztWiQxo4kg+VRdK5QvTasiF+FMQ25qJ52
         5ZoTMKy6Lc/dcIeLH0PP8nM2N5P3eTWj0ko7PvEErWntPcGVI/4CBlGBKZa/094oH3vZ
         vHvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198-v6si2678823qkb.168.2018.10.16.02.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 02:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCLnC-0007G6-KK
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 05:37:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gCLmt-0007Fn-Ni
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 05:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gCLms-0000wg-Vp
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 05:37:15 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gCLms-0000qT-Of; Tue, 16 Oct 2018 05:37:14 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gCLmk-0003Xd-NR; Tue, 16 Oct 2018 10:37:06 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Oct 2018 10:37:01 +0100
Message-Id: <20181016093703.10637-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] target/arm: fix some ATS* bugs
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
X-TUID: Cu17C6GaYHsU

This small patchset fixes a couple of bugs in our ATS insn
handling:
 * for faults reported to the 64-bit PAR we were not
   setting the S and PTW bits to indicate stage 2
   fault information
   (NB: stage 2 faults aren't reported with 32-bit
   PAR formats so there's no need to change the 32-bit
   code path)
 * ATS1Hx were implementing the wrong thing (doing a
   stage 2 lookup rather than an EL2 stage 1 lookup)

The major missing bit of ATS at the moment is that a stage
2 fault during execution of an NS-EL1 ATS insn that asks
for a stage 1 lookup should cause a trap to EL2. I started
to sketch out some code to do that, but I realised by
putting an assert() in it that I didn't have any guests
that actually hit the problem, so put it on the back burner.
If anybody does hit that missing feature, feel free to send
me a test case :-)

Based-on: <20181012144235.19646-1-peter.maydell@linaro.org>
("[PATCH 00/10] target/arm: more HCR bits, improve syndrome reporting")
but only to avoid a textual conflict in the patch context.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Set S and PTW in 64-bit PAR format
  target/arm: Fix ATS1Hx instructions

 target/arm/helper.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.19.0

