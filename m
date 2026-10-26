Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194B6606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GKJFprp2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ES7+dcD4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLOsJ-0002Nv-AP; Mon, 26 Oct 2026 13:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLOs1-000263-EO
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 13:52:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLOrz-0002vs-Ts
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 13:52:29 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69QEvvo83567423
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 17:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=2Px0aPx8t7UM+uij9z7bW4
 Tuh8rXa2BAdWWDddT8704=; b=GKJFprp2PZ5uaDX1s1jXyHgcNbLeqmg7Y3rnrZ
 SBMJ/r3LDJeru51HdRexYjope1t0LFDus3eLGFjku8D4apKOGKZYMBsf6f5h12mp
 b+hRWjjUp8/AIqSOYIDqNOaCQbSkcErjpGXLH8WJWmhmTonwwVAn1lHos03x761e
 sUKxfZQU15SnovcKDR7ORjbvczxfrSh4n2Ei1QAPf9IEVtXyhjhYw7aWucjvTGzS
 zop26Uf6ucFUq6cHWs5uTjUkHWEo2jT1B6J/f2vKaRLwI2tm8TAytNvr8cgpQseO
 UZNlYZGb/e+DlMOfz1wHbOu2S/ktuYyrOTEER5WF8Ok7+YLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y1pgd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 17:52:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93909014c85so680679385a.0
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 10:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793037144; x=1793641944; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2Px0aPx8t7UM+uij9z7bW4Tuh8rXa2BAdWWDddT8704=;
 b=ES7+dcD4Hzszd6FvyCnzVGDu7Ylh54IxlVjze/u/V8s7lk4v6V16YZVOlFkMyYx2d8
 DN97SR48P00D7dhDj7rih2f+2tEt7hFGnBLj4dvNGRbz4ChTew69Wjp5gVLQPsLQdxUv
 5CQW8Qy/60dobnWk0bJuTMTwY5JPJql32xg/5+Loefrz+VcX/MPS5MxN/XM8lm7xdbO3
 UY7yHWy3QFYhSKCWhRvRKhHPfyaAT611bknzZQJ0e4hDlpvJKEzJTAWk3CAzVJ4hrA0G
 emM5qchz/SZMsyoLj5a+3M2gmYh9RnbCoEvfxiVUDjNgbBWb2swtpnIeq2AlYh9s8G6c
 jZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793037144; x=1793641944;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2Px0aPx8t7UM+uij9z7bW4Tuh8rXa2BAdWWDddT8704=;
 b=tRlFCzPrTR7W1Nml+MMVAoSrj1R6phOjgQYXtYmOcuSyth5Xyx0NyCxaD9fo3PkIra
 OEw8cs7ZnIV3oQWUq59LCgmEd+AWSexD5RCS7IgoYh2+RqpczwgFEW8LAErjP6wkEnLZ
 rwkNi0iEqDVhbbjJUoCYDPaW99UWuMsAnWpRAx4IQioEEGS4bVNOuot9rzPJOb778kze
 33sUY8xspjSBuDX4SVu2K6taJ9b2CaMo2UIqQORH4bUMMTkmbU2uSICY9mBo4HNCO9bg
 YrMPeJGPea01U1+Kn0Mk4VinazjD3ZUCBjKPODY/+YC3CIIU5xxlHJu+z1axQvmEcHSi
 RNkQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzbIX+WQ+GkJxCoGEq9qTa8wSw/pEnNzCaiPJybexgRGI9oUirs8eD0WXek++pykY++flAE22lTXA==@nongnu.org
X-Gm-Message-State: AFq9FYLK5ZE/uhB8qyXzO/Tp5I/DKJbk2JFVnbcyVwcM08mo6e1eUMfC
 xz70vfjLOU+Lo9+K+1MlvPF5DooBqb8CLd9oEh4/1og5tBCpd2k7CyJTzCwMFi/t1GvA8Lge5ff
 ASXyC7ux+/eXNJxQOFuzDU9x5DQuZ4ni6nOwJ1eXt76LVKcnwU5eP34Q=
