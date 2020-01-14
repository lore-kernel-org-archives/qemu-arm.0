Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5279278lff;
        Tue, 14 Jan 2020 01:40:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3ktpJPQ5eoyBC/jHaML3xDsK5PvY0fUaWrY8jDwg20UyhvLOlkTGqZyArmu/4YjQyJk0n
X-Received: by 2002:a37:a5d7:: with SMTP id o206mr20706049qke.227.1578994800247;
        Tue, 14 Jan 2020 01:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994800; cv=none;
        d=google.com; s=arc-20160816;
        b=e/cM4oHLS27kztnK77nz59C1Hz96uhekAxibrrJx9Pl78ciaZRyeqIJjcjHY6RTYSX
         tCIrLCMic9El+6IdjYXAUiLKCmNlPnDUFPiIiTRqqP9Gigs+dfkeJHyL9ZETh8K3Tj9U
         vwPUZgY3fz0gTOHG8Bm+4aGuzaLLKDhWAKdSDUqH12yzQ1A5OzrT2ZrRcnd6VQOyz7NL
         haX/tlS7feTDvpwXgejaHcO5LgwkITrLr71vljMLVibexoDWcdaWBhgaPjfaozcfnB3n
         Jjh7OBSXjxzd+yNHENkgdlL+SqKzayqPg9eza+s26uQreKNEfas2eVohWa0XHa5zZ2Nf
         oZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8qROkM+rasi7lNorWAKRMCcUO5bof/IxBRI/hTT2Oxs=;
        b=ZH1Nvl+rmj7n1+fWLGo1sLua66G3L7xiQtc9HWnclOMmzTLmLkglkg0bGKXrwCXah+
         cd8e2t+Guib52vvPVYFGUDuNV0rlDvE/1h78tL8SwpcsJ8rDmDd5+g+gSFMIqPzP9466
         IcRrVeqwQT+ziTUhr7cvJdyFB8rl+WeZfNsD0n9ocjdXEca5sqQd92YHMARL90fLxnRp
         HSCfal8nlz2FDkqZy4pmsLvNDbf7HUhZYEhyIo24W9T8GthwpIncbJS3MyBcq675YIX0
         GRPwc3dfnr+3I/iT7J8ijNejZ/RmgOY8eLyamLlLBld4y/uJ/PSfwJd0Oeht/Xn7Dy6r
         cnMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dWuZY7qA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g32si7752838qtd.253.2020.01.14.01.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:40:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dWuZY7qA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIg3-0005iD-2c
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIUf-0006wy-5c
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIUd-0006ga-2m
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:12 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54905
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIUc-0006gO-Vm
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qROkM+rasi7lNorWAKRMCcUO5bof/IxBRI/hTT2Oxs=;
 b=dWuZY7qAyg5yTFZjDvP8PzNyg5ys+4TmnnBrY2H3l4METW/XHrrH9HEE8wv/hmnkO7evfG
 fpnVDDuJHLCw351GMXdLyrEOToQLIBv6mqvO080HHnrscYolAGE0qILQOKhTVRjZ5Z4vbI
 eGhPlHIjCBn2fR5vroIhnJmwzp1mOPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-OWPVwAgSPDuN590HxxzBGQ-1; Tue, 14 Jan 2020 04:28:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42705107ACCD;
 Tue, 14 Jan 2020 09:28:07 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5B9F26181;
 Tue, 14 Jan 2020 09:28:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/29] migration/postcopy: reduce memset when it is zero page
 and matches_target_page_size
Date: Tue, 14 Jan 2020 10:25:52 +0100
Message-Id: <20200114092606.1761-16-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OWPVwAgSPDuN590HxxzBGQ-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M6CUtYYKzOah

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

