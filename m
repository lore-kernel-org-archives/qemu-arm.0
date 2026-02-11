Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F5FEA3F27
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 15:31:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqCBA-0007JO-HK; Wed, 11 Feb 2026 10:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vqCB8-0007I9-SM
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 10:30:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vqCB7-0008AG-7h
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 10:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770823856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x2E0s+P8sKjuC6cwmuu4hJ5r1IkHeeGVxzBUO13i7RU=;
 b=S8MqLP+bzkE9PUYmtcNZoebTfoDc7HCyv8eoC4VelLcrzNRuGw8LWYkVifWymMs4YY4t+7
 DPTEmEfhDHjLPUdWgRbq6oxr2NAe9YrG7d+SNB0az73kDc9Tm7yGRimbyW84HmRXVePdrm
 rq8IjdcVnGbnXMkqjargFbOSGtcgSlo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-R2z7dHZ4PLikCKS0c1zwcg-1; Wed, 11 Feb 2026 10:30:54 -0500
X-MC-Unique: R2z7dHZ4PLikCKS0c1zwcg-1
X-Mimecast-MFC-AGG-ID: R2z7dHZ4PLikCKS0c1zwcg_1770823854
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4362456500eso1531857f8f.3
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 07:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770823854; x=1771428654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2E0s+P8sKjuC6cwmuu4hJ5r1IkHeeGVxzBUO13i7RU=;
 b=oaOXamevUXr/qINtFYvZnIo/VywJjNv1Y1hLVDEHJ9MtVuiKBhw8fzNe1RTf9JwhkT
 AqdXBOhz4wQIuJEaRTejlttGT8lH9EZ1dAlFgL6/J3HHoYb0E1AU4zIjSAL7bmwK8efu
 nuvKa+WiISRE5AijziHM/ragSR3Hz3NHRmAQ0Gwa9MnXS4pygxCcfo+tlujKRh0vaXRr
 hipYRVT/AW56E5tsBQZxKbV0FVifmm+v/pe5d3w30dN3T4YlTWI5cnXm+9Xe7hqHnhMy
 ZxG7gPdMbO3kXRfDI/f0us8ewMYGLOCyT5elGpZuQb9SkGBC/D92ZVm3hMXCDobIRga6
 XHuw==
X-Gm-Message-State: AOJu0Yz9Cxr/3ax+KRaAtY9XCsqt1Pzfu3zQrHfbJEcRVVZbv2ZHcLIN
 s4oJwNGlHucR/9OtPya7B5djU+hdJcIsViM1KjHKlE3c9cHVM0ym9hiSX4tsbMle7D8bSl8oWYR
 KtHDUP8k7zRR0BlgbYKWsgM9IEaCiFfcEVBja8z9JGiunWZY893U3YA==
X-Gm-Gg: AZuq6aK+zTb3245wQaXcR9SF4B/fRA/uy6BEW7JHICA1IT8kvDHsqUk7VY8DpS+ZtsB
 g/p54M/G4Hoi3cqhDuPWY7Nn/xuwRV20fjeNGlnSlNbR8zpYUABdoUaL78hTsnoDxU3ref5VgcL
 bgB/FYh1gDKETgchRgVG15sObI9w7Ne51NYyYzZSQm36K1HRjNQGKl0GNiC9CovWB3milTQfKkR
 kIIoMhpJro8tDVy9C7E2Jiboi1yxYA1XpzNnAcdl+cubTycCzvicQHQCgCulOiQ+tNXeGGMuikk
 iBhAViD+zqBvmHzxDvMw+TzX66OcWaSemsq7hpIces4wyrQ+xH2YPc+fvXBp/ulRoSkDZbMJj/u
 O2R2GZqDnwcCXyGOnjBM78v0q9ZYeL3EEwnisjY6n/9hHo3h4E4/2p1fRBxjporgtWZ3vzSfvPH
 +Ie+6PkOfE
X-Received: by 2002:a05:6000:420c:b0:437:a49:137d with SMTP id
 ffacd0b85a97d-4370a49155bmr20114265f8f.21.1770823853627; 
 Wed, 11 Feb 2026 07:30:53 -0800 (PST)
X-Received: by 2002:a05:6000:420c:b0:437:a49:137d with SMTP id
 ffacd0b85a97d-4370a49155bmr20114220f8f.21.1770823853091; 
 Wed, 11 Feb 2026 07:30:53 -0800 (PST)
Received: from rh.fritz.box
 (p200300f6af2d8700b4c2d356c3fafe63.dip0.t-ipconnect.de.
 [2003:f6:af2d:8700:b4c2:d356:c3fa:fe63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d34657sm6448511f8f.6.2026.02.11.07.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 07:30:52 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v5 0/2] arm: add kvm-psci-version vcpu property
Date: Wed, 11 Feb 2026 16:30:30 +0100
Message-ID: <20260211153032.19327-1-sebott@redhat.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XNIDrdfSKdHrBwUX1Yn3qtzu4O0E7qxysFIKqIFVSPI_1770823854
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This series adds a vcpu knob to request a specific PSCI version
from KVM via the KVM_REG_ARM_PSCI_VERSION FW register.

The use case for this is to support migration between host kernels
that differ in their default (a.k.a. most recent) PSCI version.

Note: in order to support PSCI v0.1 we need to drop vcpu
initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
Alternatively we could limit support to versions >=0.2 .

Changes since V4 [4]:
* incorporated feedback from Peter
* added R-B, T-B
Changes since V3 [3]:
* changed variable name as requested by Eric
* added R-B
Changes since V2 [2]:
* fix kvm_get_psci_version() when the prop is not specified - thanks Eric!
* removed the assertion in kvm_get_psci_version() so that this also works
  with a future kernel/psci version
* added R-B
Changes since V1 [1]:
* incorporated feedback from Peter and Eric

[1] https://lore.kernel.org/kvmarm/20250911144923.24259-1-sebott@redhat.com/
[2] https://lore.kernel.org/kvmarm/20251030165905.73295-1-sebott@redhat.com/
[3] https://lore.kernel.org/kvmarm/20251112181357.38999-1-sebott@redhat.com/
[4] https://lore.kernel.org/kvmarm/20251202160853.22560-1-sebott@redhat.com/

Sebastian Ott (2):
  target/arm/kvm: add constants for new PSCI versions
  target/arm/kvm: add kvm-psci-version vcpu property

 docs/system/arm/cpu-features.rst | 11 ++++++
 target/arm/cpu.h                 |  6 +++
 target/arm/kvm-consts.h          |  2 +
 target/arm/kvm.c                 | 65 +++++++++++++++++++++++++++++++-
 4 files changed, 83 insertions(+), 1 deletion(-)

-- 
2.52.0


