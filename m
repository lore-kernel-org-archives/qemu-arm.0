Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56711C5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wua0C-0002e1-QS; Thu, 13 Aug 2026 14:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua02-0002OM-Uk
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua01-0002B7-I9
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:54 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFU3ba3500636
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ljSN1UdHSOnwLMjuyKlwazgFwW/6t/xeE/JxhEIwvSM=; b=oF6mDawxwkUKSa1V
 xcOKuQGaulTHe6MaqdEQt+oUJaarZ/BGKdWkvD5uOrBhWgs38ptGSCSwpt1DNc5J
 H3TGCA5+VScZp8Y9s2gvHJZEqaaR5rI3TxImWTOqv1Y5tWAGU0nFP8GTWSUtw8DU
 7sbP9iGBCxQjm7AJQXAny+4xkNzn7u9TosWRTEOw1sHEcWWm6NYJSvG04Ta4lb9M
 ANRqLlMxzGdYicqrIIWVMpqg+UHDAnvG3OYf7RJiGBSSWjhtjW0HUlPOflFnyXqJ
 2GfjGd3bZDBGsm5hfxz8mZKU2Tcsc8aMFQeL/lxjmAmkzL2lR+UD+onlib6ZjE4i
 AwEC0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g181836v6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8db414c7so3031921cf.0
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645070; x=1787249870; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ljSN1UdHSOnwLMjuyKlwazgFwW/6t/xeE/JxhEIwvSM=;
 b=AdG8izOt5kkQFt1RMLpPFVE7qAjkh4tiE5WUyzOoOAMchgnfM1mxkWgbjgfsA3Niwu
 48CyLLuVHs8Mm9J/qUDOFQw9ILbI6LLOXHrsZcf5dy+wS72wTISFml7SO1puZQhZjwrr
 ByuyYIgqCqM7G29tDJclgoH1KUJyHd702ZzqQojUWZtLB0uXlFnkyTIQOGgl5indu4dC
 9jcBPBWE3SqsZfiY9sDAAnV4krCCBN64/cAE4ELLlTIXMznpXcgnKRCIngXpHeRgp1u3
 9ijTvti8q4QI5d1A1acGF68cIvD6ouNYXCO/7lLeO/bZBhKA3+GrvOsN+tcE6QXW62J2
 wxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645070; x=1787249870;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ljSN1UdHSOnwLMjuyKlwazgFwW/6t/xeE/JxhEIwvSM=;
 b=spjAtD5zVon1WASdm3TGJlf1tdL1Lj+5HlXHtQueBvCepj8uTieaslFvWM9+NOsMnn
 PiSMDSYcmmqDS8puI03qXWpu+pB7M/60s+h4ES9ntUsQc0BEM2sUhJI8UotWZTm150Aq
 nBchCf8xBevBZhyXPb9ZoWg+06KBizWxuCZofD0LIdS2Fg3D2XpeJgMVqc259tlB7jdq
 +uu+kPcPQ/zyP2ECM/0L80YMs/nRxSd8Qyyfq5u0JBR8qb7hz0o7rWuCTKnJZNI/8xW5
 r8bDNIbjWJZLjP6W0hflmGScCicMgN/lTzSI7tatW4wiG2oewm42Kj1pVhfVlKhVuWgY
 iwmg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLogvXq7JnobmD7yr4gGn0B6/bWF/rhpzddwU/z2pc7w5eZ/XLrIaQ2OL9M5SdjsSLd7blmO9wcg==@nongnu.org
X-Gm-Message-State: AOJu0YwOBuLp8vxnfGoq07yKSwx6F69yoRI09MXNn2H14btotBHz4wX1
 LlzAkDmghrqq5RX17STMhj59F6U3bU5E+qsfZ7keCp7rw6tL5eqGWXZjRW4Xk9GwYmC1A5UHd7M
 qpQoLVRA+6AnNLewgSrMKiOkgfTz/GPU28OlSz6ZCHf3rcY1S2HhhQRs=
