Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5930101lfp;
        Tue, 18 Feb 2020 01:32:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyFwLZLHAJ9ZTcyWIudEvxtNw+EyY+pDuyf4AIrTmGkrKf/LWRlVaIwnk95FBb1sUnNG63C
X-Received: by 2002:a05:6214:50f:: with SMTP id v15mr16113457qvw.42.1582018371294;
        Tue, 18 Feb 2020 01:32:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582018371; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGs16CUDgxOEPbUFBUHrGUg0YAmNwrX23WOnUWOGs/8TO8InDRQmzI8oyyNdGZVnO2
         C0ZTVA6P5ypBKZZlHtOjed7jgcZ81kpG0FLJfvQWoRXW/cGogPNykmpwoJt8jDxF7jx+
         cdrTHaVIjN2xNRfhZsUtJHs+RfOHbYMASPxprIwVO122cU6kNMkrL+pI58sETQOSsXN4
         KJZgYbQi5WxL+qxcdzyi+bg4dpTfK85LgV6KC6t5Ez1hBLUKTPEcQ1ghGP2T40jkL7D2
         AFYOJ+D66LDhPgNcejv11kSRkzNZEdw/94rEx3Dv6/GPiuGXIPKDTXVAZxXUZ+kguZ1F
         4A/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
        b=RmZXfzCvDQ9gR6+3N/XmW3DxjOuD7VaoA3lxFL/Rnp9U/S6fuRqU/nbvQSr9f/2cap
         Y1qlXobYh3wIwo9y9mq/2kgb5iAXhCG9UkbxFMDybDrak6GMqMRSa6tpXnpyCDuAX2rr
         mAb8BqM4yD7fvp3Gza7dpII00Hr7InT4DXzwybPGP0dbkHn1oCsCcmUqGFISYp+137TK
         +UMrinWsf8AHb60yppVjTCbQEHeJFsjQcn+djidbGKXFcEYfc4IHT8RQ0F2mmzy7yMK/
         dWFYLW7PXW4ISW+n4v9cATjuM2gFSs46gpcP8GXCokUSyJg/RshdflXRcGZJ2MC0wOIz
         Te8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bpUThqoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20si1387737qtn.3.2020.02.18.01.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:32:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bpUThqoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zFK-00069w-KV
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zF0-00067i-EV
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:32:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zEy-0001AW-Li
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:32:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53935
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zEy-0001AC-Ig
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
 b=bpUThqoZ/VSa7Mg25QML/HcoBQ3pFRc6nxLvMFdA8rEUkYCp+JkWYxeA2qtsaBhokmEsXj
 RxbZt8mMNvzlZK8MORtZ0PoOUe00uxnadoxwU/bJqzFvfVcjlBJHB73maSaideGxEiVFbb
 qM/EVd6BlKs5Gdqh+oc5eMqgQ6Sa7a0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-G4YT1sCENqSUpy4xvNu0Tg-1; Tue, 18 Feb 2020 04:32:24 -0500
Received: by mail-wr1-f69.google.com with SMTP id l1so10542295wrt.4
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOzWP1vq62G/ytTmsfycrX2X8S1L1HhF+6M2xyNPCUI=;
 b=py7Vu5e5qto9IXvtINPuSNSKqBb1OZ+KxdpnHCtSSpCryIOROY1vlA3V+Yg5wIGFi9
 ZJn9s4Upmto3Fxjh7Par5DteP/9JPKY73f4lkgy8vmrF/6FN/MSFjkuDt4tZdYsnnSt5
 bTKvc9dPMzgRHO3YmK8ML/kg3C4O17sQUhc2v9MJFnlq+O+mMhAlWPGYjHYQgGYAXjco
 H3gJlJ2L1Cbgn5HPM13gGRhukiK/CAG0+oiWEj8hir+gGUmOxV4IGJweSLjALGznbhh3
 FcGXLejT7liPdXMkNNVjdROE7sTFJrMsCPudrqCWSa85BWa7HWk5Wd4kNs22JWPzcMEk
 e2BA==
X-Gm-Message-State: APjAAAXWSJybbg5hMEud1Af6hRV8D9ZMju7dsf4dCtzTRz9FHRzXTZpe
 sGARIoK98MqAdYb8JLWFqsceP5d7ZZEOHXMFroVsZuiln93jzZT7TUakDd80YsFmgwp+e6znNzV
 kk0j4yCU6uQWq
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr2078137wmg.151.1582018343334; 
 Tue, 18 Feb 2020 01:32:23 -0800 (PST)
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr2078014wmg.151.1582018342204; 
 Tue, 18 Feb 2020 01:32:22 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id v8sm5146891wrw.2.2020.02.18.01.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:32:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] scripts/checkpatch.pl: Detect superfluous semicolon in
 C code
Date: Tue, 18 Feb 2020 10:32:05 +0100
Message-Id: <20200218093217.25156-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218093217.25156-1-philmd@redhat.com>
References: <20200218093217.25156-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: G4YT1sCENqSUpy4xvNu0Tg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: ZeS6/pK1K3f7

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

