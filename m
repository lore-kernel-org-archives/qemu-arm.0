Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3206BC5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:20:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wySiP-0006Xk-Aj; Mon, 24 Aug 2026 07:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiM-0006Eh-30
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiH-00067i-EN
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:41 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99DeH2355915
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=; b=D8ej8BqNZtAoHC+A
 o+uwvXZNNwzIE2MsV2Bk6gAvWcJHZMa4fVSfZDwuwu1we8+VInmEyRmDsEL2tbpN
 o04AqoN3OFvTJE2NDT7estHDNenWmVkuN0i244JIEVdl5VKtP8bXfaLZe5k2gNAQ
 db99G9GfgLm9Uz2LZLaFciqugWcbncHk+5eEjQAuljvE4Z57g0X2fSv0uWQw4I92
 Z0HBEy2/Bj/eWV43s8Nb5IcbwuBuvvGwayMg69YeU3K0nBnyvCCZ3oP0ztQ183/M
 C7SiKUJpoIWc2+xTAx/gb6M/AY2vWdBf0WQy8Ji5yiYeJzZqLGJHcbsB4MnZymqg
 qKF8HQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn96nr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:19:36 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-97a4824dd83so3148178241.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570375; x=1788175175; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=;
 b=BzW8nc/8le+FkWAWGCMzlUbZX1O+wnz+zHRk+wyofrtmnMxTrHNiZReE/5MFWkYwPI
 Xjk/pE+hMk9ATfCMdgeC1grYLOIOTV5fG3qIdE4VBMqa0ySM0yvOyYWJMtqRZApiT2Y4
 OtoJwHXUdC9xUi+1WX92Hz1vs6iRI5xluVTQv2Y/zqloFj3DWlGYwdP7Xpd8gMEWgu+6
 MPoRugff2ez/92L91OCqhGNPUXRvu0mxxOSX/27Mah/V9vD8mrTeUIGzLKDvJZ0GKoBz
 ngjzr5HY8EBgnSqYXaHXfDLFJvUErk/4ph7PjxjIUfwmjFI/ViTYBEx3SsHRfFwZ+Cao
 o/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570375; x=1788175175;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=;
 b=e3WvQVKx9rF6qcIlth0zJuAUjImL5tmEqWb0mOUUgh1nrqSDsN4gSFzmzfWIWd/Oqo
 0SwyaCJ+jnV/pk8S1SjIJAmU8GQQBLippsQDRIHVT38aMJicVq7F8soR0tIa4PvmpIF5
 wHF5sa4HgOIz7dqo0gtGOXCDOqG0cXW89VSxCBaMI50TLxgQheiPxh5qENqMtAP5qo3w
 X0lu0LlsMaAjxfDw3kMqaussePXfnmC5ItItVhAzAoJJsbZrWU5qzN1DhRZEieJEIAGz
 vaDzm0QHOh7EPPI1NtrdGS39VPp5nGxD5ogs+PfmHNsUbhGHgMqkLwWIzubJ5j/TqBGO
 nogA==
X-Forwarded-Encrypted: i=1;
 AHgh+Roz5ev5IbTcPpgQE5h/8IwOK54RSIq8VNhmCVdk9dUD2lkyA5yuWbZodJDfzqGArzFJGWwmsrqWFg==@nongnu.org
X-Gm-Message-State: AFuF++l/9s11S+G1mmW+kAtZyPbZHTVUhPXeVNLEVTAxwya4qC/PBc42
 FNjrhV3XGjBFFNg9GEqlOEvBsB25u66F7oUfUxtaTO5u4PyMJvsu0I5eqhjP9NJUMYwF0fv3Zqc
 enNP3YhEkUiRVI+54OAS5ZKFI71L3Yc5gttldAPZ2wpwlQBw+DojUNMA=
