Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2230205njb;
        Mon, 10 Feb 2025 13:31:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVV4b/SwAD6DQM4hOPK3vSHK6GLi3fKkFvwd4bO/LTr/0pLx6euqBzjGDzbwAXTHhZqJW3XPlxDnWm2qg==@linaro.org
X-Google-Smtp-Source: AGHT+IHkLUD/nIydVbXZpPWKoDqwF5FeiAbRGZEWeuYTjz+B5e4Wy6c7ybzpJotTAGOBsM5DebeS
X-Received: by 2002:ac8:5d45:0:b0:471:92e1:efb with SMTP id d75a77b69052e-47192e112b3mr83468421cf.31.1739223117139;
        Mon, 10 Feb 2025 13:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223117; cv=none;
        d=google.com; s=arc-20240605;
        b=E+GNNaSXkwTh/g0ZTVJHpbWH0Sz7LxPTA4oMUwi4aYr7GCGwFrlKb+dDwOnqGe0UWv
         +ZTwvY+NXxZJk3NzZhYFAzYwWdEHlNJJ55XCBqvFz3yh5W6iBHbKwrfmG3EWtpbQQAQv
         sxJa9Wtr22BnzPAwRWIu5G4SeIkJMgPQvZ8v8Bwql3SpwBh64W12j2JpGsbDqWPejT7F
         JivbPyvRUJAoHB60dPbvrY41Lv/iEhFbcXgHd/6CIxms1X0ZkJt3Jc/rccrdSKmxTprl
         2vGjZir9hv7584cT6KM9T9UJEbdeE4ry6iiLIcjmUUtfbHYKtC1xy0qXllCctt0a279l
         mZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EXKigwduHuX/BpQHRjwL+FaxSAFhm5Nedm/bXWe5Qys=;
        fh=hhC9Ef5Skb/nZagtn8Piyu2CcOBHxkVOynLfhyN3H4s=;
        b=PvPE9ql+hSJzf4VUZAg72evcU7IsNDPbpOpBp7hT+iyElffFVxSh4KM0DRXkMziNf2
         nzrLPQgSvUvmaRGmyb2HMkeqvKgl36HJxb6Wwctym+6srVAXRvaXd/4DGAl5VmJi1nPT
         o2vsth/0yElV4IUHmMG3L7cqfhT5tLUA1mIVJzjbqQYwOJTlONKibYlqqwOA/GbDcLAi
         vxpXg/hIjXz1xKR+08U+UVsUELeMq11Hz8nkLrdaCN+oeZwZHNI7h+N+RlZxLGcnBBMu
         KIxwRR3esFyMcJbmxXwI+8Jyuk777dPyJbJzsGftEyF+zqTzOpgCK+CXK6H/0MWGlu6f
         sJ3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qtawM0MH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47196a1803dsi23800531cf.289.2025.02.10.13.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:31:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qtawM0MH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbMc-0004td-Ap; Mon, 10 Feb 2025 16:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMM-0004Rc-Tt
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:30:40 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMK-0002W7-9D
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:30:30 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38dd011ff8bso2676470f8f.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739223027; x=1739827827; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EXKigwduHuX/BpQHRjwL+FaxSAFhm5Nedm/bXWe5Qys=;
 b=qtawM0MH95wYhPMDrMP+DL76ltL0xVQJQVp8NcrP6CATAwKS9J2eAfUECtUnKVqryH
 +Z9ZgH0U/iLUDAy9QwJiRev9x6LcyUSlwl0Tur0IFmhQbLNboXCkv61PMw9xG+BW414U
 2YiTWabswueN+iLvxAHRvQkO93h2y/HBgDv4aqpn1rtK24oMNEsPvmFU99bz9V97Dt5h
 Q5Irjfx/557teDqAOmlr9vxDG3sQvDk1q73QkEXUjO+YgrwJZdp1q4wry/qiVr56ZXPe
 9leJsWlqR8dWjvPYVYMdrU+a6/J/73dXuA7FajeL11xNPMdKBG1jQs+aw5Ou/+zTkR7E
 /Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223027; x=1739827827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EXKigwduHuX/BpQHRjwL+FaxSAFhm5Nedm/bXWe5Qys=;
 b=lck+NoACzWYg7TibnCcMz1eBpshAufQd1cAaaYp1sawIf3mviQIjE9eDXuLSqCCO8p
 HMknY+YsCoAtzSYk+bx8BYq5ZwZY+qogl71TiGcJUQg8HpIuUlq9SGWHVZHVTxDMA+FC
 ao3XUp7kQy8uPe0nRzVN2G5Xwn1N9Q8L8vTAPAyNV2k0MVy9IdmFkkinC1D4YsG1WLSS
 EkfcoWCFMeab/JUvj1SsOk/JOumoXeMgi1Lzp0h/CWAbqFTGfwIEQExHR3mScJN15irq
 +MYG0iFBWVDV/B6tO8fLrvTusap6D15jAuHlRHR4DfSqpF7DDFau750UkfAGDyH8DqAn
 0zQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXv04qvRjDQDWn53rLrdsoRnVBZcZ6mHEJRag9Ds3gWksTfun/VeoG3x6plOjOInMuCYEoGw4O1w==@nongnu.org
