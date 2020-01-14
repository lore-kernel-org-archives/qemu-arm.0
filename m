Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5422697lff;
        Tue, 14 Jan 2020 04:09:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1LM/O09Ha5Uyy3FptU/aQoODgXZ3zvaCP6+TIghFUOjHVWDkx4wGAWM0QxCw7z7WFN7uV
X-Received: by 2002:ac8:7155:: with SMTP id h21mr3042454qtp.95.1579003795777;
        Tue, 14 Jan 2020 04:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579003795; cv=none;
        d=google.com; s=arc-20160816;
        b=E61E/jGq2fpSRebYSwEtOR2fGVgEVcJCl2JPQkqOhcTxzV1Q1XoHoc9+dhfQ46v+TY
         IZbiPHFKfXe6x59n1i3tv/jrVEyBx0ogVV+sj1DBsXJCd14lgQxxCJnls+9k4mRrRTvm
         4RFC1h2rDV2G3yVS9CyJD5DirOGsnsxP7Al2vclzl1Srx6xq0r6vXlz1Gaq26q9/IITK
         a69mmlR4fjLdILlVzvF9MnpM3YDEa/XcbbjtRGm/pH/4dk2QSelpuUJuGllhtKBfy7Yy
         m247TyH8DGGYtLM8CjVMnnvaVnmFrnF4SjxoYyGitDOpDVXJwTm2svuLEy0w+BXVfOKr
         lKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IIwVucTBxYQHh/D708qdzqsHrM/CQ90ol6dt/BAftGg=;
        b=Ifzc/1oMyMrV8widuGxyhlCxAvgACPdShr/YnyXsG+4k+iqHM3NzrR5OyWZ8C9fKiA
         0fJTTfB1EMIVd1bak8gSRUWI+dNYWde300qk/gL8TJr9ljfjaq1kX5rb6tEeRKF/eIdk
         k2FYtB2b9pjliVpcq7+ByDGujPrM1eZZNVFEFBh2V1+OkGmql9n0dBJ9bVTDbSGd1rgr
         axT5Vp6cbxI0AGOaq1G1+2GZbQuIHiGyUTmVR4hdcJ4V5R7gJ0T4I99ngwxqmJe17anj
         MwctSGNuF09ve5rCmwqyKKOVIcVuxFGOsYTpQvXa93pFSeNsjTy2PgkPtrEIPFEH2B9Q
         LVAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SV6ZU/Qp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 141si8157481qkg.296.2020.01.14.04.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:09:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SV6ZU/Qp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irL18-000079-H6
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKbX-0001My-7a
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKbT-0003tg-B5
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:43:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKbT-0003tL-7s
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIwVucTBxYQHh/D708qdzqsHrM/CQ90ol6dt/BAftGg=;
 b=SV6ZU/Qpi68Nyjoknn/h5uQFQ1vLY5Qys4ZVofDqSTkgD4L6d4tWZrv7gmdRiQanwxyn4J
 VTDox9a7mHz8Y3bbENRwUDdxrK+qusQgEErsnn7ZtvSfMR8fcepZfq6klxdg6yHf/Bm8iz
 39Egb05V2UFhTjOc987HFyKml1Nu7xQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-LLQz-NbBOBuOimENzIiLxw-1; Tue, 14 Jan 2020 06:43:21 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6002D107ACC4;
 Tue, 14 Jan 2020 11:43:19 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CC0D5DA70;
 Tue, 14 Jan 2020 11:43:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] multifd: Allocate uint64_t instead of ram_addr_t
Date: Tue, 14 Jan 2020 12:39:26 +0100
Message-Id: <20200114113926.3556-31-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: LLQz-NbBOBuOimENzIiLxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rtMqFYVXARK7

We receive that value over the network, and ram_addr_t depends of
architecture.  Just make enough space for 64bit.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index d0940387d1..ba6e0eea15 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1267,7 +1267,7 @@ int multifd_save_setup(void)
         p->id =3D i;
         p->pages =3D multifd_pages_init(page_count);
         p->packet_len =3D sizeof(MultiFDPacket_t)
-                      + sizeof(ram_addr_t) * page_count;
+                      + sizeof(uint64_t) * page_count;
         p->packet =3D g_malloc0(p->packet_len);
         p->packet->magic =3D cpu_to_be32(MULTIFD_MAGIC);
         p->packet->version =3D cpu_to_be32(MULTIFD_VERSION);
--=20
2.24.1

