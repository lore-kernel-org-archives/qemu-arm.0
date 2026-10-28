Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7138606A31C
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J8cz1F8h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQg7X39e
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM4k1-0005F5-J1; Wed, 28 Oct 2026 10:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4io-0004vc-AB
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:33:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4il-0004S7-KK
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:33:44 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBdwhl1011842
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JrpxIoMHu80juwCYv64Cdd+JGCNn6vrwIlylVgcVrqU=; b=J8cz1F8hcKJYrb6V
 Pd5o+PFGzNnY89hMsrvAy3PAykDqFyyQi42Ewb61AGaw+ctyJCilf1ztcpsWtkFT
 rFi4mO2BiVvNTRqqAX2sLYY/OfJQvi9xdTif9dRGk9GAyrbX5GfJeOyEHnjyT6LA
 Pc+oF7KkfgQdHJsmoQeT1Oz2bFgjDXWGslaMQtlGkrX0G7tCtik5h5DTwF8StBJY
 kGCTWJr1gusnzbR2wsSKaHXCWvdW3IcRF9zGvCSKJHIyDsEITjSlJpcxY8eAzoYL
 SjZskYUz2Bk7MgNxEOi0syOc/YNAPKc761V+nb2DUaU7D+S67k6h+QnObLSMJP+5
 uy85ng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgw2u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:33:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91c70349f65so24088866d6.3
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198022; x=1793802822; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JrpxIoMHu80juwCYv64Cdd+JGCNn6vrwIlylVgcVrqU=;
 b=iQg7X39eX54SYosvk89NWCvqoiAFQp1L7JqDHVkYmm+/xkvF8nlhgyhvNIZmaY/Oo6
 0ypMFeTv0pfKMYotBR5U7PUJZbBX//eWXE/ot79Mo2XVd/3KHpuiGwkC7pwxJfIOfbE1
 8lHRDvTXzWU6f1QlqeZUG1R219TNz6iYlGpUv+uLGlbbYYgYVpIrdAIIEn/NdGoRvcb2
 Xc4rZOAYEt0DI8tqQ0HXMAolMjAKZkNyIc4ulqw4J4ls/FQ3IIpSgZC8aRW7L0+UDl69
 HwtHJvhmp3EGoftNFYyZBhoxToKcR/0PPR9JIdVq4ui70jNfHMHuartMW3LkUj8sRIsP
 0tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198022; x=1793802822;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JrpxIoMHu80juwCYv64Cdd+JGCNn6vrwIlylVgcVrqU=;
 b=QMn7X+/A8wo7LS6cyTGoVhcSYxZLyCL0r6dPvvddF0J4vwYNlJ0f8xmEan1lrDHUN/
 +ov3G3EAxIMtU8peod8qL4Pr2cUcnzhB/j8QnBhB8CwnQ5KEgZwxeVac8KVRobAMLzML
 uKNxcAZNHRTCO9mQ8d6Ljf5TQitrjyBD27ZUoy/m8EETWW3kaXCHuRhUWy3DrBMIrG5P
 Nd7W8e7nSGGlJOOwd8k7035uVgBTIjUhcLvFlUy+A66A2uvVI4CpFTdIDmNRIuYjxXHO
 5a0eueWq5RRdS+QogFc0OwY0LSdefUxU+xTfI5B20d2WCO4ijZqg/v2oXnW1EwI/5rMr
 96hg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdS3bFHRyg3MdDBk7yzNqyaxByZyxqZ8IA2kQ3ohhyusQ5fw+JRRw0DLQyDgzFUKUy4+KzVtcAaQ==@nongnu.org
X-Gm-Message-State: AFq9FYLGY6eP8xEdqYOWrl2QEn880pDLg0QOnw8ZyQqolRwVu2r8husI
 1pvzSMtdTrdo3mmQsxTPC8PnPSiLjGfdSGEcu5iRC1r3hIMM1kvUgU19BP5AnatCqREyV2rJYcZ
 cPzDUwlJcqjHmfWY7DCWjFIqI08aFNJIaKA31Npus7TiYf8nquouWayY=
