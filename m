Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F3606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacecubics-com.20260707.gappssmtp.com header.i=@spacecubics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aUYNX+wK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWnEk-0002Mi-0e; Thu, 26 Nov 2026 23:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxz@spacecubics.com>)
 id 1xWlTV-0001oj-K9
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 21:14:10 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxz@spacecubics.com>)
 id 1xWlTS-0001Gv-SD
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 21:14:09 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-ccca948203aso5350649a12.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 18:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spacecubics-com.20260707.gappssmtp.com; s=20260707; t=1795745645;
 x=1796350445; darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=V36/QCccPERYuJGvGmmznNPNi+22pIIOZJQylgbbt+o=;
 b=aUYNX+wKGv2BPBVahq0RjKsmQyYxzOl/8LDnAlth+Z6q6h62wba/+zSaYpnLb2So/7
 iFBzroW9ZWJLzz5BS4zkGFhvsz/K8DfnjQpSvYSYG3ft3DlVsCBnCbqJ0aTZVXUyKP5u
 6xr1hKpycJ8Ms+wE9Zu606IWZif9Q3VT/VvT0AghsHiGvoOiGljJOFWEugMgjyiJY8aN
 BHM971PRpc2fUWIh1IyMXUoeMV0pyNR1Ogx2+V1kjYy2xEdg9ddnqspMO86g8C3FiRy4
 zIdrnEs2dBV4QalUUnsM2TaTmVtep36LW9tn/IIZUphh4tq+6NBFQhdi6+dews0Ox9pp
 u1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795745645; x=1796350445;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=V36/QCccPERYuJGvGmmznNPNi+22pIIOZJQylgbbt+o=;
 b=Z7jkt1YmZQD/KG5y2/346QXJlx5FDTuFYQFHXnfg9YzfhuiQVUOJhcAiK2VOv+cCQp
 Kf2kYrP8YnJnlt996GPMny7EE0K6OXFvMOB6bGlslukaMx2719XFEFRHxEAgpPiqA3vD
 ryD6d8s/5iVPihY4CfYlD1bt1/YChgDmIpuNSivBM5ZoBRvGJC4CRMYIqE8VcXDbfzqe
 8Y5u0s5JXe9nGkkNsHP2xaK2E993hSekpT8LRdgLhEoPfTCADDyR3IFok/1qBrloXsYj
 Tmi8i6ApMz4AIcP7HBUdD32pbyv1l8uBTKtvLG0K2ELzztGqHSPT2JXEIBKZZ4Vr0V7j
 lRDw==
X-Forwarded-Encrypted: i=1;
 AL+hErFaMQcte+1fcvz3J88iD5muJsbnzMXVGt2yIcbU0taAyDXkf7f98EJMcI1j5wHkVY+tAyiDgZSSuw==@nongnu.org
X-Gm-Message-State: APuU4Z/f1dohQ/sXCSrCuZSazibGnKnnqrY5XKqefuxrr2T5+TnslczI
 ULCsVBrQY5ehnx4S5Z8vUyBluiBMEbUpIxp8HmivnT3KYlX7l/zpyIzTn3elyp72if2is7JbRsP
 q19W+P2M=
X-Gm-Gg: AZFdTZeuGx7g6MxG9oA2AkSz1MDjGUV2TIbIFCvFZ6FOL9/2bN/7nv5VWc1bs8s1rfB
 pHE4JeJT1oHTElfSCaZHMmYh+Os/+gLFVJZ0NV2PeFSSaJrOkB0VHxRT6EyXLnMt0M7AvQ3IbTF
 UlKQ/PazFS5VsQWD0jAKdMbAMBtCZVwzIY1N0TeiVoq5jlzPQ+/WmQLbPtZBWGXv+sICc+c5UVA
 0IvVQpX1XdXS3SHU+2BPTvVrExLvzig6cp69t4VEJ0ysLK4jjKNqU6fZgAJh9nKlvxYG6SpxjIx
 ZO/6ZnQ644g6g0dSQm4q3w5gABz5eoCBCtN+FR8XwLAgMsB5CsmeI/aXwGlMqFPAV1MeI6hcmni
 GF5Noeqd/DLBZOOpla1IaPZ6n6z3LLsDDxk+qF6QnupjLXSkAHNw9IRC5oIctHKvid/+1e/cKV3
 kdQE0aK/m7gx6VCE3j8Nr7Kf/qODc9OD+PeoRHHBTB8ISRdyAHt/pSnbjfl1CHACCF7JV+0tQBh
 eZLVuRx39Rh3/IGBLASVnUIrc7c1twAal3qXd5tBkPYB5VFlS3Q2rtn8B2NNIbFEIW2f7LOubDJ
 Z/2w5c8UzAd1mIXx+gh0BPbOaY6q9+rF6bT6dvlsfTEgfZRZzxJYFveG8BMNH0G8kg==
