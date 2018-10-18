Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2817192wrt;
        Thu, 18 Oct 2018 13:18:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60p9MKbDiJiUope9qHwwJk9mqaMeFo5rDR4dscN45Nqpkge2d0ry5MvSvHcsN0gTq/3gaZw
X-Received: by 2002:ac8:2932:: with SMTP id y47-v6mr29746739qty.42.1539893921461;
        Thu, 18 Oct 2018 13:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893921; cv=none;
        d=google.com; s=arc-20160816;
        b=WE2kTB7DvOthl1aS6ZUcgIC9cBu24iejE5Ig7eWFAtNNrQUJm10vHa/j61xdjbIdFk
         BnYPHmIvLTSu2GYZj+lT0aXb8gVa/GvJKuqQ1yhZM2caHt4gw9n3NdaIbQFtvmFS+yAZ
         7hUSfnHJNWTM+yP/7Ft1lkJ5B3wR/uL1mefxmhIoP8q8KhhfwCTp0idHbZXd6kiAMrTo
         zaIQUyh+K4F97Me6TMUSwGREuK80lJnBomVI0N7FL4Spb/ZN77PpjVzzcxgHaLP4mDD+
         PEMLkRl4TGKyZmucRrNboSz+aYHupjhptdqUM/VM5i8hREufG7chdol8YXKeU/Ae3CnT
         CBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=EfIeah2OaF8ZFDynSrRcg8FcprQYSp6XHVre5r1HE20=;
        b=HoCPf/EOS0wOqcKKsPnLW+/skgdOhdHnMs60q+yWp7m33SUHVfOPRwTLOlILZQDQHI
         Wg4cJ292Fu1O4CbkiDKh7ryGvQlOs8wuaeLkqEsV75LJTFPNLKnIkx+etx45mzecp/b3
         HF3OqTOTE37mUEU3+4zbF0/T2Rbuun6oR1YkM+KAcUevg6bUfWohC7BxkTS4gnRxdkfw
         Ya/DF+2/enfWG4JVS1FIQDYwrw5LAk5CWM9vsdR1Y7SGoU/Af35sCLwHe5p+XeKYVOHg
         FYZBoET/zZaGb0Kz9I5ZwVDyVyP61HcBpRxXSoiFOxvGba33GiZoEJXYBpzsjBJhJ/Cv
         K82A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n46si7194097qvg.141.2018.10.18.13.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEki-0003HU-SG
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:18:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZD-0000gH-VW
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZC-0001f2-6U
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEZA-0001XO-BN; Thu, 18 Oct 2018 16:06:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E25B8356F0;
	Thu, 18 Oct 2018 20:06:42 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F203A87EF9;
	Thu, 18 Oct 2018 20:06:34 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:56 -0300
Message-Id: <20181018200422.4358-20-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 Oct 2018 20:06:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 19/45] memory-device: fix error message when
 hinted address is too small
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	David Hildenbrand <david@redhat.com>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vo+9Pt/C1PfP

From: David Hildenbrand <david@redhat.com>

The "at" should actually be a "before".
    if (new_addr < address_space_start)
     -> "can't add memory ... before... $address_space_start"

So it looks similar to the other check
    } else if ((new_addr + size) > address_space_end)
     -> "can't add memory ... beyond..."

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-3-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mem/memory-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 0b52fe2c5e..7c706fadfc 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -146,7 +146,8 @@ uint64_t memory_device_get_free_addr(MachineState *ms, const uint64_t *hint,
         new_addr = *hint;
         if (new_addr < address_space_start) {
             error_setg(errp, "can't add memory [0x%" PRIx64 ":0x%" PRIx64
-                       "] at 0x%" PRIx64, new_addr, size, address_space_start);
+                       "] before 0x%" PRIx64, new_addr, size,
+                       address_space_start);
             return 0;
         } else if ((new_addr + size) > address_space_end) {
             error_setg(errp, "can't add memory [0x%" PRIx64 ":0x%" PRIx64
-- 
2.18.0.rc1.1.g3f1ff2140

