Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07FC607D716
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DotVG5zx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gIsKRSj9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMpo-00069K-65; Tue, 20 Oct 2026 23:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoT-0004Pe-1s
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoP-0002qe-0S
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:23 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2ErT13420576
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2IbJWKdI1MQqjzY2GFXVwHaUDrLg2miYkaJxglFSvS8=; b=DotVG5zx5RSMHcwP
 1SGEbMnSZ/ZAZYCTncGTUBEXCsOgOuBmnVlQBBZWmFC7/jHE5FQ47Xik4gvWHRj8
 LOhis4mKXGAqKAm2+8d1oGG336JMTiU53Y4cLShXazxgw22bXnpf4vu+Xs+dNiOF
 LYAPPD/7FYKTMR1v7MvfQnCmzU2PgJFu/DXxqwour9/019u2D6jDUHR8OPJOV84R
 5s69s6nc4ECGwWoLPn1+qS1YilHY2OCdTIqkQD/fzESdvX6U3/SmliekhQE9qo9m
 p59qjGX5vtTgGHdr6yYykNOvHuJAo6EqotVkofM0xVOWH3xxrR6FxHJRIeE7Zrwd
 lJKfYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r0ua5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93e49a1d3b1so78540885a.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552569; x=1793157369; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2IbJWKdI1MQqjzY2GFXVwHaUDrLg2miYkaJxglFSvS8=;
 b=gIsKRSj9zsgsNP4i7XGj/DEAr8cKF7FXfNkfuyTXbJOsCFJsnYKL01CPt2Kbk164fK
 aLfTolvQa175P78irJUEG4fE6sAtZvYI/KAtdCoZe0r88dfgWImOJha3YhoJvC3yRGJD
 2ic9FEjaWdkHCU6tr4ZJODIymK76sLem1+J6JPtvXR+FDVKBFuPw1rl/PNXpYEDPYPyS
 8d+6LkhhHzRgx7UJo669RVS8ildMszMQFk7n5poPnb88fExoCay3Muw1L9B/Ip8oH3vE
 SBZIAyejeMYQyizPh1wETEC/Kodj2L2ic2aWW3ddz2q+09A/Nyuk0EVAfTClWkehsVZ9
 K/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552569; x=1793157369;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2IbJWKdI1MQqjzY2GFXVwHaUDrLg2miYkaJxglFSvS8=;
 b=b+NfAvE3c9YaxQsxPlQFI4XOwzBnjXw2ZaQ2hpHVaPb/ana6siCQccDIOf/zPB5C3w
 cMNdttog9rjiB/UntyicZDCmllw5WBMHjLVnYjOOjXzfRKo+9v7SpN524gOEqe/q9aN8
 shUP/g+Z+dBM7TEK1TXYb2QP9r/tK9vSH4t4eHCA1PvG/C4NLCx4ZvI40OUbqktvYLIa
 glyvHDFjSNa1w+g/YG4R20Wjl7igRr07OxclLgxChiYh8JLBWrJTGy6dK1qKNmIOhRFg
 EFsIbGTUQRlZiNWpSCP/Kg2HAQIQi+lu0TGPO+MwbHuVMbCk+nb76CgyLZ3h5ixhEA9+
 jT+g==
X-Forwarded-Encrypted: i=1;
 AKwUvBySK2gsDbMf8V3xI/+ua5BzC9bqYXmD+Ja2Ot2jEN+P00lr8JLT+xFu0RFBZwK5MaxVv49OXpQgVw==@nongnu.org
X-Gm-Message-State: AFq9FYKmVxf/46N9HM3/Hi9by7rTrxdJV+EZCQMsJY8a3UIytgw6ktNJ
 FigKe0br75SWLJGsjZGfNBj0p+Kj3kmUI5MbE0Hw57NTm9yV4iZOZ/ed8WvDLO4RbotXy6NrtGN
 55ZfAPTrjTl/oEnjk4w9tfWmuBJrjuuEwxDTIVE69w62Kws9SUXV+Q8vCloWET8wF4g==
