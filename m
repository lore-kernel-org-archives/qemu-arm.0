Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B6606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7HzMoPN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WadBe7Im
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj4i-0004PH-0L; Thu, 26 Nov 2026 18:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3c-0003E0-UU
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:39:22 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3b-0001Ic-Cb
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:39:16 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwE7U161490
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wLRFKPB7CP+13NTFtFlfHvU882UYml1HqOOHW0ZUVCc=; b=p7HzMoPNGlizMSk6
 cuEiXtS7H3OYz8sBNbwqiVvJx176JEZvs8vsyyvKy+392WE2xGSrp0Sp4GJ+QvE8
 RyQn/fNXEB/ct9zJ+SMZKYeXS0wq+87Tvi+ckJMvOCvSwvRq5aZTDozjHUkDyB2+
 ggwiJJ3J0g8jZwmt164ENDbiZYWvJewl4By1Oty0EaO4iXPEOSNwZLMGksbjmpNp
 9HYbvkl3o6pFOKXIe1+WwVrWHneBTLMO09ed5Jqg1XSDFHyDWQEqN0QkAK8uewkI
 eohFGvyQbVTCLc0XJZw0BeKSwJDPKSTJygTYVd5S7W/7IxwCozbJyMdLcl58e+bA
 WWFZfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7garm6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:39:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9496ff065bcso1004141385a.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736343; x=1796341143; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wLRFKPB7CP+13NTFtFlfHvU882UYml1HqOOHW0ZUVCc=;
 b=WadBe7Im62Iar5+daGqExS887/txhFc9ZcAUA0WYdbWoev0wuHgiF884A20AK+BgVg
 36Ln9z9eHb/aQFOYcG9mcT1Pt/57aaTJhdv1dMa42BceEMxL5I61o8ms3darbtI+XYpG
 Tmh/0/7+iqEXLijAe1le+N8cnT+jg5LVFdBcBXwJA9o3EoX35LPv+p0ETT5Wlk0/FBmN
 Y04rYSQ3qTwbPvQ9qX5SUZvAF/8IUTrJqTgATBhejkCupx+T7kdHvXdo/5tPfdV+c1aY
 HJRfNnJu77EfV4922iqwfqck8HWENcE9VX/u0qfX+OsJw5JwXlJBqC5ljV97iSx/VbT2
 eCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736343; x=1796341143;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wLRFKPB7CP+13NTFtFlfHvU882UYml1HqOOHW0ZUVCc=;
 b=0I8e2ib6etrhv4jgZn6nh052jvoUnvzxAE6ZT5fpP38urYekcZyzAkFoU09gXHtKRQ
 vSk7ambtQOZ1YJvq7NQw6vr6Nnj/yp/VU0DKrUAOrzhNec3R533v1q1gyARO2tHrp6lb
 zzHx5fRoX8si5OFD490CbHQJlXV6V90PkWMBNXVhePDMNPHodcaaJGshpQtqLqgCO6Qp
 JC2R1V8qLe/QP2KVmZlZgb+14dwfpsKUjYgijJba7SpKQHqTuKhYyvcj3Zk/4VKo64d9
 ssL5ZH6wN1k6IQ+HjQbJBguOGGwozJ/eyEQ5XMlHJ89PLc8Gvu62FTXKpjaOHgYVINuE
 CnSQ==
X-Forwarded-Encrypted: i=1;
 AL+hErE4ZT0KO9jQ90T8+Yn7X20gTDXqXMIbGguhA2JihGqeAikV0FuAedTy+AZC5ZOb58rQovzarUa5Pw==@nongnu.org
X-Gm-Message-State: APuU4Z+ajWrmPPqyjQfiHh1Fk12EI58KbusDE1iLNci5rgvFZduIti3k
 TRSS/G0DChhcCMUFA6m4eEFEc2fsHru7goG4G4Zj2EHo5FCfkeFb4uhNg4tsdKof88YUCvqevxG
 QXoqjNo1ig3AKcC1FaWeOc0w/K3/gYGWnHbVOWjA02sDMb0wQhbYTcSI=
