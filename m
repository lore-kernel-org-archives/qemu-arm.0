Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A576C5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:54:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMqw-0006Ym-Hy; Fri, 21 Aug 2026 06:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqu-0006MG-9r
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:52:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqp-0003nv-Bu
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:52:00 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9LnX31474544
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=; b=RSRx2pRyoPH91992
 TegltYhU0tO/R5qKaPcuk6I1gCHJUYczezQuchbrMRVFzZpzDIJnD6Wb0n5SaIeW
 bOeILUUkC2A+kmp9V5ZMH2hP5zh0v9+gZNRc1dx9tOG0HAvjdWI7akODFeC0AYU6
 tGMsbZK8ekY1wwp/5brntsKsuWQV6TDou19nzU3bx9ZjxhyAgcfs7qxtTMPvyNyz
 HgTo2MV1cfUNHJX55mD/4HE8z6ki145icNv6MPiSoTrpTwUPrF/Pjz63Xngxihdf
 nQvaU+uh5xJJ8gdfnBcLLMlLdopcZdNqXr6v3fj5As5gXcts7q5Hzp6gSvM9pYc2
 P4Ij3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbw9bff-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:51:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9368b4c5964so61656785a.1
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309513; x=1787914313; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=eP5vRFRMU40n5iPck43TRvHULiEyMoNT2Nm4yC8nfwVpbjhyxmtyCzPYklfLFqP6XF
 zxrQfwNbIDShZKLtx+nlFRAxQHslqOrOvaUsxs9ZG+Mp03IfXjrn3rJXCcvQmLpmlton
 mdoJ60/T9avA5yZnst4NXQxohABES1juootaE3tOQT6WEfwHihzORzOc593fBas79IXr
 Kagi9Cuh4/BV3s5pOP/Tuwxtj1/SbDbi/K4nWtCqU3jRa4PJ1akF1l4vIVXYZFwjpJGA
 lE4rmc9UEO7739U94P8cWtrApgNKV90eRGVupe2W4gk7ZZm6vlOUxeInPkBiWv6F2bJW
 fGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309513; x=1787914313;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=mqk0AXsNJpKY+0vOAFzSVwfs6xT3sKTFTIhymqQJPumPVXmQTFQrKF+9HZS+wDF4EY
 LcqRH9WLYI/kyc+ulR+M71ummX3yJLRewi3+jfXuPxhtUCJiRVs3f1h2CzsSgMr9APw/
 irOS7zdYjbejzc4WY7/GCY7VQnZ/dC8sEyhwpjdGN2+AQNJmFSRBT7y5AZW3YVwFquCW
 s/Mx7lsp6Ix07eJ0bTZikK5Nq3uh9tdIOKP3Ljo3LIchD3KGDHCrtk1SLBhVa/LmsjgM
 aq1SpJgAyAyCGXGgoI/Vw3n+dJPgraB1DVrFBOhlvhqT+CuFGMukr+zL8Eod+LPpaeC5
 1roA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpQq1X9G47Ajc88RjFQCSxXFln9ChOCW5yBesL3hW8ZfDvFvP5ZImFtTZUxvCrL/6jbR86zzmYX7Q==@nongnu.org
X-Gm-Message-State: AOJu0YyoPryyLI+oq5VX+vErc4C5U86g6jqoghsRl09xyfsw5CWrZ2RV
 XMut6YVZGlMSspQ3XC4gJzB9g1oYdBBQ0t/WQgnegP/1pN3xGP+HQUjrLQhcR0ykbdJVF94LR6f
 w2wryxo7WPkCaXqKBcV+swIf4aQwLEyHzz8AXIWUyWUG6rPuRz8OmLxU=
