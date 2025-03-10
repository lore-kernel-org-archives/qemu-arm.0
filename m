Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp843544njc;
        Sun, 9 Mar 2025 17:10:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIY4jixvp4ksuFoy3W7hOzcHB/+rZKMXjhrh/dT8NLVyIABlzLnRUrPRRor/AjN5aoTV71IipE3zbFeA==@linaro.org
X-Google-Smtp-Source: AGHT+IFbaSpIePVZzmroUW0ZO0UFODY+IfVn7Oi6qiGzWaWVywX2BvnBaX2WOMjc9x0jT3pL/jnM
X-Received: by 2002:a05:6214:d6d:b0:6e8:98c0:e546 with SMTP id 6a1803df08f44-6e9006c8309mr163108106d6.29.1741565444946;
        Sun, 09 Mar 2025 17:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565444; cv=none;
        d=google.com; s=arc-20240605;
        b=YjA7h80cUt5YcXF0eLKcDX9Hc06DqUklnJgN18Cdol7qRzPfl5+PxrSk72ogWSBSTK
         BLa/IJvtuRa/Gr2krErKZF5ivXvrwcYuCFAPLhZyi1k3V0noSAV7jIdexynhnGKgAjDW
         B1Qv1HnBxYMuVxHaqqs633KSr+6zmV+g3SgslHCqmvCtVXAAxr5k1jKYUppXQAcj1RfQ
         MD79KVEpLoSfqtCYD6ylSYJt4++RVttW5JUAJ2YS1gbc2Nv0rjUfF+lfC/nqIF/0eD96
         tzE+e0IHMKHU90zJjBts0qrKR/5acZCUPEkoEvj5wZz1zbJscq1E6Ka+htSGv/K7qkzD
         llFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5pnCT+L+XCXZVRzhjHTFwBDsZqVtfDpTg3ZhsoQOpQ8=;
        fh=0/4dWkDnZ3H+yWrVoT5OWI6Z0DnPe5JHB/daMBc+UEg=;
        b=Co9F83AfvQwv6MwdBG4CqV3poQgiHU0FqjYpxTUhby4YivR8ATZJCRm9+BQ4UZSRUM
         +LLFhdc7BGj6NbT4SFaEVmGGjSNy0pGncCrCdLA8uH0z8tJmlfLw8nEOBAw719B5zI16
         Mm7nkeo7TBAbJHzlxWOQE09+N66L1syaEEkcm+huaC0BlxIWp3yOxRJQsTcJv0eqLtif
         +RXTfSPOKUGN59nySlpNUQCDHRDStGzIQ3byofl8gaOiR8fNYHOQzJSv6tkokTD8hWsn
         8xl6TT4uqWzxydwaMx0YBsjMUcv+cY4UrR2fO1YQck25MxFtZF8Q0kv3BI6w0meHLQC0
         8p9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/PjIAtK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707e1fesi79488026d6.102.2025.03.09.17.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/PjIAtK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQgo-0002oT-6e; Sun, 09 Mar 2025 20:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfx-0002Fo-8H
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfu-0007RV-44
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso1695911f8f.3
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565236; x=1742170036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pnCT+L+XCXZVRzhjHTFwBDsZqVtfDpTg3ZhsoQOpQ8=;
 b=I/PjIAtKIXTUQLVuwyXA3WaaVPgWf4onGC8j+w9YXYSt1LEsv4k09DSgZue2YZTmf0
 cPyTT1/zjWvlLvqPMYV7dId+tM2e/XIbtN2FjKHkaNtMoOVKk4Jy07epll/q8Hf1qSTX
 KyGOz69YShGTtAUv/G5wEjaHL6FOrSTY6v9eGYcPxSrPNwejVK9W/Pewxa57zCl37H2J
 OmHHJHek0TSz1IUMKP/vzq0QnmmgMyBRlZFZGS7xR+d5h3/eOj+xHjgLGzhhpaY4LsRb
 NJA9Ci8Nk9N+7vQxC6CbT146JTbOmodMMC3nYIUKAR9cp2coy676MUmS6ccFvqo8LeXj
 IfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565236; x=1742170036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pnCT+L+XCXZVRzhjHTFwBDsZqVtfDpTg3ZhsoQOpQ8=;
 b=ePSxQAEtubZRzI3srxOXwN7DzKnbNL5q55Nn0hHLGbnaadPco2HfT95zfNUpSQzQ/q
 Aqk4TUmiXQaByi9KbvSycAKAvo+tA/qQqQaZF9oIeF87vVf2O8tDQS1sZx0NUxcsgLgi
 2eFQlUQ8R5CtVWY5lGo/pAPF+MVV5dB2kosNLm1JhOvrs7krWrae/HUnmTBiVILFYbAH
 KsmbTGpB7UlEcA4jGCv+XU0i7nPgSmkLPTj0wxh0KU7kE06Dm4KKtSZHKDSnBtV+uc8F
 Bn7AKTwxweuI/ud2s5I61MddbCpwwtQo1rJ4a6FW7+/5CiyY7AY4hMvV5stQGRSj7hob
 TnfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtC0jWO4UCAluEWT24gP/LEHEujlwDd3QexkTqc8BcFeGj52TsXXDByN+cBu9620U2so+l1zuk2g==@nongnu.org
