Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A91ECDE002
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 12:48:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcMzQ-0003NU-5T; Wed, 24 Jun 2026 08:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMz1-000388-VU
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMyy-0006My-U1
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:35 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso10907005e9.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 05:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782305130; x=1782909930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pq3pVOWs5xUz0luOR7Gba+BoRAVEKlJAiyWE6ZD8t04=;
 b=dqX6vjSWf8zgMx4A/ItossrMA1ASCoiPnMxLqfnI1t8+vGJkRh/4U2qKw9SnprxAdH
 2fgLYMjhgujmeRltX1AsrxOjUej6yWwSfiCBkaB8KcmlvDgfPqincsbhleNp+noeMW3p
 kig++Ab8PRHTgY3tcZZqJzevbGJ8dKDFJIIW51KcgE+nTGtNwVwowm6KpeDz7ACSQ4IN
 9TLLBVCNE2LgJAdmTFH39/WWalsh6mjQrfWO5Lkhb9Qa7lLsRFZGmUzmBFHXz/DpfR1q
 BAjNSlGzt1ki+YNhZW9mkCMb/v8VJeqzOOH97JV5qjkrYGSYw7t9OKeiMi9EJxPZ08Hg
 mjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782305130; x=1782909930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pq3pVOWs5xUz0luOR7Gba+BoRAVEKlJAiyWE6ZD8t04=;
 b=sm31Z1GrprdBvbKgJuC0N3u7AvTfw8SoN+G3abmYpFvyAbEcwSzqzgIsmuohiZp2cU
 eunT6h6M309a55tELwyz0fvyl9/W978OPCMVXFR7v6U4tHOUf9WTSKsBzOQEN2qC4IZs
 +UWXQZwDNQOz8D0OdEHlGET7GAZj2YP5I/K16r7NRbqxMClpjmDS4TM6hK7Q8Dv/B+RQ
 IHvK0KTVQZU+UQHQ2BbAKN9YWaCZr6/7M1mIl94pWx/dptzq9ZW/FPDFKXPyulJxQnqo
 tG5ID8o7ybxYwm/FQGFqcDf7/TR9Nhdnl2yTmeBl453f+jLgSWCC3DZch0PpQGz0MsKy
 vhpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KnbBx7e0a8XSUuYVMNg8JZTaGUWv8ogNUtXMbPXA0BOF2rM6nUm8rYThEkzR4UOlnH4aiY9eEjw==@nongnu.org
X-Gm-Message-State: AOJu0Yw5uD4mTMdImUXnqDEXBJpQ78MyzOWxtrGNM0Ff0Cg7MKQ48CBL
 eJqGJ/ramgzfHgl4AUw/6Gm2uNqkayQ0EvSyTHTICynuydw1IvOz36lLSQVmS8i8N+M=
X-Gm-Gg: AfdE7cmGbYx+f6AruG3rtgrI5Z6Xxki0rEcmwHfapHLofMhrXm4Yss/fsKU8hm9TPwE
 4PCwJfGu6QqHxg9yPKHpUrEaIyxN2t5NtLR706vQ3aOVxpttTE71I3mraYi390Ed2EonwyFmhtQ
 aO7PlFwb5dvPJqOaCBqJ9oOuAu19bW1qamRYQPLM1PuK35d2w9McfQsmEOZmgZASp5PjBzv0vCW
 3ZSFeDfbDK27MmbkxjXyazutisbR7r86JgkdLvyH5Ga5c/ilomp4HjrRHwQkGEQkVzun8oJMsWh
 HiO6kdNdqstfaXzmCLD4f+GXBvWNExOIrUFbKUkv4njQb6tokbIlVyIz1jfr/Zb5IGMwNUTWcyj
 WgmxkR1JDX+rRacxKf9H/+TtQ1zf+waVKhuKsOWkQc9yqQP38jUsrenQF7Dgr0vqoKnW1Iulw2t
 7v4AeVUnSgeycA
X-Received: by 2002:a05:600c:1d1e:b0:48a:906b:14ca with SMTP id
 5b1f17b1804b1-49260873781mr43398815e9.20.1782305130246; 
 Wed, 24 Jun 2026 05:45:30 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924923c862sm349689185e9.7.2026.06.24.05.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:45:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3845F5F8E5;
 Wed, 24 Jun 2026 13:45:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/6] target/arm: trigger timer recalculation when toggling
 CNTHCTL:ECV
Date: Wed, 24 Jun 2026 13:45:23 +0100
Message-ID: <20260624124527.1018912-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624124527.1018912-1-alex.bennee@linaro.org>
References: <20260624124527.1018912-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

When toggling the state of ECV we affect the offset applied to timers.
As a result we should trigger a recalculation of the timer value to
take into account the new offset.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3d52cdc4a5e..3f0707126b5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1806,6 +1806,9 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if ((oldval ^ value) & R_CNTHCTL_CNTPMASK_MASK) {
         gt_update_irq(cpu, GTIMER_PHYS);
     }
+    if ((oldval ^ value) & R_CNTHCTL_ECV_MASK) {
+        gt_recalc_timer(cpu, GTIMER_PHYS);
+    }
 }
 
 static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.47.3


