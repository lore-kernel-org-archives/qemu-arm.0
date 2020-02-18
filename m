Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5934015lfp;
        Tue, 18 Feb 2020 01:37:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdGp4yPWzORIOmn81FqDaphj4XJeHckd8+0zS8Ne1bD85o+SdiNSnlB42sZbjxua3j+Pa6
X-Received: by 2002:aed:3fa3:: with SMTP id s32mr16071087qth.10.1582018664227;
        Tue, 18 Feb 2020 01:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582018664; cv=none;
        d=google.com; s=arc-20160816;
        b=kO5PiBlfFDRdAyUoKcjI9tuiRxQ11gkNkRRhEDHDjxyyWnpgb1CONHoqQlxA5lK2nZ
         SzwT+kUuMs1TnA2oTRrYrIh+XRMTscFJSYAnI9eqmriR9t8BznOiW62CnkDnOc6gZgj7
         y0AnA4iHkouXtR0kJWirF28cRy5pmaUom4O0QLC+UkzsvFN4huILS93K6RvQpcnXhoSA
         /Y/T2b57b87ruVMvdLwdCmiVg8tmqkAcirMfLVwXqNMhKfSGw1VR8AucmqPUnV/e2HYu
         NpWzfxainy6sKYh7PRqX73GMBQeuF9zQQhDe8M/IjZs4ZHGP7Plgt9/nwjqb48uo47EP
         1z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
        b=dCmlPGn/U1SzLVkbI19n9OCYv92BdCpidD8wB36cyKu5JOsSoBfpeW3+ot8AgP3KjY
         7gVRY7TjcAL0EVOVKI8gdo9gJ5BA/9rV3vuSsH98E6wkGhwg95ZD0djlG+4kUKkXjPSd
         Lh1EZYVm6IyuuGIA/D5pIvy7ccYe3C4GCQ8jwEntF/MZ07Onp95GzdWNueh9kNsczm4a
         DagfagugmaxSUP6u72aYa3whS54QmYSYJEJRJ38splgTusL5M2E6NgtVJD7jUmtLYKSS
         ErSKjPfoZsPWHuJ8yXTU6lvIoS5xOSe5BA40Cbmcb867AVZnYa6WnEczPBMYqZ2xjtXg
         zEgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DzInd2ZS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si1478084qtv.327.2020.02.18.01.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:37:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DzInd2ZS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zK3-0002wE-LL
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zJq-0002rK-Dv
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:37:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zJp-000302-Ed
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:37:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25136
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zJp-0002zM-8J
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
 b=DzInd2ZS2wX5GNbrbSXo/XCQMSspGjp08c3HfexZ3voNYd6nSJnuvm5/qY6z8qiJ0t55zU
 ez5W1lrykZaGXY4ZQ3Pvj+u7U7p0s64In26TEiZIABpEHPEqTX4moIvTaevAXRUWVBajK9
 Ad2GZeB2J+CWATRT7QTTsIRyBK/Qsj8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-t4OaXm-BMDGqCOTMVBtnEQ-1; Tue, 18 Feb 2020 04:37:27 -0500
Received: by mail-wm1-f69.google.com with SMTP id p2so874190wma.3
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOzWP1vq62G/ytTmsfycrX2X8S1L1HhF+6M2xyNPCUI=;
 b=So5g2pZwoCzvMtaAy6tUqn6ynnsYJgJRZxfF32HVzbdQrS1JEK+lZH9aksVHuLOGHv
 1jbSn3ZO7RZXWEvYZJERvDYYrcdFyUuB3EFbKSEQGuoMVGt7ZHquNWZtEbxBeuojDFX7
 2g6jc6U7GOAwdN3M7HtVbX+exAnKrt2vsUmcJxVn/gaUUevsdFd05WDNkZ2tx7+o4wy4
 HgmIUaljRlVpf9PREphLsGEkP4Xos+AnyQWg5NnoS1QSjCG9bDwjyRnhjntJXrrtzOXI
 GrmMmaPHpHARDXCA37sKKFPEncQIW+5bQTUlUx7ug0398MEw0HeW+j3nCSXbOuuvquCk
 RjbQ==
X-Gm-Message-State: APjAAAUuc+ZaELgcjeWMKfZ+BiYE7gr39oXL7U0freZrL2tvWEUD2o2k
 EOrWGbnkpciutPHu3TdbvhC1M5VP6aOXxfNmiUKdJfsMIGrmmnIU5KQqOJEvH/Ne9wT2tcxEB1o
 gGBxaVi1Efxcg
X-Received: by 2002:adf:fa86:: with SMTP id h6mr27392542wrr.418.1582018645947; 
 Tue, 18 Feb 2020 01:37:25 -0800 (PST)
X-Received: by 2002:adf:fa86:: with SMTP id h6mr27392492wrr.418.1582018645661; 
 Tue, 18 Feb 2020 01:37:25 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id 133sm2817232wme.32.2020.02.18.01.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:37:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] scripts/checkpatch.pl: Detect superfluous semicolon in
 C code
Date: Tue, 18 Feb 2020 10:37:08 +0100
Message-Id: <20200218093720.25640-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218093720.25640-1-philmd@redhat.com>
References: <20200218093720.25640-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: t4OaXm-BMDGqCOTMVBtnEQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: enP085aLWIqK

Display error when a commit contains superfluous semicolon:

  $ git show 6663a0a3376 | scripts/checkpatch.pl -q -
  ERROR: superfluous trailing semicolon
  #276: FILE: block/io_uring.c:186:
  +                ret =3D -ENOSPC;;
  total: 1 errors, 1 warnings, 485 lines checked

Reported-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ce43a306f8..11512a8a09 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1830,6 +1830,11 @@ sub process {
 =09=09=09ERROR("suspicious ; after while (0)\n" . $herecurr);
 =09=09}
=20
+# Check superfluous trailing ';'
+=09=09if ($line =3D~ /;;$/) {
+=09=09=09ERROR("superfluous trailing semicolon\n" . $herecurr);
+=09=09}
+
 # Check relative indent for conditionals and blocks.
 =09=09if ($line =3D~ /\b(?:(?:if|while|for)\s*\(|do\b)/ && $line !~ /^.\s*=
#/ && $line !~ /\}\s*while\s*/) {
 =09=09=09my ($s, $c) =3D ($stat, $cond);
--=20
2.21.1

