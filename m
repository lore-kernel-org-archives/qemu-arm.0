Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA72CCD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:52:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Fb-00023U-0s; Fri, 29 May 2026 15:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3FX-0001d2-M4
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:52:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3FP-0005Df-Sp
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:52:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4905529b933so58993835e9.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084318; x=1780689118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7VQCJEvvCPJhqeFVLwDWN0jMeOhEhmoHcnTRqEwJrI=;
 b=knX5VHM+wAgvJ34ztiGL8xuEEkhxiO5Cv+80ubUmk/OXKvJnN3zAq2u7eaCJMz8lT/
 0gVO4sduPX+4oFR+Oej2umc3F0DR1Xt+/weAXlXV8bZEqi7Pp/+EFPejMFaLJCXrHSfk
 1zBoryJXtEKXT6tlis56OZwfFUiNrfDg8AZ7e5rRxOQrD2L1Z7ZPdxLz4IPzJ6u/HTdW
 X/ND1D3hT+/1jraaaiEiIbSB7k1aqEo/aBqH76vMWTGxtHKgBX2HH5aMhfSuIpBzlaXm
 yJRH4yqTKx3lXfdfJL2jaN3pQSDalCv65hr/wuvD1GAUltnaGvVESTmTJg5oxSYDHNNY
 0f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084318; x=1780689118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q7VQCJEvvCPJhqeFVLwDWN0jMeOhEhmoHcnTRqEwJrI=;
 b=AYYqOJpdXtbU6fxvOwmp8V0eF8K1Kjr2FPZj5Yzssak5/BbSNXynGWGxmrelqky6NH
 oj3u1xHDgQ36zVC53zcOeR+C2n+BZeokohguREzkf1UZsRsxATUg5toRxnW6wnNwkRbJ
 Hc9qk7Fqmsb1OHOaeGoiz2UF5ppHp18jX1cwB71OPacdmgZrNbtD0+t1EPcboJKPDveb
 UqontTkfS4NFPRPf50Ep6JF4I7WNaro+10nFVCvpAz9d9C8KGRgCrOjZrNQLuJT0W6II
 tmGxv9sn9U5dVCrNWQUJ8JXaomr0e6eHyC0LNeHfypQ8FN5/Y4fXFBDRa+osAxfFSL+7
 FYjA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XN/PxDuS9JfITYyK3ObnJPc6dEruFQP4pin9K1wGTq+FVN5mM8o238N1NtOkuxVCrVsAae2J/qQ==@nongnu.org
X-Gm-Message-State: AOJu0YyBnDO5NCvdEg70VR47ejg53KFIvpGw9z3iPLZhWkVHlZk2Xm+r
 O+CkJpKXLYcOCDv3VhDMlO2xTcFrCiIexAQrE5QXZIrXoO/sYIMF5a8V8bPIvr121ig=
X-Gm-Gg: Acq92OGhToKuF3KtGREwYBbahBodSjjPBqbpeJAVmeYYu1T71whkdgZ6qBPS1uSEPV3
 ljZCIYIJpiOz9YNDNxjK3iokL7LUpcmsiRDYx2DZl1f3rIge2Jl8wVC5DFS9z6jvJ/YhgHoqACv
 w6SrfisIJMn94xsGy9I7dwGmcJScS1y8pu+MsWi1d9VD4/dt3WmQ1sRFn5lwf6kLXsxGvGbfHAw
 UUgE6JoCd9Xm0IehzG7utxz8mlTg9y4aiXSha03V1cWgQqz9uZ4Pxk5UQcWo9AMzwcqdGmDxPIe
 b6GOXl/sutRUhPSQhFlzKqNyjo7NtMdZ0cSNOgeabYKGb9Pji6kC4+ZQK/IWIuGnZ+Fb/Cl5thz
 rI7Ym0XpgkzhpxidptR4EfdOWvysyziD50+4o0LWz+86DiHWcDiiVPs84YlAdDDtLHxUgJ0GLNN
 54us5/IroIgWpVDROCqC51FL2Mjbl/JGrjSU92pZCnUNrWUMxKEeUIZfN53rxJ76dsQgzTMIXyU
 5FJ
X-Received: by 2002:a05:600c:4f05:b0:490:50e8:45c3 with SMTP id
 5b1f17b1804b1-490a28cf434mr17780735e9.0.1780084317679; 
 Fri, 29 May 2026 12:51:57 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68b853sm62908705e9.3.2026.05.29.12.51.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:51:56 -0700 (PDT)
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
Subject: [PATCH v2 16/17] accel: Remove AccelCPUClass::cpu_target_realize()
Date: Fri, 29 May 2026 21:49:38 +0200
Message-ID: <20260529194940.97143-17-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

We removed all implementations of AccelCPUClass::cpu_target_realize,
remove the calls in accel_cpu_common_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 include/accel/accel-cpu.h | 2 --
 accel/accel-common.c      | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
index c42221f96cf..d7ea45ada2e 100644
--- a/include/accel/accel-cpu.h
+++ b/include/accel/accel-cpu.h
@@ -14,8 +14,6 @@
 
 typedef struct AccelCPUClass {
     ObjectClass parent_class;
-
-    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
 } AccelCPUClass;
 
 #endif /* ACCEL_CPU_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 04482b6b57e..d8ee6d62667 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -52,13 +52,6 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     AccelState *accel = current_accel();
     AccelClass *acc = ACCEL_GET_CLASS(accel);
 
-    /* target specific realization */
-    if (cpu->cc->accel_cpu
-        && cpu->cc->accel_cpu->cpu_target_realize
-        && !cpu->cc->accel_cpu->cpu_target_realize(cpu, errp)) {
-        return false;
-    }
-
     /* generic realization */
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
-- 
2.53.0


