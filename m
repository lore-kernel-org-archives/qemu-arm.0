Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C72C5DF89
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:49:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0KX-00026U-VZ; Thu, 20 Aug 2026 06:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0KL-0001sd-5q
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0KJ-0005vc-BZ
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:52 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K6nSTA3733042
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 n0X57WJLrSAfllLc3a+/YOYqBoRn9oR6RE40Y8FVcNQ=; b=CRmk1BdaPyRkx/v7
 5ABMLycULxjmQxF1+GwfLluUlVyWTyoo051i5/OkCX8QFlv5nDTW05HTkwFhYvr2
 PNipTzIbakthcHxatGEbkTXGX16IvKWIWrY11+fosZ5PqyPJ/bOU7gsZBN9TxHnp
 hVDoxP0vJyyKjY2K5MQhD6nGRWrS1Ma9PQD221lTz/NKGPRgxeEdlh+gXLfhFm4B
 ALVFqHdNvCUzY60ZaVu/l6evniaeVyF4U7iQcQUhyViE5Xrqq9eQB0M3uHZf40SI
 0GESukM7LsjzQ1DFHKa6I2/Wnpj7UkCFIEt811k5RwPDfjvVAtVhTKvYjBuXhOYr
 K3oXzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn88wsd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5174a236220so25462671cf.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222919; x=1787827719; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=n0X57WJLrSAfllLc3a+/YOYqBoRn9oR6RE40Y8FVcNQ=;
 b=kZvenZ9fiSv+T6zVPBl1CHWUy5o1U1UVUQ/MND9AfKUqL5gjCNkG1oQgWxPs8f0eo0
 JFRRXX/evDH64VIfC54Mz6/I0Hb9ZNFDAWfARiuFIaNVPbEy783OPxOL5WbFuKZO/d5t
 cLYR5oWXyfxppQ5MSG2k+HO83xtczkoQYdcXIomJvyHaS/4yEolbdmw2cbA/f5fUl8O9
 e8TXnBqskHrg/V/rGM223u1NKhGhIPzZw4IDL5YB/zJa+imwjEak3+MBBzgtbE6OWf9R
 sgvPjOZB6dm7H+iaf1liEtnbGUIUJowAK3uxnn2ggYb6MAtcMZOG+v8g4blqoP4UTIio
 BTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222919; x=1787827719;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=n0X57WJLrSAfllLc3a+/YOYqBoRn9oR6RE40Y8FVcNQ=;
 b=eNhb3I57p01JRLsOAzc1vzpOxS3f79owL8O45rUJLH7aUCpTE35pa6ENt2pPxpQ7TE
 K5SoNu4L5x5GccMj+erfSx7uurdSnpGn5sVrJyL5FDWgdTtIO+oMuDmJ8VILLxEu4gvV
 RHiINCvNYKAegto9H6fb5lTQlQvHxx1KNOSjoYlKmXnDTseQFZjIzs7E3agPXpYqMI33
 Oxbc4tNIT6GXsHCxy0vuJmf4E4RXWeRFmYthf/RB8ZMqHvmc8aWsY/TljtCd8HsfFLAu
 aPaF+CDq5epOoAZIbZzvYQoP6ve1GBxv1RwosgwSAR3A/D9RSe2UsbWBnhpC8v2aVzEh
 esvg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpD2bcnKDP4+Jy0VlAb+XXSu57effF4HM4gHTKSWSNkYKws9NIUVx5I91n9OWrP7zX8MN1KdSTB+Q==@nongnu.org
X-Gm-Message-State: AOJu0YwDlz6XGp/+Oh659obVshRavnUfXrjz7A225N4Fx5lOUTMHYJle
 vGuBqy0nVwbxCJKs3mBq5RMGPjIh3SexSQNtfPKAKGnQXp0e+SJK0zAPr7VX8s98scnToSa0y00
 5F1EfZ7XzgoEL+9L0Z8W24OXsIN+VJ6zxf2iPtRqOBg7q/oXgPwbx5H0=
