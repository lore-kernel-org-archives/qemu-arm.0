Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5101CDB479
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Jun 2026 11:04:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbyv2-0007Xg-B5; Tue, 23 Jun 2026 07:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbytt-0006i8-OB
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 07:02:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbytn-00068f-5h
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 07:02:39 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NAsFVg2218882
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 11:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +sHlKQTvJbCdqK1s8ESlP25D81ue73E/lJ5TJI/qsm0=; b=aWEwQnR05yEaHUN/
 X6RQ9srj/fl7fSLp0HVIWb3lkMN9tAIpjHFKuO5JnF74jHoQgRKMMFzQBpYCHNse
 /OxiG+qByrtJVVzNGtP+72kBRovVTgxK0V8BxJbcz+eoRJ4HYb4RhJ9oqzneS2sh
 HeMYyFa4xXYgbU8xZfoDh+z+ASbGKcUIUiEvdDKY6dim4If05F2pO3xpwFgueYhY
 htjcVzla+AxgG8Tl1GhdD+oqOkFhsQZ9rpdLGF9pkm5q6CHJJnxFAElESfeedYDg
 rsjPd3FZUvePwzjYi2rACo//jz6gQg75Fu3H9saiOUjNMwPxfwz8c0i+aEdInCVh
 7C35dg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1grt6b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 11:02:33 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7e6eeff3b75so6857428a34.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 04:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782212552; x=1782817352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sHlKQTvJbCdqK1s8ESlP25D81ue73E/lJ5TJI/qsm0=;
 b=Qf1hwfKK/33qxLgVwAufKfBck2abZ9jkV4h6TDlpys2IU3Z5pa0MsSrG0ZzpkrN1A6
 y/IVWj5MKJ9KAA+dg8ptw/bCj7OlGxkE247qH9bR6SxVCKsRjibiApLZOfRB9FVUY1E/
 CgHwBEPz354dVn+/R8kuW1i9xPMkTOCL2Yv7k2F9leuQPCox0EZDfo9kKkd3QihAIhOs
 X1ZVCBf7cJtVVaOKSHqNZUhqrjWHWLDJnKVSkSddzWELUPX13UFNP72/x52BHDMEjGRU
 juXjTDasKdAepu5nRWlRIuOI+gUhUctyjKcEGfG6NACmF7QGQLsjElpnv4hn2UolBXT6
 cfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782212552; x=1782817352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+sHlKQTvJbCdqK1s8ESlP25D81ue73E/lJ5TJI/qsm0=;
 b=Ptba6vhEKOa/wDfLotUOk78D5sGF2/KBwQ7vsRwuGZ8uabWlGY+A0dwjHrxpBI0bIW
 oMylyKpm6hQf9SGqeTylNFVUFRTRuoOXYSByAeh4+ku7Cy/mIgGmXekTpcdvkiqvBCq3
 HPe6OkV17xKSAovvytNKfkeHZRIYnhKsc3jCvIH2tXj/zksqc4sqh775eAI+dOYvhYRb
 SfEexCOqcJbvfLl6gp4/OwAySUrxh7wfkMtYWZIiulEWRIM+qcsulqbb873eYg9s1cHg
 pbdY7RHX6L0ou/MfzAq5I4dR03hj6tGrsW20UVoL8OZHtRjuztV/xJFJQFzagn1GiZps
 B4tw==
X-Gm-Message-State: AOJu0YxCFkMOF7EJNflkjenEPemCbhuIfy5ouT/ZjaBzC0zlKMRDejnq
 VgUaItnx+wK7pRX9D90a26HRcNSi1GE22depZMWVlSgGxgmRdzb29Y4cWdOYZKwLO1ZsBAa8dXa
 NXqeNOFxHIVAVi9mJvZUhPcI3oXypJfN0o1TEgbu5WGsORutU7ED7z98=
X-Gm-Gg: AfdE7cmzva+9EKW2ZC4Xu56CVNXtr+SeusybIGQOk4vBwQ3X3X2FO9iCstTTYJe5qGP
 hgdEvq4Ko7iJRl5DJDk6WrAvB+oejoplLxrjzo6puLDLDi/Yy9ujpNZcslxySABnVW77VG1kJT3
 URXCcFKa5x7Ex/MHXMbjGZOSVLWUIEDYI+08a3FTGfbsfvPfR6Ty+iyOizFCgMbHfnjeGiDE20u
 KFxlLE+KqNc9/JNq/Pkdbq2ReHqfyq2pCvOwnxhCH3FtIjFw4Fae8uxnHl6I5W1Vfe48LDy5hg9
 Ky+6VuDY1Aj7JACTUXj7zFxmuFA/bMQpulbvWk/vh9TZbon/M1eqwMInZgtnhdypgIv9XCUiknt
 pNog/U64CcUi8eGXnIzseTRPmmAmeSBi/mZEpxvcZswEwmZoEVx90JW4za6vetDFwve5J
