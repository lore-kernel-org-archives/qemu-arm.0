Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2783704lfm;
        Fri, 3 Jul 2020 13:26:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYoXJs/cna4Y60w+meFLv+hyFIQMNfPLJr3af2aBK/8VurHeWnjPVu4zrIemODg0tZaBFS
X-Received: by 2002:a25:8403:: with SMTP id u3mr61022049ybk.276.1593807989133;
        Fri, 03 Jul 2020 13:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593807989; cv=none;
        d=google.com; s=arc-20160816;
        b=l2u7OqAurbnX+6d+h4hasdChqlJtc/Sr+NzHR4rTjoDKRD5u7c2NfjFTsJYDzoRQnZ
         emPhM4DNJaHRwSSszlTiAGRbZME5TDmv6RFhQ6papJaxH8zxde03ylIqID+avmxxFweN
         34f3dp1wp3sOAMdAMsriL4tjv+S/WWXjkiu6di/Qvsps5RlhHHoXlOytgrmqwBOxWYrB
         ifI0ZOtORn27SDOw0tEW6iFcI6TrKsRNShiGKLzFqtbaIWN5r/zSA4687cE7+J5UstAj
         HWL5cz4hfigsHJZOjFWe8bT/igOorvZdUljJQqQ0vZlrDNGZSBhmITvuUVvpX0Q7PsnO
         aoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=D4fCa4+LiZFjw8a5zdhadVu1qSxsBNhcSEgYB5tz6qA=;
        b=i4Qiqu5RNWu9nbeblJYL6PlJJ/qFCXfeSd6DlJVJC/jTI/gWk2y4Ya0NJDwf1P//qa
         JesRDPQOp2FvPNJkt7cUG5il3opYJywMLEPpahLuA1cout44BVqVT8BO9bv23DG6MmZh
         g1M/uRTm0Av0qYrnqOjhSBq4tAFitC3szIT62ZKzyVXs/PhNGTtRZhY16tok2L0BF5pT
         R+nkOIfdjRdgJJUceUbFaQYna4F8FPHZxgjGm0bQIsUvzL3oCUOVMNKQmHzDt5BCMH/Y
         cyvp5q72Ilro5zcJA8zIg5mnWRTLmQrgzV1lH9YZrbnzo0VlPWLLB1b3ADjhYPzA+Q44
         q5Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kpRyO2+U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p72si11783468ybg.7.2020.07.03.13.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kpRyO2+U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSGS-00055B-Ho
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9m-0008QJ-DA; Fri, 03 Jul 2020 16:19:34 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9k-0001WS-T0; Fri, 03 Jul 2020 16:19:34 -0400
Received: by mail-wr1-x444.google.com with SMTP id o11so33963986wrv.9;
 Fri, 03 Jul 2020 13:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4fCa4+LiZFjw8a5zdhadVu1qSxsBNhcSEgYB5tz6qA=;
 b=kpRyO2+U5mVhIxZUB9JEUUtibh23OZZ+OnsrW4Q+aCwNOa4RFHiQpQ+FE3lWGVgHYY
 PO4CFqoBD4frTCUIyyQoWIsEJH61xssmYFwKwuG49VKLXayjcL4i3VzS119vXLs5W7B0
 5zZI8ldlq4eRH35bec69T2VTKQJiL4+sJDyavNyfuR9/7S0YEccvhwjEPczdImnwmGzI
 cZPftuUnRquORnzpf00yRbIa5xfNaddR8RP9uWDdjDHlIanQAe5JxUZgAaS8edObV8n4
 ql8hSE9JBAZryUwjpepDADzDe6+ml5xwPfYXGPNMWu2Ub1mQBbKdbWpwPZYO8HpQAG9r
 8U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D4fCa4+LiZFjw8a5zdhadVu1qSxsBNhcSEgYB5tz6qA=;
 b=iYIBizfaHJDuKdzATUgK1i39gkUOQDSb45oOWIyPcQQtFL7QUnTWxAE2kkN/cOBtHu
 F6W3j8r/SmgWejnLDeez6+Guim9n3/Jtu/FgY24kz/lfQMnZvjhnJxHP/cdtK+WiYo72
 7KBy8iu3CDQJYjZTuQtYkrP8vNUayiitLKiEuqRkpZ9aJRS7+efJhsfHI0DJzUoqb4dw
 FTvOdFT2aTgb8nRPPWE3U3dr522apxm5Vd6oBpfCmpeIi3q2o3AddarBTzR3HgbR9Qi7
 b5Be2ee0OGROZKl+SinKgozHijP7k0QidqCl8Bo0Nu9BEHCHixfDWwDT82NIxN9rbrfx
 fofA==
X-Gm-Message-State: AOAM533cyso7QZAG5sSO0f4E7Vq/vdIrQ2hb0GBftEg0yW8DeVo9sqDq
 5XWS86tUn0Hb10LiXS3SBvaGIAyvoJc=
X-Received: by 2002:adf:92c4:: with SMTP id 62mr37230171wrn.290.1593807570943; 
 Fri, 03 Jul 2020 13:19:30 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u65sm14229625wmg.5.2020.07.03.13.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:19:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 12/18] hw/intc/arm_gicv2m: Mark the device with no migratable
 fields
Date: Fri,  3 Jul 2020 22:19:05 +0200
Message-Id: <20200703201911.26573-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703201911.26573-1-f4bug@amsat.org>
References: <20200703201911.26573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3HpShkaA4D2A

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv2m.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
index 0b7e2b4f84..c8b066066b 100644
--- a/hw/intc/arm_gicv2m.c
+++ b/hw/intc/arm_gicv2m.c
@@ -54,6 +54,7 @@ typedef struct ARMGICv2mState {
     MemoryRegion iomem;
     qemu_irq spi[GICV2M_NUM_SPI_MAX];
 
+    /* Properties */
     uint32_t base_spi;
     uint32_t num_spi;
 } ARMGICv2mState;
@@ -181,6 +182,7 @@ static void gicv2m_class_init(ObjectClass *klass, void *data)
 
     device_class_set_props(dc, gicv2m_properties);
     dc->realize = gicv2m_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 }
 
 static const TypeInfo gicv2m_info = {
-- 
2.21.3

