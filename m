Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CCEC624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:54:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LC9-0002Kv-Ib; Tue, 01 Sep 2026 05:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LC7-0002KC-W5
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LC6-0007gX-3c
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:19 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179F9P1892445
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E3SfK96pT8YRclCFPnBfRXnNdNa7xUkHM6rQR0k5Irs=; b=n+wl+FZwqYIFm1YD
 9FNfDUq+LgRCI18hZ2MB11iayEdLHs7BaUEBAY8js8w6cJt+m3Ee1/8lIqkKyyI8
 SlSO7jg+WQ6lwI3uRZHAKEhHNby1hB32lfgVABuxoDdkBozJazdG0SmCCXGxLpMj
 sggnTGDOARvaDqi+LZOobEB5GYpp+JvelOH2BaaftJl1R1n0zTZeaB379MCsMQdE
 nU2HyuKdqi37OWX5Ng7heHdqvGyb1+Ea2tp/zEA9kMM0zfEx+4otdUHJNG2rljA1
 XfcZ3yFlN/iWu12DVgf35TyJ4zzc0Fu6VBz4hDYT8P8PhhSNfrvMr1ePf76y8eoz
 SI4rfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c9qwu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:54:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-90ce9ff466fso70667896d6.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256456; x=1788861256; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=E3SfK96pT8YRclCFPnBfRXnNdNa7xUkHM6rQR0k5Irs=;
 b=FN+EVG4uL3KOXYfKXBhOd78GhDO9xd2sd3tnuv/ONvrxL6gxO4WtlkFmxDRreL5roe
 UNAPbkIBmJcR8WxGuWPrQ9nbMup7zuOvDO2Oa4agNUNBSWc9MlOHwyWm0B7brD0KLt6Q
 wZ/IYDVmlxyMmbAAcpVkJnpr+MzeYK95z32dGjnLf9JAoh0NO7EGEDUL3QZjjKJb0oK4
 LX5DZf5vR+F2ALXWLNmaKS4PC0Y67/MCOlY3yFOhapL7byqeCqwd2Zft15amhWkPcves
 A4xuubztiFeItGATsnzm2LXRHTMR+1euVdkIvVc8Se20I2H8weMy7FjHrNN6spqCk5Rs
 aMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256456; x=1788861256;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=E3SfK96pT8YRclCFPnBfRXnNdNa7xUkHM6rQR0k5Irs=;
 b=m/kf7TRDFLXzWRBkvFxdl1lchw/MOcXz5JkclaRDESJN0/H++Qx6NKZeAabocckSRS
 O36zER5jvybUbTBjzfkOTN/Oe48aD3g+FFFhQhfgTe/nlsr5igSJOKmuZhwbnhNtsvHt
 x/GpoaeTJKosUcBmn21v4OkeDaZ3WhpdIx9C4Vx9RXFP8qB98Vq3DU7Y3XVcjZ9AFhzV
 4DvemghOhtASOiEfVZc5czN5XBKgZ7jhz3dnyKVX4v1sFfUGXs70Pd2peCWZZnuDCWa+
 I6dR8d1W/mx6LPrVYyGxWeoLLuxS12lrzQZ0cq6CderUeOeeRm9AOUHX5EKfdQLPlkYK
 XkJA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlTw8xrg+fcamwCUJ3V4RVSm8KVPWKr03RcnyeXBfeHEr4C6J/ll7XM0u5SSks9LT3FG79HgsqSg==@nongnu.org
X-Gm-Message-State: AFuF++kb1bIz5vnqM07H9WKGmlQSC3rl5BLjJH4H07aBqaU+BcOxIz8L
 8wwwFvGO6Oagw9WaVpEgkmb+TtZNj/CGkBVhAcRbFCCHmEKIN/ZjaL4ibSHs3RHkWablZBiN0Wr
 bq/XKs+wby6csIMIDarAQ8ho0h9SgL69AA6AxKZkK/Im4YvBeAZwy0jg=
X-Gm-Gg: AR+sD12OHU9iF//QATEFylt3cvBahLPq03fVMtAY1ZvPopH7v0ZWYmQsLEj5LKLx0tQ
 0nr9wVoauY7cgjG9PD9zQV1DEWyITcjU4aZJwzDc69MceCEAW5DCvVlxys2sX5Tc5kHrpjHxmeF
 JXJ0PhjEQBuwKsQl3XoVFxS5RjGrOLYneoxww4POnmVcT7cOYhzqraFfeJ5TIZ3DbPCDIUMTt/U
 09C21/igWc0ZKMiEE/cItE7lff1fxu3reyhNBuXSMo9TBL+/7/8X2OAnzEI5bLzXp2vC87vy2By
 NP/c37sJG5HC5+FVGoLvZ3A0V8xG+gYBYYRK1Z4VLPSLJAmS+MaHiFLZ8VwXjxCeSCKgdZvaTAD
 hxRi0o1qFa2H+2GkwO1hehhjq1Xemxli3TuNqiigX
X-Received: by 2002:a05:620a:29d4:b0:934:ab73:ac53 with SMTP id
 af79cd13be357-939134fe550mr3708539185a.0.1788256455642; 
 Tue, 01 Sep 2026 02:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:934:ab73:ac53 with SMTP id
 af79cd13be357-939134fe550mr3708535085a.0.1788256455173; 
 Tue, 01 Sep 2026 02:54:15 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b926874fdsm344672775e9.4.2026.09.01.02.54.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:54:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Subject: [PATCH v5 14/21] target/s390x: Constify S390CPU for cpu_has_*()
 getters
Date: Tue,  1 Sep 2026 11:52:20 +0200
Message-ID: <20260901095229.72018-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96a0c8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=mU8mmpTTODwToQi1tsoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: MPkhcqo0LfsRFq4Cu4p0gR6QBAagEyWB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX3nywdRLiweR+
 tCucTfsM4qHaEYFjruK9tbyWM2YCYVXYVGx9CuTZVJWnfh7u9cnOI2ASlL4kb1w2uSE50cyqycp
 7uTI7I0K8UgV9ZwCf4nDy1KR0nWg1lE=
X-Proofpoint-GUID: MPkhcqo0LfsRFq4Cu4p0gR6QBAagEyWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX6akDlT2bkRIY
 JgudQS/yldryzitUflVKGQzMuOFJt3ljIds6s4n57GtyQ0ajNfRnl+cum8VgCNLiJPzK+Lyj9/d
 tOJU17qVAGYPV9i9gEaCdqjJLI7EHHNWHTAA1VR8PiS1BtKZodQj+mWcUtceSIBNpEpeUyJLK6E
 eqodhsTJzKexHg6u9Mcs67PLVZvjowBqJXXBsdKc4x0wPOxYl3kLVK7+xNLufqTIFGF35uu1b2f
 ogN0VarIRz1s2f+mrPGZM6KMF2Y6sc0Mq8inRU/drjOx7QXa/4Xp/j9hUk8csWL4Q/UTdLcJQQQ
 gDHIeQpPi/tm1eA+efI2MEvqE7GLqthDUUVqh1yhf8u9ycrB3f48JZc4nFZdh/XDPpa+kwdN51E
 VniK/ppDj98JDe8/3VaKMr4wnbQb1EgYfqNxE6Nxo81/LXMaGXsRd0mZTypwMesHjgn073SLEwL
 Q+3u1dXspT/V0/l4KzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087
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
index c23ee1c8476..df1297b5c67 100644
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


