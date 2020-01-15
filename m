Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7044297lff;
        Wed, 15 Jan 2020 07:14:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhZ3a+smuqLdVzYPkHroysDoDdjVNwp3oMeR5NG9A1ddGeAo2qqL20CDC5PcWKCHtUahGq
X-Received: by 2002:a37:4141:: with SMTP id o62mr27270367qka.282.1579101249943;
        Wed, 15 Jan 2020 07:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101249; cv=none;
        d=google.com; s=arc-20160816;
        b=isenxO3PwnDLRrVyuIpu/rxjm3JcbxQxT8IRI6KEBEbCT4/V4wuzuyMV6zdqOG3ttk
         6GOlmuA/7GIRYBoWIYb6XViKbLc9IFfTYbyLXuFc1emXXw9Xh7+WiVfMD4SZ9FxUxB2P
         tFBFwKYOgRh8dOMcRhBt1fhzF+L7wtRA97/V3Wm0NtA5WCiqdZtPuSVicvXVl2XASr+q
         oShtMU5k2Tp2hwWDFvvd0JkuJKXD96ZSpYX4sRD2ZhkAEW/+HM8g3I8Lu62QPEKb54iJ
         TFxKfPb/loOlp4R0CZ+iUP6dgEVWM/VN9zutcxSWJNJvPKfuSL1k4o4qNQRa+naBJ40M
         si/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y9ndBPeKwsE+jjFBT4lAnMcG/cunJ5HpO3N73YwCRs8=;
        b=g52+Wcr6ZVMU52ghaRcpinZq7kB9IB87+Ciz+iJPoIS/U7N3whYMO2flBHF20oKo1O
         XKEsAWj+nurItkPu3KvsXT4fJJw8uX/YTGjuBB6qAEJg0+M2/vmSzlDiv5IFRvPCyBHD
         MtL8G0WDtI+a9faJbLJTDr8rBD/E8KgYcmboI3rvqjzl52X9b6hm+ciMgD03jvOnda9e
         9nRKD7AtoPMmdSWT61hVrwErsN2fwA6Vf99U8LYJAxCc0fEXOpcdel0ikOGrOvvB5VCa
         amTDighri2vV8+pu++JYzX367Q5Lihwn49BwmE8ME4Wj144Dwl61f0gFaalCgEZQ/UQM
         njRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EbjnPKHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l50si11076962qtb.185.2020.01.15.07.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:14:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EbjnPKHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkMy-0004DC-Ro
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJo-0007Jf-9Q
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:10:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJn-0007yO-4a
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:10:52 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58406
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJn-0007y3-1P
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9ndBPeKwsE+jjFBT4lAnMcG/cunJ5HpO3N73YwCRs8=;
 b=EbjnPKHL+t+Jh6xCIj85e/IZknV8Bgxaof6zOwKpSJaGXCkxFLCX8SzW52GtNyaxCeKxRU
 5uAtEUonFw/wGrBmre4KmwIzJdDo6h1QSE/Gyve4iQZ8rC85o/1CEaKjuw4iN3YYvapi8m
 flM5PW8y4yqErs7eydylnH3hs8CbV6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-9xRopltIOq2K0AHsATBuYA-1; Wed, 15 Jan 2020 10:10:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E331FB74830;
 Wed, 15 Jan 2020 15:10:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE9E28DFA;
 Wed, 15 Jan 2020 15:10:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/86] hw:aspeed: drop warning and bogus ram_size fixup
Date: Wed, 15 Jan 2020 16:06:24 +0100
Message-Id: <1579100861-73692-10-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 9xRopltIOq2K0AHsATBuYA-1
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OX8ZCG/suR2F

It was useless to try fixup ram_size and print warning
on guest access to config register to begin with.

Now previous patch made sure that SDMC can not be realized
with invalid RAM size, so there is no case where warning
and not used ram_size fixup could be triggered.

So remove now dead code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: clg@kaod.org
CC: peter.maydell@linaro.org
CC: andrew@aj.id.au
CC: joel@jms.id.au
CC: qemu-arm@nongnu.org
---
 hw/misc/aspeed_sdmc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index b398e36..942b27a 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -219,17 +219,8 @@ static int aspeed_get_ram_feat(AspeedSDMCState *s)
 {
     AspeedSDMCClass *asc =3D ASPEED_SDMC_GET_CLASS(s);
     int ram_mb =3D s->ram_size >> 20;
-    gpointer val;
+    gpointer val =3D g_hash_table_lookup(asc->ram2feat, GINT_TO_POINTER(ra=
m_mb));
=20
-    if (g_hash_table_contains(asc->ram2feat, GINT_TO_POINTER(ram_mb))) {
-        val =3D g_hash_table_lookup(asc->ram2feat, GINT_TO_POINTER(ram_mb)=
);
-        return GPOINTER_TO_INT(val);
-    }
-
-    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default %dM",
-                 s->ram_size, asc->fallback_ram_size);
-    s->ram_size =3D asc->fallback_ram_size << 20;
-    val =3D g_hash_table_lookup(asc->ram2feat, &asc->fallback_ram_size);
     return GPOINTER_TO_INT(val);
 }
=20
--=20
2.7.4

