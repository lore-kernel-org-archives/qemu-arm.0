Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC49CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:50:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcai-0000jM-Rn; Tue, 28 Oct 2025 01:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcag-0000dN-O1
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:49:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcad-0003oN-Tw
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:49:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so38411335e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630590; x=1762235390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Jp6xdYt7Qm+0J/pdgQITMBLjBSEIftoO6mxQrB4mn0=;
 b=AvDxXoj8Y7QsNS+0FarH3Ngzo9yIbsrbHotWdFQ4aWmFVT7XncQa9Ni8m9hyzDXawi
 vxIdCFqBx0UoIbcNxqrWwGeLZWIDIsz5ErJ2z6w3e28H3i+/7vp4YdMptLE7FfYI2S/j
 uDZRzL61DzoZtnsRG84CO/7wnIo0y05IPRaCiXKL4eh4Mpu3BhF9AvuGY773afeQJ785
 Xi6psoJfST8TzZSBoe87RtN/ks9uDCIuCpIkrUsr/wMLXxlUnh1iWHP0URaJFm1IxTu+
 cBmkQRiEjj60PYV0PTnBdflxhk4mhZl53D4DZC9nvZ1zcgXpDg7l3BVp2O4/YhXp8z2T
 1WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630590; x=1762235390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Jp6xdYt7Qm+0J/pdgQITMBLjBSEIftoO6mxQrB4mn0=;
 b=exMa4WcbPkETd+kgTAwbqDvdzDOLXySxVMYDgL9Kk1ASy0gohGJbxDpdeRzZF0z3Lb
 I/cfMW6+YZem/olStRILRb7I1V6I1iGwhAXwfZqBvD79aVWYp4arMGVc8ZsBQdTs8UcN
 ZkUYqATjgwzKx6OSLo3hUIhnjE1803a9KjjhHG2TMj7WlBBa6767r3D8lb++ANXy0Sz1
 HUbFp/anIxr8z/CujIJZdAVWDaPlxtxJLu2Y8p3LcYKAiueS+WGGamjqBD7KvPLpjnx7
 BwMm9AAvZxnTwYIdBQ2XKjBTq4DabBBZi6k3skVivA8QLx3MpBm8n5kvIqJfOTfESLIy
 vLcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKVw5WYyJDbNgKtzrJZZmFo/LaZtJk6yxX4PQIN8i76czMdfiPAGkWMw0TA0KVmZxwfej3wFaDRw==@nongnu.org
X-Gm-Message-State: AOJu0YyjlLf1sX/fzPSRjYhGGUy7c8F89z9vZ0wq56lIglOogE9Lis8m
 2JVnsLt4bb4wcWb7QsYVRBVenocFrvza3t6KWI7CoEPnWdyJHvCyOLR7tIaL4U298wU=
X-Gm-Gg: ASbGncvzMmkwaETch8q1WqKD41cjQAE1g59XieRPIwkTtyz4TIvsHRMRyyRlxN8mY2K
 JR0QB/whlEPnbeVRXxktkh1lD2i0+GR3ZQUomDPYR1EdxxLhmpc+5zNCoY3Tz0rKUSCgPJcBGD5
 +UJDl1ohbPTxuqh3mHSoFcW4w4/KqyGwlYGzPhQ/ACRaxVc6DwIUJC7mJ+rRycBEzeepdXjyyxV
 s49SwF/Aik4mIU75UmFsZC0ghxITZZEBNO8ZdljxZtAR2eCl8ta8gDEHT/topUUkhEbtlCFIt1B
 djJF02lgYbtM63hREZt04jfgFqrT64BYXzAqM2fcLVXDOXG4DsiO/Lx/xoOz66IXGy1ML/MIlvt
 FbrBrMVWAzgyeGIBaxiV5kNzVHG75PzaCoqX3wdn00sP+tGV3QW+8cOdJttMDcnz8pJ+vrE192q
 BszxVqaML9fYWePh3hvVv2Pt9OG8rdvlS6wbmDVTgOX/ZyB29pWyMtt5Y=
X-Google-Smtp-Source: AGHT+IEU20PyYt+mTWr/WoR3K9FU/uUyz2i4zBcQyRDIjhExevt4g1PL7USbQzRHZ/Jtm/24YzR3sQ==
X-Received: by 2002:a05:6000:1a8d:b0:426:fb63:c01f with SMTP id
 ffacd0b85a97d-429a81f1f4cmr1599784f8f.29.1761630589664; 
 Mon, 27 Oct 2025 22:49:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db80fsm17775784f8f.31.2025.10.27.22.49.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:49:49 -0700 (PDT)
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
Subject: [PATCH v3 10/59] target/arm/hvf: Mention hvf_arch_set_traps() must
 run on vCPU thread
Date: Tue, 28 Oct 2025 06:41:46 +0100
Message-ID: <20251028054238.14949-11-philmd@linaro.org>
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

Since hvf_arch_set_traps() calls hv_vcpu_set_trap_debug_exceptions()
and hv_vcpu_set_trap_debug_reg_accesses(), which must run on a vCPU,
it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bfccf5e9a2a..ee04943b0f8 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2192,6 +2192,7 @@ static inline bool hvf_arm_hw_debug_active(CPUState *cpu)
     return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
 }
 
+/* Must be called by the owning thread */
 static void hvf_arch_set_traps(CPUState *cpu)
 {
     bool should_enable_traps = false;
-- 
2.51.0


