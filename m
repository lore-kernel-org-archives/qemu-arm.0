Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FB0CA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:50:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xByRM-0001PY-J4; Wed, 30 Sep 2026 13:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRL-0001PI-AY
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:49:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRJ-0001IU-PP
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:49:58 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHeu5L241665
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X8K/gkHcr8Z+4uB9LSTsZhx+DdfNVx9hCiBCP7+bDiA=; b=RP2Ri7INKN41+xPY
 qcBxN0+g1zv/kcWJjCFc3ObRBt/u6AwllwmC+z+uwGfVQnLoA1UWCMWh9z9tss7t
 fpoUaleErr4ZX8wYgfM8LhdGb+jpbIV9AiNLYbYcFifP9mh41H90vXqr0j/qJbvE
 BvjZHJtJESmHWKmCXo33TS5oTtg5FDFG9i2Fsd6SnJMyrdmCQ+2+yRvBoZSCtpez
 yX13c74ayJFMGr3LFKcSj4Tt0yBRLLX4SpzsIoPQSpwO0a0eppTYeJkr7PnmOp4K
 wET+ct1JViKnaSlbp7MNM2m7hSm4WhXXUpHA+/vT3TEFoUaQMRKPf2RVuJX9eM4k
 q+HuEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bka2j9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:49:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936708f129aso1143351585a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790596; x=1791395396; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=X8K/gkHcr8Z+4uB9LSTsZhx+DdfNVx9hCiBCP7+bDiA=;
 b=PR/A7NsafS0J5hNUpAVv9NVM8oI0fdd8Q7oJDbbipTAwZ/vwJSGiPtpKJJvYoHV2o0
 3shwz9jy91vq56LmiHya+kLQzFeJem/vIZ2dna9hHJr2RbHeuE5+bbRu4jV9HcR2Hy/W
 iFlvTdGqYK53J5N90P0fLwXBypeAWtSongPm9gWhQ+xr8f/exo9e3E6SgqC05TTq5ddB
 HCqlZsC8DozAB1A+pd4+uC5Zudn5xE2RJhTnA2TjQToDuimYV7wo4ynZCO5YmLUw/IbC
 aucHLlo4htKccZwrvm9maxDftW9D024mZO7SlDfLXKIWikYRMAlbpcIHXi4oMh5+r+xA
 +7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790596; x=1791395396;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=X8K/gkHcr8Z+4uB9LSTsZhx+DdfNVx9hCiBCP7+bDiA=;
 b=nxUFOeHdHucuh9pGpCE1QK3UymaOlSyC8suAnJcKdjwcsYOzfyMhJhqClj1jjDUgjq
 l/wTwY71yNwZHEbtnIBO1HVeX0UT5QiFNPWnzT0u3sHhYq7ATHkSRlmc4mLowfmOwejL
 XpfL6K/mKTc6oaNNq/Hj3zPOonfMeKgBsaSqijzW0DMaadlQO8eiw0zORMs6evG9Z2Wk
 JQ9CZL5hssnwQechkaO90u2xmKVhQXNu7vNHPG7rXE8yDy7xZx86m+55fwBBBgBfyAxj
 voO/zTIF/AeCGySPK3TRFbkTuVa+NgwCzcgzzDHxX30oQYUGMMnCRvailhjWnnZnxvHC
 MKIA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwj8L8vRrfgI0OFE0159D2y4jlGM0ZoodUVZGGvErYCWlrFDTKe/csSTC2vpq1LfOne/nuzb/GThA==@nongnu.org
X-Gm-Message-State: AFuF++mu58eAB3HdJIM/favlpA9wrEUe7HM/3MQFHexppc71CJxlDTpV
 l2fXQtlmWu4qTwevN1PV2MzILMssDAi8vrVXB2TGZMjaMUE5Gt5+UdmGRO2jQ2EO0dS8x41R7J2
 8e1tv9IAuS1O3CZOnm9rrTyh12xJZlj9OT8RMPZGMQ5vv6esKW5pP+Ys=
