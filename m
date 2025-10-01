Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BF3CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:15:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yRn-000314-8d; Wed, 01 Oct 2025 11:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yRA-00027y-Jg
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:08:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPk-0000lA-QC
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:08:07 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so70575805e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331193; x=1759935993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcFSHzwi7uBOl2YyW6dgGkKIyMLR1GvdjSiz7OthsV4=;
 b=l4WCmZ46q3O2rseWf0Lq9gMGspWTbGll+/eIQRZWw7bHWMGNZWyKx0xR/T5cpNkRTS
 FJoek2LnaQUy2TQauUNJL7/ILrvsH10xBpGc9SGqY7jzuriojr0RxxVI3gLQRakJTevq
 dZqsGTUQc2iufIgEmPL2v7OAw1/llIFhlsFt6M3QGaCKWeEHjS6Q46cS2JVLIv5+Mvra
 mLLAYpNmxjJED1LEh0M1zEQBZfzoYTQeXo4NtaV4ZEBsImoR6OMAmZoRvusLNTCbVw6m
 aLtr96e5de3Hg8SZghqUBzJvF/Qk5ineIw3rHVJd7ouuW4BhDgHES2cWBHUfcoQafKas
 orXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331193; x=1759935993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dcFSHzwi7uBOl2YyW6dgGkKIyMLR1GvdjSiz7OthsV4=;
 b=AYeTEDoGaKbyL/ZrPddZyFg3Dx+821jdmDkxleP/WsEtZL6gGLowEHlQEtjmUhTwVt
 cKnU0CFf/tMb073OxdxBsKist+fkDihsnK68aXkrbUJhrZoLMQH90UL2+gvlVmy+Jdtk
 DYX8zktZLOQlYPRq/B0XFtnOS/WoR9kxmlnBD2uP6hyWdwOUty2Z57kITkUDAtcx7uDV
 JpO0R0mAs9KBmTyHE2ziAKvElkVCi3/PmtOaToSRFQzHoSIfsrjO+qTS1eni9LZjZKWH
 hbnWvYCQnqtQj+u8yLiyEtQ/gvohqrArI+rORJEFOZSsnJpZei8A8XCEkgF5NlMN4IoT
 62XA==
X-Gm-Message-State: AOJu0YzVHHJbsgob93LMuUGJGXpCtBfirlDHhGztjfexhRsN3Im8PCR2
 Uxb1zsNNHZTeqtSvOqtH+bQE352WKXDeTvCjDYJj6rXrC8WokleN9SCDWq56Iuyy45o=
X-Gm-Gg: ASbGncvrbPs2SX8EGyZ3jKv5vTCXNX+4CBHBMvOPV5HWsoH3IJFom0AvxWYz7OTt4O9
 TAhaNQ4zVx3skUOYhOaZ1Klws+OzLHsFTiQP07BL5vA5WJUHZuw1etBDCzCbrd35g9C8nQnbGMJ
 OIHvKc05t/ikw8nQjXmVrEXYK+4oCB6HhNaDO6Iw+icAuw5OPCqPar/Y+tSA/0tZfzVzPh5STGe
 letxCpNKXOXOFdvs45pQNB/eU/fHFbpiYuIYcu4Gxk8f1C+CW5t5OynWRmI97ZWGsp91t0xf4TP
 ax75EaTn1J8aQ5uw18M/wFST2BsboT7NpIVaHkSH5jVRqsz4JcVicqDEx8hxFCqu5e8u7zBV9Wv
 61iQTYsxyh2cCHvhsiemhfRN3SArbnZUOUx3DAQxUVSUIdStZdQBkRzqehClJE3WBo78dTP3Nfj
 S5KYQH7DYiF9h78cqhqC+O
X-Google-Smtp-Source: AGHT+IG1J0a47sLtwxFcaDSrout4RLN5hlQ7CnmTr7At+cHLbk6rWfBZ9Y0L1CqSK/VyWdUPHPzjcA==
X-Received: by 2002:a05:600c:1d12:b0:46e:3d41:5fe7 with SMTP id
 5b1f17b1804b1-46e612dcff2mr30889775e9.29.1759331192779; 
 Wed, 01 Oct 2025 08:06:32 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6199f17asm43113885e9.6.2025.10.01.08.06.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 12/22] target/hppa: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:17 +0200
Message-ID: <20251001150529.14122-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 target/hppa/int_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 191ae19404b..4dd281e6c95 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -160,6 +160,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
                 /* ??? An alternate fool-proof method would be to store the
                    instruction data into the unwind info.  That's probably
                    a bit too much in the way of extra storage required.  */
+                AddressSpace *as = cpu_get_address_space(cs, 0);
                 vaddr vaddr = env->iaoq_f & -4;
                 hwaddr paddr = vaddr;
 
@@ -176,7 +177,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
                         break;
                     }
                 }
-                env->cr[CR_IIR] = ldl_phys(cs->as, paddr);
+                env->cr[CR_IIR] = ldl_phys(as, paddr);
                 if (i == EXCP_ASSIST) {
                     /* stuff insn code into bits of FP exception register #1 */
                     env->fr[0] |= (env->cr[CR_IIR] & 0x03ffffff);
-- 
2.51.0


