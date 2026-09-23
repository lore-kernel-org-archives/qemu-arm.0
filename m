Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA80C9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:12:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QVu-0003iw-Un; Wed, 23 Sep 2026 13:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVg-0003XC-6p
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:11:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVe-00013Z-G6
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:11:55 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTrrH596174
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HjtG4nBnBjHP3J7mmX5f2+INYZmR70rs4qc55y42Quc=; b=bDq2X2PbCzU42CWu
 OCy24izNHNr2V3bCqCIyzM6ipTncVeeyl5BvpBxuY7H9Xw7JzholTVLIVPCE52iC
 FkeVhOtF9JXDW/ZC+SmaC+fdIefcoPQ1XnOK5Ca+eyCc1aWrGlZ2kQb+wv4xIMAZ
 FUCNnzMKS94caIScslRf846o95hzA4SXlQ4fgDmTwIC+DTxQoWhUTFXtltXoxdqL
 rHXedrlUEkahNW7JQdZCs0HYoKqk8PELsESffyTvKFXg0lxXELtIQyfJj71oyN0W
 5VhMHXpV4dpwRSRG/Mx++ix1cJwlfvo/d5yo7SFSrGdWPbVX+5vKrzaJKkB4ec3R
 EtPcrw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3aw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:11:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5c8337b12d0so514708e0c.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183502; x=1790788302; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HjtG4nBnBjHP3J7mmX5f2+INYZmR70rs4qc55y42Quc=;
 b=IovOGKS+wrgFKDJ60LoXMlJlLWCvLCn572dkckWKFYZA3P1R0vBCf35KpPAUzolgUr
 1kIFUbZzgY89WxPwHponmbRaQrqOrjbqH6cg6WL/tHywiuJOPBvRaKFPpUIAJlHi/99w
 Bhj0o9pdxSvIWob/lHb07lyHWc7xxhhpB3QZ9QSdGGsxQv2N12lXcWo3Xzs7ygdDt/H1
 tWEV4+QQBRvLIgdW+5T9ICgMcssiDIkhV+KfVvJbskF/JMg3LbrVXbIGWZYBIjzbj/wQ
 +pQzsIMgx8xHI7YvIoQZeERvtM/MkN3qArk+mrL18vtZ3ni3bQqHBRwQ/zRsStTU//TP
 ZUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183502; x=1790788302;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HjtG4nBnBjHP3J7mmX5f2+INYZmR70rs4qc55y42Quc=;
 b=YzPDG8MNqzmfox4NWaUvWH1+3/uyY+yCMNUlj5KVUoxbWgZYoMVcWnproih9uvhMXq
 qQRkIxQmQjU9STqmiUrOkc6llXkuRRiR+O2bqpkW08rzDp4RLEYbFa95iFLajFvVN+Go
 BhoAr9yIZjRNd2GLnEreBbuq2XXHiLWHX9dnr8FAizzCmMexOdv5IvXZg7PHpFj72Pzc
 nERGShbjwXtMI6nkAmD1v1crTSGRnTJ48GJlFRNkoqLgt/DmNTxCG6P1E7pnqIHCb8Vx
 JLZNoQVVH4sj7QgdipHlTyvu/bk+NqF+2ICrWV5uPpDBnb1fNg9dJ6C7YRTlwOA1BMwZ
 Yzxg==
X-Forwarded-Encrypted: i=1;
 AKwUvByiY9Xbb4mhCe8QqKm+yQQzhW4chLuzblxnxv09FSWQM6HkETXsXLvWriwcWWBpAW0GyHLKDLir7Q==@nongnu.org
X-Gm-Message-State: AFuF++kNCaRw40RFKIuuL2McsZ90Ys3F1N7Jd1BD9oFdVXcjMcFTiLAE
 2tEidKNs12Vqu7cdachrFJoZQS/iud88u2qAyswThVLfybwza+1knlerJ/wtw1AiA3pjugwwDL2
 TETphjJKq62tMLm8pkJhN+pwvy9A6aw9MVLyHnGnVUtMkpdU+iL/O6ng=
X-Gm-Gg: AYBFou1BwiaNj0nl2CTsH3K49+ZnP3VupC35ySqvgEa9xJBvs+MB3KjqvPdty/vyNm/
 YO3hl6ykA5mmjfWYmVjnx4nYlicSP7sj8WFiCWXhhkXG/JOPYamNKtONu4vvWxgyWE7rDL21IjG
 AXt83fo1mpwnsZjbmgCBhdgsK54f2UE9NATN+3ljHWz3QSroU4idbxcdUUErQCDGvM66/5jLohX
 fR4mfOyeHRfnHGEs7e5jE9YM4J4yID0uIZvY5ZN4orPQGtFXS1G/Md9huKYcKtMziIuihN1RrEU
 pV8tKl6yIb+zVHnFR5MrQN6lnb8lWAm0++c+bUYI6lBRRN+GTOZv8vU09AdWXm4KSSn5raOLuek
 tXd/VAJWfCnHKTlsqwU7gQhmwvIy0br/ye54cuowb
