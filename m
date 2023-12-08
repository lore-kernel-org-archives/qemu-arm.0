Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2255665ejb;
        Fri, 8 Dec 2023 03:36:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUqWYkgs9xuJDDx4RHciRitQ/25NUr6xt/k9a/5z3/eVI47A2Tvu1a4US9JH8Pha4o5Im8
X-Received: by 2002:a05:620a:7f7:b0:77f:3d7e:65b3 with SMTP id k23-20020a05620a07f700b0077f3d7e65b3mr2521694qkk.1.1702035398050;
        Fri, 08 Dec 2023 03:36:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702035398; cv=none;
        d=google.com; s=arc-20160816;
        b=nM2mTr8sMRS5dFUFsDIUkMhO5k0GRdXlzLXn8WyFscZFS3NL22nCKJVXtTXY+zKfg2
         ypN66o2KdW0XMvaxKj2NxktYY9RwqGBRFCvhMqQgWGJZUSo/NtxZpsYP5iOHtDQ4DIUB
         Q4SsMlWvWK9kf3fKpmeE45MyEBhmDnv2UNv+WgCXN5xn3mFQXOfMaKnpOVSaotmnVQza
         TqYUER31A/MC5mWyLu0pE8+jnjHxp2kTuaevSYOZiUPwcvtw5cgfBLzV70Nt3gwAAfjQ
         hfqAhZAAFBrrprc9vT8tffQB/05auRE3Kbwp+7hjjeXgrmqvELPtFaPtcow8rxHkHdR/
         3big==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s3HTu7y4p69f2n52cu7XGIz5WrQJeOViDCPX2rbiUwY=;
        fh=QdevGGL2LydCvB/btUcdJnXEA7h6h6ICE8REXL8PVZU=;
        b=tFsg1vvBDY11c5U4p0+K1CeQEiuGgkxFcw2ISNB8vuT/ck+4FLmbY8ZGpKJVNXnWqk
         KiE31o1IyHHOP5cWygr9fZ2UdMHC5NbNmQ85q4vymxvWi90pQmkrZGMWPn68SKURuqcy
         CFq+K8gF0D1VjbUQzQ/Zsypj5Oxu1aXso9l6KRNWVCDhZ/qQaEdR/+CEVKoYKsBeS9tu
         KxUzcjL+odnWabppVPWRH09xIxrU8vKZEJKzi0Tla0bWWWh2XkqUtxscs7QeDsXML/zt
         Y4w0DPEVHGw2AVl5wwL5a+MDyeB2XKrVGXqwDEk3oi8tT8sUJERay/sDMEH+oSsWGKhu
         LTBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zlmfIsMM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11-20020a05620a118b00b0077d783c7ee9si1841498qkk.193.2023.12.08.03.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:36:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zlmfIsMM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rBZ9B-000427-He; Fri, 08 Dec 2023 06:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ98-0003xi-TF
 for qemu-devel@nongnu.org; Fri, 08 Dec 2023 06:35:56 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ8z-0003ev-K9
 for qemu-devel@nongnu.org; Fri, 08 Dec 2023 06:35:54 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-332fd78fa9dso1811329f8f.3
 for <qemu-devel@nongnu.org>; Fri, 08 Dec 2023 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035344; x=1702640144; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3HTu7y4p69f2n52cu7XGIz5WrQJeOViDCPX2rbiUwY=;
 b=zlmfIsMMeXmmS8TZ5O+7xDFNSB4/0E7NKbYmLQ6umARlB2QHplo+fSsjngYPgE9whh
 zM3j9YQcVdMc/Ojwiyyw6zbCOdKkjBaMY49jfT0BJsPZJsBQ69sR/+vofi1+4OP8GViI
 +AX2ZEHVlQL2j2lCwwnNVCxKRMtjXr3fXCQj+tZ5gtNRfcD++KWXt4AIyP7LcPU81Q71
 Hdx42tFQbNPJWCHYp1ovOD8rCh3e00BSizXBD+kLAs/4wEAHatIpirbcbv1JxI+/PSVU
 MLHY1PnkgzMMcICnT0b+KAaSdcbrEOuUvRcupYHS/W/CBIk7HvzpPHjAuzqtgDY78JF3
 LQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035344; x=1702640144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3HTu7y4p69f2n52cu7XGIz5WrQJeOViDCPX2rbiUwY=;
 b=TgcLShghgKt3TEQHMkPkNoRw62A9ypmeIFSnKKsg8yRcKb/v/v1l/K4lhSTQFvzsFV
 23MPcLgYiYCfE7OWoGkdfMJCLiSh/bOFG2utTH6XB6zSQms09jbF9c/vfn6RPy0LqiRV
 KuuLEnLk9tBdClfiVqoXQ8xCcUNTf2sZyyCAcSWMpLq2nu8SJ9p8IMBvdOdGh8Rj3x3M
 mWbveDOVZgX57an2nimy+YR5oLynWv85EB1dLIWDMs6HSmS54imYo/D2+TiGjqmhS/Hj
 eE2Rh+GLilQXDHNFGAr9CinM85heMf8/RNLGnstQfICf7QsUUXK+5MLTG2LT19OVzxSq
 hLuw==
