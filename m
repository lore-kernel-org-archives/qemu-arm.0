Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050CC606A31E
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwJHTU3N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX61B/QM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM4kL-0005fB-SK; Wed, 28 Oct 2026 10:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4jT-00056U-7O
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:34:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4jP-0004VT-5O
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:34:25 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBdsaF1011769
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zhC+Jx/YxRJ4Lk5CZNFoY3zP4i6JAcJ+EHizvnB7o4Q=; b=pwJHTU3NcOzTkshT
 iuEhIGVQQYSCPWrIvlZg+WEqCP2p4LjAWl7NQ1DRfR7Ic7BLUrAKNSR1WoTd+RzF
 /u0Ti1xZcj8YSeeUJMOQ9iJwNhzVq/aq9cVMkIL4MF/LmJ1qPhG+BfI2xqFOk7iM
 YBCJEhIb8Slnh7LYrqgiRGqrVkqA9UrahZSNuQ5FLvb/Kw6+46K2j5bBwJiScfr+
 4l/90HIxet1r+wNlSh+T+0X3BZxaUhDXxvo3NKba65/N6EI8txt7zQt88I9jKeG5
 XWnPp/kzBXbcVK0kdSbiaAKRsdoEkvGlKgPZRUeyDeCdSj/E9A5a1fVnCPQL6kQI
 qUDMbQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgw60-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:34:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5eac74b0596so925939e0c.3
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198051; x=1793802851; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zhC+Jx/YxRJ4Lk5CZNFoY3zP4i6JAcJ+EHizvnB7o4Q=;
 b=PX61B/QMnrHDlmGcuj/yB8UJwoXxuq6iv96Ey5yAraVW4HZYdypiBOSFFfR5Tu+tjm
 /JsTj7BRlw24dND8RFe49QgMveI6iNRDsC73MdYhfxTmnhiI4F++pcZnUIZiUbfWnNr9
 SroXL5eBXwmeGMSn88w4HNjQClqIVNmKAVHpgQ2+xBWVPMC6NcS0b4wmVsiCppNYwPiT
 p5SKejxc05o0V9/CJ5go2rKRN07hB/E8La+51OJY48Hb1UNwEWp4ugH0Mpp3+OvcCWVT
 pKf1rAe0LZo/MzUB7bHNgF1/frGX1jS6ljbVga8MtfHld0kTteYLugsUAGqTkyON2zFd
 VEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198051; x=1793802851;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zhC+Jx/YxRJ4Lk5CZNFoY3zP4i6JAcJ+EHizvnB7o4Q=;
 b=zRiU3H95wna6UH/vGSqIjf3WVcZHSjL8zudWZSXdMSxdrrK6b4Yr8YoZAKz9RNwG2h
 dPCu2xb08G3FtGk3HixQ2I5iQXqyq8R+5JT41ZNE1evK1lQ3gl9riwfEX2w2FOOwGgcK
 90Szx0QJFtZgdMlgjiy3d7chAqnCqlVG1sOWryap7nK12Baa2MLjxnIvmZAEdCZW7Sad
 kHbFgTA4S9M5fzzecafS9KsEDBe4CLoLGWsYhTpeE4pBWTdQkvW5O8ya5exNexi8sqdN
 IeW5X+PhIjHP921XccX+sDJQWVgHffzcBCOeVm8OkBwz1UtWejwzYAOT+/LB5IdL98rF
 4eEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwUT8nvNcmJdSHb/WVWj3AYCZFA0NF6UYwlE/vpITT8q3sme4CDnnSIc4Zgefzk4a9eg4IHRDBiIA==@nongnu.org
X-Gm-Message-State: AFq9FYIR0YbtZJd/3xD8Bj8Pm7f8xaD7F4TWejSylxqsk1Si5uYpmlvC
 CdO6Az4zF841kBUhHqd53XAmnZzKlqkK9Dm0YuaShdp7xhi8dMnzqMVwMTQb6eCRPAL+DDv/ZYr
 CX3cMG9v0P2+atI72eCdsgrCHxnxXpXfpJgAPTUcQGIbyTKkrUMu4PeU=
X-Gm-Gg: AYBFou3Sv+EXfF5/frRXC32my0LrcGI3ah3Qb+ZD8Mgu85QY1Ve01cKH6KKHXGgo95E
 ErVVLtoCy4r3Lr0ElRXkB0VUenughSFgAjjzYqeJJDZ8GYOpAOSBauyGn7jd/tmyz6JI3jx9qNM
 3+D+3YfmthJ3e5RP6igp+DNoDXcU0wOjlvbiHerVAI1lRSH4JFVr7XAJupE5lW2FvcPtUqtBBrd
 UOSjatsjszkd7GdPuTyJmmQ+XcBejndtVjApSYwCRuMoCq3mkjSg6KZ4n/1G4WHnFoEpx8GXEeT
 CaE75Tj8Br97QpfHnBQSIQU8aKnZWprOpmo9GFqnaDOpIXh34sPBUrG1GuEQ8toJThp6eL+wwjS
 izYM9w4hcIEd0vpOm/uroISkuG/WQoOV6suoXXDBfSrmbxZ3q4Dz/52hviCD25iq3BvTpmJjER5
 cmtfnJ51nT2ePL0WThnIV8fgb61LlK6w==
