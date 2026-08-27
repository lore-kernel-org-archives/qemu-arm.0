Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996A2C5DF9D
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 05:13:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzSOs-0004h9-Ah; Thu, 27 Aug 2026 01:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOf-0004D5-BP
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:11:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOd-0004FX-AQ
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:11:28 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-38e347638adso2193367a91.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 22:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807486; x=1788412286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JSgAqHr1NOvqwxx08subUkX/lMIs5ZKn3UbhmDEC214=;
 b=NvvKn5L451EcW4L8TxNKXt8wOex5MBmOWhSX6b3BFl3q7b/HjxBgnCc4CaHklM9tJ0
 byCZSB4KXyGvZDArdHEZCRRuX8gx6nwBon4U0xSpITagDg9naM0lVvZABTORBBINL456
 rMahcfWEnVqnRCXS+Q1oiV+3OilQoOuunY/JKmWPtvCwEVhwadvQmLtdvs0yUPribTdS
 +oavZzU/E7ycJ6JfEL3OdeM/EB5+S4FJnEqs5pANChunETvmhpY/JKVZAzhzVPvGTdn+
 N8GJbCym5JZ2DkFSnP1v9OsoQO8KcjxEEtd1I+BPmejbhKr2hhNfyICtu5g6xTkjXtBe
 VHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807486; x=1788412286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JSgAqHr1NOvqwxx08subUkX/lMIs5ZKn3UbhmDEC214=;
 b=KT2nHBK5GgFBgNreLUkruFtpqwq/9DuGDVfVdYyRW8PvnqDLsLzvNgbnShpyOmaBvs
 yGCB8xrVAM3hvsZW3js3mqbL2R59qEWSks7Jz/1AzJk2JUx7yREMGeISb0SwLhwlYULh
 J1fksWqpC4a9pioNdKwcW/R37lpUT3ZsejpCouIMBr8xIWNKVXf/fH/o5h0+6fGB5gEo
 TNHlWlx33sew392bn80BbQnX8MKjI5EothVvpC+T66uE/ZDjElw5bju4xbt+i9VivyZV
 RlOu/N6mJKeGCMyiL/sPw5pEyadtc5laQvPoVvFMhiCH0mdWm7qZuuNyv8UTyb08pjQF
 0lEQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqAO48tQa9xHwX23q4T2JOvx5Ck3tWkkqKUa/DCEf70hrFvUbCm/bVkMs/D6w22E9K3NR/B2dr2Qg==@nongnu.org
X-Gm-Message-State: AFuF++mBoRqwlsK+yJZvl8ewTzGP6jdd2isetE/2c4NOAhovNf6E+8w0
 nEm4zwH2HiXCnBHGUFNR7prlHXHRixRLJX3xD9VzPb+jOPX2jg3ojh/7
X-Gm-Gg: AR+sD11xs5q9qmN99k4ST6kVj8hCXCxImSjrAjjcQ9KJbIj9tTHz6JD3j1aZjq31DxW
 eAphIq5GfPaTG8k6iXoUVgsgxjUabxC6kmE+NBbqe0fo8uZGIbw8T3gxeA4ju+4dquDVt4sCCtW
 Utz8kwiwGgUfc4x1q0Vvu+fUEQhOuKjhN3NaQrqAYt0SXT6WRUK+OTzpfXz9EmG8sWMACzLjylo
 SDWd8SnvR8CBOcT2ky79473Gfp0PgMqho0v3QCDLoZ27xkIhYJ0keYNaXvChXue+ZqlQPeGhQNk
 fkxQ1TDTYnpAwjp0nUduis8ipWfSQiDW0DSrTBa7xjXR+idhYi46mruo+XOWznHlzzq/LVWcCEl
 R7OqpzW5rxHfo00l9LPA8x5846cRd3vyf8LZ6AP3HIvfxHkRHYhyKyWnuOcX0aIj7DuWDDZ95sE
 fpNQ1vGAAxikYQF8LrKa7pryQSxeVZ2TUABp8aDY3YNo4n/UyNn+Zg5EzCiEJMWAy1r/4Osl3xY
 muQut4UxKn0UzWkZIBvtMCtn3s9ZuPLvDcFfDYCX1pFqru0EszIr30PuhPIjntCi2zilq4Dbgs9
 zr0zkyA/c1lSBBIxsW4K
X-Received: by 2002:a17:90b:586d:b0:396:4cbf:45bc with SMTP id
 98e67ed59e1d1-3966d491c45mr26485905a91.16.1787807485965; 
 Wed, 26 Aug 2026 22:11:25 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:11:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 12/12] tests/tcg: Check vector memory tests contain vector ops
Date: Thu, 27 Aug 2026 14:39:51 +0930
Message-ID: <20260827050953.67184-13-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Disassemble the tests and count the SVE or RVV memory access. Delete the
binary when the check fails otherwise a subsequent run will not run the
check and silently succeed.

    CHECK   memory-rvv contains 7 vector loads and 7 stores

    CHECK   memory-sve contains 20 vector loads and 17 stores

This is a coarse check and could be improved by checking specific
functions, and using something more precise than an opcode grep.
However, it would have caught the bug fixed in "tests/tcg/multiarch: Fix
vectorisation of memory test", which makes it worthwhile.

Skipped when no cross objdump was found.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/Makefile.target                 | 8 ++++++++
 tests/tcg/aarch64/Makefile.softmmu-target | 1 +
 tests/tcg/riscv64/Makefile.softmmu-target | 1 +
 3 files changed, 10 insertions(+)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index d4dd0fec650d..a5b694d2f21c 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -79,6 +79,14 @@ conditional-diff-out = 							\
 		$(call diff-out,$1,$2), 				\
 		$(call skip-test,"$1 check","no reference"))
 
+# Check an ELF for vector load ($1) and store ($2) patterns.
+# Deleted on failure so the check runs again on the next make.
+check-vectorised = $(if $(OBJDUMP), \
+	$(call quiet-command, \
+	    ld=$$($(OBJDUMP) -d $@ | grep -cE '[[:space:]]$1'); \
+	    st=$$($(OBJDUMP) -d $@ | grep -cE '[[:space:]]$2'); \
+	    printf "  %-7s %s\n" CHECK "$@ contains $$ld vector loads and $$st stores"; \
+	    test "$$ld" -gt 0 && test "$$st" -gt 0 || { rm -f $@; exit 1; }))
 
 # Tests we are building
 TESTS=
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 196a2afa50ee..99ad1a2799d7 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -50,6 +50,7 @@ memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
 memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) boot.o
+	$(call check-vectorised,ld1[bhwds],st1[bhwd])
 
 memory-sve: private CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3
 
diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 301a6e6e5700..5262007e39a5 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -79,6 +79,7 @@ memory: private CFLAGS += -DCHECK_UNALIGNED=1
 memory-rvv: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 	$(call quiet-command, \
 	 $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) $(CRT_OBJS), CC, $@)
+	$(call check-vectorised,vle,vse[0-9])
 memory-rvv: private CFLAGS += -DCHECK_UNALIGNED=1 -march=rv64gcv -O3
 run-memory-rvv: QEMU_CPU = rv64,v=true
 
-- 
2.47.3


