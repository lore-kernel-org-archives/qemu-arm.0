Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp210533lfb;
        Thu, 14 May 2020 23:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMqDRh/1VaBZzvNO9n5s6q2xn5sHPC6KVzZqJCDP3Y6W0KN+UMj0lynG+jVTx7docQWv99
X-Received: by 2002:a37:a2ca:: with SMTP id l193mr1717220qke.23.1589523003766;
        Thu, 14 May 2020 23:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589523003; cv=none;
        d=google.com; s=arc-20160816;
        b=Jpg+WzwkZy/7r5AS1gLTrcMTPa5V68cHT57yjXNNgXTQzy7pR4Qjg5Ug8/S3sXY1kB
         d6KZQAmVXLyQ0H/khmv3KxsBW+++MsJC1Wcan4+kNQugdXX3RGLZTQi/7gwcdutAq69G
         GM8OoRyxOWqlQSjNYNiFqduHAYJCMVKD+6M/3jado0nFURCZ9baYFV0ac40yp7PUuik1
         yZcROOv26W5SDuBBUtFA+FMbgeFjGfRM++Shblys1zYC1uXHc2fap+Zea2SG6kK+zsZQ
         wBvwW6tKJE8chOPX0+EVoBYw+n5OeHJli2kN2fjRX7SWyy2Jq8wBO5dyfWjN37E2HJi7
         jgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7kERk/dXhJN9vNk9qwSgiMCA6BVRWsVmpiMACBsXf6Q=;
        b=BkzOuxjO3OSqt+DlfwCEq29HilmjXhcs/U+yiADBPKiZUbhCrAhthOwo8a/HliuToW
         T1pWzfrwXQV1Yb+Iv63k9z+sIB6P8FqmhVIEpBtozfKD146Kecomq9OSDsfFMIUbS8CV
         I42sowFXw5UXrzWTixz2zmSIu42ciJmhzccmHC6hoOM+a/Yk/IzCvIVjdnreuJMbavqt
         +IEYrsKnLdFXVmlAZurXYRaFdqiLUr6zdmKhyQk9+VjMkx53KUAguYFBFlJNggrCtFLF
         wc8SxW9CWtv74KU5VTqE5Uv7JEERrVKHzXx/G3IXmvsfFr9x4j1DC59AXiNyfI0flxVv
         fkAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cMDfvAiy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea4si469071qvb.145.2020.05.14.23.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 23:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cMDfvAiy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZTXn-0003bL-6M
	for alex.bennee@linaro.org; Fri, 15 May 2020 02:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZTT9-00045u-3n
 for qemu-arm@nongnu.org; Fri, 15 May 2020 02:05:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31637
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZTT8-0004ji-8i
 for qemu-arm@nongnu.org; Fri, 15 May 2020 02:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589522713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kERk/dXhJN9vNk9qwSgiMCA6BVRWsVmpiMACBsXf6Q=;
 b=cMDfvAiyrq8PV7yPn+k18NZQCkGr5kNqHP9YZrjac7XfxqBe62L1oN7V95ujE0UZnEJBHB
 A1HZKj5p2laGFEnXGudSkq0h52/EcR+afz0zTo/4qBlWIC6aoTadM7rKz0XsOwfjXXWax/
 vzC2FZsbDZMzx8bx3yX01EhuzJKIgqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-yONVjNS3PtKQGgf9lj_U1g-1; Fri, 15 May 2020 02:04:29 -0400
X-MC-Unique: yONVjNS3PtKQGgf9lj_U1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF8C618FE864;
 Fri, 15 May 2020 06:04:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8179F6FDD1;
 Fri, 15 May 2020 06:04:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 50CCF11358C8; Fri, 15 May 2020 08:04:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] hw/arm/bcm2835: Drop futile attempts at QOM-adopting
 memory
Date: Fri, 15 May 2020 08:04:15 +0200
Message-Id: <20200515060424.18993-13-armbru@redhat.com>
In-Reply-To: <20200515060424.18993-1-armbru@redhat.com>
References: <20200515060424.18993-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CoHRQ+5/rL/N

The "bcm2835-peripherals" device's .instance_init() method
bcm2835_peripherals_init() attempts to make two memory regions QOM
children of the device.  This is futile, because memory_region_init()
already did.  The errors are ignored (a later commit will change
that).  Drop the useless calls.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200505152926.18877-13-armbru@redhat.com>
---
 hw/arm/bcm2835_peripherals.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index edcaa4916d..8b399d67ff 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -43,12 +43,10 @@ static void bcm2835_peripherals_init(Object *obj)
 
     /* Memory region for peripheral devices, which we export to our parent */
     memory_region_init(&s->peri_mr, obj,"bcm2835-peripherals", 0x1000000);
-    object_property_add_child(obj, "peripheral-io", OBJECT(&s->peri_mr), NULL);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
 
     /* Internal memory region for peripheral bus addresses (not exported) */
     memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1 << 32);
-    object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr), NULL);
 
     /* Internal memory region for request/response communication with
      * mailbox-addressable peripherals (not exported)
-- 
2.21.1

