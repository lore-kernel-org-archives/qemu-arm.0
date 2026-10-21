Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C814606B541
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RVnlZDlt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DoknxeNy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMpb-0005Ex-T6; Tue, 20 Oct 2026 23:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMno-0003Dk-7t
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:15:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnd-0002fE-Or
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:15:42 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2EuG73469274
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R64IH3GOCKtnA3P9h0NKSf6oM61YX9jVt5CpSJTP1eQ=; b=RVnlZDltJRr35kB3
 Dxs5Z/rbZuYthS8vjvP/tJ2WZZL20qhqrjPJZAGe26BYPP4VAm18dZaoAOfXD7JL
 1smAuPBCA6mqZISNx0E2yJyzNy8lm3pJXdaXe6tdXwlB+J05V3q9YtN/djju6orS
 DJifLRh9BS24WRZVA3pb3WVC0V9CgyxN1Teh3YJoUebUYHnAdxrGqw59Mye1C8oe
 RbOrNERSMBNKufqVOQeTOHUkSG1VZ6lnBx9EtF1Q6212pG8VjqXedl0QiMguAO9H
 iYHzqWTzpaKX4ZIUUYDK7eS2/tZR+ks0GD5rVxqd80rt0oTYSqjOuFz6k4rmZ1vz
 G/KAHg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2ba5r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:15:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-917a7fffbe0so6816106d6.1
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552505; x=1793157305; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=R64IH3GOCKtnA3P9h0NKSf6oM61YX9jVt5CpSJTP1eQ=;
 b=DoknxeNy7fUzKqjffFocQVUiGbXROnJovqBG37fls4OSD0ImnLMTGre3UiMxxr9EQu
 tP3qLVqU93YjZaLEUKa2zg8UmEcwxMo0PJxdb8vhXd/7KPJ3LTzLgSrqeeAmJrDGjcZS
 SKOov3UhpSnSn7qHo4ZJDbfh7h5dbwCJQ5vOAt0IM96xWFCwUH0HpeSMjUPy9Rc6Px8g
 tEv/TfR6BDnaUcU0xNJfOdHunlW24TDPK2rLgQJkZEutBiI40dvtGgf6XwuXzuSuRNDW
 vxW5hO1J3gEZ2anclTM1+wWtR5vnG8YJRjiEdmv5ujWfOwQGCquZGw0qNH7VpIF586SZ
 8klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552505; x=1793157305;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=R64IH3GOCKtnA3P9h0NKSf6oM61YX9jVt5CpSJTP1eQ=;
 b=famPJmOzi4LEZEF7bB+p68aK+q89Yk9LXLaqL1ZeHx87wMynsygOxXhy//tph+pbuy
 4Q2xj3w5bky8MErP4T/aahAjY0r2ttPI1STRAgFoy/dueKaIjBFImmdBsi1yTyIf5Nxf
 ob/CS1W3c9/Vy5GMCHi1UzhYClQXlENwhQHqxh8X/AHLfi2P6eNTEp7Mm5xCFg/y958J
 R6+qV5K1ym/nDXdePW75zVIwWeWVm0CGVdeN9air7YFYI3P2gwjuZ05Eos+32PguvvF9
 h/POobh5g6YTwiRbabUbI/MmeXp9/bYX+D5frKdn0LgulL2YVROQoO8Ku/gZaEbo2qDR
 E7mg==
X-Forwarded-Encrypted: i=1;
 AKwUvByeC8zMoAsRoNNp2X5YC9mCjg3QrbHnXTnHWkMnYbXHDxinEQ6QUtjNu54Vb72+F22rkq5/Vu6Yxw==@nongnu.org
X-Gm-Message-State: AFq9FYKRfNrfZOeS7aA66gTobI7LaqDqX34ly3dLr2idwiybX3xly5LB
 SQM4mnXu2kpBiurOEBwqpHEJe8g5LIh87L9Z+F3+6RTfdOd6xJzRjTJ3s8mfT/rea89HFUXCePO
 QkTK74W17JIsvu8zY79iTxFOd3WzhyIwXdfYNNvCXre3zs98zTYyvsb4=
