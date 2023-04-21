Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1065003ejm;
        Fri, 21 Apr 2023 04:05:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350YouzK/1LBk1AMrndC2PImoCFnvnT3Vd7Ep+qYEROWhBgBKnM8nx0OD+ipqwct1iX/+ZxeZ
X-Received: by 2002:ac8:594d:0:b0:3ec:46e9:bc4b with SMTP id 13-20020ac8594d000000b003ec46e9bc4bmr8661131qtz.29.1682075115373;
        Fri, 21 Apr 2023 04:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682075115; cv=none;
        d=google.com; s=arc-20160816;
        b=Eg4y8iHKJ99Z69qWBj/iE7EHJNYqaulaxpdXIFbIlOA4zwKfA4t7jEK8xR6urvCwSI
         3HgKg0yQRdX7rEUIfJS7HFS74/qGS7HINYE/8bCo+cT1pN5gwQlEVIKtWcd9ttEV5B1D
         4RMEaUYB5ARCuwBiz1c7cf5YOgUMLDqK84TU7F2E5LE/ZCbxSDaCmBSNT6SNeMCFCeHi
         nazH+DBmPq1F5QggF0+rqeRV6+KuXMm9ZOU0VxGcrGFT6SSS8QdE6p7e473DiPHk01Di
         tERJvic0TGtXoY0ghNqRfbk5a/nt3D+b2u0QN4zIUCmAHKNAL67477+M3O138oyndIC3
         ZwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=YIJtDbG3OayU/W6Zcf/OjGztI5v0eORYpxV6WTHEZnk=;
        b=OHND0XWdebhWOjh57GvVXaFyzQfA4jqbas2ZJ1x2WBI9X0ySopnK9gBaKhXcfnahJW
         vBYh+Tvo1+cXifSAFQEX1qlmQd6tMqsz2TRUQmBDAupf9OCDHK5tsbO/mWnqCS2osk1d
         IutFEXhOGtMqAytOCG1NYhnONMxNWHQDfsEtIq9PhJd9ykYdPsBQMUc08hZjlVteB6oD
         pTQBT+CtICNDcFrPGt4GrPIF23vlwHUWhXa3TFZkIyOuekK5N9x1ftRahfidNg0iP3SE
         8RxNlJN1knwXQGT3h2GCnPg2Kp7fFbt6fPxT4Rc+Pyziq4nzydvB4js0XiFaN527R6zM
         gP3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="eGTI/8/K";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020ac85b44000000b003daa00c2678si3000743qtw.424.2023.04.21.04.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 04:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="eGTI/8/K";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppoYX-0002d8-Rk; Fri, 21 Apr 2023 07:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYW-0002cr-PQ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYU-0002Gb-Cl
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682075032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YIJtDbG3OayU/W6Zcf/OjGztI5v0eORYpxV6WTHEZnk=;
 b=eGTI/8/Kt4ZaP+u9+R74dppUWqZ5zYXIG2i9bvjgJI/Ac8tusiMpC91fs6i15pejaUpVIB
 MSCdOjUalI/g1d1pxRTliKlJgs3lNqKgO9rxSvudcet7zhECYPZHF+FGojXdS8N8DGlzOi
 qdKeodxxG49DhLnXZDaHKPzT3CUHf2g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-Y_vZUkkKOlW0_-QL-qNSHg-1; Fri, 21 Apr 2023 07:03:49 -0400
X-MC-Unique: Y_vZUkkKOlW0_-QL-qNSHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 131C71C0A5A7;
 Fri, 21 Apr 2023 11:03:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87E0B140EBF4;
 Fri, 21 Apr 2023 11:03:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: [PATCH 0/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Date: Fri, 21 Apr 2023 13:03:42 +0200
Message-Id: <20230421110345.1294131-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sGSqVFM6MVkR

Fix the broken ast2500_evb_sdk and ast2600_evb_sdk avocado tests.
See the patch description of the second patch for details.
Also add the test to the MAINTAINERS file (third patch).

Thomas Huth (3):
  tests/avocado: Make ssh_command_output_contains() globally available
  tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
  MAINTAINERS: Cover tests/avocado/machine_aspeed.py

 MAINTAINERS                            |  2 +-
 tests/avocado/avocado_qemu/__init__.py |  8 +++++++
 tests/avocado/linux_ssh_mips_malta.py  |  8 -------
 tests/avocado/machine_aspeed.py        | 31 +++++++++++++++-----------
 4 files changed, 27 insertions(+), 22 deletions(-)

-- 
2.31.1