X-Received: by 2002:a17:90b:35c2:b0:3a8:c0cd:57f3 with SMTP id
 98e67ed59e1d1-3b41c8e0c7emr19549724a91.18.1795745644753; 
 Thu, 26 Nov 2026 18:14:04 -0800 (PST)
Received: from [127.0.0.2] (182-166-200-88f1.hyg1.eonet.ne.jp.
 [182.166.200.88]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b53479b149sm1368372a91.6.2026.11.26.18.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 18:14:04 -0800 (PST)
From: Maximilian Zimmermann <maxz@spacecubics.com>
Subject: [PATCH 0/3] hw/arm: Add Space Cubics SC-OBC Module A1 board
 support
Date: Fri, 27 Nov 2026 11:13:33 +0900
Message-Id: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtYujFkryIe0jTV7LBKoyKMv
 bt1Hr/D/2/gWk0d5m6Dqm9zK2sDnTqQO683RUvNEPowEYUJOSV0KVGQCWPhmpDzMJD2mWQ8Qws
 fVbN9junl+re/4qLy/J1g379TGaY+dgAAAA==
X-Change-ID: 20261126-add-scobc-a1-board-af331e0f1c48
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Maximilian Zimmermann <maxz@spacecubics.com>
X-Mailer: b4 0.15.2
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=maxz@spacecubics.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Nov 2026 23:06:53 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SC-OBC Module A1 is an on-board computer module for CubeSats made by
Space Cubics. Its processing system is implemented in an Artix-7 FPGA,
which hosts a Cortex-M3, 4 MiB of main memory (HRMEM) and a set of
peripherals. The module must be mounted on a base I/O board. This machine
only models the module and not the base I/O board.

The default FPGA image provided by Space Cubics contains so-called
mission bus peripherals, which are user definable via an FPGA image and
live in the range 0x5000_0000 to 0x6000_0000. This is the only image this
machine models.

The board is already commercially available and in upstream Zephyr
as scobc_a1. To make development and CI easier we want to add it to
upstream QEMU as well.

Currently only a small subset of hardware is modelled, mainly the CPU,
memory map + mirror, console UART and 6 mission bus UARTs. They are
register compatible with Xilinx UART Lite, hence the existing device
implementation is reused. Other devices are mapped as unimplemented
devices and are planned to be implemented in further patches.

The hardware is publicly documented and can be accessed via the
following links. The memory map and interrupt page are partly
in Japanese only at the moment, but should be understandable to English
speakers as well:
- https://docs.zephyrproject.org/4.5.0/boards/sc/scobc_a1/doc/index.html
- https://docs.spacecubics.com/scobc-a1/latest/key-specs
- https://docs.spacecubics.com/scobc-a1-ja/latest/fpga/memory_map
- https://docs.spacecubics.com/scobc-a1-ja/latest/fpga/interrupt
- https://spacecubics.com/en/products/scobc_a1/

I added a small functional test, checking that the provided Zephyr ELF
boots and "hello world" is printed. The ELF is an unmodified
samples/hello_world from Zephyr v4.5.0 and hosted on
downloads.spacecubics.com.

The board and possible future additions will be maintained by me.

Signed-off-by: Maximilian Zimmermann <maxz@spacecubics.com>
---
Maximilian Zimmermann (3):
      hw/arm: Add Space Cubics SC-OBC Module A1 board
      hw/arm/scobc_a1: Add mission bus UARTs
      tests/functional/arm: Add SC-OBC Module A1 test

 MAINTAINERS                           |   8 ++
 docs/system/arm/scobc-a1.rst          |  59 +++++++++++++
 docs/system/target-arm.rst            |   1 +
 hw/arm/Kconfig                        |   8 ++
 hw/arm/meson.build                    |   1 +
 hw/arm/scobc_a1.c                     | 151 ++++++++++++++++++++++++++++++++++
 tests/functional/arm/meson.build      |   1 +
 tests/functional/arm/test_scobc_a1.py |  30 +++++++
 8 files changed, 259 insertions(+)
---
base-commit: 6bf90d4fc5027567cb704d7888f5ec792b4ed75a
change-id: 20261126-add-scobc-a1-board-af331e0f1c48

Best regards,
--  
Maximilian Zimmermann <maxz@spacecubics.com>


