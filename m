Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5492053lff;
        Tue, 14 Jan 2020 05:14:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsEBQr12Q9MTNYnnTYg/dGDoxS9e9BCQhPezLWabdfH75nEKTS3NSpAIWmEu0FLycCcZ7c
X-Received: by 2002:aa7:d294:: with SMTP id w20mr22820747edq.134.1579007699771;
        Tue, 14 Jan 2020 05:14:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579007699; cv=none;
        d=google.com; s=arc-20160816;
        b=dS72cVo7uh6KAm02oWD5OsuY55mwqlnNNmLWk+O+0OwThUbZONRHenP5t9XIeOg69U
         IRsI/jsGzvwZs7J1mA1iQC940uvwbg9JK15V2FPvd5IBvS0Kk5SVTw846uVCQ2ex2vFj
         zAxe/C1KfrgTqqerfbts//DWW4UFOlfAEG6+3fIGf3GnHrJoqJdTFBvlGjFloQmBN7TT
         k8RCsst+l/NJiqcyUjMyPA5kAuZ8WYVcTvO/YcFqIDKgZjK8HuWcia5AmHj+kRLZZ10T
         UQKvntLuruOqEz4fWptW1zFIPgi+IMt02Q01PwSMkB0L3WJm2wKsV7sYhaCVZz+ss9kG
         U7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XK5ACN6K3OKAgei9Uux+P4frL0jlH3g3VMOxRzWVmRg=;
        b=0djC7P7pK5SXfszFnmbFuLB3PqW25X/eZosAIeBu2YI9dPTFxKPZ1uVa2LUzdtRQv5
         fmuy4pZ1daIxkt/lCcWQYWa3i0uKKc2dhXrTOpiSzI+lERdDtEt5nQ53Jdx5uSBvBpgI
         r+vampSrIWA78G4tx1CO7f1jMaPcQJlkvqoCrJEnk5CZQtbRS3r9mvpC7QVF0udU/4b5
         JWFg4luhMJE5D0Q4cchNk5GFoHm1/2EM3epuQy7wQy0titlN+C0BVc6/hziX7qNjlMr8
         T/sEcyUbAdJLqNmFccbtvqgdI2f+rU+jFKpl3Nv/p9S8GdnLDfJVt12PMZboiS4/bSTn
         3kGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UNsZVfsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26si9298736edm.328.2020.01.14.05.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 05:14:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UNsZVfsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irM26-00039J-BA
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 08:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLk3-0003vZ-Rr
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:56:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLk0-0002Dm-7g
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:56:19 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33627
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLk0-0002DX-4Y
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XK5ACN6K3OKAgei9Uux+P4frL0jlH3g3VMOxRzWVmRg=;
 b=UNsZVfsqMlOU3674GNO+Us9mg2K5056PQiYFz636HxLs9rXABsvaw9Ue5ccoiyMjzH8ZdR
 Ogp5DLVYd7CILZ9bJadqdOuu7CCfWW03/Soh62dAIgaC733m21Mfbev2KZDYwqXZBR7jvd
 Jmgh+p1oNhzpImGZmUE72UGYkINpHaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-V-4i7RvKOn6pcCaUYKAg_w-1; Tue, 14 Jan 2020 07:56:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68817189DF40;
 Tue, 14 Jan 2020 12:56:12 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2D985D9E5;
 Tue, 14 Jan 2020 12:56:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/30] migration/multifd: not use multifd during postcopy
Date: Tue, 14 Jan 2020 13:52:47 +0100
Message-Id: <20200114125254.4515-24-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: V-4i7RvKOn6pcCaUYKAg_w-1
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
X-TUID: BZDNLdnBieCO

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
index 561961ef24..aee057f7da 100644
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

