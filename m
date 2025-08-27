Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD83FCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:13:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4ip-0002uP-5G; Tue, 26 Aug 2025 21:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hY-0001I8-RJ
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:49 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hI-00009T-Rv
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:47 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7704f3c46ceso2846274b3a.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257090; x=1756861890; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYMBiKJq8/lsK6z7ljr/lChjjHaZZY+QCsjrhv9wKe0=;
 b=teEkHtCBqjtIfzdKu+OgvCjfvEMBEyT4szeuTkgJF28uYsMqPhizCUmiYjTWu9W4p9
 McrRid9pNgAx0cH1F3abMp3EHYvnkqEYUGl089xdaY+YhwO3LL7bIgWBeHpz7WlUxx8t
 ZvcqK0P3EZ6WV+cwrejme8yw8dZD6PH02dihu960ThysaH4K7vUuH4s6Vxm4wKCulpbx
 GfMWY7L776Q/mxEW7oYzKZgFPZw2Cou6e/SKwYG7wQyU9uQVN+AqlIORhAqR0JeHgW34
 w0G9Wddga7qDrqdwTLfgAkcLvic5emh1TwsD2+tOUSh8oz56BJH5Tnsbos9Pekb4wLiA
 DX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257090; x=1756861890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYMBiKJq8/lsK6z7ljr/lChjjHaZZY+QCsjrhv9wKe0=;
 b=myn9EVjuhh9TBENF/530C+SJpiGjdiuLm+ufFAQt/uShQfj8c3MqXww+zAD+92HlO2
 tgafGyu2e0rNbKdEUQyOUv/E+e/d75pexN9p+sPJDLuMlgXFz+kHHals0/yORAWi7PRY
 NS2az5AWl7sa+4BF97VEY+DB4mCCWoxzW/4pdn3OlofbUDZflD5l2NZu4RZj6aaH21uZ
 FmTWLhtMSvANWyBOQxEDUfLmr6sF2FtKc0Yh23hCrF4lRxgzbs1seSng+Ki/ETks3Q41
 x3Pf/PN1Lz/S7VHe/RuliQIUwXH5CESAeQc7A8yqOuDWg4jPP6nFxuTruvFWGANxe/Yv
 Tb/g==
X-Gm-Message-State: AOJu0YzxjSvXIT1wZfQNMv9qaqECSP8jDKBiovJ+mAoJcjsW1QUISTLk
 UIijdzXT2JiedBBprDUwx23FSekyvsYJKrwkYb/TGnmHRBfOYVhV4aThgx8zl6wqDcw=
X-Gm-Gg: ASbGnctFcRRkI0Hu1fUr/s9UdqSjHUo8ydpRHK2JDkA4UlKWCSEv+ZTQSShhjeXds9G
 Xuj3+tNm1qDS8uRCdBJdPgGYrqotevjex6/aAoIoSFxe4nWAv7VCR9TV7GZzy8i5oyic2S+YtF0
 Mws7/vIKt6N46W79+qChJ9pUO7n7c546t32tTYPG9+XmB12ONSBEVVtBi8Sno9DJLwqTleI7A7K
 hJ+XYLIlii1cIdb8iTNVP8s9ZlC4YvepiLbGeiho95h5Nkb86Nqw0BBP/TZIiEKpeN37RnTGX/P
 TaL3yQOC/SpI2/0a9sur2amfoZ3JTT6g+QPw7Mu+OXgKbFiqzXBvKd/rY1YnfOmfcMYD1aXH36c
 vL4SadUuFhaTZv8lbeeoiwXfWOaVNEQtdHwI2
X-Google-Smtp-Source: AGHT+IFAFET7HGfCWqmGxJ2/bmvyMn8AvMthMTMaEMNA3B6bzAEknoU2pFoPRvS0a5T9c5T7UWSZ2Q==
X-Received: by 2002:a05:6a00:3d0f:b0:771:f520:f775 with SMTP id
 d2e1a72fcca58-771fd6329bamr4304075b3a.28.1756257089626; 
 Tue, 26 Aug 2025 18:11:29 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 46/61] target/arm/hvf: Assert no 128-bit sysregs in
 hvf_arch_init_vcpu
Date: Wed, 27 Aug 2025 11:04:37 +1000
Message-ID: <20250827010453.4059782-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

HVF has not yet enabled 128-bit system registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bda57614ed..c05e81b4e5 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -896,6 +896,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     env->aarch64 = true;
     asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
 
+    /* No support yet for FEAT_D128 */
+    assert(arm_cpu->cpreg128_array_len == 0);
+
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
                                      sregs_match_len);
@@ -919,6 +922,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
         if (ri) {
             assert(!(ri->type & ARM_CP_NO_RAW));
+            assert(!(ri->type & ARM_CP_128BIT));
             arm_cpu->cpreg_indexes[sregs_cnt++] = kvm_id;
         }
     }
-- 
2.43.0


