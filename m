Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp721153wro;
        Thu, 25 Oct 2018 06:42:29 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fs/wsMNbc3E6ubfdCOjIhcIncTrcrUrce8Q3KW/8ibB0JsFNGbWKhyKiKJuDxTcqc89tZL
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr1419904qkg.184.1540474949704;
        Thu, 25 Oct 2018 06:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474949; cv=none;
        d=google.com; s=arc-20160816;
        b=oQ1U1tQ5WMU994JtF9VgxG7jjwWG8rGyxO30RHFTTaGpqN0NnEa97JO4/BqVTo3i2H
         zVCGZe5oEY1obPXtSENwEF+Hhsc95+Rn4JF9+QFyTcpmTJXbk2UuWHeSFowNTB5DGUYF
         L+xRSO2FStto9k2WRyg7wbdOdAnsLjmkY8qxbaa8CrMJNYBnJ2RYI4ZJNV/ZkKiAAA3l
         scID7hu7yMo70UTFt5uNs0YJ8SdMcoCE+Oq5gxNCQnBh3yCv8vbiZGFOv7pg0IVDJ4GJ
         ype0eeEV0TzUMK/8L6+UE9xXaGPKg51gIgeHIH3ozdZ6cAR2kuIPW/GgvjMp3wQTb2J3
         qlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=qxokgRz5GSq3ZOlGGLVEbsbDfvOZXhg56m/HSKNXg9g=;
        b=Pcrj0dd2TGorL0xpb7k7NXaOvCOlDoiZQgIZe2QnjIJ5bERocb0gidTJjIbawAVAVe
         Fnqo47p1KMzr980PVUWqzYTEEPGd/7M7DCv/AP0EqbdgHljEPJQkz/Q7Tsnksp/hgsGR
         U3mqSwSDS5oOsdgy/266boZe0lVX3ufx98eH9bmwLEMrZVQFbqdr+S4Lw7Pxh868tulD
         3jnTRGuiHD0xxNEfO+meoH5FvHkfGEQY9JRsGoSP52HKs45j4Ktxi5hv4FvpZoFF25t3
         0etVBKKI1ewlwbPuPF0cKXmVfPUbwCnELV0vWy0wK7ryN/BPbO+gLTmBRxgSWcmhRj1T
         zPKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11si1154138qvh.109.2018.10.25.06.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfu9-00007N-4l
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:42:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfnh-00032G-Nw
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:35:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfnf-00007r-B7
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:35:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfnA-00089w-Vp; Thu, 25 Oct 2018 09:35:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C4E43084022;
	Thu, 25 Oct 2018 13:35:15 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B25460BB0;
	Thu, 25 Oct 2018 13:35:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:35 -0300
Message-Id: <20181025133301.16578-18-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 25 Oct 2018 13:35:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 17/43] memory-device: fix alignment error
 message
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, David Hildenbrand <david@redhat.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: otcwFqJ9szMg

From: David Hildenbrand <david@redhat.com>

We're missing "x" after the leading 0.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-2-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mem/memory-device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 6de4f70bb4..0b52fe2c5e 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -120,7 +120,7 @@ uint64_t memory_device_get_free_addr(MachineState *ms, const uint64_t *hint,
 
     /* address_space_start indicates the maximum alignment we expect */
     if (QEMU_ALIGN_UP(address_space_start, align) != address_space_start) {
-        error_setg(errp, "the alignment (0%" PRIx64 ") is not supported",
+        error_setg(errp, "the alignment (0x%" PRIx64 ") is not supported",
                    align);
         return 0;
     }
-- 
2.18.0.rc1.1.g3f1ff2140