X-Gm-Gg: AZFdTZdhR8Txr5MzCllatXflJ8yDXu57POW2k7sM/uyNo7mEcydONtXOPOrb8AUg4A/
 /1s9sdhcxCdWe272ABGQdlH4yWCIy+ONmTTMsPodmYr0p7aRUbUNZkRuMKS43E83MiR7m1CA4Xg
 6YVbCbP1gZF1hSuGengOIBOAz7+eUy7T47Pjwc8LCfOinBr/TeqWL26tJgslymFO1Dq+jxID9J7
 c2c6KYLxkradOfz1Sqqm01SUMsFB7mNX0QFLC1O1dKwPYCb2qWbzrBXLkmSemDcDRaLhyqj41S4
 PYXsLxXbiiPCFBrHGfz961+o6s7cHcaV2mOaOkjWKWO4rOKeJsq0lUuxFSMcfNspKc8g9EI3x+7
 oQCrvRUTjvi0N535bJMw7geYQ7il+c+SM2XdcMguVS3iQahlLDSSJu2KKpYbdQXmtF+36lN+sXO
 cri5J0o1sjamwZ6g==
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id
 af79cd13be357-949ba96e873mr4358386085a.21.1795736343349; 
 Thu, 26 Nov 2026 15:39:03 -0800 (PST)
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id
 af79cd13be357-949ba96e873mr4358383885a.21.1795736342948; 
 Thu, 26 Nov 2026 15:39:02 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf685asm43934410f8f.20.2026.11.26.15.39.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:39:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 22/24] target/tricore: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:36:00 +0100
Message-ID: <20261126233604.67722-23-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eJVV1T45B5bV6Jik2HInuGkk3Bli5u0j
X-Proofpoint-GUID: eJVV1T45B5bV6Jik2HInuGkk3Bli5u0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXxwFSknMXTXPK
 XX/wKQLZagtuejBdGVj1oiKp5OMU5mJKWGsfvoo37Pts4x92hDrNmqlzJFxhJn3vFIE1A5xJWOC
 9+SlYFGfKgYgLLUHVAXFXTuqv04aF41QOcpCf9Imn25pUNWijYFU10IpSJ5P8HLoSF8RyGMQH/d
 PONWlYTeQtyoIliqqWHXVG8wA2CXVu0ykI6Qwq5bmhLRegiq3ht4AECeeMJA5AvXhhG1p8gHTWM
 kNW0LON68lluANgaBP6N5b3DfzYWLU4P+8nZXvolWEdQ2CZ9dDwsVSmB1C9VVsF7DaPGLc9JBSA
 fMkBm/YUV2MJD/R5HwCNy357MsWZI6sBZk4GQF1FEGsZ79EZpclgkosuaEfzUWQEAlhns4ZbVRB
 3MnNv9pp6tgllIMtm/Fsd+D8GKN4orgl5OvFDaGeS+S7F3lv2XXcXZghYxtoUkukCunF+3Vsy1A
 ndOdVbyRVK9/dQqA/gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXwTCuzz1zKdw3
 +Q1CLhef0b6yWZU57qhG3crnbmL9X7N+TPJus0lkECKfwAxRah031v9QbZdy+iWEMJ3iru2vkIy
 OCge8HxT6kLwf4ahG5HwPsMLJfjAQ7Y=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08c317 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ltnaFbhCd6zjLZLej9kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/tricore/cpu.c       | 2 +-
 target/tricore/translate.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index fa782f82f00e..b77ad96fe7bb 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -81,7 +81,7 @@ static TCGTBCPUState tricore_get_tb_cpu_state(CPUState *cs)
 
     return (TCGTBCPUState){
         .pc = env->PC,
-        .flags = FIELD_DP32(0, TB_FLAGS, PRIV, extract32(env->PSW, 10, 2)),
+        .flags = FIELD_DP64(0, TB_FLAGS, PRIV, extract32(env->PSW, 10, 2)),
     };
 }
 
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 8cd6b58f66be..7f343d5626e6 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8389,8 +8389,8 @@ static void tricore_tr_init_disas_context(DisasContextBase *dcbase,
     CPUTriCoreState *env = cpu_env(cs);
     ctx->mem_idx = cpu_mmu_index(cs, false);
 
-    uint32_t tb_flags = (uint32_t)ctx->base.tb->flags;
-    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
+    uint64_t tb_flags = ctx->base.tb->flags;
+    ctx->priv = FIELD_EX64(tb_flags, TB_FLAGS, PRIV);
 
     ctx->features = env->features;
     if (has_feature(ctx, TRICORE_FEATURE_161)) {
-- 
2.55.0


