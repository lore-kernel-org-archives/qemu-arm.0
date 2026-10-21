Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C4B606A918
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b5DoMiOD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Li+4PJul
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMqR-00081H-I9; Tue, 20 Oct 2026 23:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpR-00055n-IE
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:17:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpO-00031K-8L
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:17:25 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FUNf1957045
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WS9GBvpAE5aOkQ0P64201/OvgyT38KpzzMk50TKNYI0=; b=b5DoMiODxmxm9uQe
 ONadLcqD1GmpbDrhyq3hbgc+ctanKgmoyhNMnZ0TXmJr/thVGdOhJNnq9MwqT5gJ
 gJYR5CUlgqKvEU0tnMBxR2cRgc1H9fCUZyjrLVgy1AfVaE/JSNXxkQekENrqFvFE
 YYbvSMkFqz7xLYPwPJJVME6hscX7iHrio7JFM3nF7EYpY8Te++L44pFop033F/MT
 hBetCBROvBHxNLV9aeZz6xt2PSHnHRkrKpXRUl+9OKz+XKck8kUwk1f42jS9/SI8
 pnZhO4MKdRdl2x+Mng6C+iovverqwftZbzPWdMBGSfTJ1+rrKQc9IeAYuP417KIX
 7FOqWg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvb6td-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:17:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-917b7dd3f1dso6659596d6.3
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552630; x=1793157430; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WS9GBvpAE5aOkQ0P64201/OvgyT38KpzzMk50TKNYI0=;
 b=Li+4PJulEQLRt9NdDOqqSn6q5nlBnoq6n+NORSsdGp9xGjIQdJv8zbOyDYpqL3DVGv
 eaVZu/EhDudzGj3Kbbe8EQqicj8nOoIJsb2rvHK527SXW0LEgRcBs05Bf3z4CdwyHK48
 5eauObFdcgtANGO1RaxbH/iZ9xNrSoY2+WKIBiv3CdzRI27pQabrdpKTuIUO+EEV3+6a
 kn2rtTi7AzR4d3D34qZ3Ni0lcajJ2H7dZyApIg0achjd7btSUAw2O2llxST9oyLK46Xw
 H7csQxGHobw6tjj9GJbx3Hx8SSR+GAg8zoRbMJ571iBrvecrN63Krnvu0Yunq8UymgHt
 alsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552630; x=1793157430;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WS9GBvpAE5aOkQ0P64201/OvgyT38KpzzMk50TKNYI0=;
 b=nV4UPBMdj7X072undDgRXqtaeSi/IY5m+Eb+CtnkileS10H6F6oWTOMSUg1hSfYrGy
 yP0OTEzRkeiNceZZl3Q/SGx8/XK+WXLK0edracn9Ng0KeQSpGJQSF6s/EOvbvgqwIk87
 xFwcIcv0h2mZnSzxMpER9tnnqLDJ+M45KMmjjjxuv7ypqyMOq3KMK7sOpFtSxo0AaQ2E
 r0it1VZFr5JTjKB5XERUozdieKxfGIvXRBPtrWWEvDLtZg078OMSbiPwifxp/H0EZLXv
 TuyC7YKYozMSwu0M9XhjgFuZo/0MgszowdihsN1Hw05RSmyc7VvMcyQ3EHxEbRox1/yT
 egHg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtLiopIQ1EuFJupMRbLDwjw16/c9LvzvpRtraqfrwmiyYP9r2H4DFOy9Rp0ZUH+608KyDoLHn8rw==@nongnu.org
X-Gm-Message-State: AFq9FYLk1muJncyPtoHm68eUDzciIb6AKG/ejRM3WsXXCpk7YWTwk93L
 eoXJp43i8BPMgKc+7LJ1R2KO/6mNt4kptH9JD3OGhmsL2OGgrM0TNgwCDkbZ7OgwAm9YiYRQWI0
 R8nQ5mYr0sqy0CYBuTBRpWXRHBgqWwsXMn0zpOp99Sj4Hw9qqCqGROpI=
X-Gm-Gg: AYBFou2X/p7C6gH7WlLIJoqyjruEg19FS5xtmeyJmArAnjG8gsUimG5wMiNLfseiB3J
 RDme9r1sOyWt2/Oi1dCVVtP4T3ht28Na/+j8kR0zF5gPH59d2GARL9arCBmtfnoAWfyJskNtMlv
 GLbrUH7Z9sooBRfFrl/TCfs6O9m7q53MDdZnS1HFKAmFp0yMv4At8chigv6i9k/4D64SUnRu4/R
 cf3uNRqmurxBCGyntO/UordyLyqBtsotc73Tv4BGx1nnJc2rYFQKexLycLE8itYbMG70tIw6H5H
 PKHnW+7cnbqaOx3u2EUhZxzqb03k1OLeoz/EUMWqcuxRzVCTa2qcPXRZsg1/fX3g2StmDjHikZv
 z+yKN9qO35gFgmnncujuQUxhRD+gK8mzRZ5CU9wQ7
