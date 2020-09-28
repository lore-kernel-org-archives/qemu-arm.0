Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3525330lfq;
        Mon, 28 Sep 2020 03:55:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrfVZp1F1Uk0tYB6nHgyVBL8Pqh/1kD82HuYjRzxz+JB/xH0aY3NsKSW43m4kskXlHNjuT
X-Received: by 2002:a25:900b:: with SMTP id s11mr1098781ybl.426.1601290543070;
        Mon, 28 Sep 2020 03:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601290543; cv=none;
        d=google.com; s=arc-20160816;
        b=blbHX8XIN8E1tOU62bJ4hBeH0kSCfDeNfx6TUSORL7EeoM0INlvW17uFF6vlsC/IEr
         BlUd76bUTaWunvn6zXASuLEjqtz4v8d0a3notkjZ+nyirjtifaKO7ZHVWUMh5Gu9kxbu
         mgYBXRvAtcXcVGjWH3g8rgCgtqTx0LVOAMq7YhgX2mlUpLe8fwSloVzOgLaLlL7ZPpwq
         IiAuKpusqvQDTo11kssIBq46rdu4/bSfVT6RaDO3ghYA9gi2Pg2VDXJd2HGAHYirwu//
         +/2+ibIjm+ELC1ZwVOOme1f/Gj+V9hy6upH9Pq3jXcX6Opy4aNN7J7qXzh2VqVi7z8ES
         Qgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B/O5gsXjKG4eYKRVeKOAbZCyaCMso8Y+a7OWQwBVyq4=;
        b=jwQZAOkydmGWNUZPRCgNuts6p+UEpvMzioXqRrVqEpBrSy7T+6osMYCMl8ppcKi/JI
         eDy3yusivoXxZ4U8spMYkxAxVvwWOL7vivvUBA+YQf1NSbxNJqiTpDsmkKdy2/Cpnyhn
         0CpfSbDVkH7QBF5EwYcBLQyBh7AMQ1B+L+j3pWpOAWcsdL0rlB0TJSxM7eSll9nlSTsw
         FMacr/uR8rKeto8hdxxsgtIBc0rga3D0NvAwGpeyZpht/HFjuznLOG7WPz0wqvIrHpXs
         Bl9vzzlsP8jfkPNgKIM7WC/r0yfj/G9n1jDFELDk1HOr2pJ6WXwkkJua4+DNQbAoLMT/
         +8kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VesCkVAh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a63si451014ybg.163.2020.09.28.03.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 03:55:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VesCkVAh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMqoo-0004if-DG
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 06:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqct-0007zF-88
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 06:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqcp-0006JM-Qd
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 06:43:22 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601289799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/O5gsXjKG4eYKRVeKOAbZCyaCMso8Y+a7OWQwBVyq4=;
 b=VesCkVAhE3g0t4mFSUzuwrhPDg6vlKCoRKbswwhakyndEDHZ+Yox+JN9mxz+BJM33Gu056
 fg5jBFVUM6vgrPdBfhjKr9HMVy/LGUbnr7GsYY8fK0HfvI/yrmPfDEbdWa39sPRHLQGQc0
 w91w1YtPyEQcTel2sJLv/BBEpUIPAow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Tjs6gLsYPd2yhay7ibDYFQ-1; Mon, 28 Sep 2020 06:43:15 -0400
X-MC-Unique: Tjs6gLsYPd2yhay7ibDYFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC46C1074643;
 Mon, 28 Sep 2020 10:43:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE33655779;
 Mon, 28 Sep 2020 10:43:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE96240856; Mon, 28 Sep 2020 12:42:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/12] tests/acpi: factor out common microvm test setup
Date: Mon, 28 Sep 2020 12:42:53 +0200
Message-Id: <20200928104256.9241-10-kraxel@redhat.com>
In-Reply-To: <20200928104256.9241-1-kraxel@redhat.com>
References: <20200928104256.9241-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BtJPP8zcQpOT

... into new test_acpi_microvm_prepare helper

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a9c8d478aee3..cc4579d914e7 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1044,15 +1044,20 @@ static void test_acpi_virt_tcg_memhp(void)
 
 }
 
+static void test_acpi_microvm_prepare(test_data *data)
+{
+    memset(data, 0, sizeof(*data));
+    data->machine = "microvm";
+    data->required_struct_types = NULL; /* no smbios */
+    data->required_struct_types_len = 0;
+    data->blkdev = "virtio-blk-device";
+}
+
 static void test_acpi_microvm_tcg(void)
 {
     test_data data;
 
-    memset(&data, 0, sizeof(data));
-    data.machine = "microvm";
-    data.required_struct_types = NULL; /* no smbios */
-    data.required_struct_types_len = 0;
-    data.blkdev = "virtio-blk-device";
+    test_acpi_microvm_prepare(&data);
     test_acpi_one(" -machine microvm,acpi=on,rtc=off",
                   &data);
     free_test_data(&data);
-- 
2.27.0

