Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF45C5B572
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wua1B-0004A4-Q7; Thu, 13 Aug 2026 14:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua10-0003aL-JB
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0y-0002IQ-HN
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:53 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFqu6I3180967
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iZ4CQeHz0iJrXPv/eT7hao6uyv4DFIFygNCZO9k79Qg=; b=Zf/LpJWyOil0GNtz
 GRXsvvUH9b6DPhWH8Su/QEP2fUsUChulGo7bBXRQ9026kAMnrHuvNj6t6MI+Jb1w
 21zVNxSX8kjkWRW3IRFRzP4cvXZukRrrWAosh/pYdmlMxbZhc0Zzi3nzkW+zOD9A
 hG6/U5SXBpzBIT7Y3ibo5Ptz4e1NKViVUTJZ2bKTPE7NLKqXMOTZbnhQXDcfBxXE
 cbAEdqtFP5o7jecRctFwW08J9etnwAoi3Hz7xSEWJYO813aQPbbmImIb8r7fPRiq
 mwa7KRf8kumLiH96qsR2ojg9YoehPXV74ib8m/t7kR7YfRXxnn2G+8RfHpQj1EJ0
 Ts6P1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4rp56-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:18:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9349c5af52bso34569485a.0
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645121; x=1787249921; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iZ4CQeHz0iJrXPv/eT7hao6uyv4DFIFygNCZO9k79Qg=;
 b=A/kfqCiQG17Df5qSKj/WTbiYSb45+EF4RhqECtaJgGHOk+JxAZtNHZn1rgySUXAaLM
 xf7QXxXoAS+xzCsEDBuO5cklMGDaBqct8llLAfKpGnQoQdAYbkTQNs8U8a2gQ/ur4qTk
 xtrbTlCCndwdx3dYzVwd8Hyf0Q7TuCSWXaTHfJAfXuH87Q3Iz/ofHNwQ144XVum5c40v
 ulVXaUJmsszezCEYfe7zaHzJDuDagfEMf7/F9wCaleg4cgedxGXmCcLWOE/sG6Xg4+Pm
 Hjb0SWnq7h9KrmInZO0JEE0ntnuoBUxhxk1iy+6NNcvUVrLDkiTllp5Upr/xNqRSjeGZ
 KIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645121; x=1787249921;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iZ4CQeHz0iJrXPv/eT7hao6uyv4DFIFygNCZO9k79Qg=;
 b=JNziFSjIBmHwAamUX7UbJggjapLurs3KgjIruEXuvrU/Lh16vz0rEHajqA4UCTM4KK
 hS4JWoDURInsVVUpIjrCtaZqfOVVWM+2hihMABlqrX9aNvr3jekiwF8Lahgsni1ps3oY
 kKXjrT0b9dQee4aqShcTWIgxLwon1yuUq21bLftP8alhxmZ+SYBWyt/b0VNgSiVWmtmU
 7SZ2dCwXPYEuEXVyNqLy+hqsvPBoyaq9y2yWyVuNkjYAx8JObaQ/O1PE8xEN9tsR6Btm
 XG1DWrlnzRgVDHnBYy+NJyqPWq+fbdv3iowHg4dU5mJSh/OZr4rpbjPsLWv/LwJ7xM72
 geyw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpV3eplMVjOYGWuxTmBfWk0RW9QJeAbaZXUEsi+bhRmFclZ0gBW8fZoHKx4I1qFZ9/VCrsQ9hl8hg==@nongnu.org
X-Gm-Message-State: AOJu0YwTJYBmeMWvNd96vcz0h2QITGE76VtRxJ05Wa2G6EVhgd4BsvYC
 +UNOX2syoOONck85GYf07PWGrzTzxty81UARw8+iVVaKlkkcC9cEkwgFcF/VDgr/8JWLXtM+lcH
 +DtXaFLd+pfP9WAab7OSigOwlQ8JuA1mruTeXgbLkpsEBkIvDDeCpR9U=