X-Gm-Message-State: AOJu0Yzbfq6sHfoa3yx7IGhukfSuzRCwhqdbnL485Af/2nzQyewGtqFk
 tp0yW34xz/5dMY7kVSz4UkJQmklX5Av9qH4fYmahoGuceY10/dQKlXiE/f/QpHk=
X-Gm-Gg: ASbGncsNQMzxvp31DrUnoQp+ztyShwfN3KCbaKWTX+YU9d61gAMU8xqV56D1QP7RSnS
 mISlt9CSchE5yNSrFpbijJKm8XXuiOUWaVdkovskzVpmHc+N0+EEt5AgpeVkJoy7MLAgYLDGNyx
 5uZyp2UwNjdoetGtTl4D5oOhx7zn1D+e/XWgUwyrGAZfoF8k1EHchaZLomw73cHoJ5ByRXZZpWV
 oFFaSD0kMV5aJdg5ZH25Nqgubr8uyxSxdwJBy9QcHDFYst0vQSfAcNGrKDgYmOzV70oUUJKdLZO
 GvMUvOgODsk14bAxk1adtXM9Yu6ek7Fs67PNBYmtSjyV5PkXG4I3IHZ8dje8ujL71ZTG15LLRg2
 GFrxi7sVZwWEnImK0so7v7Ay9MmpyqA==
X-Received: by 2002:a05:6000:410a:b0:391:4559:8761 with SMTP id
 ffacd0b85a97d-39145598929mr1282305f8f.36.1741565236138; 
 Sun, 09 Mar 2025 17:07:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb7aefsm13011423f8f.20.2025.03.09.17.07.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:07:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 10/14] hw/sd/sdhci: Allow SDHCI classes to register their
 own read-only regs
Date: Mon, 10 Mar 2025 01:06:16 +0100
Message-ID: <20250310000620.70120-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 74OqvDnQ229i

Some registers are read-only.

Since we allow instances to clear/set extra bits of capareg,
log when read-only bits normally set by hardware are cleared
at board level.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  7 +++++++
 hw/sd/sdhci.c         | 10 +++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 108bc1993c6..eb21b64f932 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -120,6 +120,13 @@ struct SDHCIClass {
     const MemoryRegionOps *io_ops;
     uint32_t quirks;
     uint64_t iomem_size;
+
+    /* Read-only registers */
+    struct {
+        uint64_t capareg;
+        uint64_t maxcurr;
+        uint16_t version;
+    } ro;
 };
 
 /*
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 6868bf68285..eb6a0e0f939 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -73,6 +73,7 @@ static bool sdhci_check_capab_freq_range(SDHCIState *s, const char *desc,
 
 static void sdhci_check_capareg(SDHCIState *s, Error **errp)
 {
+    SDHCIClass *sc = s->sc;
     uint64_t msk = s->capareg;
     uint32_t val;
     bool y;
@@ -208,6 +209,11 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
         qemu_log_mask(LOG_UNIMP,
                       "SDHCI: unknown CAPAB mask: 0x%016" PRIx64 "\n", msk);
     }
+    msk = sc->ro.capareg & ~s->capareg;
+    if (msk) {
+        qemu_log_mask(LOG_UNIMP,
+                      "SDHCI: ignored CAPAB mask: 0x%016" PRIx64 "\n", msk);
+    }
 }
 
 static uint8_t sdhci_slotint(SDHCIState *s)
@@ -1407,7 +1413,9 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
         error_setg(errp, "Only Spec v2/v3 are supported");
         return;
     }
-    s->version = (SDHC_HCVER_VENDOR << 8) | (s->sd_spec_version - 1);
+    s->version = s->sc->ro.version
+                 ?: (SDHC_HCVER_VENDOR << 8) | (s->sd_spec_version - 1);
+    s->maxcurr = s->sc->ro.maxcurr;
 
     sdhci_check_capareg(s, errp);
     if (*errp) {
-- 
2.47.1

