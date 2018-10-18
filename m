Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2822269wrt;
        Thu, 18 Oct 2018 13:23:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62MnMtUO7ptvmm2ApToikH9w4XGKDMayKnP2VN7xZcn8ivRC16gJ1IHXmyEMmXUGWgWp4n4
X-Received: by 2002:ac8:7482:: with SMTP id v2-v6mr31275098qtq.251.1539894187218;
        Thu, 18 Oct 2018 13:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894187; cv=none;
        d=google.com; s=arc-20160816;
        b=ilf1xyQ9+OW7CPSA3hKX/fdBLrzH4uYhE2hRGIFWYjXIW0+ZdxMnOMRKeugaL64gOa
         Wh2NV6UGQx8PbFlWX52pKSnAOzoXbFFQAydq6XzCaGP/63G3aTxYKaeeOU4nQ2FXJ6TQ
         IeTaWz6X56aYuOYRVdidXXfvO1Cf6JzNcYvWxJ+5b+v3Q2PU3eY9/b8yPi+ZtgOUiqCR
         4Ids3mo7QwpBbOXTN93CbFWFInMc1u04XXkZpQ5Y8diRL//mj0R8nopntqC6xQjDKA/A
         mq3aUJj5XFX7SbeokRohuR0GDJXWRm0K3i/wIx+7zJuFXN9g8L89S0uD+93oj7Fdi3wy
         tphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=qxokgRz5GSq3ZOlGGLVEbsbDfvOZXhg56m/HSKNXg9g=;
        b=0xiaUYXQfWv8iU1pE2+0o3be0Ue3sHmJQeN7SXshiOWkXzb9vDc3D4B6H8rwlF60Y+
         T5VXQNravCiXTv4XynDtTj9TIcptYcMzsqZ+nwk8DulhrGxbYPHUfyuLSpOHPI46ZFfq
         hvhjwF6ObT+r3UFesItNiZg00HD9Ec4ILZ3EQYeJLGnieu3fitKfCFZDKTMGe5wP+XoC
         0s7Pe5Co27OPtS3ib5glXe29sifVhiIsatW26Y35Z5CC2DlMsVlNw7dVzmSJgt+ZXO9Q
         CoQU2fgKh40KLtqXuQNllhBJkAPJKNoI3hlCuJ3rct+Bj35GGoyBMKlC9pss96MZiaFg
         zv8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x55-v6si2747152qth.369.2018.10.18.13.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:23:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEp0-0007Q1-Bb
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZ1-0000W5-QY
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZ0-0001KN-Sy
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEZ0-0001J5-91; Thu, 18 Oct 2018 16:06:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 416C430820D1;
	Thu, 18 Oct 2018 20:06:33 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29CBB60160;
	Thu, 18 Oct 2018 20:06:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:55 -0300
Message-Id: <20181018200422.4358-19-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 18 Oct 2018 20:06:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 18/45] memory-device: fix alignment error message
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
X-TUID: TNmL9utKG1B7

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

