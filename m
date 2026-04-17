Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5878F8DFF9
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:34:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn34-0007L3-AU; Fri, 17 Apr 2026 13:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2Y-0006pv-Qf
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2S-0002Ac-VW
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43eada6d900so875761f8f.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447091; x=1777051891; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shHgd5IXd9ugN2LaWGuic87n3p9WQdk8Kks9qHd+fso=;
 b=nXm9Ixy0uA6jAh8stYQ+34djH/0hWG8FwpRo891E7RRDBiR8eTlM6xgsC6o3Fwn9Pq
 j7Muja+ZPFLo8CnCPiYV4Knt6ENw42dO0NIMDqTF8WbHYa6pVRw0JhlKDXH40147N4Q2
 9jwUxCWcm88nFKAcjKnVQn9Mt4jf4FyXIj8scHM8DGrQeUrAT/sYSk0pfsWtD5eiuvDZ
 880l2LL9O440mrVo8Q4v7JeF8d5YBqriiR8yQztgqloWyQdVJa+EL//z9ozdB/d3RA/U
 fMONGlwJyBB5WgtKiR0HKzlq9gRU2A9oqrL4pDSEAkryjQjor9JZIKkIx06HHHIj+ihs
 R2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447091; x=1777051891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=shHgd5IXd9ugN2LaWGuic87n3p9WQdk8Kks9qHd+fso=;
 b=EBNrxZc7g7BE2D+gSHbbUkI/6aID0UVPCVO1wF8uWjrEbeqTAfcjLgdxElkp78xmii
 8i/RlIE2yiMMuxSdXUcIuwrvFuL4MnSdjk1Cj7N77SvHfRPqVSnfZzU+i9IdBOThJcJW
 PzHp1A/magScFnO1WTI8UDg216g4437hwHSbdvszWingN9LKwxjI0jK5ZW1D+r228XJw
 8zT6q7GlZFWVmH5n/9Qa5DK7oZDkJyrRm7TIXX9TWdHEUf9f3uZTlCwpZksJMqUrwVj6
 rlK/H4XC38fqK5/t4djp+QCggs87sR1tOESiEdHLT7C5xJXHwmkgTb/KQ98azoID1+Pq
 nMKg==
X-Gm-Message-State: AOJu0YzWB3AlPJfQ02v7XnJPQZ3Q2e2gs9EkEQa+Ihe2GW8MgHWk9wyk
 9DnJTLpwJ400shuh+VCDvH9WkmV09FdsuUe/regfdZ3efikyFMQhuPHHDj3MCvU9r2hheMVHr+3
 D4Ve8JM8=
X-Gm-Gg: AeBDieu2deHSnzb1YaRzIHrLnk4bQOOtTA/sPBgx7Ws0wy775J5QDoZTCSGzYo6kn6o
 EkZ93cQrUcTs8B62uGb/7jk/99rcPYdcKCkz+Jmo8coHJFXLZF/3IEKi6Rj6ylOKmmBMgCeWNH0
 tNhvTfgmXRLXdIIg53WtwaLnzzB/Yr/mhUrHjm2sLkJmBZBuDSwy63J93hFQWm2yWjthM2lgQ6F
 ls3lU+xqCTAizdAaRZxjCtEbmGE5XfB2gaZ0WaEUsVKf74tkSLLg0Lz58cZFZYAcKQ9UzRiG/Te
 hOTgZd0O6Pov/agPXSoJq4qqqMYg8ToRfSrRWWAGpeoZl9Tg3+kOcHTZ9UkXVMR1Gpgh1O6NRZ1
 Pxa1pf2+iiM3NQ9/9DWxYmYZ/rW2sy3A65owN6s21OIfkz9ppkYUHT4aQAkbBGwty9vNM/JyFtq
 ZKaKZxAxvfYav22db0VzXZ7dxmTu4lGPSHzmoQp2qKdPapoehZDy9v+Ahst3jd4Q6rscshREtPa
 83HxPpYaJaI2IBK3z/jDuGXcknSeU+NOGOtJU1Kgg==
X-Received: by 2002:a05:6000:1889:b0:43d:7508:c9c6 with SMTP id
 ffacd0b85a97d-43fe3e0b305mr6268752f8f.28.1776447090631; 
 Fri, 17 Apr 2026 10:31:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 11/17] target/arm: Rename arm_cpu_get_phys_page()
Date: Fri, 17 Apr 2026 18:30:59 +0100
Message-ID: <20260417173105.1648172-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417173105.1648172-1-peter.maydell@linaro.org>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The internal helper function arm_cpu_get_phys_page() is named that
way because of its use in the get_phys_page_attrs_debug method.  Now
we've renamed the method, rename the helper to match, since it can
handle non-page-aligned addresses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f5f624c7c3..8be6f243e6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3922,7 +3922,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
                              memop, result, fi);
 }
 
-static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
+static hwaddr arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
                                     MemTxAttrs *attrs, ARMMMUIdx mmu_idx)
 {
     S1Translate ptw = {
@@ -3950,7 +3950,7 @@ hwaddr arm_cpu_get_phys_addr_attrs_debug(CPUState *cs, vaddr addr,
     CPUARMState *env = &cpu->env;
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
 
-    hwaddr res = arm_cpu_get_phys_page(env, addr, attrs, mmu_idx);
+    hwaddr res = arm_cpu_get_phys_addr(env, addr, attrs, mmu_idx);
 
     if (res != -1) {
         return res;
@@ -3964,10 +3964,10 @@ hwaddr arm_cpu_get_phys_addr_attrs_debug(CPUState *cs, vaddr addr,
     switch (mmu_idx) {
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-        return arm_cpu_get_phys_page(env, addr, attrs, ARMMMUIdx_E10_0);
+        return arm_cpu_get_phys_addr(env, addr, attrs, ARMMMUIdx_E10_0);
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-        return arm_cpu_get_phys_page(env, addr, attrs, ARMMMUIdx_E20_0);
+        return arm_cpu_get_phys_addr(env, addr, attrs, ARMMMUIdx_E20_0);
     default:
         return -1;
     }
-- 
2.43.0


