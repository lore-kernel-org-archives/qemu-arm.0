Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC38CA1010
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:09:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkQF-0001gH-Nv; Wed, 03 Sep 2025 06:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQD-0001Wx-TM
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQC-0008IM-6A
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b8b7ac427so19973355e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894135; x=1757498935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hJcWTbZNWpRlTWwFb3bqsHmH4PKWMku07t6H1FpspU=;
 b=Lsi9HKvGx5UTBIGULwTZ/LN6vk+sDxTS7xh0UZFYlklpccygh4aOnpSBU6SBOl/6RT
 8oMMkTYwaTcee/5PHGnmLwB91owDfrSNP4gfLcx37E+nA102wK88l8u6nAhrGlLOD3iR
 m1dpV4JTUon+4kkDNOfU51JIhz9kTWbqdyEA5N/ufWDPCsAo9qm6BN9tAEeIf7MzWXs+
 hSkKl+z2KZHDNxKTvfMKtrXTLmaF//ywETiPIkKBbU3maKCCbFb+udr1wrm8GoHz8/6j
 Ps0b40UwdAynTF7vw7WCuSlJT9Dx6D6gFyDXHiS3ITf8Clku3JswEcBng4D0yKZg32en
 BZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894135; x=1757498935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hJcWTbZNWpRlTWwFb3bqsHmH4PKWMku07t6H1FpspU=;
 b=IjShzu/T4c/IfSeMV0lI7sib3SDsa9oM+Pw9b24q4Ar9UlpnDR9Mp+79plUmWElf5Z
 luXb34A3DHTV21Ix0Dwi+dIu5ZWOFku5lidsw7+eq42JKjaie68ZEyqPGJgWhrunTmX4
 BNW4Xlwflw4fC4WeqjuaNm2hUzdud2MkGAMDLVz7cJsjY67cd3r+JVVIZhf6LGr9RA3S
 D5rGQUtslXTbWGx8p4BuBuqHLnrMzIIAJHmGcyifM6sm7uv0bZd52vx4xV8ybQzDFJfk
 hoyS3zO2j94hyE34UODzzKXPVVnL0yMGbuT+yVwS9nDZmSAUaKFtOY/2YMFYQq78pont
 hWDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1hgPMfXOpB3mtsyT/T7Ce23ty/AM3DbYHzUhG1/EKoz3JFdfg1D6VWccUkzbQ9V8Bv31lUtK1fg==@nongnu.org
X-Gm-Message-State: AOJu0YwEbjj8Vta4/JtN+16Es5WHpOCYB7x76UzV4DLR2/fohNPyFGuc
 UuzUCNJsUxK27jdZgvSldl5draf84/XiMKnp0ac3YpSZKcdB7s9EsS2EElGqe3MomHs=
X-Gm-Gg: ASbGncuwyeHjj6yr+2g0tvEAdQn0v5EA+rPNWCZSdjGlmvMcg7NeEbA/38QNprIfAQO
 V6KbYPBzpuFHDfitMFod5A6hNg+0TQ/dmvZ7Kxff9DRxcPyJB4MA/38V23aJWil3pEDl3nlpEHB
 F9dOZWnogCKXQ93C1U2pvpWGxCwjtdSrpF8RAorvue/yygTs9/+Fn8naieoLbILCQQbth8+z0YN
 OLGtgxbTZ7G2Cx3PzSbWvh6QIJs9LXNJz/7RGWG49wKVlcOIhCxx+bqsiT4ZbGPGaSmlGfPgaSu
 NoHbCrgD8L/R95vuAXTJHD62ZS9h44mGpil+Lm3z03zDxkOuBkeD21O8PqGv/SffoyiiyBDzJnt
 D/tTGA+qhmlh1tld/duWBvIcPZu9NywiGCdvPYQMRTorsZVR/lVl+47mszFmbkFQza5OZca1Nlo
 uIyGa+Ig==
X-Google-Smtp-Source: AGHT+IHJ2weooLV9lXzOzpv/5FibQGep5h6i2FsMKbl5JvOAlYDlifGXspkVb9JaSIw0knHeVP5dlg==
X-Received: by 2002:a05:600c:46c8:b0:450:d386:1afb with SMTP id
 5b1f17b1804b1-45b85532ec8mr128525215e9.9.1756894134567; 
 Wed, 03 Sep 2025 03:08:54 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45cb619f321sm9982315e9.1.2025.09.03.03.08.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:08:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 11/24] accel/hvf: Mention hvf_arch_update_guest_debug() must
 run on vCPU
Date: Wed,  3 Sep 2025 12:06:47 +0200
Message-ID: <20250903100702.16726-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Since hvf_arch_update_guest_debug() calls hvf_arch_set_traps()
and hvf_arch_update_guest_debug(), which must run on a vCPU, it
also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 0c335facc3b..241c668795e 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -83,6 +83,8 @@ int hvf_arch_vcpu_exec(CPUState *);
 int hvf_arch_put_registers(CPUState *);
 /* Must be called by the owning thread */
 int hvf_arch_get_registers(CPUState *);
+/* Must be called by the owning thread */
+void hvf_arch_update_guest_debug(CPUState *cpu);
 
 struct hvf_sw_breakpoint {
     vaddr pc;
@@ -109,7 +111,6 @@ void hvf_arch_remove_all_hw_breakpoints(void);
  * handled by calling down to hvf_arch_update_guest_debug.
  */
 int hvf_update_guest_debug(CPUState *cpu);
-void hvf_arch_update_guest_debug(CPUState *cpu);
 
 /*
  * Return whether the guest supports debugging.
-- 
2.51.0


