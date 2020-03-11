Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp758292lfc;
        Wed, 11 Mar 2020 06:16:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs4QHeAeQ89AS0xBx1t3oOZRAAoM9epmIjbs1w3H5rKJ9cVjGsbdj5NZeaeD++5jdmR2bvw
X-Received: by 2002:a37:6c45:: with SMTP id h66mr2654603qkc.360.1583932610280;
        Wed, 11 Mar 2020 06:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583932610; cv=none;
        d=google.com; s=arc-20160816;
        b=jJDE6cuXfQnwu8n3Ty1OT8GZN/3/65ViaFq3zfMmbCbcqM+86MDzhOomk9o83up4M+
         oUQt2n/wezUlXyYxqXnGmuFC9Sqov1UENqfVaiHbYd/zF2sjf+u8wpNHUD1hhBq30jL3
         rC9CLwtPRBxQEXNdDfDgXZ15Ohkk1qnOAf6Y3ubpvUMXUqg3MAu3JqOLPwGPsmPNmMPK
         5PqeIDjXcwVRV+gr0osjOhTAQbjlhHrlyluwJMlzLE5XJ/x3QA0N0VFqVgTB8T0+zH4N
         u50HTmbAZWAFQR8Vzgwabu+5CnO50RzvWBPymEN5qmvTYETHmwS6zKL5xaeyEkRQGCPF
         vELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nOr9kPd6XYsHaEfYA6rqyXabkB6EHdZlZdxZg7rd0Hk=;
        b=hobY+JOp53pJkwGp7f8cbMiGVbQNFbl8kAl4s4jPuc0X5JXuMgOGUL0Du85DWnD/sn
         3qEp0QcHfnHD3G/jQ/NJTxWBkrQQdLIJENIPagbNlMBhxClTINoIpEpdYZ98atBCAkiG
         6yBHHYdNJmk/J8PMBzcj5GclSTD2AsfJEskx9dcPxn1pDsNwmrBbM914uMmukJVL/x8N
         aGuo/ExM9gYpw9GcWnUuVSF43dkgAaoxWkIPTqFmxRfGBfaaFi9Og+zBJh3jgO96VoYD
         zQctCp1mNt073PPeHm5tntSEFLHXi+LKAYgzE+1LPD2WC4wlQvcfZ0yXkA0t2yp2YcyC
         1k3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V1vy6qYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si814261qvw.150.2020.03.11.06.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 06:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V1vy6qYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51655 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC1E9-0001Q0-Ix
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 09:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jC1Dx-0001M6-HE
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 09:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jC1Du-0007ap-RE
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 09:16:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28930
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jC1Du-0007Yy-L8
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 09:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583932593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nOr9kPd6XYsHaEfYA6rqyXabkB6EHdZlZdxZg7rd0Hk=;
 b=V1vy6qYUgq939B1h7UI+mJTUXD7c25oqQntQDgUOjGr7YyRlEDZPqY25RowgEXBRWodgte
 3RW48Je5IvqIzQZ5rOqWZecXu/s+QnljqYH9955H9PaWadchEELHtHddkKJxV4Q9Qtr0XL
 kMgfMFFSDODg/loSuyfqmt0od/KO8ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-sqCYvUPlOMyTBpnuH1AvLg-1; Wed, 11 Mar 2020 09:16:32 -0400
X-MC-Unique: sqCYvUPlOMyTBpnuH1AvLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E25131005509;
 Wed, 11 Mar 2020 13:16:30 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEEAB9299C;
 Wed, 11 Mar 2020 13:16:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v5 0/6] hw/arm/virt: kvm: allow gicv3 by default if v2 cannot
 work
Date: Wed, 11 Mar 2020 14:16:12 +0100
Message-Id: <20200311131618.7187-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: maz@kernel.org, drjones@redhat.com, richard.henderson@linaro.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUqbfmLQE0t/

At the moment if the end-user does not specify the gic-version along
with KVM acceleration, v2 is set by default. However most of the
systems now have GICv3 and sometimes they do not support GICv2
compatibility. In that case we now end up with the following error:

"qemu-system-aarch64: Initialization of device kvm-arm-gic failed:
error creating in-kernel VGIC: No such device
Perhaps the host CPU does not support GICv2?"

since "1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
provide a GICv2" which already allowed to output an explicit error
message.

This patch keeps the default v2 selection in all cases except
in the KVM accelerated mode when v2 cannot work:
- either because the host does not support v2 in-kernel emulation or
- because more than 8 vcpus were requested.

Those cases did not work anyway so we do not break any compatibility.
Now we get v3 selected in such a case.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.2.0-gic-version-v5

History:

v4 -> v5:
- Added Drew's R-b on the 2 last patches
- addressed few nits reported by Drew

v3 -> v4:
- do not probe the host GIC version if kernel-irqchip=3Doff
- In KVM mode / userspace irqchip we immediatly output an error
  in case the end-user explicitly selected v3. Also we warn the
  end-user about the weird usage of host in that case (only
  userspace GICv2 is supported).
- Removed R-b on last 2 patches

v2 -> v3:
- replaced defines by VirtGICType enum type
- fixed some style issue
- collected Richard and Dres's R-b
  except on "hw/arm/virt: Introduce VirtGICType enum type" just
  to make sure this matches their expectation.

RFC -> v1:
- 1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
provide a GICv2" now has landed upstream
- Fix gic-version description
- Introduce finalize_gic_version and use switch/cases
- take into account smp value

Eric Auger (6):
  hw/arm/virt: Document 'max' value in gic-version property description
  hw/arm/virt: Introduce VirtGICType enum type
  hw/arm/virt: Introduce finalize_gic_version()
  target/arm/kvm: Let kvm_arm_vgic_probe() return a bitmap
  hw/arm/virt: kvm: Restructure finalize_gic_version()
  hw/arm/virt: kvm: allow gicv3 by default if v2 cannot work

 include/hw/arm/virt.h |  12 +++-
 target/arm/kvm_arm.h  |   3 +
 hw/arm/virt.c         | 145 ++++++++++++++++++++++++++++++++----------
 target/arm/kvm.c      |  14 ++--
 4 files changed, 134 insertions(+), 40 deletions(-)

--=20
2.20.1

