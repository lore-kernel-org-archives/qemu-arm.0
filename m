Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp138855lfb;
        Tue, 5 May 2020 07:44:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypJDqgRXrfaJ159GmB49x/fCvD0AkRzgIf5Ax+O44zlR4rErvX42lQpB+LS3HHRoRmsF60vO
X-Received: by 2002:a37:e50b:: with SMTP id e11mr4015023qkg.224.1588689890063;
        Tue, 05 May 2020 07:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588689890; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFlJe7ptcCTPfYmsHtBvTS0DS0rEtb3BGqCQWpoLlUiOpXbV4TivM8N2wP2QvrcDT9
         yJapRUkox1xYAW08kjM9mYnLgcgtBoP+R8qheNH161EG3V6Q9o3Hx669PpNVBtSYqem9
         +GOVyhiQZavqB+zZP97LYCnrjl0uTLtJfXJOb8d+QXZ53vz+yw8Cc49sx7SncA+79V7a
         SYKK8rGGOpPI5T7LcLZe5D9L6ox3n2u9nS31XaeCAXHaY35jv6/CqBe35iLrxxbHRu/V
         n40TEmot1zgv/QhkbSmrs1zZQ2ifW+jD/6Kb+pfLLteczriwTzgWBp4b3LgP9scwMe0K
         Ly/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MyKZTDKe7F8KBX8ZbYvm6ePCPzPrhuWDkxUqqUlOxPM=;
        b=cK4KN8Acp2bb9QpUaqQ0OUusZqRZEi1o2wSpBqqMoYtzJQiC0oXAYHz4YDMvmifbxg
         7mot/wRBZwTh+eDbVkX1twtEgCYhNYKi5d3ncUgl6G4WiiE8IkYJkWTBrkpj2AOfyhq/
         2hWZKmfF/uOFJWlC6a5knDljudYd11vkGkEoJolwnghqhztAvyX/G0rwkaXCEuUfZFN3
         CCjkP42PqpSB45/eUeRgD5Fx7Nq5R6M4AiXLSc7tVlRmSaco02/JvNrpBVqrM3wTiOMI
         KFGIz1FAksUrrmIplxdACeoEvgDla77Lqv/3gqTxJSAkuC/nmem9c7HfiZZsnlLSCpeX
         HEwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bhE3fgPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o138si1359015qke.48.2020.05.05.07.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 07:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bhE3fgPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVyoT-0005K9-9P
	for alex.bennee@linaro.org; Tue, 05 May 2020 10:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jVyoI-0005Jb-QQ
 for qemu-arm@nongnu.org; Tue, 05 May 2020 10:44:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28278
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jVyoH-0004XO-VK
 for qemu-arm@nongnu.org; Tue, 05 May 2020 10:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588689875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MyKZTDKe7F8KBX8ZbYvm6ePCPzPrhuWDkxUqqUlOxPM=;
 b=bhE3fgPXOxp6bzhzl2h7+O1vBAc+dYCtIQeGeaGh2lYa0Fspsf/rGGUB3gE6Dat+n1Yqz6
 lE/6eYFF9fO2YiBSvgYK81QQ3M4OY/TXZhuZZdQyebRBznJc8/Ulv34pl7/6RKV0GZsLXY
 UgmIA+T7are1xCqPGzpEkGd3yYkQiBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-Jew1JYCqMGOJ4gctq8vBIw-1; Tue, 05 May 2020 10:44:34 -0400
X-MC-Unique: Jew1JYCqMGOJ4gctq8vBIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D03561005510;
 Tue,  5 May 2020 14:44:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B16B66079;
 Tue,  5 May 2020 14:44:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com
Subject: [PATCH v2 0/3] vTPM/aarch64 ACPI support
Date: Tue,  5 May 2020 16:44:16 +0200
Message-Id: <20200505144419.29174-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 03:48:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, gshan@redhat.com,
 lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5dFLIdzzUwg7

Those patches bring MMIO TPM TIS ACPI support in machvirt.
The first patch moves the TPM2 ACPI table generation code
in the generic code. Then the table is added if the TPM2
sysbus device is dynamically instantiated in machvirt.
Also the TPM2 device object is described in the DSDT.

Many thanks to Ard for his support.

Tested with LUKS partition automatic decryption.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v5.0-tpm-acpi-v2

History:
v1 -> v2:
- move build_tpm2() in the generic code (Michael)
- collect Stefan's R-b on 3/3

Eric Auger (3):
  acpi: Move build_tpm2() in the generic part
  arm/acpi: TPM2 ACPI table support
  arm/acpi: Add the TPM2.0 device under the DSDT

 include/hw/acpi/aml-build.h |  2 ++
 include/sysemu/tpm.h        |  2 ++
 hw/acpi/aml-build.c         | 31 ++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 47 +++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 30 -----------------------
 5 files changed, 82 insertions(+), 30 deletions(-)

--=20
2.20.1

