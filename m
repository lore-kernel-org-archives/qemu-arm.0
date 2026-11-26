Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C4606A321
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noLkTpRH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aovx0Pyl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj2r-0007cA-FC; Thu, 26 Nov 2026 18:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2U-0006CW-Vo
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:11 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2R-0000Sl-Bm
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:06 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwGsN3340213
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UeLXE4d96fbTkFdswGqyRCe9nALWzm6+6sS29bl2VXQ=; b=noLkTpRHjV5K1bre
 YQU94M25a8pcl3CUkIUVzYKRg0ytFTcRQRzGaUzNwLg1I6Ke572KK3fUqgR/iwXE
 yZoH2D70B6+NC97Z9V76wqaY5/oiCisqnndIrfWuRcDR4b9Sr8kc9UzLGfEqw+yc
 2Cn05pLWWVbmcvbBYD2jakL8x9W1zR5Mk4akKZAVEDlti7hPmjawOYMoIlY94lAV
 9xtxdwp0p+pRsYzHanVF8GQMFunQyBIh+KSyTanEqsb7tb8ztqgO/9Y9VyHnhPAR
 2b5q6GTL0g2XrFT/B23BLt1Gu7a9EUFV7S5/EyiHqywy1NDBwVwfBSVCFcjID3y8
 HKTTNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqhdtr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:37:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f2373e9b4so846681285a.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736271; x=1796341071; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UeLXE4d96fbTkFdswGqyRCe9nALWzm6+6sS29bl2VXQ=;
 b=Aovx0PylArpxUhtGPe+6FROtZt7uoZOeR5b7+Lf44YGF8Axfxr2MP3hrkhEQ2rhYBj
 vV1iQRsAD1xnOAb+Ehnono8ZUmGzGIS7lreDoRUbESk8mmm8i7L57Oq/fSUZQ5kcnELD
 AEfShQijlgVVUZzM2Fv9VAI3pBK0c/ZOvJD68013oi4VJofeBV05+QaJeCiowNwpaklG
 04YD+YLE6BucLrvnRhB04pjkCvsov1hhW/YHiruZNuloe4bJADLpeySUlefCV01Ou3V8
 z06GAIchup2nt7IaiUzhCeWV6tZwcrd+ZPrQGJ2HxsXkd4EcnA5XtTDmnrd3hkSDEn/a
 NJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736271; x=1796341071;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UeLXE4d96fbTkFdswGqyRCe9nALWzm6+6sS29bl2VXQ=;
 b=BaPWzSru2e5o0pBooGEJON2mSIWRRneJ0nX6sYL8xNoGz0wEfU9CpXcY+LnuU5JKWA
 C5CBEFXumlHO6R22xDinYtklfpXs9upfL5GJvoX7UxRFqia7ZFnuykEQMI/unGWJ8Ujj
 jahUcmM584BVBRlGFDQNFAhBJiLJP2OwQyT8T8Kef39LwWEmCSAGabf0QmKFx7s7VO1E
 3DEcDOn7TpP8mHBcpP6sFfuiWv7TnSD6uNE1B6clK3c4DPUlOx3jakhncxback8DZUI1
 zaINX2dYZ4/FMDi7ZUMIzgV0J+HVrTct2RhFUvQZahihkL+4vArq1d3hzKcfa278CSnI
 s4IA==
X-Forwarded-Encrypted: i=1;
 AL+hErHsuaGiyHDhmC0FrtMbsd5pkY1czU1X1vmpjMEFF+hkkb7HhojuchIlOXki+Q+L2bsYPDCVavGTuw==@nongnu.org
X-Gm-Message-State: APuU4Z8YGP4p7/HIo4ETzU+v+ngKgAqNwwfpR+jznWSSM/M/2GWCDsqc
 Cld3XxObXSxerx3H82sohLbbKcz/ndAdb9zx5OfrDgFFbrCnH5NwpEJ6bzJS4jxvpuR0IR0utCW
 6W9PG9eI2Ba1/jL32S+z9ySlbO58YIana41apqwqC1gQN8m6PlefbEBI=
