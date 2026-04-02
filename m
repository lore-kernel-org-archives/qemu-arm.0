Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDCBD6AAF6
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 17:05:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8LTU-0000EE-KK; Thu, 02 Apr 2026 13:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8LTS-0000DD-Nw
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 13:04:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8LTR-0000h7-4u
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 13:04:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4888244e9f9so10242855e9.0
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775149492; x=1775754292; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vpwa24XgbbGnpEc9o84kjwJoQeIsKIVNHM7RwypFzUQ=;
 b=v+mZgVG4ShNmQWZh0fYqGG6DlMrTdCpVdyi56Z0de4MF2Onw6rXMEwHStWpAKQjT/W
 0nOF/VTS7ryypEcN/pbmN9pbLGhnCZdCHtkA+dFPQEu95Biyutabi3wNrjtXGY3sXa0b
 w52N0NzCCDb5Mac2PvjooL0Ug3kIHPKUZLI6tPzSQVF+3mhBc6WxwR5z2JJpzUGAExMQ
 0o0O4Nig4gkZbdk+dGCQog3am7r5Z7vN0LN849m5a++D5DwLcQE/Mdg+fGJjsItGZBTk
 vvbL8auGYrDvUVqaKYATAN49S4z0aSk0vnpQiBfbUsD2HRQsstY8z7k8qM9bAIgdXuIE
 QpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775149492; x=1775754292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vpwa24XgbbGnpEc9o84kjwJoQeIsKIVNHM7RwypFzUQ=;
 b=kMbJzeYE1NYsn5QQeyMdjVhO3W5BWAwHmTdrxlzKgVut+WqoFmdDuns4GitjlxnRz2
 2xonEYmyIxfE6tVtb46kcr49NQOginoA1ZNLWymqkYnXoqKIYO7WoVfUBwA8yFVtXS+B
 wmw8VXNdiWt8eIv76ryuxEB5xUexCk9iOhZ7CpxPwZ2BiGY4mAnG39nUsQ3TkbBHRFkf
 yn/GBl8y36fc4EcbKCZuudnoH+CE6WA1z0kNZ3XP/6QqKiyMrMt0kn+Ogf4SboMUR4Iy
 0Oydsv0++I3ec508BbLBL7nNmemHTnWIt1kqgPOOdgowFO+U9fLQeUddguGeIq3gVR97
 o+vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9dGbtZ7Pogp/L4LR8B/+lb+yjS2yOWZ2qNVGZEdL34boz2l81NwjdbPdMePTr2qHbaSNnc7XAHg==@nongnu.org
X-Gm-Message-State: AOJu0YwcLjsgkLoPQ9bOn2qF8Jwv+IEKEC94aEc8M854q5owAzKQ0BuS
 92SSEUyG6vpYECCP89cy6nCzwxeMRF4aIc+tNPZ/kFH+iAGT73CtExTfGAi5p/1LvLg=
X-Gm-Gg: ATEYQzwCzRWH18HSWv/HYJTgkwrtLQmbD63nPiVKHSNHIDVXeDqM7xqNuXBUo79EHLD
 g8laZhUzJB0ER3y1UjwJOdMzoQOQw/kGnfLZBPqv0zJgma9H7bNnMbSHDAhw47SHf6V5npEoXrK
 xu3WFH9hi/a+ujjX8HdlfY80a/i96KFYkN9cMDlgFyH3EbeLZx7qN8O+W0owr/UJjchtorBplJV
 ltBh5vU57vueP7iLQaw120yvbT6lNVT5Va7VTpRvcdudNUBApEzMlI2wDLbwpUtNztDA6cxjt1z
 6vx1GQTxuT1UarR+GmAZ6GNCMv85eaqFo6LAm7HjEpZ1A00LGVPMtjVpg+tcdt2tkY/9qoFKUIL
 da6ws5Vr3dkDVfuKtZNEfL8qygt0qp7TEyHCZJNyzj0qnWpm9kB78jMB1Lro0dmX90fHjATctx9
 RIo0gkUcow7xfQH1wx3Wq1CdKZORcslunEf89369aTDH6xTXQvRnlFs0lcz7deztS5vvsHxg+t
X-Received: by 2002:a05:600c:c056:b0:485:3a86:6392 with SMTP id
 5b1f17b1804b1-488835b75c4mr102142295e9.20.1775149491541; 
 Thu, 02 Apr 2026 10:04:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48897b82b50sm2140515e9.0.2026.04.02.10.04.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Apr 2026 10:04:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH-for-11.1 v2 2/9] accel/kvm: Include missing 'exec/vaddr.h' and
 'qemu/queue.h' headers
Date: Thu,  2 Apr 2026 19:04:27 +0200
Message-ID: <20260402170434.94783-3-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402170434.94783-1-philmd@linaro.org>
References: <20260402170434.94783-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Commit b67be03e3ac ("accel/kvm: Widen pc/saved_insn for
kvm_sw_breakpoint") used the vaddr type in the kvm_sw_breakpoint
structure but forgot to include the header defining it. It is
however indirectly included via "cpu.h", which we want to remove.

The QTAILQ_ENTRY() macro is defined in "qemu/queue.h". Include
both headers in order to avoid later when refactoring unrelated
headers:

  include/system/kvm.h:398:5: error: expected specifier-qualifier-list before ‘QTAILQ_ENTRY’
    398 |     QTAILQ_ENTRY(kvm_sw_breakpoint) entry;
        |     ^~~~~~~~~~~~
  include/system/kvm.h:404:5: error: unknown type name 'vaddr'
    404 |     vaddr pc;
        |     ^~~~~
  include/system/kvm.h:405:5: error: unknown type name 'vaddr'
    405 |     vaddr saved_insn;
        |     ^~~~~

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/kvm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index 5fa33eddda3..b5763a562d7 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -17,7 +17,9 @@
 #define QEMU_KVM_H
 
 #include "exec/memattrs.h"
+#include "exec/vaddr.h"
 #include "qemu/accel.h"
+#include "qemu/queue.h"
 #include "qom/object.h"
 
 #ifdef COMPILING_PER_TARGET
-- 
2.53.0


