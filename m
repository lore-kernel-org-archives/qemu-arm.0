Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C817DC83F1B
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Jul 2025 17:29:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uc5vj-0001mK-Bw; Wed, 16 Jul 2025 13:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uc5vd-0001ib-5M
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 13:28:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uc5vb-00007z-Cp
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 13:28:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so95924f8f.0
 for <qemu-arm@nongnu.org>; Wed, 16 Jul 2025 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752686901; x=1753291701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jvMqfwhNEUaAbyBTg3ZU/8Yl+gwZdDpyb6yyXj/6hXQ=;
 b=iwuRCXFRw/tt5MDLDAhuz/Myp6KecDaKVwyvBDHW+SnsFEF3iU34qCKlDUpzOxN1Zj
 5wFrLd5Bw5MFtOhYorjZcjTVu1KuYM7PMIOkd4SfuCYKmGlqK4QrUxhPwLKdUvOmlJbE
 wJC0Wk2TCoIGt63gWKo3wj3sxsEbv3r7HHRvAZqbKObD6sTV+zOuKu7DlxzuZelmyrc9
 avX6zrgM3SzDHyXcEwXvtgwXF581/5nHu4RaXGloFYJN3JoDvn8wc3k7/Bsz1DqEf9TD
 1H6KgPzxwh1W5vcaeitnsu6OMgu/veWn+s/ffkuIU9dGlHhpwPNQ2nA/IlUmr23O/xwH
 H7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752686901; x=1753291701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jvMqfwhNEUaAbyBTg3ZU/8Yl+gwZdDpyb6yyXj/6hXQ=;
 b=DAah7MyfNNEfOuahYuPC12whUArN07vCRiVSbD1xICsNnsjvS2ukicI0GoKiESgMYv
 SYKTgNmULdEER5QWn1PJ7FgafwTtIc7NLlXFOm9Bq1PHr4x77fmy6hRhTTaIRBjFbzEi
 YRkWMWMryv9UtlqLrBVwKGAnSVIAfvTY6X8BYH8x2ZjSyGqtBUnN9sCcxxBTv7kFSlbL
 PQAmRde9FTJ6BT8uy9SqUu8pMIgihrheVoEfozhxowpm44pH9dSZ76b65LoRnxXWS8ZN
 tCPcg271VspAIIesHKfTid5M9f6D9baQGa46E57mmhmjn6r/2vrdsgQQsvv9e8U0Xzf4
 4i4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX2HwDDXshgg9QVm7gTzFPkJCjWhjgDC9mJ996VNWCj2st4k2ma2Uvg9yoXPpOQIrB3R5Dy/BY7w==@nongnu.org
X-Gm-Message-State: AOJu0Yx1dlOnGGjsA6qM4RlMiBvotBbExvmsSWSf3U59/te7xGckmsCD
 5uX7WiOvOuttLjJlW/a05E6DykhxcymBG13L8iMOy9p9jjotzpCGtz+ujaNkW/6SLS4=
X-Gm-Gg: ASbGncuXDsVQpWnvr5qKZqrxItR82h/Ug2wl1r1bH7h80yl5e95pAoollhZdyFbE8zj
 6dcsUyJ19ycDKFw7h74porgHdiomhhfYinN/OIRJyaUYxB9mnfAXUsL0AztQDXmjRgBT1M/fsIK
 jgJB78+wj/G70X1pmruv7KcjFFJdZ67dwGtUqq+eSBblctMea29A3arXBnbY1/nE+FeDHfufz9i
 6/Fc7llhy6b5THZvrmTmkEr5nv4tDBgrgzJ+1OmaoJq/f872dzKcjySKtqqIC7iAmR01jQ7Cf+F
 +8zJxjU8aga+ROzd0JppVl0648dLU9O+yXPkdyuF3SBY3SQD/uN0GNpFDc2Ohl6Ruj751lUJ6pK
 mI1hZVkzRJrcClOFEZkxjcc9icD2icWcIMtE8sqR2V4ipS+ChRW8qKCqHR7GdjQolsj+u5L0V1/
 4dJ1U1wzQ=
X-Google-Smtp-Source: AGHT+IEySn6a4TwkwiHvZsCcDGfvrS+Pq05mAv5J6DwrLCGyKDFZtWtTqsOikgNI0LL+aO8PTZe12g==
X-Received: by 2002:a05:6000:43c8:b0:3a6:ec1b:5742 with SMTP id
 ffacd0b85a97d-3b60dd4f78amr2806114f8f.22.1752686901040; 
 Wed, 16 Jul 2025 10:28:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562f7514afsm22412785e9.8.2025.07.16.10.28.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 16 Jul 2025 10:28:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH-for-10.1 1/3] accel/hvf: Display executable bit as 'X'
Date: Wed, 16 Jul 2025 19:28:11 +0200
Message-ID: <20250716172813.73405-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716172813.73405-1-philmd@linaro.org>
References: <20250716172813.73405-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Developers are custom to read RWX, not RWE.
Replace E -> X.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/hvf-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index e67a8105a66..0a4b498e836 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -84,7 +84,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     trace_hvf_vm_map(slot->start, slot->size, slot->mem, flags,
                      flags & HV_MEMORY_READ ?  'R' : '-',
                      flags & HV_MEMORY_WRITE ? 'W' : '-',
-                     flags & HV_MEMORY_EXEC ?  'E' : '-');
+                     flags & HV_MEMORY_EXEC ?  'X' : '-');
     ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
     assert_hvf_ok(ret);
     return 0;
-- 
2.49.0