X-Gm-Gg: AYBFou2BRpPJ76ugZUVimvVVucyzVkxGdJ8yrXEcFJ5vSLmochPVujYIBOvNRr0Z7oj
 zBATeBD1QMxiGVM6qoJB7CxFUmQVYcvkNiaZ+85JOJh5RibhoytM5oRlsjwDSOv+qYwE9kkRtLO
 23nws1ayPPDT+ZePTJaDdNEEAqSAVOLskbqrkbQ86ksObDirmFAUNFV83eFEhaE2DQ9YJIXjlbQ
 yyJb4NHw6IYSS6Ms3mc5NDAKg5S27z3heAHxfK2e77PJWxv8+PEd6xAHDDYigp6HOiBnARvFb8h
 6d+oP4m8WzBBz0VB7VUdZYrRmb6QcydC1d/j4eX4SQ8x3YJtdQGEG7NnGhirTBr5spFDzlaTyuR
 J6qCS/0Lk8J64i9oHUhqYXH+GcyiEcSM2PHfWHQTQEt7DcbnITSH634ek3UkCOJSgWDoO7TGWcb
 jL35x3wRLGvKvT4RPRAA5XRuOJ7NC+WQ==
X-Received: by 2002:a05:620a:2806:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-94408c9a598mr346101785a.37.1793198021775; 
 Wed, 28 Oct 2026 07:33:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-94408c9a598mr346094385a.37.1793198021066; 
 Wed, 28 Oct 2026 07:33:41 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece13aasm26814438f8f.58.2026.10.28.07.33.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:33:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 1/6] tcg/riscv64: Factor encode_vi_raw() out of encode_vi()
Date: Wed, 28 Oct 2026 15:33:25 +0100
Message-ID: <20261028143330.6518-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028143330.6518-1-philmd@oss.qualcomm.com>
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX2ksTmIgZdU6R
 /rkQQ7cnV6PjQeJ7E3DArAoev/TJq0GhGFuOVm29PqDjXmFVhMOFUX4c/jG0LbnHGkWwY40FHT8
 +p+mAeGv+Scw44AiGyjiw3zWAZkNVBhBlAn/C7JAoOrPKuQ32l6LtmPxwmD6yyQQy36qdi8prwi
 ktfkxeK8EbWp4rveGlkTwVLDcIYJYhPW+HrMXiagkKILo4IY8HKdNKsS/4DqSyZ4hJvtvRZIkkj
 7bTP/o8yvd5NJHlOChEd3VHNMKvJ6Vb2T0QBbCgXwJSHSFOORoRVhpiysM+RYqeVOfq56bXGESn
 eosGcMRJ46LS7uRR39WT175FKua/8OjCF8TyJ3nzUSBE3KKIaPIKmsB+ArUAkQCXwYxdg/nn1Pp
 s9nTKIYxdp3gBeau50Yd0vGcrv0LwcSVtFJtyO7mMIR9aZ7um7vbWzO4sCseJ6XUqtrg5JevuKd
 TqgGGemZTyXSHh1996Q==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae207c6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Cvy6jmBRAY_LntWzTOEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: AxdjbFZsNbtG8OEgB00etMxPmq6PCx8U
X-Proofpoint-GUID: AxdjbFZsNbtG8OEgB00etMxPmq6PCx8U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX3fBE39lGo1J8
 eWPanaaic30HelCW9R5QCWuIIjrtoWnySF8bpts9lL5pzSLf9MvSN5LjWTA+N4xeczi4zFxyD49
 5kNAgZzIpfQ5SS5i62GwvCjxXkSYGbY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the OPIVI field layout into encode_vi_raw(), keeping the
simm5 check in encode_vi(). The next commit adds a uimm5 variant
for the vector shift instructions. No functional change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tcg/riscv64/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 03f32c5819f3..712170c1203e 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -534,12 +534,18 @@ static tcg_insn_unit encode_j(RISCVInsn opc, TCGReg rd, tcg_target_long imm)
 
 /* Type-OPIVI */
 
+static tcg_insn_unit encode_vi_raw(RISCVInsn opc, TCGReg rd, unsigned imm5,
+                                   TCGReg vs2, bool vm)
+{
+    return opc | (rd & 0x1f) << 7 | (imm5 & 0x1f) << 15 |
+           (vs2 & 0x1f) << 20 | (vm << 25);
+}
+
 static tcg_insn_unit encode_vi(RISCVInsn opc, TCGReg rd, tcg_target_long imm,
                                TCGReg vs2, bool vm)
 {
     tcg_debug_assert(imm == sextract32(imm, 0, 5));
-    return opc | (rd & 0x1f) << 7 | (imm & 0x1f) << 15 |
-           (vs2 & 0x1f) << 20 | (vm << 25);
+    return encode_vi_raw(opc, rd, imm, vs2, vm);
 }
 
 /* Type-OPIVV/OPMVV/OPIVX/OPMVX, Vector load and store */
-- 
2.55.0


