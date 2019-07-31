Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5330703wrv;
        Wed, 31 Jul 2019 00:57:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZVbg5+i2VW7AaFApUsvncD58tc6p8VLBU2sYHDhgnHU38gjsYTPo6aIx3T9549AIkGovB
X-Received: by 2002:a50:b803:: with SMTP id j3mr103165375ede.208.1564559830279;
        Wed, 31 Jul 2019 00:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564559830; cv=none;
        d=google.com; s=arc-20160816;
        b=eIIPkQVS77bUPp4QHTNKBhXeCp/Q43a6hAVKeykURJMXe6lRjnAXTQ+DXm00aJg2dx
         qQ2+QR9mz4xQyk4UxCAAYP711xAtmEqrG46b9nfkQLvFghDtvU+HZqaznvZnhFfllOV+
         M+arIOSx8CKKMVFLR6LksIonnMLiC+sSuNuItIK8TDeEBTD8f38xGbZN2eOAWUg8+s/5
         AHXxXiuDYhgnfDJ1S/30BN3S8OPBXtoHBlqCrVRVvCBfyh3XeRfkHADMJIm25Vankp/m
         21fmlfXvCNK3InD2MKAtZ3UKVOZaaiFvaK3gzNR36ZerdnJ0BRl2eGXCVks2XzxBpA1n
         UouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=KuRRIEHmV3ba3AVQTj0DqSPD2b1XBQWVZwSd4Bsf53I=;
        b=oZqAa0IAW1rkskzVyrpk15hcjh9IaxhUtam67G8OZ8xaM7Z9Zy+OCfPG75n8rbHz6F
         xY8uRgZVPfx7hwEM8Xh9jqovqfit7PIEUXNNXzH3ZrMnp/wtvGii7jh7iFULy/XgcyEi
         sB1f0D+1MAFXkLq7gp0+rsFJ8ik16a5Pn2pUqb3ow6YpZFB8JNT3NX+bpdbdZcPHm5rI
         wDTqZGch4v5nJtrwj/jqyPvAVlo9YxeW7Ah8xgATa6fxew29JBrcQvh2Z1N8m1nvRbpI
         ODa8x5xcr4WoSbHmzqxI7LIF988s18j5a2i1GCP/uXqEYBlNQzawa3rUturKPj8Vu1NB
         eiWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k41si20116725edb.152.2019.07.31.00.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 00:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsjTx-0001fm-Cj
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 03:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58545)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hsjTr-0001fM-Si
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hsjTq-0007uC-V8
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hsjTq-0007ti-OP; Wed, 31 Jul 2019 03:57:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2D742308FB93;
 Wed, 31 Jul 2019 07:57:01 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A895C1B5;
 Wed, 31 Jul 2019 07:56:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 09:56:44 +0200
Message-Id: <20190731075652.17053-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 31 Jul 2019 07:57:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.2 v2 0/8] Kconfig switches
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8q9NbaAXSZhQ

Here are some more Kconfig patches that clean up the switches of
existing devices and introduce proper config switches for some
other devices that were always enabled before.

v2:
 - Included Philippe's patches to avoid a conflict with XLNX_ZYNQMP
 - Don't rely on indirect dependencies, always "select XYZ" if it is
   adequate
 - Added patch for the generic loader device

Philippe Mathieu-Daud=C3=A9 (3):
  hw/Kconfig: Move the generic XLNX_ZYNQMP to the root hw/Kconfig
  hw/intc: Only build the xlnx-iomod-intc device for the MicroBlaze PMU
  hw/dma: Do not build the xlnx_dpdma device for the MicroBlaze machines

Thomas Huth (5):
  hw/core: Add a config switch for the "register" device
  hw/core: Add a config switch for the "or-irq" device
  hw/core: Add a config switch for the "split-irq" device
  hw/misc: Add a config switch for the "unimplemented" device
  hw/core: Add a config switch for the generic loader device

 hw/Kconfig            |  4 ++++
 hw/arm/Kconfig        | 15 +++++++++++++++
 hw/core/Kconfig       | 13 +++++++++++++
 hw/core/Makefile.objs |  8 ++++----
 hw/dma/Kconfig        |  1 +
 hw/dma/Makefile.objs  |  1 -
 hw/intc/Makefile.objs |  2 +-
 hw/microblaze/Kconfig |  1 +
 hw/misc/Kconfig       |  3 +++
 hw/misc/Makefile.objs |  2 +-
 hw/pci-host/Kconfig   |  3 ++-
 hw/sparc64/Kconfig    |  1 +
 hw/timer/Kconfig      |  3 ---
 13 files changed, 46 insertions(+), 11 deletions(-)

--=20
2.21.0

