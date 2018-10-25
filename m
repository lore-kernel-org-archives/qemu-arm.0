Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp722013wro;
        Thu, 25 Oct 2018 06:43:16 -0700 (PDT)
X-Google-Smtp-Source: AJdET5c11boSCOM80ke5qWP4GueKEkMIxQ9KNJqy/gePx6BhMe1KdzCik++uWEBu7B5emXaHbtTL
X-Received: by 2002:a37:7a05:: with SMTP id v5-v6mr1406942qkc.129.1540474996064;
        Thu, 25 Oct 2018 06:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474996; cv=none;
        d=google.com; s=arc-20160816;
        b=BD2gJYmeFITpX0B2m0FbGYopVgph4u9ho20nvpSwHQzSGz3OW5PNpwGh8bnOoOce9G
         v6FPsPrkaCD6Ot+Xl4hGoXfaRvlcW3DLP0IgsUwLGn8RYiVYVljGojpR9k4Cvc4Ow5L0
         YhXozvtdYpNxKTb7DtiEltJ0ud/O/ubFvx8dx7Ui/4lXq3RR1TL5EyEI8KK9IcmZePJ+
         bdleb7qYEMMWeinBbZCfoCb8mfONcnG2t0GTYNyJ3QvIM4oa9WA4FeUyssjrnmMHdWa+
         8bJ5MdKu7wFcNWGuNveLUPUqKGuZnsiAd3yJRQUm6QNAGpRFETit8U8tcH077oSkslSL
         VxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=EfIeah2OaF8ZFDynSrRcg8FcprQYSp6XHVre5r1HE20=;
        b=SUcpdDy1KNRsg+nVjDFzh5D0NsIblo3nbRaUAjANXh3lnwvLw/dGval4Vklcdp1+t/
         PiEak7DFO+ZL5hb/+mXG18QjMQg3U52glKcH2MkpKZcms5HFueDLBGxl3WVk/K/u0f2e
         S9bWj68/uLGYGzpk7q+oxaRcNQ5XM8vYPPt1/ofDH7jWA0lgWaeyHNJtrzpMzs56WojA
         Tp8RTSJHclGPD9xpeaSjQ9ex7tBP2zB015zaWSQOYC6g0JM1JDrShNiaem7WX4bYg7jv
         byagfTAeBkZPK5Df8RkbQAXhAXvpsO38QKQj9sjZpkUF21TWQ6ZKcRdBQut1LPLD3fj3
         MDgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b15-v6si1647246qto.106.2018.10.25.06.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfut-0001Qe-JJ
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:43:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfnc-0002ws-K5
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfnZ-0008Sy-7s
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfnX-0008Bv-4T; Thu, 25 Oct 2018 09:35:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 842B03097026;
	Thu, 25 Oct 2018 13:35:19 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9508C605FF;
	Thu, 25 Oct 2018 13:35:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:36 -0300
Message-Id: <20181025133301.16578-19-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 25 Oct 2018 13:35:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 18/43] memory-device: fix error message when
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
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
X-TUID: jHWQThwmqsu1

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

