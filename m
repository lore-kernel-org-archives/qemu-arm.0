Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D38E606A32A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vx4dg4Ef;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLfjWCAO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM4kH-0005S5-6B; Wed, 28 Oct 2026 10:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4j5-00051z-VL
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:34:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4j2-0004TJ-K2
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:34:03 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBdxEo4154582
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pu830gYy8Ds+PNBWkxWcCVyGsAlz+zZD8vp+WSahDtY=; b=Vx4dg4EfQSfXXq0g
 /HxCv2An9cY1cGFFKCWf6rF5pDeau5H+feJtWbQ9YL5raTfCSYuZk29SUJiqIocK
 T7rdfcKe0J+3DXjsWDquTin4Uz5JGe0m6tzJ3btfb5/POkWVpl4zTvGTzQy+nAC4
 E64B4jszqdWLfSomrqhE1ZxkydghPpfL4MohLvVmmX3wi2DTkfRKCe9sRlZ+KOXC
 BLuuryc4wix4zjepDPcSiHXos5hEmdlNj8yf7yVQxGOorvGbBONCqeF3XdBNA5Kv
 s2+ncgcq2uuvV4KNGA7hXx/tm6Q+MGL3LwpDf1oQrG8sTFnaYZ6Nliv474GOlL8I
 8Hvp2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp19us-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:33:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93ecdc701a2so120734285a.3
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198037; x=1793802837; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Pu830gYy8Ds+PNBWkxWcCVyGsAlz+zZD8vp+WSahDtY=;
 b=OLfjWCAOclBYRuHQM7Sccr+fGiTDihkCIjYL0g7JbsXg8lIyJ0qKV4mMgCTFhn+r+c
 hzHUTo+axJqByv4RnfSqYFHZY1hq4Rh89/BgaoNpNUceBZ1XeJmSOt91pb9FhvSAc2WV
 kTRB6zHcXNvpLBgcmzzsfWtFibyxqiHYteHJX0v9fFZx7P4sVil0T91nzsIykrEzyMXi
 kQ+iCw8MqL5cnlOEVZNV2y9psAh5jZ/skVA4Aa7sE7r8I2joJ/8W0uErnAbPCQBAy8ql
 JxTRhbO9f9rduliZWHRfrDSQPTdDq+Qh8h02EdT6eT3IDeO14fbTqCK6z/Xl7yZB948O
 v5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198037; x=1793802837;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Pu830gYy8Ds+PNBWkxWcCVyGsAlz+zZD8vp+WSahDtY=;
 b=zdg9jUe62CnxTKeYZHJcyEbUuyf5tIQJHHNOjrVebTEuTs+opdjV268xWsEZGO42Sz
 +/XCreZ6ILbfwVtPiBWILIEBy5+R1yZgkhZhPzu/ld1FVXKSrvGhUmnTYbN1EndOoE4I
 cOSFL+7nnud+WOzCBEw1uB6iwG5Ido7OWHskcPP8bZ6zeKmwsc9l0S/oBP8azi8LQgKz
 WfLn9tBPsvg1eoAA2x3j2pOQrhKRSxfQbX+7yUBVkIDzp/yGflPOYNmzdamwkfQHVW0z
 oJVulG22beaSB95t0uzMC/0wpER0q5XhHYGeCtVqpPKEvAxVyf/ExtZcSw0+x2O9lkya
 lOmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwSDqkB1Yd/+UNGYNHhvMDUC32y08pw6kH/L8J+h6FZCBgpbRjmCsAYCbvOahfqjXARuS2CZN7usA==@nongnu.org
X-Gm-Message-State: AFq9FYJXOQ67EOLJsQX10wInVA0s4g0K0R5G7O+PFdSJXMmdKDZlQk2E
 fdXM3aw6eHLUkgGqS9lvw2XJSLm804Px8Lwa9c1l8GerxE/E/Tu6Khtf1O43Fz9MlgZlt2aCmcs
 1kfuq01Fvbv/lz2j8OOVzLoQRLjQnmD/1AaXvlgBaxVcc1eQfsuw9K0A=
X-Gm-Gg: AYBFou3oPftYRDlqek719yrR6rqoRWx2MjZgX45kDD81dC3H70cM1su8n1naX35s/Mp
 C6cmh/0jycgkb6M2O4zl+op24ERn80+dHREemWbJzByIotO1YJ4J9OzAh1rdueLbllRWqnUpwIF
 NwjiRz8DmdL6WI7vbu6bJ0T69boB+pvIoieSU2H/KJwVCfFXMgWeF+FwvvV+3YUsYhTNfSRZxoc
 G6DYs/4aK5a2k6m3SIJgJsES6j4xzoiExRoJ/8pvAVBnuUBMTw5vkG7+zRrErgRBStdy1M61CZ3
 GMuOQ/p7cdomnLJtf97L9Rq+LETSMqEcemvOq45GglbYO4F4aObUPrZOfVw2lXA3ga7DWTItg5s
 q1gPTQl6MYzXehDTmHE8GuLJYp5m7wUnKU2zJ9SguFFlsKBh4IfTpvEeXIv6+siiF37LKSL3peI
 Wjf+SPOQeiutAu04tTQihH3gcp1jZCJA==
