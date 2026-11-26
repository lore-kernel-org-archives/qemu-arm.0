Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F18C606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5VIM+mm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e+vFrzaL
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj22-0005XQ-0x; Thu, 26 Nov 2026 18:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1v-0005PY-Ly
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:37:34 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1u-0006wn-2o
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:37:31 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwSxO2574642
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K+1rYPMLMIU1uLFcv/qtFlOmnLx9HwEmB05o3PG19RM=; b=J5VIM+mmkANxLXhN
 fI5+3lgWROGG6/JjeP17XbvAA0TpEawXnsZvIEeppfg/ucA182LQlOb7F7RT0f9x
 N7KsiFTiCBsgkY0ld+Co2AZGWZKrrnZjyqaw2eC0BsE7OHhrJssvwT+v/jNKL2Dh
 219fYNU4QywwpGsaV2oXPC5Pz83qIR4zZixGy103ZYfYRU2vMyb5Uh6ULnzi/rxK
 Phs+Ds+Yp4oVdaQ5KZDU1Sc49O61gN3SZv+7yYaFSuNFN1q3GEP2ZrevouJMxx9N
 8YEv9Z+B/54EwY5IyZ08tyc3Klu73yREvi9qZk5yFZ414cQAZyuUt4rPGtUV+elb
 1B62Ew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u498fqu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:37:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f5844cb60so1243866085a.0
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736237; x=1796341037; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=K+1rYPMLMIU1uLFcv/qtFlOmnLx9HwEmB05o3PG19RM=;
 b=e+vFrzaLmYa5K6VDlMZFKCBXpyRNEbeOthrF1rI8v1WTglioiMqPche+oPjPF8jAAg
 nE1xnpPMFO9g7av+N9pjVlHPYxydNQ5GEft/vzHSFFGGUOFUvhUqHPbUPYOPYEv4PYaT
 Snr9H/6FwbZSxpaI5jIW8Xgk9B/Rekrmm7mCrp8I9uU8VZivQ3q3eYk48lqiSEGfDTd5
 D79Bqf6bXb3HUU5PC+dysw63GV+v+S82HdyQYZhC3hXep9xZsjS7s7g4nRXrWchLe1eq
 hfXNzEQ6zqCKy8EpcvSBGuYPgmHMqHsz+0lp4a/kwPEIHHH78yzc/ejYAfSN8zk0o+lR
 HfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736237; x=1796341037;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=K+1rYPMLMIU1uLFcv/qtFlOmnLx9HwEmB05o3PG19RM=;
 b=jd423zZ9vWKxcKO6T1U2RCq/R/5vUnhjjhcS3RbAfOc6jGhMYAMS1OxyBeXlmjkgoz
 KnvBxdmWvRiESoZL6PYiAImnQBvGQZbYBSviMDw4jjoHBl0Te3kB5++kBumu6gz92ugC
 qcAhPZ+uwa+YOHzQ5PbuxNh41JIoNruVt2zUX6zSLJKTitxB/T+up/qmSpF8Q0SCLnuF
 ACbcYL18Gyk2aDF7KsQ0iRTOuDuBd0I5c65BZhTy1q3Eyj3z0DnTN7/vWLT6mp7QdTzB
 cqnqSrt3Med4XtVarBkvRsqew5sW27G8rAKKXXt+1HhUvUJSsNqkdTRqe4VUNbo6svPD
 ealA==
X-Forwarded-Encrypted: i=1;
 AL+hErFsEct/6rVroin5crjM4W/LzXU8T8/0nuT5EZSzwo3qxO4mjZ4sMnMXtuvuoHi4HfmZxeTDHUYeEA==@nongnu.org
X-Gm-Message-State: APuU4Z+HTvJw2C50HZHfo5+mWUVjk1ewPACndNgE9Cjxh6rKIwrqLVbd
 t9pNhX3FP1aOtVaI0iPEmq5vThgkAIq7Amp0UPknMBNjphZiUXIkP6058mCir8D8RyWaYuhrLuN
 Eww4/1xLeuWtk4gKil4Fzn6H/5bL+k0owl+aoh7SC7I6vm+/u8Y0OXas=