X-Gm-Gg: AR+sD13hUtPWWGdJaXKEW1VP1t73gEUTSNurmb6UhpYiX6ZlYGbNManbHVIX8WRTQlf
 UEEShQmYR8+nEFJuEnQY6C9Po+laM1XeHZQJ3SLxxKK4Yp00XtuvchI3FJ/9jc/+tCtC8itvF9y
 6O/RbANTfBEgY8KzLIr04CxC1qsnBVsKpr8vKATl9ugnjfWTg8YmJRb7ov4Ofd6CifcJF1eG3gf
 EEIgB3+OWEVcoCUtCUmvIt6rkYeoW4j7XhWjn2cYgTzDKfIBpdnhhRcItBEdwTVNJoH+nAaWVPT
 eCx07LUkLgl54YkzkWyqm4Kl4aZukWu1rK4Jw2QqY0LVeUC+4PnHykb1IoEjGgw7rD7nm9lgSW/
 t8Mlo83M2qwTRjTItxRI9dO0ONIuN303xBOIRo6vnJw==
X-Received: by 2002:a05:620a:f0d:b0:930:f337:ebeb with SMTP id
 af79cd13be357-93739574e95mr408165985a.12.1787309512943; 
 Fri, 21 Aug 2026 03:51:52 -0700 (PDT)
X-Received: by 2002:a05:620a:f0d:b0:930:f337:ebeb with SMTP id
 af79cd13be357-93739574e95mr408163385a.12.1787309512544; 
 Fri, 21 Aug 2026 03:51:52 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90e7e20sm22642065e9.5.2026.08.21.03.51.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:51:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 14/15] target/tricore: Document architectural interrupts as
 not implemented
Date: Fri, 21 Aug 2026 12:49:48 +0200
Message-ID: <20260821104950.32108-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX9XmhKPqYmZHO
 EJietE0pvuVtOkES0odb1y8c7pqIFrpIYvg+9pb/6snz2t6ekBUDrMxvn4d235AgzmCW+mWcLbP
 guh4NqpznV4WrVqJdPpbIiuBT4qI9GY=
X-Proofpoint-ORIG-GUID: T8kSpXpSMlx30D0cg3lhTMBvB-NELwBw
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a882dc9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Cu_OB6cER5A0ZMY7a4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX32SVUk8qzH7p
 xTVs2pHMjYO1ugoZDYew1VI3bap5sKHdVIOTCXpTuuBTdyzSOOsrjCnOhu15FhFTf7yVSKrso9x
 8UDDtu97IYFDdYL3FrmnRkBDy20Oo2k/RcVp8pIQU9sckIRlM7grDuCi4x4QUdlPCgsnUB9/Cjz
 QCg3CxaRl5LW07nyVt8aC8ANh/4oUqltE++ETX8ekYYbM/2NGGVlkAXyeJTg2SMsuciXU26WD1m
 l3+HBmFuLniZ9AHOGXJo9vPEFzlJC2IrntYC3siYrENrULTOWQU+JKTMLt3OfCbO69hIad7T+c5
 f94KtlITcwHn+H4dPorV9fZVGy5b/1/NlSPIHREPpdXiqifIxGiYndne/8t/o7iLpj1hu4S9K5i
 iSkECd5BX5J1v/W4CRad90zmu3Qhq3XhO7guj2D3hirP2CV78pDlwULAnR5uKWmeB3HcMqaIgHB
 Fnkz8FmmiUcrjv/uN3A==
X-Proofpoint-GUID: T8kSpXpSMlx30D0cg3lhTMBvB-NELwBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210081
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

As mentioned in commit de680286b52 ("accel/tcg: Make
cpu_exec_interrupt hook mandatory"):

 > Tricore doesn't currently implement the architectural
 > interrupt handling.

Add a comment to help understanding why this SysemuCPUOps
has_work() handler is simply always returning %true.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 6d448727005..82b56c3cd56 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -113,6 +113,7 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
 
 static bool tricore_cpu_has_work(CPUState *cs)
 {
+    /* Interrupts are not implemented */
     return true;
 }
 
-- 
2.53.0


