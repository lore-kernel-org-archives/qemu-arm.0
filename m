Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F44CA5FC1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:51:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBySb-0002hq-VG; Wed, 30 Sep 2026 13:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBySH-00027P-Qf
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:51:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBySG-0001Zz-6b
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:57 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHf4nR3566613
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WiprO/BfxT5lE7ahfMPOMbhDy541FV9UafP7EhJU+Zk=; b=NPzkHbrBlvsD2t4x
 QnunFZ6I4x86lzRUfJWXRMtCg8UGGsowRQI6TBZ9m4p82OucFRnKBxClScSt/fc9
 HHzv9KrioO0n+eVznHuL7AR/7whGm3ktmnBuxQ15hdxhQWGtqqjLQUD9BaLlKK1Q
 FKo9hdkappgx4ZnG0PhaKFKrE5Dy8/oYIDjaGLNG6OwTomotUX/gtobujs2HtZ8h
 Ce8GDJS59kckto3Krzt81Ua1yJYBkBp+0p4lKCEwPvIrWRC7E82cn36rPwNUpGqL
 Nj6DoIwGJpolssURAqo7rrZ+NLedMhiUsdqF1ZCr2+gVztf6nw3M5qZG7eFDrGUH
 xU0QFA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjkyvm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7be85823dadso135604137.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790654; x=1791395454; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WiprO/BfxT5lE7ahfMPOMbhDy541FV9UafP7EhJU+Zk=;
 b=DvyklPkaAy9UO6v+F8wiNYrwGF0LcsoAVeGq5mBpqe7XoXUIvxjO/UZ2hTwksAnB6q
 27E8YUxkOtQW145G8c3mL7ILx6J5Bwg8/Gqd96y/4OXaM7akOFtNK1FKn2PLgbeTiEsl
 +BMGDE39XPUqviv1tk2BZWhtAfXjY1c7QbXoIW2QZcGlWmMeXhfpvO1+W1LObZH/4XW6
 wKIJHowNozoOBZ9/DCibLvQa1iyvcZHuRHyppsegi1zW1mt+T8EK/EWVcf5IZqYFwGlf
 rYFzFXTDGzyggNW2up9TKxkNpfJwFc/eHDnJwmSy0DeGOe3icd0ZFmdXLVbfVfu6Yss5
 35HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790654; x=1791395454;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WiprO/BfxT5lE7ahfMPOMbhDy541FV9UafP7EhJU+Zk=;
 b=Vl4YZLdpGgSlLuDRc6QMJr0+fRRUdxx3t4UlCZbqUDMRmvvrqM90cflXO5CVRUtTGA
 uTASOq6Pb3Lw1QANeS5zZXOVk4/QM4G90J8Gln3nV4b2IOa2BwVjX58jLLojU1zyTTkh
 oCnwvv1rI/ffzjKNi25e/n4BfBYXeqa2q5+MRdQy744nqjVx2YdBmu1LGXtCVmHilcNs
 9SwxEcvOv3Xg7ikjlIHWXLU/TmkJcmBaQbL9M8yO5lGOx6o6I5hCR1POcACHm5Edso70
 tVOa9Y3wuTBG2YCRFX+bgzCqyfJf+tXaA97Xd1y94+18WtUx0IWBc9VauP0qo9ZE9/cd
 mgFg==
X-Forwarded-Encrypted: i=1;
 AKwUvBypcBvrCtbpHQFBZXQC15PjvlrM/iEg3VFvY4halKktsehl/8yAEvsJNG+MhdHK2zOyyAcE8WJY5A==@nongnu.org
X-Gm-Message-State: AFq9FYKLD2dDX75YqL7ed3EaXFTt13fjbjiZSMtTsVsxz9luCOuM6H0y
 +kQe/d4LBRixcrTtWpmirRf8FqsFAXozBWH6eE3kPfMIed3k8cnknhlpBbe+yhgm45nIEZUzg1L
 sQjnSy01ROSp/Nh/PArt3a/Occ7K7vxM4cG8V0NaFPUIeqS16BIusz3w=
