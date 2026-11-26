Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4BA606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbM1Si2a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kUhht51D
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj1Y-0004cD-73; Thu, 26 Nov 2026 18:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1W-0004Yd-QP
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:37:06 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1U-0005ES-Hs
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:37:05 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwm121012292
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R9pD3qq6szDi5i0YRU5Dn0Z+n6ZG0Tdo6Myaj6NUP7I=; b=gbM1Si2a/NgDMFkQ
 l0UJ0Vxmmmzqc3eFjIKd0w0IpL6QWubsDe2sJvavnPAAv4Vkjc78SuccKHCs7F2z
 mrOQBe//WTeI8zcz4q+p9alMcZ/K5eY6kNlI0pDt7tAUvG/UTRmPOoYPXq+DBYDt
 6FTRjFLv2jDyaf5v3uj1xjIkUtNHUmt+zqAkUeTO3i/lSSOij50X9tknzvjg1x/D
 EJxYd7L/GPfy/JfEOiBOSpwgAuUaxw5uUAOcAcT57CYKNxJBKa4ebG35NmRubq50
 na1FuoJWZGnZGosXcFTv/qfKuBzcqBR+8hlp4ZT8/XUGscPjP4hqWE3ugqfA1RrO
 bZOKnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf9108d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:36:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9495a1f5e47so1124374385a.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736212; x=1796341012; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=R9pD3qq6szDi5i0YRU5Dn0Z+n6ZG0Tdo6Myaj6NUP7I=;
 b=kUhht51DKG9mgkEE+pupT14r47jh1p5JxtvkjxER0y1afdY5YoA6pt5a2+eaTAjgTm
 uWR1qnZ2uAzlWIzhZH/HqsQ+xtUQPoMmewroWsaMevQugNSpgeg7uHDnG8zsx9rFim1v
 oWyP7WJWWmTp2SPhe726kczK6sV/LvkOlTH1LH5YwsvuUYfvDf6w1KjR4j3K7RK4YH5N
 Y9Aqr8oi8aw/uiMp+nm1KKr+lftAcL3svrA3brJ0+Sk4cTKisFDtRCiklHXKsUp3jnMH
 vHheni5AurbCxnTOtS2U+9G5jcPDoZuHRMMLsVy9RHuNvWByI8wGYO3bRIDTFsU4rQDS
 E+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736212; x=1796341012;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=R9pD3qq6szDi5i0YRU5Dn0Z+n6ZG0Tdo6Myaj6NUP7I=;
 b=MfmCwbTfXulPRvDav78Nr0WVh7SeLHrsrL5uBfXwy6cVP7Qtbw5LkSluhnzeY4lWKL
 fFWtc04LPY9KzH1QNjxbzHtd322I1MFjXj7m3+6f70pvFSebMzUsHrrb/KTBpEY8ky8f
 rAlLNbOGPa1fJmoNpXRk9dwn1e4qHnO+Dq6KzsjrTHRmjTuycQaB+YDqXNZBAwyZVV9M
 szBv5SRWlqm8mdEme6Vl7RSkahbjFojbyPwoL4a/36KmaWSgbBTbUQXyObA2kp+BZpJF
 MlWazJr5aPtE9ZUe6qjVXOetU/D4LSk1QHs1RfoMfu34YFYRAJK0mDm3dBRZmnoW6RIg
 Q6uA==
X-Forwarded-Encrypted: i=1;
 AL+hErE63qlb/IXRlpWRNIfac5/b7vuA7yYsX8CyZbhYS5stjyeGinXltVNmq8s2CBBj0g0RUIKYpQ9YDg==@nongnu.org
X-Gm-Message-State: APuU4Z/rEEhL+MBo3P8FTk8nrzXVl48i+8+ccdg40/551RMpcDlQE99S
 nGPB2u4M8UzYMz0XFp8p31nSDgWIHnOQ5B3C+a67xn2kjJGCg6pWibbDzWnyQ2QpGSvBcWU0JtM
 ZU1Ekc7NnD00u9Tsoq0qyEUcsDNNK+Al6h/dWy5ij7btk00MnZiqdZXo=