X-Gm-Gg: AYBFou0Dc9mK0Nz3KguCiuLMWjQlpnueKYXioYuIzzT8BVnvW24t2ZyxN7H7xr5S//k
 zoat3ZEJb4Ygtuo06O+ZsucBJwt7R2o/hd7embYQp08dDysTGHdkdE+N2INvFt/mRenyf2eCzWw
 ADGItAEV2tFOpZytMV4lr5KC/01Yo+HvNcne2XPTKLHOMXp14ha7yFP4ZAYkPVA9FOiu/eJ86sE
 vyaFsAQtPYrO/SiHQFWnXK8s1ONfFxZIeK38pakzN9Syw9ghljmutixBj6xyITBtbXZlj9Qj//6
 JVRU5gLuWcjaXmPguIRhUlTZ0iK+AdPjOl6WKr9SD2kD4ep36nm1zR5BFgdCm3qgTLNi8qlqBkS
 TNzilS5dJXpUm1CZ2FsUvnwHJfPjNNxg7Nd8CXsr4
X-Received: by 2002:a05:620a:4890:b0:93b:d79a:c469 with SMTP id
 af79cd13be357-93cac26261fmr353386085a.65.1790790595819; 
 Wed, 30 Sep 2026 10:49:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:93b:d79a:c469 with SMTP id
 af79cd13be357-93cac26261fmr353380385a.65.1790790595307; 
 Wed, 30 Sep 2026 10:49:55 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0692b1c9sm632828f8f.27.2026.09.30.10.49.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:49:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 1/9] accel/tcg: Refactor poll-while-halted flow in
 cpu_exec()
Date: Wed, 30 Sep 2026 19:49:37 +0200
Message-ID: <20260930174946.82195-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174946.82195-1-philmd@oss.qualcomm.com>
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZvYvX7NYVUsIQl3NQH5YmT3BV7iHFQTo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX5Q2TVtAz3WOt
 +H1lR8jZZBXNGYbCi4ZcawRg/6OHWmm0kZaq8p/wjmyxA9KHXNVur4go4OEP42AJs/Q2L8jOIU4
 HsqJk04nEJzF/z4eqLZpKcBQK53wL/cCCZUjYkzguDEI3JxVX7Oij9uVZVdT4VATC0sw11tpHP0
 qrG/iRtt/VagVnOV0+SdV49VAzdYPN0mxcV+6FmCGJpbmbCbmRIGhtRsN/fq2pnpKmKpcLnQVfN
 lpzijkEpfEpVD6vnjNrNe5kn1AnvDDQP0dbd6+F/baxvash1s3yEfLRpMYQIzZkpxMKKK59cx4A
 v3oFTKsRmKNYOQaD8SFEk4uzj4f0hup9prfvK4ZK1E2pERiwCdSmAtpFTsb1iI7XUIg3Xqk8Hl1
 b1pZU5S3peBakfdEosQJxjPKhXA/reGYDAaCCoyqBinc7OUUEi6Tye1IoAxibNr1Quq8VP+jxM+
 CtSl8s2xfPWHKkfe5tw==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd4bc4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xF3Xt6V14tk6trZ56bgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX+yk1oGBHvkUo
 Rsa0bL7CZmlzMq5eiSQIIvobXT0GRI5ic+o+46l4rEctBvRQ6ewm4uot4xSVelpWBMI4h9GKFgI
 Z9EzPG7vI0Rr92P/0WtiXBfqY3jruuQ=
X-Proofpoint-ORIG-GUID: ZvYvX7NYVUsIQl3NQH5YmT3BV7iHFQTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300071
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Invert cpu_handle_halt()'s logic to read in cpu_exec()
as "if halted, poll for async events and find work; if
no work, return". Rename as cpu_poll_while_halted().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5b4bca5084f..853c4b2f67a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -656,18 +656,18 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 }
 
 #ifndef CONFIG_USER_ONLY
-static inline bool cpu_handle_halt(CPUState *cpu)
+static bool cpu_poll_while_halted(CPUState *cpu)
 {
     const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
     bool leave_halt = tcg_ops->cpu_exec_halt(cpu);
 
     if (!leave_halt) {
-        return true;
+        return false;
     }
 
     cpu->halted = 0; /* allow execution */
 
-    return false;
+    return true;
 }
 #endif /* !CONFIG_USER_ONLY */
 
@@ -1029,7 +1029,7 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->halted) {
-        if (cpu_handle_halt(cpu)) {
+        if (!cpu_poll_while_halted(cpu)) {
             return EXCP_HALTED;
         }
         assert(!cpu->halted);
-- 
2.55.0