X-Gm-Gg: AR+sD13VQWkTd5jkD2wpqRGzVxKoaO8lYv6tSNIdUmlaoY9OfZWUEPOdm+W5HilpSwY
 7CnJmEQdn0pAKnzu2rjrCy8GD7SGLNJ2MXZXR/N9jI2qMAkJ8iIBqUuiMhucY21GntKiQUDnfDO
 3Etqj1Pw65wYTA17WhGryIVTlBPtuOsb7A3GmjhpfdQmaEggLJuYDprMuYn44tu4pCqTgcd6UhZ
 QoXEsDT1RBJ0Khf/3lOtqsVk92XadpsTXVwp9olLUuh8eVoEfAI3KuvUhfdnjPDqV9+s3WlCxl4
 enxExdxxvjidJhfYuWQ3IlUfPqQyd6z1+xSpGMKO/jORdSuHPQxg1TnaI6KNLOR0EG+oKHowez9
 Gtxjq5JIpK8z0wy/lPDsNt2OOhW0hO/jfSP//q8L5KQ==
X-Received: by 2002:ac8:588d:0:b0:51c:103:fb56 with SMTP id
 d75a77b69052e-52d73c6fae8mr83157571cf.15.1786645120788; 
 Thu, 13 Aug 2026 11:18:40 -0700 (PDT)
X-Received: by 2002:ac8:588d:0:b0:51c:103:fb56 with SMTP id
 d75a77b69052e-52d73c6fae8mr83156831cf.15.1786645120303; 
 Thu, 13 Aug 2026 11:18:40 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49982129643sm73839635e9.4.2026.08.13.11.18.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>
Subject: [PATCH 16/16] target/arm/whpx: Fix argument order typo in memory
 access error message
Date: Thu, 13 Aug 2026 20:16:39 +0200
Message-ID: <20260813181640.6537-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RSGbO4iWCnJpbluLiixxjkiX1s39AHlg
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7e0a81 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=sWKEhP36mHoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=CJsRysG5a4fyhNKOOSkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX5HY9B3Cjro4B
 634VElfbh02zNJnyEKTsgJx6rsCDIQjpP2ktgPZSy79Cfh2Y59k+SHovSiGNdHU9LaEWwISIr29
 DPveJkPCUQN2hbdlYwGWNz0A0rQ0V7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX3aR2RgLA6PAY
 TCscbBymwP5/5EVc08wFspFogbhAuo0b9i4v06ao5IZ/icIYmriAFZwH85KXzZQykzsaDe/0lNx
 Jes10y8r4fFHIeAnm7UJUBn3p5Kztj++6QpR3NZ/yLnbu+CESmMm98YIgr6gVenzYc02oLm1qx9
 hrCpYB5x+0OHcamCRi/J9WiBwdnDuAMloy6Kb3BkxowMriVsZ3D5euLfaJtXCgtM6PugEnq45Gm
 IOyqLIFjucS3aMFfLkd57ElN2SI7s5pMTVn4sDVyppFFUJmtLRKQpuCschtiadOAFE9FHcqZXWV
 yATC5mD984SU+59TpEBXs7+/MofzOuf9cJGueuki16HJQkkApE0rb9QPH+tWyslOJkJF0G+FARA
 +INx92RHoDY9Rd7GmwTXgYDHqaHrFiajvS79CZ1hl8AbADfymMDrVPdtZGpm+VtFd/KT8lzTQA+
 shmM+rgBP+xGveWym6A==
X-Proofpoint-GUID: RSGbO4iWCnJpbluLiixxjkiX1s39AHlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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

The format string expects "Gva = ... Gpa = ..." but we provide
these addresses swapped, causing confusing misaligned debug output.
Re-order by swapping back.

Fixes: 59432082cef ("whpx: add arm64 support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/whpx/whpx-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 5e4c25bb7d5..e59580d54ee 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -442,8 +442,8 @@ int whpx_vcpu_run(CPUState *cpu)
                 error_report("WHPX: cached access to unmapped memory"
                 "Pc = 0x%llx Gva = 0x%llx Gpa = 0x%llx",
                 vcpu->exit_ctx.MemoryAccess.Header.Pc,
-                vcpu->exit_ctx.MemoryAccess.Gpa,
-                vcpu->exit_ctx.MemoryAccess.Gva);
+                vcpu->exit_ctx.MemoryAccess.Gva,
+                vcpu->exit_ctx.MemoryAccess.Gpa);
                 break;
             }
 
-- 
2.53.0


