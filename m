Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37639CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:47:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcYg-0007DC-N8; Tue, 28 Oct 2025 01:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcYe-0007CP-K6
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:47:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcYc-0003S8-Ls
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:47:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4771b03267bso755335e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630462; x=1762235262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PXz77BrZW3QUmlVNh5gnW4lPNFdnFM/IGe1E/YtD1U0=;
 b=zJcjRh81SiLOpwZCmZXxdmYvPMIIEopd7bSxSw7LMtccoGSe7N6o5xC4Lz0NvqcQFq
 Y3B7iM0q2AF1mckMI3GKGmu9jyS8TnfBuSD3rM4N2CNuz8uemG3m1+C0HHkpXPAsWF+n
 mH0TkYVlREEZxp2WGtcg3MUl7jqO0vb8mSRLTs0N3ApNzs/xJEYtdD5Qx/tlYdrMEj0Y
 04mKX289VahitCEk6pW0rOdqKJaFJnIaJmJR3zW5Hc/BsEkTUpc3Ww98ji/tXlBnfLyP
 +CoUpjutR8UeZaycTIigy8Cy1XDqDkTMIF+oSwLVk7wbeTdmKGfEEqiEgKZezoeRhNK5
 4Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630462; x=1762235262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PXz77BrZW3QUmlVNh5gnW4lPNFdnFM/IGe1E/YtD1U0=;
 b=wIxQY+9Eo3GWyZAEF1q3F5G0SIzcb/zRKcNjjUBCnl6HpK77ID1CTnMzI28u7mU7iX
 zoB/SejFbz++Xkz7d6XYSFzfQpjbsjZ0nr+0xmOw3DIrIayirVFqyB5TQr9TJ36aOSH2
 neV7ana5gvPpNH1TPG++NKbsru2+b+ncI5AIUyN1o75U97HexXTLSuUpglTm18ioaIHA
 y0uU9eAC3NFT/uIiA6UmKJFfjhzLfDqLnwDdmEMD9JDlJTAh9eFfYf4THpLuc3DxhA7n
 w6dQr1q/ojjgrtKzI9JrYIK2Zhqjo10hIBjW+uMdvX6mux6AxV4Mi8KTDp10djzD9mBH
 paaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+6mPMc0qj6i8+mjRgGkKDpX+vBZZMctegId3JHmPS1qSzznehshzfzXPIaHXpQBtD/8Y/PrRbIQ==@nongnu.org
X-Gm-Message-State: AOJu0YySHSw5lZxkT4k/tPOTtuTNbG6KaHoGqTcQcd3Pv4wZcAC/YrOa
 bbVWdcasWLAMyrXI3BG+rC0Y9u/sa44PDFQZKpyPO2h4TJBKFa99cD60MUGkkiSwsVA=
X-Gm-Gg: ASbGncvtoXaMtyzjXrnW1jKV27i3Ldb7Q/N08rtfdwHHGnliU7SUp5WG/UzFvJIvFkm
 iwuQ6SRFfQ5Hnp0ngyWLK24kFREcAegUQY44MX/qt/GIEombbkpGePNfIJk1g1WfoX4iA+OlOQS
 fHwg5lMZup50YC0LXc+g4vwqoHVGvLMKtszUYXhKVmovxEwKcaqh82zFXJYQwWyuPy2jm3WWp6R
 w9l2QVY2ZqFGSJRpi8LwK+qyi2bqIbYInbmf3yqeD6s9VzTA8TUABD3CUR+f+tYCnwFfvdZ0h4I
 pBFJumG6rnFTFCa5HRUJyN4k+wrfkqTJhg+awx7WynJplnznJT43X6HJylAfm1VWtNssZpe4r3j
 X77FT4jz4v8fPfI5NXFwCGlqxTLm3EVycohgHdWLsQwqV6zERpo/0GtrtcQQCkr1S1fYUXfMMDH
 6PN68E5/4wGwUx4TiePyvivmxe5UjYD/MKWSutbndQMXOFalOsLxNigfzrt94GMfzHbQ==
X-Google-Smtp-Source: AGHT+IGVX3zZA4IzQqDYpwXv7QgpZpfuFH3XYWTpr/Oqb8bagoBaKLrIOjsUTxyztzmQAfiXWY5dhw==
X-Received: by 2002:a05:600c:3e8d:b0:475:dd89:ac7 with SMTP id
 5b1f17b1804b1-47717df7ef0mr17181165e9.1.1761630462306; 
 Mon, 27 Oct 2025 22:47:42 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm169959915e9.0.2025.10.27.22.47.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:47:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 07/59] target/arm/hvf: Mention flush_cpu_state() must run
 on vCPU thread
Date: Tue, 28 Oct 2025 06:41:43 +0100
Message-ID: <20251028054238.14949-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
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

Since flush_cpu_state() calls hvf_arch_put_registers(),
which must run on a vCPU, it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index f0a0e5d1a75..fdf8df09d4b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -689,6 +689,7 @@ int hvf_arch_put_registers(CPUState *cpu)
     return 0;
 }
 
+/* Must be called by the owning thread */
 static void flush_cpu_state(CPUState *cpu)
 {
     if (cpu->vcpu_dirty) {
-- 
2.51.0


