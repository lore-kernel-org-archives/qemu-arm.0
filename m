Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D56C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 05:11:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzSOF-000354-7S; Thu, 27 Aug 2026 01:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOD-0002yi-0q
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:11:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOA-00048q-Bg
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:11:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2d712281f8bso15822985ad.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 22:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807457; x=1788412257; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0gZE6drI4G2uqSpEewl+0fUTFIgcDNV+tI0N/a53trk=;
 b=WGIDxJwsFYm0VbnaBrtURmXXKDg6ZHTmxNVfvZ63FUlzGr1IX8keGQ1Zh1GnzhSIYh
 Yt8bpP0NqUJJOJIW5p79R0gp7SohLXNCI6OS9PXOOgYjSpHwwDaqTetPz2/SInweZU63
 5IfJ8ZmJ7ZiLLZikku1e/ac7d1ljlKZLtyRs0LvjENUgMA72yQiWRWBwudHLODX/Hecx
 SbYu8TPEkaQdIb+R9AQe7HNuVb98fK9JKbpBHWWP2rE8JKFIIaKq6mgk4H8WkUzR2HNB
 h5oQFWeuzG+KidEOytj/Sz5TAMPiTSWkrkrvXnf16xaMyqxatEYd+QoU+qlubaEw2z+n
 LrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807457; x=1788412257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0gZE6drI4G2uqSpEewl+0fUTFIgcDNV+tI0N/a53trk=;
 b=TZOD7+gdhT84sEsAz1ChvKr6tSZwgqBcYDJByP5bNATPNWMoc1aSunCLvN8Srom6eP
 lVPp0VNFzS3ejBAI3c568wMacESOQwKjHPwDjkIAkFKgyUxK7SZlAjE8FqmpGzxIErge
 8fZDmTDaqJcwzRfw6TAXqxrwfiEqPaUD1IDGmVRwP2ypk+Q6xcBYc0AC3inB3AU1XcUw
 yTLA+DNcPahM3ozPoinr9dLe1YObw55HUp/y/vZBj2L6w4CBjZbnQb+2MFWpVg6zTjHB
 d5dkXy1k6wNDHjsak39Dj9OAkvu9+Q86t3O4AfGHGwFi2AX0dN5XSRXtnYfp0Nul2CQE
 Vu9w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqznkrQhN5AtGnttPouc0o2obmYlwN3EIYDIFrm0y8ZCK7AwbKwrq5QoCuiSyfHr1fdev17X5Y+JA==@nongnu.org
X-Gm-Message-State: AFuF++nn0FtIfE7orHM4iEtvF2Y+jjrQ4hFadtGj/LZR1QUr4xIDqWXT
 1wFOzE+H+nAyRZLNiGuJox2753E6C6iHPyukJ0FLf8MInXW21ncXt6HE
X-Gm-Gg: AR+sD12B2oUnwszkFlfwPwDLaf6LnmfPrEX2qDik32NfeHI9B5SEDjtyFX+Mn4pjoRl
 wL1oddXCpuKdLh9klgtc7vym0gmiPzfIy7hI3HwGTcRwGIJFOax8Xssj/A7RDklFom3tNZRhtOj
 A06Gt/EZUQCZeSnKgbSbiYgdvGUZdEaOapi67DuKFgy1qo7+J1jq6p6ti0jN0UlFw9NoawvO0zE
 0pXR0wwAqvGcYXr2T3j0zdmLD0qLqf7W4eMio3BnzKNtDEJwZrRBsXFdFevTkyWgQwbfLFCYfnz
 XBcD9rgKsf0tdGDQsisqkQNV5ew3hh8XG3c5fcFCs3bccppIXXBaDLuc2DvmARKuAnlWI17cErn
 rRvwN4OOoLP+8YJqA2TavXNP+XJY6GJGMVfuBHaPTivFMyFftP4a6MUcTtd7TuhigqLxbdVsnDV
 KE4fYko21Hk917eAK9/z0hTI4y/ugUWkhoM5LZWsGbbTHoen0m8NH2enwgC+mZWYZl+L95jbW25
 KZlRPuJKnIlYetYqRx3560YVPdzx9P+o30SAdUHhOjBKz4K46fnL4anYiYa4ZsiFPjz9ukfjjbw
 lzUPvusrL+FhoAuWCsZ+
X-Received: by 2002:a17:90b:2792:b0:395:4290:46e0 with SMTP id
 98e67ed59e1d1-3966d20cd6fmr25206321a91.5.1787807456662; 
 Wed, 26 Aug 2026 22:10:56 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:55 -0700 (PDT)
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
Subject: [PATCH 07/12] tests/tcg/riscv64: Enable memory record and replay test
Date: Thu, 27 Aug 2026 14:39:46 +0930
Message-ID: <20260827050953.67184-8-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62f.google.com
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

Run the memory test under icount record and replay, copied from aarch64.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/Makefile.softmmu-target | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 82e8fe2664b0..3f2a8ed16142 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -75,3 +75,22 @@ EXTRA_RUNS += $(MULTIARCH_RUNS)
 
 # Default is zicclsm=true, so misaligned accesses must work
 memory: private CFLAGS += -DCHECK_UNALIGNED=1
+
+# Simple Record/Replay Test
+.PHONY: memory-record
+run-memory-record: memory-record memory
+	$(call run-test, $<, \
+	  $(QEMU) -monitor none \
+		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
+		  -icount shift=5$(COMMA)rr=record$(COMMA)rrfile=record.bin \
+		  $(QEMU_OPTS) memory)
+
+.PHONY: memory-replay
+run-memory-replay: memory-replay run-memory-record
+	$(call run-test, $<, \
+	  $(QEMU) -monitor none \
+		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
+		  -icount shift=5$(COMMA)rr=replay$(COMMA)rrfile=record.bin \
+		  $(QEMU_OPTS) memory)
+
+EXTRA_RUNS += run-memory-replay
-- 
2.47.3


