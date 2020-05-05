Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp178155lfb;
        Tue, 5 May 2020 08:33:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypJs+keXArsttGX5vNu/thEVi6EcwaMeEr76wGzkP/Syel4sgEpC1eRktyad+0QSv0vb4uX5
X-Received: by 2002:aed:3bf2:: with SMTP id s47mr3208722qte.126.1588692792026;
        Tue, 05 May 2020 08:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588692792; cv=none;
        d=google.com; s=arc-20160816;
        b=a93Gq/x2WGQdYxStAe/TH/3NmmNdac9iZ9e2iEFtVhB/H7Qd3rIIsRLrNYp94aR9qZ
         pG0V3qEiEnRcYogRcjHF4st8q5UYvG3EzHKLoFwV/nn+bAvDkpoTF7hD/Z9caXzW4vew
         FLXuiZwdBqukMdjPjiwHxLCiaMwgkorqWw8DLX2wJson37XgXJ1MHbYwYSBwo/4yzsfY
         0faULb63Dyue6bo8UZfFIi3RRYaTcmD0mnQJ9q956JYoGK/pFdIf8msJiASWS6BlBB+U
         7iwNwjFy0hCjje4OZLKK9xp3EQyzQsoBWRn/1SbXzKiI2zqJUqbIavv8n1DGBRM4ll6n
         1xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sZXFtlUJilR+Fg2pc8i1e5FuQYdjyR/PnHfZpdXP6U8=;
        b=tfDQJzreDQfLK/BBNgxGd51l59yDGpYM7KZiAAYAqB31IOYseUsvVKPi60sEY8FuTe
         dYM+4JmVuBRg6Ct/1nqiT+oM8KlXRJH5sW1VlQPvusX7UDUIi7CnxAYH43FrwuqL9B3U
         nRtXI3u8AZcTIUXBypF36WMen2pNAb/OlMOZJXxgr1wC87dF5xzs3nrPilK9apsy0K0a
         fQUSwOAnWC2GWQUwREz5g0hsrLbsZIzRh/I6zy9JgqUgFIgWlbbNorjcg2j0/RRjmPJf
         +jAN9P6c3g6xIuiI3hiIe+dzO2/m8JuF5zmGQqGGjQRNtAg6DKRyqKqi6+SBfkGmSiHr
         6MuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CpThvJfu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 140si1497015qkd.12.2020.05.05.08.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 08:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CpThvJfu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVzZH-0007WK-6z
	for alex.bennee@linaro.org; Tue, 05 May 2020 11:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVzVp-0003Lc-Fe
 for qemu-arm@nongnu.org; Tue, 05 May 2020 11:29:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54837
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVzVn-0007Qq-7n
 for qemu-arm@nongnu.org; Tue, 05 May 2020 11:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588692572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZXFtlUJilR+Fg2pc8i1e5FuQYdjyR/PnHfZpdXP6U8=;
 b=CpThvJfuhVJZWeX7wOJxFie+DNng7B3Y8zmJGQvnqahVrwqTBNKbNTSji9BqMhHdLNCc0b
 Ph7iuK/Dhdm6IjZ4FG6JLNOxjc19EE0s4m3mwEgeFXuG6bXZxWwcz/8vxxumbvuPgIzXCw
 +FjtrMcOzD66Bjs1ZCzkWfjpXNDoN/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-BGqJFzFWOOOTBOJmzw8KZA-1; Tue, 05 May 2020 11:29:30 -0400
X-MC-Unique: BGqJFzFWOOOTBOJmzw8KZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8983F800687;
 Tue,  5 May 2020 15:29:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5158562482;
 Tue,  5 May 2020 15:29:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5576611358C8; Tue,  5 May 2020 17:29:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/18] hw/arm/bcm2835: Drop futile attempts at QOM-adopting
 memory
Date: Tue,  5 May 2020 17:29:20 +0200
Message-Id: <20200505152926.18877-13-armbru@redhat.com>
In-Reply-To: <20200505152926.18877-1-armbru@redhat.com>
References: <20200505152926.18877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, philmd@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oij5y3sSLGm9

The "bcm2835-peripherals" device's .instance_init() method
bcm2835_peripherals_init() attempts to make two memory regions QOM
children of the device.  This is futile, because memory_region_init()
already did.  The errors are ignored (a later commit will change
that).  Drop the useless calls.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/arm/bcm2835_peripherals.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index edcaa4916d..8b399d67ff 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -43,12 +43,10 @@ static void bcm2835_peripherals_init(Object *obj)
=20
     /* Memory region for peripheral devices, which we export to our parent=
 */
     memory_region_init(&s->peri_mr, obj,"bcm2835-peripherals", 0x1000000);
-    object_property_add_child(obj, "peripheral-io", OBJECT(&s->peri_mr), N=
ULL);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
=20
     /* Internal memory region for peripheral bus addresses (not exported) =
*/
     memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1 << =
32);
-    object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr), NULL=
);
=20
     /* Internal memory region for request/response communication with
      * mailbox-addressable peripherals (not exported)
--=20
2.21.1

