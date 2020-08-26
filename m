Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp645155lfc;
        Wed, 26 Aug 2020 03:59:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5t62fjZ9JYwVtUg/yoWIgndSP/MqfBPPx0MaCzIPkM/vsACsFTCglKzHTpCPUounurBky
X-Received: by 2002:a25:ca50:: with SMTP id a77mr20813419ybg.286.1598439579658;
        Wed, 26 Aug 2020 03:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598439579; cv=none;
        d=google.com; s=arc-20160816;
        b=m1vmsX7mLBFs6tMFLXwStn+gpv6IIs2uM91YTeDv3QjNy7YWdVZH/l8YnYdZ/x++aH
         V/upGxWHnaIGQmIySzFiGowiAhUyjLBCyj/qMI1qRsWhAc3AGFWi76NlFMAAZQ20/6aY
         kcA/qWSYcT8tl+FaZWrWFCWZW1mA4jrxr3dZ7SX4cqASaUmnxquC0LxtptS5H0bf6L2X
         bt2ndy9wOccHS9w1kYgtTTxLy6tPcbPpNJIacIL86idAKUUsKyLykco9lhnZN2yDZSRN
         Dj1uzbeG/B0rfWWt97WeWDnmhG9KcwTkWHKTFKdl2GttJuFINgtV2DNW4X3VVDbx+ru1
         j/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1v/PAt3CshJX/VrDKv2rrFSFurASfaywl/Okvrdx+NQ=;
        b=RluNIdkC5utYrWEbOGqRIm9RWMePZSdCGKvmDqpI36haEWPkYqIhFg9TiSkpq2ukrY
         XqekO9eIrurA+CI3Aa+++mustJYbySUL4Y2KeHApXIOR/DvaGL79qeuzXxgYwO3rk1Mr
         /3xvF+RWa2QY+H/DFReXmvaFMGt/kcBRffwLg5Sa6Aqkkab3DgaVsNNkmoScKsuAr4hD
         U3Mu+k8uMGlLsqlvSNN+VTce0evXcs42+WHk7uv9VWuNAlujc0RmTK1j4Z5EDTlo07cr
         uUobqyfZj1rsigQgCY75uQvUKS6H9lTsx71/ohA9vtCaI8gKNKFmdxGgPZTbtzMitx0j
         JSHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="IS/XI7VT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o77si1946625ybg.74.2020.08.26.03.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 03:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="IS/XI7VT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAt9X-0001yB-2u
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 06:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3T-0006CZ-VN
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 06:53:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54930
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3I-0001Xm-Gw
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 06:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598439191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1v/PAt3CshJX/VrDKv2rrFSFurASfaywl/Okvrdx+NQ=;
 b=IS/XI7VTotHE6wMPttjwTH86DEc7LtO6lNLMhcfHSui44G650zCyMTjnHQh6TygGfBGVmv
 w1P/oInik3YA2v89HzfqD+YS4A3ejlhi7UDQO6UOfEsafm9pqF8yMql2ol8z4B2E9TWZoX
 Hq58mcJvpy5ZY5b3HrTeRgNGHZ94+Iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-8FVxc0hcNvCp6OPrGwtFdQ-1; Wed, 26 Aug 2020 06:53:08 -0400
X-MC-Unique: 8FVxc0hcNvCp6OPrGwtFdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DFC186A58C;
 Wed, 26 Aug 2020 10:53:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9147E5D9E4;
 Wed, 26 Aug 2020 10:53:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF3F431FC3; Wed, 26 Aug 2020 12:52:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/20] tests/acpi: allow microvm test data updates.
Date: Wed, 26 Aug 2020 12:52:51 +0200
Message-Id: <20200826105254.28496-18-kraxel@redhat.com>
In-Reply-To: <20200826105254.28496-1-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xbHIVO1NzoWQ

Also add empty test data files.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/microvm/APIC                | 0
 tests/data/acpi/microvm/DSDT                | 0
 tests/data/acpi/microvm/FACP                | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/microvm/APIC
 create mode 100644 tests/data/acpi/microvm/DSDT
 create mode 100644 tests/data/acpi/microvm/FACP

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..97c3fa621b7f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/microvm/APIC",
+"tests/data/acpi/microvm/DSDT",
+"tests/data/acpi/microvm/FACP",
diff --git a/tests/data/acpi/microvm/APIC b/tests/data/acpi/microvm/APIC
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/microvm/DSDT b/tests/data/acpi/microvm/DSDT
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/microvm/FACP b/tests/data/acpi/microvm/FACP
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.27.0

