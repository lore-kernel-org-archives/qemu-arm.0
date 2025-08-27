Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F60CA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:13:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4i2-0001p4-Uj; Tue, 26 Aug 2025 21:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hX-0001HY-5N
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:49 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hM-00009B-BA
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-76e2e6038cfso7073944b3a.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257087; x=1756861887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ru+zkqkr06yFhMECXXsdeWAo58OIAebY2k6d7rRmYv8=;
 b=sHzIwSCSW2TZMcdrstI/2lv3V8CwLAJ97Q7dBrb3a/f9UA3/E+Od3wXZ6Bm/algYbb
 N9tsrrVrD7mYLgrVt0gwdA5GBRrAdDsDC29tR2iK1c9vk7s5GISi63EH1FpnC7vbvW2k
 adI0vm5AUqMbefgOQPQSrENST/W9dmVFimU0jb5gSEA8MXb8SqggJ0r2N9eGwWvbAMQG
 56FLcG4gB+CjXlU/C+6Ysv6+PUZrmkmU4/Ide/qrtUEWLQz3cRL3ltZpyYm1PNQk7vR5
 FB0w5TdQvh4eePS8jRp4Z6fekt0U+5PoH0yp3eNGZSIokNa26ecRCsqBt2YCdWIQXzdE
 MlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257087; x=1756861887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ru+zkqkr06yFhMECXXsdeWAo58OIAebY2k6d7rRmYv8=;
 b=TwuDcI2TrgIKTbZIHV+7LagnQdYZUl70U1dH/iT/DePEewWVo85zYVHmQxCqK4b7fP
 Av92gWE3XitLoeOYEPkcV0Z1XF/JffnCoYqLOBckUDge235pLtgqocnWKtBdnGi4QH50
 9q8intF/OS9AZROFwHcTC1GpVUeyVKMdXMTaAZHmC3oeyvOkaPkdfqJKgArCH6NLY+Ml
 E5AYtttvGfVP1aMKUxNLAi7i0HWdh5Jxfrpb2UdXb5rduWI8u09OcDpvHIRGnijv41+3
 T0LBg7jJcwvDWDpSvRg/QT78f/NA3VYdUrzBARJwfAljmU/SOOUkVuOtwQYg3iRF9dRR
 Su2w==
X-Gm-Message-State: AOJu0YwNpxKq7x+1TdqF727ol3wAYjRkdZ5I5YuAh3iBrOtEAX9RXR70
 h7L2/PUjDBHcVwMTTdvw9RRk6n3b8kULUp6yNSYHUwupjOv/XUvEWUFb65JS7+Ekv6sQGwOUylJ
 tIyxSBYM=
X-Gm-Gg: ASbGncugABkDkeJ7t7qhZudI1oI8ScQBIL5Ln6YCupzbwuJauk7xqouyhQxyM4oZsAz
 Ki1+gEE5tKwzvj0c1GS6B0LhKi0NpcAPMbIs14DNU0dT+wbkLRxy3soDcknobtr5zh21dLnYjTI
 7OOju1ps/DGlfsYqATJjmO1FpMJk/OL4lX4LbkZw1txAbTgvwmLx4E/RY4msSgRsmdzW8HPAlmz
 pwClW/Xzw5AMfOzFEQRoelq12It90UPU9iOnyiJq4dYXTPMvM2r+bwDQ7LFCc3bSxboP8Qmbnpi
 NEplWT6rO/rCaivEcwFFVOAXJ1xSmQZM2RsW5fi80ubi7/p+Zt1qX1yMpZ/j2VXO8Xccw/uWdC8
 qiX252aSpeMtsfeC7LcwVe5WEHw==
X-Google-Smtp-Source: AGHT+IGUkLAlYe8hrAm3tLT7bhBS/qc90gC+/iZcUYazS+zdqR3jVkMhsjj7ALPnjydCo231fV/W/g==
X-Received: by 2002:a05:6a00:9296:b0:771:f309:c04f with SMTP id
 d2e1a72fcca58-771f309c572mr6566051b3a.10.1756257087207; 
 Tue, 26 Aug 2025 18:11:27 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 45/61] target/arm/kvm: Assert no 128-bit sysregs in
 kvm_arm_init_cpreg_list
Date: Wed, 27 Aug 2025 11:04:36 +1000
Message-ID: <20250827010453.4059782-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

KVM has not yet enabled 128-bit system registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 9e569eff65..53c79041e1 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -803,6 +803,8 @@ static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         arraylen++;
     }
 
+    assert(cpu->cpreg128_array_len == 0);
+
     cpu->cpreg_indexes = g_renew(uint64_t, cpu->cpreg_indexes, arraylen);
     cpu->cpreg_values = g_renew(uint64_t, cpu->cpreg_values, arraylen);
     cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
-- 
2.43.0


