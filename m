Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp656465lff;
        Fri, 6 Aug 2021 14:16:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzufALD/PEi0ZuBYkM/PCorHPDvygSC3w4EFBqQpcNEYDFNCW3qLHxYVkUSWg1PDa3gFwUU
X-Received: by 2002:a5d:8596:: with SMTP id f22mr25300ioj.147.1628284576555;
        Fri, 06 Aug 2021 14:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628284576; cv=none;
        d=google.com; s=arc-20160816;
        b=T8HhgEypPK6aY1AS+QS9bVj4+Fb0jhuHb1kG+Hn+J76bIJnT5+qvkQGdAAjT5AEw4v
         yTXyxAF3sI+L2uNU3yBcZEfDZOiN2eG6C7RoWd7damGJJ134BH7m7wUPlbSzLFjLIhry
         RyaXYINa0fY4LCLXa3+AqQn7ek/4bkuInLuXDsmeKbbl2aBI4qSToSWUfIZkS90Xd5TJ
         mPaURA0Fdjku/W1eVpHoh0wyONKfb9J6Cyv+dy4VMyibhBrHYwHYn0qRZcGWfIONG0rE
         d76zAZ5GxxTVRu0MB9DJb8ylewa2prO5pUnvg8x8E6TV1zeVebo8q6kIWjRxGT4UWk16
         6pxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g4IVbQRin8nlExux9nzLQXs10lZD8Z6nZvHg0J/1trY=;
        b=QqiRQfc8Igq23/HLRb+vDN648E3zNDaTeuRQdJbn7dYXNyoWQMTBqoGKpVQmTauMhD
         s09HKoxsyqrqZp6vY4jjqWLKP2VK6bmdjerhUDFcqvQo8r2Vw97VGLROyOKx/pP1CoH2
         vYKwxc1XhhOZGQF1Z/cFZtTwAS9Hoofulq59mPrVOyyFFNpb1UGjAUyOifNsOmHtLMzO
         HyAZEW44ybQptdpxMvBXawzHfg5lCTSKwqjgyEAY9dF4yDt0wdGhnaOj9t35fKQqK7Pd
         otJlBbEFXl+h/FKUGaE9em4czlJeqHTf3oh4ELZherzmv5SLFYFEeTlxYZSgJrv//g2w
         Dlzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HXiXD7JI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si10099792jap.71.2021.08.06.14.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 14:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HXiXD7JI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mC7CR-0007zy-Gg
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 17:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79M-0002Sy-Qs
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79L-0004lW-5E
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4IVbQRin8nlExux9nzLQXs10lZD8Z6nZvHg0J/1trY=;
 b=HXiXD7JIcm4/FTXXXQg7SEh106+3bhWkGQNOw9/Lnu2RP3WlSYMmwqpAmsq7P3KaG7AHcF
 dKn5bt33aydpKjNBWIpeR0OiFB4REo3lfRQZ0AVQfW8UIqjEguyd+O384A+/MHuuLzdT5i
 pKQPrFhDqfO0TiXiui3OhgsJ8ze8Bz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-MTjtXVsxPWmHEHLr0BBBQA-1; Fri, 06 Aug 2021 17:13:01 -0400
X-MC-Unique: MTjtXVsxPWmHEHLr0BBBQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 804521008061;
 Fri,  6 Aug 2021 21:13:00 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 492DD100164C;
 Fri,  6 Aug 2021 21:13:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/12] npcm7xx_clk: Use DECLARE_INSTANCE_CHECKER
Date: Fri,  6 Aug 2021 17:11:23 -0400
Message-Id: <20210806211127.646908-9-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LCHhuvtfOVTr

Use DECLARE_INSTANCE_CHECKER instead of defining the
NPCM7XX_CLOCK_PLL, NPCM7XX_CLOCK_SEL, and NPCM7XX_CLOCK_DIVIDER
macros manually.

These changes had to be done manually because the codeconverter
script isn't smart enough to figure out that the typedefs exist
in a separate header.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/misc/npcm7xx_clk.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index da6b14c545d..5247acfeb5a 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -110,14 +110,14 @@ static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] = {
 /* Clock converter functions */
 
 #define TYPE_NPCM7XX_CLOCK_PLL "npcm7xx-clock-pll"
-#define NPCM7XX_CLOCK_PLL(obj) OBJECT_CHECK(NPCM7xxClockPLLState, \
-        (obj), TYPE_NPCM7XX_CLOCK_PLL)
+DECLARE_INSTANCE_CHECKER(NPCM7xxClockPLLState, NPCM7XX_CLOCK_PLL,
+                         TYPE_NPCM7XX_CLOCK_PLL)
 #define TYPE_NPCM7XX_CLOCK_SEL "npcm7xx-clock-sel"
-#define NPCM7XX_CLOCK_SEL(obj) OBJECT_CHECK(NPCM7xxClockSELState, \
-        (obj), TYPE_NPCM7XX_CLOCK_SEL)
+DECLARE_INSTANCE_CHECKER(NPCM7xxClockSELState, NPCM7XX_CLOCK_SEL,
+                         TYPE_NPCM7XX_CLOCK_SEL)
 #define TYPE_NPCM7XX_CLOCK_DIVIDER "npcm7xx-clock-divider"
-#define NPCM7XX_CLOCK_DIVIDER(obj) OBJECT_CHECK(NPCM7xxClockDividerState, \
-        (obj), TYPE_NPCM7XX_CLOCK_DIVIDER)
+DECLARE_INSTANCE_CHECKER(NPCM7xxClockDividerState, NPCM7XX_CLOCK_DIVIDER,
+                         TYPE_NPCM7XX_CLOCK_DIVIDER)
 
 static void npcm7xx_clk_update_pll(void *opaque)
 {
-- 
2.31.1

