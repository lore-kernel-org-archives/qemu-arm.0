Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1975860lfq;
        Sun, 17 Jan 2021 11:47:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNZED96KhkwE8D/qPlm/79+Wzv/EDaFQYPbfKsDQE8yHSUsQwrjrpv/BSdU9ziQveuyGeF
X-Received: by 2002:a5b:34e:: with SMTP id q14mr31947129ybp.291.1610912845365;
        Sun, 17 Jan 2021 11:47:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610912845; cv=none;
        d=google.com; s=arc-20160816;
        b=oKig99/GIi0sx1RKCA6/0+2Ulmxe/RnE+3BQna/59OoudsqC/FETOfmeymeznGjA1Q
         ty9nJvMCiWarhUHkbUQp94WZZHMcy3wiOiIuspjVlLC32sPUwgk3uQCNcmTXyIW3xSXU
         FP8s4HgTYHJn3qBVvYdIACUbn7FIRgo4QF0GLwwIq0IJTey29svTNz+9+mRXJwGza/km
         /sVtmIiGmxwDt3V+gnJS4pYjj98HiNgT1lTLKHliR8wPi6bTEDSs8B58RZsx9Dr4B354
         wmnWb4EIP0iDVVhuUN23cTHULICNU7SSbBM07L+T6Bnvgky6dIbXqRL2Q527/pRzkQ7R
         yX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cQ7WuH65hManE2WTAsW8tOQLREFQZ7ZlBTq/RCNJDW0=;
        b=T9SlcpJmkwcZN+tXL6Zdyu6TBKzRwW/E7C+3lWo45ogdE+S46B9QixbG7tr8NQ/qeR
         wkqRzIS1hu03AqwP4vn6K8IU+7GAglm/Db2xU2IQWyQe4xZnhtvK+MtiZdwQbamIMoG3
         iYNZgeBDJvoD2WmmBqKmInaFSM7/iifGmrhOnfpdDL9knX8aH+X8hA8AF2brKTG2PpkW
         MDkAHgxMnCObTfo2xp0AQ0Ft2EYXJZxDoQ6LJrlM++sf1xNXvphmMr71mp01RcRDUJGc
         fSN05KodZWl+Noseg7Of8diD2wXD5FaoQYLaA8vkmsdN99u65V7py+QSvFFL8k/ihQy7
         X4xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JVwXzyhx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f202si13582496yba.393.2021.01.17.11.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:47:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JVwXzyhx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1E1E-0003y8-PC
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dh6-0000Gr-OT; Sun, 17 Jan 2021 14:26:37 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dh5-0005bA-AT; Sun, 17 Jan 2021 14:26:36 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 91so14459156wrj.7;
 Sun, 17 Jan 2021 11:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQ7WuH65hManE2WTAsW8tOQLREFQZ7ZlBTq/RCNJDW0=;
 b=JVwXzyhxfwZ0PfTAO21ov55DvH4NurMxFuxYYskpxXRWpJ5OgzEF+m6pBPZL+aJssr
 rDHVXdKh0nM+GSV1JvyKTpCWg9JUEFk8k28CQ5O4bHDM2uH0S9CHS/odVO9PKWtWTVFA
 /mK61ANrkf9p/Aox3nkyVxxu+2rpdpW4DNZIUDeHJgbYFKwM3Gl373e9YWZgg4TD6X8C
 IN1BMR8bvV3CochTmOSOSiDmQm4zjCMYWv+ArKTDNPxUBUW1g8hlcL78zKAZAWCkzQqL
 zWzkFgXamnC8XE1TjDmvlfyYoqLPjDq8jVwymbn7lT+XZNmGkIzBK1RJPYzwj14UqUfj
 ykNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cQ7WuH65hManE2WTAsW8tOQLREFQZ7ZlBTq/RCNJDW0=;
 b=om5QYKqOt14KHXrevv7BGUCU+XwZfYjNWi9DxftWKojRa1qmluHnNcmh0oVWEQ5VmA
 T7xwosWEjKIQkVAIjpIuhwNMupZjhepifJoZd/IeAcGk2EpHGJQpbULQjvo51Pqq65go
 eodGpYUJ3E/Vkjy7uogHNK0806dOUrQxhpOFuLzULzbk8bzbkgbQOuojQWe7U+BO+SxK
 CM8siQYkrLW1pWOtahYlOafhHCMbWZHWRkpWOyH0KDyROGQK6q/QNZ/my2ZqWN1UMt/g
 dR2PryudHBowUeEdLjokZtkVcntv/AfI5gP00haPD1wPSxxMRsuUWtaVA62N5Lx7AdHF
 wXwQ==
X-Gm-Message-State: AOAM531nlv4UK44IvZVShG5RBg1+2LFHVZvYseSBrEgHiYFmqJGYQn13
 TUF0GHlqJ2Cvr1Mi81LWyBc=
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr22876173wrh.209.1610911593569; 
 Sun, 17 Jan 2021 11:26:33 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v11sm24403198wrt.25.2021.01.17.11.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 19/20] stubs/vmstate: Add VMSTATE_END_OF_LIST to
 vmstate_user_mode_cpu_dummy
Date: Sun, 17 Jan 2021 20:24:45 +0100
Message-Id: <20210117192446.23753-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P9UOU1IdO/lQ

Add a name and end marker to the vmstate_user_mode_cpu_dummy variable.

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 stubs/vmstate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index f561f9f39bd..1d0e03e233b 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -2,7 +2,12 @@
 #include "migration/vmstate.h"
 
 #if defined(CONFIG_USER_ONLY)
-const VMStateDescription vmstate_user_mode_cpu_dummy = {};
+const VMStateDescription vmstate_user_mode_cpu_dummy = {
+    .name = "cpu_common_user",
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    },
+};
 #endif
 
 const VMStateDescription vmstate_no_state_to_migrate = {
-- 
2.26.2