X-Gm-Gg: AYBFou0Es/mj00a6iHm53YPd1ufl7f6RqBV0T87urbysf6zidgkZV4R5DKrL7ajlo+x
 tc5wsLlpCRkfh+FdmE+E9SfQcuCpLr4kl5lKOa1W/6V2MHyYlp8SAUcMhmhNxKBjHOLT5TxtIHy
 YLv8XeQKdrivhrPolJezFytB1uLkXJv9gX1bKPp+Cge5mBwHQ27nI6KOXQKSa/86mHrrn92rbBx
 EPQECpBgg4toNuAUP5MMd1hN3Gfq9+lycqJhoijvzp1vCkZHfzfpak0zA8IUPXJb0PBRpHs/XTB
 WmlV/lvrIqHwSd0tMUv5sox9czXSOzzvMicLvW18qlf/m7IyGmhNNI2N4VDfq1Y5iSmZ/zV9Me2
 M3tWpfVcCY/yiPKuGY0DtStH7JE8pSlk/zCWTv1Ts
X-Received: by 2002:a05:620a:371a:b0:93e:c12c:f13d with SMTP id
 af79cd13be357-93f57f646b9mr213537985a.71.1792552569229; 
 Tue, 20 Oct 2026 20:16:09 -0700 (PDT)
X-Received: by 2002:a05:620a:371a:b0:93e:c12c:f13d with SMTP id
 af79cd13be357-93f57f646b9mr213536285a.71.1792552568813; 
 Tue, 20 Oct 2026 20:16:08 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25828caesm2312844f8f.29.2026.10.20.20.16.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 15/33] target/microblaze: Implement and register
 CPUClass::exception_name()
Date: Wed, 21 Oct 2026 05:13:48 +0200
Message-ID: <20261021031407.24862-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad82e79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_ZqrUhsafL45AmjA-XwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: l10dsau97M7TKIwXHdvu0_QRNOFFeV8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX72p1Em/7cj6k
 QjcLcJUn4Wym0NH4VwI7veFbF/coMpUo5uHZdIb/GWX9FqeEHf8+4SSK8JLgEeIGMlIalipCCUd
 WC2f+TBqOACSbrLG73CDYxaI1N2HCJyH1WzpClgKV+lDGLIm685FcKkCS8D83huYsEQspKRkqfz
 XtqpCXG3144Je3REpg7znVHMNslyVgMMrA7yb97kTlSR8zBeala/rKSrssQyjee2W0oBVRj3gY6
 SSRi29CprzErXAL8uLx2bFVBm6R7SGSgwksUkgnxHVDVpzvsZHwupsV7k9nMeCDEjfyE+nRcqmz
 qOLKYLW42ZcRONzI/7dhodhC3YbGZTxZ3r1ihw2PxWESOXcWZkbQZIcoryN8j8EcjnYiOlR3VTK
 URHiVhi5Q6BGorcWIgn7/iIS2uxnH+5C70oWD2UZjMuAY4v+8HWCGxnEApAYRz0kwlgNO6EkuAs
 BWccRkneaU/GV7j26VQ==
X-Proofpoint-GUID: l10dsau97M7TKIwXHdvu0_QRNOFFeV8S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX4RmtHFg9WP9+
 Uzh0G5bO3FFH8naaEZLuV9is46MlCb0nrXQRy06vAYxIhnWWQCwFHH7nDJLkbXhyuoluiTEM3vH
 hLUQaLicVI8bXhceVaIxsaCmWgwhKGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Implement microblaze_exception_name() and register it as the
CPUClass::exception_name() handler, so the common exception
logging can resolve MicroBlaze exception codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/microblaze/cpu.h |  2 ++
 target/microblaze/cpu.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index b9602f72b94..fc2783693e3 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -36,6 +36,8 @@ typedef struct CPUArchState CPUMBState;
 #define EXCP_HW_BREAK   4
 #define EXCP_HW_EXCP    5
 
+const char *microblaze_exception_name(int excp);
+
 /* MicroBlaze-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 389a5124b12..f64488d0a08 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -79,6 +79,19 @@ static const struct {
 /* If no specific version gets selected, default to the following.  */
 #define DEFAULT_CPU_VERSION "10.0"
 
+const char *microblaze_exception_name(int excp)
+{
+    static const char * const excp_names[] = {
+        [EXCP_MMU]      = "mmu",
+        [EXCP_IRQ]      = "irq",
+        [EXCP_SYSCALL]  = "syscall",
+        [EXCP_HW_BREAK] = "hw break",
+        [EXCP_HW_EXCP]  = "hw excp",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
+}
+
 static void mb_cpu_set_pc(CPUState *cs, vaddr value)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
@@ -469,6 +482,7 @@ static void mb_cpu_class_init(ObjectClass *oc, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mb_cpu_class_by_name;
+    cc->exception_name = microblaze_exception_name;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->get_pc = mb_cpu_get_pc;
-- 
2.55.0


