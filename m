Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45266CD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:50:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Dg-00059K-FT; Fri, 29 May 2026 15:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Da-0004qo-R3
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:50:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3DW-0004HR-Ft
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:50:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4903997fcb5so85242985e9.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084200; x=1780689000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vn1TfSGGJHYXoT5p86UQzNNg6yKLfh8iH6VFrIwRfTU=;
 b=EI4L2/6sAulMJ+uM39T4knyYDbRcNtG57hwYRCWwiIYi9Rf2j4LdqDNN+HhO9/5+0z
 rPClJWgFQAKqut6w4EQ9SRd0PhItD2r0Jx/zkgh3iCX0qKA3r4+UXVNJ3VPR83Ge1CpG
 YOqKxMlXgzMFy99QmG/78dcDdfSEUq0y58PPGP4yijeAv9+FbNB6gyGGgPGqd1bGzaCz
 ncg7pS4ybga4TmtbVI5wMfNUArgJ51c0YprybixXTPOI1ehwTa9bwG0lNuPwDoEyLp9z
 64zbuBGtntRLcBVG8DbQQLyiwgIinJe6E5s0bdmjiF9pJ078j3CGewAV8XTVnKrzUsHg
 p4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084200; x=1780689000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vn1TfSGGJHYXoT5p86UQzNNg6yKLfh8iH6VFrIwRfTU=;
 b=bRfz1QBp3F/P5F2cu1/mOooWxW79C5X0mW/QbsdFIkEUlKQ32+mpbvDn/LWpOc0mte
 yKilojeWlJ/JQNqlytjvkvEQhIIaNVl1Nb4+8/ix/JEXEQ+IrAEdHl2vgXj560ze0S1i
 r+WJcdoCTtutkSBZKBjOcQuqRiQzMg+VoiKFuGKlSVjV6MccqO33xQLA9v4K74yNHw4V
 B4ecmTAlKCh4xBraP9/10aXgA/o7HUPxI3VigTeH9aTvxtGRQNe0qZuot2cmxLVX3AXU
 yQuKNeks+xlnOR8+n9edJw7Sy2x8njRCpKXR1Bsp2S3CsFEoWLVXUjzSDwCI803i+kp8
 dgKA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/GjCLtoUDYMl26OCo+4txQZ8CcCTf2jwO/03lueHPs5J+l0Uf54p/QhfhNsuvhe8M1k471zkWGxQ==@nongnu.org
X-Gm-Message-State: AOJu0YwmccekZDfuXgau3bQAO71EvaWh2dx9joU/ppF99Gq4IebO4o0K
 C2jpNe5GYM9yFDd+SUXM5HkORCrfSjIq5kuHs8wmR/OIzBc2M8OiwwpAtmXtOTxVXi0=
X-Gm-Gg: Acq92OFNo+OLMchq6Infvc2WxQL/quwpXG9j6JOlKi2yEyX834P3B6qaRlBR92XOeGJ
 bRlxihuvqvWzLRu9UZVdaiAGff71nNdRJXESc2ifhCdsTiXMzsze1oliN3VYH2LNSR87adhNsVG
 yNwa+LfBNnD1/EQenoYHC/AU2vnAOb6xvtPe1mkXHS8C5uWmFsCBQy2UWr8dnX5ftsyKzpURObf
 Nv6ArgZFk071ag/AeMXAew1CMHQxuoDE15RyDMA+A1yY1ntTLnq1/foGueXg+fmpPoCQM5pe/pH
 lCmsHadofoBext8moi7nS5ykFKp1ZTLsnFuTQ8Xgr0sKLA/4nHAZbwGM/lyUFekYfCNEiJRj80G
 7xv5pQALnG4JXfE19Nrg7z84Nu6aVJVZOhBZwn7jgUAN798cn8pQSx0knkMZLaWw83xRQbnqsPi
 llPW7UhUlagl6DNUJFh48ZiVSSK7pJedD/RhCH2+q+YK3mFc4Y8Ef+iSZH+48dn5gDSw==
X-Received: by 2002:a05:600c:314e:b0:490:31e:d6fd with SMTP id
 5b1f17b1804b1-490a2968488mr16252265e9.25.1780084200053; 
 Fri, 29 May 2026 12:50:00 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef357635fsm5573661f8f.33.2026.05.29.12.49.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:49:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Johansson <anjo@rev.ng>, Claudio Fontana <cfontana@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Reinoud Zandijk <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/17] accel: Remove AccelCPUClass::cpu_class_init()
Date: Fri, 29 May 2026 21:49:24 +0200
Message-ID: <20260529194940.97143-3-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Last implementation were removed in commits f50d0f335a6 and
a522b04bb9c ("Remove AccelCPUClass::cpu_class_init need").
Remove as dead code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 include/accel/accel-cpu.h |  1 -
 accel/accel-common.c      | 33 ---------------------------------
 2 files changed, 34 deletions(-)

diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
index 9e7eede7c3c..88c0815e2d8 100644
--- a/include/accel/accel-cpu.h
+++ b/include/accel/accel-cpu.h
@@ -15,7 +15,6 @@
 typedef struct AccelCPUClass {
     ObjectClass parent_class;
 
-    void (*cpu_class_init)(CPUClass *cc);
     void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
 } AccelCPUClass;
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 62590a7d9a6..ebc103053dc 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -32,42 +32,9 @@ const char *current_accel_name(void)
     return ac->name;
 }
 
-static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
-{
-    CPUClass *cc = CPU_CLASS(klass);
-    AccelCPUClass *accel_cpu = opaque;
-
-    cc->accel_cpu = accel_cpu;
-    if (accel_cpu->cpu_class_init) {
-        accel_cpu->cpu_class_init(cc);
-    }
-}
-
-/* initialize the arch-specific accel CpuClass interfaces */
-static void accel_init_cpu_interfaces(AccelClass *ac)
-{
-    const char *ac_name; /* AccelClass name */
-    char *acc_name;      /* AccelCPUClass name */
-    ObjectClass *acc;    /* AccelCPUClass */
-    const char *cpu_resolving_type = target_cpu_type();
-
-    ac_name = object_class_get_name(OBJECT_CLASS(ac));
-    g_assert(ac_name != NULL);
-
-    acc_name = g_strdup_printf("%s-%s", ac_name, cpu_resolving_type);
-    acc = object_class_by_name(acc_name);
-    g_free(acc_name);
-
-    if (acc) {
-        object_class_foreach(accel_init_cpu_int_aux,
-                             cpu_resolving_type, false, acc);
-    }
-}
-
 void accel_init_interfaces(AccelClass *ac)
 {
     accel_init_ops_interfaces(ac);
-    accel_init_cpu_interfaces(ac);
 }
 
 void accel_cpu_instance_init(CPUState *cpu)
-- 
2.53.0


