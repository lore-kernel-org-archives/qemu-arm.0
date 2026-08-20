Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EABDC5DF86
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9Af-0006Nu-5w; Thu, 20 Aug 2026 16:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AT-0006By-Ng
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AR-0002ay-UM
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:17 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7YWE807243
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=; b=hY/rB6grrmx4wRar
 B+Sby5VNJQNkBuZINlF4EO0c2AqLI4mozZbwmNKUUDJgdGxcd3zOXcvwu8B6qZzU
 ldzMKhfnvuGWZGu13xbLlw24TWoDUdS0WsKL3+fw7PPohpJ0hM2vGNRTdJtmjHhn
 J3exhm94935as1kee+TSN+/Dr80N3KgA7UVCHFBVcZXult4c+ohHcpFb7ni4NXrb
 HVa3Xxxppxjs67BkU+/DR5cq8EifLIK4op0xODiYIGwCrXC6Jg/+BKoUP7q9mRgH
 fs4Duu5A5MY9eEIgmmyOVIhC6KTmgg6Pez79vZOZsrDFsQuhhH+Pyr8YJ9m/GgKS
 fu++Yg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb381-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5174a236220so2459591cf.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256903; x=1787861703; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=;
 b=gWzaDYSqB6+Heax4Z+TzOwMiZ33KGuqVdYeuQhsW8Q2ZRqHzxP+p6/pQZ+1+mY8wUs
 Al+cIrxsfWB6XouSZFRmZXhyiCT/zAyrlGFloijNLdnNH6je8ZVMBb4oIhyEgKYf0ShS
 I18V+5L1LkF4yjukoDoHte4/QzwWerX/g8Jr2RAbQjSHbUKd0peT4smgJQZDF7RmoXsa
 xgg8yRNMiT5TJJc5fyM/GiW9kPXMIvzM1fatmYVFhwBEPsBiabXxg1eA6U/SFDjmNgEE
 QqMOz0I6RUaOpjKPnta9P6nOfB0Pojmb03tlbxtx5WQoi7rlBK+pYFWID3Tsor8Ski69
 KFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256903; x=1787861703;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=;
 b=FmqHu9eRzTm3lAm0Ya69YzjxKU8eeuuqfcb8DFmi2mGcwC/6hudldL7tKEVyoD3KjJ
 NLkl/1Ls5JrTBguml6p2Ayrisi7HbahnE9Qiru9C+rzd36KTXed7Qf+Cxe9fIc6jLIDb
 uG8V5CwFIvp+NggEIBpmwiI2B/BpkefzXzdgQRFjvpHiQr/1GPEwC3j8WXSmmb6l+oJm
 EEolofQO8NNtqEBUt7lfgbMdNLTZKIo7evuAYbaJ4fm/J7LAVGmNSX/WjxkOWmkPU1h3
 me+eFGsr2+3JtM54s8Jy92gVVbAXqgm7RFK6v2Cpr/81R2AekR6ASBEW1OPEfoztqtEu
 Yqgg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrSxOkFYoVYhqoBs5JWXvmEbQzyOKJzxzbpkLWSSfZPPwGDhAL4qUSR+qFGcnVjOM61+nUItMJOcg==@nongnu.org
X-Gm-Message-State: AOJu0Yzwnkt4X4nXfjjkV8Sthnq6aEDJg0VUC8rXW3umJFSv56SFpltK
 K+h3rZ3BE1jkXq/2AYKNR9aoAgn/PEBwnYZ/y1CZxSQqYekpA9T2jCONldsgl3jPExyWzQrGD3n
 yK/09ab/6fPgu3gOOff9B2TF6IXX1ou8KewpEwcxuUbMrETVe47E7u2c=
X-Gm-Gg: AR+sD10LdoJKJfAZEYcHvQyLQ4C0mT5L8IUVkwXOO6f4DNpWUaoBcH0pid9XAoZ+gpg
 xEv7M+f34k1D0PQ9wEjs+lihmaYgzcCjy0GNf4f8NEDw7Rr5GIeroSYd1+vdn7lo8p4h18MEEjq
 RNS7quvQj2a6HNoTeJuBGBWM68KNhsYqjV7si0ph9CZzzHsHoRH9xlqlevRqDwjiPsKkPJVQVj3
 D5V7D5ipENbAgtdDK7fQ1HvGAJlPNkAjtq1va+bGL7AxhPT6pNLn5gX8CM+k8BewXTY/KYz6Ptd
 I++RdGM9eYxWXnc9veJRXQDDsfK7jSQjxIaqd79550i2wOu4j5lWwj9ZaYcyzRF0AxeIi3KVFeK
 +tlRAvmrBH6rZlP1P4N6TVJCRrxRt51Sf7iLp2xVzoQ==
X-Received: by 2002:a05:622a:4cc7:b0:52d:8743:bc83 with SMTP id
 d75a77b69052e-52df5a4041amr10547701cf.34.1787256903358; 
 Thu, 20 Aug 2026 13:15:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc7:b0:52d:8743:bc83 with SMTP id
 d75a77b69052e-52df5a4041amr10547121cf.34.1787256902918; 
 Thu, 20 Aug 2026 13:15:02 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b98e765dsm108725e9.3.2026.08.20.13.15.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH v2 08/15] target/s390x: Constify S390CPU for cpu_has_*()
 getters
Date: Thu, 20 Aug 2026 22:13:48 +0200
Message-ID: <20260820201356.29775-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a876048 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=mU8mmpTTODwToQi1tsoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 2KoNA66ueKC6weyAPSE2OZMdW5W14Y6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX5CijCeb87zKT
 c1qqjETkcZvUxxjQpeAzlzQJ+CVm32xgeuqkCdPrso09fdIbFNIBcprgV4jaQ5PinCTF9fsM3VQ
 dfTtMsdDfM2zzWR8w49DfpJHiOmB+tNEcLyicQDFMMQlBfP9b9is69O2KS1AkYpsW5qiJ70wXY3
 lCxOg1p/XmZKnSAPsyTNnLzs2bQfh84Uf/U20PqTJ6faBuCAzUwGmdoKSvNrqz3QFK8w7py6Guo
 Vd10L6CjpIm8VSE+Y7UiMCCirO2gqH4giCwve2KvvGvwUNVjvS/uV8PbMd5NVdRFmMsNnQ0QyX7
 zchO1etJAL391EqGXBmBiAbNLlvkShOWLpU6tVXvTyAXGB7EypFeR8xT/ooTzKlCFN9w8u/L2Oi
 0T5gYsLC1c1Xdxj3DI0ag/An4gp2xS1NBoFcWwHMkrHdObY9WltLXTGjpI+cqKn6sCmAtzHKvSx
 279T76JsqE81ujLFf/A==
X-Proofpoint-GUID: 2KoNA66ueKC6weyAPSE2OZMdW5W14Y6U
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX0NeO8HM9WXQh
 2yHKPG/9aVr0SVlG+vE0xJ/OJAmQuhecwnSJMBwlEayDjNEAMhfxyUhwSZtH8tgc9IiWvIfbOuB
 mvZDHv66l9r/o1be91TCfwzT3nobjtU=
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


