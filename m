Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4710127lfb;
        Sun, 29 Nov 2020 19:09:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0ggjFGPwLXGY0N/lAUjfesz0y1thqVUc8s2U/doJqNUc4SdUvMKuXcnCAr9SATN9oJyzS
X-Received: by 2002:a25:be44:: with SMTP id d4mr24158488ybm.186.1606705741177;
        Sun, 29 Nov 2020 19:09:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606705741; cv=none;
        d=google.com; s=arc-20160816;
        b=Bls7d2FAoM4N+lLrkWkp5uIsk6gt/7hvg3AoO8KkG38r4Ksqm7GYEBWgFoCCBPjBgV
         4Eu69DR3tD0pOWNlyCzVkJVUAW+NW2A97F+08LCqh+Q6k65/8tYu4vo+cFAaaIodIVkB
         EIro5I3JSjOkZ9h7OiUW/3sUf3NobNFV7LWPiu19/ldKbVY370xg0jQlo3OhEJMwmo0J
         DfNhh2AdNJ0aQ39KdKAmQL1FlbGNlEiT2svZAbF9ODN6vHSJ/g1evig43Yiju6ShT7jy
         lsuCIDVyhHWhgCZsE593Gs5z7tkj9/FAKcBvA/8bmqQ0jS9vpt+kEGQTz0RgEW2+cPVp
         R4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=dmxHnJbhGBQZpiidUCYRdIyLNVPFN0gCA8qJqG0CTs8=;
        b=vAdjTAc3PJywWXpUaKmddKZHR95diiBdIQH0o9ESzkJ/h/Tg3Xw9F57j0An2V2Co03
         0RxpBhRVGGBbwq7xg9HWevP6nqxmH+0DtT2VvcmYooHj5+TDCTBZjK4OT4JfXalP8PlE
         jyMzyBpaC+IsuWCavPtE1A34w8iDlnCVY0N+HnGf5XgsfyjMDLFpouzC9nMexe1YOkT9
         lZnNqs/nE5AbQN5i38SnBxYIoXsHb0qFKXd7GtNqEhZrBiO5W51So9xk4SAAhg9csfVC
         +TqcQUt/PLc8/Oqg98XQVPPSB6tSw8UyO2hlpLxaG3E18hww/lQOI/I9JPX2vHuWOGTE
         hxVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si16598203ybg.83.2020.11.29.19.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 19:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjZYi-0000Z9-Gi
	for alex.bennee@linaro.org; Sun, 29 Nov 2020 22:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZXJ-00088b-19; Sun, 29 Nov 2020 22:07:33 -0500
Received: from mail.csgraf.de ([188.138.100.120]:35388
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZXG-00078B-9s; Sun, 29 Nov 2020 22:07:32 -0500
Received: from localhost.localdomain
 (dynamic-077-009-091-089.77.9.pool.telefonica.de [77.9.91.89])
 by csgraf.de (Postfix) with ESMTPSA id 0C60539004D3;
 Mon, 30 Nov 2020 04:07:27 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] arm: Set PSCI to 0.2 for HVF
Date: Mon, 30 Nov 2020 04:07:20 +0100
Message-Id: <20201130030723.78326-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201130030723.78326-1-agraf@csgraf.de>
References: <20201130030723.78326-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s7KRRoi83ClD

In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
that fact in code too.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a..db6f7c34ed 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1062,6 +1062,10 @@ static void arm_cpu_initfn(Object *obj)
     if (tcg_enabled()) {
         cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
     }
+
+    if (hvf_enabled()) {
+        cpu->psci_version = 2; /* HVF uses TCG's PSCI */
+    }
 }
 
 static Property arm_cpu_gt_cntfrq_property =
-- 
2.24.3 (Apple Git-128)

