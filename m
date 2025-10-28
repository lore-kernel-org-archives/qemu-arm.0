Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3D9CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:07:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcrW-0006Vp-0t; Tue, 28 Oct 2025 02:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcrH-0006TA-BT
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:07:06 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcrD-00065B-AI
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:07:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so3805730f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631617; x=1762236417; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXmt6X/td1himOahN7N73E8CiNP80Y12E2uGpdnzhOw=;
 b=G4OxxN4moIJ5k8L12ZQKH/Pwg0naNsf5H0m9N+zKfgsNha8peJXF9od9bbH/DMqAdv
 nz+QwpY7Q+Qa9ptkfHben1LpTH42XRadZUl13IH2d6kUYHvUkrMqjdIoAPeKrFi2Wqff
 YTcdQtcUvzhHFMxef2Hj7Bw4WYnd1lolihyBU/aMRMO5ssWOPylXIQUlbvTJKKTy0QQi
 fJxk0JOMH13maRiP7ZuaxI9IB6qRXZpR41o/iT5lI1GYnAqSXdRkYxifiUiaIs/0hmuY
 4YPtPQ5Hn7cKDR6s1NFxdD54jat35qVGAFvH4A3tSR19KJJegymUgrYkQGkdD0en04Ts
 cPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631617; x=1762236417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pXmt6X/td1himOahN7N73E8CiNP80Y12E2uGpdnzhOw=;
 b=C/EzBkpng/mwnRdZ9yIOqWdFz1J1CT+M+WCUWrWI8qMD9Pr7LosmBOx4cj87p8rMhB
 wE4C1UTSD/6ylVS5yPsnEvcgKjW8nepXaw4ypIdzZWS5wWKQJVAQk3irovlzE+9xWFUc
 raJMJ8Xfu3euhF2aeisB7TI8iHhRnsR33lCPm2eebgg7GeM0yA8mr/3fQo2Z1r3sZfWF
 APRt92OiJC6gxN6IwoILnhuUJjtRJKdQh/BBMgyGIG1n6LYw9QHei7+FMrG6uM8nDc+q
 KXLekWcQ9jzM4aDmA9gVRRF4HkpLI1HyCORCkp8jmh5IUz6Dys8CSsl+jqbR/5A+3NDr
 07TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU1YgrLJx4Aovm3BbEZl8cQ+bsSHzZGipFifggtv+jGOTy4eObN9+Ee7wgk/fOgXaWIyMoURy3JQ==@nongnu.org
X-Gm-Message-State: AOJu0YyDmibzFPGjKDXff7r6vGA7rPM8Cp2WwsVJvyQTyzT5QGg8XIBY
 crJGZHyEmlJkeF35r+uvBjW1Ad6bKXfD1pmV9ezeFysfVCLrLEOzADqKQ5StZUgq6Tg=
X-Gm-Gg: ASbGncthdfzxB/sAFRKr0NYKZjgHaaVZp+SLJgcZsaThU6wNSkTrFpXlTqhbZFLQCEi
 5j8gQiBXUc4xjh5d7mWedJo3fPjaFxpircms8JZH3onN8lruDqJ05x0qZc0mbkA4oIZEa51QbkS
 RPN7y/X3p2lUZYNSDhdyMEf/JiserkmPX7fNf4AKlq30vJXPsewWSdYxlK4dC3+I0io84+Hv+kJ
 za0+pR7CAeHvZYW/BCGVUCOO23t7GL8oOTp7XyYIcEsR6Zyx621nhtuC3MxwEES3Dostx9dnnsb
 X+VukApFmJyKAbBG6LTYdnPmfqm7tXrX51Xm8tHAwS4Q6zWRpgUiZ0gTstYseoRekkLMNA0ZaNm
 dyU7ej5TuEw+KTkW18r9ebE6r0hktQ240vtbYoYcdCHeNCMJ8GFSgDKWQ2aBpvBr2WemrLSEksA
 EyrGrtuRaiBPBhzR8VcuIogguscW25IBYgwVlyB97OoL5IePsJ65fU2mU=
X-Google-Smtp-Source: AGHT+IFp9mUcbmznv1LTtiM6Z4VrDgd6GJxEj5LVZyzNLCOayKvGxIOptL5GROw70sDl8hlz+qNd4A==
X-Received: by 2002:a5d:5c89:0:b0:405:8ef9:ee6e with SMTP id
 ffacd0b85a97d-429a7e59f6bmr1776652f8f.25.1761631617319; 
 Mon, 27 Oct 2025 23:06:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df62dsm19823162f8f.45.2025.10.27.23.06.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:06:56 -0700 (PDT)
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
Subject: [PATCH v3 34/59] target/i386/hvf: Use hvf_unprotect_page
Date: Tue, 28 Oct 2025 06:42:10 +0100
Message-ID: <20251028054238.14949-35-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index c0b2352b988..1e92e9b707b 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -139,8 +139,8 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
         if (slot->flags & HVF_SLOT_LOG) {
             uint64_t dirty_page_start = gpa & qemu_real_host_page_mask();
             memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hv_vm_protect(dirty_page_start, qemu_real_host_page_size(),
-                          HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+            hvf_unprotect_dirty_range(dirty_page_start,
+                                      qemu_real_host_page_size());
         }
     }
 
-- 
2.51.0


