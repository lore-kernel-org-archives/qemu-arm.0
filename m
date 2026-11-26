Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C6D606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4yQeOpr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RTXz6Uxd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj3P-0002xz-KA; Thu, 26 Nov 2026 18:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3M-0002W7-JT
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:39:00 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3K-0001FB-TD
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:39:00 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwEPc3990401
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 baCoxPoYsMA8iBuDKvBL9VhxlDzIn+noO4o2ggzg9a4=; b=D4yQeOprxOMDj8nL
 wx6rO+A19je/i2A1tSa4JS3KSLlkAOWO44XIdOwv6TPxqMaRP/zPRnd3bkKaLyHN
 nZVhhh0QNLCJOt40oHRnNWhnHSw1KgOd2dI+A0IcF88nEO9l6A2NMt3OgfSrBn6B
 E1N0Lt4sgoi8EcTbTUdijM4+QG/p7d2+6V7nTVf68hVfXN4UWnpk8BA0kxxyDBRJ
 3G1QGk6vHSIW/Zn+6XaFQf7zsfe2zB1R3jq3jqQr2NJndaa5Fceg2wQGQk8Ir2QG
 iIQYxSeQZDq/Jk/m7OT0xBIJgOEguAAkNhSoyesaHD7Xj5Gw8OFa0+hyySNESpNB
 2k1pbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak042v2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso824688385a.2
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736327; x=1796341127; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=baCoxPoYsMA8iBuDKvBL9VhxlDzIn+noO4o2ggzg9a4=;
 b=RTXz6UxdcLdgPDHfKlTc5FWO0zwc2B0BiontVmbGUbI4X99jyqNcuzWL9ZmGfLzPbP
 fVPgQbiZLqPTj5c0cenV6Vl0Ywb1aSS/p/E35qVXloaWnJFJTRB0B9FX4nEZd79eooup
 +0Ufcb4RrLbSG6zbm10EEYfrj8Amzg9AshT7f46zHbi/GlTxnJVyXO8HW4s92H0zzB6M
 Ni3BhZPd/+nKgWDbbU1tb+d4MMQy/HdZIvAdZnPglrbSJiLChc3tMcNLYx66Mqxj0HcW
 e7v3RMlMfhniCEFVBKnR9U9y+/gfuMjlIEpYRsoKQZUEMOTXgC7pHbQp80kAF1nAM8+R
 HKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736327; x=1796341127;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=baCoxPoYsMA8iBuDKvBL9VhxlDzIn+noO4o2ggzg9a4=;
 b=bEZLpeaK3mrCq+2JZ/fj67Fx2TEefhHdC3ndI5GK8sKHi4sek1x1dzJFzE6QjTrjZg
 WKy/Wr8S/YVS4FgOxtMC/IntKN8d0mkj2jowpvha28q93Ao2GX7epPFXCw2axEBjk426
 R9espSDLSNJMi6hF3GwxV657WZZsqcgSJuVM3kBiNGJ2BJAkQzTjWO39Nav1zjTcCAKb
 3MTYNIE+zqtkkQytVjN2Kx+mOwHCm8o84lVOzEYsb4uvi9sdzoZ16wHqqq9fEgBeJ9Nr
 ZkkKMcW4cqsLydmoGUU+S9eMLRi7CKW3o6gr3/7H4aIMmRUddXkrgLb6v17NNCm2ja7q
 VjIQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHZf7/Z6TsyFxUACCWT3tUHqiPNjJUgjJ6nqUpD0T2DnOnhGkIuXm5VDZQmjDOSvJnWn9ara88WeA==@nongnu.org
X-Gm-Message-State: APuU4Z+5an2LQJWWkcD9yQO2YOKfuuWwas0S7/yOCv1jPjOknPyhU+9c
 gmZw/0Covohm0nlmGmYEGUakXR9JKL5MxABacY1SEfLaY9vgEC16IHPlqhrJK+C7j21dQgvdvVt
 pZoIFm0Iphh26lXNlU4U/vKrpwLoTZc6RnKJOeUDt9Ux2KMljBh57LH8=
