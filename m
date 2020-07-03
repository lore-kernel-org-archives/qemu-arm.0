Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2780108lfm;
        Fri, 3 Jul 2020 13:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDXsL1WNTRNsKJSGChkMqaUVR54JszCTjIcUxKufP02Ou/lMXNwPWvVFhUDDHKndfnprRT
X-Received: by 2002:a25:d104:: with SMTP id i4mr9652726ybg.80.1593807685887;
        Fri, 03 Jul 2020 13:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593807685; cv=none;
        d=google.com; s=arc-20160816;
        b=y0eobJTcwQzMy50iTARJ0sd7NCNVerWf4RmihW3BZmXVrOBv2/736DFABz37JGv+3G
         8lL6kTJtGNKkcQpQ2yp62Y7DKIaWZ1FWbM+1aJaSA/8l8gp5R8cx+nppNkrZPHxercj1
         oYzw79yCxvHdB0NETWqOaO00z6WLX29qZpdEx4eVrkBW77+BKl8h2cjlpH0ArqztEA5e
         HtuI+cs5EdpBAia1Up5e0WHHZljhW/PA/EJP+2yqbm+4VlkyHj0UegzAQAFvDwjqKUpf
         kIvbR+QGe7fgSRzHss4QVYKSyKb0zD5bJTha6fCkZsCMYTmoekvI9wHKwwEejZoo/LF3
         Vh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=my+2I7oEcIoGWnbLn8sq/+Zy6t716yBT3j4+w3PES+4=;
        b=axgQG86KjjJxzEZRjeErPjJXBeLXqv/DJMgcLQSa9T6iU1+V6lnmEtL+JTLgsetv5r
         LOqYDHUdZbmpd+eSS2KM4E/fzbVSNYT8HROlGIW201daWcaBDT998g5u05DTx0gEwWnu
         dPydaip23xym9ud/hK55ovza3SqbDbzp+PuGwCzc7NL1sb/HfvvjcXOx7HSocSA8L4GN
         A2HRONUVpcGufr3ajDiUVWckx23nlfmmLjy3DqBoMbcECmJ2oQDnabj5/Su7rOzMvGSS
         tRuGv7jlX+xho1kY9x1dYfXm5CgkHqpiCNnr0xm+akOPWfFKeMGoIFd17zO5Z04qlUcU
         n9jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jMsdntsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si12279814ybc.441.2020.07.03.13.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jMsdntsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSBZ-0003dW-9F
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9g-0008Au-IW; Fri, 03 Jul 2020 16:19:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9f-0001Vd-4I; Fri, 03 Jul 2020 16:19:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o8so33101691wmh.4;
 Fri, 03 Jul 2020 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=my+2I7oEcIoGWnbLn8sq/+Zy6t716yBT3j4+w3PES+4=;
 b=jMsdntsCkNXisGBb8CWMLEwcMT5w5vt3Sf5OaNZ9pzAtgCTTUxi5pfTcmNNtU+aeYs
 wEr4QCmswYd+71G3yezbvj1mMfMVZtHHeGtkyC7UuxeJ+LKj/cLVHMXAN+003sXUtWBh
 dimsIGOni4BsEQsiwyDzR8GGjEo8g261ygPJxPmfelMqA2wJiLXJ+F+IYolgMxNeL0s8
 h2savXhtsNvan343BBx6k+lcOig6zXVV+7g4WTtLu/ukI0NgwbTRzYkod3gpbONdd15q
 CvKcbi3VOuRytEWpLnBhrTu+RR5WFS8hZDz2nwrs8bce3NicYV7C7OHlhYuxEPjQVe+u
 1bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=my+2I7oEcIoGWnbLn8sq/+Zy6t716yBT3j4+w3PES+4=;
 b=Rjg0Zo1APAbGgM9xgSTeSD0x8LuPXVqY0osVlRozTJn1FceAb3w5RFowJpmzQmSBMl
 rySILM2A/3emOI2cSlGtAy5CsrmMD7eHu8OURZiCn/nIZPn1WsPgxPgvjkCwDVsd6bwp
 eYNLUoNLlsg3vYu3RIMpFxUBSalRoOtn1akUaMJOJYLGgTV8+CDEE7pefo2COrkNFV5F
 kVcyQD/68j6sUqrBK0SBli2+Rek3kSyHfYrbfbq7ylZtf4VMjWZzLuzd9+M5ylYRvGMe
 RF3O5VKfAbP+GVHDYsLZsocL2ENsqSppGraqax6I5JuZLB4o+9jS3BHETN1mudAQdOzm
 1MbQ==
X-Gm-Message-State: AOAM5309oHwLAMQAdJ9CsufvzuvsiJV1TTLjToDb51sM0YI0Axf9JAKT
 2aff12JttUQkxBnEh+6nRsqIw4Xrfp8=
X-Received: by 2002:a1c:7209:: with SMTP id n9mr10149730wmc.150.1593807565301; 
 Fri, 03 Jul 2020 13:19:25 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u65sm14229625wmg.5.2020.07.03.13.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:19:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 08/18] hw/core/split-irq: Mark the device with no migratable
 fields
Date: Fri,  3 Jul 2020 22:19:01 +0200
Message-Id: <20200703201911.26573-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703201911.26573-1-f4bug@amsat.org>
References: <20200703201911.26573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 36soCEScSPfj

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/split-irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/split-irq.c b/hw/core/split-irq.c
index 3b90af2e8f..a7072f922c 100644
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
2.21.3

