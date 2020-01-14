Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5404806lff;
        Tue, 14 Jan 2020 03:52:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1LIkjE/P59uS/YdK5gHFEIpN2aq6AmuX+v+zkMqiMo6JWoMtgZIX8xzc7/MHYTxtHBiau
X-Received: by 2002:a17:906:7fd0:: with SMTP id r16mr22554399ejs.319.1579002771671;
        Tue, 14 Jan 2020 03:52:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002771; cv=none;
        d=google.com; s=arc-20160816;
        b=eAj9oZ7YCCBCpsgzNAOYFyc6gD0zHignGB0O39MEWCr+YDRwWhJXT7Spvk1jVvNPH1
         x6Zo179Gzo5xBVp1tUUIlchaipC+gz9A20WBSwkZUHKziU1oXTLMX7AoSUTz3EF/zQ8n
         POjhS38mv+52l4Mln9dCgFtoywJthoXqAWfvJ3mXjYHNe3pCmz5V/t49Ol92JUclMnH4
         gZoKRXRSNaVxgSnmJ427Wok1eqmwbLrnohjHoIzwMwTuFvpKQjnxrhX6YD1V5snjx9uP
         wmkNIj+kIi6XafjwD+jWWYuCtCJmOpiT96buJCM3XA2j5Gfmszwms2CDARFUc/OO079u
         lYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3VZqz3zUF2Y1jQsm5V0KLQ63Ic05gunHzewXnrdXRG4=;
        b=l9e3yv8IaPFgMpRGMQyFR8CFCJDiOKoQfm30H0yjLuq5Zj5WoJFhTPprLn10XDka0o
         DH20iFc/uW/yVGKzRXk4nrD/1iOq6yKC/XXfthl728hhZ+EHIun6wSUhiyeZcpYmmwlK
         RQU9SvEq6JxfsdcbYyOrldaEjMhAbH3KXPJjWacNtjcFvbMB3/EhpgF/kxZrAytfOx2C
         KMirfpkXQhRYqIzeYlB3i77+hQ52XoHZQrLIdTfHgabAX4mEdGzmeoWqFtgoJmHu5IS2
         /izHfRy24TTcUQeyzVd7jwQojWCU1CPqVluukHIgdlcjUzUqxz2z+Kh8WDG8PwASgE1B
         F9rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G6zdPIr5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rp21si8906428ejb.404.2020.01.14.03.52.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:52:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G6zdPIr5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKkb-0003fd-Qo
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKa2-00074W-Ci
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKZy-0003UZ-I0
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:54 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22493
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKZx-0003UN-Nu
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VZqz3zUF2Y1jQsm5V0KLQ63Ic05gunHzewXnrdXRG4=;
 b=G6zdPIr5N2uY3Njo/3QT2QVz3YKDoyJZ9kMpKkshXRpj5S1O+D4kfmuwgp8up2aTxdL3Hb
 DtSRPGUMPdhgYlUh1tGslh8rTQPqsIcp8J36BN6TmTkBtbQ9NZFJiPKwKw93+6/IWPRA0/
 NCQLNR5QS8i/YDIEYM07c/HTkQ0vF2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-mFPCDuHyNjyvmv79iySHSg-1; Tue, 14 Jan 2020 06:41:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAE3618CA242;
 Tue, 14 Jan 2020 11:41:45 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 373CA5DA70;
 Tue, 14 Jan 2020 11:41:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] migration/postcopy: set all_zero to true on the first
 target page
Date: Tue, 14 Jan 2020 12:39:14 +0100
Message-Id: <20200114113926.3556-19-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: mFPCDuHyNjyvmv79iySHSg-1
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
X-TUID: YK+mwGxF+hmB

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
index 8ebaea255e..460abfa2c3 100644
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