X-Received: by 2002:a05:620a:458a:b0:93b:bce3:5499 with SMTP id
 af79cd13be357-944089393e4mr364659585a.6.1793198036492; 
 Wed, 28 Oct 2026 07:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:93b:bce3:5499 with SMTP id
 af79cd13be357-944089393e4mr364654285a.6.1793198035981; 
 Wed, 28 Oct 2026 07:33:55 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97c9f1403sm54169865e9.9.2026.10.28.07.33.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:33:55 -0700 (PDT)
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
Subject: [PATCH v3 3/6] tcg/riscv64: Extract elements for vector arithmetic
 immediates
Date: Wed, 28 Oct 2026 15:33:27 +0100
Message-ID: <20261028143330.6518-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028143330.6518-1-philmd@oss.qualcomm.com>
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k42RqtTNer5_zQC7l4HIH3fjJkJ8zzpW
X-Proofpoint-ORIG-GUID: k42RqtTNer5_zQC7l4HIH3fjJkJ8zzpW
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae207d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=njo3DiN-QtZAaPIEphkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX0N+GxCxWbsTT
 q58Fu99gL1BrX4B0UX4q4eA7ZOF9CnjaTbEDtDshuGj01wJIrYPBGqUx4BdgYvO3FW4s3fG7OQ5
 cCobTD5LI0S4H5DfjncOgnIcpzsFk+SOMdsdHYjH5eBqljks44+HXyGYYbxHAUR0JbVTDlOOOaP
 KSd9YeJKFScP2/CFP/76+bxOlmBFoazE7XbYv+b7y/lt4mkvV1O/QmLKyiWIhFhGWp5DDPedIEe
 Ocv6NoaUi1dPtPQfAtT6wqboUlmyA6j6xDRXcj6ifXkbNuP71SeZa9UFbeqYMhOvq2OUiL0w/2b
 gywiP+MYc9huRKM4DzTTrbDaQFSjkAWpb8+dD0BNoPi1uS6Rb/FRMTK9CfEdMc8CruuSOjK9nP5
 7mCZRWGMAVL0uOjss4uqyMfDyb4OrXYR+BjzD+vtySA0xJep7EZci+0mwWE6ltA5r7GcyvkkjML
 HMs+nU1ccac8NzEhJ7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX+rb4Iv0ZDf+u
 EQPnsQn9wmPZ2FqzeYeOTptodXPiOgvsaXTdTRXSAz12/5Z2RO9BdwKdLfBr6dhjG8fNM+6p3hs
 hGRwiJyAiSlVP1GuPAD0k6Lc6MVTVcA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280057
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The .vi emitters for add, reverse sub and saturating ops pass the
whole replicated constant (e.g. 0x0505050505050505) to encode_vi()
instead of a single element. This aborts debug builds on common
vectorized guest code and is undefined behaviour in release builds.

Add vec_imm() to extract the VECE element, and use it.

Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tcg/riscv64/tcg-target.c.inc | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 0e749ae296b8..a3d995e290b7 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -735,6 +735,12 @@ static void tcg_out_opc_vi_u(TCGContext *s, RISCVInsn opc,
     tcg_out32(s, encode_vi_u(opc, vd, imm, vs2, true));
 }
 
+/* Constants are replicated by VECE; extract one element for .vi forms. */
+static int64_t vec_imm(TCGArg arg, unsigned vece)
+{
+    return sextract64(arg, 0, 8 << vece);
+}
+
 static void tcg_out_opc_vv_vi(TCGContext *s, RISCVInsn o_vv, RISCVInsn o_vi,
                               TCGReg vd, TCGReg vs2, TCGArg vi1, int c_vi1)
 {
@@ -2788,12 +2794,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_add_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VADD_VV, OPC_VADD_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VADD_VV, OPC_VADD_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_sub_vec:
         set_vtype_len_sew(s, type, vece);
         if (const_args[1]) {
-            tcg_out_opc_vi(s, OPC_VRSUB_VI, a0, a2, a1);
+            tcg_out_opc_vi(s, OPC_VRSUB_VI, a0, a2, vec_imm(a1, vece));
         } else {
             tcg_out_opc_vv(s, OPC_VSUB_VV, a0, a1, a2);
         }
@@ -2824,19 +2831,23 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_ssadd_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VSADD_VV, OPC_VSADD_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VSADD_VV, OPC_VSADD_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_sssub_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VSSUB_VV, OPC_VSSUB_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VSSUB_VV, OPC_VSSUB_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_usadd_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VSADDU_VV, OPC_VSADDU_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VSADDU_VV, OPC_VSADDU_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_ussub_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VSSUBU_VV, OPC_VSSUBU_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VSSUBU_VV, OPC_VSSUBU_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_smax_vec:
         set_vtype_len_sew(s, type, vece);
-- 
2.55.0