X-Received: by 2002:a05:6122:d17:b0:5de:ee96:75b with SMTP id
 71dfb90a1353d-5ec4cbe93b1mr1226039e0c.12.1793198051237; 
 Wed, 28 Oct 2026 07:34:11 -0700 (PDT)
X-Received: by 2002:a05:6122:d17:b0:5de:ee96:75b with SMTP id
 71dfb90a1353d-5ec4cbe93b1mr1226010e0c.12.1793198050764; 
 Wed, 28 Oct 2026 07:34:10 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd3705sm34363745f8f.45.2026.10.28.07.34.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:34:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-stable@nongnu.org
Subject: [PATCH v3 5/6] tcg/riscv64: Fix logical vector immediate matching and
 emission
Date: Wed, 28 Oct 2026 15:33:29 +0100
Message-ID: <20261028143330.6518-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028143330.6518-1-philmd@oss.qualcomm.com>
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXy6pZfFwHZNyh
 xp8mDQTktJSwtFC3BJCON6VLhnmggau8RL5tmQ4NV6UdD5mmEOj5+K8iFtNvY+V/hBMkcZ8poyz
 0gJ66w/1rUKBiD1v0N+yxEXBPbJzhbAwzgF+4VV6o9JphinNxlNn0Ma4SEnMttmJSmEtMHQXU15
 pLnnFOFXCmJktbLPsNW9z6xJMFepG7JXJbPNK17f71XvuY7p6meUK9wLzluH31b0ww9CvBj09fQ
 gEhBQkG64aNKimYhVvX3yn/VnPBRR/eEK5zi5/vlhezck6IDpPuhZlyjAi18o24Edc7qhVp0YUV
 GvlgeKeNVXzDoacfeWHPAg+f8I6DOxopRwFEk6niRoJP8k/oiPT7QWrcXqCVOcAYhME+okqYOWf
 XLseokc98l8u8zyPop4fbsyXODnBfGgg/8Lzz37pK4BKkujMWy2ASvjgmmCev5zD8cXx88VmL7N
 fyj+tcm+cALKvCjEcJQ==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae207e3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=69wJf7TsAAAA:8 a=hXZgYZo4AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=DVuiCnNqCGsytsSSeGkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=Fg1AiH1G6rFz08G2ETeA:22 a=37BJPeUnzxYkbV1yBC-1:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5EM4B2e67yLGocbg3QHxHk0RkR6QslRC
X-Proofpoint-GUID: 5EM4B2e67yLGocbg3QHxHk0RkR6QslRC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX+o/KS1I9Gzfn
 OjnUl1VuA1v2sWjTztdjzxytgT5Y/vuyHLB53zJD51/qI7PGwvgU29LabM8az9eXCrSQq/M9Ua7
 /AUfEOCPq8wGfnPbqai+yygU3UH6P3U=
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

and/or/xor_vec always have VECE 0, yet their constant was matched
as a byte element and applied at the stale SEW of the previous op:
"bic v4.8h, #0xf0" became "vand.vi ..., 15".

Add the 'N' constraint: use the smallest element size at which the
constant replicates, if that element fits simm5, and switch SEW to
it. A wider element can't fit when the smallest doesn't: its upper
half repeats the smaller element, which would then be 0 or -1.

Cc: qemu-stable@nongnu.org
Fixes: 5a63f5998791 ("tcg/riscv: Add support for basic vector opcodes")
Reported-by: Aurelien Jarno <aurelien@aurel32.net>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tcg/riscv64/tcg-target-con-set.h |  1 +
 tcg/riscv64/tcg-target-con-str.h |  1 +
 tcg/riscv64/tcg-target.c.inc     | 53 +++++++++++++++++++++++++++-----
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/tcg/riscv64/tcg-target-con-set.h b/tcg/riscv64/tcg-target-con-set.h
index 0fc26d3f98b4..9b4e219fac16 100644
--- a/tcg/riscv64/tcg-target-con-set.h
+++ b/tcg/riscv64/tcg-target-con-set.h
@@ -26,4 +26,5 @@ C_O1_I2(v, v, v)
 C_O1_I2(v, vK, v)
 C_O1_I2(v, v, vK)
 C_O1_I2(v, v, vL)
+C_O1_I2(v, v, vN)
 C_O1_I4(v, v, vL, vK, vK)