X-Gm-Gg: AR+sD106BRchdVbGfymaX1bFpJGBN5CjXcGHOmYawmybEuaJ6JVDK5tqzHvdckGZcIm
 0Kv7rHFu2yKwHeRc2rU6FdsW52lIUL6zYB4kqmkZFqWq5sVisHs4DyBR0RlOiWcKiySoz1b0fbQ
 1+mtyTseifsn5wF8s5mSGno9CUuh+E/BbIfKWNGxC07pqI2qcQXbYfoW940QM8uOsNQV9ByG7yZ
 6QvJp+DCHixYB26RWTmgPpTbBv6Wglv6k02qE3YyIN7ZLWW7MaukL4ryfrCw+V6KclYvTFpIfI5
 mfylgJJ8PMlk3PxyaqUjYLbgpKiHBG78/fOhJORzL30QWC33sHGyHspVFSj1rJtcSIwZEYptPa2
 LUeRx2H+QgAFp31DnWyasI/NuLRdmDWUNacwX1Aqi9g==
X-Received: by 2002:a05:622a:428d:b0:51c:9e2b:a79b with SMTP id
 d75a77b69052e-52d73da5717mr100236791cf.30.1786645070032; 
 Thu, 13 Aug 2026 11:17:50 -0700 (PDT)
X-Received: by 2002:a05:622a:428d:b0:51c:9e2b:a79b with SMTP id
 d75a77b69052e-52d73da5717mr100235971cf.30.1786645069462; 
 Thu, 13 Aug 2026 11:17:49 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f200752sm1249951f8f.1.2026.08.13.11.17.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:48 -0700 (PDT)
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
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH 09/16] accel/tcg: Use RUN_ON_CPU_NULL for tcg_commit()
 callbacks
Date: Thu, 13 Aug 2026 20:16:32 +0200
Message-ID: <20260813181640.6537-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXyyzXcs6zbw1c
 siN2aTaSEckMipMrA1NMZL7PnOzJDgw39S+WnlCoLgZSy8E5KlWXXHKNrM1iQ7Y2DqD3AKrMFPX
 5n4u5VIS3MfhFQDZM/zstno5Vy8RpfU=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7e0a4e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xzjjCr4z5Sshx9Y3hZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: TeejKan7WcNG7XMU4L5jJE1kA8DNd83A
X-Proofpoint-ORIG-GUID: TeejKan7WcNG7XMU4L5jJE1kA8DNd83A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX+EfVF0dGh9S6
 nyXqadRYF5yP/Ka8GnR3VjHbe5/YVfgLi3YO2zUBMduEwWVOa1DL6LzYxuTpPZtVIxoZlCPw3b/
 JgRRoLsR8UaJKgOT9ZDSp+y2ZgAKeCYzizKZt2wfSjIdJAVFSmGz76AqoMkOpeLHTCyv4J9squu
 V/hdQ47V5Eo1I9wwhPfubbIN5jXkrIX3kiwmRVP2lRncZpbHetsQDs9rT6Hzpd0+Sr/DlEwdytj
 T2T6rmsLnDOvn/juz4Bli127k8wVnXSekmZEprn3mGgokAG0bOmN5vCuN96uUzOw+0eGCenMa3y
 AJDF+VIGFcBhIEHIxA704ueGW7RzkepvMP6g2Ei4eGbhQUcl/Prz+6ze5e0BT45Fo5+1piW3vde
 QVP1quB/zkZQtVWqdDHsgwWgWeGIq6PCW1nePljSIUkZEdQvcuCYr7lqnPvqoxJ6t6mktD+cX1X
 Tjaxh6SGnysXG1BjQHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
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

tcg_commit_cpu() does not consume the thread-local parameter.
Replace RUN_ON_CPU_HOST_PTR(cpuas) with RUN_ON_CPU_NULL when
scheduling the function to avoid any confusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
Maybe this AS parameter should be used?
---
 system/physmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index 362a00f76c0..b97016b1303 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3088,9 +3088,9 @@ static void tcg_commit(MemoryListener *listener)
      * all of the tcg machinery for run-on is initialized: thus halt_cond.
      */
     if (cpu->halt_cond) {
-        async_run_on_cpu(cpu, tcg_commit_cpu, RUN_ON_CPU_HOST_PTR(cpuas));
+        async_run_on_cpu(cpu, tcg_commit_cpu, RUN_ON_CPU_NULL);
     } else {
-        tcg_commit_cpu(cpu, RUN_ON_CPU_HOST_PTR(cpuas));
+        tcg_commit_cpu(cpu, RUN_ON_CPU_NULL);
     }
 }
 
-- 
2.53.0


