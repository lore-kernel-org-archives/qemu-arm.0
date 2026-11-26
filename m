Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D659606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CYE+8vkX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fuWlBLTT
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj33-0000OS-6S; Thu, 26 Nov 2026 18:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2j-0006j3-6g
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:23 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2g-00014T-Nx
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:20 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw9nA2354116
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +vXqnVLR5M3m19J0+N9HVJT/VWQI5UpczuAZAijDotI=; b=CYE+8vkX2qGbBsfz
 He7Wnb81sO1Md2O0ADF5L7IwTlrNVLsmaJP2Unsd+L2poOLZGcXaDWx70zA2Sssx
 Tf0zonNVqJWyDPIxGICUtcZ/zOT3H7kiF6jCzKDIxkLx5mpxiIswQGT9tL/qPlX7
 aYPcF87sm65Dja5yXBuSOxli24ei803ZgVYgSDFNMhZHDnk4pkv/O8KHeXeE8wDe
 O+rmmeEoNRuC8edQl/12rtZZz3ATXT2U63amp3z1dF5EoE5wMMTyc8Tt+hPK/lIN
 SkFT0RBHkoS3OIqQo72l9eMrzP71WF85dx1/bc04+OkQQ95nOmDb09+D+cJN6MOK
 3U+Fdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7u3qs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-949b0d322fcso1242873985a.2
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736287; x=1796341087; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+vXqnVLR5M3m19J0+N9HVJT/VWQI5UpczuAZAijDotI=;
 b=fuWlBLTTstAYnAjfXZpj3oBgpqSZ+PttxS/0Zzc05+8ju1TrS7cMEqjPtGvbJ5awoQ
 f8knpfCIIHWhg1zfPaf6MOsC95y2GhrCUqh/HsvCXfVKjoD9wRzjPOAy+4EyY0MzXX/9
 9PS47WMoyOelKKUu/5utaOcXwkFn7/g+uePrMigknzgFWkmQpiEvXibfHnWXKt1PHtSM
 Ee9Fk9ZPNIgT/G341QK5qUWnJLgGv8b5z2v50sqTJwbp0MaSYWTEUQHr1PX9b2Yoc/Im
 wz93MfPhj3O3eVTEi/GfR/ZRuYpq3XqDJemoDaAgtdbSxBdgryIIjJm1yB/ZCHKFKfIS
 guyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736287; x=1796341087;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+vXqnVLR5M3m19J0+N9HVJT/VWQI5UpczuAZAijDotI=;
 b=Ywa59zvClyiG9OuA3SwKkdeMF49u7r70fda4UZKF7rXE96AFQZIuiTp4I4oWWKkKne
 JP7117QgEjnzb8PXgg8zpBN6vbavH9LzjSNRxgLWf3j3o207/HtHhpwAA59jCJVzsfm3
 1I7sw4gF8p/S+3j8kreIogXBFbJfDHCJWKQMMHzm9fZGCQVNl5XrwfW8CmY8kLp3sJ3X
 2nWoGWwxapFSOMeSMHveLdGozuWF0ZxZB7H3ZWPLBx1fEYPPK1oJuCVr8WqkQwlDdKm0
 J3OpsFvGvy1zLbfdlYHNWMSeLqIkAnloaMalIW6WGF4ff+qXSq8Fsy6+1moHCpCxCnOx
 IEng==
X-Forwarded-Encrypted: i=1;
 AL+hErHU6iB2yK4khSrXKNiUs1qYMtFFX/b5l0cowyM4WNU0+hMeCj+kRJsr3bkePsiozqa2RIXfTd2z2Q==@nongnu.org
X-Gm-Message-State: APuU4Z9cZNqgsukTdicFFx8aNU4GhiaN3H4LOiL2lRfLXEAYvnH8WFRc
 HlqlySGbSjqSvkNmfOOvAQVUMtshKX25obQHQB4eCf0ahKe4VIGm7dCoH+nvDQExJDuWqbrogsM
 Bpol86q4g65FoRYF9ONp4Bcusrci+VAod1wXm4GrtF6QdXk8zqbJY5+s=