X-Gm-Gg: AYBFou2NCF1bVEWuNqyqvodn+JSRcXodrmWsk0dtiuUC89dbU3aDbLeNnxDMuZmv1Vw
 hmu860ba58f6t3OoOwnpeJBm0k40nZLH8AcIpBHpBXk8b5c9ZqeN8KgwnpqkraXl9/MB1weq4OF
 kCcHYKc1HgK1Fed1XLZTijUDI9QX4YjdgdKKH++AZcrjOALy8+IsLqHY83UpDbA9LPM0K7cldTu
 a9eRmbS2tVxIMtjEqYnY76a+vz2YsfiYgJNQ6uQ2ajCKYyW/ztZljWX+9EQm85YpTxGJcOI+e2c
 YJbTHj0b9A94hJerj01Xb6Raj0/fCKxwUJtYWxbxPHWas6niOTfW04AO99i2Q3zsvrcXmaVvFuk
 Np6TcgUXFLM1eQrYR4tnTILYDfjx+xYhdMaXZfuz2
X-Received: by 2002:a05:620a:1b98:b0:93f:18ba:bf78 with SMTP id
 af79cd13be357-940ef94aa26mr1123183885a.69.1793037143441; 
 Mon, 26 Oct 2026 10:52:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1b98:b0:93f:18ba:bf78 with SMTP id
 af79cd13be357-940ef94aa26mr1123178485a.69.1793037142866; 
 Mon, 26 Oct 2026 10:52:22 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd354asm16866466f8f.43.2026.10.26.10.52.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Oct 2026 10:52:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Samyuktha K <samyu@qti.qualcomm.com>,
 Sritam Paltasingh <spaltasi@qti.qualcomm.com>
Subject: [PATCH] target/arm: Initialize SMCR_EL1.EZT0 for linux-user
Date: Mon, 26 Oct 2026 18:52:20 +0100
Message-ID: <20261026175220.85545-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3MSBTYWx0ZWRfX50zx4NoN0pJ9
 mz3k+5YdrIxL1eyca1ZzvYL7tLpHYJWJA3XmbOOTGzZnk/F60OeA0Bf8DxoX6yq3YRITmznHb+I
 rWO2COn/uXoA1+71f1NbOeTejdfLPic=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf935a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XLJSLKbTjuxEe3lMcToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MSBTYWx0ZWRfX3sC2GVaKyxCf
 zl6eMXviaAh+GafQ06ZnSh6rWMZCAFdoD5LweDexe6c7lbefXDkJRmz9vwekkqpEfFYiR/NxXjv
 xnvkFtcqFTnrDQrq4jq4iNprZMdHFhQvaAEiddrVKCuv6RlMtqWAWrbCtPg+rBKIxD/Y15ltZK9
 kWrUGtlEOLPH8PZMdMb49eif1HCj4tRUOOgszJXPMtzKDZUuFSwr2ta+Nrtvj8MN13k0lDlYv5O
 Bj0IsY6nuqb0dnAi6rtDEikB0d3ouQQkQDDTxrfZjPPPP74Kso7KuI/p7nTRG4yc3Q30FFZNCAN
 jiya3rQzLP6dKCUXWmXCifDD+XLpVBZQyw835YHxzQAM+eXhDxmEVYskPYOZVZ2/TbP5m1RwZgp
 iXdpvQwy1ZAZ683f4+grGQoZFT0cvnp9iPZnvMusBhdvH3951xykE+sAXnDy8zZ7bsSUAcKOgoJ
 +rgmEV8IWsAB9IK0Jmg==
X-Proofpoint-GUID: YsbMf84OGS0OYfGOfCz-FdQdC8hUQh6v
X-Proofpoint-ORIG-GUID: YsbMf84OGS0OYfGOfCz-FdQdC8hUQh6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260071
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On SME2 systems, Linux sets SMCR_EL1.EZT0 in cpu_enable_sme2()
to allow user space to access ZT0.

linux-user already initializes SMCR_EL1.LEN and FA64 to match the
kernel's setup, but leaves EZT0 clear (see commit 3aad4bc8beb9
"target/arm: Add zt0_excp_el to DisasContext"). Set EZT0 when SME2
is present to keep the emulated EL1 state consistent with Linux.

This has no functional effect because CONFIG_USER_ONLY omits the
ZT0 trap checks.

Reported-by: Samyuktha K <samyu@qti.qualcomm.com>
Suggested-by: Sritam Paltasingh <spaltasi@qti.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 62262d742a27..851c9a81f3cb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -387,6 +387,10 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
                 env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
                                                  SMCR, FA64, 1);
             }
+            if (cpu_isar_feature(aa64_sme2, cpu)) {
+                env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
+                                                 SMCR, EZT0, 1);
+            }
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.55.0


