Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B37606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fvnXh6t8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6C6mz+T
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj4x-0004gI-B0; Thu, 26 Nov 2026 18:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3k-0003JJ-SU
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:39:28 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3i-0001K1-9A
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:39:24 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQK03Ne1715668
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T4KD2plqSJwbII+rEv10JmyH9+3bp7hPLv8JsQLgPDI=; b=fvnXh6t8fKg10uMp
 uhpUEK42s9tN0jfD+yljsYo0q8OqH2WRpwpATrhpTGmH441J8uwLRAJQmXuJeVwy
 I6cAROWPsblqPZg6SX0yAN6adJUDDS00fzz6wDagPY8Fq700iWd1XuPuGJI0+J3y
 w8xEsA5jUfpzbpw4BDZMSzUzAe6PqcXq/Xm8CPeIRfMEOkbD7Zor0Y6Lwtsj8gAn
 ORisBlCXLt/D1Ga0JesdegnWhT7brQ6pNL/+qjHynbZnlrVF21bhTb68+dXmqzsg
 JLDP9XxLjiK9mz8suyMr2bOjFEC22WPjhGGURwAdJPKhikdt3oGMf7rciKAHJU+g
 sxcjyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne2uag-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:39:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9496ff065bcso1004149385a.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736350; x=1796341150; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=T4KD2plqSJwbII+rEv10JmyH9+3bp7hPLv8JsQLgPDI=;
 b=Q6C6mz+TvrKGbHh3KrEN3QVoZ2r/cWi7V6Hnsk+i4mKKjyvzy+xKFOOkKAa5Vw8Gac
 W7T0gThBD3bzeXIovxFrxO7W7kSEj1hwMyQerZIKniDTdYZMSrNwERq853Rff9SwY+Ky
 n5OXMR6rLCHBx1DRhCKXk5GiI4eHyl1p8nArWgKv6d9IC7Zxog1u9JFYd2GJtQAxZAAy
 xTQvr3pApDv7Sd+mlbJQz9GXjIIujPiM+RKr4zNow1t4p5aKHMtTEW8BLrIRw9z4Ub69
 0YX2W2fzn8IsC6vtstrXqzhuJUJoXEMFq6Y5IAcpZizBJYQgGkhVS3UV0PsQyGpolr6j
 fZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736350; x=1796341150;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T4KD2plqSJwbII+rEv10JmyH9+3bp7hPLv8JsQLgPDI=;
 b=JPT3WOj78xhrt/OG6w8hHdhA/4EHv/JRsfFv7Uzm0YxNK48+NUjrMryl/m6Z2tzvzr
 v+uL9vJNYMrPnlfeKWa/BozDxFt+DeyUlLuZAjhUxsWTW/dZ+UFo5lXnNg1dUWbQOnHA
 MjGnDQe1Hz50jR3ZzAB+F19ZXbOZG7Xlis5bgjhzfgizXY+MqxORYeXyqE2JofmmKvKj
 /duQfGy01uqGqfAvQdoQo2r8ThfJwzAsdIGor7UtkCQNTXFCKKZd2zRu07/aZPGnV0GQ
 eCv0/+P0hJmA6Wy/L5NL0S6lFLeR71EXCdWr9itAQ20dhUTYabyDavR/QzKsglp06tLA
 l7ag==
X-Forwarded-Encrypted: i=1;
 AL+hErHKVgnvzJyDPXBNJSrAIMKt5EsvaGhoeNqyaGlEBWr+EJYW8tnfWqeabJKxKQES8Uf7XQj4ZiTw+w==@nongnu.org
X-Gm-Message-State: APuU4Z8VuZ3PDtY/PU1V/Bpio/HT/GT8Es4MP6CcDgPPah7+sg5eJu6U
 XrVjvqc7LlKyIFaHqUMoTrHNkRvBEDGsDCxAwM1/TpP0ypBSaY17NCcQkcVnJvvUftaTpOkp+zi
 DvMkVChqNTP6Ls3UycqGCv1/xT2aBIVhDRPTf5kDTbh5S0Oo8qOtcGIM=
