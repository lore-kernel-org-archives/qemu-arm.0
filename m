Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp554929lfp;
        Mon, 20 Jan 2020 11:00:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRp7M2voodvTETB4nZk6XjNPyEoDeddZtazNjvhtY0OJZU7jU1MD8wk4OMsD2yNu9OeDq/
X-Received: by 2002:aa7:d716:: with SMTP id t22mr481361edq.195.1579546806853;
        Mon, 20 Jan 2020 11:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579546806; cv=none;
        d=google.com; s=arc-20160816;
        b=T1SsFAff7FhD3zMv9Cige23+mISe8AuIuIg4Z67RZ2JJ5xtGRwWnLavmbXoqFZTQEg
         rhMV2tIphIjsNoXN8V+BNClGoueuuu2ffN63eP86oBrzWi8RshvsTqHNX5bYKPlJMHAO
         M5ZP8OzGuJrgm3kRuNT+ZQ2rlLYyQv3m+TgkmbMJi+7ZLQD09J7hIow3I6tjopW2ptu1
         HTFsuLAQdmCTQb1FrAQCPlXCVK/gJJBDpMhuixGGnwPHT8bpF3BV0aunm3bE2xKPDsPj
         RcCh5E3tR3D1Fg4OhtcHPlvzwr5emm3vPI5iKOy4THi6s/f0agVlZhM24puMkWRaCZBL
         2Gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XhSmOdSIPFdYDo3ekRv8QjbhS5rxkBiSCbs7ea4VlnA=;
        b=T79OP9qX3ZkGQtkPXdinkQTdHcA4Z/MLGYGcACnZfVdh4+/tZIrKQ/ywmq5mARB+Vs
         nF9W7pNWXSn0EoDzBxlV4cpfIHaPA+0QJX2/gOACVJK1ruhyWcvXXpsMBUq3JJXYx9qS
         WOZsuzkoGGPPOTy//JOQceekmqZGidV/bOHPezt+dVaXAH+DAZeyzfu+vHQXrxu0S/nT
         4f4Wce7j6bLyOngjgkydO3xl5GgdhOqCpyJTBn4VqKWNdgSsgJtwYDg6oTY5EKfgAFYs
         cER2408Rlw6gLHlrE02nnI3Zu6NnbKLkCLDhogg8usbRkuPuBx1mj4gQvj1DRbBxyJTj
         /W6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ag70jtZT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si25385495edj.1.2020.01.20.11.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 11:00:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ag70jtZT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itcHM-0006F3-LG
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 14:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itcH5-0006AY-1G
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itcH4-0004rI-1z
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26272)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itcH3-0004r4-UT
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579546785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhSmOdSIPFdYDo3ekRv8QjbhS5rxkBiSCbs7ea4VlnA=;
 b=ag70jtZTHE4Isc+nUW9ctUqHV2o2rT5kfCM9TPr1f958Q7LSsDUx9S9AMms1KK/v4+SoXT
 IeDcAstb+7AsEwotRIPuWmPNQnyIxuyJOsh0jPnAsn3bh+7U6JNpZYIZ8U8cjxslP7wstQ
 Jf0iIk8A7nRCj22+jxXaapVRDRWVOJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-Qc7P1q7qPk6jzoHsS-DwZg-1; Mon, 20 Jan 2020 13:59:44 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17A2D10A1690;
 Mon, 20 Jan 2020 18:59:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C22205C1BB;
 Mon, 20 Jan 2020 18:59:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] MAINTAINERS: Add an entry for the Siemens SX1
 (OMAP310) machines
Date: Mon, 20 Jan 2020 19:59:28 +0100
Message-Id: <20200120185928.25115-3-philmd@redhat.com>
In-Reply-To: <20200120185928.25115-1-philmd@redhat.com>
References: <20200120185928.25115-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Qc7P1q7qPk6jzoHsS-DwZg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +7yWub+jvqk8

Add the Siemens SX1 (OMAP310) cellphones with the other ARM machines.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 52fbc18566..27fbe1abb4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -560,6 +560,12 @@ F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
=20
+Siemens SX1 (OMAP310)
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/omap_sx1.c
+
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
--=20
2.21.1

