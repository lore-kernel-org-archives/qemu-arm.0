Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3022090lfm;
        Mon, 29 Jun 2020 07:10:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/xSAFqjL5TK4r4UEvjFzR5cxkWx384+6RC8ZlBvXNfO9/seefi0uvVgp5lSPkXNdWAdaP
X-Received: by 2002:a25:cdc2:: with SMTP id d185mr24510701ybf.87.1593439804031;
        Mon, 29 Jun 2020 07:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593439804; cv=none;
        d=google.com; s=arc-20160816;
        b=aaDBW9K+07gV8e41qg8jMP6dJWzvcHqO1QX3pzp21wwnTFkZ1tLqPeYp8vJ6Hd/Fxs
         iznwCpPXX+Kf7j1ZRsdXJbUHZjCy122wkDFZ+0fXNmMPHV6C5ehl4Lli4KQcIgbKKjJe
         EEzfnsRC4cVxl1fymK6jHRuY3SdzmbNrzInSOeWuFjCwG5NRpl6611+6k/XeeDQaMNO8
         vOfUponioxbwfgxmP9ALOE84Krg6HM07VL2zLLswINK+aSSPmudJKKlaENX2+s6LvOvB
         ILLJhfffCqPpia85y3xiaYQS8mzpyk1RWenzTOrPUM+AJG7dqgX52OzMwYrbViBYFXL1
         /FzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Yv4UQAjVGHdERU/SehR0R0a8d5LcgwzEb1dg48NaHzY=;
        b=OWJyM6Lg41nNsPpewhGr0Fa47IFqO37z/pVbE21zElxcanMokKcIlRQoj+uQ5hxOmn
         Df9WFfaWUGhOfy+pVCvoBqYE+oITgnqDiv1cBEg3/6skoJLd+q/hII2l83YzpMw1Yd1J
         ZJTvVC4FljXwROcRN3ijc9Iuncak37QstrvEaXosLoxUkel9sM2OU8CqXlESU9D/3c9l
         KB9lldcUD/k8r9ShnqK9RTa1gX3OwsW0nEQ1tVwjkcK3zKrevKuq+RTswJTwZjbLkAQP
         HPDGk4QNYRA2AGOGk4WC93WFIrS2qmlOHdM1xz5Kk9KlcfF5q9E/9U72rt5+YctFfN9G
         OakQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L+xXbKhP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si945400ybc.311.2020.06.29.07.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 07:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L+xXbKhP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpuTz-0005yC-CL
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 10:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jpuTr-0005wj-Tp
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:09:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38328
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jpuTp-0004Z7-PF
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593439792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yv4UQAjVGHdERU/SehR0R0a8d5LcgwzEb1dg48NaHzY=;
 b=L+xXbKhPY8rC8pz0YNb3yuQpt59UeTuesqauw6s1pG0kTGLw2TSSdissxqrKtEeFpq3agU
 sNC6RXerijy4RkdZy/9MIALIKnI9doUSyj6cypeCanDEJimImW+JJAwONgjhXjk2gpRWkP
 LYuxS88QM5iWGFB5Kp48B6DqC/V1GHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-lvYdyOI2M7GJ028_Ukln7Q-1; Mon, 29 Jun 2020 10:09:50 -0400
X-MC-Unique: lvYdyOI2M7GJ028_Ukln7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A2F5107ACCD;
 Mon, 29 Jun 2020 14:09:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 260632B4A6;
 Mon, 29 Jun 2020 14:09:39 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
Date: Mon, 29 Jun 2020 16:09:34 +0200
Message-Id: <20200629140938.17566-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:10:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, philmd@redhat.com,
 shannon.zhaosl@gmail.com, ard.biesheuvel@arm.com, imammedo@redhat.com,
 lersek@redhat.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tBL/XcpbYZbF

The flash device is exclusively for the host-controlled firmware, so
we should not expose it to the OS. Exposing it risks the OS messing
with it, which could break firmware runtime services and surprise the
OS when all its changes disappear after reboot.

This change was suggested by Ard and Laszlo.

Patch 3/4 is the meat. The other patches deal with updating qtest.

Thanks,
drew

Andrew Jones (4):
  tests/acpi: remove stale allowed tables
  tests/acpi: virt: allow DSDT acpi table changes
  hw/arm/virt-acpi-build: Only expose flash on older machine types
  tests/acpi: virt: update golden masters for DSDT

 hw/arm/virt-acpi-build.c                    |   5 ++++-
 hw/arm/virt.c                               |   3 +++
 include/hw/arm/virt.h                       |   1 +
 tests/data/acpi/virt/DSDT                   | Bin 5307 -> 5205 bytes
 tests/data/acpi/virt/DSDT.memhp             | Bin 6668 -> 6566 bytes
 tests/data/acpi/virt/DSDT.numamem           | Bin 5307 -> 5205 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  18 ------------------
 7 files changed, 8 insertions(+), 19 deletions(-)

-- 
2.25.4

