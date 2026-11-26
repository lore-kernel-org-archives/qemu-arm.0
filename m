Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D393D606A324
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AHmNuEz0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTsw/ffV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj2j-0006j0-3k; Thu, 26 Nov 2026 18:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2H-0005tE-0d
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:37:56 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2A-0008BF-C8
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:37:49 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJvw1X3339738
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vrKhK5W7SiJJIMTyhr8R3o+GZCDhh1u204E/b5tNOeM=; b=AHmNuEz0q8Up3Rmj
 sEG+1DumHmNxsZA2mCmJJJBioMoVhHJpTtJ/ejVCd1NOaSdAM78Cqi4HRKIq7geC
 TQOQ+Hl/dyhuQwxUxdDp0OCyOuMGVCkL8vHt/C+R43Mi6VfhkmC40nVIK1myVV+J
 k3cdO/j//FF13Axawu+oyGLBLl5tXF1abD1YeglM0+OvbajFJnHhUAR5Qp1u5acD
 Jm3MWwxttKxQtfI4+zHJvei4V6+AQvWTUd/zd2JE1+GsUvySN/1+HT42HFAaBmn2
 +Bvm+bwDKQthBMGBO+aaHUVsSNHtF0Jd7DRgDvcsmuJWRiHEcOIjU8WdgKPTiTMe
 QZN2kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqhdsq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:37:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-948d83322f6so612724685a.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736254; x=1796341054; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vrKhK5W7SiJJIMTyhr8R3o+GZCDhh1u204E/b5tNOeM=;
 b=OTsw/ffV152MQiEy0nUoAKoWQNgLuh1mKAOL+6Qt9c8MyNy2VN7wPeNoDuJWM2qoH8
 FnY/8s8lZlyqlFDFK0XySK4AIkGtmVFMwbl0iB/TJ8ZIUx+ocg4hudRgMDBrh5iWkLmE
 PaUfMKLc2QPwBQUYl7K0bTnr6g/4DjMtCdAQKKYQSmcrbGD/H6D+ACGvaHQ3fGpmipzI
 YHBxs0pgocBAzYNKEEdAMR0haZr3ldskU6AZLlcRYjeRppu+BQVq1Cy9xo5k9pMBMSKf
 8joH6yi9MbY0bqgegaVjV57ajWSKaDPNItEeNDwwfTo4C+UQtDL4/cHqAfMrzrVqpe80
 xHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736254; x=1796341054;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vrKhK5W7SiJJIMTyhr8R3o+GZCDhh1u204E/b5tNOeM=;
 b=nxedcoq7idLNIZDlfsnTnWhdojcRKxb78PvHZoJ09zfvbPsIuXc1ZVZLYV0+5YJs9Z
 56I7YdK50f4mjVcYnHgM36Ke7jPFicRU1yRnnuFW0F+E7/kC7+TK2fbA/sfydppWxcyR
 wUE8QmkyoMuMWzy+/cVph12vj5xMbXEkrKRG6SZcFL2tp7b8Sn8z2+zvtB0eOYp6Rj8V
 GlRgmh9B12lwOLlXqyMP+nwLhCmVpv7GB2d8pAonkfOrvGSqO3P+V9HiY6PZFjlvWwz2
 8mc51uqw4h/Gn4ILDAaqvLWVvetnpQgORJsC9qKH1oQnOyF80kDGice/T7DMAj4/nlK+
 R5qA==
X-Forwarded-Encrypted: i=1;
 AL+hErH1X5374euV+RJAWsA1SoQhjXmwSZNmhlHD/7w07AMfZuf9QRlNQbWyNgcZheDqRn7AQpNZF/Xliw==@nongnu.org
X-Gm-Message-State: APuU4Z8YRBCuJbZCXd+MpRfFK8fMmkypoeGGB07e2FCg2gQRiUtTnpFU
 1IrPZBev9rMFZR5iTBhqfhKqchwYCo6BzkX7Ea0Z3dWnMb4CFsxJO/a3SZtpxTHf0yqPr9y2zZH
 oX1Rp8iR5rqLnY+GU57c6rw/QJQO772pNVwDha/BZz/8ZFDtCOZHDbpQ=
