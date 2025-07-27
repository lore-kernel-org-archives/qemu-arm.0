Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4873C87FCF
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:17:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwMX-0000hA-NC; Sun, 27 Jul 2025 04:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLs-0005Jp-Bm
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:26 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLq-000476-8a
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:23 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-23f8d27eeeaso33827405ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603401; x=1754208201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZV74/jk180skCcP64aNSwWKDejXWoEgBfJ7ZrJzLYQs=;
 b=zJuxPc42cZv3cXbeL1tcPTFk3NX1ZSSOYVijbLmH3ng8OICHYJnZ6QgbyKu2sl6EmN
 MxPaIIGYE37ooY/ZaLXi8sQPnFMCJjx8T/LHErPedBs/uOkxrL9VDBYs/s6sAd3MtDRY
 F5TbdrihPYPYT9+/fh81zDbseTijHttLt07ElfeCTOSXOOb2AFHX4qfwELhE1ks8xySx
 tuebPW8qLlytAe13bdaLaYCRK8MYZW80UJzA07zTHZ+h4FSpv4qdE9dEh1WQCsBddyoN
 Y2ANllhmqX5XCk8S9s8XTFe5oPTYBC2dzlLP7xizwapCHhizhnFy0/Otuy0+Ey4rW/VG
 x+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603401; x=1754208201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZV74/jk180skCcP64aNSwWKDejXWoEgBfJ7ZrJzLYQs=;
 b=hrv7heJ9GO3XUba0HP/ktNJlxR+BbXFg+PKr/m8XDI8KWkX+Yx6zbmzVYNH/5a5jK3
 TO4Ufz3Yj99qd6YiPSU2AJDXbAgPQrQzP8ljDC7iSlw5buFzZ1UOdojLKitUZMIXeGo1
 tFCvTNhob0LGA0/eNdlPNKEglCSL00mnP2Tx4dqgNylD+hzlAwegv4ii+31XQ4ExdfAy
 Xbj0Sp6g0yOESKaOaFftksGJMgxEObMZlwxZyNlYkM3o/P6wjfoJnHdVVJ7O83poHb28
 vanf2pV51J/bTJLDRk31c/KnNrKq36nqvpQ70w2UDYnlcFAk1hy46YP9ps5PA0NNg8f9
 4diQ==
X-Gm-Message-State: AOJu0YwJvYgDYH0fOQrFDvUzSIJ/ElooSc2Hik2ZtWoZTs+27EW4EGbd
 /RXd7o5bIqXoNJYQExTfQ27dx84wUb04ctJ9RDsIQVNUziJ15HRyDBlBs0ilArCYHMeL0qugHwn
 I7dX3
X-Gm-Gg: ASbGncukufsJ0nFNL2bjLNjgrBgwHesoQ4o6GauBgqP2Vn0Zq0jB9xsXC9xozyxj8tB
 u7B2QbUybU44KKhMgzktUNtYVqjy8BkX4XBnYeorioZF1ZWAbcIf9rHnHjr8MAmZKGMGaewlJnz
 XnSoGH7mY7n+qy6uBeFF++Y04UUqVjnIgWcvQ3GYPP6Bodi/qUFhaQcJcU+EhrQDtIF3VEazZb6
 nBsbYC5Mc95RRNnJlS6eB30oYbmzHYbzk6BhDQCxSc4c7roePZCd/+ygaobLL6nkGgEarpGahNl
 Ar74zzktgvYjfdwEWzBio21Y4xNIiXfOLwiW8cI9HjWN0suHTrJMhE+2/NrjtU6wDb26kAiMgUg
 gUYyINJ2LaLF0ZHBfA9dZQv3QuP47FQ+/Pb5NKpZMigfxsrxvdaKbKgNVEda0R0W8saf8XhPpOI
 Fh5AIUd4NVOgk6vkm5a/Xu
X-Google-Smtp-Source: AGHT+IF8szVz0tmnKhIlULobTD/BqkVWwZSRDel+zMsmDzGILYrcF7VbnskPCmgMAIsQawLb5hTLrA==
X-Received: by 2002:a17:902:ef07:b0:235:cb94:1399 with SMTP id
 d9443c01a7336-23fb309bfe3mr107953615ad.6.1753603400931; 
 Sun, 27 Jul 2025 01:03:20 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/82] target/arm: Expand syndrome parameter to
 raise_exception*
Date: Sat, 26 Jul 2025 22:01:52 -1000
Message-ID: <20250727080254.83840-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Prepare for raising exceptions with 64-bit syndromes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 6 +++---
 target/arm/tcg-stubs.c     | 2 +-
 target/arm/tcg/op_helper.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f0e888ff93..fc82dd65e8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -306,14 +306,14 @@ FIELD(CNTHCTL, CNTPMASK, 19, 1)
  * and never returns because we will longjump back up to the CPU main loop.
  */
 G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint32_t syndrome, uint32_t target_el);
+                                uint64_t syndrome, uint32_t target_el);
 
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
 G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                      uint32_t syndrome, uint32_t target_el,
-                                      uintptr_t ra);
+                                   uint64_t syndrome, uint32_t target_el,
+                                   uintptr_t ra);
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index aac99b2672..aeeede8066 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -16,7 +16,7 @@ void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
     g_assert_not_reached();
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     g_assert_not_reached();
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 575e566280..46a3b911ec 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -46,7 +46,7 @@ int exception_target_el(CPUARMState *env)
 }
 
 void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
+                     uint64_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -70,7 +70,7 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     cpu_loop_exit(cs);
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
-- 
2.43.0


