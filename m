Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F78606A336
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LwffojDg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCaxgGjF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMps-0006Tp-PP; Tue, 20 Oct 2026 23:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoY-0004Sx-Cn
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoW-0002sw-B9
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:29 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F9g33905512
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3G8nt6Kxp+1K+nUkKwFyrDB7DqQ1S0+arugjesbD5Eo=; b=LwffojDgRNAD1Iru
 Tg36DQys9EktgcqQEYQFoyacmC1SH6okYbN1ljUFD0Gjg4P5msqGevcn8MBxjrX/
 2iwdTZEM9Q6J4pYqB//3s/vuZvk+fKKLX4Q2MChXxtnQuHocgPiKaktg8TySEXhF
 JzKkLLPOraUlx1N4Uqu3c1Z3yv/kO48ZZOvnP+spzc72cHBB89edyhEJMeMPjjF+
 160W88rSkHbgPSoOT7aESerOv7FuELqt4egVYLZyrt/KwGyqLDkiP3aD0xlx0uVI
 Fmjupciv62/n/HJiV0NZ4sbPW/Z2IqnNn40Dg3QV1CCvBXOWXG8mf7PD3cTb4U2P
 0HhhzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs00xb8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93ce7a85f04so65122885a.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552576; x=1793157376; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3G8nt6Kxp+1K+nUkKwFyrDB7DqQ1S0+arugjesbD5Eo=;
 b=JCaxgGjFZYDfDycLYL7ngfAFdwmIh6QxV+Sh7kvNSTQ0ujicg7Kmhfiumkq2AM+xb5
 pr5PtftMrdjIxR9PCjeAKu217+LSupeyw3nLmgfrOOHFkJqqX97dQ9I4U1SM87mjVYxA
 r7G9MxpNzWqMyr46UAVAYC+KP/zSkrPYogsn+7Dd6M1X83uAjrkwyQIM9TqibavaNMOD
 eLhusY46wXGQndNOyjAV7LrATo+wrrGM0NjOZejoeYuKoMd/5P8x58GFW5mAWD2j2eMw
 G/A/4DDfHtv2XjpDUCmD6SrzP4IbtA1XdxZbda9qOKtaCD03krOZ6ZMBQayh8RuyL9Mz
 hsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552576; x=1793157376;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3G8nt6Kxp+1K+nUkKwFyrDB7DqQ1S0+arugjesbD5Eo=;
 b=RhK3xqPrG8DNHYsKeThfxivDhRhq/r3yVgYFFDGOYEvA/N6D/WvSZRP8k22qlFFQeb
 svOOV7WVSbwkJNS69vs8H5DLr2f8vJkKxlFy2cCjRZgydaEnA5zpjLmGjusszFEjdu7J
 dzFJEQC14nEt9HF+rJ4NWNoFfeNY5g+qEjX76ev2cBP0+KdJjYHmzboi/xbGBEPDY04t
 D8kF3vo6zLbt+m27eoJ4mH3DOhiJaG9oKKXaE7Ga63iFIfPUXzXlaASkSfAQiE38d2Kv
 UkMiajKqyFtXsd5In9TwIQMotxfU8c82uJfuvMmHuSHltf7GCp0QUKgBfm3X5yZGP6VS
 AWcg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy90SbHyoyF1RSFVrwbW92+N2oi13KyFL7OLpZIS2Aj2rxZ08ChJF9lt9WDIIlTFI4tltqqIKv6kQ==@nongnu.org
X-Gm-Message-State: AFq9FYL3sv4JZdcsU9+6Yft10Zv30lsjZoo1PFNGIhyC31AuqL6C3KMt
 uIS2mi7HZ9G9iWx/xmcFBEUbe6kB4hx2L2N6nJlTU+QTJ7QZY54mULubYsaXYs26/3lmTG5xz1P
 L7nAOC/oj85RI1+Wgq1A2P4Q/+4/tDxRMt2vHxeCgbSlbiIKQyfbhl/Y44sS9PnAY7Q==
