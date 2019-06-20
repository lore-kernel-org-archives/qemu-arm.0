Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1868126wrg;
        Thu, 20 Jun 2019 05:37:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw54hgFfcKtRdQOCXXzPPqAlfI06f+GObJC9DHleTjr5vQ3Q4OM4dNJk71pfUUpwBJcButm
X-Received: by 2002:aa7:c754:: with SMTP id c20mr96236310eds.265.1561034220048;
        Thu, 20 Jun 2019 05:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561034220; cv=none;
        d=google.com; s=arc-20160816;
        b=sbDYtGzZ6P3+Tug2WaVmf7N4+fSVa4fbvhPMcVmSOQ6H7q7JPn/MA+EoPP3R0EA0UN
         oqDtySX9Lv4aGEteFMTR8O/ruUMFijug3RZmG6JEhA6MYMijMbbgaxyMpaziDXqUNF2r
         ahrXST2o0vUykzUg7boJk5kb6esAol/FngpIGgqOTf2/hkyMfNGTe7UKVRSWcYJC01Vu
         IKpjDmZ/N7cgvh5RGRYEcvCkA9N8aSUXh80Z9z/LpyE5j3141dExV+gK7hpRLTKnc4JT
         Bo6G0HhyfQ4zrjiac8XxQVt7BSqnDNhPutfJL/BbkgdWfl4EJUmV325I5/HNE5MP9uXu
         bvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=2CmW7RwVdxO7XbWfxO9Z+JLKHymNYhiiBkIeLWuqUMg=;
        b=X5QluMxf2fmhZy+GAB2UHMkAZ1MoSta6q8cAgNToQNyYMrR+7kj8gsL51ZgH4KDxLo
         +aaupdBsmedAAXuQQIMUFc0KhpQfxQPrB84TtWLl+AupxN2Ytz2SJW69pTmnY5BSpexq
         TdHECEIlfSh7S4eDnxPQq6r8KztCJX5N3aXho4W2nqyAd3ncl7BkzInvh4ssMgpiOQbv
         WEuaWl/OFEn3jYbpr/mVikmZRnUoR+q5MuMnwkCm0WBuU2BfN4YVQPUmWEBlD6YO9gjP
         JdLzKoJzrsRfIka/XBA8Tz0M5RrN7kOHLiOitvPneMB1Uyva7kxbshyggTjpezH+DBq3
         hOVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si13082755eji.295.2019.06.20.05.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 05:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdwJG-0004RA-T3
	for alex.bennee@linaro.org; Thu, 20 Jun 2019 08:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34999)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdw54-0004Iw-5P
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdw4z-0007cd-MN
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:22:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33074)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hdw4o-00078m-SE; Thu, 20 Jun 2019 08:22:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E14953082263;
 Thu, 20 Jun 2019 12:21:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-106.brq.redhat.com [10.40.204.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF1085D9C6;
 Thu, 20 Jun 2019 12:21:34 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>
Date: Thu, 20 Jun 2019 14:21:29 +0200
Message-Id: <20190620122132.10075-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 20 Jun 2019 12:21:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RESEND v5 0/3] fw_cfg: Add
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nryI3zdfW8Ye

Hi,

This series add edk2_add_host_crypto_policy() and the Edk2Crypto object.

The Edk2Crypto object is used to hold configuration values specific
to EDK2.

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

Since v4:
- Addressed Laszlo comments (see patch#1 description)
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

001/3:[0164] [FC] 'hw/firmware: Add Edk2Crypto and edk2_add_host_crypto_p=
olicy()'
002/3:[----] [--] 'hw/i386: Use edk2_add_host_crypto_policy()'
003/3:[----] [--] 'hw/arm/virt: Use edk2_add_host_crypto_policy()'

v4: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04300.html
v3: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg02965.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg02522.html
v1: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01598.html

Philippe Mathieu-Daud=C3=A9 (3):
  hw/firmware: Add Edk2Crypto and edk2_add_host_crypto_policy()
  hw/i386: Use edk2_add_host_crypto_policy()
  hw/arm/virt: Use edk2_add_host_crypto_policy()

 MAINTAINERS                             |   2 +
 hw/Makefile.objs                        |   1 +
 hw/arm/virt.c                           |   7 +
 hw/firmware/Makefile.objs               |   1 +
 hw/firmware/uefi_edk2_crypto_policies.c | 209 ++++++++++++++++++++++++
 hw/i386/pc.c                            |   7 +
 include/hw/firmware/uefi_edk2.h         |  30 ++++
 7 files changed, 257 insertions(+)
 create mode 100644 hw/firmware/Makefile.objs
 create mode 100644 hw/firmware/uefi_edk2_crypto_policies.c
 create mode 100644 include/hw/firmware/uefi_edk2.h

--=20
2.20.1