X-Gm-Gg: AZFdTZfqg5ph3a3Ux7ZdS/oROL/u9vNoLmHun89UayirXprf+NQj8O2BaElNTia0UCY
 IrTAog4q8NnRnitBdPA6PkS6YCj04iBnbL9FTLfS2vFM3FxeC8DPAhHGZaUG4sg4GPj0HnC5LPx
 miC7ELkBT4NHpqyekfq5dUiowwMg3lsICIbzA0eSs06atGR473zXNscr5U++Wl5bshcGQI2LfVR
 ez13+h03Y3iCjXTqh04Ry0ZuVaRZmACXKki0k+3Ue7pFKAwFWO9UpEEtQ5pIXKnEsP+oNAjyn6X
 o8nagloNcHOwg0747N8NShS0tg/emCJ12H637PdtlzjB73SCz+3JqZJMVqtiMrdyAnezpICFLlK
 9FhRXTLOkn4ffng6CXfY9C+pTuxqWNXXIA3Iopcp2JHkqVKP61TVRaUXO4SxVTKpUje+aMgaQUp
 1Oc6Xv+W2EjO6OCA==
X-Received: by 2002:a05:620a:6f0a:b0:949:7710:37ef with SMTP id
 af79cd13be357-949baa0f7f0mr3633378685a.61.1795736287000; 
 Thu, 26 Nov 2026 15:38:07 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:949:7710:37ef with SMTP id
 af79cd13be357-949baa0f7f0mr3633375685a.61.1795736286511; 
 Thu, 26 Nov 2026 15:38:06 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884865a2sm665167945e9.3.2026.11.26.15.38.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:38:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH 15/24] target/ppc: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:53 +0100
Message-ID: <20261126233604.67722-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX29AVKjWlbn/Z
 9Degoj0lNWUq6EVFywdc4uAv+b1M/8oEmLghXCoteuu1B0IRCbYZyXMApqJFfMJvUIc7o84mn6f
 2uqY69MhWHV1pMyPax/QjiT8D5vkSJ4=
X-Proofpoint-GUID: sm8ePbxUMiVkX7iuXKYzR5rX0fqvjEe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXyE9+vhx4p1pn
 XKCTrjEyuAIp2qCl9e6fhYB8kefECw0yzPbl2fbCxgTbDG063N1KtsBqsVEJVnozKb7E6H2ifUx
 6pIwvVf7K9joVr7XJaTYC+moNIGLT5i90RKG5QDTzYTIdnrHLfg8DyRf7m/wXtRdWv7PCOhHANM
 FVfugip8Am87B4zlJPNxOj8HkPxgP6TX+gIV8A6RzWGZDD/gOSJbj5Cwjiqjc+315hzyjYttjTi
 980zN4fiL6sB62Z4EJeHtvOfV1sfwfKH85BjAdTkegj/cyVAgHb3BkNdwdNfv8p1ikLQL/UNxYq
 7mvy4Pxb600KUkGJyvJD3euvxLSDi+5ctYZs+U59362uGLnLMevZBNoT+brn47cBvaaBrwYEqf7
 KAlAUbBRttbcDq6M0lKBdkyC4rl5J96B9luWCSKgNFIsQs1ZQ973qT9yjMpnKUh0nQUq2Gcxb4i
 SigjlNTp7c+ZD3PtnWg==
X-Proofpoint-ORIG-GUID: sm8ePbxUMiVkX7iuXKYzR5rX0fqvjEe_
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b08c2df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3KaAF8_o41P3ivBUNq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260093
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
 target/ppc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index dccae25bb4ec..e7bb0e4d4667 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4996,7 +4996,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUPPCState *env = cpu_env(cs);
-    uint32_t hflags = ctx->base.tb->flags;
+    uint64_t hflags = ctx->base.tb->flags;
 
     ctx->spr_cb = env->spr_cb;
     ctx->pr = (hflags >> HFLAGS_PR) & 1;
-- 
2.55.0