X-Gm-Gg: AZFdTZfrWF/WWjytWaokuUJMC75NtTxsw7mF3AwlgIryxiDMcRFP+uj7RCDOfLPlu/+
 TQ7E8XUNeAA4RpPKUA9hQgDgFuoNbxYl2nK/c89XQnci2qG20P/ZIUejT0/OM4kESKzH+mGMCBu
 PJ0XwzmFjyHOHb3jH2t9rSd6IHXPse+lSpPieJHitQMVSK0Q/hXadCrd8HKNLEtklYeOimIegMd
 rR3eb4qlErVj4j+3wwk3L8Eb7PJ658Ue7pnYTE2lw4L0SwjpvS4pD0EfII+WTRfNSo4/SmGF6WT
 cunswgB4incpmhGGfQUCISYHKIT/KdobDYXjXH+818ANA5+yw8Bn+sDsPeNkUjO71sA0k9F1jtz
 O4xFRB2r0CPr0XrrUIWgGWSELkhmZDOPLsps6xzIr4HNiklOmnXPUTLxzVkMgi/KDv7aBgkDG4y
 mwK1eCRne+HzYy6Q==
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id
 af79cd13be357-949b35ac8e0mr4173811985a.19.1795736237545; 
 Thu, 26 Nov 2026 15:37:17 -0800 (PST)
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id
 af79cd13be357-949b35ac8e0mr4173810485a.19.1795736237132; 
 Thu, 26 Nov 2026 15:37:17 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989b3sm43372266f8f.51.2026.11.26.15.37.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:37:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/24] target/i386: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:47 +0100
Message-ID: <20261126233604.67722-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QQFVMrnuFtDDs6rHV6oR6ey-IhZx2nqv
X-Proofpoint-ORIG-GUID: QQFVMrnuFtDDs6rHV6oR6ey-IhZx2nqv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX0acK1TeFiziQ
 R0F/1hQ/J+bgTEvgqugiN/ZjmhibKbsrV+mYTgW5JOhfFIfWNHu5KEja7zIqYSxpdKT7JSRZLoo
 dj8o6L63wyKFffbIpF95Ije3z5Ww0lM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX4zjYFj/AWsZX
 eDUybbnQD76uOA/SM/tTpnB6AKET09tNS8I30p3CF7q9krleme+kWLjS2vxr65jo4d/g0qPiFNW
 Elo9hPuL6CT5mMS1ZUFxQRRBcqSzD/1JH71ah90mzlDrzsyjXPPw/ck8o0tGDiW0l/tyOvvnnoQ
 ESaU23dUIF9+rrX4KYG/0Z1eec/Gqu42GXe0m5shfJoAbINXVePTqyFAqKfv3XAscFPgDKvb3h4
 VBc5mqsOalfdDcvGHR+29TfT6C90tGhiebu2AfVM/yOpgsfsL03VEVRRsh1poq0pMfS9OMaDJ6I
 hUKs8sE2k9oZ/ZvHHUaN166FyISyziwx5iW8wz/FlrllVugdY1PxHSCsyLf1iC8t3xRMtpNzBTB
 NliUNYQACfhxC7cF0DhClyZVyU7rTOTWFveN93xXZZiSZzrgBGewcvf/XnYmdkUU5TAgZ2v6ivK
 vZAsn4PJrJZbKP19QVA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b08c2ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7CWSldxV8w5ZVOrNXgYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
 target/i386/tcg/tcg-cpu.c   | 3 ++-
 target/i386/tcg/translate.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 167ff7695ae6..bdfd08107d6a 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -53,7 +53,8 @@ static void x86_cpu_exec_exit(CPUState *cs)
 static TCGTBCPUState x86_get_tb_cpu_state(CPUState *cs)
 {
     CPUX86State *env = cpu_env(cs);
-    uint32_t flags, cs_base;
+    uint64_t flags;
+    uint32_t cs_base;
     vaddr pc;
 
     flags = env->hflags |
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 719771032ff5..af98125cd718 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -122,7 +122,7 @@ typedef struct DisasContext {
 
     CCOp cc_op;  /* current CC operation */
     int mem_index; /* select memory access functions */
-    uint32_t flags; /* all execution flags */
+    uint64_t flags; /* all execution flags */
     int cpuid_features;
     int cpuid_ext_features;
     int cpuid_ext2_features;
@@ -3535,7 +3535,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUX86State *env = cpu_env(cpu);
-    uint32_t flags = dc->base.tb->flags;
+    uint64_t flags = dc->base.tb->flags;
     uint32_t cflags = tb_cflags(dc->base.tb);
     int cpl = (flags >> HF_CPL_SHIFT) & 3;
     int iopl = (flags >> IOPL_SHIFT) & 3;
-- 
2.55.0


