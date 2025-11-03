Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70233CCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:19:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrek-0004bf-HQ; Mon, 03 Nov 2025 05:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFreg-0004VW-4w
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:19:18 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFreX-0003qv-Al
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:19:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-429b895458cso2708123f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762165141; x=1762769941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMDbgyBSsHgV3ZURAPo979wxtIvTEY+Ozps1vZGgi5k=;
 b=H0/Px8frem0o4y6a6g1rr6jkWB1TSSotFn3s7HP4NEUpEZINy9mMtdWkCzxKvH5AjU
 7N2Vj+H2/uNbD1OyNw4z1JyB2LS8pHYSaGw2WVPCbhT7kNnprjU3RnhC5esdzui6qZpk
 R5D/d8m8MW8+124xg5QbCWOKk+Tb093Xu+Ao4O28Z/YF04ooQzvkfQJnvKTXShAoXF/E
 ha1i07pam377H3y/8HbKIEQYtyY0Ed9HTNYpnhkZVWdgB7tyuKmRNfl4FWJ4dnv6HsOs
 F28+rDHJRLiEbVI6rANmW9VWNED8fYbETJRb5KlfNsQuAv72QhV5krrTcioPEqbKL6Pm
 /mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165141; x=1762769941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMDbgyBSsHgV3ZURAPo979wxtIvTEY+Ozps1vZGgi5k=;
 b=cYkqcDlEuj1dEJE2aihDq3t/d49rtopIx5oAwu1tAw6DtFhP7Ej6yyea5LhtlPswE9
 isnv88Z/AX4BY7d5f0RoJQ0riBN3WpryP6sAyjeAlibDEe/A2xOf+mxmGVHcNXADYNdI
 57hHc24JmmSn9RwJO1AkNLUbCRZYS8UpSyE+gYYg010FjdgX4l7KRseSAS756IbOsj2w
 Sh79IGiGs2YQV8BE8x6Wk54V9pISkY55xo0NAqIhqGHzsRM0+0/eQ05V0nMmS6UgW7wW
 KXO+UBMOjKiYh6VcLP0XwNZSY+5bPH2LStmNnxsla/rrUuxKLay6Zw74zXje5kVjqj8N
 iuXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUTpoKlSc0pR/dqCuT3lJAf5niHzomt8dq31xuJdXxx4YCSvoEJ5QNLMuwtiMI0Ln5ddNYxtwfkA==@nongnu.org
X-Gm-Message-State: AOJu0YzAGrAEZcBm4cO7DJTD2NnfSq3l70T6oe5eaeejIkkO34Bg9PUl
 McwF8H3wVoGeEAdAbk5epend7fQeoVh1WsU4h97qB/kO7HGKP9chCV6CFtAQkHfwwoI=
X-Gm-Gg: ASbGncuCdCUpSSdRFLzbAHIDcjZ4vCBMyZ91/g4ikSZewFmm0i+RWpHvGe7A00sh2bT
 M51M1xUKJeL/T/C+aJa3AQn7KmEi4J6mWY3k97tob28O5PCqoF+q5J8gE/tu937GZcIq0XFHMzi
 X7IN6ue2kPOlDSCjFfZqHcoAuuewhcRk4i4p65ORn92EVcxg02kNgLcFsxQ+jZ39UrQjHgjEhkv
 T30ssjZyx/UNJLzwpOM1CAG0O1625iJq+JW9j9ZMUw26AsXqEqTsZYiZw2P/jZgy8NkWNn8Q9nN
 OTlfLvJfS/V2k2pqTbfJ5oRsP9P5dzXQpUjJPFWcJ6CM5CPDCPw8dG1RmpMik5RG0wy6WIEfBFC
 jNuYHCwhT3+b/M/gI/zmxqUGZXrvrt9+VSHPz3yOKhaJNuykLwtVqkhX+4KgaPD5O2Qvw5bq6OZ
 1dSCtL5v8PeG5C9p0vTZdg2rUeXxAVBIicpzA7kHK2k0/zCjs6GveDb/0o3mxV3ZCNRBArJA==
X-Google-Smtp-Source: AGHT+IEew+fkDxf880QsPHk6Gp7xa8f918tG9GQSwtIJ3D3IHUIJU2SAnjV9AL7n+01tFicGY8Zjmw==
X-Received: by 2002:a05:6000:2306:b0:427:652:b7ff with SMTP id
 ffacd0b85a97d-429bd6ade1fmr10263405f8f.60.1762165140879; 
 Mon, 03 Nov 2025 02:19:00 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c416a0e5sm18885013f8f.15.2025.11.03.02.18.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:19:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 19/23] target/arm: Only allow disabling NEON when using TCG
Date: Mon,  3 Nov 2025 11:10:28 +0100
Message-ID: <20251103101034.59039-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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


