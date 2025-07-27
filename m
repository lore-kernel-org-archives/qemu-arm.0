Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A4DC87FD1
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:18:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwSL-0006WV-Tk; Sun, 27 Jul 2025 04:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPp-0004In-48
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPm-0004tm-7q
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:28 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2400f746440so1205145ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603645; x=1754208445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Otu/B52oeMdohHSlUgQzyMXI9VRbf/jGWvdVoLWz+3s=;
 b=wa0VKLp18YH5V1h7pRg/XPdQVct045zRW1fvVkq3VPixbm33hMjCtpz6i78wB/z8oK
 q/Qib7vSaeeo0Kpoz94GA+0s4+7/nM3UqvJ6b335vz36o/GnTuSImya3ICknNV27RIXh
 /BS6KEbYJ6qXSs5vAg6NTdfGGxwTyrQEcke8gJFTR9YhEKMQlv2mtVPqoWAp7rnzM0Ve
 6bOcvWcWkIpVFYUUQmVQ8G7DBt93hKTGDDbKbutPHcXnU5dbJ7CbBy0049zJkf7Nh3/b
 zh7ykH4gwWWvYWRGsAIZ4fhBryx2FU9sNgFYjGiw1RgqYiq/KFL5YZDJaJc4outWL9fq
 +r/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603645; x=1754208445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Otu/B52oeMdohHSlUgQzyMXI9VRbf/jGWvdVoLWz+3s=;
 b=qoITuTZwqmxJgCWl3rT8tR0uk13W3nM+BswdjPCMT2+pNm7QUiucB4Otu8pPHIFWzC
 Sax+7OI9m5XcKK30kpQYyF+s+71EWm1D/t8CusFRBsRyeGnq8P0PWh3bgRS0oYP5LzvP
 5bZQCxMnRQVrvqwUmzVM1Wl+3GTWmgppVjBf1mcis8O2sjaaN7V2e3Yk6dH5BuSpBon/
 sywHPU5KnEUogVusMTD5A/uyVr1D59xpUQ4G75GAogDl1enKrR1SkEBg9TSvToHOfuO/
 ds8M6riViv/noOYx4IaGGPEXEugcOvaEiHjNDCOJNSwyLYUNAx5MwcUg/5DAL/STyDYn
 mlkg==
X-Gm-Message-State: AOJu0YwKR12PJAq2D13c4hpBY6cdEipt63nV2zlfTlaqOm7mloquuRSV
 8hGwZKq1x/aE3tIgHFfjQCu9G3dEOMnvKW1WIZGTzOfK8Ie7aI4PzaDrs4XRekqSd/s=
X-Gm-Gg: ASbGncsyTntlWqSyqvYbGUIi537DVKcHUN3mr1QCo8lG9CVz5aAZPEDUoNzFUSkZ83+
 b7cUlXM0jI2dS1kIx0nUC8G9844tCbW9uwPLrbGqyJLSVlg9dwi7L76sJqYHvwTKrzv8MXMhp39
 p0HBW7A0iAltrrbkzVXip+Z+Cn2wrP8v2scUxo97DpR+Z/5tvOD+njBxIPxV1gAv58nNdmkLCMo
 J17RMYETu9P992wyRbF6LDiM37ngL2EX+cWplyDpHokB8WJ+D4xOu7hjXH9Aor3m8dIxRkR0vTT
 zt5RaB39wtPYTpAw5sjLaHYPbYyur423kVy8o7LHOh+pCVE2vtuPfrTpWFnM0/K2mPXPrn4Nhro
 r5JriulUv3ubHs+lDT9rBMNyChUUQsltUI5uYAC1CcaJ2ez8JSVocWKGq9Tc9paovnaDhODpcvJ
 kP3HIccBg8Xg==
X-Google-Smtp-Source: AGHT+IF/2CuoTlt3zc+4OmMG7XjZorqIJbfrqSCR/o4C4/g4W5AvTbwgr/zO7OK4T3Sk22I00tzSXw==
X-Received: by 2002:a17:903:230c:b0:240:96a:b81d with SMTP id
 d9443c01a7336-240096abbc8mr17680565ad.5.1753603644780; 
 Sun, 27 Jul 2025 01:07:24 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 73/82] linux-user/aarch64: Release gcs stack on thread exit
Date: Sat, 26 Jul 2025 22:02:45 -1000
Message-ID: <20250727080254.83840-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 91210775ed..dfe114ceb3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9309,6 +9309,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                              FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
             }
 
+#ifdef TARGET_AARCH64
+            if (ts->gcs_base) {
+                target_munmap(ts->gcs_base, ts->gcs_size);
+            }
+#endif
+
             object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             /*
-- 
2.43.0