X-Received: by 2002:a05:620a:370d:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93f57f7ce26mr230156885a.37.1792552629754; 
 Tue, 20 Oct 2026 20:17:09 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93f57f7ce26mr230154685a.37.1792552629250; 
 Tue, 20 Oct 2026 20:17:09 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254ef1casm1941038f8f.7.2026.10.20.20.17.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:17:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 23/33] target/rx: Unify BRK and INT trap handling
Date: Wed, 21 Oct 2026 05:13:56 +0200
Message-ID: <20261021031407.24862-24-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX/T8QHPIOafsB
 xgbZeo0Y8KmTQm4YUunI5cEvRkQYR/Thp9R8urZuI3URJYYe1WBmZi0D3ARiv3Pyony4+pvLt+N
 wW3efLcNJcgn0HR+CxK/mXDc4qoOyPgOc+kZs+v5E6lcXQWCrklywGxACYJO7awEO9W+ZkCFgmU
 FHoaa4u9RcEqWyt2xMfNN3vuXorgtepmJfXmrA2NQVh2RgdMAakK8+pxA9TbvZRnm2IzhO9Cz3H
 TN5AbXC8YVDPI/quLlopT58dXeMFm7RqPiw70bYDahqBzpyR15dsiIUUcCf1WV2R1Sfv9frsZf+
 9c9QOeaLGeYZVdLPXuFQ9gF5kd7Ew9QMULgzK/9FXx7AwAH50wQ4AEN7sNJNfC2tVgQXFA90ele
 u7MSJe8uBtXlbgS+1k4hnDSyYQQYiHfi+VMXOApF7vsuVwI7sI2id42DrUt15kwiB74kKLt0H1t
 0mCLlNibDpNMTd7BNrQ==
X-Proofpoint-ORIG-GUID: 9dxGRMLV132SKdqtgdZWu58-ABxRmsK7
X-Proofpoint-GUID: 9dxGRMLV132SKdqtgdZWu58-ABxRmsK7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX8VV+VU4CZJym
 yb3biy6BOnALKkLNnhDccP6QDclD8fKhj8ABnQ6LpNJYywPuWLub2DlReQz6H/c0gOw65OHc6gO
 +NQU7hs9arwDypuT6xbjWQgSBDwgpSc=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad82eb6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=YEB5RgzmAAAA:8 a=jDMzgGwzCE0q-kHIl9cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
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

BRK is equivalent to INT #0, so route both instructions
through the same trap helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Yoshinori Sato <yoshinori.sato@nifty.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/rx/helper.h    |  3 +--
 target/rx/op_helper.c |  7 +------
 target/rx/translate.c | 21 ++++++++++-----------
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/target/rx/helper.h b/target/rx/helper.h
index b1ef843be1e..13f019ff81a 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -2,8 +2,7 @@ DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
 DEF_HELPER_1(raise_access_fault, noreturn, env)
 DEF_HELPER_1(raise_privilege_violation, noreturn, env)
 DEF_HELPER_1(wait, noreturn, env)
-DEF_HELPER_2(rxint, noreturn, env, i32)
-DEF_HELPER_1(rxbrk, noreturn, env)
+DEF_HELPER_2(trap, noreturn, env, i32)
 DEF_HELPER_3(rx_fadd, f32, env, f32, f32)
 DEF_HELPER_3(rx_fsub, f32, env, f32, f32)
 DEF_HELPER_3(rx_fmul, f32, env, f32, f32)
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 5a7a87943fe..fb1fa4ffa69 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -455,12 +455,7 @@ G_NORETURN void helper_wait(CPURXState *env)
     raise_exception(env, EXCP_HLT, 0);
 }
 
-G_NORETURN void helper_rxint(CPURXState *env, uint32_t vec)
+G_NORETURN void helper_trap(CPURXState *env, uint32_t vec)
 {
     raise_exception(env, 0x100 + vec, 0);
 }
-
-G_NORETURN void helper_rxbrk(CPURXState *env)
-{
-    raise_exception(env, 0x100, 0);
-}
diff --git a/target/rx/translate.c b/target/rx/translate.c
index bd445bc0634..0672c5c5653 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2170,26 +2170,25 @@ static bool trans_RTE(DisasContext *ctx, arg_RTE *a)
     return true;
 }
 
+static bool do_trap(DisasContext *ctx, uint8_t vec)
+{
+    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
+    gen_helper_trap(tcg_env, tcg_constant_i32(vec));
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
 /* brk */
 static bool trans_BRK(DisasContext *ctx, arg_BRK *a)
 {
-    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_rxbrk(tcg_env);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    return true;
+    return do_trap(ctx, 0);
 }
 
 /* int #imm */
 static bool trans_INT(DisasContext *ctx, arg_INT *a)
 {
-    TCGv_i32 vec;
-
     tcg_debug_assert(a->imm < 0x100);
-    vec = tcg_constant_i32(a->imm);
-    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_rxint(tcg_env, vec);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    return true;
+    return do_trap(ctx, a->imm);
 }
 
 /* wait */
-- 
2.55.0


