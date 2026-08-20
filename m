Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F39C5DF86
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:17:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9BD-0008BQ-Uz; Thu, 20 Aug 2026 16:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9B8-0007jX-Gp
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9B6-0002so-Kq
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:58 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7ax6807258
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ab2jd4IOBsCwRWOGKRY93YvfazH7yBpjbYnktuG5p9Q=; b=b++J7aT3S0Df9dYD
 p28xpQuzf4Appl0AXMxuI5m16sKOUMPmzF5TObG6eAb8qLKBpqdJXUJTtKydq6PZ
 HAiH2iMj8UfqqKJ2C5eml0IeZ7tps2KukzxOzJJ3gKKfT8GeXkMhpekkyBX5R53l
 HNPbeenQxK34CEDAsYtf67PMz+T6XRKfEWmsHvogBCJ1T/sbT6iShBPecmRxmt23
 VExkMRM+iZ13Gn94dNK8b9LtJBRGbBtpzR6Zlexwkxjhd38PrPys9bJtTU9ttfaE
 ylIhBVJgxziKgIEaos/lvPGtmtyVsiX7BvbWFTKnGrAr802dddtSCCR35gq53ycc
 851uDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb3am-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c19493ac2so2158041cf.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256942; x=1787861742; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ab2jd4IOBsCwRWOGKRY93YvfazH7yBpjbYnktuG5p9Q=;
 b=S9meIKabIN3CW5aPoMEt+/POnn1rCGQ7qEcGmWXz2u7FRaxUj6MP9dFX0SyT5VmIxx
 NzQiaHdVZIFS3IMaQvcUtSahXzB+iQFcmiuo4anYc8I9pHwZibnW2Z3QBFfcgx5hqqYO
 iT8yy+rX7S4sX3AYMvMoMWsnL+KBdt5S27+nOJuoS1x3eZO/YmmJCh+pGWvMbR6RThL1
 +CoKqAddETS/tsRTExwuEiEYt7B5NJ5mW6Ke/U/2wkXXzbe+f4rgH4uuyMyKJu5hJ38a
 GEoLP7pQ9wHMT04bxulBn1ywuZ2LZ3Y2wgJwOO+PjMhmF9SsvEP10rOyiThLtytPSjj3
 c6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256942; x=1787861742;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ab2jd4IOBsCwRWOGKRY93YvfazH7yBpjbYnktuG5p9Q=;
 b=UoK/u8NzRekqN6vCrZ6emhdVik5JeFo5RvBmC5e6LOO8YOQzpyGF0sTgUsoADViKCG
 nSILW81GHNswuF6eAGBvksrjJPonb32PAP7378PQoZErgvzUUKUvgCeg/wvwVMsOmgxJ
 /SAn5YXEXZt9LaqHosk/9zv4UZy4s/fXhxOTb1xkldfQbWosaYzxvRTHUAzl/2Kgzlnn
 /xi9nx++g42FE2GgEs5sWDkBRq4xMtlemTX/xAifCvvXXGWqepDd/+PMKalv77Yef+Yf
 44+08OAxUG2CMFHMwKK+QWOTXVQR+EZNqPU9dqXwwGL8JGekCMAeRYl1wCD42ok/3y+T
 qk+A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpcFHJJguZbjNHmMkUfaZennawg3T6u0gwUxQ9lCZBTBVhRD+R2Sys8pkP4a1rOYM2IWcGzzRoLMQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRi3MXEVJ6oSBNy/dxms6Mivnj/DhEnkU1Qrxe8rF7jfeAqAgS
 QA/fKM7Qv5zFadEX6s4Nt+A9np1nLxsQti7Rz1Xbg/IXBhKeOTS4HGw/WLRsIPU+hF/HwvVkkBk
 V6HDHS9Y6F+zsWGDuNECzReiwQHmr6Ir38Uzv/E18IGViCrdRH1P3NJ4=
X-Gm-Gg: AR+sD10tZnd3gNvrHR2zYsax5dtfRhWGUak6zEd5fXACuz67aj1VPZLQMm3JHCqiY8m
 NnRtn+MGWemV0NseVx+/aftuoTrmOxFEnyIdr3zB8Cqa0L9WZnHWnk+w523LjiTWUoWN2WxDdDD
 FIUMqFgL6hJQ2rnHIzvnoFAkjeb/0dIDWQACNbKZtV7A+B6jPuvRh7mPSX/W+cSzzMT1GUVGaVJ
 a9CmqMULVUrtsZ1FzMC9sAytslFC+jfGN6Gm0QJ5QsJ1S2y4HQkht0T5BYRiKj4GF8TSFH78dsu
 5LH+Blb4umYs7TbSB9Ls22rW8TzQl0zGIP3pkDaxFD5kYlIKAGPdspaTPee5mEn18J3AOp+XiSC
 Vls6IXUlz4OyyfgGzFNV+hwLrGt7nb8YKKssNAKai1w==
