Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1224145lff;
        Wed, 18 Dec 2019 11:26:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqyG+rj5seUJyzEWn0z8mljm7t+RfZxMpSNoYg+WFIWw+Sf0Ix7gBxcmwoQ/EgEgRpxYZ5va
X-Received: by 2002:a9d:6e89:: with SMTP id a9mr4155202otr.38.1576697188942;
        Wed, 18 Dec 2019 11:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697188; cv=none;
        d=google.com; s=arc-20160816;
        b=YTyE3uQ+Nq55l++3KrV75nJuF2ruSzza/xB6zdMWi6ZjsxAG0a3O2CqgD19QhnwkeN
         59a9aM+Wu15tq1e/X0xwylOtxYiY9adBB9iiMXbCfH9NGoc232ZDSblV1Ca4BIMYFQZY
         3y/zMOTtFdlTHUGR38wjIAHfc7HrH1Jt1QZgn0yIY7fSE+BmBFbeOZ8wSsLfjCh2/naX
         nHSfhy9EnkK7fNI+QcpmjE7UkvZ4oNYoVxYOi1EsZGF+tWnSPOxwY5V7i45z3DTdBKk4
         nntdSO7TAlhtIESeZbSdwVCZPNW3UYg8Mrjy1atdnOs/tKC7F98rJ7jk9S5Lhp1Bkjwy
         9H/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=d8d3NOr/AJwNt7vzL94QAStUbvgp3xH1pd/+9y3hkZ0=;
        b=W5SFHu2SkKE1B6gbq5G8NlNjGpPJsDwUGbQ+itr93jSaOlaBtrAnpI2480g+jBjHaY
         DH4RiWP7Y4plp7JZHqCUGWNTXhj0eTp1NnW0lL7z8qVpLS5NmmqE4p+Gr2n/a746orjT
         pjwQLiUwjVjW/jvYxslFuYHNmu0GeX6rGQ++JDkOtuYXPyla66qyO7bbwC/YSCj5LavB
         biumZcvr5djHgof1nygU+0EU717hBS8I2uyskwGC5Ew74ie1Aj0O40KO1s8mlxDTmrDV
         FtUBUJlAvlOE6rVPe8LrXz4z0/dunsZMDAnjDQpkufiwS4rRvNcceCechNAJbVAsIgnD
         5x8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ek+mjTLH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si2062043otn.221.2019.12.18.11.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 11:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ek+mjTLH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihexn-0007wh-VF
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 14:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihexM-0007wL-Q8
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:26:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihexK-00035W-Oe
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:25:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52201
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihexK-0002yz-3p
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576697157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d8d3NOr/AJwNt7vzL94QAStUbvgp3xH1pd/+9y3hkZ0=;
 b=ek+mjTLHTOQcNSHk/dHQvj4eR83KV93+73b8c+gTvPprYH3OZw3El78yWY8okKL286EHuD
 yIFGAaSJ846GkBREMeXUTFUowvd8TuugzVJ3nxepl/dtuPmTugHQpZ10qyK0up3Cf2OB+s
 F3XNI4+Jetq50fEalq6qALa6bGotRzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-Q_lPehRgNsK5fS0IdCXJ9Q-1; Wed, 18 Dec 2019 14:25:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B8A6107ACC4;
 Wed, 18 Dec 2019 19:25:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1697D60C81;
 Wed, 18 Dec 2019 19:25:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] Fix more GCC9 -O3 warnings
Date: Wed, 18 Dec 2019 20:25:20 +0100
Message-Id: <20191218192526.13845-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Q_lPehRgNsK5fS0IdCXJ9Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Olivier Danet <odanet@caramail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Markus Armbruster <armbru@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uAa6nAD+b9XE

Fix some trivial warnings when building with -O3.

v2:
- addressed Thomas and Aleksandar comments
- dropped 'hw/scsi/megasas: Silent GCC9 duplicated-cond warning'
- dropped 'qemu-io-cmds: Silent GCC9 format-overflow warning'

Philippe Mathieu-Daud=C3=A9 (6):
  audio/audio: Add missing fall through comment
  hw/display/tcx: Add missing fall through comments
  hw/timer/aspeed_timer: Add a fall through comment
  hw/net/imx_fec: Rewrite fall through comments
  hw/net/imx_fec: Remove unuseful FALLTHROUGH comments
  hw/pci-host/designware: Remove unuseful FALLTHROUGH comment

 audio/audio.c            | 1 +
 hw/display/tcx.c         | 2 ++
 hw/net/imx_fec.c         | 7 ++++---
 hw/pci-host/designware.c | 2 +-
 hw/timer/aspeed_timer.c  | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

Cc: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Olivier Danet <odanet@caramail.com>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
--=20
2.21.0

