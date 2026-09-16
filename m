Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AFBC982C9
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:51:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6sr7-00009P-EY; Wed, 16 Sep 2026 12:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x6sr3-0008WM-Tf
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x6sr1-0001cd-MK
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789577486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AvkBO86Vxep0LTBS33hl/KqDyXBtcNpZip+c0HPjzUg=;
 b=iAR9x19t2Avlq24a5HAvnSsNwtaSheMsSLq5GmOR8CM7lgn3FkcFWAUTj4uaEm80Hcjc4k
 KNVgPHwJn4G1+kvoQrnX7k4fIfXNhsHZmTmGfHfWFhK7/JWHvzRrmm0OFyk1DvhjIznq4C
 p38m1WQrFURGI7qYNyDPETkoozmcj9Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-ub1FyRkcOuKB2h9_zyVvkw-1; Wed, 16 Sep 2026 12:51:24 -0400
X-MC-Unique: ub1FyRkcOuKB2h9_zyVvkw-1
X-Mimecast-MFC-AGG-ID: ub1FyRkcOuKB2h9_zyVvkw_1789577484
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4843e59c32dso3969062f8f.3
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789577483; x=1790182283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AvkBO86Vxep0LTBS33hl/KqDyXBtcNpZip+c0HPjzUg=;
 b=aax3vLhHwLO4DcPQIhgdTiZXzfQvF5KEPSi2XkrWQ7xkLWxmYS7M3IORQDyoC0i4ad
 Fan/8lODSW+JClEiVNFfQk2BQ3k+3qWEp2twnauYfTkPs8Bw4DWgL6DX6Dc1lhVYaDbV
 PS8uQ40JRrdaowJJ/ukprvXSWXqBy+IM5AIHzTyJSRHtaFvqYJ0RykLSkuksPw9dvSIE
 YG3f3496/35nsautJNeRqCIcGdfoavdV75C3rMFBn7v8BUmsTiOktnTs43+gobwdHPk6
 EE3vwOi2mAJimKxvnXxgPbk1jW3oKjq2hRpIcai0z5CmxjoDgFAQczmv6q8VY7lQ9Hpn
 ZLaw==
X-Gm-Message-State: AFuF++lEFbI8NKAE12B0IHVhvRp6NSujW4DYbOp/gZeFXvA93WVwTTZP
 Ibo6Tf0PIy+KPf25T+PjWDzTKe082BdHxWk2zNUdzmrch98+bBHGcTwSWq3H3vRtr8GDxFUZLIj
 E16+4bOPUl5tMc5Z81Ul1w4W3rVhIOBd1arF7hb4sscyldPTsk+opXg==
X-Gm-Gg: AYBFou1tei1Zmc4CxCNJa7q6APCG///wMp4AvtZdtZwQZuR/ezW/iSqHKpcdwHcBuuz
 76QEXhzo8hz8Y8bniKj7tWBSTjBQtlMKRiUcFbKM4Bja4TrAUMB4iYSlsiRyGQ9hhwqT4hKABo9
 J12/l2SaA733S0/qcGzng+bVDKG/Mvw9txSTfMEvDIwmFkZ42nWu7QIwKi9Ir6WLFo+O87rVBYI
 Sl+bUAubYjBOEJCe8L2EvnYKGAW4teNXv0CX+X3S1qHZ7bgMH1FjTh8GB8ATRHSPlh6lwZqLgLr
 JKolOX56R5IAPBC/Gqys36fM0mXz/7x17q23E8Ud7TaFYwdAybn7zbvjBg74IDSgJoGvCsGHYwE
 4ehjm9jEzEcJD92XLn4RTF585Sga1L7Ci1+euONhqNakB6/9H3Xo6D4Eu1ucb1mn2MQ==
X-Received: by 2002:a05:6000:29ce:b0:487:10a9:57cb with SMTP id
 ffacd0b85a97d-48710a95810mr2180261f8f.49.1789577483716; 
 Wed, 16 Sep 2026 09:51:23 -0700 (PDT)
X-Received: by 2002:a05:6000:29ce:b0:487:10a9:57cb with SMTP id
 ffacd0b85a97d-48710a95810mr2180246f8f.49.1789577483377; 
 Wed, 16 Sep 2026 09:51:23 -0700 (PDT)
Received: from rh.redhat.corp
 (p200300f6af00a400b6f52cb1a2e89932.dip0.t-ipconnect.de.
 [2003:f6:af00:a400:b6f5:2cb1:a2e8:9932])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf33e01sm9655089f8f.23.2026.09.16.09.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 09:51:23 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, khushit.shah@nutanix.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v6 0/3] arm: demuxed ID registers (CCSIDR_EL1)
Date: Wed, 16 Sep 2026 18:51:14 +0200
Message-ID: <20260916165117.39764-1-sebott@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dM50QQAbWIFCx9gGSoX-5MqWVvDBivfV7PZDrIr3J2g_1789577484
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

To support efforts to generalize handling of writable System ID Registers
[1] this series addresses the demuxed registers that are kept outside of
ARMISARegisters namely CSSELR_EL1.

CSSELR_EL1 is moved within ARMISARegisters and accessors to retrieve
and set the demuxed values are provided. Initial values are gathered via
the usual KVM_GET_ONE_REG ioctl.

V5 of this series was posted here:
https://lore.kernel.org/qemu-devel/20260909144151.26803-1-sebott@redhat.com/

[1] https://lore.kernel.org/qemu-arm/20260616132625.1732031-1-eric.auger@redhat.com/

Changes V5->V6:
* incorporated suggestions from Peter

Changes V4->V5:
* changed diffstat format
* changed cover letter

Changes V3->V4:
* added R-B from Eric
* incorporated suggestions from Eric


Cornelia Huck (3):
  arm: handle demuxed ID registers
  arm: handle CCSIDR_EL1 as a demuxed register
  arm/kvm: get demuxed ID registers from kvm

 target/arm/cpu-sysregs.h     |  9 +++++
 target/arm/cpu.h             | 28 +++++++++++----
 target/arm/cpu-sysregs.h.inc |  1 +
 hw/arm/virt.c                | 19 ++++------
 hw/intc/armv7m_nvic.c        |  2 +-
 target/arm/cpu-max.c         |  6 ++--
 target/arm/cpu64.c           | 14 ++++++--
 target/arm/helper.c          |  2 +-
 target/arm/kvm.c             | 42 ++++++++++++++++++++++
 target/arm/tcg/cpu32.c       | 26 +++++++-------
 target/arm/tcg/cpu64.c       | 68 ++++++++++++++++++------------------
 11 files changed, 144 insertions(+), 73 deletions(-)

-- 
2.55.0