X-Received: by 2002:a05:6102:94b:b0:7a6:a24e:8140 with SMTP id
 ada2fe7eead31-7ac1bd45308mr3214257137.14.1790183501687; 
 Wed, 23 Sep 2026 10:11:41 -0700 (PDT)
X-Received: by 2002:a05:6102:94b:b0:7a6:a24e:8140 with SMTP id
 ada2fe7eead31-7ac1bd45308mr3214241137.14.1790183501216; 
 Wed, 23 Sep 2026 10:11:41 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48868889130sm8042797f8f.37.2026.09.23.10.11.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:11:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v3 03/21] target/s390x: Make s390_cpu_set_state() return void
Date: Wed, 23 Sep 2026 19:10:57 +0200
Message-ID: <20260923171116.31276-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vgpWK6li-KtI0uEsXxfNWmTeGgevgNPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX0/v24KmYdV8W
 /+62cfY8TJdVj9lolH/OPGWEf9d8N9KfgfPx0RbzJzKlnXQJSvCMFrYAFhhJ9Rdf/03lZ9Emyv1
 4fneOyCaVj/rrM9MQcjTfaCbD2aKBVtbKUcITAAkS9FfpWzcVfls9Kus6LDqq1PjDLGf5KXdTNv
 XlYFbDRaeiujyMZArNk/Exb+wtTF2MIl93aNPvT+KXFgsgwR67V5ve4sFEKDVjcMA7Vpftty7La
 V2GTBCSPET6t1YJ+/WKJOlFLQxIkmeZn7OF8NlrE08aVA/AId3umTbnzmBCwd/w0OaSr+tdvq7A
 F6kTM1R0wFLvLJxb/o0mTUgQ1vZ+60Lu5QvH4yFuYgLmL9vv5l7Rp7XLBgEb06Tpn/C273Z6v/O
 peFxQzvfy9t3/MT/i2VOzvMFgIGTZyYRZKJCvp/y8NwE9WIjtOb8nkjqZbHzdVe5mHgV0vKsTlW
 eJSbtUIhE7yApPHXi/Q==
X-Proofpoint-GUID: vgpWK6li-KtI0uEsXxfNWmTeGgevgNPu
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4084e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=otiJeUf2ZByGLVp8V8QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX+FmuvBw9mGsL
 jrCiss0RjJKEuxaU2FhRa+EZt/EozWrwu6JyhLJ5DDWIuB9iSZd7CGW2SrR/q2K8hKgxY4+MFjX
 U0Wpn7aRZdAM0M8DyEw5BvJ0hSYZKCs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
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

The return value of s390_cpu_set_state() is only used by the STOP
interrupt handler. Make the setter return void and count running
CPUs directly at that call site.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/cpu.h        | 5 ++---
 target/s390x/cpu-system.c | 4 +---
 target/s390x/sigp.c       | 3 ++-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 998bbb0d7ff..2d1dcc7045c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -847,11 +847,10 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
 int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
                                 int vq, bool assign);
 #ifndef CONFIG_USER_ONLY
-unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
+void s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
 #else
-static inline unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
+static inline void s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
 {
-    return 0;
 }
 #endif /* CONFIG_USER_ONLY */
 static inline uint8_t s390_cpu_get_state(const S390CPU *cpu)
diff --git a/target/s390x/cpu-system.c b/target/s390x/cpu-system.c
index c938c77d0bd..52561fffa3a 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -236,7 +236,7 @@ void s390_cpu_unhalt(S390CPU *cpu)
     }
 }
 
-unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
+void s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
  {
     trace_cpu_set_state(CPU(cpu)->cpu_index, cpu_state);
 
@@ -267,8 +267,6 @@ unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
         kvm_s390_set_cpu_state(cpu, cpu_state);
     }
     cpu->env.cpu_state = cpu_state;
-
-    return s390_count_running_cpus();
 }
 
 void s390_cmma_reset(void)
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index b6d44c5c31b..1801b8caa6e 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -617,7 +617,8 @@ void do_stop_interrupt(CPUS390XState *env)
         s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
     }
     env->sigp_order = 0;
-    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
+    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
+    if (s390_count_running_cpus() == 0) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
     env->pending_int &= ~INTERRUPT_STOP;
-- 
2.53.0


