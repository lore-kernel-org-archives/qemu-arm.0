Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3934310dye;
        Wed, 2 Jul 2025 09:32:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbqRoKbBvug5xfbiz2sAu6zIvPY8rIBZ/u3viZsQE07eFM7TGCI90fvDpZQhkl4am2YFTvTnAAgNqI3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGy2cAbqPPkL/66o546rSHgiz41/kHNBM+z/XkeKFAXCF0vIVAUYftqjHlpbfkbRkTsaJ6k
X-Received: by 2002:a05:620a:31aa:b0:7d3:d028:e765 with SMTP id af79cd13be357-7d5d146bc6amr30936085a.2.1751473969319;
        Wed, 02 Jul 2025 09:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751473969; cv=none;
        d=google.com; s=arc-20240605;
        b=CRe4uop4ZrJ8EG427WjWiedM5rsJeUo5JyrKypFfuspLJB96SKWq72fZlptSxffY1V
         lQBr8c7irip/lf8tIe4YScMwjjEom8KnXo5s4DNqU+Im0qdegvXmX8/7QOUCGjpJ+DgK
         kGpiOh5zBvZABZtYMvC33vANSDRt4FZjkPp6LkcDUHQlrO9VhcL0QgSpPBjksDilGp03
         TCouTK9sz8POQpe9Yuuv6Z1QOpQJyYJX5wjaLKlKrt0iXmeaUab4CCyUvBSkvYfh+HKS
         pVGjqch76faoecsxdLzUVFq9gz54pu1/Dw6f7QTPiA9qq9AuwuIQllhpmiU4D88A84dO
         mpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZonMPNFrdO8TLjY6aHxUkbJPtOMnTEXQ7FtooX1XRqs=;
        fh=UVrGBnfE9R8/5nTz0HPCluylUu4vXq1b0MPFtmDhPnc=;
        b=i7U6UjfrbONYmvuubdDV1usshAb5QuqqyPdjrYnBY0rg488JdWOk7kIiE9vMJgZtDy
         RQJno7TyxPsTHXBBh/WIgfFwE71DhHFYFO/EbjYdyXCzmLOx13Nf/teCGju/WFg+vErj
         smIPc6NpHdTfXTZ1Lof/4hKf6hEdU8ZuSQJULtM2gxqD48Jo9KW0se6l8vepBSvxxi3c
         G9LgTDLy/wyKXoLYx1FFzKHL2pfq18wJLboUZgxiAC341uv8IiT+9pyaVR1pQ6DXr5NA
         RMW1uVbM5EimFsEaXLtCeJwSzPsEXTokNb/ltFjPIEcXjZCJUZ1yxHZud0Y64Jc/1hAE
         6xzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ACnYwCq6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ee4cb7a264si3265633137.409.2025.07.02.09.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 09:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ACnYwCq6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uX0NK-0001F9-9i; Wed, 02 Jul 2025 12:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uX0NC-0001Br-Gx
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 12:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uX0N4-0006DQ-D4
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 12:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751473892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZonMPNFrdO8TLjY6aHxUkbJPtOMnTEXQ7FtooX1XRqs=;
 b=ACnYwCq6MPLcnBxTVspDDg5AKabA+Vx1hL2icHNdPAx6D4V8ParzDTq/QgGq4HU052gbqE
 ib0WMaKaj96bcFTgmJkw52K1WWxTm863BDkrZiw+2YNQD70ub1aRthK0GYqbTB/B2qzOdU
 cLJGfzI3CIOyQtEA0Z40Vkks3HU55zI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-SOxoQSTAPSiIqScdrmAp5g-1; Wed,
 02 Jul 2025 12:31:27 -0400
X-MC-Unique: SOxoQSTAPSiIqScdrmAp5g-1
X-Mimecast-MFC-AGG-ID: SOxoQSTAPSiIqScdrmAp5g_1751473884
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E7AEA19560B9; Wed,  2 Jul 2025 16:31:23 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4D9F1195608F; Wed,  2 Jul 2025 16:31:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
Subject: [PATCH v7 0/4] ARM Nested Virt Support
Date: Wed,  2 Jul 2025 18:30:39 +0200
Message-ID: <20250702163115.251445-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: RdXIfM7frES1

This is based on Peter's target-arm.next. This is candidate for 10.1.

For gaining virt functionality in KVM accelerated L1, The host needs to
be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
with: -machine virt,virtualization=on.

This series can be found at:
https://github.com/eauger/qemu/tree/v10.0.0-nv-v7

Original version from Miguel:
[1] https://lore.kernel.org/all/20230227163718.62003-1-miguel.luis@oracle.com/
version from Haibo:
[2] https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/

History:

v6 -> v7:
- rebase on Peter's target-arm.next. as a result linux header update could be
  dropped. Faced a small conflict in hw/arm/virt: Allow virt extensions with KVM
  due to recently landed hw/arm/virt: Make EL2 accelerator check an accept-list.
  I dared to keep Richard's R-b though.

v5 -> v6:
- linux header update against v6.16-rc2

v4 -> v5:
- rebase on top of v10.0.0

v3 -> v4:
- fix: only set maint_irq if vms->virt

v2 -> v3:
- KVM EL2 only is set if virtualization option is set
- fixes regression with virtualization=off
- Add checks against unsupported GIC configs until the kernel does


Haibo Xu (4):
  hw/arm: Allow setting KVM vGIC maintenance IRQ
  target/arm/kvm: Add helper to detect EL2 when using KVM
  target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is supported
  hw/arm/virt: Allow virt extensions with KVM

 include/hw/intc/arm_gicv3_common.h |  1 +
 target/arm/kvm_arm.h               |  7 +++++++
 hw/arm/virt.c                      | 13 ++++++++++++-
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 21 +++++++++++++++++++++
 target/arm/kvm-stub.c              |  5 +++++
 target/arm/kvm.c                   | 21 +++++++++++++++++++++
 7 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.49.0

