Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1530472lfm;
        Sat, 11 Jul 2020 03:11:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlu8JHhR11BthfF+eOUGVsXM7u/u/1gY2i8o881hOD5VX9qAy+0UzLy6oGqbX5TjA4VgK3
X-Received: by 2002:a25:b3c9:: with SMTP id x9mr123143383ybf.203.1594462265304;
        Sat, 11 Jul 2020 03:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594462265; cv=none;
        d=google.com; s=arc-20160816;
        b=HEiglJ3uxBUQ4Pon8ituzQ/2+Lg4hoFuSsWbOZ04XTnh+hDKNae3q9Fc2wzWHikzG0
         u5ecRspBZFeLV/hIKtGxe7DF5yR/k+3bZ1QMzUG8o9+yQIyHB06TxqhYUQCMLXwu8c8p
         SCgXGXZU/uyOcEGxm395rxcDnYvAogbXLKmWcNU9DLfYN5ZkypDEZ2H7uULlg1xMS94J
         Bk/8RC0IrG+nq9eNbI/yz6K9A86XAP+agmA0lUjKmsqF8lE1tXaRp8XR26HtA6FVMvG+
         2Fhe/fGGUTTNRC1lwLTxAUxJIu7pF5dnJj+EqSwnu8C56cH2D/DuUBa22g2CzXwEQqRU
         qzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=E5TVbsllvHb7k2KOJnzIsk6p4lNKAkI/R42Q7r3lHqI=;
        b=ECN+dmURsMhH3TuSBpE3zlG88Nu7OabbcUGBoqbBaTMRmNkxeE0M5n0FlyqjWRYfgM
         MAPY/hNXKt6i5ogTL7K+EFV3g8X+1YSv4CUAFaIo6EtqoMqJ24hy4wPsr6WiZkTdP8F5
         TkPXsOGZf3LLe8c89UL59Lp+by9GQiLRVT6yfvPDZ2yZ3aLhi0txg8TovCxMwdKCQ5Y6
         flMiJfJ2sbNiZM6cRN/bgK5FlOtC6p5vhcYFIiuDdYSddygu/qdFX0JDvgrSw9NqWz0X
         XV30zvI5AHk2VJuPzo02falEtkjuCwMV7dgE4GZARMjIM96Pta0My9Q77W4+n7mWTmYr
         N7ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tej+TiFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si5077919ybk.9.2020.07.11.03.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jul 2020 03:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tej+TiFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juCTI-0000bY-Iz
	for alex.bennee@linaro.org; Sat, 11 Jul 2020 06:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1juCT1-0000Ye-68
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 06:10:47 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33456
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1juCSx-0008D7-Kz
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 06:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594462242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E5TVbsllvHb7k2KOJnzIsk6p4lNKAkI/R42Q7r3lHqI=;
 b=Tej+TiFS5y+4Wk4J2r6mmZkASYBAREmASdt+2HOlL4wJOtv+f8R26UFDAzjgeQL54pILsR
 EH1+3deIObZFEkc9xfUJ99MpGo5bybuQchtscFHXPMbaxngXwM4zcW0dunQsckSXST58qw
 2CzYwIgvJTjGJny8ARFP1BEgu8S+g/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-qCXivhVbO8y7MY2jp7bKbA-1; Sat, 11 Jul 2020 06:10:38 -0400
X-MC-Unique: qCXivhVbO8y7MY2jp7bKbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25D9B80183C;
 Sat, 11 Jul 2020 10:10:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6AD91E8;
 Sat, 11 Jul 2020 10:10:35 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/3] hw/arm/virt: Introduce kvm-steal-time
Date: Sat, 11 Jul 2020 12:10:30 +0200
Message-Id: <20200711101033.47371-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/11 06:10:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OX/xxg+gCedC

KVM supports the ability to publish the amount of time that VCPUs
were runnable, but not running due to other host threads running
instead, to the guest. The guest scheduler may use that information
when making decisions and the guest may expose it to its userspace
(Linux publishes this information in /proc/stat). This feature is
called "steal time" as it represents the amount of time stolen from
a guest by scheduling out its VCPUs. To enable this feature KVM
userspace must provide a memory region that will be used to publish
the information to the guest. The memory region is typical migratable
region. The GPA of the region is given to KVM through a VCPU device
ioctl interface. This feature is only available for 64-bit hosts
running 64-bit guests.

This series provides the QEMU support of this feature. It will
be enabled by default for 5.1 machine types and later, but may
be disabled with a new CPU property "kvm-steal-time".

While testing migration it was observed that the amount of
steal time as viewed by the guest was getting reset on each
migration. Patch 3/5 of a pvtime fix series posted[*] for KVM
should fix that.

Migration testing:
* virt-5.0 can migrate as usual, no kvm-steal-time enabled
* virt-5.1 can migrate between hosts with steal-time enabled and
  disabled when both hosts support steal-time
* virt-5.1 with steal-time disabled can migrate to a host that
  does not support steal-time
* virt-5.1 with steal-time enabled will cleanly fail when migrating
  to a host that does not support steal-time

[*] https://lists.cs.columbia.edu/pipermail/kvmarm/2020-July/041538.html

Thanks,
drew


Andrew Jones (3):
  hw/arm/virt: Move post cpu realize check into its own function
  hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
  hw/arm/virt: Implement kvm-steal-time

 docs/system/arm/cpu-features.rst |  11 ++++
 hw/arm/virt.c                    | 103 +++++++++++++++++++++----------
 include/hw/arm/virt.h            |   2 +
 target/arm/cpu.c                 |  10 +++
 target/arm/cpu.h                 |   4 ++
 target/arm/kvm.c                 |  20 ++++++
 target/arm/kvm32.c               |   5 ++
 target/arm/kvm64.c               |  70 +++++++++++++++++++--
 target/arm/kvm_arm.h             |  24 ++++++-
 target/arm/monitor.c             |   2 +-
 tests/qtest/arm-cpu-features.c   |  25 ++++++--
 11 files changed, 232 insertions(+), 44 deletions(-)

-- 
2.25.4

