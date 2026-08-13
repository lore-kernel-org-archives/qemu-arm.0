Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2313CC5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:21:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wua13-0003p1-7Z; Thu, 13 Aug 2026 14:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0Z-0002wA-K6
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0X-0002F9-CX
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:26 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFqwMU3181331
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JzbDkxS3itZNpjD41FPb0w8HQM5ewTacpZ4P5EQ4taQ=; b=oUWs89iLelCmwkJ/
 Mvy/9ND+MihY70Nc6KbUpVGUUH9SZanld6qEdOQpJfUiGQtpvgJXsY97kAahP9U7
 T3WWqw1+UizKvIh2yYs2Iws+/BuiD9XBdPi+afda9TrNUZB4e+YkX0oNIgwHNW77
 mS7javzGCJevOC5tK8v9B5UrBBHwlYwcWC91pEqAhoxGROveyGYnuXZWuajxpKVv
 +2HCK70OJSYgWWC/3W9/XpardUkR7hPmgN51vo+Ve24lW2eWHPFSpGdX7x9zHy9W
 RGQq8tm2/ultltdt5+qNZghqsn4uQq5TjqTqjHaYGC2iE6+yHoavzZYsM7B5p+ME
 T2CBkw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4rp11-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:18:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c0408254aso20257051cf.0
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645092; x=1787249892; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JzbDkxS3itZNpjD41FPb0w8HQM5ewTacpZ4P5EQ4taQ=;
 b=I356tQL0w+kbKO67ti6UcLoNFw2rQLRnCzntcbhxVRZn9shqwLqe5hcttwYdiJoOS7
 +fhQJ8eHUMEDSPgmelJj3mgzXyCTdpfy+YP0xKrG6vKjZHdR4AYVpiqmSNR2k5TEz+pn
 e8itEbHQ1tlgJ7T9OJ014/6RYGU7RTy7kfQjNqnv/B/koJ/rL4wHknhDu+svyOAcQbrF
 eahnOLY3PPq2r5qTULRMgwVFulwReuMCI81I+byKv7QpfyGJlEurbDlBoe1M9EvbYnif
 7njbX6bva8bR59haDTqo0b1or5w5pORMeOgiEUCmg0rk1BLrm6G48YaxE98cNA7acLWU
 6Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645092; x=1787249892;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JzbDkxS3itZNpjD41FPb0w8HQM5ewTacpZ4P5EQ4taQ=;
 b=TMIxJTuzVwp0WOJlyXSGqNKEseDpXWFWL/DFyNyAIWwqa9zgoQ7CGj4zZH9kivq9fE
 hI6tWOJahGe/Dt5JXuhNQsphWh9Af8mFjKULfK6lbN4EVj1gQ98K8BZ5RuF+Ggk7d3Ze
 rLGN29WYBs4zDOqX4tsAuFqz6F6H2CUhji+wKVe3qiyIzi6Jj3HL3hZ9RazHI9pmeayV
 4Kameoszz8+glPFw6uEnttZcUVJ3nOlPEpM+EAHX78MJT4y3k8ktJo745bMFbXpAraS4
 sYKPN7aCFKqQANkadDRv5WqqP675QnbpsEviQgpQt9WTCorghmjU5INVD+0FXVS4ZEQ9
 RVag==
X-Forwarded-Encrypted: i=1;
 AHgh+RomxwMj6Utc8lNqmFp2tCRnI1576uvB57n3IOLEzyauzdy4elVzp+5kf2KrK5pXl+ywEDSwqWz1hw==@nongnu.org
X-Gm-Message-State: AOJu0YztyitV8xlVo1Mw+pbiyKdG/5eWwsKmDrwXDPe5V0fSnKDsz5q2
 GXSiCsBWCu9/+1UjRMxwccA/VhGRlXhoIR6s1q1jBWLdArGwc8lJ4CDJluEuBgPw9UkZWFAyI1+
 o5HeiNnFqg6XQ2xTBSMHN4HpeWS9gs5cxm3NlzkqK5b9FUOYZyhAxqMA=
