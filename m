Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F0FCD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:28:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSy9K-0003f0-Jb; Fri, 29 May 2026 10:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9F-0003Xh-4p
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:25:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9C-0002Y4-FY
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:25:16 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490426d72f7so71385665e9.3
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064710; x=1780669510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6oyorGlH+SpcUBdmmr9vp9bR/hdFD5W9NOUghfpRrA=;
 b=eIz9iOEhGNh2aj5BqZyZAukxO8VrDR/QXCxHk/GbEq+uSVWGDgAioT6MT6KIohJPsP
 PuZy4O0bD3q54nzQWwNbjLdneCxiJA5USunX40vgXaTHmUN3ZWo6++2yUn8OkJEmlybg
 +rEQTehQa71CZiR2prjRGl4cPQdmTGAJ/lcmy0eBTIau6sSn17s8xFMEq5mcbwpl/63r
 7hEGligs9JHSNPMT6mNH3AEl5nKA43iDcIgsSxJPNp5OmpM3jv5SxGqMkH4ME4Nq3rly
 vi/t8IKw3HoxsJ7F5a9QyXIyr94YDI4rIFSZGMHxJ275G2aeriBBQ/9TKtdC9pQ+TF8q
 7oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064710; x=1780669510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P6oyorGlH+SpcUBdmmr9vp9bR/hdFD5W9NOUghfpRrA=;
 b=DhmaTo1GUuY6Vg8H5zUCeJAQWtHDdGdE0kQ+3pJQ6505JZbHoCVc+xa8j7+M6Zgge5
 ZDN2Eb++Tp18tHALaP1q5zN2uzlrJ/BHkhWX0+XubMsiEHY2ou3iR686oKV+nZ8bJWVZ
 xGQnoON2/3l3B8KU79ITGzyDYDRvpUcB6ndt5Yta8/NlhbXciU9N0eRJT4rBd3wa8oNs
 FSwsnMF5W+5OIPF0WdVH6NcZjKbdIYqtKooB+h/rcn6uY4u9IU0vgvLzflG4b+rokp+x
 eGzff0q95ZewxwuEQgY0r5RZ3qr+A7xnSdZVm3/eVJYOl8z3XhFzmyosuWJuS0qx0B8V
 NZBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lQoiJlBffxEZHkDLU2Mjl7txmQqDL8q9OagCRmNxaCSSSWGMd3UEk0gey4HElXyY405MUznOxzg==@nongnu.org
X-Gm-Message-State: AOJu0YySJdCu0tcmDwFdp3fj7m/ppBjQSEmKMUaDqZ2EiQnJBnIvwWNL
 ZNDSebXT+cleYHLKWoCVZNYz/PkwddNJjo/UWIlPkChUbq6AVh/Bwky/ApddY1Km3s4=
X-Gm-Gg: Acq92OENpLNsPnRViapALPqNJFckkEQD6ilIyiar01ivXQifMoJEYzaiT6Uac7KOHHK
 MDBtNOvjSQT/yQv9NueTY9dEe5yuCf5DBIaQeSklr+8+tDLAZ6kRmG9SZbpBwbEDzrO7zqX6s4b
 1rNT8lSRnCwFXgYXWbOEJfpn+7XSkoWJ8cInW3/N/TXkHm9ACx6ejBCQ3IgQ05k/hxFswexdPbj
 wtMc9llQLLbUyx9dS0zsdVtqVwPNHVgWtsHeFQVYyn4cxLZgfE9m3VpSMqctmnkSmOifDzcI/np
 k2yfSFjHPOvj1mkYia2JSkMUIA0umwe96VzIMxoFA4amzB6cv0YDWzHcEmilOY7d2cBKDumU8h6
 fDjhdX96Wc0NpDQNFcGkF2I4UVNhuymkQMTL7ePQpIxRXLRlOkja5vACz/HvlBeOBu48HW9J88t
 /9DSDHGhsvHvtUl+AFtLWx5A+rBJ4h7s6IGgEGTwXmUe32IgFyDddw97UUu1STb1dyew==
X-Received: by 2002:a05:600c:e489:20b0:48a:76a3:2b9b with SMTP id
 5b1f17b1804b1-4909c0ba7camr44898955e9.17.1780064709341; 
 Fri, 29 May 2026 07:25:09 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca72cfbsm49313385e9.8.2026.05.29.07.25.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:08 -0700 (PDT)
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
Subject: [PATCH 04/17] accel/hvf: Remove need for
 AccelCPUClass::cpu_target_realize
Date: Fri, 29 May 2026 16:24:20 +0200
Message-ID: <20260529142434.87880-5-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

accel_cpu_common_realize() first calls accel_cpu->cpu_target_realize
then ops->cpu_realize, which is set to hvf_arch_cpu_realize() on HVF.

We want to remove accel_cpu->cpu_target_realize, so have
hvf_arch_cpu_realize directly call HVF AccelCPUClass target_realize
handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hvf/hvf-cpu.c | 6 +++++-
 target/i386/hvf/hvf.c     | 5 -----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/i386/hvf/hvf-cpu.c b/target/i386/hvf/hvf-cpu.c
index 316c1b0ba07..35f6bddbc0e 100644
--- a/target/i386/hvf/hvf-cpu.c
+++ b/target/i386/hvf/hvf-cpu.c
@@ -73,11 +73,15 @@ static void hvf_cpu_instance_init(CPUState *cs)
     hvf_cpu_xsave_init();
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return host_cpu_realizefn(cs, errp);
+}
+
 static void hvf_cpu_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
-    acc->cpu_target_realize = host_cpu_realizefn;
     acc->cpu_instance_init = hvf_cpu_instance_init;
 }
 
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 2d1a943b96c..c2cbacd3360 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -369,11 +369,6 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
-bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
-{
-    return true;
-}
-
 static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_info)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-- 
2.53.0