X-Gm-Gg: AYBFou1PT+R8s9NUoPp5LP2si+IRXlpYTO407HIBuLRYMRG8wHs4clYAmOvSw9Sa6+H
 fF6nTFXqiHrL37ZKvQg9hdempGg6Qhi55UO6RFO7s9cUPZK7zIToHprZtBHVcvR0QHWn0ciKuAz
 FJ7JxCD5tuXibrc+J1Fqq0fQBrOqnYpOqHeWeosoi+Pys1d4n8ByiGFYoBG+8oSUxvsIIGH4Lzg
 JS6WuG8xsXIpMlYjzWJhdqlowk1UC4zimLIHTNQydZyTIG6A6Qb8ZoD/KganARFJ08PN5C1EQ+T
 O07OZcEvIkIJh0muK3DtVeZ9OfjaQAEui1sEQz6mELwFovRbJ7SEexa0BHUkZNEpjUX1cN8A9ik
 Nck2Zd3HPShaxwELmxBtj/R9PajhTe6x2Di3VWAru
X-Received: by 2002:a05:620a:4508:b0:93e:920c:c00e with SMTP id
 af79cd13be357-93f57fa0e84mr223641485a.21.1792552576360; 
 Tue, 20 Oct 2026 20:16:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4508:b0:93e:920c:c00e with SMTP id
 af79cd13be357-93f57fa0e84mr223637585a.21.1792552575919; 
 Tue, 20 Oct 2026 20:16:15 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb698ce0sm45223085e9.2.2026.10.20.20.16.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 16/33] target/mips: Remove unuseful EXCP_LAST definition
Date: Wed, 21 Oct 2026 05:13:49 +0200
Message-ID: <20261021031407.24862-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad82e81 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6PapexcjMrqzk0dJnxcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX7TXZUzvbHtKt
 Voy9HPWAiDxQGu2HD08hVqcBbLMQIudSNx/i6UDFGRFl67UEKs6d1A1zCmNMtCxv2eqBRsCgEKb
 ikIHx73dshBTZzgQnX5sgxJkaxIVoXzLyY5fQ06HW3DNXw1XaSaRxcCxyXY6LorRu4ozfd1ZDPN
 uYtEo9BJGr8nEcO683zPXGDorPIMZSQnhrb9GKoa+vpkU6mQORdARNGLF6uoDJK8UrAoNF/lN+Y
 M6nhv/uuxC27W2h3QDrQWxoc5jPKoZkh9aTkJ7gkQmYUSluyUlMqygoFLEFoY/jdo1q3GnA/47Z
 jPRetpqGhvjeNZ1xtMICLvuisAAo0JhBg3qTTIyrQ2VDAOrGIrtfjXRbNG0KkZpZjaxsXgR+Yp8
 PZSnkpxkCVuRFS/oJviKRSGBSRiSatJF7cvXt3jkJtrBLvRXpMfnMKLk6vjJuIrBHKT6iDPLaut
 Se/fIp3mS+XGi+wI4cA==
X-Proofpoint-ORIG-GUID: vmg73ri97hadkuWTyZEVuiljwb6T6T2A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX5FYavLtI1C2r
 vuZ+kfUD6DTElIl/JFxVwyao64nWgjRWD/Ubcf82xhTbeg24y7YpwSxgLcW5/ybecFsfTdbxQRq
 Y7e07CRkbvyZAYtsj0br0Bt1xL4UJpI=
X-Proofpoint-GUID: vmg73ri97hadkuWTyZEVuiljwb6T6T2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Check array boundary with ARRAY_SIZE() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/mips/cpu.h           | 2 --
 target/mips/tcg/exception.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 32549791a18..5d8b78a70b8 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1347,8 +1347,6 @@ enum {
     EXCP_TLBXI,
     EXCP_TLBRI,
     EXCP_SEMIHOST,
-
-    EXCP_LAST = EXCP_SEMIHOST,
 };
 
 /*
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 630b8b809fa..2f02f9be877 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -88,7 +88,7 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
 
-static const char * const excp_names[EXCP_LAST + 1] = {
+static const char * const excp_names[] = {
     [EXCP_RESET] = "reset",
     [EXCP_SRESET] = "soft reset",
     [EXCP_DSS] = "debug single step",
@@ -131,7 +131,7 @@ static const char * const excp_names[EXCP_LAST + 1] = {
 
 const char *mips_exception_name(int32_t exception)
 {
-    if (exception < 0 || exception > EXCP_LAST) {
+    if (exception < 0 || exception >= ARRAY_SIZE(excp_names)) {
         return "unknown";
     }
     return excp_names[exception];
-- 
2.55.0