X-Gm-Gg: AZFdTZc2KC/aisd8nwffkyFkuuGYHFECXqw/Jb5Bo2JzxCCqUAr7kp7C0RPzEyK1zCH
 19VXSm7CzsQeky1y7ZhlicA6vDiQV0/ZmtcEvHxX57nzNy1W1OUg1ctXfnX3vUbqqU1RwVap4yI
 9Zecy7BlvzgZin7bnRCynqfX/p0KqYUGNQUBf+j8ZUF5FOrOpHD1sqWDfCbDqEGTAfoDhqQ7XTv
 FKeSJxSKO5Tk8/XkXYCKlgNz4WR/iZ1Db1y1hUAdRJ0mKM//s3BXDRtHrcp1UEQY6ziXSndPysv
 c3oj1DIWoIVSJdbDWGBUnP5K5FGe1RVummGbVWls7dbjovdUDHItE9BMtDMkbg6Ntf/hUdlHKGQ
 MD9GxGf5fjIiXz7fQ2MRpZ+Tk+J7+hmRuWPXhZY0pAThkK4SBiPXl6CDlt5URveyAvFbYOpX+qI
 96ASdAvhAJoMXrfA==
X-Received: by 2002:a05:620a:4454:b0:93f:18ba:bf78 with SMTP id
 af79cd13be357-949bab1bf42mr4247004285a.69.1795736212282; 
 Thu, 26 Nov 2026 15:36:52 -0800 (PST)
X-Received: by 2002:a05:620a:4454:b0:93f:18ba:bf78 with SMTP id
 af79cd13be357-949bab1bf42mr4247000685a.69.1795736211769; 
 Thu, 26 Nov 2026 15:36:51 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b110c50sm42808995f8f.37.2026.11.26.15.36.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 06/24] target/avr: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:44 +0100
Message-ID: <20261126233604.67722-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8hJKCDtEfFjs8m1Yf_j_x_K7co3vFUGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX6O9z8+Ky6dRa
 mAUCele74TfKZ3pIJX1LPF3429ptVAlsuXrdpsYB2eEsZG7q//pG+qTETxcGtyDl41w6gw/qjBZ
 ef+Z2SAfalkom7Vp3PETwmWZqCHrTO6/c8DQv8HPDwEkHFeNJi9qQbPN9esNVmQ7D89zVWpH574
 yozVM/86609LypOZ2plX1xjhph7MTurMWL4ppEwcsFvhFYj7b2YM3Xbh9qqd06g0QCRrqq/Se+K
 sFXM2agNsoe5zRyQCokfp/OVPcLby8NF1iBYa3QpYkxN7UklO2T1Vrnz8dBMsaW+k4nSfhYmBnV
 +/L/OhX2P3LnWzAX6zBDVHJ6qceiuPT4ipzAZk/iWxei4lzVdG9882K2OEauVtiObPnVcAmrWok
 IATliuU7ZtJFqmS/z8cHZcwLoGDZwJxsis/BtIv4jxewqwyj0t2mS9II1DWQxy7U1hPBRZM5wzS
 cE4jYkssR+MiY3S+mzw==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b08c295 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SMSkvsHJu0LtLNEn4aUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX5CTopOUgHxBS
 RCS8AW4x11cQtclgR1p9oWIYqxYeoYU4OPLOWshcxWZL8eAAvY7T+rb7XRRf2JP7Wbdc+vhNYf9
 On/mRlLK5G6zTNgGE8T3HINlBCodO3U=
X-Proofpoint-GUID: 8hJKCDtEfFjs8m1Yf_j_x_K7co3vFUGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/avr/cpu.c       | 2 +-
 target/avr/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 83710f565182..689d3f6ac5f5 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -58,7 +58,7 @@ static int avr_cpu_mmu_index(CPUState *cs, bool ifetch)
 static TCGTBCPUState avr_get_tb_cpu_state(CPUState *cs)
 {
     CPUAVRState *env = cpu_env(cs);
-    uint32_t flags = 0;
+    uint64_t flags = 0;
 
     if (env->fullacc) {
         flags |= TB_FLAGS_FULL_ACCESS;
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 3c5760609702..6a4e36f326af 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2660,7 +2660,7 @@ static bool canonicalize_skip(DisasContext *ctx)
 static void avr_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    uint32_t tb_flags = ctx->base.tb->flags;
+    uint64_t tb_flags = ctx->base.tb->flags;
 
     ctx->cs = cs;
     ctx->env = cpu_env(cs);
-- 
2.55.0


