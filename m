Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201BCCCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:05:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcpv-0005Zv-0j; Tue, 28 Oct 2025 02:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcps-0005Y2-DU
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:05:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcpq-00060b-CL
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:05:35 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-475de184058so12093745e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631532; x=1762236332; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u01SXPrt2hQxgDjr6x7tak/H302DLDxCgjKNSxGjajI=;
 b=rmj5CO70enHCYANb+RlJSdoRJ+pWROssyODfqeq726yx3V7/YrKDmuO/hwtgVWxFuD
 jTNBmjuOLHuhAA0hFqQfNm59zB7dBrR0/NGG3L+WENm/CPJAUlPiOtaW0tIiUDtSwkrA
 NRhhIfqan2LkFuXkFE0yzex0lxD0S2iy/lEQ54z6+OD/W/w4H2N0TrkWZJ2Qck2HmJGo
 BkcW08QySdImvBDvu+/EEsC1KmpMX8NXZ/+1LFXM6tUEHDhcj6gNuFHSIIzazxBXI5Oh
 cfHT1gREKECJPDYVZgvQqwlObXR41dSedb5KnpkLf2nRtBtPLxtvWblCHx/Zg5zdV2W0
 Bnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631532; x=1762236332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u01SXPrt2hQxgDjr6x7tak/H302DLDxCgjKNSxGjajI=;
 b=AJg+oCqTz7e/wHzemL2ONiiu4chQswSydbYo4wrVI8IFz6psycTiEFjdL8QqXJyyTx
 9wK+yZ1+fg+hGw6Fm0TpnYvMJXrl8alS7vRInHKCSKykUoqiw3zIG75RAbUxCGmcYPFo
 h9VCMPCK0lGszgAZEXjHoePYf6rCe6IgZ/uEAef18oaXDhOdvdkFr5Ae2XLuK5ua+Zxt
 UpNxw/fToz1udbRhlmTbKjBzOIFZYJagYn7QbeeqNO2JrMPrxvTr+ZYtcHF68AvFamkh
 gXA2EZf2yBqf70D2ZjKEWlmHlQVMawDwMaH1RnRddAtSRhmJJlxgJTf71nTBV+6NL3zP
 +I/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRhM3x4dXaVA2p6DcCVWf2zfEUzuGNxMWlyNxeZJR7XxhNpv4QPYWrrqAtEHSy5D5q/FyQyzgz8g==@nongnu.org
X-Gm-Message-State: AOJu0YzQ+TsCFedcUnSnJAwKKPX+LeuKUw1vOzwiwV7iyTtNVUIUGCV9
 HYqRPa1//lkpG7XbeLQZ8YbQ2EXRZrOmF0N5jY/eKg4UAkHXQzM6jVeiy7imn5BfUGc=
X-Gm-Gg: ASbGncsxkwWwPv6OKmnWftTCwJo4NaaW5tcm9OkGnxXl6ISAiD0weaR886UTJqIzhbG
 ueyQ97gydBBPtFX4woRBAKBFKQHo33Lrnbu8HJ1emQtHNYIY0KAmKuw5ou+voQrY4N0YR9KSHCi
 6XrZj8dEm+Sm2HjPzpwKOkX9yWZTeDzhru6zBKts8ifaxPLEGttTIb8Ak1ukLjIv8nchubwzzvl
 rRyDbElf8IR9Mwg2X0oEl89CHfllYSs4VXInNilLu8cVp2zoIu7l5ufr8A5cxtc8lLCECP0l6XD
 dIxkFCr6LXRnIQ3YLoCIDaX1owKYmHScFVO0MC8gVN1NUcPiJnvRn+2g/oArqnr6nl43/BINPTQ
 S450XsuCFVm6ugglSYZzQ5+37ySYuABuSfdRSx73VKwemIElierg4PwqdsvqvcerWDkw2tq3wZg
 xBMLC/flUzlWvfEaGXQ3Nds3yPYw1Q+dkBLf1L7NNOJ0xcis6q18MnkTo=
X-Google-Smtp-Source: AGHT+IElUdgpJKS1wXmIR4e0GvIkBEyBFHPFH5IGkjUeOidzhx982Lw8IQRJYjz3R73P7ubrcWtvgw==
X-Received: by 2002:a05:600c:4e12:b0:46e:1fc2:f9ac with SMTP id
 5b1f17b1804b1-47717dfe76dmr13631825e9.10.1761631532255; 
 Mon, 27 Oct 2025 23:05:32 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a36easm176283575e9.10.2025.10.27.23.05.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:05:31 -0700 (PDT)
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
Subject: [PATCH v3 32/59] accel/hvf: Enforce host alignment in hv_vm_protect()
Date: Tue, 28 Oct 2025 06:42:08 +0100
Message-ID: <20251028054238.14949-33-philmd@linaro.org>
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/hvf-all.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index e13abddbd9c..2efecdc9f40 100644
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
@@ -67,6 +68,8 @@ static void do_hv_vm_protect(hwaddr start, size_t size,
                          flags & HV_MEMORY_READ  ? 'R' : '-',
                          flags & HV_MEMORY_WRITE ? 'W' : '-',
                          flags & HV_MEMORY_EXEC  ? 'X' : '-');
+    g_assert(!((uintptr_t)start & ~qemu_real_host_page_mask()));
+    g_assert(!(size & ~qemu_real_host_page_mask()));
 
     ret = hv_vm_protect(start, size, flags);
     assert_hvf_ok(ret);
-- 
2.51.0


