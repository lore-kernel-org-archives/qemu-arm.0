Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5412983lff;
        Tue, 14 Jan 2020 04:01:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqzAQnFoe70yPRxiPfDJwfQ4+ZxeGliJ1C+yxt4uWaVbdrFbSP2vqDElVmExDwfRuxIBsu4S
X-Received: by 2002:ae9:e41a:: with SMTP id q26mr21328334qkc.288.1579003305563;
        Tue, 14 Jan 2020 04:01:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579003305; cv=none;
        d=google.com; s=arc-20160816;
        b=oah+DE43njUyErylM6zhR13ThMwa8DAnXu+0DS+MYsQw5/AHwJwfz55xYn2Zh/PODR
         3SeMBAeLaBbHYLy5NyiIW7+JFMbd2cCfO/yaOg/hzxzaPXfMOvHzGpYBFoXLrstgJWPI
         Qs0lXMWoh8B9Is1sTlP63AUrHSO0YwE2srlr2A2JCgrkDgopmIh2gjp+Ty1RCb0zhXci
         /W9/r/F0dvB1WKfbjnc4S92jeE4JOoCsocQ4CaNx366BeZJm1037wM+OZhbDnL1yQX4s
         9RkgRyGyWO63bq89wbtNSpgxrK22cO1LHU4wWj2vFy/iIid7RzHfTeGPN9MAHdD4fklp
         MWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iprvAOa2cyTKcfIq8nOi5Ry3fqn5kNfZVkcEZq0n1vM=;
        b=iYO4S2aE2BygSW16ohdawcOowPMWLTfoY4TUTNmnNopc+2uIXD9LkhquU8HX/LR3ky
         ngUpPCdpjfy2TssJ6BDM2+9zdFf6oAq1J8Rdh3Gyqy0wKVBIcD4FRtSqajLMgbX6eTJk
         Yd5GfEDS/PEwShT+nSzr7YZfbHiNkfApSOsua0qpCC939rCflYwjP+LIE6z21aSmSVMz
         dVh34BpyLtWwmJxV40Btauj0FObWee8QYTK3EIzrbYoRcSyYRJRXwMQ37tyyqaooY11i
         NhecYx1Hiz6XAG7HjUiLnxEb6hd8PLEH0cpNbDCl8uZfChTmcqj6z6uLngZoiStQcJnA
         QB2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FyeLFEon;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si8627450qkf.254.2020.01.14.04.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:01:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FyeLFEon;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKtE-0006QT-Nh
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKaX-0007vM-3Y
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:42:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKaT-0003fX-DA
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:42:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37551
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKaT-0003fL-8O
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iprvAOa2cyTKcfIq8nOi5Ry3fqn5kNfZVkcEZq0n1vM=;
 b=FyeLFEonRqP3WnhWoLqw4/PTTWciLlM14RDh0mo9lZfHDAEWUV+mUGgqHKV3DoUvlFi4nM
 vr4WfJLycGV6rg8zHK4YPfxHTfv8aIPOOddeqED6glhQ2vx/KgqnQ8mHMo/0rEqzBGD+tt
 izqsUMuoKbIpGwd0+T8e3bYem0aIICQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211--LqWf3sYMiq1Di-ceF2-zA-1; Tue, 14 Jan 2020 06:42:19 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9689F800D48;
 Tue, 14 Jan 2020 11:42:17 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A155D5DA70;
 Tue, 14 Jan 2020 11:42:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] migration/multifd: not use multifd during postcopy
Date: Tue, 14 Jan 2020 12:39:18 +0100
Message-Id: <20200114113926.3556-23-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: -LqWf3sYMiq1Di-ceF2-zA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hQ5YfV7iw6g1

From: Wei Yang <richardw.yang@linux.intel.com>

We don't support multifd during postcopy, but user still could enable
both multifd and postcopy. This leads to migration failure.

Skip multifd during postcopy.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index a05448c0c9..d4f33a4f2f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2587,10 +2587,13 @@ static int ram_save_target_page(RAMState *rs, PageS=
earchStatus *pss,
     }
=20
     /*
-     * do not use multifd for compression as the first page in the new
-     * block should be posted out before sending the compressed page
+     * Do not use multifd for:
+     * 1. Compression as the first page in the new block should be posted =
out
+     *    before sending the compressed page
+     * 2. In postcopy as one whole host page should be placed
      */
-    if (!save_page_use_compression(rs) && migrate_use_multifd()) {
+    if (!save_page_use_compression(rs) && migrate_use_multifd()
+        && !migration_in_postcopy()) {
         return ram_save_multifd_page(rs, block, offset);
     }
=20
--=20
2.24.1

