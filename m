Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DDA606A31D
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LaVxI+lJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ibFC7lHt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM4kE-0005K8-75; Wed, 28 Oct 2026 10:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4j1-00051O-T9
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:34:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4iv-0004Sl-BM
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 10:33:56 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBe1Gi4154726
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDWTymZYQGoacUv9TB5H54Z88VJQmmNX1/Q34guwBF4=; b=LaVxI+lJZ2G+FK/X
 y0OI437UW3zu3X2cyXrM6kBdKFxssqNreHuPhAmg9ElKOYVo2mkE+z/pi2HnowkU
 WrhrCzXRnBZ7RZDb9qOqqfpQP6Qyi2Uth1o1m625rKFh1ObZ4ZrZmcAw4AbBbn+D
 CuR++rJfpuAWbdM+O8dwlNynHl/rx618taxVdrIQ76z7UiAtDrSKq1LRFkXvWvWi
 tkNUT/xX83V5FvTZuXbFKS33Bb0ue+8HekJvqCHw9YtS5YXVzz+/oAuLeO06K9TX
 0dKuVjKbgEBwRJcOeh1u57p97+68G5CzF5VlejDzLQEXcF/9mBsvjlGZDn2+FTRw
 l0Oyng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp19ue-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 14:33:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93caf6c528aso141520285a.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198029; x=1793802829; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kDWTymZYQGoacUv9TB5H54Z88VJQmmNX1/Q34guwBF4=;
 b=ibFC7lHt6EhZ56biJQG/oKr40X80tXBkNLGHSH//621eFAj0nkd+P86EV/lAbQaQXc
 xotX4dJbTM9jVZrVB/oLTdzS0PbHXR8O4cx6rMlFnHSAc0w+1d4PRFCwR5xKi4bG4pto
 lmB++0uRUnwIPRzmm0gzUN8yNKZmfVGyxwP1VmjjktoVOM9fAuNJzLzCor1ixKPYILqO
 26GCMnlQmgoA8wxj/exUsmKwJh1EcV+tRkLZcaZkLtItscHsl54TiEppcDxF0hz98GsE
 94JMcfYNIBvDnK+VHFiPj9ZvnKz8kdO7cq5dzR0navnExJFW190zzG/xdcPS7UC3kug/
 +cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198029; x=1793802829;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kDWTymZYQGoacUv9TB5H54Z88VJQmmNX1/Q34guwBF4=;
 b=snZ00sRh4cT0Y4tlhqWJQym1K69edt+ZdTQfgR6/5GxsJr/l3jyG207OuRjNfgacGV
 jR/VPybfWINZZfTFttH5hupvmRCy98UieNJQ88o5TbnfoglgYm98wAfrZBr7Vmzf5Own
 60obMXXv+NpEkXP6WrhI8JFVnqqs/xMvb7rBhSSd76NUl8AIbWCVEQ30W+XYmVWzcy7w
 vBBJ/8ERSOCWPgvJHCXbwL1+nvKaBafPlz60ZO/ty27jPUxBAuwsSryXDY/Ux6hY78wZ
 XlP7F1TKw+ruPxvrhufJw2f9fbfIkGpQxrC4/fpZtRmne77fwwRBPMDTT5aTwkSiMbPQ
 tvIg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx0B3mOzuj+HpfzTJV6nO4gzMiYt4ZSGK5rzExhyC63UDhikRPaFgfzlWQuzfCTRCUafl4PEkYLkQ==@nongnu.org
X-Gm-Message-State: AFq9FYLnSoXrxpR2jpAWebYzqMLXRZMWjUm7o/xZ1VfMbJa4UrgdlcTo
 iPZoEPbMfAqh2ynaFAZb0mPHJLNm8+wvI43jNNHpbjU/JgXBDvY/kAM2wB+qlcteMflXIC6qJjd
 7ojnv/oxaCZVvVPqNOcWqOs8HgnyWo2aA58euoblGK0oRdhcAl3T/XMaGmqIpip50aQ==
X-Gm-Gg: AYBFou3NoNrsO1jcPPBQnF4x1uRb6GSv/p4jy52JHskkjy/NpNZhBhOarKnevfgHUuz
 ZjrBckQbHawOUgy2h98CC4GClISRP4HWoJnRk3BGvePea2zXKgN5oHNI+3grVzp7bsjMGwbJGs1
 II7ONcGtS/exL4x/TJ3zGY9elWFCw09up6BFmV7CyHfW1nIqPtD5be5YUy2zd48tza/cm//ovWP
 68efzJrFGsIL8lTQ8eEkHO4BW3bwmpxk8DIdECH2l+500VAPoeayfLestGSQlAF9zNTve90dSVb
 61L5K6+RACAo+R0qrE8hyHGsov6OIhJcsH8KRXu+/TdMavYAXRyqRpDQBiyhg8ZnIA0mp0LrANF
 v4zz9sjZF2kLoszxVlsD0uiZEmJL+qQzfSEBJ4mqokrg1yPaps93cSiFS+gt5ARTc4YRhGIDpIz
 sSOVYqrjmkbUs5HaI0IWQ2fo33778GMw==
X-Received: by 2002:a05:620a:8015:b0:93f:3bb5:545d with SMTP id
 af79cd13be357-94408a26979mr349024685a.27.1793198028960; 
 Wed, 28 Oct 2026 07:33:48 -0700 (PDT)
