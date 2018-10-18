Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2821930wrt;
        Thu, 18 Oct 2018 13:22:47 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61TnW7PRHZw34Wmbrvpz7ci08iR5WkwH5Sr7Ja3MSmW00saOHgqOFaN1WIq7JFkxoEKUPPd
X-Received: by 2002:a0c:d585:: with SMTP id g5-v6mr32049979qvi.50.1539894167420;
        Thu, 18 Oct 2018 13:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894167; cv=none;
        d=google.com; s=arc-20160816;
        b=h7UWPmT4DOSY3IiSBRbFNetTed1lVEMFMeFxs8XhVh1oH8DA8VCVz2tj4Cp9z3o1qd
         IZBaWGsRQa/xamAARnk3wVBIt5oCM6g5wrnMQftY+Q5axch8LdyDDmD+nXsN3sogs6b9
         87MCh95HquKDQ1DLGoD3KNH7o1BjkN49Bv6N0/ZTYBVx7XCDVVS9MPCi5vXxJl/HN7In
         77OQI8hCgiksp0iVZoaZBJxOWMG/F/he01h1jYHufJyH3kMbPrTX099SUOI1gc6X4Jke
         V9L9xn1XC4O1dqL6vAOfnlvw5mnuNxzp0YYSxuW476zRHfVOFRJnU771Pf3YdLvrT+In
         RYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=gmFJtoCLGW57H1cUVx6wj4zSU2CUCEgW+QnMKrTvoYQ=;
        b=sMOgF1xCByZncG8uqTIKfJA3unTthocHkC1w4YEvfpTHn9Nk7OKzxk0iLl8XwMxBFg
         z35Nr3i3ijCVvSFcGAdQHUTv51F7yJXqrY6T9bAClgsisE5Qvlf7bRhHJnj3ajlnh2hC
         5GWlwmFNRUWtric1c0CVZ1AUIsFrafXIQc305gh2z2H7HExvzv5zOfq8Jthe1nMdUzFS
         v+Q/z3WMEgrqQeketvyd7NMMXUhOgC/0qYtkoeq9EzgeOoPc383ym1iR8IL743864ZBN
         KNCPGcrd5Fu71ahFRDO5CvvVPdOwh7P2ZdkbLAuAQULRcJOX/ThD6u3qHjJyyBkGhxhz
         X8Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x93-v6si7376210qtd.54.2018.10.18.13.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEog-0006IH-Pw
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:22:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZ4-0000Zc-EO
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:06:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZ2-0001Lf-NG
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:06:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEYr-0001Ec-Kj; Thu, 18 Oct 2018 16:06:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5EDED155AC;
	Thu, 18 Oct 2018 20:06:21 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6137B60BE1;
	Thu, 18 Oct 2018 20:06:15 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:54 -0300
Message-Id: <20181018200422.4358-18-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Oct 2018 20:06:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 17/45] machine: fix a typo
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
	Rob Herring <robh@kernel.org>, qemu-trivial@nongnu.org,
	Li Qiang <liq3ea@163.com>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
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
X-TUID: sxobB3iZQ1Iw

From: Li Qiang <liq3ea@163.com>

Cc: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20181010161025.34796-1-liq3ea@163.com>
Reviewed-by: Stefano Garzarella <stefanogarzarella@gmail.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1987557833..da50ad6de7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -636,7 +636,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
         machine_get_memory_encryption, machine_set_memory_encryption,
         &error_abort);
     object_class_property_set_description(oc, "memory-encryption",
-        "Set memory encyption object to use", &error_abort);
+        "Set memory encryption object to use", &error_abort);
 }
 
 static void machine_class_base_init(ObjectClass *oc, void *data)
-- 
2.18.0.rc1.1.g3f1ff2140

