Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFEB606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nu2hh29r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XumG8tPM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj17-00044S-2k; Thu, 26 Nov 2026 18:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj16-00043f-30
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:36:40 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj14-00044v-HU
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:36:39 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwmYO3865524
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QONOBStajQYCwKzBtGV4nyPtKNWDG/mhSu+eYFrVE2Q=; b=nu2hh29rBe4H6m71
 O1x+wDbmH6VUDyI1GLsWxoU1v+DbMeosG0Abww5b8GhaPuB0f3FViJsy7uO8VDVK
 HhpTR6qdN6dKH5m1964nYsGlZiUN2LNMU1lTX+xbFC0Cn5ZxzZe1MLzkIkUxetOx
 xFO2Wk5I5H5SWYxEUuDF68pHlMTQHqrM+QzhCsZuPR1167aHXQ4vIT/zrEmpUgvW
 Lb9lMoHEil82XlNdW07W3IpmyTWTacFO2+/GM/yQAAh1B2uvr1rZmsAvW5+g0Ggr
 7BGTW9flaiApOTmtPFyFN6FmVw0z138YxQ9VNMqrfdYUL1Bdph4mKGgc9mAOk4Lt
 LAE49A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55rfq9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:36:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-94961ed97d6so1245745885a.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736197; x=1796340997; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QONOBStajQYCwKzBtGV4nyPtKNWDG/mhSu+eYFrVE2Q=;
 b=XumG8tPMKcSF+HidebH2VRQSF3kZpUuv8atOPvGZo8u1b5s+qS+XImZqHsU6nRuuhi
 D9iOMk2SgxwY+rgUWR+pZvPHLrF/aLNXVpDNs37VBzje+OelcqNWKNJMsRXzAt6kziGR
 UjF7/KNhwr9A3iApYoHaaZisywo/taTeb5G/hmhP9/4a0J1mWNBus5YJHnCCVrYHiWZG
 a+K8HdK4/cpn+ApfNjTBsz6Zgitv5lxnKTZA6XJl7hklgrO2JGMA4aNX5Xrwr7WKjSJs
 QBeN7oQpSy0TLZT0JTESPyS8Yzj8JNjQiUyrvB0T4AB/QkTIN785IqxOA6pO3Atha7VG
 2DJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736197; x=1796340997;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QONOBStajQYCwKzBtGV4nyPtKNWDG/mhSu+eYFrVE2Q=;
 b=Ib1m+fPFJZSgq2FEu2Ci3DbiCHDwzRvtNP4xrdx/9GkoxLhJffY8jJjc4rlT6LaV2q
 oM5PWyjBeYzqDlSsyyy/F3Xjt3qVghltalMMfPji4UoKPggzebIXIMVMyzYqZUbIe/wP
 5dvDIw5iX8YIKTqalI0HbEigCbTXrL2mjS2KUjacLnNja1owhqhFD0M0ZgJHW+ZLdXkl
 4x33xZ+Y6vh9Cp3LewcXlLC6whgzSpfYpOOULfQ0E/Jp/iQ4KyiZzrLvOy5eaTPHBEs8
 r62RYEnOvpwOp0d5gIP5GeBeQJ/3Ub9L9AtvVU1EPDDBD9/OpeTJ+p1NHForltz3+Jze
 Vz4Q==
X-Forwarded-Encrypted: i=1;
 AL+hErEl+dGNS0nwg3uBt6Y698baLFBX47CtBSoT55mK34ltHiiEYNPc+JwjQ94j2MLSAHw30VLsiLdlbw==@nongnu.org
X-Gm-Message-State: APuU4Z8fjUXg/leyA7RytUxVSDi2FNZNPHu3YN17gH8P074IzD9/Wmxk
 5L2EcqYyKm8JML0yUBPkKIHEf4O4M7bPWOY7E0pTn5Vz4yaWSN9zdGQZiYxMF4MRkvRLb2aL5OA
 1NupMHc2qJOdfyIUzeBsILTzcWSp5WfPk1ub/pYYrGQqi/3ZJmcVPVgg=