X-Gm-Gg: AZFdTZcUcOwbnqMXlryKY5hEDkKPM2A3k6T6UPtjvco9LOAXS2kYQPX7JwklayArdqi
 q8nQhDXq50ayQ5jPc0JpNzA9oH/wGfsYdN0tiRzR2Rsd+kkfe/RiYz/W0fvaXPbFN5LkDpkA10J
 t9tY52VPnz2cjipWJM9GHbdtmxXfuHqM6rihvvej/JzHk33FmG2ttuEVJBBJoMtMpkZFW6l746o
 bujpcT8+l3T8FzhXk1V/UqsR/r81qcFn/6auUo/PlGUhOTBm/5Jlf4AslTpo6GNG3cVhLra93/y
 9tlv3QunhhT8Kqm/GnmzWLm0+LaLaUPmeGHdeIb28QT+QwS0SasZzDuf9z2yQnPcf/8p0Mk3TlJ
 lbVcuVz4Zj+8WFpNlx89IOGdS9/dLUE14W1fyKJu731JXu77rT7D44MDbDnD8gkRNdUGtXYTEAk
 RYV5k+sZi4Xgp+ow==
X-Received: by 2002:a05:620a:4802:b0:93e:e425:22b3 with SMTP id
 af79cd13be357-949bab4cb4cmr4283450985a.82.1795736350480; 
 Thu, 26 Nov 2026 15:39:10 -0800 (PST)
X-Received: by 2002:a05:620a:4802:b0:93e:e425:22b3 with SMTP id
 af79cd13be357-949bab4cb4cmr4283448285a.82.1795736350051; 
 Thu, 26 Nov 2026 15:39:10 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b8429sm1000473335e9.14.2026.11.26.15.39.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:39:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 23/24] target/xtensa: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:36:01 +0100
Message-ID: <20261126233604.67722-24-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b08c31f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IQlASl14wn8skyX-vSoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXzQuRKXsSjn0O
 dLJXcotoQaSNBOoSIa9kDvg7WvGBE5qKUQ4NXYgL0prnFhv39NDnpFwATcwVjuXStlAP1PY+hzy
 iuR/kRV4gBvBJKF4mIVqljzpohp+SgxMx7gA9VMd2AfgeC+hXlxv7cMs/XBrWttGlituUjqYBzU
 /A/bGkWoE67TULBEeAWYwRReHtrkcDAJR00BTg8VHx+OWEnd3+/dMoNujCHqVJNDMzsxnnYkIjJ
 V3jdZhhdV86SLVWGH+N+IhTD0wZ6318YUn+CbKhEJ0Ma022G0MmNt3N0m8A8s7HCRuL8NQv3FLQ
 25eE4OghPFR/s5NA21YBeKnhOiTbuBjmCuKAjsTzJAX/m0Pjk/DeSKWB4lkmDA8L5GQr5zF5yyS
 F6OnZbS21Cq+OvkmDIY0p9GCowbizWso9ZIkfjGEbSOi8t7rElD6UInWHqATRalqfjPnfsMvwLi
 pICD4FaH+qLYV/aJSpw==
X-Proofpoint-GUID: NAmSv1aSG7_ThiI3tIAYO-BWonz4IxR-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX8lXnJ00+dDDa
 jllCw4oSvgeHn+DWVvn56EUsu+eFRXERxGvtFitYYU7Djpd0GSQ79LFHTYcFXBWGX8/xaXPx9w+
 aFDCveXi8F3t7qIP1Z+xq588qwA3bU8=
X-Proofpoint-ORIG-GUID: NAmSv1aSG7_ThiI3tIAYO-BWonz4IxR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
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
 target/xtensa/cpu.c       | 2 +-
 target/xtensa/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c193396928f9..33054c81ca48 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -60,7 +60,7 @@ static vaddr xtensa_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState xtensa_get_tb_cpu_state(CPUState *cs)
 {
     CPUXtensaState *env = cpu_env(cs);
-    uint32_t flags = 0;
+    uint64_t flags = 0;
     uint64_t cs_base = 0;
 
     flags |= xtensa_get_ring(env);
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 175fd4b5cfc2..57392ffd8319 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1121,7 +1121,7 @@ static void xtensa_tr_init_disas_context(DisasContextBase *dcbase,
                                          CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    uint32_t tb_flags = dc->base.tb->flags;
+    uint64_t tb_flags = dc->base.tb->flags;
 
     dc->config = cpu_env(cpu)->config;
     dc->pc = dc->base.pc_first;
-- 
2.55.0