X-Gm-Message-State: AOJu0YzsZZloTHXM7wXv4WpbMbm4x2wEpi0+KhfVbIjt6Ua0l6DhaJA1
 0D0ne57Xf2kwMGThbUNrN85btxOdLfEgZezx2PRMdBqV3KNwmveJZF4Fc9vQs2/vXXdQZ9xZe56
 AACk=
X-Gm-Gg: ASbGncte4cGJtw9BCU4Mky7CgE3oJ8qM9bwn2kiOen3L1HmUNVTszJrEURjJcgRwGR5
 /LonESMzYZoPzdIk/ElIjKCPkUV9pWL/k4JJsBZSEoCA+unSQWxQ0k5JC5DEWtt2JD2/cuMFeK3
 tGJ2S5l0K5DWczgR53Q5PPoO2bHiQ4r9S7HzHZ+nAKxIeiPSotlXjHjRRoTC8DdDahHfnWTdQ0W
 euIzo1OsJij4q7YcVm56tluOGFazJHh7YFjVxkGBjkm4ka4uTDvYSSLQx0IJZ20pTVPO0Wxk7TA
 BdwAKGdUb61yA9TFO3z4BY9HAtJQcNQ7W1ibISbl7x8tm32Pc8yGOigWe9kLYvHhdw==
X-Received: by 2002:a5d:64ab:0:b0:38d:e16f:fa97 with SMTP id
 ffacd0b85a97d-38de16ffb3dmr3315465f8f.24.1739223026672; 
 Mon, 10 Feb 2025 13:30:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d933523sm194697495e9.1.2025.02.10.13.30.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:30:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/10] disas: Remove target_words_bigendian() call in
 initialize_debug_target()
Date: Mon, 10 Feb 2025 22:29:30 +0100
Message-ID: <20250210212931.62401-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bcBKTB2LAe+b

All CPUClass implementations must implement disas_set_info()
which sets the disassemble_info::endian value.

Ensure that by:

1/ assert disas_set_info() handler is not NULL
2/ set %endian to BFD_ENDIAN_UNKNOWN before calling the
   CPUClass::disas_set_info() handler, then assert %endian
   is not BFD_ENDIAN_UNKNOWN after the call.

This allows removing the target_words_bigendian() call in disas/.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 disas/disas-common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/disas/disas-common.c b/disas/disas-common.c
index 57505823cb7..42e911e36be 100644
--- a/disas/disas-common.c
+++ b/disas/disas-common.c
@@ -7,7 +7,6 @@
 #include "disas/disas.h"
 #include "disas/capstone.h"
 #include "hw/core/cpu.h"
-#include "exec/tswap.h"
 #include "disas-internal.h"
 
 
@@ -61,15 +60,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
 
     s->cpu = cpu;
     s->info.print_address_func = print_address;
-    if (target_words_bigendian()) {
-        s->info.endian = BFD_ENDIAN_BIG;
-    } else {
-        s->info.endian =  BFD_ENDIAN_LITTLE;
-    }
+    s->info.endian =  BFD_ENDIAN_UNKNOWN;
 
-    if (cpu->cc->disas_set_info) {
-        cpu->cc->disas_set_info(cpu, &s->info);
-    }
+    g_assert(cpu->cc->disas_set_info);
+    cpu->cc->disas_set_info(cpu, &s->info);
+    g_assert(s->info.endian !=  BFD_ENDIAN_UNKNOWN);
 }
 
 int disas_gstring_printf(FILE *stream, const char *fmt, ...)
-- 
2.47.1

