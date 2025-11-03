Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196E1CCFA06
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:12:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrXi-0003Ah-Cd; Mon, 03 Nov 2025 05:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrXf-00039X-Up
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:12:03 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrXa-0002eD-GM
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:12:03 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4710022571cso40086025e9.3
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164715; x=1762769515; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYZPdSjIdF/EKh7X/rENMynZwEwjU3Z8rLiFolDwON0=;
 b=AO7j00GncKNzj+gAvIFfjc4XQmXMvsmLqYnojBrLrydetbEdcoyC20xPIXr3+1CrKc
 IvdOHOhg8QH7aeQkpUOqHgxUSmukoj+FjX/XZgggT3mrmyYuUezN/q6NV57wlUR+o3qu
 iQoCykBpekl92nz3VT+LgNZA+d5Pv3e5wjy9NyUt3QTCXpsld4q+Q0zxFYdOLihlbSvq
 O0nJVYpTbmvIoqHyQySocK77DJbjw0JzxIkj+vBoeO1/vN2cTr9eGz0rwxQQbIFLFgjA
 +Qe6U941hiUheO1vdR9UPJ6gFIfzHrQPB0CB3796VvSF7qBoRMwDj8t7TFUNWdTKTt0p
 CPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164715; x=1762769515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OYZPdSjIdF/EKh7X/rENMynZwEwjU3Z8rLiFolDwON0=;
 b=XmK0wGz0yiO+x+6mHPInlt8+LTlLO0o3q7HeKHviDRdifI0rm8bK0MzEIOuoXnbd6u
 lFKd/3oe1eBtyY8LYbsoA/hokAgWYT45GfSJi+8nC6t4lZrenjG0x6P3VhMEmBPpxTCB
 C3rG7BjlTZD/0k6GOufSg0u8ZnihjlVU8S1Tr2u9DPhS03E0ZGGUD3g7np8Tj/uQqYrr
 1sllltZ8k9kCA9+3f0aQ0geMODOVqtqFNdxbI+wpRtG9Uc8vkwF/Z0u8Zjjjh1tiwMpJ
 92n1i7wItkd35TepRnYifB7E32tFuR9TV21CrKYINJxqk/1m3D+mX5T46XKlrlUQzp8B
 PNow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVycEO38nwpaCk4R3D/RQYM8cdukVOnE/DPJouMUa8VjNHA+gKkNAdAwsiDqZGUZDQCGVzg7g1h+g==@nongnu.org
X-Gm-Message-State: AOJu0Yyq+lrpDZeNBsQAHUIruaeO6l71+ynNR1goW+mxA5fDkIhN3aRP
 h6KOzeRRhjMts7O7gz3z8ToaSUgDFE2l6H6t+PSV5q7Dp+sI76r14eSmGlo19voQYz0=
X-Gm-Gg: ASbGnctzhoeRkC797C5edDhIsyNND9rIQBRHsoXsApepnJDxR8M5OoEqAEQan5PATdq
 5vbyCJFwZnWE1iJVKzMGNhzT+rMxi+0h9Q9Oza6Z1HaQXbQh4GqXWO+pqrxkNt/vpUQOsMSekhs
 Zrm6H3qT92V0tTUuPj63Mp+niNlvRrtoIpRMsGNSZJNL16+8T8lHLt8hDsQmQ+ExYDY6hu8mXGA
 rPT9ijy6KuT5f3+kVkSJBGm3TYVGaMHUeZhsfgEHcdYWt/X3dEtTm9V6QBBv0pC2JKigmXPRbGk
 UXqiqezMOv6HcZWepnvhtAuftvoOurj0R3M6lMYjpwY19rkVaT90Bb/SGmzH2OhQgZ+/AF+/HPG
 wmAsu4vIHlefhYeEJm/JZhuzqvMHYE7KSjS9uxp783xyDPkSMXtVgI8MidM95HhibQkhfGh9/QJ
 TejQ8f88xcQ6j59qXPbtDH1dxhrR7UN0YJL9sR1q26uSMoR7PJen7hZPaNv7o=
X-Google-Smtp-Source: AGHT+IE+GJDLMYtFJNOPkm7KPKOTWkGtSs0/iFcriJ/W7Vb/SOZUWpfZ1K4+zVjOEZbqm0RD3Ijzeg==
X-Received: by 2002:a05:600c:501e:b0:471:152a:e566 with SMTP id
 5b1f17b1804b1-477307c2944mr99799625e9.13.1762164715408; 
 Mon, 03 Nov 2025 02:11:55 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c394f17sm147900045e9.14.2025.11.03.02.11.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:11:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 03/23] accel/hvf: Enforce host alignment in hv_vm_protect()
Date: Mon,  3 Nov 2025 11:10:12 +0100
Message-ID: <20251103101034.59039-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

hv_vm_protect() arguments must be aligned to host page.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/hvf-all.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index e13abddbd9c..cb029e4dd4b 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "accel/accel-ops.h"
+#include "exec/cpu-common.h"
 #include "system/address-spaces.h"
 #include "system/memory.h"
 #include "system/hvf.h"
@@ -61,12 +62,15 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
 static void do_hv_vm_protect(hwaddr start, size_t size,
                              hv_memory_flags_t flags)
 {
+    intptr_t page_mask = qemu_real_host_page_mask();
     hv_return_t ret;
 
     trace_hvf_vm_protect(start, size, flags,
                          flags & HV_MEMORY_READ  ? 'R' : '-',
                          flags & HV_MEMORY_WRITE ? 'W' : '-',
                          flags & HV_MEMORY_EXEC  ? 'X' : '-');
+    g_assert(!((uintptr_t)start & ~page_mask));
+    g_assert(!(size & ~page_mask));
 
     ret = hv_vm_protect(start, size, flags);
     assert_hvf_ok(ret);
-- 
2.51.0