X-Gm-Gg: AZFdTZd9xKUmXBXK22mdp3gC08Ok1rmfWMGdOuOeEjsCJhObAXLxHDvMyAN9YeLtUxp
 nLwiO/Ywmp9mVeklFH4uNcxImZrlbFLKWLP4JnHj0tBIAvivYfotddVmYvvwgiECh9dDX+QHHVQ
 +JphrGXFxAsgIVXiDiHLYOonIK6DiUN5dt2LEMG4JAQjEEdiYzdPeYNILdXm8G7eQO90TBjfQS4
 KccWGBiPdzzqFieSTOZI+wswT60wMQej8pZnjPBS2CX0eqij+3UCGf9FJjS9Qmqkv/6VCAV+b/+
 22IKJRlWi6GV9XsObwGWfBaOROHB2EeQo4TdAKOF9lo8AJY/pprvIOOabw5nkLrQG7H4oIr8WtB
 XGrSV7en7uItzCjRS5izq9OMC5L3hn7Ns70MvYZF+cT56huTaZrJ+liLBWiDyijUlNo7En3SsXt
 sago+ymUSK6BIF7g==
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id
 af79cd13be357-949b3402246mr4031066785a.3.1795736196858; 
 Thu, 26 Nov 2026 15:36:36 -0800 (PST)
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id
 af79cd13be357-949b3402246mr4031063485a.3.1795736196370; 
 Thu, 26 Nov 2026 15:36:36 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d60sm44575008f8f.3.2026.11.26.15.36.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 04/24] target/arm: Update TB flags split comment for 64-bit
 tb->flags
Date: Fri, 27 Nov 2026 00:35:42 +0100
Message-ID: <20261126233604.67722-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXxKXaEWZVWj5l
 xTwBMuY6q1WO2+lCUiVsfIuD7m7ZQMt/sVm62FIqOLu+RrVLpULqONSMQJ+D+mDKqlWqc7pOuea
 iA5Oq1UnaHj2Ndrvlmzv20/CuLhfJRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXx9DLvDX4ZXbN
 vZKL6CFY98RexsOxop7KONZrnEyReSeeH8eDTxDEdr8jOtq7a4Px4Zx2PZqxv3YAR0daD05ogk4
 LIa8ip11qUSAvQNUn7hpT554H8hNMYAoGyBANKlLprgWi9HZMF/IeoztSkVb5OnuHvv00R35tcU
 GlT26fQi3qLKIBNOi7V6JKEVlb0aYDna+pk69QV9kOsjZXhPhe0R35g4L4do1TSlUgDdnKEYGfP
 PhcUVeH9yuufEv4E3d6cASolNXXcBUuZnekOYeJHeT0N/DMn3OdEtMCv5u9MFhWpTzpkFqzlRAH
 R6VAjn3OYRoU0UmRazn/gikIw6c5z3yJPRpqzMulN9nrz2bIp9I37a7Lyo4Kog7atVxuQtbGQzL
 2yntTZ19363ZxLTgnrPtAkrMrDGgkIOjDWoc2ZJEKWRzI3bt4oZSV62PsDLQoe/2sy/IOXKAK08
 BgbJXps3eJ+3ztoJ7yg==
X-Proofpoint-ORIG-GUID: 9Lu380pz79ewhGKmbVwuzFbwqhlyynXQ
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08c285 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EmkihZIgwSgxwUNpL-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9Lu380pz79ewhGKmbVwuzFbwqhlyynXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
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

TranslationBlock::flags is now 64-bit, but AArch64 needs
TBFLAG_ANY (15 bits) plus TBFLAG_A64 (51 bits), so the split
with tb->cs_base is still required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/cpu.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5ee9ebf352fb..59e44b76a08a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2484,8 +2484,9 @@ static inline bool arm_sctlr_b(const CPUARMState *env)
 uint64_t arm_sctlr(CPUARMState *env, int el);
 
 /*
- * We have more than 32-bits worth of state per TB, so we split the data
- * between tb->flags and tb->cs_base, which is otherwise unused for ARM.
+ * We have more than 64-bits worth of state per TB (AArch64 needs
+ * TBFLAG_ANY (15 bits) plus TBFLAG_A64 (51 bits)), so we split the data
+ * between tb->flags and tb->cs_base.
  * We collect these two parts in CPUARMTBFlags where they are named
  * flags and flags2 respectively.
  *
-- 
2.55.0


