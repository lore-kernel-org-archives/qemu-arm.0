Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450E1CA5FCF
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:51:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBySZ-0002Zj-IC; Wed, 30 Sep 2026 13:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByS1-0001yg-BP
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRz-0001YG-Sp
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:41 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHfCUt4014120
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Tg+6JGrg8TlSUod8NUCzwBY6Ua5KjOcrJARbt2DJV6I=; b=Ios2Xbe0fFGXybAW
 dfwho+AXJg+iEMPtZv531n9bOnPKB39wiGQGoHIvOrp3iBDG8PNnVltC/AGV8fRw
 lVuj8kfgymSTQvJvoB4xPp5dFpx0KkLl95a5tcANYlAqJY2uLAoJ1++gayBxZlOx
 SYrpZuYqy6cRUjZOCxw8hwUK4hsB2b6lhik/3fjNvPFtTBL81WNd222EbUP0wvnq
 2qkPKnd6y6peu+c9+G4dW8TA15spL0Nesoej+WTJg5NGr8yjhDcia8jau6HUYmFl
 aP6O3nzfdLGHx20VRSysioLj3CSpad+RmYL9OAQa68Fmmetjeepwq+dfX7ToKSaU
 GX3spg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27jtb9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7be93024717so545868137.2
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790638; x=1791395438; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Tg+6JGrg8TlSUod8NUCzwBY6Ua5KjOcrJARbt2DJV6I=;
 b=hxR99tugjG9Vp4BUd4z73K1qW/gGOFcZJCMUown5+xyN/0CmG8Yz3cd5JRbsmHnsLY
 aCPLg6FKRNZNq3yVwVm2VyjJDAGPMdkmunkVUBZS18cVaAH0pvFN9bgjx2P3s3ylbNLj
 Z97cu2fF1OME13bBF6agNirAq7kvYF3OiHUogbESNUICVOPkapDKPbhxiKNVwlJqB1PJ
 JHTLP4VSDYXD+4eK5Us1XYeV4D4z85peIu6YMQ3UUI6nB8yv9Kk+8EI29XgfDCJ6Td3r
 wE56/LX84XRCW+rwyHBGsmhKkVNyaLpcXlEsJ8ooqzIYgjFVwMy+9EOzaBZeiQJ40vpq
 d3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790638; x=1791395438;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Tg+6JGrg8TlSUod8NUCzwBY6Ua5KjOcrJARbt2DJV6I=;
 b=tH8vNvM2QUTcpMzWMiz26IMs6kOk54Tb3DLB5yV9845O5Q917dbJoV1n65d9hhVVce
 ZfbS5X1bZxy1U4bbQiG6ehEcQRno4u9OePj2t8ECk5qLHZyZm+nFDJIGGZ+N4ByX0xkK
 eqxy9RkVnqPtgYv6IgiXYGMWn3gBINJ6nAf42Fii/G++MnQb+S4z3qlkXLUjK2QE40+X
 UrC3P4lVSuOtMgEbgIYsEkK3d4fUG6vUVICWjLN+USCwh7tw+Ej0An10ofbIeAhzKqrh
 CuxN2s/n/6IIDbcoydI8dXCbGVpU6xhHk8CQYph4i0kP14LOn+oTrDjnv3FAwEMuQbrv
 31Ew==
X-Forwarded-Encrypted: i=1;
 AKwUvBzM7rqfW/hp2ekjcwvZDujMhb6pHuyiul80maA96pqQkRXsvwV9Ib1qa2hu8DwLhrqo7Fzq+TfZLg==@nongnu.org
X-Gm-Message-State: AFq9FYKpRt2wAbH52yci0eKhjQD8DD7huUZKzeijVkBXW7Apzypli+Cv
 FgM0kQKPkaJf3npVqsoinqQvMxecOc6NqPCEsCGRokR3m2kifJ7GzcjlOyNDkIqsSyYopHdlhqO
 IAJJKyRm3j43WZOnMGLOb0bI3Ns/YGY6MwD7/zNh7hvXWOTYHHf+xXds=
X-Gm-Gg: AYBFou3U1rePHYx3u94QKmfnOKKH+xluLj68ipo47tWgYOBmqHLVpU1L0d7gPBWL6vE
 gLbnFwzgNLt8mMeNdu/ifGNH1UR2lJaMfWwWaHym6SnJ59SnK5PC192J2zE0ox4cYrZq1hjQOc2
 7KwJDijsjTZ/ik82hbBJOBcwSNGgDxqE5rJ3vHs6sEZJeu5AVONeb9XvcllvxAKopWMvPUbmmBs
 uK6g07ZaWO5dP2FVNozEAT4cXWiUJErSk85Pvg7hj8Di3XI4wyiJ+ZGX14R0GY8U0QMTOm3TM4Q
 tt96afEaGPvMVkENHxrIJYVVMp9OK1gR7yJPvjZVXZ420Aba8OA25DPx/Ydmi2U+GFn6lYFPzX1
 IroU8CX3t+SzmAQk0/T9RSVjCQbzxnL7NoVqSkOyo
