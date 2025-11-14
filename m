Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E36CEACC9
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:07:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK04w-0000u8-SK; Fri, 14 Nov 2025 15:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK02N-0006sO-8l
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:04:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK02L-0004mJ-H1
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:04:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b3ad51fecso1896365f8f.1
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150688; x=1763755488; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYZPdSjIdF/EKh7X/rENMynZwEwjU3Z8rLiFolDwON0=;
 b=vb0GeqrPZzk4buzcxOhThE+YrqagZ1nlQgVmNLW2Kwp2/Xzk03c5advi59pQDeGYO3
 tgGIzxnIh8UW/WEZd/qk7qXRHTdZ2PqZrFzyzxcxCzotz5ihLE30Qd7nAWeGd9M1kBk5
 kYOC0kcbXJSq1kq3x6T4Zhpldu/h6IcwADxqn362ZEEsNXbzkYYBYReMP0JE08Qj0R6n
 HmMPIY9hjZqOP00DqXvoKOc2ivT9V9IYsIOPVpViGbBDjoveQXLMNc65zzlEM0jm5GLm
 3qrNCYfQLTPcqhaFdGuspTIta7v4U+6RfT64fAGGG/aJI1g9zwWP1qWeEnjtXi7wlgym
 v4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150688; x=1763755488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OYZPdSjIdF/EKh7X/rENMynZwEwjU3Z8rLiFolDwON0=;
 b=PlHg0Qhl/GDZ9KYoDQAyrSnvkOdeCnNdCF0apZ2NfDn8XZa4lihghIGrekShHSZtO2
 umWbMTOeKxrMOFzYfCSrxv0ic6Ku/p5KvtamvyCNkovqVBLRGECKY5SIhmfARrb7hAPW
 LnOZQYZcSaGvQqaTXSaH2wXNfv0GmLE/OyqdC6ibSnmQASZQ+IaAhVYEtqBoeI1eSGcR
 BuC/dvyPycZ+NZrTDBkc8Iaw3ogROGcDgq9c/eU/lS+DEg+ul0+cIr9VNovhUXbjPKWq
 Okw04jgwLMCNCk0oNrMwleiKilGmVmSk6F1yIXeSs338jtjX8AuljuuebtKjZ/5wVY26
 LSpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv9tz9ySDLykjqs0vY+DH3NxWmvW12OT/yo9qkJaM0YpJ6byVKBLQHKwoLvKbDs8nuGtWsl6D2wA==@nongnu.org
X-Gm-Message-State: AOJu0YzpokEyq40eMwW9M/+J7QEI3HeR7DAbyNNL7NlqzLQ4Q98sX5Tz
 LmCvAI9138RhWiwE2mYwCV0Q/xo10aV9H0mUIOXfI9eF3CGBSXuUu8E79H+0LkOqKzw=
X-Gm-Gg: ASbGncsjk/2C8ESUlvgNcbUTbckuxm45pxi+XAG4GaFN3B5J1sOYLBwTBgtJzCics2p
 zQMxInCDfQ0Ijw5ao5HiEAN74pTpqWsWRPXwxVGKTLj+/8WM11TJ74nz9VY+xJkNoakvjyJPCoN
 smlGYpJyzP9inG24R46nPagnTW6HoTZAat+uilDgrUNjWkJE9oaOrfzmL8owmvXgeMMaK8dhjP8
 YxJzkgkKPhBHkhan+3doPwsrcHcSu+E/Y+8q9fr/kGiMAG1TjD9qfC+KXbMj/TUw8WAHwmO3FP8
 7gN1wyVlhe2besU1XTj0S5bExyV3lywk1ezniwmBP21AoOtCW0oAxTmaIeJ8NmVWoUuNzWC20po
 qyCEi9SY8g7OEA4OTYT7U9AzjFCerr0AnC0xRlCJkdQewdnT5dqjnxBGStzYTmL90dX9UPuimVz
 HXvTmH4WIezk31rCDbvUJSzprKgmGf50OljDMQKoK302qUlyxDGWi3oEpweIYZ
X-Google-Smtp-Source: AGHT+IEIqz8iRf+F3zPMn3HXphrgQtH6CH8BN6CABSXb2GhbgVTHz0nk/hAbT6A0LgT1h06eGnXWtw==
X-Received: by 2002:a05:6000:1ace:b0:42b:3978:1587 with SMTP id
 ffacd0b85a97d-42b59381be5mr4664778f8f.36.1763150688096; 
 Fri, 14 Nov 2025 12:04:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7aea7sm11727470f8f.1.2025.11.14.12.04.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:04:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 03/19] accel/hvf: Enforce host alignment in hv_vm_protect()
Date: Fri, 14 Nov 2025 21:04:05 +0100
Message-ID: <20251114200422.4280-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
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


