Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp872727wrm;
        Fri, 11 Oct 2019 07:00:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPRUpCuKEGXsS6CuLrdwLXGAojMqDkRS8ctUAlZCOBucpJeNoS00rSbHHLQ/lUxNXZv43v
X-Received: by 2002:a05:6214:1234:: with SMTP id p20mr16374848qvv.204.1570802416623;
        Fri, 11 Oct 2019 07:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802416; cv=none;
        d=google.com; s=arc-20160816;
        b=I711Qc4I0cZVZqdrF0sYMVglHUPHDvKg9AI279+h6/nepk1+UPAdaZWFSKv90L2ygr
         jFAwOwOIi5ijTJpPWcOWMQCwm4La9ypMteYmwYyqC5Qa4enPSiKWEtM6AltOZTjku8Db
         PWJg2UNAbk0xrClxbwHBHLfsuuyDQdultV394n0/axI3sNhgfRhoFjLs7g1C94C+VraV
         tmtBHTt2/jbddrixAipmUyq6Ql9HOXqMh+YwsUK1Qx16WzDKIkS6ofXUI3AyVlguIIzG
         kJusgV+16OBsMYFWcXxvPlB9RiZFtzw6fpIOljOV1gBG23/yVEC1U7DjYrYcfl29FsL+
         xsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=BzP/FFrDkoCzHDBfpSksVJlWN9Ryii7p6SjFwNyKnoU=;
        b=nK80SsqmHxOVhlXIgc9dcTFFD4wNopP8cuVIdiZs7EfUfPdwoKLcsBU6AV12j6jN7f
         L3D7XaWzmI2BKF2EJM6vpSC1LoZvhT/5tvLX4oGdIFTa36K7u+ONsC8ejHSfoCaR8G/H
         Kq5qj4XTNRHT7v5kGSMb8wLPKPooGj2MiZDNbLoPV3a4Fu0K1SsjQzXTThjiHE5PxH6w
         ckZBHTvu//JsLcGWAyhy80+j9BRrBXddZRrIHlObvkDSknRYaE+4iID1m0loNM70osVQ
         /swz227DVasd2rQ654sJ10LDB2QXkgtiKk4c8O7Wt9FfuLphAMhj+NYtFR/xHXSmPW6J
         99hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AqkZODQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o38si8422597qve.161.2019.10.11.07.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 07:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AqkZODQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvSp-0001U4-Jr
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 10:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJK-00063F-Qt
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJJ-00047v-NH
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:26 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:34911)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJJ-00047Q-Em
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:25 -0400
Received: by mail-yw1-xc42.google.com with SMTP id r134so3502770ywg.2
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BzP/FFrDkoCzHDBfpSksVJlWN9Ryii7p6SjFwNyKnoU=;
 b=AqkZODQVhA9/WR2YJsfGrFlyLg4lQqOmCuQ0HC5OfNv23kCK2P6hgpaP6fUkiP4ikF
 hUWt8U+8jkxWhD0FKjp2nEcyGHZEJDCzyu7PLJbwMjJx4jQCbUgdQ8OIhdSpS4hDBibf
 T/LLCfpNIsbRh6Nv6KXLV2tjYAk6T94JD55f88+c6TZ/XhMcpq6Uyh03s3EZ+RKq9+JD
 9tX4zvU0OsWOVUOS0JvJWtmixKhiregKwL9Kn4zZrjyX73BelZArm9kMZXeMRT9PCxSw
 ormYGSJlrWJDOzGd/vaMaUPvr0KHyRLJvYzuf9HdKkBYnQL0buaJDnrmd+RmK1d4XEle
 vGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BzP/FFrDkoCzHDBfpSksVJlWN9Ryii7p6SjFwNyKnoU=;
 b=W/8Yt4vywW+tZ6NW9jjvWCtNgL43/l9ukxwvAekNBkp8ItZX1xZc4IfSbHsEpCCR3X
 JfT3RYl4ERVAFDTXcBwUUinwS2K6RY/zu4RjPp/OlvaqJ0NQSv7F8KklmQHyAoCCRFT6
 0M9qzgeDhotzllbbqZZzdNce7xebVlsg1qtFT6BzkmWBJfkM9YekN5vLzonn8CYSzauG
 p2RB23Cxx2BipPqgoG17vXczJ0ojTfUaW9YmUzU+KNXr4WllUXe4XYh34BUyJSaMLlfd
 SmsgrSwvaeOftgmXbFHMVcKlDUDmVohLtDmQv1Nyr8j1wf+SwgzWBpM0mOGjQI9o92ay
 2pQA==
X-Gm-Message-State: APjAAAX7M5cablnhVHtcJAxRvreHoUpiSo9h0Hw0D926xT4gCnIIJqp+
 Tn8wWvlmMeRXkcKBpDcOaP2FSw==
X-Received: by 2002:a81:3986:: with SMTP id g128mr2497798ywa.487.1570801824830; 
 Fri, 11 Oct 2019 06:50:24 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/22] target/arm: Set PSTATE.TCO on exception entry
Date: Fri, 11 Oct 2019 09:47:39 -0400
Message-Id: <20191011134744.2477-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rO3TGUs5lrQc

D1.10 specifies that exception handlers begin with tag checks overridden.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Only set if MTE feature present.
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index eec9064d88..e988398fce 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8401,6 +8401,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     target_ulong addr = env->cp15.vbar_el[new_el];
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int cur_el = arm_current_el(env);
+    unsigned int new_pstate;
 
     /*
      * Note that new_el can never be 0.  If cur_el is 0, then
@@ -8494,7 +8495,11 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
                   env->elr_el[new_el]);
 
-    pstate_write(env, PSTATE_DAIF | new_mode);
+    new_pstate = new_mode | PSTATE_DAIF;
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        new_pstate |= PSTATE_TCO;
+    }
+    pstate_write(env, new_pstate);
     env->aarch64 = 1;
     aarch64_restore_sp(env, new_el);
 
-- 
2.17.1

