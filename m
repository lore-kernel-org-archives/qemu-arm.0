Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBDDCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:08:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yPO-0000pJ-K9; Wed, 01 Oct 2025 11:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPD-0000dr-0a
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:06:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yOs-0000dJ-Tm
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:06:10 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so70565115e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331142; x=1759935942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7EaccUYpMBC4mwWEA7DiP8JsC9fbJvUiR/uXxT1ZC0=;
 b=cLwO4bRUZEovAHh9p54a+1hXkXrlBUYlhN2MHyG39Bey6/sbXg6W0YSVnOmqGFRzKh
 DnzI7qLAxQ8sm1tyxdh2MXq5WfwEYH9RRZTAzmlr7sSOZTl5h/w83VF2fB0jExb2wCMi
 +pLvlFvTaPuB5NCK8lzXRxBWfvBvFdnsp7R1yMlJjjhrOz5r7U+jxvpBC2iFhsNambz8
 hLUBY6T/ebCnwD7ZYEQQ6MqDE9YiUMu4zt67HU2sYF0fsKDOF0CSiv0CP7HKzJrG7msc
 v+KwWOamNT8+Eo8BhkBHoNKkgKo9CAtf3Ylob4rvMiWs8M8peSQme4ueJl95DtXuXfS4
 bBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331142; x=1759935942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7EaccUYpMBC4mwWEA7DiP8JsC9fbJvUiR/uXxT1ZC0=;
 b=wYQPROXZ8JtMFlxv4QrBQGS1uMGe4TAZ0psbrkocd0TguAhkILvAdWnFG9zNulnr5t
 zFedmCjZZDh0Wxutvo+xpTHGLvzhVfNUxRtFqrMU28TFhlnZu/6cQC86msbtlwWrnwhN
 WzgzzaTTR6do7tCpnbPKfIpgwI445dV6KYEkq8b2yNC/PgeyjAm6IIlT6PDpYINkFDK0
 D+1ps6kJt1VQJ2/h7yM5tyjSQmFPNttQ/DtzKslU3SqTzwRT6ndg0hRPSvs/JXaPIEqV
 hxH2kW/+PSb7A0aGGYSxtGiIr0mXtbTYsDeH31ka6gmamCXFarK9U9fmL84y4fEv6pDB
 c/lw==
X-Gm-Message-State: AOJu0Yw3wUupvuoSeenOjf4X/DjUvciooFEw4UJDwGJoYIRq14sMFA/H
 9hyPTjd6ZHQ9dX35yKAI418Nairrh32Ny5z4qXukneB2xFHPKptFT2QZRh20r/+UdtQ=
X-Gm-Gg: ASbGncu1IBueDt+owOLMZyfbunL7GOBtdx0iOPbvrKWRgBhTobJKlVFvreAYzjDjNKF
 MwdUrunizL1SmoxuIajTQnPtx+md/xQ1waWi0/e7h6JvJxt+1cAxwvpt2JB/qxPudHWqfNSBP2+
 fGYRo7sJH8qXBeSUalFV0Yl56HfqWrWQ06ZA4mOU+ExbD5iTAaKCXYrmL4sJXqX5LSpFwVkG6gT
 hZ07PMhsO6BFYd5UZO0ASzM9mVvQikgLs6SlNSuHltif5UY+GwwWB+8tuzTQyiY4bhrc4i9vHMl
 xl0RXf44LoXF6YG1wP5k/tHWkpZW5+r/g0XPKMc3rTER4spIxpqqeFe0ZGDk04qYMNTTdNAu3YO
 rRIsrTJp4H9GfcRe0dWXTKfcxNX5rV8YtWnd+k+juttZ3IzzPIu0Fk380SsTfWDGsGquGEQvFRW
 ox4/TxL/RLpFk0gZKp1Csv
X-Google-Smtp-Source: AGHT+IGEFbG5PZrRkWb+dAGLcwVbtYn5/zpuQRrUQpMe+vLSrEUuj1Qqi8Tvl0sgCyq8N0wMWsvaVw==
X-Received: by 2002:a5d:588f:0:b0:3ee:15b4:174c with SMTP id
 ffacd0b85a97d-425577ed71cmr3251338f8f.3.1759331141623; 
 Wed, 01 Oct 2025 08:05:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7e2c6b3sm29412235f8f.54.2025.10.01.08.05.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:05:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/22] disas/disas-mon: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:07 +0200
Message-ID: <20251001150529.14122-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/disas-mon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/disas/disas-mon.c b/disas/disas-mon.c
index 9c693618c27..f2e45d16021 100644
--- a/disas/disas-mon.c
+++ b/disas/disas-mon.c
@@ -29,9 +29,10 @@ physical_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
                      struct disassemble_info *info)
 {
     CPUDebug *s = container_of(info, CPUDebug, info);
+    AddressSpace *as = cpu_get_address_space(s->cpu, 0);
     MemTxResult res;
 
-    res = address_space_read(s->cpu->as, memaddr, MEMTXATTRS_UNSPECIFIED,
+    res = address_space_read(as, memaddr, MEMTXATTRS_UNSPECIFIED,
                              myaddr, length);
     return res == MEMTX_OK ? 0 : EIO;
 }
-- 
2.51.0