X-Gm-Gg: AZFdTZeshcxsEags+MTHT+IlfxlfxJNtrM7c+EloSGoci1VlHB/0MpRHzoUGHtAKq95
 OO0OPqFud85ZQBidwGRX1vaTInRyHXBtkU5GpqBn0PqWDwMsfuilrlTrN/suG7WZKXff+3J9i9s
 fjUTg8ykQUCX2slv4f7jarmCEtIXrTEaGRm+5RBj563M7K1XW4vMiwxoNZifrPB9gBqucvxUS+4
 3uK8cH2wDsy60JUI8RsJc0g7+3CBEtDjHXEOUt8QctZn4linaceuPVMATCvwR2OPL+9OaO1Lu6/
 xEiSx9rF7orMquBIxRZp0KUvVsKxmaAVA18cYyXZk9D29l8jCjMAwlB9a4XuxGFDjQigybHBVtQ
 AKDlkrxYQHQhNefui4Y1YPTR2+bVuAf44MKBm4jXI93AA+W7U4ZpCuuKHp75Adpm8UXT+ZhKhnk
 p8avYMEQoei9qBiw==
X-Received: by 2002:a05:620a:2403:20b0:945:e46b:15a2 with SMTP id
 af79cd13be357-949cb821e7fmr2691914285a.49.1795736271043; 
 Thu, 26 Nov 2026 15:37:51 -0800 (PST)
X-Received: by 2002:a05:620a:2403:20b0:945:e46b:15a2 with SMTP id
 af79cd13be357-949cb821e7fmr2691912085a.49.1795736270606; 
 Thu, 26 Nov 2026 15:37:50 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b2050f1sm42636343f8f.38.2026.11.26.15.37.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:37:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH 13/24] target/mips: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:51 +0100
Message-ID: <20261126233604.67722-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iHcMqlUI8VQukwFjOEPDAk2Yv341-juE
X-Proofpoint-ORIG-GUID: iHcMqlUI8VQukwFjOEPDAk2Yv341-juE
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b08c2cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LLTHveLdIxpoD6EXDcsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXx4jjkOdEputE
 /OVjrANuxFu73k+95+Zqr9ktKQ3q5fTIKy1oAuBx+lfWAa+lBM3E/hFe1Mk1UGy+sY4fkJjj+mV
 WN8vE723yw197AE0zEKBOh0I4Wt3bbI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX1KogkIDlbE8H
 BuhS6xfF804zypGPMy4QVg8REdOaX/LPAzCDwLWUD1296cNYx7uFSurKhAcUuwBS9RHfPcV0VGU
 z0HvV1Zo3N9BR75UW5sXnuUnp3MnN+5MOMntkdtV7qOUlbmuqU+Csm8/F7qvuVoVMrPZtXE5CTN
 hN+opxgspOoomip5L4FQS6e/kkR+vJeAu1Kegm69suSO/MTmvYZa01JarGGNq+5rXROj7py9sfo
 IGT8jeyFh76nBFaSn3va37PxzgFCwivIEUNnuGyRkKiNXmEGEZeawfnsgeBmadw2opfnwgzfwzR
 hK5Ceyl1czcon+wAJVdDqakK1daz5cAHU9UtkXvaO195wpSqS9vI9IEhDF0mQMBaRXoRRDH3Tvc
 Rj3jJbNMgTx9XPVqleSAAAOgv032DPcZ6HwHOJn1t3vAyrqxtR2bjXCHyWLa4qVTRa5EzjAkn70
 TYaAZCmjHzHpt7encbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/mips/cpu.c           | 2 +-
 target/mips/tcg/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 324e5989cca1..fb2ece5c9a46 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -682,7 +682,7 @@ static int mips_cpu_mmu_index(CPUState *cs, bool ifunc)
 static TCGTBCPUState mips_get_tb_cpu_state(CPUState *cs)
 {
     CPUMIPSState *env = cpu_env(cs);
-    uint32_t flags = env->hflags & MIPS_HFLAG_TB_MASK;
+    uint64_t flags = env->hflags & MIPS_HFLAG_TB_MASK;
 
 #ifdef CONFIG_USER_ONLY
     if (!cs->prctl_unalign_sigbus) {
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index bbcccbbb467f..9c76f1bc00ec 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15127,7 +15127,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUMIPSState *env = cpu_env(cs);
-    uint32_t tb_flags = ctx->base.tb->flags;
+    uint64_t tb_flags = ctx->base.tb->flags;
 
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
     ctx->saved_pc = -1;
-- 
2.55.0


