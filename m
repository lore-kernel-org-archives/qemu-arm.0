Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3990544lff;
        Sun, 8 Dec 2019 22:38:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzgUvGg75uXDDoLMiYP4hslUNAgM5DhCXCqWUFuZl23y0cNWvCQ/t6cRY1SK2CMku/D0cw
X-Received: by 2002:ac8:3362:: with SMTP id u31mr23854240qta.61.1575873538033;
        Sun, 08 Dec 2019 22:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575873538; cv=none;
        d=google.com; s=arc-20160816;
        b=Yo4Hokjpb39L79eSSt4e8A/tJxtDlsUv12sdgyWQCSjiiSYcSZ8vRb1MQCmjZHWkKE
         N+1TcJ+NY+QQtvWQ6RsR2XarCRaVRegnPvxha59NP2LMdJ9X2K97d7JNHnguQe/6OKOp
         qcA4tWmWYE7pgkrvHwJQt/wcGWB5WLIxVgJh1EitMQ5ZcN6/3AmwKmpqzC1l3nVXn67c
         Xfb++Ob9YOksEXQBXN+aRzOgZahlSaYGu3a64i+ZIj+r2fJ12E2t6ElX88teIG7nVfB6
         FEMqa2Wo0ERUAdyGsmJDG5AuLE58igY/Eu5pDP9wx8LTVy5D2zS63Ljbj3hG1sDe8QIN
         jGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=GmhnxMxZSCGctscXIudjQsC4YeN1ZKqA2OpsrK/B3H8=;
        b=g2exIPBWBlPcfJ9pDnKftvawl7PcUfshcb7K4aUPra4pCcfyCbGPVUTa7+2kEWdcPM
         D+Yx6qQmJa8ZBtznf/VPyvdC5Hp1bXlHxi8PoJ4Lzrar/aKcSDQXRJnrY1asmsCkEs+I
         EmwSeznN0DHD90DJH+qrmWqsDWOP5bvt5g8x4QV+UcqkE2BZSUtfHADJUU0XTWmLgbxN
         M3yURLRFoPMPzE2ToKGqEJSm7OyhzlcZelupsGB/jHfgFxYT6cyYxJ9XMqA5zFpSZWRd
         TjDYlgHYTqErHlMohfOyJB5nX3wUYaElN8cELzklNnrA0eusu+iMhyfWm1/sS+hGj6ee
         kItQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c85si3617449qke.307.2019.12.08.22.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2019 22:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieCh7-0005Km-Cf
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 01:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ieCgz-0005KS-IG
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 01:38:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ieCgy-0004bJ-AZ
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 01:38:49 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:60986 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ieCgx-0004aK-V8; Mon, 09 Dec 2019 01:38:48 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A3CBF6D634ECE13C9D14;
 Mon,  9 Dec 2019 14:38:42 +0800 (CST)
Received: from linux-XCyijm.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 9 Dec 2019 14:38:33 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v6 0/2] arm/acpi: simplify aml code and enable SHPC
Date: Mon, 9 Dec 2019 14:37:17 +0800
Message-ID: <20191209063719.23086-1-guoheyi@huawei.com>
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
X-TUID: B1DyurPv1h3J

After the introduction of generic PCIe root port and PCIe-PCI bridge, we =
will
also have SHPC controller on ARM, and we don't support ACPI hot plug, so =
just
enable SHPC native hot plug.

Igor also spotted the store operation outside of bit and/or is not necess=
ary, so
simply the code at first.

v6:
- Fix "make check" errors by updating tests/data/acpi/virt/DSDT*.

v5:
- Refine commit message of patch 1/2

v4:
- Improve the code indention.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>



Heyi Guo (2):
  hw/arm/acpi: simplify AML bit and/or statement
  hw/arm/acpi: enable SHPC native hot plug

 hw/arm/virt-acpi-build.c          |  21 +++++++++++++--------
 tests/data/acpi/virt/DSDT         | Bin 18470 -> 18462 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 19807 -> 19799 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 18470 -> 18462 bytes
 4 files changed, 13 insertions(+), 8 deletions(-)

--=20
2.19.1

