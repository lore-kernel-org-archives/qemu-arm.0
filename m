Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp610697lfq;
        Thu, 17 Sep 2020 07:04:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1IlQr51uvHfpObXXbRmrnzfbbPWYba2/APp5dm/PEz6mneamMqI/GZWT7TqdXSG7gFrz6
X-Received: by 2002:a25:3453:: with SMTP id b80mr43298377yba.237.1600351476323;
        Thu, 17 Sep 2020 07:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600351476; cv=none;
        d=google.com; s=arc-20160816;
        b=RRSN3PEgM4Jm+2tUpVMhUNKMzpEwV+Ce9vF77onHuI5Wg2D7sim/mu5nJjKEyDE09o
         3WUwS2M/zBYMzHi/c2TCW6cCkxBlijH45LAbJdGAHgxCAy0n6O4ke6qPo9VI+cxnmdtY
         eQTx/tTTMmLXoQCc5CyBcgpXa3+EkIrv/6mF8XgIPyVYUv9AdovcXWxNyIGWTngTNVk7
         c18xT+iR/z1pJmxC5I1v7Wed7ofaIjIUUU6e2+ULTvWnx5ledqhBqWkSLlRZu4lD5FAq
         PLqVcirbdKzrrRTlicq7AVpFV07npLC9JlRkQHZ2ZGfUzqRQx5P8UnmrPTzr+g4b0BPr
         JGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OBWwH2JOgMjl175A0Nv8hCTs4F3D2NFsUPK+rhSJCCw=;
        b=l40vpGNZ7vjZt5332dUJe8aipttD0nDZXzCcP1N2SMyyiyQ8wQqHU4PaYYU9lu43mU
         l77IQ1OxnBEA+MDYOq1W5wOeO8BrHKl0P14o5XQkOG4JLshNOwEcr/mQtJLySBrCSjGZ
         31ES8uXBmSGkwHZCFg+ysLx2s/STbjN0ABU09wE7lORoIBkXxcmeKYpSGqaCnI0tIfna
         4HAvn0sZDo+29KW7slkqIeZUJkwQFUT3q48TLcrcQFYMWBS/O+CYOBdIHYVn1porgh3P
         AYIz4gMSg3uNoOtSWo5wzjo7JcLT+q/IUiN9jgWftG4fTD0+yuPZbdwfrO7+hAjoJWEa
         JpLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aVymR4zN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q81si25131541ybc.214.2020.09.17.07.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 07:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aVymR4zN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIuWZ-0004Xg-El
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 10:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuMJ-0008UA-Kx
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:53:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59236
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM3-00083i-6c
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600350822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBWwH2JOgMjl175A0Nv8hCTs4F3D2NFsUPK+rhSJCCw=;
 b=aVymR4zN6wOXMimkkDEW8VTnl7DR08i4IwNUXEKcNZlYYqq2JWFtId5rQEyKYTVqOZSSEA
 8v+aiBmYLrvRGcj/uXGTKr1EH4BLQW8m6vtBIKOST54gQixpqvHtSqkzgv3HLaEJpptHmm
 KiMl9xYo0/kBYTGbmCI7DgjixvigRS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-Gj1dXkIQNsmY_zD6qY41VQ-1; Thu, 17 Sep 2020 09:53:39 -0400
X-MC-Unique: Gj1dXkIQNsmY_zD6qY41VQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97C5F1084CA3;
 Thu, 17 Sep 2020 13:53:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F07363782;
 Thu, 17 Sep 2020 13:53:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 702A331FAA; Thu, 17 Sep 2020 15:53:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] tests/acpi: add microvm test
Date: Thu, 17 Sep 2020 15:53:21 +0200
Message-Id: <20200917135323.18022-20-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
References: <20200917135323.18022-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: htgVcgAW9K0/

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20200915120909.20838-20-kraxel@redhat.com
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 1779af1cc889..a9c8d478aee3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1044,6 +1044,20 @@ static void test_acpi_virt_tcg_memhp(void)
 
 }
 
+static void test_acpi_microvm_tcg(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = "microvm";
+    data.required_struct_types = NULL; /* no smbios */
+    data.required_struct_types_len = 0;
+    data.blkdev = "virtio-blk-device";
+    test_acpi_one(" -machine microvm,acpi=on,rtc=off",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg_numamem(void)
 {
     test_data data = {
@@ -1161,6 +1175,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
2.27.0

