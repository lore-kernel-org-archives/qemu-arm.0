Received: by 10.25.221.202 with SMTP id w71csp2956544lfi;
        Mon, 7 Aug 2017 07:39:43 -0700 (PDT)
X-Received: by 10.200.14.72 with SMTP id j8mr1108756qti.124.1502116782931;
        Mon, 07 Aug 2017 07:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502116782; cv=none;
        d=google.com; s=arc-20160816;
        b=YtRFTAJcyWsb/xyTq0Ir9wm0II4RhdmtX9JQWysZzEBUKVzd7dySi8XbKrGpynd+AO
         63YUb/JL4VE1+zsEy3CXqQRnt/QTDVgnryIKwoalcDWy4zfmFCTgjn49LH3F0Rn0V2w5
         QSzbQ2oaEVP/qAqmcNkIzVS0FnsGRXaWNxwIyTS+BqWvqv4I+Nrx9T23PyRd9ptpfdU7
         8ay75bLb+QpjH8ZGh5R30ZAIFa22vUMf3XN3tMBd6q9fU6J/KYPWkmJqsLLmibuvEjg7
         bw+2B/qKzethSE2yyxs5hhNKYzub1Ty48WQwN80q8ED5Yj986+qnRavW8UbU1XTyEKDo
         ZMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8GKZxPTwinxspl/jkkDoFDPVyEaJFnfU7B2LBzhyh3E=;
        b=vK9zOr0P+ELsST1JY/g4Cf1pF4/kwhyvCkJ2xd5ruFjMg962kF4SCPJ8L5IifNjEfD
         B4pnHI72FhAuh2LLUoJ8tYot+MK/f/muvQjOlioC93Ez6BxsWGWcbgLM2cQ5ROU3NBI2
         hQ5BFolpFr4Apm2n0NiTVljXAjRb+2BShWaq7YsN78qvNi14d+DGf12posvK73qGa0P4
         nT0BM4Y73YFjx8lG8t4/gIMYRzxRToq1Q+N19at59oczK+rzmrmEq9Lze8qlsR7BtCDC
         sJedcrldiwJ+ZqtRo0wf/rF35DLfGuJShqGEzBcolefnbYiVUNY3hAOcii3eJwgXbgU3
         TLXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j56si7470408qta.74.2017.08.07.07.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2017 07:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dejC0-0002hz-BJ
	for alex.bennee@linaro.org; Mon, 07 Aug 2017 10:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dejBq-0002hJ-Fn
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 10:39:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dejBl-0006QQ-Bi
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 10:39:30 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dejBl-0006M3-3Y; Mon, 07 Aug 2017 10:39:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dejBc-0004Oy-7s; Mon, 07 Aug 2017 15:39:16 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  7 Aug 2017 15:39:13 +0100
Message-Id: <1502116754-18867-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
References: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/2] loader: Handle ELF files with overlapping
 zero-initialized data
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
X-TUID: AWH4cgcJeyVP

For embedded systems, notably ARM, one common use of ELF
file segments is that the 'physical addresses' represent load addresses
and the 'virtual addresses' execution addresses, such that
the load addresses are packed into ROM or flash, and the
relocation and zero-initialization of data is done at runtime.
This means that the 'memsz' in the segment header represents
the runtime size of the segment, but the size that needs to
be loaded is only the 'filesz'. In particular, paddr+memsz
may overlap with the next segment to be loaded, as in this
example:

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

Support ELF files using this scheme, by truncating the
zero-initialized part of the segment if it would overlap another
segment. This will retain the existing loader behaviour for
all ELF files we currently accept, and also accept ELF files
which only need 'filesz' bytes to be loaded.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/elf_ops.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index a172a60..2e526d3 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -362,6 +362,54 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                     goto fail;
                 }
             }
+
+            /* The ELF spec is somewhat vague about the purpose of the
+             * physical address field. One common use in the embedded world
+             * is that physical address field specifies the load address
+             * and the virtual address field specifies the execution address.
+             * Segments are packed into ROM or flash, and the relocation
+             * and zero-initialization of data is done at runtime. This
+             * means that the memsz header represents the runtime size of the
+             * segment, but the filesz represents the loadtime size. If
+             * we try to honour the memsz value for an ELF file like this
+             * we will end up with overlapping segments (which the
+             * loader.c code will later reject).
+             * We support ELF files using this scheme by by checking whether
+             * paddr + memsz for this segment would overlap with any other
+             * segment. If so, then we assume it's using this scheme and
+             * truncate the loaded segment to the filesz size.
+             * If the segment considered as being memsz size doesn't overlap
+             * then we use memsz for the segment length, to handle ELF files
+             * which assume that the loader will do the zero-initialization.
+             */
+            if (mem_size > file_size) {
+                /* If this segment's zero-init portion overlaps another
+                 * segment's data or zero-init portion, then truncate this one.
+                 * Invalid ELF files where the segments overlap even when
+                 * only file_size bytes are loaded will be rejected by
+                 * the ROM overlap check in loader.c, so we don't try to
+                 * explicitly detect those here.
+                 */
+                int j;
+                elf_word zero_start = ph->p_paddr + file_size;
+                elf_word zero_end = ph->p_paddr + mem_size;
+
+                for (j = 0; j < ehdr.e_phnum; j++) {
+                    struct elf_phdr *jph = &phdr[j];
+
+                    if (i != j && jph->p_type == PT_LOAD) {
+                        elf_word other_start = jph->p_paddr;
+                        elf_word other_end = jph->p_paddr + jph->p_memsz;
+
+                        if (!(other_start >= zero_end ||
+                              zero_start >= other_end)) {
+                            mem_size = file_size;
+                            break;
+                        }
+                    }
+                }
+            }
+
             /* address_offset is hack for kernel images that are
                linked at the wrong physical address.  */
             if (translate_fn) {
-- 
2.7.4

