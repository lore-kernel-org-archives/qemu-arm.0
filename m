Received: by 10.25.221.202 with SMTP id w71csp2956759lfi;
        Mon, 7 Aug 2017 07:39:53 -0700 (PDT)
X-Received: by 10.200.48.49 with SMTP id f46mr1192539qte.88.1502116793684;
        Mon, 07 Aug 2017 07:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502116793; cv=none;
        d=google.com; s=arc-20160816;
        b=mEQnrvfexKZXtJDheXhx6JEIqdwPO6Mfrnl+TZXOYFelqsH014YlQxpLeagQHm3a4+
         mg2Gm4qEL6xJ3o/9zY++VT6kEXjH2nioyIKWQeUPavt/derGPTjRb+tZJTVolp7dDAoa
         /3YqbVFm5dZBG9ma0ZUuOYvbP3vxhVVGdY0XfsWtBbxVPcrkL7rdZDZFRebtqBrl7yKc
         ttq/k6IeWvEBX4Qy/G2wZUDLP01oV7IYiFgdI7EpScUwAneRs90Ki2X0gJhWToPzEnYi
         QqVIZZ9z+C8t7ha67Oolj6w30B8OdLcBvtXRPxR4HqPi9GXfVAyPzkZzVvKvA7xUUxcW
         F19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=pcKyQxj0uJuNvGtxAFt9SiHbyAXI4abojkDZ2Jn95f0=;
        b=EZqyeYwdpJIjecbbmqJoNrYFztKNHdaCbdE1rRhyqx16YMCwIplFI7CwqODNN2y1zy
         WJAlJb3tJ/ESJDqu9H8Aj/ctEn0DA0N6c02zwTjZMHiD4D5jrmICS85Mi2Op+SB0ssbn
         YSCcrL2H7gSAbag3ZlRkUZkS1q48n2g/gBMByMxI2hPSq2QYbGxV3FgbcvTKvdROahml
         hjrwZJl1YmNxY7EI1spjYbGXCvXtuxXmCRFV8M4ASFrYH9o0fcf3fTotxE9EdYY/ZDcE
         B4tEev1QcKx4klA3+U9fPpiPC1pdixgCjJAU8IZddywWMUwBfkJ8ObYXSs2IfcSagepa
         a3GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s35si7418982qtc.205.2017.08.07.07.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2017 07:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dejCB-00036u-4N
	for alex.bennee@linaro.org; Mon, 07 Aug 2017 10:39:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dejBv-0002hl-9C
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 10:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dejBq-0006T2-Br
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 10:39:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dejBq-0006M3-5E; Mon, 07 Aug 2017 10:39:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dejBb-0004Ol-He; Mon, 07 Aug 2017 15:39:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  7 Aug 2017 15:39:12 +0100
Message-Id: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] loader: Handle ELF files with overlapping
 zero-init data
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
Cc: Hua Yanghao <huayanghao@gmail.com>, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yskTSJPlPJNL

For embedded systems, notably ARM, one common use of ELF file
segments is that the 'physical addresses' represent load addresses
and the 'virtual addresses' execution addresses, such that the load
addresses are packed into ROM or flash, and the relocation and
zero-initialization of data is done at runtime.  This means that the
'memsz' in the segment header represents the runtime size of the
segment, but the size that needs to be loaded is only the 'filesz'. 
In particular, paddr+memsz may overlap with another segment to be
loaded, as in this example:

0x70000001 off    0x00007f68 vaddr 0x00008150 paddr 0x00008150 align 2**2
         filesz 0x00000008 memsz 0x00000008 flags r--
    LOAD off    0x000000f4 vaddr 0x00000000 paddr 0x00000000 align 2**2
         filesz 0x00000124 memsz 0x00000124 flags r--
    LOAD off    0x00000218 vaddr 0x00000400 paddr 0x00000400 align 2**3
         filesz 0x00007d58 memsz 0x00007d58 flags r-x
    LOAD off    0x00007f70 vaddr 0x20000140 paddr 0x00008158 align 2**3
         filesz 0x00000a80 memsz 0x000022f8 flags rw-
    LOAD off    0x000089f0 vaddr 0x20002438 paddr 0x00008bd8 align 2**0
         filesz 0x00000000 memsz 0x00004000 flags rw-
    LOAD off    0x000089f0 vaddr 0x20000000 paddr 0x20000000 align 2**0
         filesz 0x00000000 memsz 0x00000140 flags rw-

where the segment at paddr 0x8158 has a memsz of 0x2258 and
would overlap with the segment at paddr 0x8bd8 if QEMU's loader
tried to honour it. (At runtime the segments will not overlap
since their vaddrs are more widely spaced than their paddrs.)

Currently if you try to load an ELF file like this with QEMU then
it will fail with an error "rom: requested regions overlap",
because we create a ROM image for each segment using the memsz
as the size.

This patchset adds support for ELF files using this scheme, by
truncating the zero-initialized part of the segment if it would
overlap another segment.  This will retain the existing loader
behaviour for all ELF files we currently accept, and also accept ELF
files which only need 'filesz' bytes to be loaded.

Patch 2 deals with a vaguely related issue which is that if the ELF
file specified a zero-length segment we would happily try to create
a zero-length ROM blob, which could then falsely trigger the
ROM-overlap check. (The zero-length case is more common after patch
1 has done its truncation thing, but I have seen real-world ELF
files with both filesz and memsz zero...)

thanks
-- PMM

Peter Maydell (2):
  loader: Handle ELF files with overlapping zero-initialized data
  loader: Ignore zero-sized ELF segments

 include/hw/elf_ops.h | 72 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 7 deletions(-)

-- 
2.7.4

