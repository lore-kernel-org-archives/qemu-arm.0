Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E66C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9B2-0007US-Bn; Thu, 20 Aug 2026 16:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9Ar-0007Bd-F8
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9Ao-0002ju-W6
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:41 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK87XQ808823
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=; b=E0GZc+gJszC2ZA8t
 6i1yAjDOHPQf7Ezv3GJdsqJsIpwjx1eLyZjONKxIWDfvmPa8lCHMJ65a7K5q0Hlx
 SGgKyPhWMuiFKJNTYcLus/xvHFDmrEBnHt1Lj3c4alc0zmIkMIDWXQaGT12rShCb
 oX54p2EXW2hGMX0FGPXzXoEpNCMsI+8r5l47FV5y1j/OC09SCy9chTfcjx8mFHPv
 7juvCV6MJkN8aFq1CPQSbCyd0J4T227Pd2o3ucY1EU72SALpDcigTXqPXGiRgZ6a
 ynEEfOhfinuJRntmXKCUS4YB6n6LwO4MoE3k72RbXHmCXoiOVpGm4JL+SmQhYQp3
 ZyYrzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb39r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52d28f8737eso3819851cf.2
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256926; x=1787861726; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=DfVB1eRTJNuR1k1pb4YFnQ9ptJmVvqRjnhmF72uA7XWjJ3KkAwq7gBe560krTKkR+F
 FMxCLp25+dJYKYEcO7HpWG+6fZ+r6oSzudW43d/9mfBdv430cLfMBuumTQUqpO8bfoL/
 3MdU1nP1naARtJ47Yd5dTIYEXxPOroO0M6XYMGWFE7Easifjh0zpZ7MOgeKTItOQMWZg
 D1YV+3A2Y8KSN8AHu7er20R86+QJwzKlOBDW9XcqwQDnHTZc+X/RP6lcRLxK74vDQ9h2
 rHV5OV/5+tL/fwagbYapIk4/pkdfZZfDO58bsqFWUhS7bWOywEkdV3BmEENE2O/AS0wO
 xXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256926; x=1787861726;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=a0VpAK6OIFWqv3/7gfUaYuAkGYGjvPnOfWPK2FtoIvHKLrpctSPyYsb+kABSJOHdqS
 BvNtklswiWR0xtINZFbs2R2cqxBSHFkY72VYAdUPC/v+HNYDsD2CSBtwwdGf5PkSoIrV
 QyrinwydBvZQhQ5lBvpsSHBkH0nQ4WoZe+AzoWre9PRV7hTj9v+GZFZkdOewDWn0kARL
 1CorctY3N5oxY3Hl9QGQruv8vicfDvFaiJZCUYw0nof/eeLEjuCzjAbJfGBt2YkOg1EF
 +0BU5hHXvD5bEDKcD9SMcHYsv6E6Vhf+ZM4gbSAZ7VkCEDZE989kjfFM2VqFvDd7JsIV
 saWQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrIrh/tOH0MN5mZzwCi/84YrRmBGNmTi4M3OuPgBrif2j27Pz7q9zCE86QXyk/IFX8UCFLaPJBbgg==@nongnu.org
X-Gm-Message-State: AOJu0YyvU/CaiMkqtJHNnZ2efFi6JHcdMTNvjEMVYdoUkiJYcFG7BT9A
 gV2NexRsgh6RLG64bJDFbqJtSx6Fj/hq7JmRz3nuIaqBvjHtpg6iodfWh/7rjPLxoe9MbOAdXJN
 JVtaCiEOwVF4++G9qxbGcWpMRSuw4nfitvVSlFTNw2C1cQ8oZmNzdKxA=
X-Gm-Gg: AR+sD11synI2ApuxudOz4jI2TWdSA5lY8DvktZs+217xwWtk2pbLqw6iyQwAznlVJYj
 CeUMeb8uzjvCq39lcs+B4f97uHlFIBFsqafgrLumwHb8/U5lZEUGEoNaDRLaZXzMhD7aGIRVAF6
 Y3HyNum7QfM+ON+on27L8q4ICJq5vVrddMaH/yfhTf4Kg06SI8WS5ipeHpReZ5Iz+TNOSn2HYK8
 nnfCxtAmbTDEwXWgchQ4taRXL5OBX4QyNUgz1fZd5v2XSFCyJiNB52duVhuxWSnxpVJ8+87HNPs
 B1aOerCrROVZN7HIxGj16UWDKYZLNfAXbf5T4WtqkM1oEFG2bgiTy9kOn6eDjEsnsuMPv1DRRjB
 6O7FgvtyJ+Sijsckm76oMLUKvoZxfL0xOfU+RiZfN+g==