X-Received: by 2002:a67:e7c6:0:b0:7a1:84bd:7f50 with SMTP id
 ada2fe7eead31-7be61e90ccfmr698161137.1.1790790638189; 
 Wed, 30 Sep 2026 10:50:38 -0700 (PDT)
X-Received: by 2002:a67:e7c6:0:b0:7a1:84bd:7f50 with SMTP id
 ada2fe7eead31-7be61e90ccfmr698152137.1.1790790637730; 
 Wed, 30 Sep 2026 10:50:37 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068bcb8fsm679369f8f.1.2026.09.30.10.50.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:50:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 7/9] target/i386: Use generic halt transition handlers
Date: Wed, 30 Sep 2026 19:49:43 +0200
Message-ID: <20260930174946.82195-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174946.82195-1-philmd@oss.qualcomm.com>
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfXylkdsJxMsQ1w
 w+oMAGvVBp0htK4JdJI4Guvg33Cil3CnBVWFr1bAyZltcIp7S+zrvzvYYzsD93E6NiW+4q3/KFK
 iY+GIl3Q9l9maowZ4Nmzl2l4gESHMOs=
X-Proofpoint-GUID: -biwlGg3PKhdzJ-M-omSbq_qKRCl6SQI
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd4bee cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xWu8-Agft_6X_INOG6MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfXw848rk2wt1mU
 uxG6t3cZI8r8pkH3DZfIpDRscyLSBcBba5xQ9kwzpbeJNyCttMFsXXsIZTpJNVvNfVuPndkpaK3
 rDqQENu6gentBBaotTBa2IlJGHYgoxh0QtUkANfipAbyK5tFXyt1lSOe15bYaaVHOyOYBHf4/zz
 Hi0C1b8WjacwbqreKs02no3sqJgnaIerRyj6/AOHn01cbg43+Ztu8i4m/H29GHPSIccknaMqwqg
 tRbkmWigpTOHc+bG5Rci+VihC9iVq7/yLLnG3lJGOREjXRPvbNGCPEUIH/rNGN5Dc+/aDsLPhbc
 83jNQ0I61TqRXPKWzaKz9zrMEUO+tMBvhkFdvsbha0z0Uo4YQ7u1YbSXwhZGRE3T3vhZbAgxlG9
 ad3tNBbwIT4fPBsxmCS7rYv/J7d1dIZD+oRmp2KyVUVmlTQcCbaQU/kxpcxowrv/2cgTvD6znYx
 Pu+1/CzB4MAjvyC1N4g==
X-Proofpoint-ORIG-GUID: -biwlGg3PKhdzJ-M-omSbq_qKRCl6SQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300071
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

Register x86_cpu_poll_during_halt() and x86_cpu_leaving_halt()
with the generic TCG halt flow. Remove the target-specific
x86_cpu_exec_halt() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 -
 target/i386/tcg/system/seg_helper.c | 11 -----------
 target/i386/tcg/tcg-cpu.c           |  3 ++-
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 96accb30a80..4d543556a9f 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -38,7 +38,6 @@
 void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
 void x86_cpu_poll_during_halt(CPUState *cpu);
-bool x86_cpu_exec_halt(CPUState *cpu);
 void x86_cpu_leaving_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 566b3d4d80c..e24d01000ad 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -157,17 +157,6 @@ void x86_cpu_leaving_halt(CPUState *cpu)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
-{
-    if (!cpu_has_work(cpu)) {
-        return false;
-    }
-
-    x86_cpu_leaving_halt(cpu);
-
-    return true;
-}
-
 bool x86_need_replay_interrupt(int interrupt_request)
 {
     /*
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6f5dc06b3b9..2fde412394f 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -180,7 +180,8 @@ const TCGCPUOps x86_tcg_ops = {
     .tlb_fill = x86_cpu_tlb_fill,
     .pointer_wrap = x86_pointer_wrap,
     .do_interrupt = x86_cpu_do_interrupt,
-    .cpu_exec_halt = x86_cpu_exec_halt,
+    .poll_during_halt = x86_cpu_poll_during_halt,
+    .leaving_halt = x86_cpu_leaving_halt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .cpu_exec_reset = x86_cpu_exec_reset,
     .do_unaligned_access = x86_cpu_do_unaligned_access,
-- 
2.55.0


