Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5939042lfp;
        Tue, 18 Feb 2020 01:44:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4GfQz4QWSE0PuJKeBGC6d5wiBX2cPvv+tRE32Bjl1mLQC84grc/xNM7oGCnkz4/vTUw2U
X-Received: by 2002:a0c:e014:: with SMTP id j20mr16420186qvk.165.1582019070665;
        Tue, 18 Feb 2020 01:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019070; cv=none;
        d=google.com; s=arc-20160816;
        b=RTk/kwE946OoYMjx6awBk/MW87aaRtT8B9nTQECgxv2k3FlgcUc7X8PtongfdQMbGD
         XFe/04SnPoVuwZJhdFFgBfHUf0BM/kmYpVGr78ElGvMX1OOMb75nQRjQ8GtwvjvuQINy
         L1R9Da/D2UP+wZSs8X4bjM3AMZ36tnWF65L2BsmE7j1TeLGlfb2m3POXT32a3/0iRUkR
         AEe4QQAXFvX6aKcvfFNZ2UgBQcguqUb6yMEN4N9Vz7Z/457PEYG+dntEfGENNlkrWQiG
         70zgEAX4PqAab6cIOpxpweoCaVWNqTNjGGyG9LBMI3QWSCSBDSnqFJhqQ723n/Rn3LVP
         nQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
        b=BfdluSCNnNSGNIzmzxBIQTOwVMOSl2afB72VDTR+8FRd5Mk4peOWo+4ngh0yJQs60W
         FRf0y0+F5Lrx7C/PO40uSWlNOCOoeBqLAamOwc0s8eXPeErMgwGJAVYyb4xMUOO7fu0S
         MiQPef49XgLCHasmuemOSyzHhxBjVnQMc1V9IpWuLrJp5oLeruamDzYpgX8Fi2WQfOaD
         DldXqdm0tIEzm46D0xu8xSqFmpe16eETMnsAtIyGpMeLryqxHDWkh3EOm7rIfTeTS3ga
         nJpFBzGdeFsBMaaywNECtrcmnXkH6Dyj7Vt8b3LQgntHAXy4XfnIbqmHxxobIqEhEoHu
         n55w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TyhAvfZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si1631219qkg.23.2020.02.18.01.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:44:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TyhAvfZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zQc-0001TW-20
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQK-00011F-OJ
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQJ-0005oP-Lk
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:12 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44199
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQJ-0005o5-IL
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
 b=TyhAvfZFBAgxqPhmiH31tk0TpljK98uGmic+0mM4/Z8MEsTjx4MqS7IUfENNBTFqxUdMoE
 B2KqzWpIgh4SnFaUcVwYc+baYSnp8EwylCVtoLMX2gvsvXAC0WSW9++NP8ls1RlR5EcQs+
 KIP7OVYqu1GYfp91NcvdxNUHeWxI0Us=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-9lBRjWzvNFaR6hkKlSEBWg-1; Tue, 18 Feb 2020 04:44:09 -0500
Received: by mail-wr1-f72.google.com with SMTP id n23so10500180wra.20
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOzWP1vq62G/ytTmsfycrX2X8S1L1HhF+6M2xyNPCUI=;
 b=TVGegOs4qd1U09XZfWFSqe+aRES21JBx96WTOJfyAAyDOVbn66V7Kkv+MOSvA8//Zk
 MBKcFJuYU844CHqXXf80/AuVFO43Qm4Xbp9MxfrBhon5OkG5YZ4Kfpgfc8ny2CQWE5kC
 2E6vTyCn2FRpzvqYNUGYNA7W8qiuaHmn4U9TPFY8eKAF8h00wWsyW3cozLRpAPmw0TOH
 xxofVKx7Gur74HKxevds4wJBtymvFHtrd9ke2WzYow3d4OE1og2NVvJGpvEpOONAo+Ux
 hyheUKLJr4g8BN8Ug35aAo+6KDHqFNIJlFUYQ3Qda6i1MLtWv4ovRt7Wtdy36VkBSDBD
 R7tQ==
X-Gm-Message-State: APjAAAXfm6VQiAvMojdto9ihcFOl6FtUW9pZEPh016pnRAZnYTu1/Pyl
 KI1yXyedQ1zfq2dEHOnYPnMs/J/nASiyRP0k4EXfH5s6N0yXSVWLiZEetBLgBwSQN8pQcZSsCtM
 tOfru0JYvonFs
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr29455595wrt.271.1582019047921; 
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr29455545wrt.271.1582019047665; 
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 01/13] scripts/checkpatch.pl: Detect superfluous
 semicolon in C code
Date: Tue, 18 Feb 2020 10:43:50 +0100
Message-Id: <20200218094402.26625-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: 9lBRjWzvNFaR6hkKlSEBWg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
X-TUID: x53g+joIpwiP

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