X-Gm-Gg: AYBFou1q287h8ckdgD9PWXhzGRTtyIKqaWdUGEhNhLOX4yObOqyM+f+WNzAleyggmuz
 8rD7WmOPKRFGZeuQAsluzUbrMMVGD94mAsCcuqiJ/SwFV5X6p64TKD6qpmzeAdfN97r6kOLevmb
 0tKlP8XwFKGQoql0FlruGt6Fl57POlSacBJzYjfkcFGuGYNEawv2qJVRwKY/iNItqBOuAa9aGga
 cboT/E3fMg1viqnCoP8vT782KreilgLTabHjTsITU9mfg1qu9n6nkJfLr951WEeCiAfEC0/zuRP
 Q3LpKPL/aei5TbyVgbtr5q8PEdjjq7nJuDPczNhUWj3lgJ5TDKbFktfAVQiSQgV6MxuohwMlwXU
 D93xU5tNycxF+qDOoOmSzUS9ZzeozdJNXf9sMiNb9
X-Received: by 2002:a05:6102:54a7:b0:7b7:3acf:bd48 with SMTP id
 ada2fe7eead31-7be61e9038dmr591723137.2.1790790653753; 
 Wed, 30 Sep 2026 10:50:53 -0700 (PDT)
X-Received: by 2002:a05:6102:54a7:b0:7b7:3acf:bd48 with SMTP id
 ada2fe7eead31-7be61e9038dmr591708137.2.1790790653181; 
 Wed, 30 Sep 2026 10:50:53 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb717acsm8138085e9.8.2026.09.30.10.50.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:50:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 9/9] target/arm: Kick vCPU after updating PSCI power state
Date: Wed, 30 Sep 2026 19:49:45 +0200
Message-ID: <20260930174946.82195-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174946.82195-1-philmd@oss.qualcomm.com>
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX2oCoX85JyC6h
 E09OiRQZhPXYTXuAPFnzLZJNwUsmvlgUP4oy5E3b07nNCeKYFEC96/rYhc+DR+Brvh+ryN8GVPO
 66ErvqHwfPCvrM/QAEHUBuH34xkMTe8=
X-Proofpoint-GUID: tVCxjIPZt7EEaib-4Pt_ryaw6uw9FKy1
X-Proofpoint-ORIG-GUID: tVCxjIPZt7EEaib-4Pt_ryaw6uw9FKy1
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd4bfe cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=Gywfzpfelcof4kT6qmkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX0k5HkXHuQVFZ
 R8Wb1O1/nlNdZg/c0f8JYxntcHX0nRb6vbCXD2nkyy12v604bGecBLFUgBJUV5+NrkarmqZR0Ky
 N+stY5MptkMR2k2/DVpQ15knGHqz/Ev8Qc2RTKrpHxsyXgzrrivIXVEceLnM22PzKNfwRY9Kk7B
 D35W52GzJ1DmjFd87qETVhGfSulnXYgaEK1ksCDajsxFkXpNe76pz+AnQey1wlPikeoujisQf28
 fTc4EMV+7s+A+Dnail5OJ+JsZqvQ+qJ2mvmULV5ROGgklshgF3HS7oe6jQjTfAZ/BB9OKogTN4K
 cVcX4Ifecp5Ica5Qhl+i41/q3KGLEOiaR7SVJHtH+6VfRkDZOFTm2dYdT7BHZWYMipGzJ4vxy3p
 lJAFyhDc6q0y+QvY1jUEQCTeMETFXZhVeVy7uP32HamnGGMrFR3q8gUatnL5bRuKzD6YLpYA/oX
 1q9c+3GQWj1ey3qpKWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300071
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

PSCI can update the power state of a vCPU other than the caller.
arm_cpu_has_work() reads env->halt_reason to decide whether that
vCPU has work to do, and is called from the vCPU thread without the
BQL held. A remote power_state/halt_reason update is therefore not
observed until the target vCPU is rescheduled, so the vCPU stays
halted and a PSCI CPU_ON of a secondary vCPU can hang.

Kick the vCPU after changing its state so it re-evaluates promptly.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/arm-powerctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index ef14a1f8a94..1ba5277b023 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -48,9 +48,14 @@ struct CpuOnInfo {
 void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
 {
     CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
 
     qatomic_set(&cpu->power_state, state);
     qatomic_set(&env->halt_reason, state == PSCI_OFF ? HALT_PSCI : NOT_HALTED);
+
+    if (!qemu_cpu_is_self(cs)) {
+        qemu_cpu_kick(cs);
+    }
 }
 
 static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
-- 
2.55.0


