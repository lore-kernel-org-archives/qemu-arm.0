Received: by 10.25.44.15 with SMTP id s15csp857978lfs;
        Wed, 19 Jul 2017 06:52:32 -0700 (PDT)
X-Received: by 10.55.3.142 with SMTP id 136mr141856qkd.275.1500472352799;
        Wed, 19 Jul 2017 06:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500472352; cv=none;
        d=google.com; s=arc-20160816;
        b=hoAa3A5nBzYUADu427fG7cnW6uZGU5U+zgepviGpfTOdRZYB8J9cYRGtkQh8SHZBjx
         mSKNoQTQ2zeJBWnTxKfe0uM9GWAOVVnSa/t//jK8PCRcig2OUTh5bUgHRKQC5kRgCDIF
         YDIG8T1doHAIFNQGhEOooIRFz/UPwjn+USn6V40o2L71aOoLcrJhC0VoUli+brmzOIzH
         tazJ6dWSpSHo9sucf/or0oMku+1hmQ0EO4Ynu7RwrYVVJApl/xRDBazzeN+UoUOptT4P
         nXO+hfhSjhceDFsP5B6yOkhV9jhz5mVauUxJUfQx6x0m0WQwV6PeQJrhwETPAD9U7eCn
         +NkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=CZoHAuqPloDnIRjRADPUbmeWn7NNeSZ+27dud6B/OEY=;
        b=0+LM5rNFgBORu4UVRmRsp8bfa6yCkJ3tOYkBQVDTRerx6nehMuHcSq6KBsN/UhUSyZ
         yIJoW53r2s3qVPSLFQls4q7YtQ1ihhwjcVZtWhyfaZMsdz6wZpzT0rc9HTVjk8u51hiU
         5FnZZMc6egQ+SfrZz3LonFxlhzGaGqtX8EKUB8CX/eCGRTrl3mtYuFZEnIJSiHqHnUTF
         X8sjn2sKafmJHTRr5JUJ0RNCI0xQ3sToJJ40kFuw9KsQDYOMDuqDBLAsPyPkWkrkbesL
         aOoUz0wVqa1G7hbwmqVpDuZlXeLc52XDtdvW7VmgQmmLSdQ+nyKLNkvCj38PjYSfqp4v
         Ra0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z20si51149qtz.530.2017.07.19.06.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Jul 2017 06:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXpOw-0005M1-30
	for alex.bennee@linaro.org; Wed, 19 Jul 2017 09:52:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpKk-0001fp-2S
	for qemu-arm@nongnu.org; Wed, 19 Jul 2017 09:48:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXpKg-000884-3L
	for qemu-arm@nongnu.org; Wed, 19 Jul 2017 09:48:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dXpKf-00087p-TG; Wed, 19 Jul 2017 09:48:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCA2D7CE04;
	Wed, 19 Jul 2017 13:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CCA2D7CE04
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CCA2D7CE04
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13B4617DE5;
	Wed, 19 Jul 2017 13:39:57 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 19 Jul 2017 09:39:53 -0400
Message-Id: <1500471597-2517-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 19 Jul 2017 13:39:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/4] ARM: KVM: Enable in-kernel PMU with user
 space gic
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, agraf@suse.de, cdall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XPXs7oPkUPUz

v2:
 - renamed the kvm pmu 'create' function to 'set_irq' after doing the
   create/set-irq split
 - added another patch that improves the error handling of the kvm pmu
   init and set-irq calls

Andrew Jones (4):
  hw/arm/virt: add pmu interrupt state
  target/arm/kvm: pmu: split init and set-irq stages
  hw/arm/virt: allow pmu instantiation with userspace irqchip
  target/arm/kvm: pmu: improve error handling

 hw/arm/virt.c        | 12 ++++++++--
 target/arm/cpu.c     |  2 ++
 target/arm/cpu.h     |  2 ++
 target/arm/kvm.c     |  6 ++++-
 target/arm/kvm32.c   |  7 +++++-
 target/arm/kvm64.c   | 63 ++++++++++++++++++++++++++++++----------------------
 target/arm/kvm_arm.h |  9 ++++----
 7 files changed, 65 insertions(+), 36 deletions(-)

-- 
1.8.3.1

