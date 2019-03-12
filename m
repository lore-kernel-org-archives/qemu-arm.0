Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1003334wrs;
        Tue, 12 Mar 2019 15:56:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnrQ50NRApnHQuUo4MdtP9298fcsYt6I8aW8ajIFb9u59QHl+y08pcfk6HIOYt6oSB5b+c
X-Received: by 2002:a81:1b0c:: with SMTP id b12mr22241047ywb.371.1552431416375;
        Tue, 12 Mar 2019 15:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552431416; cv=none;
        d=google.com; s=arc-20160816;
        b=YDGAdSFTMdqim9F59j26lG5CW4ITgQpX+lbQ9pjvGSVcoTur02osHbMI10F2HzIUoS
         4ubdpbdLXxkt+z8dM+GXhQfETqR7UzuBtaoK0Nns/HYMFxPxUCG8+c4EstF6wYds9q8p
         r9pFAHNK/CN2BttuPzVBUqUVNcTjJDddCRSBO5p7x+DKL/ey1fMMxs45thZx+axeKZAv
         wacMmp5q3qTWhIXPyIH+ML+bse/ikq3IQF1n1uhx0V5AjqpLVNhJsY9n/l/Smwv8hxfT
         QRs0dqyG9aARugZQFR2DOjkXjQ82axVbsA1YUvHCINdcL+gIaDCxOEUoKzd+BuhheStO
         4xyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=XWoPhrONhrWDQyd5g6aPXUoBsT++IxdVPE1FN2SsyY8=;
        b=o7SZkO5pkQi4yaRciUlCCA6MeoC3qLDBA6+FUj9e1vvKgEcwPcH/KFFTHG1ukGjHo3
         86XkzFYY1LfOX6wI48PmKE8U+NjqW5zXspeEZg1D+KaFuz/FR1CvlA37qStW35yCWW62
         BDuraSQUBunQ7rbct0zv0j2ZeiepdGrZBCknd9ofyiKOvon1y1fku5kn1+0hgrhR1pnq
         Qykic4rstfZqnOwvpqE1VJdrRXI4uyEE1iM7vTvk3KhbJ07aQbLhQGfmon9ej143ib9k
         Sby5mjbPrAE7eBFH26YaD2fSxV27ey2RSg3IligJVRpMJGseVIimk8UpDc3msFL0LYdy
         ADcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f131si5965591ybc.40.2019.03.12.15.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 15:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3qKN-0001hk-Pz
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 18:56:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qKG-0001fg-Na
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 18:56:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qKF-0005aW-I5
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 18:56:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36928)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h3qKF-0005Yk-8d; Tue, 12 Mar 2019 18:56:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77F7C3091799;
	Tue, 12 Mar 2019 22:56:45 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-23.brq.redhat.com [10.40.204.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0BF660C1B;
	Tue, 12 Mar 2019 22:56:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 23:56:28 +0100
Message-Id: <20190312225632.29777-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 12 Mar 2019 22:56:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 0/4] fw_cfg: Add edk2_add_host_crypto_policy()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UXjQKtQrokzi

Hi,

This series consists of:
- add fw_cfg_add_file_from_host()
- add edk2_add_host_crypto_policy() and the Edk2Crypto object

The Edk2Crypto object is used to hold configuration values specific
to EDK2.

The edk2_add_host_crypto_policy() function loads crypto policies
from the host, and register them as fw_cfg named file items.

So far only the 'https' policy is supported.

A usercase example is the 'HTTPS Boof' feature of OVMF [*].

Usage example:

$ qemu-system-x86_64 \
    --object edk2_crypto,id=3Dhttps,\
        ciphers=3D/etc/crypto-policies/back-ends/openssl.config,\
        cacerts=3D/etc/pki/ca-trust/extracted/edk2/cacerts.bin

(On Fedora these files are provided by the ca-certificates and
crypto-policies packages).

[*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README

Since v3:
- Addressed Markus' comments (do not care about heap)
Since v2:
- Split of
Since v1:
- Addressed Michael and Laszlo comments.

Please review,

Phil.

$ git backport-diff -u fw_cfg_edk2_crypto_policies-v3
Key:
[####] : number of functional differences between upstream/downstream pat=
ch
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/4:[0022] [FC] 'hw/nvram/fw_cfg: Add fw_cfg_add_file_from_host()'
002/4:[0085] [FC] 'hw/firmware: Add Edk2Crypto and edk2_add_host_crypto_p=
olicy()'
003/4:[0002] [FC] 'hw/i386: Use edk2_add_host_crypto_policy()'
004/4:[0002] [FC] 'hw/arm/virt: Use edk2_add_host_crypto_policy()'

v3: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg02965.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg02522.html
v1: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01598.html

Philippe Mathieu-Daud=C3=A9 (4):
  hw/nvram/fw_cfg: Add fw_cfg_add_file_from_host()
  hw/firmware: Add Edk2Crypto and edk2_add_host_crypto_policy()
  hw/i386: Use edk2_add_host_crypto_policy()
  hw/arm/virt: Use edk2_add_host_crypto_policy()

 MAINTAINERS                             |   8 ++
 hw/Makefile.objs                        |   1 +
 hw/arm/virt.c                           |   7 +
 hw/firmware/Makefile.objs               |   1 +
 hw/firmware/uefi_edk2_crypto_policies.c | 182 ++++++++++++++++++++++++
 hw/i386/pc.c                            |   7 +
 hw/nvram/fw_cfg.c                       |  23 +++
 include/hw/firmware/uefi_edk2.h         |  30 ++++
 include/hw/nvram/fw_cfg.h               |  25 ++++
 9 files changed, 284 insertions(+)
 create mode 100644 hw/firmware/Makefile.objs
 create mode 100644 hw/firmware/uefi_edk2_crypto_policies.c
 create mode 100644 include/hw/firmware/uefi_edk2.h

--=20
2.20.1