X-Received: by 2002:ac8:58c6:0:b0:528:3ae6:14b1 with SMTP id
 d75a77b69052e-52df5c1d61amr9097861cf.43.1787256942312; 
 Thu, 20 Aug 2026 13:15:42 -0700 (PDT)
X-Received: by 2002:ac8:58c6:0:b0:528:3ae6:14b1 with SMTP id
 d75a77b69052e-52df5c1d61amr9097081cf.43.1787256941665; 
 Thu, 20 Aug 2026 13:15:41 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b914baeesm3451845e9.10.2026.08.20.13.15.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 13/15] cpus: Add const-qualified CPU environment accessors
Date: Thu, 20 Aug 2026 22:13:53 +0200
Message-ID: <20260820201356.29775-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a87606f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=x16qC-9I3E3lrIGWYX0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5PfEpmL2M8fE2f2zfiH7bleUnOWxksg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX5aa8IM6oDctr
 CzASuT6NMmR3cGL/vN7IEG5LNrhDN1+QrqkDj6blf6pRMeK2jsQ7mGW8Yz/v512Y9ffVBXnGvxI
 V+SgEx1aowJ38eOc4qyfYmRp308qM6m7BV1qzl/QkhwIGOCzNYVzRKGIzQQt3FaEOyp2707nmCy
 p1uVpf0YdkXAO15gGF8i/KvjvrTfbKbZcvgP5oKjMbUkyOFcdN7PTgfq4K/lDxXAVCChmcCpoK0
 hruExWelh9ZZhvQYdmHLHIR60O/3xvq4Fb8MV6e6hszZBXJFg6xLH29djyRUn/3PIkp1NOSMr0C
 lnxGZ2ZKTBxBrFecHI3Epfw2Gmb9VMkxzerfaTD8G1wMDQHftlBo8BnWWze1e4E4grlKeh+nzTd
 U/o3plU/2nHUpnwqayTocagXCKK3APP40it0ORLFKtUC5tsE142BwmRLAZAP7EMAJAsmPUHcEK7
 csJp5/f5Bq0UcIlyZpg==
X-Proofpoint-GUID: 5PfEpmL2M8fE2f2zfiH7bleUnOWxksg3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXyblYsX302UZw
 nWscQXQ01KXWlV2ZcYXJNx6ZR3+8lGi6wBrT2jy90fqSbwL5CflxmqKHJ4wqD/6bcumrSrru2/Q
 eWZsfTgG9xj/4cIRURbB4H8Cy1s75ek=
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Use _Generic() controlling-expression to add the const-qualified
variants of cpu_env(), env_cpu() and env_archcpu(). This allows to
safely access CPU architecture state when it should not be modified.

Alias env_cpu_const() which is still used.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/exec/cpu-common.h | 30 +++++++++++-------------------
 include/hw/core/cpu.h     | 17 ++++++++++++-----
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6594f7fa1be..bffef677607 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
  *
  * Return the ArchCPU associated with the environment.
  */
-static inline ArchCPU *env_archcpu(CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
-
-/**
- * env_cpu_const(env)
- * @env: The architecture environment
- *
- * Return the CPUState associated with the environment.
- */
-static inline const CPUState *env_cpu_const(const CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
+#define env_archcpu(env) _Generic(*(env), \
+            CPUArchState: \
+                (ArchCPU *)((void *)env - sizeof(CPUState)), \
+            const CPUArchState: \
+                (const ArchCPU *)((const void *)env - sizeof(CPUState)))
 
 /**
  * env_cpu(env)
@@ -107,9 +97,11 @@ static inline const CPUState *env_cpu_const(const CPUArchState *env)
  *
  * Return the CPUState associated with the environment.
  */
-static inline CPUState *env_cpu(CPUArchState *env)
-{
-    return (CPUState *)env_cpu_const(env);
-}
+#define env_cpu(env) _Generic(*(env), \
+            CPUArchState: \
+                (CPUState *)((void *)env - sizeof(CPUState)), \
+            const CPUArchState: \
+                (const CPUState *)((const void *)env - sizeof(CPUState)))
+#define env_cpu_const(cpu) env_cpu(cpu)
 
 #endif /* CPU_COMMON_H */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index a16acf14370..372485a2e54 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,11 +594,18 @@ struct CPUState {
 QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
                   sizeof(CPUState) - sizeof(CPUNegativeOffsetState));
 
-static inline CPUArchState *cpu_env(CPUState *cpu)
-{
-    /* We validate that CPUArchState follows CPUState in cpu-target.c */
-    return (CPUArchState *)(cpu + 1);
-}
+/**
+ * cpu_env(cpu)
+ * @cpu: The vCPU
+ *
+ * Return the CPUArchState associated with the CPU.
+ */
+#define cpu_env(cpu) _Generic(*(cpu), \
+        /* We validate that CPUArchState follows CPUState in cpu-target.c */ \
+        CPUState: \
+            (CPUArchState *)(cpu + 1), \
+        const CPUState: \
+            (const CPUArchState *)(cpu + 1))
 
 #ifdef CONFIG_TCG
 /*
-- 
2.53.0