X-Gm-Gg: AR+sD12fGQFDviheGLdsSF+iBW5t1Mtaj2pziFePJrI/FURWBCT5wATJNrGM0VAV1P+
 2XRN4pwIgtuU6t/1vt/2DnUe5Y2S2xBnM1M8ZWVbQdwBjOuP5pnx+XtCuPzw5Zh5Tmws5JWPnZD
 KorCluXfZizSXz8THDYCpAE3ScCnW4s9N/fZgNRGxbMNVL/q3Q6jLORxFJD0L6c3X5PX4TBu9CH
 IuP3J9+YTAKiUT0gZPVP8J61hW21bE0hsCMRQd0tOuCwKrd2aOOYPMKJXw7h8JkMtumMo4S8Xci
 1cofrKAEWkjjKjFRGYTtXmgwmn09TxFaYxf9ZTHGrj+RuTrsX/UJB72dS0JB4tcd396NiY4JiYJ
 vVU71wT8pwu35LxiF9ofHj5EIgUpnBRDd4XFrgA/eYg==
X-Received: by 2002:a05:622a:5812:b0:527:7756:3ee9 with SMTP id
 d75a77b69052e-52d748bf7c0mr76995991cf.0.1786645091504; 
 Thu, 13 Aug 2026 11:18:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5812:b0:527:7756:3ee9 with SMTP id
 d75a77b69052e-52d748bf7c0mr76995381cf.0.1786645091089; 
 Thu, 13 Aug 2026 11:18:11 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f1fff25sm1953402f8f.3.2026.08.13.11.18.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:10 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 12/16] target/arm/hvf: Move flush_cpu_state() into the inner
 vCPU loop
Date: Thu, 13 Aug 2026 20:16:35 +0200
Message-ID: <20260813181640.6537-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IpcoyRsfrLeU-gxJlco6ItA9wHXySVr3
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7e0a64 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xMUYw9VpK-qeDZ3ugSsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXzLydFiheTwJB
 JYHTK690KAF11QSwgGkNUVALRMJFBRk2l655QfQy6jdk4y7q9Y84cAvucvq27s2ZkZRCdXq/U4X
 gu4u6JuMZTkD87TI5o+qBWRPuyfEEzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXxAQchRiy80UP
 uEvw3CLPXfDewhyyztFD0lXp2eC6+Q9iLAcNRaDvdqB6IAcVK/hRpYtAgjQ5DijufQsECwa0Tsb
 9atEdloEOMo/EnMLLMQsn3k1qJl6xnP6FabrBrFjmMcjZUZylxNYkS9HuIUvI1Qm+KHpONZQkLA
 13raV2mtCO7oZJIXdA/UyQYJwxJlOFnz5TBJBkVBrpnCzf5eFIAtPYye4qA9JG3zVTP8a5MJd+m
 N4o1YVFnCkuQvaECOuPoL8AMAEn4LHg2/xo+fQYC4ifGQkX8HkHhc30Jn7nWXp2MmrQ3xzAWUMB
 361oK3c5+z2d8bkbl8aO/ug08M7H9zeWCGMvSXiEpSRLk6dM5+bsb9QwiG6UVq6k+8BXp8rXHrw
 1OPW3+6lME31beDeHL0giYfpS024RKVy2vfSmRq/QQBy5gTY0tbEjZkqEhobdQv6Pp8nxdofIKW
 JH/pzOGD8HpAIdRTA3Q==
X-Proofpoint-GUID: IpcoyRsfrLeU-gxJlco6ItA9wHXySVr3
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

To ensure the vCPU state is flushed on each inner loop iteration,
move the flush_cpu_state() inside it, right after the interrupt
injection check (catching any interrupt changes from previous loop).

Since flush_cpu_state() uses CPUState::vcpu_dirty field as a lazy
synchronization mechanism, there is no performance penalty if the
cache is clean.

This got missed while refactoring the inner loop in commit 93ac76507.

Fixes: 93ac765076a ("target/arm/hvf: Keep calling hv_vcpu_run() in loop")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 3eeb9f70de4..c14ea54a67f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2598,8 +2598,6 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         }
     }
 
-    flush_cpu_state(cpu);
-
     /* Inner vCPU loop */
     do {
         if (!(cpu->singlestep_flags & SSTEP_NOIRQ) &&
@@ -2607,6 +2605,8 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
             return EXCP_INTERRUPT;
         }
 
+        flush_cpu_state(cpu);
+
         bql_unlock();
         cpu_exec_start(cpu);
         r = hv_vcpu_run(cpu->accel->fd);
-- 
2.53.0


