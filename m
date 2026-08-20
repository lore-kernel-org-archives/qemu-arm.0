Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B54C5DF89
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0Ju-0000pv-60; Thu, 20 Aug 2026 06:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Js-0000ky-78
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Jq-0005mw-9R
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:23 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KA3F1U3454831
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y8Q3BAK2lGJ/lTLzHltc1vM5Jr232nQsTZ/rBzzgk9Y=; b=Uz2m0J1cEnKmLwv9
 JQ1Yrwydt+GxoKtU8h7p5v3ib1BneYejUKwawyS3ZgPq8Mk2RaSz2UN0d3IJuv+n
 Smyw1fML2d0lxbOdAUlP6Q1dtZH+pIQpvp+LE9huSdLYs9Lz00Ri60+42GtMOkZ9
 30ELS1Jn6yMvcnMzi8i7XUQqP8LAt1YwFYsEqbeqM/QBeDl/HExQ/Eqy4/gtKZ3E
 IbgpwZX5+1BVmhmwG1x+ovTdTW2KxRIo8bdJqfeSQv05KY+WIVh8DYyoS4bADOZF
 ERS0eVU1n+u+fWUGmY6semlEYkgwCSGqH8/AHQNCygKWXzGYrjSXHJOIiduayZSg
 cggs3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg885p1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e695a3b28so89916185a.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222890; x=1787827690; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=y8Q3BAK2lGJ/lTLzHltc1vM5Jr232nQsTZ/rBzzgk9Y=;
 b=iViTAynmn4ADWSIQAGw/y+wKjXI8wY++5mDxCFcGPAJfyau+qiurjmsBH++wX8bzf8
 m1TJ1uFSsNcCH8mb2ah8QV1MPjjksNAkEZGrCy+Xl1u5zEI46UJa7ZMLOy/1rYAxebI5
 m+L7VT9k4Vkgm23koWr3hGCqVcq+CrNCJDSej3a3Vn+cW+274/jpwcv0Mu6vxtqAUW9k
 j1eFKNMyUsxW1wdsHwmArAdMLCnGaK4yDgW9mfz7h5gnkYcq3hoNqE7ymfHCCvkQ+W+G
 h1VvfyH3Xl6iZn+OrDXhpSPOlIUFUyUgc4kHnxa7GjeYuTud5uKSFq0oSWVcqUgWlugU
 NGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222890; x=1787827690;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=y8Q3BAK2lGJ/lTLzHltc1vM5Jr232nQsTZ/rBzzgk9Y=;
 b=TlRvkI7PCKMKAkkKo3DVnIxKht5RSDzMbilzxuci1Kvw9ea5ijcw/yWFAk7kfErfc4
 wzrJnF2IgcO40lnAvixVa07SJ2XTcvqpPoEPdBdXqRuihLzR6hiEiZwC5CaayWFtE69P
 9F3EgrTT6y+VxIyN7oTI38+bMD/PNWNbBS+JY5cuxDMcxhr++8OlRrcT2dmOq+WJTxYS
 91Xtsyi8yCUIJHOJuXDXibtCPwuMu1F8cL4vt5S1FBMGrfyr4KeB4LHmCddLwJi012qx
 7oEtk0Prugecb+hy6BNTFcsAbIHEX8eYQFdRLpxfA+8CI7oDs58wmBuCN8YDEBewKd4+
 mEoA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5u+/c4JKaiaV+uOvzU1nDjptiI8hdOymt3bU9eq1vr4i/Uz2VMy35FlBAe2JeU+qmAZf8JAfCAA==@nongnu.org
X-Gm-Message-State: AOJu0YyFytHRdrwHP7jMogrb4LJ36bOsqtR7iCknNE8hou9xtpFvg7lG
 o5bYGwkTBYlrsU04UfgEvYoBpzf/wTAusyUHAQ56eAou/pD6wpSZ0DD0p/VllG2gF1PlkiR8a7o
 GrGYLk6eNbmnxg9opQArPTvz26xsNXDJiZCvsysMM0vSmKz/WqUpUY5A=
X-Gm-Gg: AR+sD13C2Sr4fRBgvIPXDmXpTGvudm3LoC+TPz+fSmGZHx9GGx8UJeQimxmkY0v+45b
 1wf8pzP5l69QOkClalACRQLrkkFaBRE3ooCiRN0YwuGsmraOGBLvcZyaPXPoVRbzOQyift674Fq
 GVhWvmQabaoIWfO8GlEG9gd/fv1Be7lEtiZ8BeobH2u9Cd5udbzCSGojn1lp5WABmovo28Mk2sS
 tTHjyBCVceQstDlT2xNBp6azi4nwh7iU/pVQ7Qm6323NoSmB2ueNDCYXX/0jUlqYBdLsGDV0s0M
 oPHhoN09EZcwX+N0b4PjRashEidvpuFWScHI2yJPapWTl5+TiAjLpo+bGDS2aLjy2ofjgGqO2gF
 bUQgPD7WgmufIlebAzm9tSCzYYCuXLBgk2iBmcyUb4A==
X-Received: by 2002:a05:620a:6083:b0:930:9533:5e32 with SMTP id
 af79cd13be357-937283bae62mr528331185a.7.1787222889679; 
 Thu, 20 Aug 2026 03:48:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6083:b0:930:9533:5e32 with SMTP id
 af79cd13be357-937283bae62mr528328185a.7.1787222889278; 
 Thu, 20 Aug 2026 03:48:09 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c338dsm10205663f8f.25.2026.08.20.03.48.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>
Subject: [PATCH 05/13] target/s390x: Constify S390CPU for cpu_has_*() getters
Date: Thu, 20 Aug 2026 12:47:21 +0200
Message-ID: <20260820104730.25462-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX5PdyCxSD6ddn
 +BFD/p2hLbefclp/gLWE+W0dIhcwgrEw3F4uJpQdq4DCwx+ZXiSyVc9MV6rWFSTFXV0Bm4ghgsf
 0N2zB8aXNQLqEbdu7I6ACmI0Glbrw4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX8/+kXD1UEBWc
 069g3u64MZ610tEoZ73XPU/kk3nlnsH17EW/RrAq24gc2Hj4hRv+nG2N14nTFsy0LYDMoOE+C9v
 pIp10n+OT+5ezxeMFR4YANkR8YamWIRZqJRWbsVLc+TVejwi5huVppQ9Cm5jhmOv6gAmLIpS9yc
 lYuD3/nN72Xpi3Q3XWbCnMNICpvjjoWKoIlsUu4YCCM1bj29ICPTQ2/vJsauulc9+V8PZm2UuN4
 OkKa3eezwkP6mudRT2V9U+TJSEcW/KzVq1z7QFbFqwMIJsKIDza1fuMWSck1LbELPapyziMc/XR
 HuBcXjdNJCvFAuwsGIz5c4lTxSJ8aj4GrltMUmlWKXybHiJO4qYgkpruYP5ADDxbjfz9A2DSHjx
 g2Den6aiy+8ocmkGu2PWQjUkw0ggYLMc0VclXxz3ukqKxxgoClS57bgDQK5j4YzTinVe7E4RrmY
 Bf66J1Zo8tuZAwbevuQ==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86db6a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XTAFPiO5U9liRQFYMEYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JhoolnjU7UiD4667XoeTr-stfTNv6bYI
X-Proofpoint-ORIG-GUID: JhoolnjU7UiD4667XoeTr-stfTNv6bYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
index 35d1e34ef4d..54b62808d83 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -334,12 +334,12 @@ void cpu_inject_clock_comparator(S390CPU *cpu);
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


