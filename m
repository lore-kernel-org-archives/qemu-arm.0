Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73513CD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:31:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSyAG-00064G-ED; Fri, 29 May 2026 10:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAE-0005xa-2q
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:26:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAC-00036V-62
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:26:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso647822f8f.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064774; x=1780669574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/Ui1jevrZtyJRpeW9wEoANBK4xBgFParODxQakXLb0=;
 b=oPzxL5a42MWWZwVd9vwCcF7aEyHzU94MWovlWTR/pXjk2WznPeaimiaLWld+Ew3C/Y
 pWFH1Z8bxMs+3i2HQEGBfg2xVkAFXePthzEkLPhLyDHJmsWiZo8s/Des71pWACOjWkYn
 IYnNhoara58dWl7/+V5p6uRkQmcinM/rcHV+JwIxKcCc45Lz7FPZiyeuU8eEpv44sGyX
 Aim8uRVtqzAQ6j8l1LWfFffo0kqiEGwPOr1/QWzBCLQA9av0lr9gYwSQaia5HD4d2ZuN
 LwgPhLMvEroEjY7oypwx1CWYWeJ+q3Ou6vPuDfjyQXFI9Niy46SE2I4T3PSxWZOa18l0
 brBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064774; x=1780669574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U/Ui1jevrZtyJRpeW9wEoANBK4xBgFParODxQakXLb0=;
 b=HRepN6k+uSKvoDzJ0oIygyc+xwYHWc45YRhLlTfqlTMFnk6LmwPMOoZsqde+SdDD3r
 oOFC/wuJ/cLPeGiq9OYRkxqcn7FX9n+JEvFMSMxA44dUspfgAZJE+01wx/wAbE0Wgnlw
 DiB20CwB0lwS322+unzKuvS7Mf4jLg/6W6Q2Nv/5MDL/9MdvJhffE/UkycvPmKpeoro4
 ewl0Ez9nD7ayX+hbmoTSHUgcm2zpKPzEY9dOnheyE2/4ZQqbSp3TMqE6XygZgffLy0ng
 FDGLRk1Na4bhALzjvDzyIs+gPLX8COYI5H/qgiirNjfThEOvgGeWJCNFYeWTbl2nGGx8
 +Lvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9NglJSpHUzGf7RMZu38gLp9X+PtmsinKgfLW/bPbLx5cLZRu+JDozqb6szzuZyM3L8/FfFmy86qA==@nongnu.org
X-Gm-Message-State: AOJu0Yyzq8U6iVMhrh3VJMRz2vsGCFrrjtmJtVaMd2PyUNLSwzViNb8T
 gpAZQRvx8OyAABsNUKn5Ji0nFNv0wv2yRaJjBh4vaL4WOuxfoodt4YqmdI0JIuQkS7Y=
X-Gm-Gg: Acq92OEIGTVGTEq+wgWitwE7SFTI0lT/cNPA57nwMDqT8BUWWfxfpoi8GSrJEDjF+kw
 wlZ8I3cTzVNibyNlNkFhhh4uffikuojaDr0owJ32VxqFuD/tprxJ/M1IcsKcuBtNZ0DOogdhYRi
 GKEXYlleN8t4WVs1Exh8NqE5M3e719sidm0+N53Q7rtXwMAAQzr0HxsA8w0bqmZ6CiDidvQI588
 ND5wNYgDhSAoI5oIu/PSCy3NWL/bgEmPgAFiHELDz8uWu8bGDQjvhc/yXoHptfPo6AlDi3xWsNC
 aqBAIWWbnt+DnBmvnw5U4MYuRCBiUULqjvMEIpMFRFc0UhBZ6Y0blszXyShCwtrpyx/MkShMfc/
 ZakramuGVD312DP/j1YR/kCb86R5p1yIMpKjYI+xdp2PUIcEf3B6C+TQHeM936h2NcPnnx2Gm2L
 vV1IWl+ssfE4KLADD+WIOzXbNWGK9DO/Ymjs3rTwcKpOU+5vuADhJ3QOaAz0X7Q7V/RA==
X-Received: by 2002:a05:6000:1a8d:b0:45e:ed7e:f8f7 with SMTP id
 ffacd0b85a97d-45ef6ae96e5mr159213f8f.2.1780064774383; 
 Fri, 29 May 2026 07:26:14 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c50f6sm4494831f8f.16.2026.05.29.07.26.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:26:13 -0700 (PDT)
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
Subject: [PATCH 12/17] accel: Remove AccelCPUClass::cpu_instance_init()
Date: Fri, 29 May 2026 16:24:28 +0200
Message-ID: <20260529142434.87880-13-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

We removed all implementations: remove as dead code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/accel-cpu.h | 1 -
 accel/accel-common.c      | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
index 88c0815e2d8..c42221f96cf 100644
--- a/include/accel/accel-cpu.h
+++ b/include/accel/accel-cpu.h
@@ -15,7 +15,6 @@
 typedef struct AccelCPUClass {
     ObjectClass parent_class;
 
-    void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
 } AccelCPUClass;
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index b3bcd53a4c6..04482b6b57e 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -43,12 +43,7 @@ void accel_cpu_instance_init(CPUState *cpu)
     AccelClass *acc = ACCEL_GET_CLASS(accel);
 
     if (acc->ops && acc->ops->cpu_instance_init) {
-        if (cpu->cc->accel_cpu) {
-            assert(!cpu->cc->accel_cpu->cpu_instance_init);
-        }
         acc->ops->cpu_instance_init(cpu);
-    } else if (cpu->cc->accel_cpu && cpu->cc->accel_cpu->cpu_instance_init) {
-        cpu->cc->accel_cpu->cpu_instance_init(cpu);
     }
 }
 
-- 
2.53.0