X-Received: by 2002:a05:6830:6110:b0:7dc:dd58:50b8 with SMTP id
 46e09a7af769-7e979474907mr1373639a34.13.1782212552361; 
 Tue, 23 Jun 2026 04:02:32 -0700 (PDT)
X-Received: by 2002:a05:6830:6110:b0:7dc:dd58:50b8 with SMTP id
 46e09a7af769-7e979474907mr1373578a34.13.1782212551805; 
 Tue, 23 Jun 2026 04:02:31 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4666712ce9asm34715389f8f.37.2026.06.23.04.02.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jun 2026 04:02:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [RFC PATCH v2 2/4] target/tcg: Rename crc32*() helpers
Date: Tue, 23 Jun 2026 13:02:06 +0200
Message-ID: <20260623110209.26861-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623110209.26861-1-philmd@oss.qualcomm.com>
References: <20260623110209.26861-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cTDaBzuDNDrbMyWIvfWo30quME9yZzou
X-Proofpoint-GUID: cTDaBzuDNDrbMyWIvfWo30quME9yZzou
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a67c9 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xjhSHqqUzGq1U0fGcn4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX7Rb3fkyYbvrU
 G537XMMNXc5G2fDRAgE6PrRn7oXM2shAkRgHWbBjkkA9oOTDv9ohWdujZrk6QP64cCRk8S6rjY/
 tEe/TkXydv6vbRTEUGcIhqKy7vWcfIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX5OvAWKzeRDNO
 LzZvdsf7GGGdCE2spKKVyzN49XIPtmVXqc4KGr/LW3bGBoZpnrjSfVULaL6vwj+QEPMtqw6wpaw
 503ffqanCdYuzvuh8tLnNsNfOOfL+Lp5SapZ3yaXqGa7tunTi87xcgJXhHwRAlwSPlEbqcsGElS
 PhfB8YaUpd0Of5mdR7TJiHbY+3ggdXa3TNrHczcYM03Dozjyw2V9LoJsGUh63w5AZvryLY8OKtL
 SKdnDK4gsL/r9w7x+QxsOLB+8gB7cggnRR+lHzsI0jCWlrlNalmB7ey7NJOY0uJzDrh/9Coe7AE
 o8oaCUEOI4eyjRUQaXLL8GkY/5glB8lTHqoqKTUBozSdcgPZtiTWEjwgIiVDK1Kcus4pStVlYlh
 I8BjlniWSO617YAs4aupPog6dtrh1UM4C/P0dDrLD7sh1jA0ukx8f7DvP4VCFeoag6GgLcOVk3C
 r02EGFEM2ZbTN7PfuWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In order to avoid symbol name clash when building