X-Gm-Gg: AR+sD10jRya2XDhKfQe/vaQSWtwR+DPGZDfnvBbqvAHBBft3gAeX5rSWjk0esyn1Prq
 2QBuVWKR+fKdva+I0H3ns+buE1Yc30GAefedXgknjLR4GtnrkIeI6B2EuXT6ZoArIKi2BMCaFgk
 UWHk3G6+boxXtCooatoJIF6jC7tAqHJte/0/04ec5wQ4L1p+6mCRDvfzB2PEoNFqlaDFCytqh9h
 oww98u7JD5Boq+GMdV3wF19DenCF/BVU+uDKn1LM1R1NBybaHHojBAzFfWVzEcO+c8Vw4MBuh2k
 NHP5UD87CJ9cn1833n4NqHFlQEaleKSo7n1i+q9tpScUVDWko+b7e5zroUqBTEyfmztNyjTYjtV
 1P3oF0Xr7PZtsqLtJRGJySUHLbU1llPvU0+jExSNUMFoq21Fk0w==
X-Received: by 2002:a05:6102:f8c:b0:77a:7cd:8473 with SMTP id
 ada2fe7eead31-77a62847969mr10938767137.4.1787570375583; 
 Mon, 24 Aug 2026 04:19:35 -0700 (PDT)
X-Received: by 2002:a05:6102:f8c:b0:77a:7cd:8473 with SMTP id
 ada2fe7eead31-77a62847969mr10938752137.4.1787570375247; 
 Mon, 24 Aug 2026 04:19:35 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e1ccf69sm8666438a12.25.2026.08.24.04.19.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:19:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>
Subject: [PATCH v4 13/20] target/s390x: Constify S390CPU for cpu_has_*()
 getters
Date: Mon, 24 Aug 2026 13:17:02 +0200
Message-ID: <20260824111711.26297-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXw46AQBRhqCZZ
 5UDpRJdobdBuOcdG+W4h0kbMVChcEZES8S3uC8QXUH+GaaHrP0Fm3JsWiwmsjW5fB8RIOheFvqg
 LbbE0JrvfuIXl7jpgngWzzoS7Grzmtk=
X-Proofpoint-GUID: QzPDUJ1oM6is_xCoHV5UhX9PsUw8PbQd
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c28c8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=mU8mmpTTODwToQi1tsoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXwWZ9Ih3ZavOI
 Ezc/8E54bPlAREE8IgWs70B/xFfQm7JEFqUpyv8PH0D1GGPjPoRWu5xqKU/FMLeWgrvyAwcDvnw
 j0UWIvPVu6rLwVIFJciPbmqy1ZdL+mTZ7w8ayMGQQCRwFH6d5Q1puURbm5x0ImiVzMcE33JQi6e
 CZtFzP8OAIVur6lOdK/MGTUjvyKFhT5QGxxGu1hksVuxYY1RgNVDEQbqs5xXqC2Z4FrzeYrmgbq
 WpTFJZJDLGbo5TLHH+HVK39n3lIZ/+yw4aN38FlV3iRptr5v5kqk33TPcEzMYFU/Fc4uO8CBNg6
 hiNPxgJv50VHvaxUAGlsv4A7xKzXZ3lTUPAY8rb+5hdFHxel6f+vKE+eiYqAnbCz7iAThs2ns8/
 FXdN3v91uoNL1mvcPudEk1Bb2mDcut29ANLZs/8WDxd8CRLbi1wR8hOIpB+eHjN6+XSyG2iaMHb
 TT8p5NeY66RhBILhRrg==
X-Proofpoint-ORIG-GUID: QzPDUJ1oM6is_xCoHV5UhX9PsUw8PbQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
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

Add the const qualifier to S390CPU when the argument
is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/cpu.h            |  2 +-
 target/s390x/s390x-internal.h | 12 ++++++------
 target/s390x/interrupt.c      | 22 +++++++++++-----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index f55b79ef8ac..998bbb0d7ff 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -854,7 +854,7 @@ static inline unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
     return 0;
 }
 #endif /* CONFIG_USER_ONLY */
