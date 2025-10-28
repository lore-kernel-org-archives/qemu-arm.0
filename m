Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740BECCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:17:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDd1g-00089L-6Y; Tue, 28 Oct 2025 02:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd1d-00086e-VQ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:17:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd1b-0007Pl-Qu
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:17:45 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso58004795e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761632259; x=1762237059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMDbgyBSsHgV3ZURAPo979wxtIvTEY+Ozps1vZGgi5k=;
 b=luFp37YGOIX3Bw5w3vTIfwbAV4aZTiynW7gF+RlUsGEcF6PtCTgU8SHcGxcMqEEIbj
 nVysFtktHLt13cXoaex2ahz2NzTkGQZ7f+zxe3BkOYkj3MDTQwHWMTBeaE0L1KTEHWVD
 V5EzF4RMSDeV3dA6h/XxYSHvDe1O3DYian6VNJpec2yW1uEBXc4VVgkDryY/e02/Vrnd
 VWLqgiD+uNr58PQJrwTiWlB8zSYRaRxU0/yXltiqQRPYOXksksXtyDu0rRs/ui1RXtxH
 iEPlyq7D1xEd34XGdzOuFTWtLsd2lxjYAk//4ZCJga37qxZPzhnMR3V5NJKMo354ojXG
 lo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632259; x=1762237059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMDbgyBSsHgV3ZURAPo979wxtIvTEY+Ozps1vZGgi5k=;
 b=qZT0BFhc7uZiY64FmqSfGm0Vcte4xj2qTir+2Xz21wcTs02dJRvqjR/d0VWOhXcTnu
 u2S49Bicmd10DWaI1xvt1BM7loVRKz5K1z6GIAWg4bOEnacyUho5L9EonCWoWsnyS23/
 dU/9V+I19KORGQNoHcNxo47iRmfTX7uq+yjdLOvdGYZaSWwJwBF9xID8R8ov4UMfdath
 vNz7EoOw3bJRS+b4BNbdjhO8ezSCTeGllceVcSdswVFGshmhpRQ34QZoW7iSpRaBswA3
 NMUr6G8n8uZ9DvyKAlVthS6lLPq4aLjpdrnJAwAXa6lXO8t0yZ8os7kw2uT+3sXbWUuh
 9NDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBxfMyKqTJYsiWJc6iTccUNF4opkSIe7Hkf2ZnmsuVcuvmSxuqjtS+kT6NWPeg78y4S+SfcKtxww==@nongnu.org
X-Gm-Message-State: AOJu0YxlrHlZd0A8PlyU4RasVUUU3+2k7COTZe+DJJryRI12R81YE17C
 i8EC7F+VAzmrVUAV+0V4EMQf5WZP9k6dmLk8kCk2pMJNW6x79Seuw8q9Oap+PKLbbJQ=
X-Gm-Gg: ASbGnctcGKhKMbYheRX7VIhvLCHm8OAp/3w1/dlgJH85/5nrt0qIQ7RiCTLMMqEzPsV
 Ea8Z+1HPWKJhXgB8uVdxgbwE39x9nCgUM3Rw3WVHR8CiAxfeGVYNsn8SMyOKx8H7oiGlAwIv8tk
 jxoM5gKdpR7SOVTn3bDJg24SxIfWb+VW1MRivsLeBHegvn+3L39tDO5xV2bNvhZuG/xrkNguqC+
 im/o0eedzOMO6ZAmJJzE6oRR5w/o/X6HKDKddPPpp0rQ8D/MQwnI/cWV5tRfNpvp3cQ0Qh100jA
 MKkfm5+cZww/EUfa2is2xZFpgom+NYLogQ3mOHq93flFXT/8tFsfKJ6KmZFMk43TNkw2L2gdCqm
 00sAF/KhpC69r3qflvviNvcSS9J68OEN0J43LLRdQjUSpoOjP6XtJJBvSeNt9Wv1hBErpaehqUX
 DkJ1MqjWEjmcEYM7neG/EC9EwBTZdDtXcT4ANodf75pTjAd5i73m/L4BM=
X-Google-Smtp-Source: AGHT+IHFECdAcgICkOM03nPICzPy3sqpxv0NcVT45a6B84vKnBiT0HWcTNsWo1qMOIGI9Ucb2UUU/w==
X-Received: by 2002:a05:600d:434f:b0:477:19ad:82b with SMTP id
 5b1f17b1804b1-47719ad0cd7mr4564955e9.25.1761632259374; 
 Mon, 27 Oct 2025 23:17:39 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771843eabfsm12929205e9.2.2025.10.27.23.17.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:17:38 -0700 (PDT)
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
Subject: [PATCH v3 49/59] target/arm: Only allow disabling NEON when using TCG
Date: Tue, 28 Oct 2025 06:42:25 +0100
Message-ID: <20251028054238.14949-50-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
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

Only allow disabling NEON when using TCG.

This avoids confusing user experience:

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or neither

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=off: Property 'host-arm-cpu.vfp-d32' not found

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b392374df98..eaf76532eca 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1460,7 +1460,7 @@ static void arm_cpu_post_init(Object *obj)
 
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled() || qtest_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
         }
     }
-- 
2.51.0


