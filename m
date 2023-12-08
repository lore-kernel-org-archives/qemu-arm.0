Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2256251ejb;
        Fri, 8 Dec 2023 03:37:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3aLNkMHy/GCaCWZiZ9QIIlv2uoihl/QRwOQESysl/QF72s8+iXvZLqYRUpXnQgyCbKqpn
X-Received: by 2002:a0c:e802:0:b0:67e:aa84:b094 with SMTP id y2-20020a0ce802000000b0067eaa84b094mr928927qvn.2.1702035474744;
        Fri, 08 Dec 2023 03:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702035474; cv=none;
        d=google.com; s=arc-20160816;
        b=Rn8i2Zc8fnwa/mr669E3unDqdiEzw+BAluzCDCEO86+cUIB+y9piLBpFMcE8hMUzJM
         xnfFaQnhiLHu/MIS7vA28ndCjlf5pJgp8Pc1DT0xWy7pf1OFXgSKA55tCdHtFqaPnOZ1
         Lk67nZMXQQZU+YSNbjSz8xq1bWdO6Io87h7O6lmk/8wiClSAZ4JMKvUF0GwlAtCHeP9p
         OASiJKjW1kk4okshef5f+z2gwLr44sDGuZ8jhSg7Z3nbHDbqElDw6gFks4QxRnL8rg38
         DRrJBhYtgaJSrxYXR+7E8UC6FTYESekeSEqsJ54vVUK1GvB3DW8HuZ5ZzshhcLWn16xt
         ObSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aounwOxU0stD+ad14X4lh0j79a9byd2e5HWz5wFCDts=;
        fh=QdevGGL2LydCvB/btUcdJnXEA7h6h6ICE8REXL8PVZU=;
        b=juQvj0xTOj9Y88m4GdjsRP5ZPPT7Y/I9AIT9brdPwLNnryYsbAad7e9K5RNxIWbFXD
         ELPCOhYSI7gq1RVAe28ljkHcXE/SawcxzKbgI3izGtcGCdg2oMqBsNCNiPO3pPGzIyJG
         6sTM4WeilqbtFuWzegJWHUUawBRLeQF0VTyJQdqGQRA2Go7V76T4BYS51y8Y5m+a0hwa
         ts3/VBp3WXMFAZy1TTbpEIdIqwjgdBc7jVR0TYjEqFyxU/eqiGG8TAYt9Ivevc8cjBLD
         UrVoP/rbwTutfxgiNmslMBLsWyZbd8wVHyo7VeF71bQnDS/i5dVsV/OyyODVXJ/ghfP1
         b8vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EvNTH9tw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020a0cfc0e000000b0067acdb383cbsi1896806qvo.444.2023.12.08.03.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:37:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EvNTH9tw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBZ9E-000490-QA; Fri, 08 Dec 2023 06:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ9C-00044d-Tj
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:35:59 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ8u-0003Yx-3l
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:35:58 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50c0478f970so1998982e87.3
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 03:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035338; x=1702640138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aounwOxU0stD+ad14X4lh0j79a9byd2e5HWz5wFCDts=;
 b=EvNTH9twEsScSKn1OjJ1xRaVbMZ88AGPDcZHfBCcndbZkhMv3gmjRJzsQ6FBIFCQy3
 A7iy0LB/1D6UzcaHUkGTfs8ziOFaTmpKsk+pX49uBEVzcLXQqvFMZIF6fT3FsZNPbxd8
 JLUULaK33byWx931ZVlKiE9AB8U7CFuGX33XypSz0HccjKmUIgiEeoOmiNYOepHdtM9O
 qTfeYDRiFS75qqdYMhxMjU4geGawkJzq+Cg7OyPEr08nvlr+SWf25n9EwGrtLT7vkKCV
 VxwBHEBnLCRDBSZHeAF8263WKdYI/d2WF+zv52B8QacrLj/UOYYBnoPYc6KxXV3LiJSH
 jL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035338; x=1702640138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aounwOxU0stD+ad14X4lh0j79a9byd2e5HWz5wFCDts=;
 b=hGNS46g5qbh13M3larQIW0tXfHnueskpsS1tqieGDnGeCI7qYhko6ONkDV3YnfGT/L
 JQNcl2vr1xK7jF9h+/wuwdy7Ii1wUkgDcwJLbRaflvK+9GPTprz/U7884v5kdIY9NvL2
 gFmuq+Ic1+cFzMykxcoHTToQR7lPrnyDqlb+iIHeZoeeIbC9tjXrOdF7nVXVB6x8JhBp
 hdactV0Td8U2eFl04KmaroXSX6ngnjX8aq/GRq8Nx20SL+SzQ30rXKxZBG9l9dOxyDR2
 vymPuXG8Y7x9Kw6fY1Z+zxbwbTMKnm+tK7ug5DpkDGrkF8yaA38/KGiXce0mQ1/PpSfv
 BHUQ==
