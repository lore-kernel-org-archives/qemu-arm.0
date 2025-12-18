Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F5D711C8
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 21:43:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWLmD-0001Va-QM; Thu, 18 Dec 2025 16:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWLmC-0001VE-CB
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 16:43:12 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWLmA-0004az-Go
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 16:43:11 -0500
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so8689225e9.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 13:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766094189; x=1766698989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dv6+54i5o9W7fEBlVIR7xgeqZTrtUt7SWeNnerBEFxM=;
 b=nxLI2SOM1xltg6ve/q6/EyLDQDsmqYJI1/ITNMxFI5IxqMjJAQDBtjxYHZgSq+P+O0
 T2fnzOvDUc7iRfF4q+Qw7oQZLZyJ4ZIov1Ik5UsntNEXGgyWpOecXb0JsZgHDtp2Xtix
 W8wRX0m3sx26yB6kzjEGLX+xeqLV1YoClANW28LXirn6utE1V9CuOJdxJBH9yqgOdUqQ
 BpkL2kvREk1/Lkdgtq3SrR83qvNfadCNiWkqiHYkwgtTkLDqfZilzduMus0D9yRI+9ke
 vUb2Drs+o1UwrkE288X+0ujCeF4yO5dej6RkDUNWQMKxdb8jHcm3asR6luUdApTqcoNP
 n11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766094189; x=1766698989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dv6+54i5o9W7fEBlVIR7xgeqZTrtUt7SWeNnerBEFxM=;
 b=Od+pwvsSNEp0aoQkwxY65um97u8hfQ57wCDbQJT9In8YX2q48nXWZ5wD7WuU0A0VEs
 5bg6UwSeyqGIavyguYK+cLATTZ1gII31o5OjBxhb6zTvWNUq6pBy5KBSgwtAYf3f/OY0
 NYLckC4gE9S7OnZO9R7UgiI30H9nqk4buGJeRofDabmVzuzGQQ+rTFxfGrzxe88x3VF4
 +y58yF+1RxGQs+5Pwq1/KPksQW9LAA7zm5P1+24My70klPaWd2WE0rK4h6LvqBsPqdl/
 U1yCrxx7QfocXGzdr5YemfzYs1WIbIOj82fcS6+yG8cILAhiH1gkPHrur13cCpggm75x
 dv5A==
X-Gm-Message-State: AOJu0YwCCJjLgHFxULvZRS8syNl/rO16avhgw9ceIWN+5avzbV92YXoe
 5k+42V98c/XdIg+hTIaahyIgJF8E0mKOncPAbShLqj2rPHSoWlcLoZ97im72RsJWVSImYEUhmvj
 cyjDzl/w=
X-Gm-Gg: AY/fxX7rZ9CqtdtQXuszHtJCLU5s0VQukWyDvhmy8rmRuyGmTx1x1TFciXaEiFQl1uB
 aIZYgAsgmVRJcDtqeL70tlWimHI8kyLoFz2HMwUC0wCGcf5mZ4CNKVLd/l73OFmBQSObV4ISmXy
 CCepduDmPVnhNgGJOv5Dnyy+7WMOzW2DGV5ByyjeOKwDqbM2Uszf3/zaIuFzoyRtpA7vPo5Pd7g
 IQA3OH1+DPSjBmLfKFyEWeMMZJaRzjQiGAq2ioO5dEnK4hHcmFMTKsC87l4MWLoZQxpVbfmpLTd
 m8VGY35pHrVMW0qvcZa2XtbV0ys6Bm7PAK1PvRMVEOaWFguqwHaFxqeGpvPHXnpbbskL2sGcHnq
 K5clmAcGhDQjyJ7no0tqn5Oj/ypO3CEocvtgGlT/1qnYL2yzk0t2G0OiBPSi6mM4jDbd5oprtwu
 +P/Y4WZ+citN5lYLxCFEOXUHMlGOPGAA339KGbumDwCYtpIZmKjuB40ICEQIFL
X-Google-Smtp-Source: AGHT+IHFg0qyqXlh//InsWVKBNF8SuSLH0wvq2KvmaFVtMgjMSHteCf/DVOE74UXCv1H4hQirC2Cvw==
X-Received: by 2002:a05:600c:628d:b0:477:89d5:fdb2 with SMTP id
 5b1f17b1804b1-47d1954a11dmr5879945e9.14.1766094188773; 
 Thu, 18 Dec 2025 13:43:08 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3acdb87sm20961785e9.16.2025.12.18.13.43.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 13:43:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Jackson Donaldson <jcksn@duck.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] hw/arm: Re-enable the MAX78000FTHR machine in
 qemu-system-arm/aarch64
Date: Thu, 18 Dec 2025 22:43:06 +0100
Message-ID: <20251218214306.63667-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x341.google.com
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

Unfortunately while rebasing the series registering the
ARM/Aarch64 machine interfaces and getting it merged as
commit 38c5ab40031 ("hw/arm: Filter machine types for
qemu-system-arm/aarch64 binaries") we missed the recent
addition of the MAX78000FTHR machine in commit 51eb283dd0e.
Correct that.

Reported-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3248
Fixes: 38c5ab40031 ("hw/arm: Filter machine types for single binary")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/max78000fthr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/max78000fthr.c b/hw/arm/max78000fthr.c
index c4f6b5b1b04..ccef85e456f 100644
--- a/hw/arm/max78000fthr.c
+++ b/hw/arm/max78000fthr.c
@@ -12,6 +12,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
 #include "qemu/error-report.h"
+#include "hw/arm/machines-qom.h"
 #include "hw/arm/max78000_soc.h"
 #include "hw/arm/boot.h"
 
@@ -47,4 +48,4 @@ static void max78000_machine_init(MachineClass *mc)
     mc->valid_cpu_types = valid_cpu_types;
 }
 
-DEFINE_MACHINE("max78000fthr", max78000_machine_init)
+DEFINE_MACHINE_ARM("max78000fthr", max78000_machine_init)
-- 
2.52.0


