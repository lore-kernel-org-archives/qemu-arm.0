Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE07CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:56:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtsr-0005h1-D2; Thu, 23 Oct 2025 07:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtsp-0005dG-Gx
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:31 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtsn-0002cK-Im
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so12395835e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220408; x=1761825208; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=beoY+BW3TD49vXs4CyggfoeGS9sL7sPb+rvUv38igys=;
 b=BwwRQGb29KJuD++PEy7/deVWWWk5EO6kxboBtncE54ANcyTvsBslqV4DKy26lZOdSK
 GX9qkioOpGGT62giYYOV0Ezr9PlH09tzmhEV7RTObljsEAcgrPdqS2prGyJ6vHEY6iyB
 PhM6Tl5oYSoKV6o/YZlieYpPntwBQ+TZzD0aUM/Z8RdNxrFh03ULLAi2gmBq4o/73s9/
 TRklmxINFacdnE/p8AJCSBhXqQzerSxf+Jf0yQUljnAFqv39VFg5w7gL1ZKgE7Bngixv
 1GxVDCQ3zkS23TK/fkGNiQ3gaEK2p1WlT+nrvNuEMHU2EXRoGqktzJy5aG2JSQz2TavU
 BF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220408; x=1761825208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=beoY+BW3TD49vXs4CyggfoeGS9sL7sPb+rvUv38igys=;
 b=E4vmil01+oOpfSwKnK49MpsV4kwxdczJDbZJfqMcpf/y7/kIdW3pH+6Ge/Aji2TO87
 dKA8WnDC1jk2s4tmGTk4rSXl00qnNTjj4/HwNWmfGYeCZe2WyBgqUgCyt8qvG/37Q1/n
 qOzo+Ol8WxzRIQVBdtAooeM7gKR12uMSA7RsARM9Nc6hQfUF+mTzzWoVefhXHBspC5Tp
 pvwlII+4ZaLnxJffCbMbC9Uz2JF/l4m9lTtNU+GNOiad9aXf17gfrGMvmPnpP9JdfUp6
 xX3bJxWbNOIdD6Z3pblGW9KsApylyeGhh/VImVF+EGf4/3J1cU9NyOzQDJw805fMxpnK
 /+ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMaX4OsvQBl7xzzyIRMm6hTN2zGG8BH7YgKzFl5HlvfVRJsdBgsKw4maE6R/8twIpPyzxDdcR3wg==@nongnu.org
X-Gm-Message-State: AOJu0Yz1UVfyIPImwBuS2LP95TyRsWm71/MFqAjZUN/4Z4iBfcDXLR4J
 hQTTp4dsfFjH4ChwwK3t07eBkSlU7MLjx9W5cuEx980FLjALvikXyukqGcv4h2WpaLk=
X-Gm-Gg: ASbGnctV6UMdZvyuSmhRD4DOyXrYgqNhi1QZyGdqNYaWIwzp6ovWrvmbDyoEOMtACv9
 uPH/JXj+qJGr8iUn9j0H7OaDl6Kn/v4rcX7zWNWS/GJri6VRnfZ3oiW9HOArZLqTkESm6luNGrl
 CxEZNC9lc/VFZHWj9kUY+9yfasKql6Ki2OaW6uiC1JGVNEl548S+kKlYljzzce6yR7pWwyO9ptv
 r9MJYhVYqAf7rtBfWI4WxZMPQHBK/d4X20n+6m9Z6WgQVpU1V+KXJQC7y9IInA6NAIbkpkheUen
 g6R0OFkqjOVrnKOvQ2iRXyvSQX9EWNx4CpvevrdsG/0JCEtFq/jOXaj9WRDhb7uKuR6k0/mar4f
 GxaG7BlnayGq3x8nn3wsEHeBcZJpQlzpkCBgNGb0bJdaZVLX/hTd2Gl38LXjTA3yn1B831EkCQy
 x01u5ND+XwQiilIPRqFwpjBiTt37/7NE/PiYt0JxGyi7+c2tEo4g==
X-Google-Smtp-Source: AGHT+IEvrVaFv23S/qiOlmTwaYFJc6krdyAxyqLA1qGzJQlG+jSjZWWZtjx+Z/sBE4y0MI3EH2Jb6g==
X-Received: by 2002:a05:600c:6553:b0:45d:e775:d8b8 with SMTP id
 5b1f17b1804b1-475c6f18746mr27739195e9.1.1761220407858; 
 Thu, 23 Oct 2025 04:53:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898cceebsm3564815f8f.37.2025.10.23.04.53.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:53:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 33/58] accel/hvf: Trace prefetch abort
Date: Thu, 23 Oct 2025 13:52:44 +0200
Message-ID: <20251023115311.6944-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c        | 11 +++++++++++
 target/arm/hvf/trace-events |  1 +
 2 files changed, 12 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index a045f83c9e2..77998ab90a6 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1974,6 +1974,17 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
         }
         break;
+    case EC_INSNABORT: {
+        uint32_t set = (syndrome >> 12) & 3;
+        bool fnv = (syndrome >> 10) & 1;
+        bool ea = (syndrome >> 9) & 1;
+        bool s1ptw = (syndrome >> 7) & 1;
+        uint32_t ifsc = (syndrome >> 0) & 0x3f;
+
+        trace_hvf_insn_abort(env->pc, set, fnv, ea, s1ptw, ifsc);
+
+        /* fall through */
+    }
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_exit(syndrome, ec, env->pc);
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index 29387780e3f..b0d3d7bd322 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -3,6 +3,7 @@ hvf_unhandled_sysreg_write(uint64_t pc, uint32_t reg, uint32_t op0, uint32_t op1
 hvf_inject_fiq(void) "injecting FIQ"
 hvf_inject_irq(void) "injecting IRQ"
 hvf_data_abort(uint64_t va, uint64_t pa, bool isv, bool iswrite, bool s1ptw, uint32_t len, uint32_t srt) "data abort: [va=0x%016"PRIx64" pa=0x%016"PRIx64" isv=%d iswrite=%d s1ptw=%d len=%d srt=%d]"
+hvf_insn_abort(uint64_t pc, uint32_t set, bool fnv, bool ea, bool s1ptw, uint32_t ifsc) "insn abort: [pc=0x%"PRIx64" set=%d fnv=%d ea=%d s1ptw=%d ifsc=%d]"
 hvf_sysreg_read(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2, uint64_t val) "sysreg read 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d) = 0x%016"PRIx64
 hvf_sysreg_write(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2, uint64_t val) "sysreg write 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d, val=0x%016"PRIx64")"
 hvf_unknown_hvc(uint64_t pc, uint64_t x0) "pc=0x%"PRIx64" unknown HVC! 0x%016"PRIx64
-- 
2.51.0


