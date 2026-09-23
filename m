Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437C8C9830E
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QWt-0005ho-Ey; Wed, 23 Sep 2026 13:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWr-0005ac-7j
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWp-0001EK-L7
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:08 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTvC14051979
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=; b=MG1L9yb1SroUlmzd
 IEAy9uDQv6t4NB5f5hrPDui5SVyuJ3pgr8gECdQNzECU+q0DsHM/acz/lx2lundN
 wrycXat23eTCpR2bFGdX3Wxn2YZV9QvpTtWjqMoVnJ7JCFV9E4IgiU6Y1aAQAfpl
 EDl+tCTXt9W0COLJwCoToXeeq8D8SzEO6SFBdy5EElPaFK5h2DqxSj+h9Q7E0IYs
 JvNiLsrRN0klott2Kh6KikpzEHdLsQgBMnDFX1F8CE2zARURdZTf/9ezsjiTRNqc
 6Q9YmivgBWQi2bIPX/7ELwHDkQi4CyyGH+kEQX1rw8+WZg483To50X+TtjHBY9tf
 WsILYw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n36m2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:12:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-78f2fe53829so1228388137.2
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183576; x=1790788376; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=;
 b=IKkpb51tQoyYXu+mFJRzBbZxDPadESHE0rduUAGi6wsJjRaqRBq5j3YxnMLMYnF6Nw
 QUgZpXWWqMmBHbDTV466tzgS+N+RSjOj/DPEOVlWnYhb5MAnQG0urhzzZLb/RJ87Wc/f
 vva9ZLQA3vgfidHK4OcXANkWfdBM6s3OlEOClfa6Ya9MlVDgBWTAQt6Xa2S+4UlSd/AT
 mtFcaIBgqpmHzChWhNplEPD3NRtgHjh3iFLXj5AgeuuNF7U2W/CKgH0P6yThheSScwPi
 3xtwftRlHOOj4/cGp6K6+ad6ci+n6D6I4P4ZIZFMjX6+nodYl9+HkEMpeKGKJjjBQHZY
 x9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183576; x=1790788376;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=;
 b=j7xLGYyIUN7S/5Am4WtcI6b5m+xoHHIl4p1yatBk9KoToqrDWLMhmhuH2XChCVNWLH
 +7aeS1GlBotJs/Wcwnde7gAaAN2ErCbFnh8v6HHOoxlLQ5JhHja+dsozbueOLhRC3P8u
 nMKe0Bo8Otn9lTBY8wRQrG3eBc9MRsMD0pckVFMrmS31y0sS7zlgN0SoUBb6Deo/3hOL
 5ma3HN5/UJTVyYsTRBZZgCmaP0qs9cusWykXE/3LUq6ckzzmwjPG+0Y/Ryahl+ntSIVr
 Tg861g+WWo3atOGX9GeX49q1q/FcwrWeZp8soS2TUtnVgEYe2eMYYkNMkd8QHNxrywHx
 wtiw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBECmlS3clWvfb8YdMA60unQhejmTq04kzJMjFb7VTol9wLAXPT+Stp9qjPO6f8IXjGr4yKFOS1A==@nongnu.org
X-Gm-Message-State: AFuF++mKaiRwAUVBsQZbsOTvGpeSgf3jSgP8upye+iIsUa3DG08W9aZM
 ChH9WxWluUX+Yf+wUA1CEY9FdI4YoYj55xkp4U5DDGpLfGym2WgteInpnkClnAsi5lV6JPLvGu9
 UN4VpivLRJO9lp2TO2vMm/l0J4fFPjNZfQauL8+rSYfzRKpFLpe7bNgc=
