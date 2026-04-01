Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA36D35154
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 20:18:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w821I-0003e7-8P; Wed, 01 Apr 2026 16:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w821G-0003au-O1
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:18:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w821F-0001cA-6G
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:18:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43cf8fe9c2aso95641f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775074708; x=1775679508; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zFCy2/f6gXgpLVosgl6P0mdggO0d7nONWw8yr+5Eo4=;
 b=AMuGWRfg2lebV8AWxfgBIxgd21AoHoVMrFot+MtH5KXmmPNrkGsYclN3uqtxCPX1Hh
 YRDlkrLp3bMS6IG07/yPItWJRnyp09cRlP8/mirbGwt2wL0KXfLX3vuIIxRgrrL+lOv3
 PN9iALMlAUtUZC0Tb/w4Un4SdXBiGxmnjBlmR1AyWDPElO91ls3qSdoMpQjPr1Vwb3+d
 2BBOI5KvR6b9vd+20EcXgzcOhwoCGDE8LV7BV2tELjU4U7qyC01lRe7KXOPM2t5c66oC
 e95Vf6/cf+QdweyXFS8s69qdLNUK14GkePcUY8yzW9t2b0S9H40T3JPc7jeFaESy+S5w
 qGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775074708; x=1775679508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5zFCy2/f6gXgpLVosgl6P0mdggO0d7nONWw8yr+5Eo4=;
 b=Vqk43OL+3ub+ou1CajxIHTMHOZAldsqU3W1rxCI5OUoNt1A2JvfTWVVspBmuBY9I+o
 FPXi5Qix3wmnXtUXv9tAvab4MMbX5+pu2pHOGup3j4q7YPqFW44I6dd90NJ8EafzC4UY
 baT1hYfFe5M8fDCTdasCyUMkoogWl3go45suHvastmnQcF67DimrnD130syAylmmswxy
 5snzk5dcq/O4qihkagQCWMgPTACvz1dXpSoxb2mICleJO9n1tJyJQCoEpg0bySPU8jMO
 dPz8iE3sjMCko08Wuj69ocB10DMMQwIjSuF+UKy2nWG8KRkxJ6IP6ccPpgzc3Y4fg4dt
 Ag9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvNtrmQbNai3rDlyq9H9AfwXxmzjzaJE2yrE8brvMOiyKPK8Le3x4dEWJPIR5rpRLgEpiCmt0HkQ==@nongnu.org
X-Gm-Message-State: AOJu0YwXqUBtpLqwTOHIeHejya4q7veK7DyRdL68ox27zizBfr2+SbdH
 Ew6k3jidCRPJk+L1AzMIafl7HDxDsafWFy4pT2IAF5thrl4lHRuIrFU88qyl6dNQIJM=
X-Gm-Gg: ATEYQzyNQMHMtRC20DbfHlxMc1grVPdVz0lPRBIwZWfnKRnzO/oM/iNyS4u2GVXUmkC
 TgP0uu9unEC8lx5k0Tx3Ff1V8pTdEJNIgibwGVw0sRdj2mM72/J8M/Xody9Wf7ske0a480SCEkh
 9cSipLo9cRmpmMaR2VLJwpbh3lWcV2HAHzvKMPGHLTsLANf+mjgczXCF+ws2hEpLB//Q1yylL+Y
 1yp1KQ8hY2hcm3v6derkJCH9Z8mp3Zf5jiiIqULOCTI9JYDIIY+AGzhAMbiF+oO51mXGNwm4tQC
 VrZcCU1WZBrvvTxNXFzg9OKzlLM+lfHnTNoM7vhOFED3GzlAv2JPl5R2UEZm/BPbvOxykOs7H66
 pdXbiU9ayogoHxhJLY9Jm85nD3nlplmEo3Orts9wmj67IdelgxjRXyPYzgQfPDI3UZ3hVwJgX/W
 kYCtS36UnsgWRyo9KN9PDgdEtwafGvU/stfupH1yNekTaKQdl/WDIKP8QpXnQODQzxeDNha5se
X-Received: by 2002:a05:6000:1a8d:b0:43d:131e:f74d with SMTP id
 ffacd0b85a97d-43d150de841mr8704518f8f.44.1775074707594; 
 Wed, 01 Apr 2026 13:18:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c5468sm2487593f8f.13.2026.04.01.13.18.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Apr 2026 13:18:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-riscv@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Anton Johansson <anjo@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, Bibo Mao <maobibo@loongson.cn>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-11.1 4/8] target/arm: Compile WHPX as common object
Date: Wed,  1 Apr 2026 22:17:48 +0200
Message-ID: <20260401201753.92290-5-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401201753.92290-1-philmd@linaro.org>
References: <20260401201753.92290-1-philmd@linaro.org>
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

whpx-all.c doesn't use target-specific code, move it from
arm_system_ss[] to arm_common_system_ss[] to compile it once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/whpx/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/whpx/meson.build b/target/arm/whpx/meson.build
index 3df632c9d30..db31e928012 100644
--- a/target/arm/whpx/meson.build
+++ b/target/arm/whpx/meson.build
@@ -1,5 +1,5 @@
-arm_system_ss.add(when: 'CONFIG_WHPX', if_true: files(
+arm_common_system_ss.add(when: 'CONFIG_WHPX', if_true: files(
   'whpx-all.c',
+), if_false: files(
+  'whpx-stub.c'
 ))
-
-arm_common_system_ss.add(when: 'CONFIG_WHPX', if_false: files('whpx-stub.c'))
-- 
2.53.0


