Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1039967lff;
        Fri, 6 Dec 2019 09:27:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxD4vE4fCxFLwnwg8vAALPUM4XkPG6+ADcZI36HpqYN3l6SYL7AXcLVhGkmoltRqSLGSRW
X-Received: by 2002:a9d:70d2:: with SMTP id w18mr12479907otj.48.1575653261840;
        Fri, 06 Dec 2019 09:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575653261; cv=none;
        d=google.com; s=arc-20160816;
        b=VI7RSb1jHjalG/JibTs+eNridr1sR7Ef2b1CrWoPidJMt20VejtDvtSJHbZXlHDn8C
         7vjnzhtduA0EJQx6K7k6kKs0HBLJULswyvt57+A1poPSzmRQrQE7In+Vmo64pQR5F3Iz
         gmKlFfhh/dd9KDFJj5P6/AmBWBnNPCoDoDa8SGxNoBdIgZijzYTfn78XSVsM5I8AX+0z
         +rwB+VQvJtVTcQJzMKZ1/QP2l6QO5AGCTgpYeBZbVHnXpuHRAjix1Iwk4zgwlJABsgwP
         JLSqVJaOMYhK51cM9KypSyiIdsrK/7aBtJI0S49dTy8sjOyJjcFrRdOdxZXgbR+iZfYU
         KT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aakNe6ZpWKcgBnsHkUK2g0Vs/5LZCUeTONSVZshyz7w=;
        b=hMvb6pOzVCZBPfy1PkwYcXKoyZ8WGVjgkgybr358AL0feRHgvicaNVGjHUkLBe9ZHf
         6xSEICLoLxGKb3WKumyts0pEhvMR5hdNtWNifYD8e8N+/jlWN4zHKQAZgPJ9S+1tAFZc
         tr6zon5qRw3U8btEb1kFhRmsHXnytpCzLtr8f+ojNIjBycXUJzRrB142LaVm+fWL2gzI
         gGIGX86JyN5oOZc8jcW+NQXoAcFQXfmooy+YqThLNwN41OyBWsLmENWk2E/7O2A3fk91
         1ErRDDjIs3XkaX6r4ytnig6BDCm8KGWq0RqY5nrzdKsTMzUQ1VZAWWW6x0XzvAklqK5G
         3SKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/cX5IFR";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g6si6984218otb.231.2019.12.06.09.27.41;
        Fri, 06 Dec 2019 09:27:41 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/cX5IFR";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfLFR1k (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 6 Dec 2019 12:27:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54715 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726287AbfLFR1k (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 6 Dec 2019 12:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575653258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=aakNe6ZpWKcgBnsHkUK2g0Vs/5LZCUeTONSVZshyz7w=;
        b=g/cX5IFRjINdqnxG1fMspMs+PpzWmjtELZ8nBFyg8kMZz/Sx+bvoPJIL7qMEXGtJrhgidB
        WKjACNnmknIXE3GAgSzNtTaRRGJOolLxvo91HSFowz6udq3s1af2r3ohGdoCtYsz+xz9ZV
        SRPQLMoEc9wPeoFRvYEvhG/riBV5XOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-mx1TiMz0PQSCxMj6L9ao7A-1; Fri, 06 Dec 2019 12:27:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC14800597;
        Fri,  6 Dec 2019 17:27:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8C6426CE40;
        Fri,  6 Dec 2019 17:27:28 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org
Subject: [kvm-unit-tests RFC 00/10] KVM: arm64: PMUv3 Event Counter Tests
Date:   Fri,  6 Dec 2019 18:27:14 +0100
Message-Id: <20191206172724.947-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: mx1TiMz0PQSCxMj6L9ao7A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 2xraNrj0CGeD

This series implements tests exercising the PMUv3 event counters.
It tests both the 32-bit and 64-bit versions. Overflow interrupts
also are checked. Those tests only are written for arm64.

It allowed to reveal some issues related to SW_INCR implementation
(esp. related to 64-bit implementation), some problems related to
32-bit <-> 64-bit transitions and consistency of enabled states
of odd and event counters.

Overflow interrupt testing relies of one patch from Andre
("arm: gic: Provide per-IRQ helper functions") to enable the
PPI 23, coming from "arm: gic: Test SPIs and interrupt groups"
(https://patchwork.kernel.org/cover/11234975/). Drew kindly
provided "arm64: Provide read/write_sysreg_s".

All PMU tests can be launched with:
./run_tests.sh -g pmu
Tests also can be launched individually. For example:
./arm-run arm/pmu.flat -append 'chained-sw-incr'

With KVM:
- chain-promotion and chained-sw-incr are known to be failing.
- Problems were reported upstream.
With TCG:
- pmu-event-introspection is failing due to missing required events
  (we may remove this from TCG actually)
- chained-sw-incr also fails. I haven't investigated yet.

Andre Przywara (1):
  arm: gic: Provide per-IRQ helper functions

Andrew Jones (1):
  arm64: Provide read/write_sysreg_s

Eric Auger (8):
  pmu: Let pmu tests take a sub-test parameter
  pmu: Add a pmu struct
  pmu: Check Required Event Support
  pmu: Basic event counter Tests
  pmu: Test chained counter
  arm: pmu: test 32-bit <-> 64-bit transitions
  arm/arm64: gic: Introduce setup_irq() helper
  pmu: Test overflow interrupts

 arm/gic.c              |  24 +-
 arm/pmu.c              | 754 ++++++++++++++++++++++++++++++++++++++++-
 arm/unittests.cfg      |  55 ++-
 lib/arm/asm/gic-v3.h   |   2 +
 lib/arm/asm/gic.h      |  12 +
 lib/arm/gic.c          | 101 ++++++
 lib/arm64/asm/sysreg.h |  11 +
 7 files changed, 922 insertions(+), 37 deletions(-)

--=20
2.20.1