X-Gm-Gg: AYBFou2JiYFWxwULeRcWSazJlirRQA0i3pyD7U2DJ2Rj2HoJfZQbnUrFFAkE7IM07Df
 4kudqvKpqk254XmaEkMgOiqfNeNbDRzdUT5zQmmz7J4kwmTAPG3mLqpUKkgz7BIMUP/MGLpG/S6
 KpMfTy2K8uRmRg4KnthyDPkAs/kvA7iJCpkL6tgwMxWYajjU5iIejIunNp37pwcTH9jSBeEyq0O
 FKwwnLM2yUZ4dPS/pO6u9XJEBpvyD/eYQP3ijnmjcTkmd+5IfOsu88WxjUmkkRdpyL0qz2gF0J4
 /1blYhORcAb/MARCyU9WtS7VBWqd7cgs7OUrkfBKs3X2P0iCyuFbRG5zw9nh4W+ql9TaWp8GuhD
 o0hcjpGVZ3iv2sjpOlB0J8zWC/NM2nQPYEDlGNsaDKzirqYFJ158=
X-Received: by 2002:a05:6102:808b:b0:7a1:f7e2:aae9 with SMTP id
 ada2fe7eead31-7ac1d914ac9mr2634360137.27.1790183575777; 
 Wed, 23 Sep 2026 10:12:55 -0700 (PDT)
X-Received: by 2002:a05:6102:808b:b0:7a1:f7e2:aae9 with SMTP id
 ada2fe7eead31-7ac1d914ac9mr2634330137.27.1790183575375; 
 Wed, 23 Sep 2026 10:12:55 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488684862a3sm7725749f8f.7.2026.09.23.10.12.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 13/21] accel/tcg: Refactor poll-while-halted flow in
 cpu_exec()
Date: Wed, 23 Sep 2026 19:11:07 +0200
Message-ID: <20260923171116.31276-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX47VySrHuJFeA
 IiNT5Qw81sHu24zw1T/MYyKL4uIWEcyypyFtN91irlmhVuNsozNj2FDuoDraaRe1vgXn1C8NzB4
 2FxxsfzfPDT+h77PxGymhSK61LGmxto=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXxWH4klF4ZPtF
 t60WtCzAZbAldzP5iiE7e2+zW4b1B7Z0rwt9mR1i5stBlcuqDOJnAMoI6IX8u0jd3B68htbu8w3
 7m9HPV2iAGZ3UbZulcLothW7DaRbzmSUIiAQueDawVF0Q+u2xsn6reDkNemJyEJ2l3RP+ucLvOA
 rORA4HU0Ax7dv+FP1K0NCQrel5nEcfbKqFQjfJ08lJuKFfpjN+jX2wUW6UwOLKJ77/aWHbTBW2g
 oonUqsRvcg2axKhobIbTz77qZh7hKEgmW8XCJbubn8WyXTAAbuP6q68FQKH7oBdEYlR/esI0DAs
 qMCoO+AwOXk8JdAN4KyCaBHnd0EaZdUkG8sM64vRWaHERW5oij9teEt7bwSv/f5lX0NpO7SBkUS
 sXQqOL1f0CLwzlYXWaM70KAqgAPfzy+Y6aEcb0tAHBJQS81tK56bNMFSO/ZgIpCNeYBWzC7HtRq
 4CqrlzfXKaNw+X2tMrw==
X-Proofpoint-ORIG-GUID: j8BdV2tyf2c0o8ps4kvFXRBBCkC4Bw3m
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab40898 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xF3Xt6V14tk6trZ56bgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: j8BdV2tyf2c0o8ps4kvFXRBBCkC4Bw3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Invert cpu_handle_halt()'s logic to read in cpu_exec()
as "if halted, poll for async events and find work; if
no work, return". Rename as cpu_poll_while_halted().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 46b723cb734..76182803592 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -654,18 +654,18 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 }
 
 #ifndef CONFIG_USER_ONLY
-static inline bool cpu_handle_halt(CPUState *cpu)
+static bool cpu_poll_while_halted(CPUState *cpu)
 {
     const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
     bool leave_halt = tcg_ops->cpu_exec_halt(cpu);
 
     if (!leave_halt) {
-        return true;
+        return false;
     }
 
     cpu->halted = 0; /* allow execution */
 
-    return false;
+    return true;
 }
 #endif /* !CONFIG_USER_ONLY */
 
@@ -1027,7 +1027,7 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->halted) {
-        if (cpu_handle_halt(cpu)) {
+        if (!cpu_poll_while_halted(cpu)) {
             return EXCP_HALTED;
         }
         assert(!cpu->halted);
-- 
2.53.0


