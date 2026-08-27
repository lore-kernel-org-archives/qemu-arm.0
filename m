Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA66CC5DF9D
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 05:12:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzSNm-0002aC-6l; Thu, 27 Aug 2026 01:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNj-0002Yl-GG
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:10:31 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNg-00042Q-Ro
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:10:31 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-396750cfee6so1499774a91.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 22:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807427; x=1788412227; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5bkCYeMhO7/zC3uMA+VZFpZtFUWR2ZdudiB4U3VtuDk=;
 b=C+VFqoSJx6ySmnz0hGIs9tEavgHwK5algRgh3gVPwdmg90stCx/m5uyZtIlggQLrlU
 RZC+6EvcbCJ/wtCckrynkLhVf5laCuJcrZ70M9Am9qnDZXBciK+HVFegnuybonXsylvv
 dyAWuyoPn1jQarw/jQYGF294MER+lEeve1Cav19nuQQJ2QQhGByQEz9eyfRyyR7XFh+e
 2GKH2Nf0wakedQ1bmxm7mn82jRFLflOnJiIA1x4rQNNiiZP5KQYZqnGsp1JHHgnlJJMW
 lii5PDNulC+u8kOGw6XAZbuME860QOAztej+2D6MIP477lMuHCCJ1ziWdw1Aup//hCy9
 cUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807427; x=1788412227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5bkCYeMhO7/zC3uMA+VZFpZtFUWR2ZdudiB4U3VtuDk=;
 b=sygb3BXRiVo3pBcMKZ2FmSk65rzC5dMIRCOoViNyQoYAqunAJxXltWmcopIARTzQON
 ezC8CT1Mwl26IU3PsXxxYrtyND8+urM+sdPGmFXJpSGDkKLtFh2PP5K1E2CIdl/zcxH2
 5D5gT/hYW5TDZVM01dBsueRe2QOAFbI0MXJ3BaeHtRQ6HpL4DnjNl91cimDDVf3Zu98c
 KvSxXs4VGW3mejxUJvqkVD+gAUudDyTWjnRZBOsez9NboCx2utMjYgiqMsijPd4MWPIN
 rt/8qh7pjt2oboAd3IziCfKfoOiWrjZHfkjc8JXaTMqjns8lUSTVNy5bLMi3sMhQwIbU
 l1Ew==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrm/wr7T6ueC+BRVb75txNAftwJ8ClUd/R/6a7yNq8kLf2NGuTu3ZFr+SBElkvkq0wQo2see6n0Kg==@nongnu.org
X-Gm-Message-State: AFuF++lCFQmdYOL7+IjmkyJOMzZ5i63WV2OiLwrLwYv0O7aSf/0HFvF0
 4XWFQsOncDOLQ+J7dkou1FegUj6Zj2lGZjNoWVsCAYNQjh5TtIUNpmEg
X-Gm-Gg: AR+sD11FcBgxtGCOoFmJd4UL2E8n6GEQjnFWMD+in2X+X50biuPrnqNGnYyCEfgEju8
 HgEt/WZGbmK8LwW9RU8MLt6Amvr4faLSLBaLzC44+WaXP7zXLDzT6dX58SS7QdRyWLs94cz4sVL
 U2lVkmmTNT8RoCMhpH6iTkrh6u2nQazK39ckGGUYbXOjIX9+Fs3N0Jni6/BfxUje/OpiNOkYXjn
 N/au9iAv6srvtp1ocMwrvBXx5tW2hAbdRyqVbeSahO7VDkXffbwZ9fz/s420GhQJnWMFvU4T59a
 9ZdM5HjobW3qPLWQpAScSA/070W9ijqGDrMxkMJNwmFNTu4gCPKEIck94+JLNnIhwZo2OAqdyXy
 wwatlP/MRYY/42aBeZkvjLR2QwE87qdHgNm2FPnJ84L5o2MOTxrJ6ag2ETHOW6O5HcWkQaQsTIR
 +9Gi2rRwrB160grA6HspkzkJOq8hkxud5yoyuNltiyFn/XO4By3h8yzA7hUz4YKXtWqwOMOGtIo
 Hdz+EgK6ScXPCuerm0cNkjYgWUjfTDNY98i+g3D91+PoAbdnWxD7GJUGjyaVfiI8NbKSDRlDR+c
 JarxG5xisdp1fbAXLS/0NJWnkUnhahQ=
X-Received: by 2002:a17:90b:4acc:b0:396:5c22:b1f1 with SMTP id
 98e67ed59e1d1-3966d413283mr24086293a91.8.1787807427473; 
 Wed, 26 Aug 2026 22:10:27 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:25 -0700 (PDT)
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
Subject: [PATCH 02/12] tests/tcg/riscv64: Clean up semicall.h inline asm
Date: Thu, 27 Aug 2026 14:39:41 +0930
Message-ID: <20260827050953.67184-3-joel@jms.id.au>
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

Make __semi_call static inline so semicall.h can be included more
than once in a program.

Use .option push/pop rather than leaving norvc set for the rest of
the file.

Set the constraints for the asm block.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/semicall.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
index 2fdd322af91f..34e87332de44 100644
--- a/tests/tcg/riscv64/semicall.h
+++ b/tests/tcg/riscv64/semicall.h
@@ -8,16 +8,19 @@
  */
 #include <stdint.h>
 
-uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+static inline uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 {
     register uintptr_t t asm("a0") = type;
     register uintptr_t a0 asm("a1") = arg0;
-    asm(".option norvc\n\t"
+    asm(".option push\n\t"
+        ".option norvc\n\t"
         ".balign 16\n\t"
         "slli zero, zero, 0x1f\n\t"
         "ebreak\n\t"
         "srai zero, zero, 0x7\n\t"
-        : "=r" (t)
-        : "r" (t), "r" (a0));
+        ".option pop\n\t"
+        : "+r" (t)          /* Output: read as input, written as return value */
+        : "r" (a0)          /* Input: arg0 */
+        : "memory");        /* Clobber: may modify memory, depending on type */
     return t;
 }
-- 
2.47.3


