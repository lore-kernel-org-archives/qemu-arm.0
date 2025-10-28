Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A18CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:20:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDd4O-0002rb-3c; Tue, 28 Oct 2025 02:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd4M-0002la-QG
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:20:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd4K-0008Ay-68
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:20:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47710acf715so10082445e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761632429; x=1762237229; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/tfZXafiZUbcEBlhJ9XjyJNql+RdDO+3y710Ctk9AE=;
 b=diRJOvpTPFzG65IqoyeP6Wvbqyh8NGZhSUZDz6jCokrJehHmR8iBtu13DZPrC1Fz0G
 9Elb1lV3I8MAwbXLZGxqxLGRJtzkZKUbW+u62WbiGHrWYZmoHGhi8NZSz3ZpfheQCzzx
 WSH9zMvlZVcFodxhlr7fXZ0+cF+DWkSTufJqCMD1zcSVqjpPlFgksXb4IhClnXeytCrN
 ZmTUEmEe3PHGA7IaXJDDXVbG4Nmhv7iQaJ6rsCPkFuaTiaOZz1vYBfDr+gqg6ij3HXNB
 33LzbqDa/bxCNHxT+nS8WWBR+hQUid/eLIcu1p6qRPK5OE2lav9XnAnifg4JhF/WTDLo
 E/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632429; x=1762237229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/tfZXafiZUbcEBlhJ9XjyJNql+RdDO+3y710Ctk9AE=;
 b=Qn9xltsvLZ4o6ZiQjsiiYQ4xUx6GoiRVnCAzUxfGOfamvfBw1T9MrmIq4r68DY71eX
 ZIv0ujF59XuXUp/4/xAWULAwgMd0vFY9KYRhOq0ufGopRK2CJH4SRtvjXhrB70eAc3ww
 5JZs0Nh6Qq+VnD21DZ7TDR08hFX4kJZFv2JQt1oR7SinwnOqODA+8fswVqsEaXrC45ic
 JR1dXm5RRMNt2Gm9k8zzkQYYG5JYeAFK/J2l99Y/ttljv5wfkzSX7LMjan0we4kAxA0Q
 91rDtzqvKRvmP8M88fibEvrct4XqNPwXGJf8tLUqAFnGgU3eGTloH+cRhPqNWANXDS37
 vbGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsPR/wMkMwkyz+MdTv1+UGmc+LccR+sluqT0ADbRpXoXQHnjiJOHXwKBmFQuXh2LodHD9/I62VFQ==@nongnu.org
X-Gm-Message-State: AOJu0YyL0+KCit/+Z/dHrE9sRHdteeqlh5BgRaEV1VVkyyaZZRVWHlIa
 PdX+xL03+mlj8zRbu+8qTZPdM2vlPsv+TQeKsOIc3wB6rEZmb52b2e1H9JKjPk5Qs4w=
X-Gm-Gg: ASbGncvDTPEZF9cMD467gXsRtSbWE3/BvYzWCm76c9D9RfNkYNbdE7nJHtb1TYK7N5W
 X6NstBUmColtJHg52+xND+CCm+lTqoXIorVPODD1cYhlOqxDmxuxYaEkJibFzCEyFuhkwJvlYgH
 vbg72IRrsjRg5SEjh3OhUYKbavBFR1F5PoGCFMcljrfn5yBc/TB9ZQ2aBDP18zphHLPV+RebSCq
 f/iy8AxhEN/gfDabK9f2e9OGoe1KMc9c5ijvNh8sPPztuWpXhu/CcWGkeYX9qNaF7sRbDEpLKb4
 OFUBHG+ATeZtCCHnC2fE8jmSFx7f/Oh0SceqCkX0xUm+Xk+rvzjcfRhTVhLwcMMVWMBnSi1ZxtL
 BYbyGdFZOWJKmNFP0nIxHKr1p8F+xGvpku4RJBG7lI/U4UBtT+1xYGjB5Ss+IF1Vie3PSLLE5tC
 vDiqLH4mV2d9oBIFHd4mwoF8JdQWH0esJS+HawhXrW2uO67DPVrV1P7tk=
X-Google-Smtp-Source: AGHT+IGxgW3vYSjH8ECO+5vWMLAyOGYo6p33n46oP0OK+uR/9vt0wSUH03A695E7Vh6ZFvCwTD6Gsw==
X-Received: by 2002:a05:600c:6383:b0:477:58:7d04 with SMTP id
 5b1f17b1804b1-47717df9758mr16822325e9.9.1761632428733; 
 Mon, 27 Oct 2025 23:20:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718fe63e0sm11698065e9.3.2025.10.27.23.20.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:20:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 53/59] target/i386/hvf: Flush vCPU registers once before
 vcpu_exec() loop
Date: Tue, 28 Oct 2025 06:42:29 +0100
Message-ID: <20251028054238.14949-54-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hvf/hvf.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 5711ed6f1d3..8df1196a55e 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -731,6 +731,10 @@ void hvf_simulate_wrmsr(CPUState *cs)
 
 void hvf_arch_cpu_synchronize_pre_exec(CPUState *cpu)
 {
+    if (cpu->vcpu_dirty) {
+        hvf_arch_put_registers(cpu);
+        cpu->vcpu_dirty = false;
+    }
 }
 
 void hvf_arch_cpu_synchronize_post_exec(CPUState *cpu)
@@ -990,11 +994,6 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     }
 
     do {
-        if (cpu->vcpu_dirty) {
-            hvf_arch_put_registers(cpu);
-            cpu->vcpu_dirty = false;
-        }
-
         if (hvf_inject_interrupts(cpu)) {
             return EXCP_INTERRUPT;
         }
-- 
2.51.0