X-Received: by 2002:a05:622a:118d:b0:52d:9a3f:85bc with SMTP id
 d75a77b69052e-52df571351dmr9555321cf.18.1787256925950; 
 Thu, 20 Aug 2026 13:15:25 -0700 (PDT)
X-Received: by 2002:a05:622a:118d:b0:52d:9a3f:85bc with SMTP id
 d75a77b69052e-52df571351dmr9554451cf.18.1787256925371; 
 Thu, 20 Aug 2026 13:15:25 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90e7e20sm3822715e9.5.2026.08.20.13.15.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v2 11/15] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
Date: Thu, 20 Aug 2026 22:13:51 +0200
Message-ID: <20260820201356.29775-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a87605f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jT2gSQyrDJQT47pg5XKqNRHRtY5sVQfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX9BDFskcekmMm
 OjyljdRbijRlQoyiu4o51r6p1pDDHLxJn+SI+alCObTS6KmMp3R7zaU6mx+Wr6unAhJWxapLQMU
 6Ax6LzvxUgMjeEBC9t7Ks1iIVTrqJQnkQC172FSo0wGsBEKdxXMTZYOo8nRYnJvGCw/d5ynuUuf
 Q2JIr5Vlu+dnuz4hjHgGAbKmigxte0VHhtnEL1PHVhVJsaehNR1TD1Hhh5a2vTQaVEq4dhlSw4F
 jyReTmC4hUUyYfbel0olBFDwmwlWa+ux2JNoTGRPbh79cuiQVWLhDC+YMrTSYmAyDTxdCd5E3so
 bY+gU07L089xRpjnVpKLxIQRpxWyGNfVkAwok20qnAl+U1PaDG7KW6sKlB6ujlnKyg8X8sg4ABo
 Dq+x6iliWqb33ctwUE+NME2HcEcgM+kyL9/r+dG1JzdixbdwHjQnKx2BTApkSdkK8pVbMly6ESm
 LgmhU2j8s0VYYyt/dbA==
X-Proofpoint-GUID: jT2gSQyrDJQT47pg5XKqNRHRtY5sVQfr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXwCnQkEoZDqYG
 klwdc7RRAcsNKuI23OMI7UdbwdlB62V8TmKRKAv5d6NkGXgD9IAgYArnQ2t9d6/FanwkWES2gO+
 7yOJeFIVaQYi8YjnrQnqR5wDMvOJyDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
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

Add the const qualifier to CPUSPARCState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/sparc/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5f583ed9de2..31a16c2af03 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -680,28 +680,28 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 
 #if defined (TARGET_SPARC64)
-static inline int cpu_has_hypervisor(CPUSPARCState *env1)
+static inline int cpu_has_hypervisor(const CPUSPARCState *env1)
 {
     return env1->def.features & CPU_FEATURE_HYPV;
 }
 
-static inline int cpu_hypervisor_mode(CPUSPARCState *env1)
+static inline int cpu_hypervisor_mode(const CPUSPARCState *env1)
 {
     return cpu_has_hypervisor(env1) && (env1->hpstate & HS_PRIV);
 }
 
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->pstate & PS_PRIV;
 }
 #else
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->psrs;
 }
 #endif
 
-static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
+static inline int cpu_interrupts_enabled(const CPUSPARCState *env1)
 {
 #if !defined (TARGET_SPARC64)
     if (env1->psret != 0)
@@ -715,7 +715,7 @@ static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
     return 0;
 }
 
-static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
+static inline int cpu_pil_allowed(const CPUSPARCState *env1, int pil)
 {
 #if !defined(TARGET_SPARC64)
     /* level 15 is non-maskable on sparc v8 */
-- 
2.53.0


