Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD8AC624D3
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 15:23:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1mmH-0002gw-BU; Wed, 02 Sep 2026 11:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmD-0002WQ-8o
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 11:21:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmA-0000Fo-TR
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 11:21:24 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682CRKh52001894
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 15:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +YPNLAnu1HEAYVb+feaZUL0eZ0sSfOiNmPRQjU24rs8=; b=E0R1wYBZw7yRHNTj
 z0iYW4nAYBxbStmxtH5NOl2iDX9zxcP7M+8ocutI2+iae7gXi0scsAFvMvi3hxY1
 lkr3VK1IX1AystE393oHZnC1K1vc+HxWC+lUolRLAS56FwAf0yxyyPHqCC3oX43F
 seSBprsV2vGVJegxae83m4ftHbdDzRZo+NYLfTywSKSRtlxrlm4hQ9VsExw1eQqc
 cbxCJvOk8mE2Flcqi2yzxmoi4wBpfkLEC1ot9wiD7qix2CKW98gUXAtGO6pWF7Wc
 EJcCfvpi/a4+LakL+J+qHiTdAObnAKZ8h8p8q77YmgYifdR0+qaTHVksOGEHktMT
 WlM5Vw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy1fdc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 15:21:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93903622880so444132385a.0
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788362480; x=1788967280; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+YPNLAnu1HEAYVb+feaZUL0eZ0sSfOiNmPRQjU24rs8=;
 b=hXL/ShQnX4Va95LXlgzVW8gm7PBlQcQerRJywYJnbtbAiyWJAu2gQnOhBAJIcbhghX
 X4NwwFU61O+LwqZxDKJeY/seuYDdVIGXWTfG51+70V+O4YJnJYtipt/FTidmytAWG0Eh
 +Moc7LN1+Y1jD+JmM8MokohqNI83mT9Otsedpl0EKbwRGVwb71zFMiyfmHQ3w8nFDkEe
 aW8gab9SOeA9DEplzphRocQRPEqdv/M2s2R5Au27xYu2WT6h3QYXjrUJ1w+tBbZe9iTZ
 2FS+MQmK+PzpOo8CSUxOgx7bMBlJK7oA0SYmFdpQqWYES6MJfI8J66ZJC9Xbu0/r0+tS
 2hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788362480; x=1788967280;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+YPNLAnu1HEAYVb+feaZUL0eZ0sSfOiNmPRQjU24rs8=;
 b=JRelo5oYTA/mm5oiLHBfF3B5f3TcJdnb3k774PV0KNhOfjLMdKzXsacIWNavl4bRxW
 mdD4vNGtZ2mW27mWP6ri6AmUHEw3v451+t2NNri1X+NR2ym7YzxMmGpQuWoeIX9h4/JE
 eYabOFmmfvcFy6vj9KQRUIDqxkpcukF3GzujEFcWmQUNt04sCHZ8knI535xrvb5WvDG0
 Mhl9nfvZQGZnzKh4uV1nDvK6lXSHi7ittxwKcKPm7VgDr6F5CFL/rXn019dnLT1bAPLL
 3GcbHFNhRgbQe7DiVOwgd8Evz08RLsYMaNwZT4Sus+vl0zYSktHqZqkToi//dY0HpW6D
 cxGA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoA49htw3QQCYEarlplakKCcRQjaiElVLAs5oBl5tYrCP31RGJgbPM0UEfhLdG/+9tB7V+M2PLtwg==@nongnu.org
X-Gm-Message-State: AFuF++nwvyu4zxFFh6JOJRQlam8WYqWRuuQZPFPsBpCv4WPR1mG27etT
 NP0tNzCkw77/58QVUbV/XFvZ1i7ng2trp/QThy9vo8fQzqSyipVMszEhKacmEsmmsjH+k9vnotd
 ODPwzlJznmw5oHqeGJeUs+hfh/Bw3rPVvlsA3KLfAI+kTM3aZseuCdbw=
X-Gm-Gg: AR+sD10PfZEGmumh/b+BSH8gLJuJwXZlX6RWvnylWZNMsekF0BRyOeVTK7jpuu4OzPt
 7r4oaMswIIavIBVouF4MtdKffpHyx4AqyxJNArRqiv9zgxA0VrSd9QmpPy8d17ADyeIJmOjA3Jm
 YKXIf5bc9T2pQlz9Q3XJk1GjcxEB1xqpvsJQMhfBGYGo0NFKI8CV+ZhX88XIL/oURQFLFsWHxc0
 bmdHaM9qHnTJsfJrFu+b3ypjPuhzCouxAQikdppkYxtoxhq/ZB3J97jtaJ6shcTtENeYBOlkK1F
 1ORz80u0mWwoXZFXhWMSGTMm7t0Jpo1f0LOYAdSYZUy0FIU0noO7hz+dt3JkfwX/8Q3aHzCwbzB
 q2ThzJ7jhNbvNp0/S3uJgsggnlQrF8sw6yiJ9jatx
