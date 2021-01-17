Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1967347lfq;
        Sun, 17 Jan 2021 11:27:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuAw3OqqmZzv2r7KvvKUuOvXHeiknC2SiJiog0uVdNaqHSl4Pjd1WkyvtJ6u+I45i2D7gu
X-Received: by 2002:a25:2041:: with SMTP id g62mr33414138ybg.152.1610911668614;
        Sun, 17 Jan 2021 11:27:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610911668; cv=none;
        d=google.com; s=arc-20160816;
        b=LrSqOR2wZKInak0sWlQyeOw0VD2u5pL6Zq+J8my9QwaUulH3Jd8NT1bAezuP8Huu1z
         /qtQe8zLn8w2H0FE+bTM79KPd9PPCiNQDqD+Xe1CiuVaLtjcfSlnyP9JH2NKMlGWfru0
         kVVUwrIQIfIrIeqEiAg82707RwWnSvBE8NamprUkVHfEtQfyoXzkwI51rJyJbNNXJ5Gr
         7uyu2inxhAMLF2hDT1xIUlPF/5LhTcSzw2hqEfzjV6OjZO9wgCG9RQNM6MyyaYTFgszT
         /XtWK7k+S9k3lvEiGYD6qys2oNNCjIveffdROdI4L2mxZj7By2sfrGF5gONsOBabiQwT
         jczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wX5YisuWL/1kxfpeKOV4oTMHdWldWIq42qYJ2gfj7dc=;
        b=wn/MUDAlNX25H4RYIBFKOvyXh5Dr9BB48XrZCueoDWutvskWYCW03IBbKrMj5VdXew
         KGsnVRV2ExZTOESTxqhTDZYgIj2oID2hSdY4DuYJGjAIR0gGjlWZUNbkbgXu2bZi0Imi
         AsLcKDypnZH5LeFMwwpukZ5kl5I9etv0ZwQC1e2Eudi1Td0IsHddR81CMppFXGL9kPWR
         ZG3GvV6MN2byjGHPv/YyeVcs6+fs3kvj4XhkqjuudeCnDXKxyMS8wW6xL01bBWy3l8ZY
         /wsO0RmppzCs+wjhwKBCp6dgCYVnL17tk9jlUhtMOsEZRhXaY2Eo5qN49RbtmVvdtse/
         oHgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o70zgkLC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si10262074ybx.432.2021.01.17.11.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:27:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o70zgkLC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1DiG-0000Rm-0c
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dg3-0007qh-Fk; Sun, 17 Jan 2021 14:25:34 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dg2-0005D6-3m; Sun, 17 Jan 2021 14:25:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id g10so12049085wmh.2;
 Sun, 17 Jan 2021 11:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wX5YisuWL/1kxfpeKOV4oTMHdWldWIq42qYJ2gfj7dc=;
 b=o70zgkLCjTk2UunB4bDarF1cLu3Jbi3yIP7VJDK7c11SrDRhmIV1yLNUdenmCjok8u
 4ADSSGJ6qzqcc5l7sZO87WbUkT1bQekPohWaF331aijg6hXgpjmGh9WGnH6VEgLMQOkO
 mWyu/4neq/W1ekNPxcPHi3H1kTToXfUH9cwmTF23l0OoV5i9Kix8CDi9hXz9MaZxtpeV
 g2Z82AJbxVOrPQUSWdq2cRU6FTqfCJYXIv0kiazkBEZhqiNsOanbpt0RxMRUpDL7zns9
 9oDaTS1eQ5PuTUwHQ4gJLaIVJFurBATIV05O0YiAc1FnEPPcNkONEk2KQC7IDaNn26Mn
 KYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wX5YisuWL/1kxfpeKOV4oTMHdWldWIq42qYJ2gfj7dc=;
 b=Fpk9SIzCyYHNVllfYWtW4JJBig+ZKIdr0G3upcivLqSwera/Qv8eL1P9koP7pJy5Ug
 6NzjHDvE+7nubVxKk2HS3yWiqEb1dqeV/sq6BSaIsKpX4M2e4AW5u0Kr0ZyB8iJR/tPJ
 o8mGZXHXpjJ2oZ4/b/1MC+wQh2v1rCCCgFwJ8i1fWnpUNZVhTVweQjrqLbzXjTXPAu3z
 7U6VO0FtJN0HTsZxcBmTEidqKK14NFxDYH5/x/s9HbIoO5+3YEAnIuEI96ko2pqPLhNP
 YEnG2zezXQxx5nRsXl94bgUCQgSsFzBe2Ym6LiFHqpWr7+r67DdHRlTq9dBeMuwXqMgd
 dywg==
X-Gm-Message-State: AOAM530iPcl5ceZsfzR8+Hq0WpkQG3hP67ghPZFlbcx9jmHTJGrMpWGA
 0GoPlcetrSBglHMNP/Feu9Q=
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr17103434wmk.70.1610911528446; 
 Sun, 17 Jan 2021 11:25:28 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y13sm25915641wrl.63.2021.01.17.11.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 07/20] hw/core/split-irq: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:33 +0100
Message-Id: <20210117192446.23753-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
X-TUID: bZsQH5+RaKml

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/split-irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/split-irq.c b/hw/core/split-irq.c
index 3b90af2e8f9..a7072f922cd 100644
--- a/hw/core/split-irq.c
+++ b/hw/core/split-irq.c
@@ -71,6 +71,7 @@ static void split_irq_class_init(ObjectClass *klass, void *data)
     /* No state to reset or migrate */
     device_class_set_props(dc, split_irq_properties);
     dc->realize = split_irq_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 
     /* Reason: Needs to be wired up to work */
     dc->user_creatable = false;
-- 
2.26.2