-static inline uint8_t s390_cpu_get_state(S390CPU *cpu)
+static inline uint8_t s390_cpu_get_state(const S390CPU *cpu)
 {
     return cpu->env.cpu_state;
 }
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 50782fac3ce..ca4445e6474 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -333,12 +333,12 @@ void cpu_inject_clock_comparator(S390CPU *cpu);
 void cpu_inject_cpu_timer(S390CPU *cpu);
 void cpu_inject_emergency_signal(S390CPU *cpu, uint16_t src_cpu_addr);
 int cpu_inject_external_call(S390CPU *cpu, uint16_t src_cpu_addr);
-bool s390_cpu_has_io_int(S390CPU *cpu);
-bool s390_cpu_has_ext_int(S390CPU *cpu);
-bool s390_cpu_has_mcck_int(S390CPU *cpu);
-bool s390_cpu_has_int(S390CPU *cpu);
-bool s390_cpu_has_restart_int(S390CPU *cpu);
-bool s390_cpu_has_stop_int(S390CPU *cpu);
+bool s390_cpu_has_io_int(const S390CPU *cpu);
+bool s390_cpu_has_ext_int(const S390CPU *cpu);
+bool s390_cpu_has_mcck_int(const S390CPU *cpu);
+bool s390_cpu_has_int(const S390CPU *cpu);
+bool s390_cpu_has_restart_int(const S390CPU *cpu);
+bool s390_cpu_has_stop_int(const S390CPU *cpu);
 void cpu_inject_restart(S390CPU *cpu);
 void cpu_inject_stop(S390CPU *cpu);
 #endif /* CONFIG_USER_ONLY */
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 1dca835c5d8..d7e3fd45e4b 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -139,10 +139,10 @@ void s390_crw_mchk(void)
     fsc->inject_crw_mchk(fs);
 }
 
-bool s390_cpu_has_mcck_int(S390CPU *cpu)
+bool s390_cpu_has_mcck_int(const S390CPU *cpu)
 {
     QEMUS390FLICState *flic = s390_get_qemu_flic(s390_get_flic());
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     if (!(env->psw.mask & PSW_MASK_MCHECK)) {
         return false;
@@ -157,10 +157,10 @@ bool s390_cpu_has_mcck_int(S390CPU *cpu)
     return false;
 }
 
-bool s390_cpu_has_ext_int(S390CPU *cpu)
+bool s390_cpu_has_ext_int(const S390CPU *cpu)
 {
     QEMUS390FLICState *flic = s390_get_qemu_flic(s390_get_flic());
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     if (!(env->psw.mask & PSW_MASK_EXT)) {
         return false;
@@ -199,10 +199,10 @@ bool s390_cpu_has_ext_int(S390CPU *cpu)
     return false;
 }
 
-bool s390_cpu_has_io_int(S390CPU *cpu)
+bool s390_cpu_has_io_int(const S390CPU *cpu)
 {
     QEMUS390FLICState *flic = s390_get_qemu_flic(s390_get_flic());
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     if (!(env->psw.mask & PSW_MASK_IO)) {
         return false;
@@ -211,21 +211,21 @@ bool s390_cpu_has_io_int(S390CPU *cpu)
     return qemu_s390_flic_has_io(flic, env->cregs[6]);
 }
 
-bool s390_cpu_has_restart_int(S390CPU *cpu)
+bool s390_cpu_has_restart_int(const S390CPU *cpu)
 {
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     return env->pending_int & INTERRUPT_RESTART;
 }
 
-bool s390_cpu_has_stop_int(S390CPU *cpu)
+bool s390_cpu_has_stop_int(const S390CPU *cpu)
 {
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     return env->pending_int & INTERRUPT_STOP;
 }
 
-bool s390_cpu_has_int(S390CPU *cpu)
+bool s390_cpu_has_int(const S390CPU *cpu)
 {
     if (!tcg_enabled()) {
         return false;
-- 
2.53.0


