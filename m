Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5403707lff;
        Tue, 14 Jan 2020 03:51:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZSzTGImER/eWOL+iGYLNJALuvrrPS3iIIKw80fjoz+KwIMJK0uapddx4B7GrPgAmLIQ0I
X-Received: by 2002:a50:e607:: with SMTP id y7mr22584255edm.213.1579002694962;
        Tue, 14 Jan 2020 03:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002694; cv=none;
        d=google.com; s=arc-20160816;
        b=sZIc8SrlA7jO8iD+tzu68LBhMBSuzR7ZmIAS55o80BEEszkSx65+PQpZh2gcqKNFNp
         0dO2BYqoiOAr+F14Alu32O7hCTNAaua2Wsv3dclkU3/JRL8TkLxljNzAHbRYevoXN1M2
         TxPx0I8b8cKsyprN9cu7tyMLV0QBR+eTq9WKSLUrEP2QJ0lD9Ta3eWD9cH49fPf7b0Uu
         L1A2/3ENJTD4S1Cvn4zuEZ3etru6qxSj8qxIy4Z4lK4Yk3bOHdCTEXUYBR7Xoys8gJtK
         nsYsSD5DtB40fZSMlY6FVBUEk89g7LzUO+c9YQwaWUPD75AKV33wFL2lQesoH2XVyGB0
         4/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8qROkM+rasi7lNorWAKRMCcUO5bof/IxBRI/hTT2Oxs=;
        b=0wbDCmYZ7Ng9ZITnvjzmuzI0HJGD92SmoLuiQ0RLEPgee1z4IVcZ6SwnSVxh8D8pE4
         4bCFzKlUYPTBbO8ZGG9JN7lX+0Z0mZ7x4MmUzNyYzX53rkft+oOR/7XBpgUPtHYVBY20
         88x7M/d7wsCZJxpfi3wVQYKEeHItux7BKuxc3Gue3Gekw+2UlhJYNw213Y5LjJYYc/92
         68oesmjrPc0LQ0/4ub+k7rAQ/sFvpzx7gJSV8sSElt7KYjI/g8unUV6lJaojKp3DH7rM
         ztuqPjzPOftPAACBeQRjSp8xi9uafkjxkAa6FhPoSmIO1vRSXpBUVR6znqzkDQouDbQm
         QXGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IRsqmwOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si9466806ejz.100.2020.01.14.03.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IRsqmwOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKjN-00022u-Gb
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKZi-0006a7-AZ
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKZe-0003Qe-Lt
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:34 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26908
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKZe-0003QJ-IG
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qROkM+rasi7lNorWAKRMCcUO5bof/IxBRI/hTT2Oxs=;
 b=IRsqmwOQzjULEBhKBsoJYsEeRPKgUypXr8dkFFdxE1fSKuD2e4WZoyERWn6IUSbFZKsRBW
 rPF8elUW0t1KVuFg+9K2Gn3y6VjEfgnElELOQuBkaqtu9df9WQem4uvcCwJudRTp54wM+8
 7/qn5XVOTflRKCHUHJz5P/bOsyWw24A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-NdfgoCgsNVmpNhAlr8xhDQ-1; Tue, 14 Jan 2020 06:41:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB7E8801E6C;
 Tue, 14 Jan 2020 11:41:26 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 413CD5DA70;
 Tue, 14 Jan 2020 11:41:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] migration/postcopy: reduce memset when it is zero page
 and matches_target_page_size
Date: Tue, 14 Jan 2020 12:39:11 +0100
Message-Id: <20200114113926.3556-16-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: NdfgoCgsNVmpNhAlr8xhDQ-1
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
X-TUID: fgsZ57sGtAhv

From: Wei Yang <richardw.yang@linux.intel.com>

In this case, page_buffer content would not be used.

Skip this to save some time.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5cd066467c..bdb0316892 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4126,7 +4126,13 @@ static int ram_load_postcopy(QEMUFile *f)
         switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
         case RAM_SAVE_FLAG_ZERO:
             ch =3D qemu_get_byte(f);
-            memset(page_buffer, ch, TARGET_PAGE_SIZE);
+            /*
+             * Can skip to set page_buffer when
+             * this is a zero page and (block->page_size =3D=3D TARGET_PAG=
E_SIZE).
+             */
+            if (ch || !matches_target_page_size) {
+                memset(page_buffer, ch, TARGET_PAGE_SIZE);
+            }
             if (ch) {
                 all_zero =3D false;
             }
--=20
2.24.1