a single binary, rename TCG helpers prefixing with
the target name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/tcg/helper-defs.h                     |  4 ++--
 target/i386/ops_sse.h                            |  2 +-
 target/loongarch/tcg/helper.h                    |  4 ++--
 target/mips/helper.h                             |  4 ++--
 target/i386/tcg/ops_sse_header.h.inc             |  2 +-
 target/arm/tcg/arith_helper.c                    |  4 ++--
 target/arm/tcg/translate.c                       |  4 ++--
 target/loongarch/tcg/op_helper.c                 |  4 ++--
 target/mips/tcg/op_helper.c                      |  4 ++--
 target/mips/tcg/translate.c                      |  4 ++--
 target/i386/tcg/emit.c.inc                       |  2 +-
 .../loongarch/tcg/insn_trans/trans_extra.c.inc   | 16 ++++++++--------
 12 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 8ec6c163195..4d113ee0690 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -493,8 +493,8 @@ DEF_HELPER_FLAGS_4(crypto_sm4ekey, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(crypto_rax1, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
-DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
+DEF_HELPER_FLAGS_3(arm_crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
+DEF_HELPER_FLAGS_3(arm_crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
 DEF_HELPER_FLAGS_5(gvec_qrdmlah_s16, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 5176a9f9e35..c54c8e460ce 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2111,7 +2111,7 @@ void glue(helper_pcmpistrm, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
 #define CRCPOLY        0x1edc6f41
 #define CRCPOLY_BITREV 0x82f63b78
-target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
+target_ulong helper_x86_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
 {
     target_ulong crc = (msg & ((target_ulong) -1 >>
                                (TARGET_LONG_BITS - len))) ^ crc1;
diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index e36dd2f5de3..35b055eb3bc 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -12,8 +12,8 @@ DEF_HELPER_FLAGS_1(loongarch_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
 
-DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
-DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(loongarch_crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(loongarch_crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_2(cpucfg, TCG_CALL_NO_RWG_SE, tl, env, tl)
 
 /* Floating-point helper */
diff --git a/target/mips/helper.h b/target/mips/helper.h
index f3d459982cf..10c6470514d 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -21,8 +21,8 @@ DEF_HELPER_FLAGS_1(mips_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #endif
 
-DEF_HELPER_3(crc32, tl, tl, tl, i32)
-DEF_HELPER_3(crc32c, tl, tl, tl, i32)
+DEF_HELPER_3(mips_crc32, tl, tl, tl, i32)
+DEF_HELPER_3(mips_crc32c, tl, tl, tl, i32)
 DEF_HELPER_FLAGS_4(rotx, TCG_CALL_NO_RWG_SE, tl, tl, i32, i32, i32)
 
 /* microMIPS functions */
diff --git a/target/i386/tcg/ops_sse_header.h.inc b/target/i386/tcg/ops_sse_header.h.inc
index bbeb7301c33..8569f9935e3 100644
--- a/target/i386/tcg/ops_sse_header.h.inc
+++ b/target/i386/tcg/ops_sse_header.h.inc
@@ -337,7 +337,7 @@ DEF_HELPER_4(glue(pcmpestri, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpestrm, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpistri, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpistrm, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_3(crc32, tl, i32, tl, i32)
+DEF_HELPER_3(x86_crc32, tl, i32, tl, i32)
 #endif
 
 /* AES-NI op helpers */
diff --git a/target/arm/tcg/arith_helper.c b/target/arm/tcg/arith_helper.c
index cc081c8f966..3a5cb41c7a9 100644
--- a/target/arm/tcg/arith_helper.c
+++ b/target/arm/tcg/arith_helper.c
@@ -275,7 +275,7 @@ uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
  * The upper bytes of val (above the number specified by 'bytes') must have
  * been zeroed out by the caller.
  */
-uint32_t HELPER(crc32)(uint32_t acc, uint32_t val, uint32_t bytes)
+uint32_t HELPER(arm_crc32)(uint32_t acc, uint32_t val, uint32_t bytes)
 {
     uint8_t buf[4];
 
@@ -285,7 +285,7 @@ uint32_t HELPER(crc32)(uint32_t acc, uint32_t val, uint32_t bytes)
     return crc32(acc ^ 0xffffffff, buf, bytes) ^ 0xffffffff;
 }
 
-uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
+uint32_t HELPER(arm_crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
 {
     uint8_t buf[4];
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c744b163453..e4e2b6be646 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3350,9 +3350,9 @@ static bool op_crc32(DisasContext *s, arg_rrr *a, bool c, MemOp sz)
     }
     t3 = tcg_constant_i32(1 << sz);
     if (c) {
-        gen_helper_crc32c(t1, t1, t2, t3);
+        gen_helper_arm_crc32c(t1, t1, t2, t3);
     } else {
-        gen_helper_crc32(t1, t1, t2, t3);
+        gen_helper_arm_crc32(t1, t1, t2, t3);
     }
     store_reg(s, a->rd, t1);
     return true;
diff --git a/target/loongarch/tcg/op_helper.c b/target/loongarch/tcg/op_helper.c
index 35f331ca52c..ffd8d6d2bd9 100644
--- a/target/loongarch/tcg/op_helper.c
+++ b/target/loongarch/tcg/op_helper.c
@@ -64,7 +64,7 @@ void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
     }
 }
 
-target_ulong helper_crc32(target_ulong val, target_ulong m, uint64_t sz)
+target_ulong helper_loongarch_crc32(target_ulong val, target_ulong m, uint64_t sz)
 {
     uint8_t buf[8];
     target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
@@ -74,7 +74,7 @@ target_ulong helper_crc32(target_ulong val, target_ulong m, uint64_t sz)
     return (int32_t) (crc32(val ^ 0xffffffff, buf, sz) ^ 0xffffffff);
 }
 
-target_ulong helper_crc32c(target_ulong val, target_ulong m, uint64_t sz)
+target_ulong helper_loongarch_crc32c(target_ulong val, target_ulong m, uint64_t sz)
 {
     uint8_t buf[8];
     target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index 83c340e38e0..723253da59d 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -145,7 +145,7 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
 }
 
 /* these crc32 functions are based on target/loongarch/tcg/op_helper.c */
-target_ulong helper_crc32(target_ulong val, target_ulong m, uint32_t sz)
+target_ulong helper_mips_crc32(target_ulong val, target_ulong m, uint32_t sz)
 {
     uint8_t buf[8];
     target_ulong mask = ((sz * 8) == 64) ?
@@ -157,7 +157,7 @@ target_ulong helper_crc32(target_ulong val, target_ulong m, uint32_t sz)
     return (int32_t) (crc32(val ^ 0xffffffff, buf, sz) ^ 0xffffffff);
 }
 
-target_ulong helper_crc32c(target_ulong val, target_ulong m, uint32_t sz)
+target_ulong helper_mips_crc32c(target_ulong val, target_ulong m, uint32_t sz)
 {
     uint8_t buf[8];
     target_ulong mask = ((sz * 8) == 64) ?
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 811492364a3..304d7ccaf28 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -13445,9 +13445,9 @@ void gen_crc32(DisasContext *ctx, int rd, int rs, int rt, int sz,
     gen_load_gpr(t1, rs);
 
     if (crc32c) {
-        gen_helper_crc32c(cpu_gpr[rd], t0, t1, tsz);
+        gen_helper_mips_crc32c(cpu_gpr[rd], t0, t1, tsz);
     } else {
-        gen_helper_crc32(cpu_gpr[rd], t0, t1, tsz);
+        gen_helper_mips_crc32(cpu_gpr[rd], t0, t1, tsz);
     }
 }
 
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 83c889cc3b2..386ca5348d3 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1916,7 +1916,7 @@ static void gen_CRC32(DisasContext *s, X86DecodedInsn *decode)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_trunc_tl_i32(tmp, s->T0);
-    gen_helper_crc32(s->T0, tmp, s->T1, tcg_constant_i32(8 << ot));
+    gen_helper_x86_crc32(s->T0, tmp, s->T1, tcg_constant_i32(8 << ot));
 }
 
 static void gen_CVTPI2Px(DisasContext *s, X86DecodedInsn *decode)
diff --git a/target/loongarch/tcg/insn_trans/trans_extra.c.inc b/target/loongarch/tcg/insn_trans/trans_extra.c.inc
index 655dce329e8..63548eeb567 100644
--- a/target/loongarch/tcg/insn_trans/trans_extra.c.inc
+++ b/target/loongarch/tcg/insn_trans/trans_extra.c.inc
@@ -105,11 +105,11 @@ static bool gen_crc(DisasContext *ctx, arg_rrr *a,
     return true;
 }
 
-TRANS(crc_w_b_w, CRC, gen_crc, gen_helper_crc32, tcg_constant_tl(1))
-TRANS(crc_w_h_w, CRC, gen_crc, gen_helper_crc32, tcg_constant_tl(2))
-TRANS(crc_w_w_w, CRC, gen_crc, gen_helper_crc32, tcg_constant_tl(4))
-TRANS64(crc_w_d_w, CRC, gen_crc, gen_helper_crc32, tcg_constant_tl(8))
-TRANS(crcc_w_b_w, CRC, gen_crc, gen_helper_crc32c, tcg_constant_tl(1))
-TRANS(crcc_w_h_w, CRC, gen_crc, gen_helper_crc32c, tcg_constant_tl(2))
-TRANS(crcc_w_w_w, CRC, gen_crc, gen_helper_crc32c, tcg_constant_tl(4))
-TRANS64(crcc_w_d_w, CRC, gen_crc, gen_helper_crc32c, tcg_constant_tl(8))
+TRANS(crc_w_b_w, CRC, gen_crc, gen_helper_loongarch_crc32, tcg_constant_tl(1))
+TRANS(crc_w_h_w, CRC, gen_crc, gen_helper_loongarch_crc32, tcg_constant_tl(2))
+TRANS(crc_w_w_w, CRC, gen_crc, gen_helper_loongarch_crc32, tcg_constant_tl(4))
+TRANS64(crc_w_d_w, CRC, gen_crc, gen_helper_loongarch_crc32, tcg_constant_tl(8))
+TRANS(crcc_w_b_w, CRC, gen_crc, gen_helper_loongarch_crc32c, tcg_constant_tl(1))
+TRANS(crcc_w_h_w, CRC, gen_crc, gen_helper_loongarch_crc32c, tcg_constant_tl(2))
+TRANS(crcc_w_w_w, CRC, gen_crc, gen_helper_loongarch_crc32c, tcg_constant_tl(4))
+TRANS64(crcc_w_d_w, CRC, gen_crc, gen_helper_loongarch_crc32c, tcg_constant_tl(8))
-- 
2.53.0


