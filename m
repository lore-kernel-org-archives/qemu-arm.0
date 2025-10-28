Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F79DCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:57:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDchh-0006iZ-GZ; Tue, 28 Oct 2025 01:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDchX-0006gO-VV
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:57:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDchV-000555-By
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:56:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-475c9881821so33920425e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631015; x=1762235815; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0MAWX3PF+zlZmdiNXq5RCA26mpljCPV09k/qwEJKNk=;
 b=OL/f8cTnfRcj1VHH+toIgAIci/WbiB/s3e9NOGynvEFOLqS91KF4fJTD0aCwIjdYyo
 DNh9ZqtDx7jt7Yijvb1GMETHmbkpX7txwn/WBLG50UUzK7ryHWcN6oLl2lAJcZkN8iVK
 fKdiJ3qmWBQsbrvZigvEB3qzl+2RQSsftuhn2hkMfuoX9bASichvF3VmcmWqIzsyv8Kh
 +xR3vOgCsPRvzNZLlBZJzS1ATkDIsKtsYJNKP3Z8pBOfoPdGl3T6P6Yzx42Gr4Q6HTIh
 Y/Cr6vsiAgQypGjeNUO8xyohqpEliumroeF/TGgdLwLFPaFsoIFgWVOyl3ohl6ao5euY
 kkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631015; x=1762235815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T0MAWX3PF+zlZmdiNXq5RCA26mpljCPV09k/qwEJKNk=;
 b=BD/EyTDyWjhuBnKxFCjWVEOnO8wrvExKOYNGFs9C35O0rJixrCKtgtonrWpOX0PU3h
 +e3qMEeI54XYXrMzly/I0tfpn3rCILHdUzOpIQGESnGOde6gFJdseCF3y9IzQ9NofE87
 uPJwuxrj/D0xDBs2g8DXvJY+NIqwXoSRT/WGBIRwYcIw8M8lbL7WNDvrZ/gwTHJ2ZbE8
 IV+POzUedUyKKynGc5WHb1ZPqmq4VniwlZXUY6BZc+xtfdykEcoW40TkDmuvCAxkHCVl
 GloAyTDiyHceunJX01gIoWX+m6zPAiw4n3zxjR2TNYGJQG5VTfGqX39qAQ57527bqUMC
 06SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHbGU58O55Cf/KRoDLwhnundSP28/8OC7npCyKxp/w9i01r52cji5kSlvp/CT45CTDW3N9TiUnkg==@nongnu.org
X-Gm-Message-State: AOJu0Yyqm/OZPNgdj17UMhSXeBY4iEPeqHik+jnrrrTl3yUa09QjC4TA
 bSduZZsTaXyGvrjSWf9z4pTG/zGsxA+AXsXxiWumQ7Jo8BqvRmgfniWCzXIkyo01Zd4=
X-Gm-Gg: ASbGncvuk66oQU/jf4/Y6KNSmHO2rACyIfAKT2v2C4okkumrxqcQQW0vcjX5bvwZB36
 mQfkBQl0QDF8e2xPgV7XNAQWNYaZ9RZPkHGAV7c0WjOIxvE3uXK/XLHrwIzzjUoyGuypR2QXCcP
 Arq73jov/eQB6RGIUqXj2MvHSxQV9ZWU+Q1+/MEMYHI2m9LJR72kKBGoQCYZfFdsxHMPeKrcyUy
 N8PZ8Gt+jH67/ZpbCXYy0anrPh30fmiv+77Hq+y1M3yGsdc+/VP+aI60r77HeWmdPG0xLs0NhIP
 I0Dfx+0nIPgjb/aN5U+ANBiEzX39eQcQZK9zqwcpDXBSPo3caUtda+NaMajs8ChUROO4DjGifwJ
 1heEWYpv2nR4Hf51o8d86WS5GFz+umdgvDAvvLkqYFkXDh/tjeTpws5/4IokKi9mn5nk5JbqWfO
 cG5ViwiwQh/qIVf+fkDfwJ/Q773o2eZjaNIgb7ahGNSuBiBiG1GCaPW3w=
X-Google-Smtp-Source: AGHT+IF1EfMJ1fmeA1/3h/+dFL7cSxAoDjNucZEIXuMbZCW2LH/dMI1rmB1kJfhwKmz05bB/Wda02g==
X-Received: by 2002:a05:6000:65c:b0:425:7e33:b4a9 with SMTP id
 ffacd0b85a97d-429a8060ee8mr1587024f8f.0.1761631014910; 
 Mon, 27 Oct 2025 22:56:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cbc55sm18985207f8f.10.2025.10.27.22.56.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:56:54 -0700 (PDT)
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
Subject: [PATCH v3 20/59] target/arm/hvf: Keep calling hv_vcpu_run() in loop
Date: Tue, 28 Oct 2025 06:41:56 +0100
Message-ID: <20251028054238.14949-21-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 27c600148f9..79861dcacf9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2013,30 +2013,32 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     int ret;
     hv_return_t r;
 
-    if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
-        hvf_inject_interrupts(cpu)) {
-        return EXCP_INTERRUPT;
-    }
-
     if (cpu->halted) {
         return EXCP_HLT;
     }
 
     flush_cpu_state(cpu);
 
-    bql_unlock();
-    r = hv_vcpu_run(cpu->accel->fd);
-    bql_lock();
-    switch (r) {
-    case HV_SUCCESS:
-        ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
-        break;
-    case HV_ILLEGAL_GUEST_STATE:
-        trace_hvf_illegal_guest_state();
-        /* fall through */
-    default:
-        g_assert_not_reached();
-    }
+    do {
+        if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
+            hvf_inject_interrupts(cpu)) {
+            return EXCP_INTERRUPT;
+        }
+
+        bql_unlock();
+        r = hv_vcpu_run(cpu->accel->fd);
+        bql_lock();
+        switch (r) {
+        case HV_SUCCESS:
+            ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
+            break;
+        case HV_ILLEGAL_GUEST_STATE:
+            trace_hvf_illegal_guest_state();
+            /* fall through */
+        default:
+            g_assert_not_reached();
+        }
+    } while (ret == 0);
 
     return ret;
 }
-- 
2.51.0


