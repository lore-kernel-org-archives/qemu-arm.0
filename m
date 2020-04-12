Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3081927lfm;
        Sun, 12 Apr 2020 14:11:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJiAR7dN1l7RUPajfgrxzFCHZ4rxMVIermq3n5I9hxISBRPWu2WG/i0mL2ukkza+9lw2ZJ/
X-Received: by 2002:a05:6214:132b:: with SMTP id c11mr14079582qvv.150.1586725891947;
        Sun, 12 Apr 2020 14:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586725891; cv=none;
        d=google.com; s=arc-20160816;
        b=GavqOtqcsKUnuLK75W+PXLhU5NwgI8lwP/xl746oswJhcdIOUON12z/bDwmof/mCKL
         aGWeNcommX+auR7QhGzLPOf25K0XJt4sHvC2idLe5KJwCUAehitop5kpBLtlseWHHD5N
         ZBLZAxQpyw4QLicYIGlkd2c1e+dIBTZZpVoICPdR9BJAo5vz+tfCqDNXjUIJPMVTYRy2
         CdcODUbcyB/7U45oVVLVJdBNkf7lAuqY4fNclQA+3pgj+8XhhGWloQU8FsGre/4TdEHE
         rGrKxKXiJeQF2cr3U/w0HDywrG6Ej+eEm6qjCeknOunzXW81UroA3H2Glg7wkasJdSSm
         ga+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=78jL4VADjrh0P46dW2DeDq44Jyf+SdDfu3arjlW7LnM=;
        b=ay+wrs87XFpcqEbKO1NkESDyJMQ9j7d/cp8d/2BsEVGmbA0m7mB8VB3t9clhN9fEco
         ztAP5UE4KzrURs2iJPs5T38OsR7LeBxXCCW5gjpwRVEBiKdhUwb4ELZ2rNMvo00n5QbJ
         2f91gwxhq+HMDcgea2MHqBsJcBDtK79UJoIa4u0ucYqP6t27vuKdoUFfKXZ8PZL9y7Qc
         2BX82OWtjku54YeYZFmZ+tXCvGBUrhzmNhIMDSKDsBf2YNOI2PJnkjzco/w6YlajkMyb
         funcj7/vxCPBRm6VPDmYUylLdj7SDtrUk90k9M1jwH/NNKRUsPcuc4DZy+34qa7bulbC
         MVgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OxkjuSkW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si313462qkv.100.2020.04.12.14.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 14:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OxkjuSkW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNjt5-0001U6-BA
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 17:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjre-0008AH-6s
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 17:10:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrd-00054G-7d
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 17:10:02 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36960)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrd-00053y-1i; Sun, 12 Apr 2020 17:10:01 -0400
Received: by mail-wr1-x444.google.com with SMTP id k1so1172704wrx.4;
 Sun, 12 Apr 2020 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=78jL4VADjrh0P46dW2DeDq44Jyf+SdDfu3arjlW7LnM=;
 b=OxkjuSkWJAFZSnNM8yGetjkdEAeKalwtCudr2Vh2d27xI1BS4ILr7L9uBODjpRJkpH
 R6D8YXX/p+XUqNrFQIAz93kwaViDm5mQpiBuOecCeCVBz4yojSdNqw6Ipl46gFGlzf9r
 g8Cm0L+Z0C4mTbJh2CzJAY1wv+iIGBJ1VnGSQPeoXju8w0uYyAB0pz5E8h0xKz80Mxci
 z074B0Y4PP1p9TvlgPyvgyIT792lXRCe/qHu6rPI5r6pePkQJmyeyZz3JKxyhm2cJYbS
 4YYIUqsp56tehGunUkN7pmQHzZn5tu03tfUy2aBHiRpXOWFa841s50yv6YsU3qC+BikH
 QIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=78jL4VADjrh0P46dW2DeDq44Jyf+SdDfu3arjlW7LnM=;
 b=cvCpoIE46j1TFKDgDgesNV3aNacL4GD9a8XVF4ycsqYYTcjWBD8F8mVz0Trdp2eKTx
 TPoBVsWQBOwZgshvzPu6aZDzWMRLwzBgxQMC2MT+xmGKnPzKPQkTNv1ZZrmyaocNCqhF
 uQSWrePZL4l0L7Lq3mVI1vOdc1OQt/dM8yKcIzvcc8zrl0hWH5PGciD0cBiBZt9rc6PT
 piAGq+rZe0s2wu4qZS0UwZNOYuhF/ZaxG52DufMYLdd+S5vaumgJcsX5UcaQplgYJ9ki
 xHv2EOlqlbcCB1yYnzgv73mPG12ZCbrKKNeJn6A8Di3C1zs1fWPf68vqUp38GLdDdPN5
 NVpQ==
X-Gm-Message-State: AGi0PuZKUbinoh+8yNOrofSBOyZHQ83PMbRo4/6Q60Nehnz7U5VzHNqE
 VPZMyB8/JHzW6jtmSXiB50E3An0utJw=
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr5945448wrv.260.1586725799424; 
 Sun, 12 Apr 2020 14:09:59 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o16sm12553602wrs.44.2020.04.12.14.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:09:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 0/3] various: Remove unnecessary casts
Date: Sun, 12 Apr 2020 23:09:51 +0200
Message-Id: <20200412210954.32313-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GiEcS4LN7YrZ

Remove unnecessary casts using coccinelle scripts.

The CPU()/OBJECT() patches don't introduce logical change,
The DEVICE() one removes various OBJECT_CHECK() calls.

Philippe Mathieu-Daudé (3):
  target: Remove unnecessary CPU() cast
  various: Remove unnecessary OBJECT() cast
  hw: Remove unnecessary DEVICE() cast

 hw/core/bus.c                       | 2 +-
 hw/display/artist.c                 | 2 +-
 hw/display/cg3.c                    | 2 +-
 hw/display/sm501.c                  | 2 +-
 hw/display/tcx.c                    | 4 ++--
 hw/display/vga-isa.c                | 2 +-
 hw/i2c/imx_i2c.c                    | 2 +-
 hw/i2c/mpc_i2c.c                    | 2 +-
 hw/ide/ahci-allwinner.c             | 2 +-
 hw/ide/piix.c                       | 2 +-
 hw/ipmi/smbus_ipmi.c                | 2 +-
 hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
 hw/misc/macio/pmu.c                 | 2 +-
 hw/net/ftgmac100.c                  | 3 +--
 hw/net/imx_fec.c                    | 2 +-
 hw/nubus/nubus-device.c             | 2 +-
 hw/pci-host/bonito.c                | 2 +-
 hw/ppc/spapr.c                      | 2 +-
 hw/s390x/sclp.c                     | 2 +-
 hw/sh4/sh_pci.c                     | 2 +-
 hw/xen/xen-legacy-backend.c         | 2 +-
 monitor/misc.c                      | 3 +--
 qom/object.c                        | 4 ++--
 target/ppc/mmu_helper.c             | 2 +-
 24 files changed, 29 insertions(+), 31 deletions(-)

-- 
2.21.1