X-Received: by 2002:a05:620a:8015:b0:93f:3bb5:545d with SMTP id
 af79cd13be357-94408a26979mr349019385a.27.1793198028497; 
 Wed, 28 Oct 2026 07:33:48 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97c42ca77sm46733795e9.8.2026.10.28.07.33.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:33:47 -0700 (PDT)
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
Subject: [PATCH v3 2/6] tcg/riscv64: Use a uimm5 encoder for vector shift
 immediates
Date: Wed, 28 Oct 2026 15:33:26 +0100
Message-ID: <20261028143330.6518-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028143330.6518-1-philmd@oss.qualcomm.com>
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zOHPQcJs0mfb4mI5M-2xnfcEXAlSTggw
X-Proofpoint-ORIG-GUID: zOHPQcJs0mfb4mI5M-2xnfcEXAlSTggw
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae207cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vwcle1UgPbd9zKqFLQ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX5/itGecR68AJ
 sel15lfgNOxj4Uf3VIa8RjCxBBFoVlo7IM0bQGBg6ezbngmktwXkwA8CThcuPw+ZE04JUex9pk4
 uVNaYpnoODgsb6/P2j4UvGjvCfqNEfobg/QWrja4hmJmvYwN8w82U+ayRcVpo0UjrndoPN9PDSE
 5j3qL77A+LpjyadOopV2glUTsB7bDIpBJOQzoX6rGwhkfJKAW/c8ZJ6ZQTtRjwS9nsv7Mpcz5PE
 o+vB3Gh52VSy+mTOa0YhX3REPLr6DgndxNf0Rb7rv+Ymx2gQtaxYNjefbLWC7P6ZwnDJKTWSd1B
 INi2nYx/AI94QFQiBtiMEbQK3b+kOy6qmg82qUmAWk+PERvaON45hhi1k39vFkxca2bTaKldC2Q
 LxCm0rO6NyAovwsixkvsgoC6OfS+wg9YA0VV87IgB9FazB5wCi3x7dtd8U2sDObMpwBpOMzlUMQ
 B2FQdmiTWkA+6y4NfTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXyTik2g/qLZ84
 6LIw/mk8u4PzpfQSK/Kh/r81z2okud+AlP7EydbDOUvuM0YgREWKX6kMhOpmW1GVTr3xbtlNvE6
 bZx3xq8iVA27ZS4zgZjPSbgTo3XRq44=
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

RVV shift .vi forms take an unsigned 5-bit immediate, but
encode_vi() checks for simm5, so shift counts 16..31 trip
the debug assertion (and are undefined behaviour in release
builds).

Add encode_vi_u() and use it in tcg_out_vshifti().

Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tcg/riscv64/tcg-target.c.inc | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 712170c1203e..0e749ae296b8 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -541,6 +541,7 @@ static tcg_insn_unit encode_vi_raw(RISCVInsn opc, TCGReg rd, unsigned imm5,
            (vs2 & 0x1f) << 20 | (vm << 25);
 }
 
+/* OPIVI with a signed immediate (simm5). */
 static tcg_insn_unit encode_vi(RISCVInsn opc, TCGReg rd, tcg_target_long imm,
                                TCGReg vs2, bool vm)
 {
@@ -548,6 +549,14 @@ static tcg_insn_unit encode_vi(RISCVInsn opc, TCGReg rd, tcg_target_long imm,
     return encode_vi_raw(opc, rd, imm, vs2, vm);
 }
 
+/* OPIVI with an unsigned immediate (uimm5) */
+static tcg_insn_unit encode_vi_u(RISCVInsn opc, TCGReg rd, unsigned imm,
+                                 TCGReg vs2, bool vm)
+{
+    tcg_debug_assert(imm == extract32(imm, 0, 5));
+    return encode_vi_raw(opc, rd, imm, vs2, vm);
+}
+
 /* Type-OPIVV/OPMVV/OPIVX/OPMVX, Vector load and store */
 
 static tcg_insn_unit encode_v(RISCVInsn opc, TCGReg d, TCGReg s1,
@@ -720,6 +729,12 @@ static void tcg_out_opc_vi(TCGContext *s, RISCVInsn opc,
     tcg_out32(s, encode_vi(opc, vd, imm, vs2, true));
 }
 
+static void tcg_out_opc_vi_u(TCGContext *s, RISCVInsn opc,
+                             TCGReg vd, TCGReg vs2, unsigned imm)
+{
+    tcg_out32(s, encode_vi_u(opc, vd, imm, vs2, true));
+}
+
 static void tcg_out_opc_vv_vi(TCGContext *s, RISCVInsn o_vv, RISCVInsn o_vi,
                               TCGReg vd, TCGReg vs2, TCGArg vi1, int c_vi1)
 {
@@ -1578,7 +1593,7 @@ static void tcg_out_vshifti(TCGContext *s, RISCVInsn opc_vi, RISCVInsn opc_vx,
                              TCGReg dst, TCGReg src, unsigned imm)
 {
     if (imm < 32) {
-        tcg_out_opc_vi(s, opc_vi, dst, src, imm);
+        tcg_out_opc_vi_u(s, opc_vi, dst, src, imm);
     } else {
         tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_TMP0, imm);
         tcg_out_opc_vx(s, opc_vx, dst, src, TCG_REG_TMP0);
-- 
2.55.0


