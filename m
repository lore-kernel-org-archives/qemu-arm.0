Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C59F9EDC7
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX5c-0006TP-6t; Wed, 22 Apr 2026 08:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4m-00061x-Jb
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4j-0005Vm-KE
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:08 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so43315085e9.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862384; x=1777467184; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fpr3Ng7R6+bvHtx79oLF5EYo5OylKP6gzyU2DP/N60=;
 b=DcOwuHQXBQBgBOgYnWRfyoqu1IOQKXkxDvJMajF5zbh1uc5e39Jw1SZ5ihhFKbBg+U
 8G7gb6+kwP+qL4UNSvSvPgyUBCLSGWz28Z9jLH8OF40TzphpaIZVbKLykyshAzWDSlom
 sOOZ1CV3GAQrPn00vickrWDNhlSHTNMsDLoGXu36jmw3yhfAE6ueOvwUdx2or132vANQ
 94j41jp9U/1FOLdIx+XHQtbmgDYvmuKqrsiN+CG3aucj+GJKjmxOtMkHL4kMp3HORdJV
 8neLsFxGatemL3VMWivJ4W62uFHg91Wxmo1zl2EG3B6MSDlJx1wpUiLaPhH0DQkoo/hR
 WMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862384; x=1777467184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9fpr3Ng7R6+bvHtx79oLF5EYo5OylKP6gzyU2DP/N60=;
 b=qL/mV44W6LrrC9F9I4sn3kyQjORxCga7QA4MiQuQHiDrq+lXYbCkxNiWGdljUQsJll
 l+JaJY/OL8uwXtUEmiufcdTQ5aY0zsoGL0zY+6dpzpd/WuOtpbomcc/NXW6dQpZt9vzX
 dJGMkGq0YliqFMHhFy2/A3auAdfu0YKtiO30Wm0jG3coakv8+MF0iVhvXzfmzxmnZome
 yw5WjK4ZDr34pu9AOEXBav+shtPSzciZiYHzrfbf0oUDniuN4lxyfCgo9jtW9cxYzong
 pxWM+++gfXoz+LRFNEhmvhF4Tza6yH/tsCEPn7X5yRCj3lRJadWeZLrbYbEz6T6Qr+1A
 e/zw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9GTqMQfnPspcnYZffYUutsJBLyNXVZoEIbTOUgov079zqJpkWGDPnisK9WXq25k3UBuw1kTPxrzA==@nongnu.org
X-Gm-Message-State: AOJu0YyUiOFd+5WvRv4koiJqxberbsh/O492zqHfvl8sV0L7IL9QP4Ym
 WDcKgyRH9xhsHSlIh15Ncti2FIOTvi4Nr23nodMu9DMOqY3E7+3uf4XCLBjCTc+Car4=
X-Gm-Gg: AeBDievHnR81U0mTatOWL5dmBFLieHRVSA0Rj/0KnJgvwEYluhuwn6YBiFJaDRrwja0
 9Zytsr9JYIoystQiP/rZMDvEBKj8DT695PY37pAp8reN4XI8ac2OmpNutBQ+KZ2hZSgb0rKBD6b
 tuhya5s0AUzzONn7TsXlygJe3ycAcwD/zCBprloKFNB1A2skBdVhOGFBfnZCQ0hW8+FxT8YEVKd
 37ZbF7kI9OkclED7i6Pq9ufF4HQxwT5Kc4YXHg9W1o60lDoRouay2RbvhD26xmln9iKDMmzMV6A
 vl1lwzPGF/5G1LYyEJv7rGfc1BDFkhAGwZY8VO0uKCQOj9csOMXgG70ri7/lqTTDxJmjznzVgVX
 vQgPmWa8PxVEhQFAmZhncv4hKcqoGpbNlfaUTrceHR2yVVuJULTGST17wNm2fWun34218abwNtN
 QbRMMdA0sLg8n0Oco2uo/qSvGwAdkX5nECeVdyUedmGui+
X-Received: by 2002:a05:600c:8b55:b0:48a:57e1:d8cc with SMTP id
 5b1f17b1804b1-48a57e1d8d4mr85199615e9.9.1776862384161; 
 Wed, 22 Apr 2026 05:53:04 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5499b0edsm137343125e9.14.2026.04.22.05.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:53:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3D0B3610BC;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 16/32] target/arm: use syndrome helpers in
 arm_cpu_do_interrupt_aarch32_hyp
Date: Wed, 22 Apr 2026 13:52:33 +0100
Message-ID: <20260422125250.1303100-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

One more step towards dropping the old #defines.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - drop excess brackets
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7389f2988c4..40dd070d2c1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8898,9 +8898,9 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
              */
             if (cs->exception_index == EXCP_PREFETCH_ABORT ||
                 (cs->exception_index == EXCP_DATA_ABORT &&
-                 !(env->exception.syndrome & ARM_EL_ISV)) ||
+                 !FIELD_EX32(env->exception.syndrome, SYNDROME, IL)) ||
                 syn_get_ec(env->exception.syndrome) == EC_UNCATEGORIZED) {
-                env->exception.syndrome &= ~ARM_EL_IL;
+                env->exception.syndrome = FIELD_DP32(env->exception.syndrome, SYNDROME, IL, 0);
             }
         }
         env->cp15.esr_el[2] = env->exception.syndrome;
-- 
2.47.3