X-Received: by 2002:a05:620a:4553:b0:939:3f4f:7254 with SMTP id
 af79cd13be357-93965bfbc2fmr430856885a.14.1788362479986; 
 Wed, 02 Sep 2026 08:21:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:939:3f4f:7254 with SMTP id
 af79cd13be357-93965bfbc2fmr430843185a.14.1788362479299; 
 Wed, 02 Sep 2026 08:21:19 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce591f846sm26874605e9.1.2026.09.02.08.21.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Sep 2026 08:21:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 04/11] accel/tcg: Document cpu_exec_interrupt() callback
 contract
Date: Wed,  2 Sep 2026 17:20:35 +0200
Message-ID: <20260902152044.31291-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902152044.31291-1-philmd@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a983ef0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SWPfrzv3WwVL6hwBn9sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3RsTjKtubpM1EwsSRSfKrxeqlIjCjycv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX/3zQEVeusFRk
 jCgHt0pHEPUD4A63J/xwOfYMnhuCCJMkyX4mZyl2swfqNghA+09VX6uBrscZd06W9HHCxUA8InL
 Vp5ebfHI6LNET4JzZ5wBCI/vXHIA7pE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX7ii6zqSqi+rl
 Rw3IZIRsujGmgUdg4MdvbOQfMT/8VerBRFESTKlTGz0Z3w/5pjX/J424BQ0kfSU3c/ArFU3ykpV
 /4Jr4v84Rd9Ns/RC991lWET4x1HgP+uyaWU0Ap5uFR/uQdFqehn+vv58khW9dG4YJ12uUpnZTHk
 wPS8F9ceWT/5xMVQNV8D/yFoFcX38HOmn1sR42JgnUFqhFqIZVQM9mb9JDbD6qDoErN5zUifDRT
 I5VPZFojn2pd3c1rDRWyibdWuUwgjkMt1/5mi0eaO0QdjFSAJHuo6nEQzt1ARtJHNMiIaXNAc0U
 k8uuWKCcTI4O/WE5K1uhBI7+WChXtN9J2fXavjFVdDmZx4KHAFmpdyq1p2YX4mhoAECLwUShAy0
 kqxkXhOw9AE3OdVbMLzSAKVRGeS8PxlXPOimfFtofg7mhjpRKXXQcGMD3KHmVeLdyeHhHvof8eJ
 qHfLtPR9PGqCUI1265w==
X-Proofpoint-ORIG-GUID: 3RsTjKtubpM1EwsSRSfKrxeqlIjCjycv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020135
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Expand docstring to clarify that @interrupt_request is a bitmask,
the handler is called with BQL held, and document the return value
semantics. Fix typo in arm_cpu_exec_interrupt() documentation
(s/inrerrupt/interrupt).

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/accel/tcg/cpu-ops.h | 15 ++++++++++++++-
 target/arm/internals.h      |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index ded7cc700df..87850402203 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -171,8 +171,21 @@ struct TCGCPUOps {
 #else
     /** @do_interrupt: Callback for interrupt handling.  */
     void (*do_interrupt)(CPUState *cpu);
-    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
+
+    /**
+     * @cpu_exec_interrupt: Callback for processing target-specific interrupts
+     * @cpu: cpu context
+     * @interrupt_request: Bitmask of pending interrupts
+     *
+     * Called from cpu_handle_interrupt() with the BQL held. Process the
+     * pending interrupt according to the target specific @interrupt_request
+     * masking rules.
+     *
+     * Returns: %true if an interrupt was processed and the next TB should
+     * be restarted, %false to continue normal execution.
+     */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
+
     /** @cpu_exec_reset: Callback for reset in cpu_exec.  */
     void (*cpu_exec_reset)(CPUState *cpu);
     /**
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1775835ad50..551a6b4a872 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1248,7 +1248,7 @@ static inline const char *aarch32_mode_name(uint32_t psr)
 }
 
 /**
- * arm_cpu_exec_interrupt(): Implementation of the cpu_exec_inrerrupt hook.
+ * arm_cpu_exec_interrupt(): Implementation of the cpu_exec_interrupt hook.
  */
 bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 
-- 
2.53.0


