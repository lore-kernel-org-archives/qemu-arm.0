Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp879040ejg;
        Fri, 19 Jan 2024 03:37:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwHgNHbBVZ6EXCMHrDDQJmfatWpFKuZg1EcNxVO7jGNFtkveopUsI55xVScD9apZSmNZmG
X-Received: by 2002:a05:620a:4006:b0:783:7f70:34c5 with SMTP id h6-20020a05620a400600b007837f7034c5mr1503638qko.20.1705664247872;
        Fri, 19 Jan 2024 03:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664247; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNLYsfwUlyHzbDfbTUQwWsDDsv46fqU9dOMjqjgkQI7fr8BXh6H5yXPmVOdwtqYqSa
         8ZdhixNOmF9L87v4t5KO3x0CJ7W8m3I2x8KU8W26lq9EBSoZIbzNPygegGjs9cJQ2bEs
         7jCLD2tUsB1i4XWxIQK7GDxs2Rqq3vPXMr+UeDDB5VJ0zeaEkrsVwR/xeGAaUQTk2MCb
         IIf04wcYTwGtSAgO2ZU302EzV2EQvM5J2G1Shpnca1hODCOnw3m0pzAEZ//I5DLdRXiG
         02k8uHEbvi4ha5OumNLAqKSNv/nsdLU4VkEAppCdrWBNfTqITtQ9Sh/Diwg8HjWLTQEM
         9ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KNW2fCmz3vLZacxmspFmUgZW6wt1zZjsUlXpiy/aG9E=;
        fh=nv7G772+ribqGI5+maNvvILNaKKA/VNlsBf0PDEbPQ0=;
        b=GSE0jMQvWXy1DgxtF4AG18MwhJkuEkoKRWGr6jhvpXeqrY/P1ZKZ2M+M3cGx9Tqo73
         dFL16LQMETkNQgLvBUUvvma18QHgMhkZvhiTMFbc14kZFh9O6OipS0LdPj6YMozZAOhN
         ZUL+H/Oqadlg2R2JR4ItoUzmA9yZ1oWKU+xf9bX/6IxXC1+JLAOWhFSpjNDZ6dVaBEdX
         PZz19Vfqzp7MoN+YudUIgHeU9DXB4IyjpzpzjRS4iSDiL2EPvW4/rX/TtOLVWcsHoSgY
         7mfoKsRqj/aL+Q8P7fNMP/hGC490TWgeQgVb7kRPGvpJFE4otuf1jBIeJbMuE4o9VFL3
         dGIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wudcmL2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op49-20020a05620a537100b00781c2c2d22dsi15660948qkn.204.2024.01.19.03.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wudcmL2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnAY-0002pE-Dk; Fri, 19 Jan 2024 06:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAW-0002kP-KR
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:17 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAT-0001rS-JZ
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e9e96edd1so4733815e9.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664172; x=1706268972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNW2fCmz3vLZacxmspFmUgZW6wt1zZjsUlXpiy/aG9E=;
 b=wudcmL2NOP+d+0Pq0DeHE+6qytv59retL2d6FnPiUUJ/sUnOgE1r199Z5R6wP8d83x
 8nNmINcW7TNrKE1Whzvd8mKYqXDRiTGrhSPx7l5DoILDeJsebsTzMjReNmdI2AKigZ5Z
 8m3vdZCs071W53p6UKANYkleGqcBjq0KI9Y/Fk64evPW7H3Ltlm6EfahIZ7AOA37eK7d
 jYBxufya6i8e986/nuIgd0cDgk1+Nf1wLjXxzhlppzKa/P8ylewX1i85GHPm6zwSFDKW
 ehuvhpWwgFZBtHdOiQ6oZz+D9clD76h+rpbRIYrk4LEYMJIEIWeRiyTkBLTCvSWNC5jY
 ot9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664172; x=1706268972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNW2fCmz3vLZacxmspFmUgZW6wt1zZjsUlXpiy/aG9E=;
 b=h33cC6vdokj/SYWKeJyJ2PQXk7fC294TYdfFIRcuxpcxQuFVK++iLyH+wHJ0WQU8xP
 YNFf5NC51t5RU20xD0aSLWh2R/e/aU8DlJ+qt/UdaI9ZKUL2LXZwBRWIhye40vJw4C9z
 IbhiMASI59cRixRDpHlsNOimp4ZQJUBdTsV7Q2NoufaA52jhGYuZw5CnQrp6vOx5/xbS
 KaZbOqYgYGLLwIdL3F+BkrTJl0I4Q/ISg47aw6/KtkNZMU7SeDTWAPpyUSgOFQclDNT4
 MlzySovtZj1Hq/sP5VnrGBMo0A5MWeFKUXKQTQryBE1q/U7h8JSJbhk5evPy685bANNo
 3AbQ==
X-Gm-Message-State: AOJu0YyI9gCgezHkDsK6SWdfFSPGiTOmKqNZz8QwYRtz37V/MlfESgaY
 WFwcn1WOP3IX8wkkQ/xbAkGbi6cwk4ZQIhK/m2CYdzKw50H3waxyyIGP8/hHua0=
X-Received: by 2002:a05:600c:19c7:b0:40e:6688:2527 with SMTP id
 u7-20020a05600c19c700b0040e66882527mr657905wmq.291.1705664171877; 
 Fri, 19 Jan 2024 03:36:11 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfe601000000b00337bf461385sm6297076wrm.26.2024.01.19.03.36.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 14/36] util/async: Only call icount_notify_exit() if icount is
 enabled
Date: Fri, 19 Jan 2024 12:34:43 +0100
Message-ID: <20240119113507.31951-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: gT9WX0HVtmtv

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231208113529.74067-6-philmd@linaro.org>
---
 accel/tcg/icount-common.c |  4 +++-
 stubs/icount.c            |  2 +-
 util/async.c              | 16 +++++++++-------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index f0f8fc7f1c..a4a747d1dc 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -495,7 +495,9 @@ bool icount_configure(QemuOpts *opts, Error **errp)
 
 void icount_notify_exit(void)
 {
-    if (icount_enabled() && current_cpu) {
+    assert(icount_enabled());
+
+    if (current_cpu) {
         qemu_cpu_kick(current_cpu);
         qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
     }
diff --git a/stubs/icount.c b/stubs/icount.c
index c2c10dfb6b..1eb35b10a8 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -45,7 +45,7 @@ void icount_account_warp_timer(void)
 {
     abort();
 }
-
 void icount_notify_exit(void)
 {
+    abort();
 }
diff --git a/util/async.c b/util/async.c
index 36a8e76ab0..0467890052 100644
--- a/util/async.c
+++ b/util/async.c
@@ -94,13 +94,15 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
     }
 
     aio_notify(ctx);
-    /*
-     * Workaround for record/replay.
-     * vCPU execution should be suspended when new BH is set.
-     * This is needed to avoid guest timeouts caused
-     * by the long cycles of the execution.
-     */
-    icount_notify_exit();
+    if (unlikely(icount_enabled())) {
+        /*
+         * Workaround for record/replay.
+         * vCPU execution should be suspended when new BH is set.
+         * This is needed to avoid guest timeouts caused
+         * by the long cycles of the execution.
+         */
+        icount_notify_exit();
+    }
 }
 
 /* Only called from aio_bh_poll() and aio_ctx_finalize() */
-- 
2.41.0