X-Gm-Gg: AYBFou1oSSxOr0U6DXCaA4hy8LLAKlI8J7I2IP/UC2+nw9/FkY+XraQYRhpPsZQtqNM
 Zf2SyCd/3+DbFpS7C9F1pjv2RH0c6p6/Bf7puqrd1DxuOFmh4D6gGXxuh3mAHkDojwQYCAppiJB
 UqIJvO8cYpLxSJbYgkYZSuccdmdqSRXbWZqx0sZmv4SWJ5GP71YhffPsD49OxhDVnL8jVSajK7p
 Ck52rbqpIUxnszhGUwUp9uqOJMi4Or82FH/xGaDb3c8wancLe/tI8sMIsJRt8NUqZfb2gZbUxkp
 fw4NrU9f/mdN5vTS7y6JBdvIPokiGr4vWVYhSz5vidh8qzQtv5K+TH04eQO2IAbM2yhPSJl8L3A
 DcxHzPd4/D28fs/aD22h0Ct28hdreKSiLxSdUSp9z
X-Received: by 2002:a05:620a:2907:b0:93e:6b9e:6167 with SMTP id
 af79cd13be357-93f57fa0e8fmr228025685a.16.1792552504708; 
 Tue, 20 Oct 2026 20:15:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2907:b0:93e:6b9e:6167 with SMTP id
 af79cd13be357-93f57fa0e8fmr228022985a.16.1792552504251; 
 Tue, 20 Oct 2026 20:15:04 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb80e859sm42414075e9.4.2026.10.20.20.15.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:15:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 07/33] target/avr: Implement and register
 CPUClass::exception_name()
Date: Wed, 21 Oct 2026 05:13:40 +0200
Message-ID: <20261021031407.24862-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vz1i43Jp9RY-sGgBLuTBIu8fhsY8W3wY
X-Proofpoint-ORIG-GUID: vz1i43Jp9RY-sGgBLuTBIu8fhsY8W3wY
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad82e39 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=52sdbkR6oSSg4JP1pMIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX0auSqcKcnaBy
 QXgSNaJMPn/nB4K9MzeW5NBo/9kypU/ohcWy8tZdxqQNejGCqtzD2uMzCyXO4KNAH+LScwHDZOR
 l3nsnFfAMUQeBD3YDymYvnljdWpbtXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX8HSTDsaKepTn
 FgKKNfvBGYhT5SzXkRMd96jx0EWMFbohvunEVnQkG2mWICGh0na9fF4XghFzb/RiilpF6ktPgjl
 5hZTX1KWixZS540S2k98Z9TAfJlq2v3s1WA/J+2U7u5pWEORoaUIee/Sbd0yHYiWBlTNyPBqHAU
 dfIubk9dEk3/jmOiqKMFI1bS6SVqXjVpXjwKdFoIJWZvkSDpBOjSKxQ68WdKlwYvMpueK9ERedx
 IIWtuBL31+A56mLbd4aTA6qh8RQ+5NSVZXmQf+EbnJCWzarE4rTDSUTnEsri55VZEv80j+nIU9C
 lrMYZ1GSe6O62O5MtBWJqGkinRjwg5bWLUdrhgEruW8zKm8h9wPqm7k5WX2T86pYcrCxnuSHAe5
 smabPO5g/wrgpA6rf3i5Mfm8H9Zdj3OKbnQvocqNDwMIf0PRVf8Dtl35nPE+C7To0KA27RaL9JP
 HhO0hPchhWRvHTDLfPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Implement avr_exception_name() and register it as
the CPUClass::exception_name() handler, so the common
exception logging can resolve AVR exception codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/avr/cpu.h |  2 ++
 target/avr/cpu.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 1e4e839bd83..b1b5b637617 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -44,6 +44,8 @@
 #define EXCP_RESET 1
 #define EXCP_INT(n) (EXCP_RESET + (n) + 1)
 
+const char *avr_exception_name(int excp);
+
 /* Number of CPU registers */
 #define NUMBER_OF_CPU_REGISTERS 32
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index f8409f32ab9..485f6ce52dc 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -258,6 +258,21 @@ static const TCGCPUOps avr_tcg_ops = {
     .pointer_wrap = cpu_pointer_wrap_uint32,
 };
 
+const char *avr_exception_name(int excp)
+{
+    static const char * const excp_names[] = {
+        [EXCP_RESET]    = "RESET",
+        [EXCP_INT(0)]   = "INT#0",
+        [EXCP_INT(1)]   = "INT#1",
+        [EXCP_INT(2)]   = "INT#2",
+        [EXCP_INT(3)]   = "INT#3",
+        [EXCP_INT(4)]   = "INT#4",
+        [EXCP_INT(5)]   = "INT#5",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
+}
+
 static void avr_cpu_class_init(ObjectClass *oc, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -273,6 +288,7 @@ static void avr_cpu_class_init(ObjectClass *oc, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = avr_cpu_class_by_name;
+    cc->exception_name = avr_exception_name;
 
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
-- 
2.55.0


