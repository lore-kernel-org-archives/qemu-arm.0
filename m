Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2742265qvm;
        Mon, 20 Jan 2020 02:56:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgDDF/KZJNUxzABmoQXGekAX2/cHUvqZGquEyFJzcX+oJY7AuQE5wJdDeUOkjBYwxHffKi
X-Received: by 2002:a0c:fe8d:: with SMTP id d13mr19300899qvs.150.1579517788450;
        Mon, 20 Jan 2020 02:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579517788; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1l88rarAggFb3lpJ8J+fgX+Oay/spptt7MZe5W53TwQRsK2CN5kmbcKPRWi2Mzo38
         q4Hzwx61zLNsIPWA/jp82e/f7wJ8uxiQCxHtIgIjvFUo91/Zwm06NQPyR+jC48g65G6Z
         Q1QQR2z2so/5puuKye8dt9bo208kuZJb+V8FHEAf5pGqXXLdURcH6Qp+G8G9FA3Sg1pO
         Q/OxH4XZtvGXLzYDuKgbmPR3bTyKBopjrNAOiN2b7FaJOIVGfHZt202+yk3BXb9x6Hqb
         XKcqa6biKhyO1Uqo//79nmKrCCL+VvqiohF0kGv3FOmOnt6xQgFbyBtAqMHuxOLfXOvU
         +KGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=500ZmFBEwikUlMIqphyR61O1txsRuYhX1wQe8tn04xA=;
        b=C5TcNZDVCJVqu0EdfNrQVKXPRfw332N8MKGw3rFezetlP1aCQExNy40NrVaEomG1nn
         /QWIEAflrMbZAkNo5M1mc5shD2jb1Q6v49apokkvDctk/pMQD2YzVgd3tE+ZKqCqan06
         uJVVZPEYLSh0h05WCbu63pwhm7lCW+WsZp6bEdojiS0QVJ++1fH7VWrtDh3/S+7TDJJV
         RAxWcJ074B35LvHUNCyYWJpVHDiNMjn55UDx/uRP9OqdF1eVipVDDKzDQG+JS9Je0gfs
         ZOxMwXsWqAGIRJyQv/BWco7/H+mQDXdnZQsLSLTPRYPiyHbLCHU9lLOoiNS4gm6mi7Xx
         8H6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SjkLegOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si20441640qkg.133.2020.01.20.02.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SjkLegOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUjL-0000GM-Ig
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUPv-0006Lm-2j
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:36:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUPq-0002hM-C6
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:36:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47321
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUPq-0002h3-8X
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=500ZmFBEwikUlMIqphyR61O1txsRuYhX1wQe8tn04xA=;
 b=SjkLegOGG+b1eNC5oHNox346uIIC/MKbdnb8/gDDitsTITmH+0l9PMvfizwU0ufkdAEeeP
 +2yXVfPqhhAfw30QJTt170SYfIW6CjPfkS3XNeOV1RAxluZaTPFSBrRh4kaRtKUPirRYcb
 zMClRDH2h9sztQ1JFPTnH9iYbbUZPwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-WPNmIy8VN9CGQj8yt4pAJQ-1; Mon, 20 Jan 2020 05:36:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 159D8190B2BF;
 Mon, 20 Jan 2020 10:36:12 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9754F860E6;
 Mon, 20 Jan 2020 10:36:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/29] migration/postcopy: wait for decompress thread in precopy
Date: Mon, 20 Jan 2020 11:33:26 +0100
Message-Id: <20200120103340.25118-16-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: WPNmIy8VN9CGQj8yt4pAJQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ApFrXBT2rU8L

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
index bdb0316892..c13b44b4d9 100644
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

