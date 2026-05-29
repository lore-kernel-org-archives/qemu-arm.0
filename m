Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576C3CD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:25:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSy9J-0003d8-Od; Fri, 29 May 2026 10:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy8w-0003Rd-6N
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:25:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy8t-0002JI-6o
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:24:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4909e3fa4b2so6257265e9.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064693; x=1780669493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFEMIJ2KJOaWjwhyxDKINz2zmIup5qa01FGrlMeKBW4=;
 b=TMIOQDfjIwR9CiLgenITha2FEEhEduOsWN4A/UIoU5aLCwpI5fiuwfKJb6km+Hz8FR
 1Ws4gP/ZsXCn46yYPaa5X0aIF3K+iNPia+4THCmMCEjnbJHimdr9AYHtnZNnC747Js/Q
 AwV3wIXzRiizDI4OFifpB+etQu2e35ksBEoSSTv+tK4bmPjhAdz3rRGwkWI/OlPZEid4
 28GRC+XoM8mf/sImff28Q4lcKpflHW+t12qWqxcpUGkfx2O6NSWQbzl3h4IuPIq4vc9x
 E8ZGzhv+nDlOYSAIOij16W1BdQbjfjaTUPaTT8PZQjs/NjlMph6s1pT68kqlCANazeus
 SN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064693; x=1780669493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nFEMIJ2KJOaWjwhyxDKINz2zmIup5qa01FGrlMeKBW4=;
 b=qZ3eFXWoWdirziveCRd0cnWiuipvIB912Bp2VAbPR4EYJuNlwkGLx/nDkWnD0Q56jf
 RnyCe9+bAWJlCdyU9xbNvh346cnkVNzxj/m9QtbrDPqcxeZLpaLByx2LTQ3ipPlR/tBZ
 YlNTxqEMhB2gZ3MZsRilMy94zNIS3kPBB7+jC3PS5DEj6kdFGBl0M//KhMh7MmmN2dUe
 hF3D/CzWobeqnhUv5jD7GJf//VR7ZMbl7LMMYyhv9Twt2EET6xyz6qZeZkAba53dzVYV
 b3CObmcOZxnsTCsHKAm36xP+YkZ8AGk1wGiMyyw92GJobSeuuL3RVA55dmArjRpeTcrB
 MqsQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RfZjwU1Q2PvlVFvTX/e+nmeHPPyP2iWX9jgyaoQ63GLPqtCu3JPZ8mUS7mt4yQu3ECjKrkIjz6w==@nongnu.org
X-Gm-Message-State: AOJu0YwHEsFpNm2g8cgnWCSSZCVwltO3luO+FccfEG7dD0bfefh49YLr
 gsc4wQfdlFcq575ysKE+HmRMPnjzELb35Z793qEczvDhaSrorwxTMpeLCGS0ryXcEktalBS1r1c
 DnXFZvGwn8w==
X-Gm-Gg: Acq92OEuXpbSNR1mtqTvqYiWEU3dNrKvzhwQkZnLUF6NqSwIC+2dJFl4EeqqJ7knT5R
 6a3pdONiT8muEO22oTQmIa/JY3KnWvWc138t3sWGsBzyYXtvz+wS3qwK4HIWN1jBc5M1GPVDkDN
 /QqwGEDzGHvHnrkOmYLbVbP58GJMPgpN/F/yLSPUPynIuD7C0OirQoH5pE9l00afdJW/IGyARCz
 hN1BmojRjJtXzWrFmdIxA4JVOgtizdYzLkA9+NaV+o1qhfAPUfvkacimdj88B7NNmPcfIm2wAos
 gXU6o7a7ruyQGjaJAyspn2p7jhFjhlv+rXsgwTkyKxsdT+uWaSzfMdD6K2DnmL6FazEFFTUVJog
 YbQIQ17P4HIZFAIGEYtx0lVAS2BSeTrKws73/AXYERwcrteKsQcawiVD0OewmPCHDK0sdiG42ie
 KeqGP05BNCZ+ClrGuOr7KJwz3ihfOogVnYdpBgoekmCwuuZDpYiGXPjO2hoOcxgA+22Q==
X-Received: by 2002:a05:600c:1d18:b0:489:c57:7836 with SMTP id
 5b1f17b1804b1-4909c0c7ad7mr56817125e9.27.1780064693487; 
 Fri, 29 May 2026 07:24:53 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6e124sm47683785e9.7.2026.05.29.07.24.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:24:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/17] accel: Remove AccelCPUClass::cpu_class_init()
Date: Fri, 29 May 2026 16:24:18 +0200
Message-ID: <20260529142434.87880-3-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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


