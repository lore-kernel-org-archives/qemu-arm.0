Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp996506lff;
        Fri, 10 Jan 2020 09:44:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzM46fYa08203THR+FMLsxir8c9XURP4589zlheTwLSoxEE93IsbbwQbhCc8YAVvk7CjaYN
X-Received: by 2002:a17:906:52d7:: with SMTP id w23mr4368318ejn.74.1578678261282;
        Fri, 10 Jan 2020 09:44:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578678261; cv=none;
        d=google.com; s=arc-20160816;
        b=IW380F0ks6bP+/+dCNhYmE4UIw4l8WXXNdBSzEEcICJpCaxjCGiZR8VfiIPqsRXoHm
         PjmKQkvSPRs+WDh43T9BuQTsEMpwoeBMdRFGvcS8JXNmH0jIbBSSXklWkzKPnEM7OyHL
         rMSf8nEHBMqhLeg3Z4msKjf2LIr++fVGNO9SZbivHmQSH8y/HB2dOMvSxzf7E80f2Lkb
         N+E0cZif7oaVOZMJfNCdiEgAqOxnugkkEBJFFLgfyxnmla/0W4+YGy3B+b1WK0/AU9Rl
         UPfJl0KZ2ptEhp6Hiah0BTW8pY6fWTkjieze8eoN6IvBLQQdhYHk/Tp6y83+1XQsmm+U
         Q99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1crBoDA7dZjLh/vd5aacO45W4I+MDUclKl+K7u5CGQY=;
        b=QvfhwPkMWWxL2umyt+Z8cMz2oAuPcpXSfmIPK0ldqgi6+Zytj6wUJ6MjopgvFcULvo
         99iok09WxZnh3ThhSBijiqTl6rFNLSokQx/nmKNxSoDDXobiPem2T8d7q9pPT7HDWKca
         wQokQ+RHt/4Qa0pS4OjiV6K2DARBUSQIbfPk9h/xw+FdOshyEgSutlIfIYEmc+ROx19p
         JwHWE/brBaW94soSJncwQX5UunQwlVkaabAouHUBRdlKdUav0V/JyY44gw4AHh9c8+iD
         Hsi7F0uAA1TnZB7+C0Yax/ZSJv70h1eVkoATUQU4Mq2fh4EGuo9Ts30c1zYCfVdmuBZC
         f6gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=git4lddN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si1768732ejh.271.2020.01.10.09.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:44:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=git4lddN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipyKZ-0002m7-UG
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipyBm-0006Zj-80
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:35:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipyBk-000665-2Y
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:35:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44877
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipyBi-000607-8P
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1crBoDA7dZjLh/vd5aacO45W4I+MDUclKl+K7u5CGQY=;
 b=git4lddNDcHUi3D9b6mVFglhhhOXx3H2HAvzoZhkmPicLgPRn+IRPv81fQnbzsxu+TVc0s
 GQc9iPu9u0ioptCLjehdhep51UfTg6+P9Jy7Mo/D96ITIJ3pFjB5NUyx40EybeqwFKte/F
 86d5HL6Q1MAVLmMJIEHJoklxLYITnhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-C_aiEUGINXaif_n-gJJJwQ-1; Fri, 10 Jan 2020 12:35:06 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD9501800D6B;
 Fri, 10 Jan 2020 17:35:04 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1CFB19C4F;
 Fri, 10 Jan 2020 17:34:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/28] migration/postcopy: wait for decompress thread in precopy
Date: Fri, 10 Jan 2020 18:32:03 +0100
Message-Id: <20200110173215.3865-17-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: C_aiEUGINXaif_n-gJJJwQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O2MOOSbjMeRg

From: Wei Yang <richardw.yang@linux.intel.com>

Compress is not supported with postcopy, it is safe to wait for
decompress thread just in precopy.

This is a preparation for later patch.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 6702a3203e..f9e6f20024 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4421,6 +4421,7 @@ static int ram_load_precopy(QEMUFile *f)
         }
     }
=20
+    ret |=3D wait_for_decompress_done();
     return ret;
 }
=20
@@ -4452,8 +4453,6 @@ static int ram_load(QEMUFile *f, void *opaque, int ve=
rsion_id)
         } else {
             ret =3D ram_load_precopy(f);
         }
-
-        ret |=3D wait_for_decompress_done();
     }
     trace_ram_load_complete(ret, seq_iter);
=20
--=20
2.24.1