diff --git a/tcg/riscv64/tcg-target-con-str.h b/tcg/riscv64/tcg-target-con-str.h
index c04e15ddfa3c..d7e8b2ce4f2f 100644
--- a/tcg/riscv64/tcg-target-con-str.h
+++ b/tcg/riscv64/tcg-target-con-str.h
@@ -19,3 +19,4 @@ CONST('I', TCG_CT_CONST_S12)
 CONST('K', TCG_CT_CONST_S5)
 CONST('L', TCG_CT_CONST_CMP_VI)
 CONST('M', TCG_CT_CONST_M12)
+CONST('N', TCG_CT_CONST_LOGICAL_VI)
diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 168932711796..4faf7ff36e07 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -116,6 +116,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_M12     0x200
 #define TCG_CT_CONST_S5      0x400
 #define TCG_CT_CONST_CMP_VI  0x800
+#define TCG_CT_CONST_LOGICAL_VI 0x1000
 
 #define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 #define ALL_VECTOR_REGS    MAKE_64BIT_MASK(32, 32)
@@ -384,6 +385,22 @@ static const struct {
     [TCG_COND_GEU] = { OPC_VMSGTU_VI,   1, 16, true  },
 };
 
+/*
+ * Return the element size at which VAL is a replicated simm5,
+ * or -1 if there is none.  Used for vector logical ops, whose
+ * VECE is not meaningful.
+ */
+static int vec_logical_immediate_vece(int64_t val)
+{
+    for (int e = MO_8; e <= MO_64; e++) {
+        if (val == dup_const(e, val)) {
+            int64_t x = sextract64(val, 0, 8 << e);
+            return x >= -0x10 && x <= 0x0f ? e : -1;
+        }
+    }
+    g_assert_not_reached();
+}
+
 /* test if a constant matches the constraint */
 static bool tcg_target_const_match(int64_t val, int ct,
                                    TCGType type, TCGCond cond, int vece)
@@ -391,6 +408,10 @@ static bool tcg_target_const_match(int64_t val, int ct,
     if (ct & TCG_CT_CONST) {
         return 1;
     }
+    if ((ct & TCG_CT_CONST_LOGICAL_VI) &&
+        vec_logical_immediate_vece(val) >= 0) {
+        return true;
+    }
     if (type >= TCG_TYPE_V64) {
         /* Val is replicated by VECE; extract the highest element. */
         val >>= (-8 << vece) & 63;
@@ -2769,6 +2790,23 @@ static const TCGOutOpStore outop_st = {
 };
 
 
+static void tcg_out_opc_vv_vi_logical(TCGContext *s, TCGType type,
+                                      RISCVInsn o_vv, RISCVInsn o_vi,
+                                      TCGReg vd, TCGReg vs2,
+                                      TCGArg vi1, int c_vi1)
+{
+    if (c_vi1) {
+        int vece = vec_logical_immediate_vece(vi1);
+
+        tcg_debug_assert(vece >= 0);
+        set_vtype_len_sew(s, type, vece);
+        tcg_out_opc_vi(s, o_vi, vd, vs2, vec_imm(vi1, vece));
+    } else {
+        set_vtype_len(s, type);
+        tcg_out_opc_vv(s, o_vv, vd, vs2, vi1);
+    }
+}
+
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
                            const TCGArg args[TCG_MAX_OP_ARGS],
@@ -2807,16 +2845,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_and_vec:
-        set_vtype_len(s, type);
-        tcg_out_opc_vv_vi(s, OPC_VAND_VV, OPC_VAND_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi_logical(s, type, OPC_VAND_VV, OPC_VAND_VI,
+                                  a0, a1, a2, c2);
         break;
     case INDEX_op_or_vec:
-        set_vtype_len(s, type);
-        tcg_out_opc_vv_vi(s, OPC_VOR_VV, OPC_VOR_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi_logical(s, type, OPC_VOR_VV, OPC_VOR_VI,
+                                  a0, a1, a2, c2);
         break;
     case INDEX_op_xor_vec:
-        set_vtype_len(s, type);
-        tcg_out_opc_vv_vi(s, OPC_VXOR_VV, OPC_VXOR_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi_logical(s, type, OPC_VXOR_VV, OPC_VXOR_VI,
+                                  a0, a1, a2, c2);
         break;
     case INDEX_op_not_vec:
         set_vtype_len(s, type);
@@ -3008,10 +3046,11 @@ tcg_target_op_def(TCGOpcode op, TCGType type, unsigned flags)
     case INDEX_op_sari_vec:
     case INDEX_op_rotli_vec:
         return C_O1_I1(v, v);
-    case INDEX_op_add_vec:
     case INDEX_op_and_vec:
     case INDEX_op_or_vec:
     case INDEX_op_xor_vec:
+        return C_O1_I2(v, v, vN);
+    case INDEX_op_add_vec:
     case INDEX_op_ssadd_vec:
     case INDEX_op_sssub_vec:
     case INDEX_op_usadd_vec:
-- 
2.55.0