X-Gm-Gg: AZFdTZcEwln8SXF3ULFJqz5yqZwXG3Rn8pqGjv5cse1wV11Isw8JZ3ApH+wJGeJXAdP
 YpxYyrjsS+mHxsNs2FpVMF1Lg1LC4vgSDs+B7n8+TYZRdaYnLSZeQT1mMGvJZNNnApc+tVbuLNy
 7OA+j1L9/gYS+QAjKL7rRHWHSkFv+ea4CjWFazJq3Nb1vsyhnkO3Byl/Nh7xMZIp88qFr/KAYmr
 5hlEAs/myjelZD+2jhLgiBVRilsRQ5KRpJHxbUmjOAQ2RFnfGXAHX2W8A/PfiTIIELYkxyh7snq
 B+vYbEhFqdRhssEUjr9gODPOo3GYq3VuAR/XsesT3fJBy9LeVtlGuWepLUUvtULYa9H0t8rrwec
 MTdGPb4hphMH/qpJidP9w4ofvCPdu32a9e4kIvcKhdQYpX710ZqHhIx6gP4f3aimQK+AQSihyGY
 +78uinXfJscg5JkQ==
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id
 af79cd13be357-949bab3e44bmr3910283385a.73.1795736327197; 
 Thu, 26 Nov 2026 15:38:47 -0800 (PST)
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id
 af79cd13be357-949bab3e44bmr3910279985a.73.1795736326763; 
 Thu, 26 Nov 2026 15:38:46 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ad6403fdbbsm34502378f8f.15.2026.11.26.15.38.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:38:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Subject: [PATCH 20/24] target/sh4: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:58 +0100
Message-ID: <20261126233604.67722-21-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b08c307 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NXUr6bpYQ72ufyVjMZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 84EqjKGKxYA4dMLmvlw8Tywa8dww1-0_
X-Proofpoint-GUID: 84EqjKGKxYA4dMLmvlw8Tywa8dww1-0_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX1nhXYlUCpAB8
 sl70Y/bfgk5mJq4YGENka7lXXouDNrbu4QliM6tiOjgjWfPDfpPpQKJuHLLIVvcbjefVWesZYYp
 V2qV1sIAZRECFRBMVMvqZ8woOymErvKG366i/1tZxQNMFv0drNb8ZUSMKxqcw3stf+9Hp591XhB
 99kCwRafi6BZCnO/8xnnRNa/zGXsUr5Ox7aoVUh5C8wRlA0i+AhAFHXyAB0prZqMbG2pYFB43o/
 IxmlfhM9vwUo7joqeveNDHAwJsh0iZAza1H+9k+btXTwy/ZphJp7mNpO5/vHFTZgZ7M7cbUhqxy
 8qNdDqrLqAxP8I0yXuE1gCs7PDwcrdzVoOJEPq6cicX9gbrOczi5wnOsMCDwsuBIK3dGc4pp8xN
 L2Ax6kO6LpI2fizYC/QtzhHP3V+m6wFQAEHMReXULDArLBOAODSfwh3TodJkoLIYZU0nEszGTVj
 XExVqv49ir6+RrXGJ/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXzY+khGWTCVNU
 Zx1uImViOXbBnUOuDtvr800jPiJbyPE91/AF2US9i3ArYcGovSQLznGSIkFssluKTylD/GgWkH4
 S1FDATnKSNfbqLku7KAnLxYfBshF2Sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
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
 target/sh4/cpu.c       | 2 +-
 target/sh4/translate.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 17731935779e..90e3e4d52b82 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -47,7 +47,7 @@ static vaddr superh_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState superh_get_tb_cpu_state(CPUState *cs)
 {
     CPUSH4State *env = cpu_env(cs);
-    uint32_t flags;
+    uint64_t flags;
 
     flags = env->flags
             | (env->fpscr & TB_FLAG_FPSCR_MASK)
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 5729a757f191..0f43a5dced14 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -36,7 +36,7 @@
 typedef struct DisasContext {
     DisasContextBase base;
 
-    uint32_t tbflags;  /* should stay unmodified during the TB translation */
+    uint64_t tbflags;  /* should stay unmodified during the TB translation */
     uint32_t envflags; /* should stay in sync with env->flags using TCG ops */
     int memidx;
     int gbank;
@@ -2177,7 +2177,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
 static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    uint32_t tbflags;
+    uint64_t tbflags;
     int bound;
 
     ctx->tbflags = tbflags = ctx->base.tb->flags;
-- 
2.55.0


