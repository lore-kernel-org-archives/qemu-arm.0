Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6226CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:44:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuV9-0006kf-8P; Thu, 23 Oct 2025 08:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUF-0005T5-77
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuU3-0008P1-NY
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so6241095e9.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761222715; x=1761827515; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xopSbsh+IkB5STrBQ4YQZEElngQLIdle4gTE7izg1DA=;
 b=BmbGeO2gu+UBZ5BTM2htp/wFotQ2ogN7kzNY8us92/jTqlG3sjxlwgtibhUw7J1ud1
 XZamgrTyZGENrZn8mVzClD1nWFONdZ6VbuzxC6vf86KVWnzqzeuNWsTWQkr5D+eCRuS8
 3eGc4pWE4Ldn86Ez4WuzrytSEqmQRloIL9+bk1CfMnyQvgqsTG0wnFvq66u7BGlZS8GS
 BjDdbkcvyXn4VrMBO/P4QESvfsXCJkoS5Odrbj1GtsF09+8kZ8La7xKxtX4zah5hUMgb
 xQHM5cp5pKOeDj3WanXD9QyygelMoNM3FQseu4CQgG3BT3azZ8t0jE+U3mE9UeAGdbpN
 5m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222715; x=1761827515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xopSbsh+IkB5STrBQ4YQZEElngQLIdle4gTE7izg1DA=;
 b=s1raueK+cz6sj/33sXaO2dheN1OfpE5sMV+ZhEIiXPmToJA4H19Q/NLPK2ndp1Xz/r
 0x7xzb77R6IqBr3HYZm0YdzqGjvUmwTatgxX1vHtpg+Ovp1R2WumcgEuy3cMxIoJjLfX
 9tw97s42aLGEIwgCrQ6rWs4ot2/2u0stgR50NlfJwIp04aYE0UnyJ5MUG1yGiYv0JfPJ
 lJLjDLfsDXLQRUJA+MLt5IAoa5x1OBlM6f3CIbbzUfQa080IxRUZFmBKqrs1QwVOk3Ao
 hGicJgTN8cNn68q12ERTxRnv62KkE0Oluu3vo53zUj9y14JVVzXDmBTQfWFYwQrepfck
 SFwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp24mbM+D6wYlG1Q9hLh4hlsPmMki+dkNYVvmjy3IXc22NdJos3O/UVtkDtC3J3mBz86KCDOCaZw==@nongnu.org
X-Gm-Message-State: AOJu0YzJiIlp0McvDBXhdSU6I/YrF5ckIydNOS4ZFsEsBDMp2dgFBifZ
 FmYMK2ZwIw4iqub77RnzwNVojhrKCU8WqUMA0PCUHKrLWz7FATUiMawcCl4h2ZTxErA=
X-Gm-Gg: ASbGnctHS65SG+qF3HNRjvCJPqc19zGjIcMIkWUmMawr3qUZn1YMoM2MZRbOPPpcVGi
 Kf6CsSx3NjmoIvDc2bNxEXTeMajEMV8zBQyTnYUbTHsIbRF1+ICo2Izir5WOmG1MzFyWsALvADT
 mZx3Z/T4xlIC37lVjT8cd3FhTJV59Mo4PjcJBx47JpQLLycN2I+cJ7Y4VdbSzFdXh/pTsetUaH9
 L1nkk3PKJkZrq8UgrATGLv12XMa9CkRP7tAB2vOB9W80ja7oplTZvhJ7ZYB1KI9qeo4jqXaI2bo
 GczHiBWcRTkKPudl0zXTsjDpCKnrc0fmyWds5Qbmfzv4/YnJxE/wxRLUKUc0q803fsDldf8F4Qf
 xvNXjN/jP+w/8MqyoLZQeyQcDRQvUgHqgOv1U6t/ZZdXs6T+MN5SFWDHpXTIPiPpCp8X5G9MwFg
 Oc8TMEZLRUnoqeH0T5IUDKq217mtu+spOH0hBLwlYubkqsF4sCCi/crq05NQXc
X-Google-Smtp-Source: AGHT+IGEU2IBoSQZLt4Ab58guPQIpf8DWmjNyHuvhqmIqNJDdMprKnJOlr8YAHvFe4ycMS1p8kAe8A==
X-Received: by 2002:a05:600c:3b8d:b0:471:60c:1501 with SMTP id
 5b1f17b1804b1-47117918c0cmr204928115e9.28.1761222715556; 
 Thu, 23 Oct 2025 05:31:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496d269dbsm56778895e9.11.2025.10.23.05.31.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 05:31:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 52/58] accel: Introduce AccelOpsClass::cpu_target_realize()
 hook
Date: Thu, 23 Oct 2025 14:31:36 +0200
Message-ID: <20251023123142.8062-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
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

Allow accelerators to set vCPU properties before its realization.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/accel-cpu-ops.h | 1 +
 accel/accel-common.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index 0674764914f..9c07a903ea0 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,6 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
+    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 850c5ab4b8e..eecb2a292af 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -106,6 +106,11 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+    if (acc->ops
+        && acc->ops->cpu_target_realize
+        && !acc->ops->cpu_target_realize(cpu, errp)) {
+        return false;
+    }
 
     return true;
 }
-- 
2.51.0