X-Gm-Gg: AR+sD13eGmW32XojsrxgHTDlOXkBMRyf61r15hI/PEYxbErZhy62R8qEFMVVv0stmXu
 TNVYrQDqF9M+tIRGA/rNTiszvfdaco+5HQsZs2EddCb7JDwuJmP4zhPz8B+SoDcYTgftbpk7CFI
 MMahGbMDfOQ7Xf/B86bX/xcWdG0pC2KWK799xATfj1OhDGADs+iWA3OHjpjAatqnp7f6jnbEJnn
 F1ULxOyacSFF/nz3x+fC9/eaKbv8+XnFSJbHC5HYBuao+ew0GYP3CpZWjjOBOgIjda3XFzzQWp6
 nnHd8N/XJE7CGGAlv/tzIeavhyAcIE4bbaUAgKiBF5Ej7cVt2gtvgtCYo/MToygiXWFeIblq9/Z
 CJBb6g+JgFgCwWia0QnRUSwno9R/cQiz6KkNlC2m1DA==
X-Received: by 2002:ac8:7d0b:0:b0:516:e152:7a59 with SMTP id
 d75a77b69052e-52dd5e3020emr104843821cf.42.1787222918559; 
 Thu, 20 Aug 2026 03:48:38 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:516:e152:7a59 with SMTP id
 d75a77b69052e-52dd5e3020emr104843511cf.42.1787222918151; 
 Thu, 20 Aug 2026 03:48:38 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b2af1973sm16978845e9.3.2026.08.20.03.48.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC PATCH 09/13] cpus: Add const-qualified CPU environment accessors
Date: Thu, 20 Aug 2026 12:47:25 +0200
Message-ID: <20260820104730.25462-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXxHkad0gYQuKV
 nIiCQ1MRiVcH1OU713m8w7AwgO/+3Pd6CLzgUtFulhyXtNEcaBw1+PgvPqIr3tD4iseaEKCaldl
 ZLvSQmhGvGMFZLhGUGFTNhavLN63KVt4kg/HIYDc0DBwBgPB82vzzpax0/n6WHGesb77s4w6lXY
 W0Vrnwt6NZz00bUNy3rH59vjLBXysLbmv7eX/ammGz1yRYSGw9ztuxYc8KTX3LBp11Ak3E5eD2E
 onXTuweU434m5yMsmRjdoUUzRWyBqNIEpszXzkGl96cbpA6qwNPFiAU+NHeqtqGp0yb0CxIK8eZ
 Jn9bQef9w1/QUF5e8gEcYGLsQnoMEZEyBPX9YFm2V0xAXHduaTOPBflrFqf10592gfW/D8C0Uk3
 T+KiP14M3b3MFTCJn1FmaSYqSj8peDUYwX5gvF5OQdfpE6AdfWZYj100wAiH5Ldi7uBpY124tPe
 TU63cUczXBR6zR66SYg==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86db87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nWU2JzSQJiCcj08VKMEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXzCHlBHsKhYhy
 A6I5OarRGi4zq8PnPGKMAlYzog4ek6BXdbMN8Epx1BO3hWu5IOey71zrXC87/J2oDJGCpvqtqBG
 sylguqGcM+x0krf9OkYifvQOj6sGrzw=
X-Proofpoint-ORIG-GUID: CXSgKjCoruQsP6wx86JEGbtiwd541l9T
X-Proofpoint-GUID: CXSgKjCoruQsP6wx86JEGbtiwd541l9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200079
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Introduce const-qualified variants of cpu_env() and
env_archcpu(), to safely access CPU architecture
state when it should not be modified.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/exec/cpu-common.h | 11 +++++++++++
 include/hw/core/cpu.h     |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6594f7fa1be..f3a3799f451 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -79,6 +79,17 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
 }
 #endif /* CONFIG_TCG */
 
+/**
+ * env_archcpu_const(env)
+ * @env: The architecture environment (const).
+ *
+ * Return the const ArchCPU associated with the environment.
+ */
+static inline const ArchCPU *env_archcpu_const(const CPUArchState *env)
+{
+    return (const void *)env - sizeof(CPUState);
+}
+
 /**
  * env_archcpu(env)
  * @env: The architecture environment
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 81af7b9ee1a..59f777f3f15 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,6 +594,12 @@ struct CPUState {
 QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
                   sizeof(CPUState) - sizeof(CPUNegativeOffsetState));
 
+static inline const CPUArchState *cpu_env_const(const CPUState *cpu)
+{
+    /* We validate that CPUArchState follows CPUState in cpu-target.c */
+    return (const CPUArchState *)(cpu + 1);
+}
+
 static inline CPUArchState *cpu_env(CPUState *cpu)
 {
     /* We validate that CPUArchState follows CPUState in cpu-target.c */
-- 
2.53.0


