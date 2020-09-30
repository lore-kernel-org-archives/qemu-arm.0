Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5740866lfq;
        Wed, 30 Sep 2020 10:50:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw68z13Kaf/ZXYyzharqMDX0aYtot56Z2cPb6PIzJdrZrPA5EbITxUiggePIk3ppRt8KByD
X-Received: by 2002:a25:dc13:: with SMTP id y19mr4830859ybe.405.1601488250498;
        Wed, 30 Sep 2020 10:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601488250; cv=none;
        d=google.com; s=arc-20160816;
        b=jzkdTUpaPgOHnTMOl7wYepabY7lln7D43KcV9XucGJN2q0eWthuam0e9+tuULZfo/x
         I6/BATKe6fbpbNTG7b9WEJBrY+QqINUUeT7scWh6EPsq5e7VIkJxpBvNarlnkb3xcddm
         7l0GKPwWZiY/dlLg4nl3PxYB4tn59XOm4dTqBKhmgkmiVXvcRPx5kMpwgdpnxwNeiG/S
         71onFx2pXbJZ2aLpylNvFVNqVk/3Ez1nJemt2zUxpKZM9S8NyNgWrZ7s/toZyFh165M8
         9iVeH+ZJXjuK+s6PxRrSVsMxw+e7jeIvs90lOX3ySGZv4AKRQzaDVYAX6HSuoarGp0ds
         BHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q3ouUYdnTz94BBlJ97EBXNxl8ZqHk0G7VvlxtQAWHw0=;
        b=BfRQD0GGZT96mHlXILq50tUy4A9jFf5yKjlEgpS1kdMefy9yF6gbI20/r6fCXfKH6u
         Ttnvy+60Dz5awT6jEfGNM93F69RIWFJko64GXfdpC44d0NbdXb7NwvJB2onK08dCnqtJ
         D2xpOY2oOV+LeN37X8jxh+Tih2QaGYI+tv9/HMCeT3ai1iMhgBrnhnzxiHjK16jYe/Z3
         vWlaHQmuUVskMWgZZweUXUwa46fBfMALZaYfS8OdS4VqkCFIHsCjc4oFxSciyZuFXkRG
         FJoZafhJj/0X8Cjks4PG42T1RW1689ll99o8BVHwArJK7LZJit48U41U3CexIIhMe5qh
         gYtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PonrIUGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c64si1078031yba.290.2020.09.30.10.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 10:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PonrIUGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNgFd-0006u1-Hn
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 13:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEE-0005FD-Sm
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgE7-0004if-UR
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:22 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3ouUYdnTz94BBlJ97EBXNxl8ZqHk0G7VvlxtQAWHw0=;
 b=PonrIUGrPAViZKrwJs/iNMcMiQ1TOj55eAxNljbJlb0J7OgeL3pe2f4W2dskuzLQ9NKg6w
 TSvPd/QgKu5lXLDPpycvdcWcEZP/yOmoedufMncHx4RE2zpPq+QyMySj3/egQYJFDmK5t4
 NFnqsYKJZHZO7M+PbIdrEfAsW1IF7uA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429--4wD7cf2N3Gw_VrFm7hHHw-1; Wed, 30 Sep 2020 13:49:10 -0400
X-MC-Unique: -4wD7cf2N3Gw_VrFm7hHHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5392C64141;
 Wed, 30 Sep 2020 17:49:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 025055C1D0;
 Wed, 30 Sep 2020 17:49:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 51B3B31E23; Wed, 30 Sep 2020 19:48:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] tests/acpi: allow updates for expected data files
Date: Wed, 30 Sep 2020 19:48:50 +0200
Message-Id: <20200930174856.11296-8-kraxel@redhat.com>
In-Reply-To: <20200930174856.11296-1-kraxel@redhat.com>
References: <20200930174856.11296-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /kmADQSZ7NhU

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200928104256.9241-8-kraxel@redhat.com
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..53109c22a56f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/microvm/DSDT.pcie32",
+"tests/data/acpi/microvm/DSDT.pcie64",
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/DSDT.numamem",
+"tests/data/acpi/virt/DSDT.memhp",
-- 
2.27.0

