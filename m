Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3425142lfm;
        Sat, 4 Jul 2020 08:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9ImFO830pGi0HddJTKs7jIMo4IKpqXb+1NHbJCjL2QOxkFfS5uZJ/PMgGhMzVQbfry7lb
X-Received: by 2002:a25:2a81:: with SMTP id q123mr19797182ybq.514.1593877411648;
        Sat, 04 Jul 2020 08:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877411; cv=none;
        d=google.com; s=arc-20160816;
        b=IknyzKOVCTvwWFQxlA9RN07vnXi067Hty5i1hNTWC0QVx30sHXESDjN+HpRJirsGWi
         IGzpXiJ+gE0URj7J5DguuUQyAJC+ccbRU0ngxdoID00Rxw5WWLS+I+NHOX8V9A/t3no8
         MJ8oKpx1jn94RFnEZM8mcNLniHdZqWsa/1hWVSB/+GXAEzEiLu/mWD61eqSaEwYoijH0
         cfY/vAS52VUDxu1JdUpFPYiWq21lISjFr1W4oClxzY22k4fo1z/FydI/xyiXq5c4jXxj
         /J5XI+eu68+9abWj7SaYhxFaXvoNxJlBhTRoFnVQTKUR2NNz7S9IgngapBxnWtIfwim9
         SruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
        b=m7OY7a7wtKqJDKw/LKDdj/ppPxMmqHepxhomgieT2FmGwnIP9YrI7bpztySh7KaR3M
         Vh1WRO875MSftuRWbO/756cMMTWbUJbmtL1mO43XX57no2Wb6kndYZRrLOKG7qOUVwGv
         /6MZ9EOYPXAar+oxwyJUEqp6NwkgmzwINcXMjZqMJAI7s2qnAYZzTkD+u4hUSOxy6s1X
         ANwmjfWEnSo2j/vNDxYvBxk0swwZJDKWS9KuZkIgvUm/Z/XoGtFqmdiTOFuD/IbnOg0v
         H8N9ScP5z6uWlNAFFhAY3IOCpvJhplQyzef873D4ao8Boie9Cg0crzZlxgHn3LdyW9It
         FITw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PdxxxNSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si14464225yba.199.2020.07.04.08.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PdxxxNSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkK9-00071I-Ux
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGj-0001UZ-1E
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37388
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGh-0007Z1-0U
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
 b=PdxxxNSjW+X5GSf+ZRYLkeBTC+K3lufMSY7VUcnM3NA/4o65E1ESbePtGGQFeHZKgYe22A
 4WUNB/sdTbzJyR/5ceQzl+gQkBuKLpO4XUFowAzbAiybUYPvXlV4EspgrVRf2uQDj44MJu
 LP+B8STb+qqqmq0pzwHWciJlbrptI94=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-WMW-Tk59Nl60c6zC_97Hiw-1; Sat, 04 Jul 2020 11:39:51 -0400
X-MC-Unique: WMW-Tk59Nl60c6zC_97Hiw-1
Received: by mail-wm1-f72.google.com with SMTP id g138so30935663wme.7
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
 b=WjN787TsZw0MNczOdv9qLj23aEAOiHEaP2FnT2svAB6gK1VIygryrKQrPzvLEjSWip
 fefVmtN+U0hOgMoJNRsf4u5qcIABvL/VOsrc7xnzoqCbL6nbhnzlTV2I6Ucgx0JoEG+a
 NJ2mTf160C6UWhqohbVWP5lXrkx5ExsRTUWURadsJlcRLy/4ZT6AH7J1DqrKoeYTY6hb
 63u1z6APJADuF2Sp3xp3fMAh7h3EynBlv4ZUDxJZtf6+GdLzM4dtNsyoGVM5SAa+neH6
 122elfqwuS1DsmRFc6Iy9YmmpUas6w+oBJp7SA3w0vTN1+9Rq8VGAQ4cib3QMHcXyeRh
 gG0g==
X-Gm-Message-State: AOAM530N7/Oe/Bj2oRT+KM6fgrPPtMJ/PlwZyhWH0AePCPBtK0t/cSw+
 2UuBgnKW/RQglVLzzebZwa6P6sBJc8/RdRAW3D7L4WMiM6qN7XZsMCptaTiZXg4udnkobLEW/sZ
 9pZLa1W5a3Gyl
X-Received: by 2002:adf:e74e:: with SMTP id c14mr43648128wrn.143.1593877190109; 
 Sat, 04 Jul 2020 08:39:50 -0700 (PDT)
X-Received: by 2002:adf:e74e:: with SMTP id c14mr43648104wrn.143.1593877189914; 
 Sat, 04 Jul 2020 08:39:49 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f16sm16575426wmf.17.2020.07.04.08.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 07/23] hw/display/blizzard: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:38:52 +0200
Message-Id: <20200704153908.12118-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GOV5DHdy1c4Z

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/blizzard.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 105241577d..74557b152b 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -23,6 +23,7 @@
 #include "ui/console.h"
 #include "hw/display/blizzard.h"
 #include "ui/pixel_ops.h"
+#include "hw/qdev-deprecated.h"
 
 typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
 
@@ -1010,6 +1011,8 @@ void *s1d13745_init(qemu_irq gpio_int)
     BlizzardState *s = (BlizzardState *) g_malloc0(sizeof(*s));
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s->fb = g_malloc(0x180000);
 
     s->con = graphic_console_init(NULL, 0, &blizzard_ops, s);
-- 
2.21.3

