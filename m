Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1966468lfq;
        Sun, 17 Jan 2021 11:25:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4h/jQgs1iMJuTydwhXQhiK4zKLVouFyKbyGgMaQP3J6xMfVb6AG27q/CWpKruEenaw/Ci
X-Received: by 2002:a25:37cb:: with SMTP id e194mr25913803yba.476.1610911556395;
        Sun, 17 Jan 2021 11:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610911556; cv=none;
        d=google.com; s=arc-20160816;
        b=XrM8zQQfxgFcgCEI5K2ev5DYcSsSXNpCNFzWCri4cQZJCy6YhP1Px1rCYi+gb0cOu1
         Tn/BErIvGBhZTygsoj4BFC1yCGRSD+QCoUX0xhz+3oX+iewkrYJ+x62iQR1HOaBrM0n7
         0v12iaw22XsuLASVtRW3rPCHgmF5EDGDm0ND9d+d3s7XbtZmW+0a9RLHSbmXun0MHgSm
         tyfUrDTpSxk4nD1a8yWJ9Oa8/pUMkyoj/n+apPQ/VWDXaoFjE5d2ZCsuGj0T8j1higdA
         dS9Gj4f69xAjbgiwdT/j0A+T6tIpHdOc46Cs5R/icVRxGOAyRUsTteOyOaIVBUJ2R2Fs
         /IHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Vafwmt7UGiwAARCHIG5psXHv2hnCIeQD5qlHTz8atP8=;
        b=mMXtLQQaGOSdJTLy8LFQPdr8S4kBLvE4ojNXueLYSRuOVCDI46h/tk2fPO1eElLPfw
         PGOCr0WJ0TUqs8hW+J3rFczi+D8DxT3nquC1Ff+CwKOnwPv6+rCcTS17k27iWNh4Vi/m
         cbVWpORf15DUMt+CUqz2M8R5sXFdIOs9Ivk17CZm5b2YzzwHAmwcZOgu0Y2iW5p8o0Vi
         jfhD+C0Y5p9UFSRIgSoOwtyvObuO84iKESVLXF6TXqF33hgR6zO3tQdP2msf+z7MSR2m
         f3b3OvTNhMNguC2rus8qMoPRpFBMo52gsXwzG229z9u6JC8JPT2ruHj0QbECCoIEXITR
         GQ+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YIvRs5DE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n197si15213192ybg.488.2021.01.17.11.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:25:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YIvRs5DE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1DgR-0007dU-Ob
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfb-0007cY-2L; Sun, 17 Jan 2021 14:25:03 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DfV-0004yI-Eh; Sun, 17 Jan 2021 14:25:00 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u14so7849985wmq.4;
 Sun, 17 Jan 2021 11:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vafwmt7UGiwAARCHIG5psXHv2hnCIeQD5qlHTz8atP8=;
 b=YIvRs5DEaJw/jyD9Lu9/F/RTIrW7XhEmbkbHFnNcCIGrl9cOlqxwEtSJW/8TwNIZ+l
 CoDzJMMuG0IrdayVH48zlOpVgL6LJmuhaaa3bXbPTZALbuE2KoZmPyy4o/60m8FRSdKc
 XO2GmJj/whS33/I3SxDL+TfPZSKym4rtP3R+/rTe9sh9lc6oRqWxaPLH4iCAIkPJxkXd
 3PmT1aAer7RkKcEo8oHTy1CW11qLe6I3L/tW8W4tIrbliYm2AQMfAtrqCB3evdClCsNV
 EneNw0l+iPT/wH/qiuV/Bua9Fy9n9YNu1N7vAhzNTVFbmYlUQGE1tMu3cnTEluO/JRPX
 Wukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vafwmt7UGiwAARCHIG5psXHv2hnCIeQD5qlHTz8atP8=;
 b=a3U3+e11lMtrSisMFx+8s5vhPRPCQqekzRrDmV7VjkqZr0klBBX4HF8vSJooFCDwNN
 +fiK4N6v7c9fVl7TFmPalj2Ks8ugMp6okfUIUqQETykumiiKL2NsU44/BTN40bRcHTr7
 YmStnsrTCjMmqpo+7xoKu19b1SarNWwjMapzwiU2xFqfsWCdFoV+aE490R8GEKOGPQGd
 xEzi6TRFxdTJ1R2zPNOE4ksOYxqtpch4P+THofT5h1styVfA9QY78CPrbKqFJLe2t16R
 5p1396WVWZ26Y3aXANg9qvTY5krCPxM8OihH9NkvWyFSWXIbGJES74I0f8jpr7RAvemq
 D32w==
X-Gm-Message-State: AOAM533NcxynBtRGMdASaVyTQ3Mnr/rsqgdfJ7pUSDlFShDznIvxDXp3
 jFkbp8h2xr0O/9VbqA1SsNw=
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr5519916wma.166.1610911495872; 
 Sun, 17 Jan 2021 11:24:55 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g10sm15146735wmq.3.2021.01.17.11.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:24:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 01/20] migration/vmstate: Restrict vmstate_dummy to
 user-mode
Date: Sun, 17 Jan 2021 20:24:27 +0100
Message-Id: <20210117192446.23753-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlDAxJvS/+Vb

'vmstate_dummy' is special and only used for user-mode. Rename
it to something more specific.
It was introduced restricted to user-mode in commit c71c3e99b8
("Add a vmstate_dummy struct for CONFIG_USER_ONLY") but this
restriction was later removed in commit 6afc14e92ac ("migration:
Fix warning caused by missing declaration of vmstate_dummy").
Avoid the missing declaration warning by adding a stub for the
symbol, and restore the #ifdef'ry.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h       | 2 +-
 include/migration/vmstate.h | 4 +++-
 stubs/vmstate.c             | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 140fa32a5e3..c79a58db9b9 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1132,7 +1132,7 @@ bool target_words_bigendian(void);
 #ifdef CONFIG_SOFTMMU
 extern const VMStateDescription vmstate_cpu_common;
 #else
-#define vmstate_cpu_common vmstate_dummy
+#define vmstate_cpu_common vmstate_user_mode_cpu_dummy
 #endif
 
 #define VMSTATE_CPU() {                                                     \
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 075ee800960..dda65c9987d 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -194,7 +194,9 @@ struct VMStateDescription {
     const VMStateDescription **subsections;
 };
 
-extern const VMStateDescription vmstate_dummy;
+#if defined(CONFIG_USER_ONLY)
+extern const VMStateDescription vmstate_user_mode_cpu_dummy;
+#endif
 
 extern const VMStateInfo vmstate_info_bool;
 
diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index cc4fe41dfc2..8da777a1fb4 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -1,7 +1,9 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 
-const VMStateDescription vmstate_dummy = {};
+#if defined(CONFIG_USER_ONLY)
+const VMStateDescription vmstate_user_mode_cpu_dummy = {};
+#endif
 
 int vmstate_register_with_alias_id(VMStateIf *obj,
                                    uint32_t instance_id,
-- 
2.26.2

