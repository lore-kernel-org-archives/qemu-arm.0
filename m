Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1840782lfm;
        Thu, 2 Jul 2020 13:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuF84y6CKCEegE/JO/YbA9S6p2gLS12ayZ+pYv5oibjPDmDO9avEDvdOQ7yhe++iO8ElMj
X-Received: by 2002:a25:504d:: with SMTP id e74mr49406286ybb.47.1593723422254;
        Thu, 02 Jul 2020 13:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723422; cv=none;
        d=google.com; s=arc-20160816;
        b=whCV4h5e0XFqdFZSDkAnUeCgg/aVcLiZwtpc9is+fkYwre3zRnUODNhPnyfmNAiRDc
         5ECiwxm/RIJGKIFPAFqtM5S8w8LXMic01gKrPVGgl/0lEx2rGAW6soLfwQSH1OrkuXGt
         35feRVO71SctYFNrIzQnLgoJJE9+NLJVnOZUd9L5voA8uH0AO4RV8xMjveM3Z1KFo08w
         LsS4r6tT53KKSQB74NqopScFlbihrpMSrxSrXW37kFfxmtIikwukiMiPeS/L9YRRclQB
         KTTJWYNF4TY6uufLoNLbRXfJvswWeCL66Z+0ltjkq1s4lyiEgsLXBb1RXy8YSngZSQjg
         E2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=yIBA7QMbjRBBosF8Z/aCMKZ6+Ye92UgyjrSu7U7xbDM=;
        b=oa6hn3FhjHjZdoObZW+UWKKZlN2f/iT9/syq4LJSKsoxoqxF89OJele6njktgzWO9k
         kPxR7EcQrm+XYJGx6LsN0SY9AYyIcfpJHDloFurssBDrGSAxxN54oY7uhpvzkfw08RYF
         dSgKBvkAHSWi+sCpI3AfHSethNSv5gK5uteOknWWYQMWhdV0dkljIX1Ze28WgpEhc9Aq
         E7cGUxJ3s6dbiNY6oBegyhWAQcCWmeSKN9uOpprIFePyyb1UVvO8lvgTjoDmbjBVu8ly
         IAw8GZ3SLoahlMVUHYVrt01ybuigOqdZjifhUa0hjMFGvDSspnK+1OHQe/zomvEG6+O7
         bHHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EsIn3H1A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si2224103ybc.47.2020.07.02.13.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:57:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EsIn3H1A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6GT-0008WG-2h
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69J-0004uu-NR
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 16:49:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41159
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69C-0003aJ-11
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 16:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=yIBA7QMbjRBBosF8Z/aCMKZ6+Ye92UgyjrSu7U7xbDM=;
 b=EsIn3H1AhOGCB7jDMbBm929TpadP/ueBlZ23L0ZTfCmHCFrWdBloVBeweCVIfi0/K/Nr70
 CejgAX2f+hPoctSHTuSH+tNyftKv3jrWkj7ThGmA6tEI/6wdvmFMOiAut7AGi2+nI82/QE
 43cRBuv+vRmuEKebaJCxI/UwgbfCZoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-apRVKeCVNgu9xUPp8zXcJg-1; Thu, 02 Jul 2020 16:49:27 -0400
X-MC-Unique: apRVKeCVNgu9xUPp8zXcJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0BB8107ACCA;
 Thu,  2 Jul 2020 20:49:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C3E81025EB0;
 Thu,  2 Jul 2020 20:49:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 974FB31F08; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/21] tests/acpi: allow microvm test data updates.
Date: Thu,  2 Jul 2020 22:48:56 +0200
Message-Id: <20200702204859.9876-19-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MprPvCrtaktZ

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
2.18.4

