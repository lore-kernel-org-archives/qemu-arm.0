Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2799AC5DF9D
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 05:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzSOU-0003zj-Sb; Thu, 27 Aug 2026 01:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOT-0003uE-4z
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:11:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOR-0004Cd-Ha
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:11:16 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so2406931a91.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 22:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807474; x=1788412274; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c0YS6jznp++FiM/vCZWCrH/hv2wY1w+aZ3YBUBkwkEI=;
 b=hcvWiW/+1ViWGzjR79HEO2O8E4SzPuuiHsRHJabmG3VVc5ww1KXKxANMM1HSLjQC59
 LXidZvgfILN2xkg7OlIC0UpDp1l4d9r6KvSn7sga/VoxrCJNLw6AA4s03n53gvix/OOy
 8j18Ww4eFwpIVlW7DdjIeYjbEm3oK2lDWaq6f+2ZrB2oZM4X9MeRT/nbep6Ih3i6mc+F
 3RvS0fYj6Y2FuvbyKNAgP/DSk+UeZzXu/ZnrvE9aqQJOOeBAXZwHEi9W9SRvfUj6tqzz
 3VRXba3JlorJ6rVITMqc9FKhCxpzWcOmg5If2BExoHTkjysm8rZYNqJqUH9ohQMn8STr
 F3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807474; x=1788412274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c0YS6jznp++FiM/vCZWCrH/hv2wY1w+aZ3YBUBkwkEI=;
 b=BQGppZeWZNGegEJjAl2zec6pzysFTfiX5cu3sFREPRD5CDV9TmmNUPogqdevj+A2Nm
 Hqc6wXE73LcO3jyiwRntp+O1V9apdgIjrM49LRMzQp5IsdgiOPg9M1jVX2JTISZ0OXB6
 i8H/1sOyBqgX9yQ+JSULNvuI+GcZOCeoXHHf6nQsKozf61vVK01eT4KUNEghDObL9qOp
 aDzJHM8J3kKTBMmj0lfojv48jDXVr/pL9BDZcPSzRddyRiHEUMfVzGuxqDMs9r0925xy
 Z3aYe8xyd/Lf7LwQqeJ0ffQL5fDQuH1iC18D1QTbYv6maxQ9D/WiLPoLg3rg2TViYNr7
 NGcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpSizdhVXUyUFcbSc3VUKGVGzPmBNscGou+vEjcLsH3LAJRQKqdl7EdCjsaOz/pXT2cGNEe62tltw==@nongnu.org
X-Gm-Message-State: AFuF++k3OdxBvuX1PoKYTPYEeEvfmU0SoBIS8mNppYP432LXdV7xgbbX
 lQqic8PZ2T8BGowB+ca7UlSO9CrkRJxUmeftjbH2CH3dPMomBw6GErpL
X-Gm-Gg: AR+sD1363pk8faX3Gg9dYK9LU1XrRgDoE0JyRvRPysp79kGXVaQK4Lf6nYG5skuaMFI
 VMW3e1BIgGyY2+Wf6Itjz9dnrcyfwn2VrucjyNozxdoMPb/gYG1C0lY1uP4ZNrOAEtbVKm7sqo/
 1kejNi4HWtXhmh1nHWytN/sqSp8RDrrOZdM5oF4cVybbvPyISw6GYTC3ECxV3FwHtlNjE0H2lVK
 O3wPg1KB4DnqWw2rcdbhwYkmpzmiRvkyCiNDK8vOPwk8SXPc5aTWghZzB+GB01a63VBe0kyU9cs
 7nSw/umZkfmo6atGw00Sc4clbSsyBxLNsS12xKOvn4+uH6FADCALuj0Qh/NnKwVIF0y3t/6XlIV
 6ByrAKFtXhtOi+PcTMyI54zOOul7Xy0F+3yS7HQVfgBnF9SCOdX2YZPykKWKB6S6gZhzFcnQowJ
 peoa1L+zlCupkvXcDMYopPijr3zsLwhKaD0lSlPWvEkbMeOW8VXGc9zOpq/A8uuJ3aGOPB+4eis
 3ZuupxOyxBqKqNDtrO46ksG/xujkvVDddh53w1KJq0uWxnVFnUfs6x49zNOteQiPAHB28kv7MLS
 +Vfp8oBWMtOJwP8Jpadn
X-Received: by 2002:a17:90b:3cc3:b0:38f:18f9:785 with SMTP id
 98e67ed59e1d1-3966d20cde1mr26855588a91.8.1787807474185; 
 Wed, 26 Aug 2026 22:11:14 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:11:13 -0700 (PDT)
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
Subject: [PATCH 10/12] tests/tcg/riscv64: Enable vectorised memory test
Date: Thu, 27 Aug 2026 14:39:49 +0930
Message-ID: <20260827050953.67184-11-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1032.google.com
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

Build memory.c a second time with -march=rv64gcv -O3, similar to
aarch64's memory-sve, so the memory test checks RVV loads and
stores, including across page boundaries.

Run it under -cpu rv64,v=true.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/Makefile.softmmu-target | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 3f2a8ed16142..301a6e6e5700 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -76,6 +76,14 @@ EXTRA_RUNS += $(MULTIARCH_RUNS)
 # Default is zicclsm=true, so misaligned accesses must work
 memory: private CFLAGS += -DCHECK_UNALIGNED=1
 
+memory-rvv: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(call quiet-command, \
+	 $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) $(CRT_OBJS), CC, $@)
+memory-rvv: private CFLAGS += -DCHECK_UNALIGNED=1 -march=rv64gcv -O3
+run-memory-rvv: QEMU_CPU = rv64,v=true
+
+TESTS += memory-rvv
+
 # Simple Record/Replay Test
 .PHONY: memory-record
 run-memory-record: memory-record memory
-- 
2.47.3