X-Gm-Message-State: AOJu0Yx5D/sN9v7XMERykQfIg5ViNIrd5oZDFofd9vk1rM5OEOGz1rI+
 CG1yFdtmC8FvNPjwTqRp4ROonYv5InAw69SEO1Y=
X-Received: by 2002:a5d:4e8e:0:b0:333:3117:c475 with SMTP id
 e14-20020a5d4e8e000000b003333117c475mr1155627wru.262.1702035343902; 
 Fri, 08 Dec 2023 03:35:43 -0800 (PST)
Received: from m1x-phil.lan ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfe74f000000b0033335644478sm1822835wrn.114.2023.12.08.03.35.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Dec 2023 03:35:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/6] system/vl: Evaluate icount after accelerator options
 are parsed
Date: Fri,  8 Dec 2023 12:35:24 +0100
Message-ID: <20231208113529.74067-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208113529.74067-1-philmd@linaro.org>
References: <20231208113529.74067-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 76YNC4rEgHAP

We need to parse the accelerators first, to be able
to check whether TCG is enabled or not. Then we can
parse the -icount option.

This allows removing the icount_configure() stub.

Fixes: 7f8b6126e7 ("vl: move icount configuration earlier")
Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 stubs/icount.c |  8 --------
 system/vl.c    | 16 +++++++++-------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/stubs/icount.c b/stubs/icount.c
index 85c381a0ea..014ae5d8e4 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include "qapi/error.h"
 #include "sysemu/cpu-timers.h"
 
 /* icount - Instruction Counter API */
@@ -10,13 +9,6 @@ void icount_update(CPUState *cpu)
 {
     abort();
 }
-bool icount_configure(QemuOpts *opts, Error **errp)
-{
-    /* signal error */
-    error_setg(errp, "cannot configure icount, TCG support not available");
-
-    return false;
-}
 int64_t icount_get_raw(void)
 {
     abort();
diff --git a/system/vl.c b/system/vl.c
index 17234012d4..af809331bb 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2270,6 +2270,13 @@ static void user_register_global_props(void)
 
 static int do_configure_icount(void *opaque, QemuOpts *opts, Error **errp)
 {
+    if (!tcg_enabled()) {
+        error_setg(errp, "cannot configure icount, TCG support not available");
+        error_append_hint(errp, "-icount is not allowed with"
+                                " hardware virtualization\n");
+        return 1;
+    }
+
     return !icount_configure(opts, errp);
 }
 
@@ -2339,9 +2346,6 @@ static void configure_accelerators(const char *progname)
 {
     bool init_failed = false;
 
-    qemu_opts_foreach(qemu_find_opts("icount"),
-                      do_configure_icount, NULL, &error_fatal);
-
     if (QTAILQ_EMPTY(&qemu_accel_opts.head)) {
         char **accel_list, **tmp;
 
@@ -2401,10 +2405,8 @@ static void configure_accelerators(const char *progname)
         error_report("falling back to %s", current_accel_name());
     }
 
-    if (icount_enabled() && !tcg_enabled()) {
-        error_report("-icount is not allowed with hardware virtualization");
-        exit(1);
-    }
+    qemu_opts_foreach(qemu_find_opts("icount"),
+                      do_configure_icount, NULL, &error_fatal);
 }
 
 static void qemu_validate_options(const QDict *machine_opts)
-- 
2.41.0

