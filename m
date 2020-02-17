Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5283696lfp;
        Mon, 17 Feb 2020 09:38:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyiEyde/fqO/Xam87x/CiWpoya5Se7ysqyhNRbYxsvGZPZmPAVeg7VjwxFgKJI+zCj+ZV+
X-Received: by 2002:ac8:74c:: with SMTP id k12mr14184195qth.185.1581961128214;
        Mon, 17 Feb 2020 09:38:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581961128; cv=none;
        d=google.com; s=arc-20160816;
        b=h81qqWUTCIVYxmyLCTNhQoRnExs3y61F42jl9H7j9E7424up6ZTWi3gClXQ+Hvpmnp
         DqkDPZiqaPPaNBcbnveBNAny0u7VZCQRM2LAHh78x67OagfnXWRKUhaFb2xz9JMvyfPh
         ew/VWW8zgaNpPIqXOTePnmzRp3UI82nR0F4rKZCMCARlFrEzG7deIuGIxD4/Q2ZG6yym
         WrvqCg4mPnp7hT7x5UmTc7dpWDRXfbvef+u+Qz01wDJbXNv/6Fkq5l6S8J9CaTcVO14z
         pUCRT7WyEq14Ayuwf1c6MeE+k5x0RTkRbbi13fVNwkTGng1Z1Xl7XqxDzMGai+0HNH5E
         oAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PoLKVuD8z1OSIeOnDJ8QRLSEIGCP8+HptdOHqvqlXlk=;
        b=S/YYj4AUpvw82LRX+f2VB7OHP47VtIKfrnMRAVdrYkI8YR3SFKMdZ7Jb5uoov8nYC3
         OIvyzhg0zFkTVz/7EJC6CFlBCjo/lA/Vzm4IuDNNPU9cEs27xE9VJDC+fmNeOClGGhCL
         CkgorL0eBOL5zOPbMtVJIvlwQmIRSRq6I4ylJ9Z80TptRnbYG+9uU8BzCeCR3aK86lpp
         aIf2b6mKA9mAuvrJSTKjbvVfW0XVd4Hrn0SQSOrUeWmKtzeT/9zsNFtK02NxlEiXl5Cr
         lOI+orUOZEDfAwp+6MFu4i9rFznGptfOo38gRSiQgfntU2PltyY616JGdSKFKZdI89ss
         vDxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aymhT6uL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24si554250qtn.325.2020.02.17.09.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 09:38:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aymhT6uL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3kM3-0008RB-JO
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 12:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j3kIl-0001I6-0d
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j3kIj-0001q2-Qi
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46590
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j3kIj-0001pK-MY
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581960921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PoLKVuD8z1OSIeOnDJ8QRLSEIGCP8+HptdOHqvqlXlk=;
 b=aymhT6uLX8t2eupGLzKoUtBG4FSBtz1bcOrDxSM7dfscjmnisCNOsZz6ZlNjL5HCG6YnD3
 qo5bZAjKQ7VH1DBG8anUKu1XKMHz8BATeQn+k/LFeufHW569JjYxGEQiZGer9dGnKpuCHD
 a0ZKL1+fr16GjSgRhvu9D0VZAZEhVWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-wZugAkmWMqut0vxOq6qlbA-1; Mon, 17 Feb 2020 12:35:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6048017DF;
 Mon, 17 Feb 2020 17:35:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F23A78CCE0;
 Mon, 17 Feb 2020 17:35:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/79] arm/imx25_pdk: drop RAM size fixup
Date: Mon, 17 Feb 2020 12:33:48 -0500
Message-Id: <20200217173452.15243-16-imammedo@redhat.com>
In-Reply-To: <20200217173452.15243-1-imammedo@redhat.com>
References: <20200217173452.15243-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: wZugAkmWMqut0vxOq6qlbA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, philmd@redhat.com, jcd@tribudubois.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YhbU6xC+vm83

If user provided non-sense RAM size, board will complain and
continue running with max RAM size supported.
Also RAM is going to be allocated by generic code, so it won't be
possible for board to fix things up for user.

Make it error message and exit to force user fix CLI,
instead of accepting non-sense CLI values.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: jcd@tribudubois.net
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: philmd@redhat.com
---
 hw/arm/imx25_pdk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index c76fc2bd94..a2b7b35dcc 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -78,10 +78,10 @@ static void imx25_pdk_init(MachineState *machine)
=20
     /* We need to initialize our memory */
     if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE=
)) {
-        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
+        error_report("RAM size " RAM_ADDR_FMT " above max supported, "
                     "reduced to %x", machine->ram_size,
                     FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE);
-        machine->ram_size =3D FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZ=
E;
+        exit(EXIT_FAILURE);
     }
=20
     memory_region_allocate_system_memory(&s->ram, NULL, "imx25.ram",
--=20
2.18.1

