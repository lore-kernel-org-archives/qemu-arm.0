Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5483363lff;
        Tue, 14 Jan 2020 05:07:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuMJffIsK4opfc7rVwOm3DbDK3EuUV6Hosr6CCI5Ad3AjXO3wsTfL+rzpvTrCzWswAhZrw
X-Received: by 2002:aed:3044:: with SMTP id 62mr3430192qte.61.1579007264888;
        Tue, 14 Jan 2020 05:07:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579007264; cv=none;
        d=google.com; s=arc-20160816;
        b=FiQHDCo4/bXx8NS65szN9wIwT8QkSzFB2+PF1KgJE/DPHqh3BEomBTGdzL+02mJpWk
         aQJZMp+t9oIdmZw+KvWt4ijQvnP9+0qUurTA8UqD52ZboII3gKRvUng5SbIbzbKnRrr2
         nZktXKWGtdxXLF0J/saRb9bw3Siy/PWl91qEsUMijD//pqLOqA+2ewWYNNldVUBB1Q+w
         W3RwK4HpRTDkWvt0wyyW/CgsCkzClzUz+N4a60i16txJ+f1nK4KexapHIUoZbZZky9Jc
         5klRbSlbKmCsyXQl+uxMwqbORbRxLyHwJ/2zBpN542ADjh3V4Hf2JGWcHwHAdMImHZAT
         fAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rjws/5txbKS/2cquBIMj15bFbdqcM/emabrksowPxSI=;
        b=Id8cRVk6NsN8Or2Qw/bZJF0GGvrVTiY2Sv1wfTEQyDs9CHic5/PB0deBY0YQD6/ouZ
         tNlj5YAJkhMH1FRFv7XPlzTu05EUDk8DR06zpVwxdUZQW4OXRlBl8R/U7KL3GQXlZXKf
         pesv3H/mC16f+845Hw/aB0tY8yCr3HS1+Y4Qj30S33Zq4aLxVLzD1n0BTFS81RK8+40a
         MSk6QEvK4T35NZnfpX1YP2RrNP/Y/+iJQRt7wAFwGUDvbHuuwUFrun4z8BEQhA936WMb
         d6GXhZU9cIjUN6igxArh2RlHYckNjHWbWhTejKj2vVfbHbAj2Dr9hwZrUWKgRSK+2KFH
         Az4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SRs8LC/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e66si7772348qtb.244.2020.01.14.05.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 05:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SRs8LC/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irLv5-0001jj-Te
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 08:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41419)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLjb-0003V6-7x
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:55:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLjW-00023O-LR
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:55:51 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35658
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLjW-000233-G9
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjws/5txbKS/2cquBIMj15bFbdqcM/emabrksowPxSI=;
 b=SRs8LC/bncJ+/xhb6YuSHM3fIuMm5ApUit18xzTbW9L/JY5rnKbqb/XiFuN0dEMjXKvea5
 fR4fzCvnH3BzAghc7CNbeqLV39zNPwTGJ8nN40ATXWygATIyGdRKNsutMtneAu8ijxSaMX
 AfxJLeP2ikeq1fchnqOPJD8MofpyV0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-wac73iPTPHOMXIwd8wUebw-1; Tue, 14 Jan 2020 07:55:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1363189DF4B;
 Tue, 14 Jan 2020 12:55:42 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA2965D9E5;
 Tue, 14 Jan 2020 12:55:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] migration/postcopy: set all_zero to true on the first
 target page
Date: Tue, 14 Jan 2020 13:52:43 +0100
Message-Id: <20200114125254.4515-20-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: wac73iPTPHOMXIwd8wUebw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ukEmRlQXZSdS

From: Wei Yang <richardw.yang@linux.intel.com>

For the first target page, all_zero is set to true for this round check.

After target_pages introduced, we could leverage this variable instead
of checking the address offset.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 391fe6e0e4..40c3fdd766 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4102,7 +4102,7 @@ static int ram_load_postcopy(QEMUFile *f)
             page_buffer =3D postcopy_host_page +
                           ((uintptr_t)host & (block->page_size - 1));
             /* If all TP are zero then we can optimise the place */
-            if (!((uintptr_t)host & (block->page_size - 1))) {
+            if (target_pages =3D=3D 1) {
                 all_zero =3D true;
             } else {
                 /* not the 1st TP within the HP */
--=20
2.24.1

