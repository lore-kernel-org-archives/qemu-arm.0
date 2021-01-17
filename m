Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1973492lfq;
        Sun, 17 Jan 2021 11:42:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/v+AWVbcc0BNUzUHpAYAFHjAQ+m5w9swBwTSw3T9rg2NGDY+8sk8KJG4jdr5EB2D/3oKw
X-Received: by 2002:a25:be44:: with SMTP id d4mr33117561ybm.219.1610912521905;
        Sun, 17 Jan 2021 11:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610912521; cv=none;
        d=google.com; s=arc-20160816;
        b=ioi4YQnzuxuXII2o2nhR4EikTNHYWdzlWGeZEWp8g45UVSPEmz9IK3SqmatV9J+SFa
         MMT9SVxXc5hvz6eQL+I10VWz4AfFo0n6B4P6+Tdu/yeTWg9wMdyGhIWWiEqBRawZHnTr
         VEC+0rn/n5WjqvsVKCmcjN+DbKDIN4mX3fNipfasgLtPthWD9T7hchQhjm8vOgyVxavY
         gAFJkTesvwIaGhuWrkVDnJAl/yMS5+ww6QKDk7UXdr8fZERHNkDROPF3r3Y2lsp4d2K8
         mKLMrRX+yqhb5UqTEHj2i6bPwBCM5VPUmZFqIc485WywzISnMq53qClEp9GccPXkZ6cp
         gDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+o+ioZvx1jeZgR8bC7wg2B3Sh0sACSJW4nTdU8f7aTU=;
        b=0PMyWxr1+asNpZcN3hXJQC+n7IqAuf47Kf/frNKIjgWdM+sTrYxWFZV0wtxIH9FQu4
         r50Zw+FQK5T8aq30ZiVczdX1fQj4BJTzos6TiPcabQ1arDi4G3SjOgbc8zfMK1wNs1GE
         H34tIbICbM3X/sOjmu0fM3PnDgikd9hcsTL2DXUTFGGtlVFa4N7dihSVxBh9efC5SdLy
         GwWAiJVj5KeZPM0olVgltYlY0uO3xkXSZoMkF5LNGIWMIXhONBFBYtDb0/qdb6IcDvg/
         0QmegpF/ilyEL0FOBdEfVGi7d35GqpT13U4y5+0fcke7xyOWftjkaubU5WCMNh7vW+i9
         9v8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RILotdEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n84si16573266ybc.305.2021.01.17.11.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:42:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RILotdEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1Dw1-0008In-9x
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgh-0008Ji-Qv; Sun, 17 Jan 2021 14:26:12 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dge-0005NG-Fc; Sun, 17 Jan 2021 14:26:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id e15so5646429wme.0;
 Sun, 17 Jan 2021 11:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+o+ioZvx1jeZgR8bC7wg2B3Sh0sACSJW4nTdU8f7aTU=;
 b=RILotdEvzW7p4sBqW4M3EnDurWmb3N1pLM5Sn80jZz3dhPqGzfe1LGXAZuKZFhPNfL
 7Lx7XpFlVVSrcJsJXSE27NstSKS9FbF5TaaXEm6257Aes2wSs4ogex1kzLzabXoQYSIF
 hfcH2YVJ8DYFrNipRSor0w3i9gryP7mn5BQn1VHaXAUgUGYOtQapyTSkZAvZrkjM678L
 qguqYfFKE/GYaTw1mVfUQZOP8YDUeZCdbJ7H4CMKC/E16A66D64xL85cRrhR/kTt2TM8
 V+zkE0A0GlZ5Ix/60gPfowSN+Wx9X3Drp1WCJDNWNG6RR9Y7pJY0Hka6u6o6g0cyQ7yP
 LLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+o+ioZvx1jeZgR8bC7wg2B3Sh0sACSJW4nTdU8f7aTU=;
 b=gjqkyig8L5D0Dr1nWSeV5VtGCv7/T0WCssdiZZv7XDD4HNa7SSLjxjFD0zqE5WNvjI
 TFblGpMYsFtJuOfKqB3J/FbjBCVFNSJ3kZc8ubuTOuUbTKF304uzDmLN0tZCst1VTYpb
 SZcTeZTmpc9gemQHHXEPR6Be6O64u3HP8gpKOEqYXCU7M+AyuC2v5jchDWFGrNq0qUcK
 5j9jd4ABbc9/iyzVFgMLY7adV3DtYG/x2XcXWF0C/ejELZCvww6VQKiKFowZGQZPyjIk
 lt4hm6oBHlY1Kspkf4oKSBAjQcvTKMWzo7ap7KSD80GNyffl/qgqZ6Ss/sQhEuzgLpBY
 tQIA==
X-Gm-Message-State: AOAM533KdeSWs/Pcm5hEVnzW6fWtIFkQziLT7yEwZtGqax6I25TYDen0
 b8zYrkyhxT36PVz+VoG095I=
X-Received: by 2002:a1c:6744:: with SMTP id b65mr6011059wmc.60.1610911566671; 
 Sun, 17 Jan 2021 11:26:06 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m18sm25364721wrw.43.2021.01.17.11.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 14/20] hw/misc/unimp: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:40 +0100
Message-Id: <20210117192446.23753-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
X-TUID: LR00Hfg20mKq

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/unimp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
index 6cfc5727f0b..e5ede95c124 100644
--- a/hw/misc/unimp.c
+++ b/hw/misc/unimp.c
@@ -81,6 +81,7 @@ static void unimp_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = unimp_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, unimp_properties);
 }
 
-- 
2.26.2

