Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1833490lff;
        Wed, 18 Dec 2019 22:49:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRv7BYuV04M4nB56Uk3isf/yfVwpDcJ38rieS5EO79IOnL06RbkUhQwIygXDdVTnp0Q8s9
X-Received: by 2002:ae9:f106:: with SMTP id k6mr6830644qkg.189.1576738178298;
        Wed, 18 Dec 2019 22:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576738178; cv=none;
        d=google.com; s=arc-20160816;
        b=ooXOQRoSyorn1ldXEuedXj1bkuwHzPaOzkpHuyn+7YTzB8UFW0VaIs3yHTwzfLa30J
         rpQFIzP6x+JVCFf4e9TLe7ZYeI15N3FKeosTAFvfmwwPTRqbranJST6Z9TBicg9cfgGf
         0iTiBKrs2bfRFgE1vvidVpxB90owyHCBrge53YuECYfuJig4AnSm5r5bVrXSUmxsvy8E
         j2Mo0dffVAFThSslhITVPqSWyq6zEFwQpXJ/VGiIn98rXknrnl4ERKVEqVLtkZG2pzkd
         poXUpncwYRu6tYQAz/rABB26yw/TvOkPAYZ0fEcXhNLefvGeaVypjlJn3AwrMdP8XYKl
         O35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=JpeasResqmjlpVuPVLl45Xq61fqKrWxaNLSKP/kHmmc=;
        b=a3wavXhtxo2hM7nWfXVC6dq3cd3hpgtLV1n8InDQczWLn83B5fbieRN1S9FQp2ZuOP
         7RtyG5APmCtv1q6G92IgLOi2Is66ydmKbVUVDD6oGfkfFbY3co1/W3CRlrtUo6SwiKIU
         aXPBHmICXrIaWTsBoXVpINQ97exuGFcQ3glSLtZMJhZ42kRDDWTl6dXX5BEoUCiWLHin
         hlfq5xqUdMjFaYnwkWcqUnAxrlfhxhhmY1yoEwvOR9ZMyyhYLeMakr/XkvqEUe8xQth7
         lQBC4iSVO5jUGnQoftGHQHiVe8xxMIl18rQR3vh7Eiwo6TCkaWkw+Z29JVIuvTPGpE2d
         7zIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si2777561qvt.161.2019.12.18.22.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 22:49:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihpcv-0000eA-Cl
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 01:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ihpcm-0000dw-3Q
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 01:49:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ihpcl-0006Kg-0M
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 01:49:27 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:42254 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ihpck-0005ic-IW; Thu, 19 Dec 2019 01:49:26 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 31D6DF709F93C050493A;
 Thu, 19 Dec 2019 14:49:19 +0800 (CST)
Received: from linux-CPUxgZ.huawei.com (10.175.104.212) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 14:49:12 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 0/2] Some cleanup in arm/virt/acpi
Date: Thu, 19 Dec 2019 14:47:57 +0800
Message-ID: <20191219064759.35053-1-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JqRIS4NLcfYy

Remove useless device node and conflict _ADR objects in ACPI/DSDT.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org

Heyi Guo (2):
  arm/virt/acpi: remove meaningless sub device "PR0" from PCI0
  arm/virt/acpi: remove _ADR from devices identified by _HID

 hw/arm/virt-acpi-build.c          |  12 ------------
 tests/data/acpi/virt/DSDT         | Bin 18462 -> 18426 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 19763 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 18426 bytes
 4 files changed, 12 deletions(-)

--=20
2.19.1