X-Gm-Message-State: AOJu0YxwslI+5wqdvihhTMssT1H6XICceUG4ZIYMhYx323lcweO2unYi
 EjvPAs9K3q6oBiLLcsY0OwK2Zg==
X-Received: by 2002:a05:6512:3b84:b0:50d:15d0:6337 with SMTP id
 g4-20020a0565123b8400b0050d15d06337mr409575lfv.56.1702035338141; 
 Fri, 08 Dec 2023 03:35:38 -0800 (PST)
Received: from m1x-phil.lan ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a5d474c000000b003333dd777a4sm1856171wrs.46.2023.12.08.03.35.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Dec 2023 03:35:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/6] sysemu/cpu-timers: Have icount_configure() return a
 boolean
Date: Fri,  8 Dec 2023 12:35:23 +0100
Message-ID: <20231208113529.74067-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208113529.74067-1-philmd@linaro.org>
References: <20231208113529.74067-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: R+EZkFQ9gpdm

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have icount_configure()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/cpu-timers.h | 10 ++++++++--
 accel/tcg/icount-common.c   | 16 +++++++++-------
 stubs/icount.c              |  4 +++-
 system/vl.c                 |  3 +--
 4 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index 2e786fe7fb..b70dc7692d 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -50,8 +50,14 @@ int64_t icount_get(void);
  */
 int64_t icount_to_ns(int64_t icount);
 
-/* configure the icount options, including "shift" */
-void icount_configure(QemuOpts *opts, Error **errp);
+/**
+ * icount_configure: configure the icount options, including "shift"
+ * @opts: Options to parse
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Return: true on success, else false setting @errp with error
+ */
+bool icount_configure(QemuOpts *opts, Error **errp);
 
 /* used by tcg vcpu thread to calc icount budget */
 int64_t icount_round(int64_t count);
diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index ec57192be8..dc69d6a4c6 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -419,7 +419,7 @@ void icount_account_warp_timer(void)
     icount_warp_rt();
 }
 
-void icount_configure(QemuOpts *opts, Error **errp)
+bool icount_configure(QemuOpts *opts, Error **errp)
 {
     const char *option = qemu_opt_get(opts, "shift");
     bool sleep = qemu_opt_get_bool(opts, "sleep", true);
@@ -429,27 +429,28 @@ void icount_configure(QemuOpts *opts, Error **errp)
     if (!option) {
         if (qemu_opt_get(opts, "align") != NULL) {
             error_setg(errp, "Please specify shift option when using align");
+            return false;
         }
-        return;
+        return true;
     }
 
     if (align && !sleep) {
         error_setg(errp, "align=on and sleep=off are incompatible");
-        return;
+        return false;
     }
 
     if (strcmp(option, "auto") != 0) {
         if (qemu_strtol(option, NULL, 0, &time_shift) < 0
             || time_shift < 0 || time_shift > MAX_ICOUNT_SHIFT) {
             error_setg(errp, "icount: Invalid shift value");
-            return;
+            return false;
         }
     } else if (icount_align_option) {
         error_setg(errp, "shift=auto and align=on are incompatible");
-        return;
+        return false;
     } else if (!icount_sleep) {
         error_setg(errp, "shift=auto and sleep=off are incompatible");
-        return;
+        return false;
     }
 
     icount_sleep = sleep;
@@ -463,7 +464,7 @@ void icount_configure(QemuOpts *opts, Error **errp)
     if (time_shift >= 0) {
         timers_state.icount_time_shift = time_shift;
         icount_enable_precise();
-        return;
+        return true;
     }
 
     icount_enable_adaptive();
@@ -491,6 +492,7 @@ void icount_configure(QemuOpts *opts, Error **errp)
     timer_mod(timers_state.icount_vm_timer,
                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                    NANOSECONDS_PER_SECOND / 10);
+    return true;
 }
 
 void icount_notify_exit(void)
diff --git a/stubs/icount.c b/stubs/icount.c
index 6df8c2bf7d..85c381a0ea 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -10,10 +10,12 @@ void icount_update(CPUState *cpu)
 {
     abort();
 }
-void icount_configure(QemuOpts *opts, Error **errp)
+bool icount_configure(QemuOpts *opts, Error **errp)
 {
     /* signal error */
     error_setg(errp, "cannot configure icount, TCG support not available");
+
+    return false;
 }
 int64_t icount_get_raw(void)
 {
diff --git a/system/vl.c b/system/vl.c
index 2bcd9efb9a..17234012d4 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2270,8 +2270,7 @@ static void user_register_global_props(void)
 
 static int do_configure_icount(void *opaque, QemuOpts *opts, Error **errp)
 {
-    icount_configure(opts, errp);
-    return 0;
+    return !icount_configure(opts, errp);
 }
 
 static int accelerator_set_property(void *opaque,
-- 
2.41.0