X-Gm-Gg: AZFdTZevsLY/2Y6HlDvtSca6BQQ9HtGRaFIbxMwLAn5Bsz17SmDSQPBors87GQebEIk
 5EeuJlVMc0wmz0W+esRDmXiVTHP/138dvENGqPLKTH4sZ79YoxmoNwklkbq41MHRlOtuIMgE0Gr
 ZO3RJiuE4Bw6e7u7LmJXhbPV/vCAiWC2pClRFqnUqb0lPV65aBkxvGNaZdZhFBiqSVN3FAgBiLN
 CIdqgV1Nn5XCMa0fAvtprop+MYML25dG6wQeOv5+V58bNEHEmRE8m/nsiqTGw/S9/WPas4Mm/Ju
 HzRp/n1g7SLhPl7rqJE/3pkCfoOMgY6hTjxOSc9kjO4XQtenDYNCtSCS5QCEsmCrQ+zBgUpoUXZ
 RevPLUyrlM8pilGczfyQITmZtdfJxRUfVvvs11bXwBsA3rg41pMqyFUCDmNgKUdwbfdRUv/SjG1
 R3lDgIB+W1iBJrhQ==
X-Received: by 2002:a05:620a:44d6:b0:93f:34c9:925e with SMTP id
 af79cd13be357-949ba9b3971mr3920515485a.19.1795736253810; 
 Thu, 26 Nov 2026 15:37:33 -0800 (PST)
X-Received: by 2002:a05:620a:44d6:b0:93f:34c9:925e with SMTP id
 af79cd13be357-949ba9b3971mr3920512985a.19.1795736253383; 
 Thu, 26 Nov 2026 15:37:33 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a680355sm35925158f8f.27.2026.11.26.15.37.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:37:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 11/24] target/m68k: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:49 +0100
Message-ID: <20261126233604.67722-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PuQKVL-DdPNhU8Z7RRUph0hqXc_ik6-T
X-Proofpoint-ORIG-GUID: PuQKVL-DdPNhU8Z7RRUph0hqXc_ik6-T
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b08c2be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kLFFoVEq7Bwz4vqrUBEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX0e/6b2YMPZ6i
 TJ83R2EJov0F5S2NJbPo6JWQNSuJ1ysQFhFCfvX++diIGAPzVX9amyfan9Tv8vdFgzfX3wOiTh7
 aWDlIfXYivFa+PvtMK71NHGFSU57e4s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXypHlq1UWb+Tk
 35cWOSyWgO121OWsvpCrycvrR8qr0twAeV9l8T4SuwIH5iYuu6ZTWojXGBRxZy9zNhdMwJqIiRY
 0qVcP+OtD/LVXdrPlmqwP9NSYcYIWRAkstNyI8WUSK89ow5Bjm3jFp9LfGDkyMQL8DlI0x7r0CH
 +ImEGFtDFOO9ghfyylbfUefKNhlOEM+fFkyKt028XZ5ib8zGcUvpdd6UKHd7b8J7ww09VgORPY3
 KmHJ84PQT0hrJzMMt4bBpYWKUzfWKbIIRvfWfna+8dkQBsXYcef3At6qY7F9Tdm7MMmks7Lnxyu
 ZT7gfQiqQDM7mXMCovSAqdi9SHRAlVjWQY84QtgVx7VVaxdVt4jBkyb1l6CGu35H81/IA3/qK1w
 iLjNXcIGIRzz23RCuUXp8p35EuBHUkJ15j+ObCUNTbWazzU/LQkCHNbquUx+mCTwhleLMAjE6u1
 w0YDvpBfdxQIdg0VBrw==
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
 target/m68k/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index f7d289e591a2..74ac2a177cd5 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -47,7 +47,7 @@ static vaddr m68k_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState m68k_get_tb_cpu_state(CPUState *cs)
 {
     CPUM68KState *env = cpu_env(cs);
-    uint32_t flags;
+    uint64_t flags;
 
     flags = (env->macsr >> 4) & TB_FLAGS_MACSR;
     if (env->sr & SR_S) {
-- 
2.55.0


