Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5934210lfp;
        Tue, 18 Feb 2020 01:38:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqy12LCxX38b22FqCRnt2nMGuIVNf8eMQqJlRvDZ6nzTkTXMX+M8Hqri0hqeji77vhekRlZF
X-Received: by 2002:a05:620a:311:: with SMTP id s17mr16842638qkm.89.1582018680206;
        Tue, 18 Feb 2020 01:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582018680; cv=none;
        d=google.com; s=arc-20160816;
        b=tUBySxj4ToMz5BNmvdozDNmuM5kjGOJXdWBd/4KOqJ4OTxvQL7GIbnB+jvjPGblHoK
         IYaFEafEkA9w8revbwqse60tZmZWKxejoX8TMMOGUCstjcOqCWjcv9/lJTXvVryzhEWe
         PEtMWTjCayPqOk0PbpEMeA1yQNh7XyL/gTmzcQ0qmdrCDr+1pFe6VqjwnTdECYXplZc8
         PXJxRUWcvS36CvVAOdCnz1B9Azzg2CcaQiCUD108bQPy5sChTxe9M6fzS3w+Ep/sd9h/
         /bk9Rm8XFUVGuVs2TlKmXozzyR6Hym9+04C1MjRaTNm+y9aAhBkrBPGWD4I6ayACx2HL
         ptZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
        b=pv9j7rT2eWrvwqCRJQ3iifbeT3zXmyTedNbi5p57KoPQgM6r4lrcAU2suWhRQtA4rN
         rZLEqz0JU+NPyqO8nqiqKXLeb0sATzLQt3L/UGE4/NO+MjlXikR64KybLUirRujtBbPr
         xkB3jSsmE0C1ye0EYgW+u0+lRsRjjH4GwA0CVTBYvNWsM5oX7En/jlw66SLzWDqDT/kF
         zyMt1g5WimIsNz/lFuy9Dqjy25LTZSoNuZLP2q5envmbOGioY8ZmBHVvhoEXFKUGQBW2
         ZZ0OM4qbBdls3RpQF5RMQ7QFmImZcPGSVMXAwQvOktdfgW8CeiyaGuvHCzzicZ3y8BTw
         SdqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aSeTGiVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si1653719qkb.307.2020.02.18.01.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:38:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aSeTGiVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zKJ-0003VR-L9
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zJp-0002q8-6e
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:37:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zJo-0002z0-3R
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:37:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21818
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zJn-0002yI-W8
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
 b=aSeTGiVL2ZdYVRPDP/gotU7SXkqSKzQBJSiueitgHDnx3euuK0nB2Unv62RiQ9kI8kRpt+
 LpE/embehqssmjZkEW0hLpt/aSDA9VjQbmYmaqXGXybVnLsHmVz4gEc02MphwlZyuMadZy
 zXGbY+OEuddQRQH5tDavVwg1PWhLpwM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-sdqIfjN9O9OECzk-HFMFIw-1; Tue, 18 Feb 2020 04:37:24 -0500
Received: by mail-wr1-f72.google.com with SMTP id w6so10499302wrm.16
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d11KEHy00cHcmoOZmfkiJiWUsKxIDwvg0E/JJImsCd0=;
 b=ntHDSs/oTOfQHPdeGdVpcRSwrIZsXRMQLqD8K1Q/gtkd6p5W6aySc6iX4giQvq3kRe
 XdX9BrvTnz+z02FBFxy1SXAsUEc2oxji+R4uBgcsBqTG0a+l4tVEJkJJXHWFzIvfdg3d
 98fKKiA3coW0BOppVsc+IPbElUDr8jJGqgh5HaoTs51ucQoW0287dNMruT2eCMlTlrIM
 3y3U8njG9OLEVicAisUQPFJCXzvikkmk1wTc4FVf0VPLI4qd4D9KRK9yOq+oZL5CQfng
 6yGWn1lfvXc4MQKlTCUi4g4D6cg8q6fzR3yBSKRSFJujO6ZvbCI4WccKwx+AecTMLhGi
 A84g==
X-Gm-Message-State: APjAAAUOcJDS8sxE2FT0X24MP8vvhJk9/p2z7I9Y9KUXCXfBkg8vwChZ
 GZUCXJz2m/tvHDHDPhOT9WmtyZLp6Mgclwiag8MISOSyl30tHRzvpUem1uLre3wjtOwD41p3zOz
 qrSlNcyvObwAi
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr27161715wrp.17.1582018643918; 
 Tue, 18 Feb 2020 01:37:23 -0800 (PST)
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr27161672wrp.17.1582018643684; 
 Tue, 18 Feb 2020 01:37:23 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id 133sm2817232wme.32.2020.02.18.01.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:37:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/13] trivial: Detect and remove superfluous semicolons in C
 code
Date: Tue, 18 Feb 2020 10:37:07 +0100
Message-Id: <20200218093720.25640-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: sdqIfjN9O9OECzk-HFMFIw-1
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
X-TUID: FWKO4QfkKujl

Luc noticed a superfluous trailing semicolon:
https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04593.html

Prevent that by modifying checkpatch.pl and clean the codebase.

Philippe Mathieu-Daud=C3=A9 (13):
  scripts/checkpatch.pl: Detect superfluous semicolon in C code
  audio/alsaaudio: Remove superfluous semicolons
  block: Remove superfluous semicolons
  block/io_uring: Remove superfluous semicolon
  hw/arm/xlnx-versal: Remove superfluous semicolon
  hw/m68k/next-cube: Remove superfluous semicolon
  hw/scsi/esp: Remove superfluous semicolon
  hw/vfio/display: Remove superfluous semicolon
  migration/multifd: Remove superfluous semicolon
  ui/input-barrier: Remove superfluous semicolon
  target/i386/whpx: Remove superfluous semicolon
  tests/qtest/libqos/qgraph: Remove superfluous semicolons
  contrib/rdmacm-mux: Remove superfluous semicolon

 audio/alsaaudio.c           | 4 ++--
 block.c                     | 4 ++--
 block/io_uring.c            | 2 +-
 contrib/rdmacm-mux/main.c   | 2 +-
 hw/arm/xlnx-versal-virt.c   | 2 +-
 hw/m68k/next-cube.c         | 2 +-
 hw/scsi/esp.c               | 2 +-
 hw/vfio/display.c           | 2 +-
 migration/multifd.c         | 2 +-
 target/i386/whpx-all.c      | 2 +-
 tests/qtest/libqos/qgraph.c | 4 ++--
 ui/input-barrier.c          | 2 +-
 scripts/checkpatch.pl       | 5 +++++
 13 files changed, 20 insertions(+), 15 deletions(-)

--=20
2.21.1

