Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140FCC9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:13:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QWE-00042U-0D; Wed, 23 Sep 2026 13:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWC-00041C-JT
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:12:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QW8-00017b-JC
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:12:28 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTZ9K595325
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=; b=KqsIMxWsjMjCPuvQ
 s/Ey/C5w8+Y6MuAzSR83k3HYC2CmEVIkUT+dBFOTLlBNoKBSldRwWw+UUVvXsCZ8
 Ec/77yhf5bEfd131oKax8SulKDDYvUjp6V4p9SOmMJj7SlCneigjkGOJjjCKmCG+
 WUFtgqM4pLBL8GKvQllkQijfgt9OcSM0gy4XCL1ug6wws4Qf7a4AW7u4bZqLm1xV
 upqeul1sNyYYtCQ8ERBu0clBGx6GfN6Iq4lvKTXihWVK+tGxmSAM0NhebJU7yfVw
 WOj3FZVT8sngaPNnRjSgqJQLJeqIbrMbnqEOZ+oPEWChVbihBMymF/wkKjwaRnT8
 IrxSzw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3d3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:12:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-78fb9f59781so1124452137.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183532; x=1790788332; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=;
 b=gVhzWYFkiyYiWpGWYHL+rKaq+/tc2d0otEFD4R9WP99mjNRKO0c6JzzIYmvVAqrKc8
 BCecmUr5rMiCv8/F/m2ivgoP8qi6KPtpVKMOandaY+lnQWUrzv0wn5cK5mGP9jZR3AhF
 nnA+nvgUK5cDgveT6cZGaGrmONrpfK4N6A0JgrAspncmHCuJ+dW6fGy413Q93Kcj3wtE
 PH2CJXKeEuy6o0EWChwYwyl1ZPWlPm6YTNwsQPbJw8TCVSDtXx/2V455XG+w/ObI+Scl
 zUjHdO56Tslxy5JM8IVcHO0TcT+aXSr4DM0Y0DmJdD501mw8xwtvg2MjaPJurH8w10To
 oLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183532; x=1790788332;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=;
 b=pjz527XxP9YcRQrIHi2Z5oESc4Go7iNaRb/EWSTBhNHoCvbIguWY56S2WeXDngQI8P
 L3O/DXHx8PtmiwkffrhBdQCYzki1+fwXvhX3IRYL7HcSuo8LPIc5buWES+f8Jg/GYwy5
 NNASYg/6lVBOvwobM475FW9AUKykAWYthfKBhCvn5ng/owsiFgcsYIxTLgj3BjCrFTo3
 +/vycbibnRVquNH+xdoIApj2TMal3zebzLmgAvwKfNZ6aPsU0u2v8RmCdixdjVUSoz9N
 /Tk2eXzhgQJ86xpsmboo58P8+xQDvu49f6rg5M6Og5hDXiF9hhGclP6TyKBUNOhYhmFq
 GuVQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwJemg+aJyNqJ234UcNkBe5FzAvuvtFlrZ/Ut+BL/OV5oN7kVrnrAeUlRZ3259QUNfNcar7Eja6vw==@nongnu.org
X-Gm-Message-State: AFuF++l6PRik8w5jZP01MdhbRXHagDNU2d7tM5lj3IVyRHDkmhRqOPZp
 5WH1fEX4qYFfVkshLZ0qNO1E6BVjKTP+IgvdWm1gl6xYKBgXjBXaEd6qoOSCUkfAloZOpjcgB/e
 y1+aw9XD2UZ6o0cxWcCIRjxxK08c0MIOfPBvq2DmP5VTF0XiUmVk8kdE=
X-Gm-Gg: AYBFou2/o8Jt5oyGpctCab4PDXT3F8DkK1ifGABMhUO3l6V4LPsx3EbDLYjZuFx7cSF
 WapU4/LKZBdBc+8Q/OKXHIQTL+45mCh7LEaIspxgxxg96dlf6N5eexruRqJxMKItuo5lduumScG
 KsVL9LniPFIdr7Ni5dqdVllOFvt1MvZ60MSxju8gt1l4yui3u+72450lx0MHue1am2+9dtLg3gC
 Ck6DGrL2fX1kECyBMUimVT9MrCba+KmJLDC/DCt7bWh2F5/v9/u1uuvDhm7TmKWMNNOzcZii/iS
 ZOCkZJ8UexQizNft/xoAseAUp8cju6vig3M3Q12u8SABj3t0Fe+3JdSuuOtfhV8vFut5M8E4l1j
 vApYDiaaZq+dnGHQg42x7tedM+mFSzhPFZX0JsFkIv1t+fJrAfDY=
X-Received: by 2002:a05:6102:2c0f:b0:7a8:1837:9eb9 with SMTP id
 ada2fe7eead31-7ac1dc3d3d4mr3241040137.27.1790183531865; 
 Wed, 23 Sep 2026 10:12:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0f:b0:7a8:1837:9eb9 with SMTP id
 ada2fe7eead31-7ac1dc3d3d4mr3241020137.27.1790183531501; 
 Wed, 23 Sep 2026 10:12:11 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5b9f253sm925835e9.1.2026.09.23.10.12.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 07/21] target/arm: Kick vCPU after updating PSCI power state
Date: Wed, 23 Sep 2026 19:11:01 +0200
Message-ID: <20260923171116.31276-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VZGwLGp0RqyqkUOhmj5nLYLCq64uXRXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXyRri9SnRLlMx
 He8I9FqYwQSNa9U+0niultUYO8NeLBXLTOfuzIXYv7t0hU1mYjha/p/AXFtgW0JH4KxEcAzQQDZ
 aZPR3Q4lX0Wyu/ISjBOI42L6EVLvgOz8uNv1wDh9cdZkCvkLLDeUeWvO3LCFqxlQKmTlDQZMBO7
 092gwAqd3xCH38Jfd131TS+XoqtGBp4mLc9vHPpJfFHkCDX0Q0/qaqvxcK5rhEvbCuUnG2pkeIO
 zNoooQh2QFZ7cyNcnmNDoQ/yGHnZ8WtdTGmI+GkXsjV8uQFsdVCfMYnMDxzSD448Dmw2B6V/yt6
 tUTEbrSCZdVWJaYevNpup/X5HsP399ZdfKfcKQ9ecye6Dsv2oIAvVgzn+3lquT+Zusl5MICtn4O
 KsW9yeKX7ePgzejYXY5IzwCW2Cj9d/qJzfOEkeMDtEuZW9hTFKY4sEF3i+JFxEClXvxAi6XEx4i
 xYtzkeDkZ2GRow1fqWg==
X-Proofpoint-GUID: VZGwLGp0RqyqkUOhmj5nLYLCq64uXRXM
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4086d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ZUU6x_L2PbSNHYkWwXMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXxfwDHJNAXR4c
 4VHX7cEkkMgQgkNhg2zI5Ip6o1YlJ1qz5NRTmwaHV1zAOOHS9EyTcRzETlU6Q0IErEGUkH6j1PE
 UQaoL1MKEIwumTraXn/93XEq/mXxE7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

PSCI can update the power state of a vCPU other than the caller.
Kick that vCPU after changing its state so it observes the update
promptly.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/arm-powerctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 213e7ae056c..1bd8a549cc9 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -48,9 +48,14 @@ struct CpuOnInfo {
 void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
 {
     CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
 
     cpu->power_state = state;
     env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
+
+    if (!qemu_cpu_is_self(cs)) {
+        qemu_cpu_kick(cs);
+    }
 }
 
 static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
-- 
2.53.0


