Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp552203lfq;
        Tue, 8 Sep 2020 05:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU9sBJBpSoD9PuXg9OAMmswgvsC4aHtJ4ny6XLEsrh1LDUloSHMVkheLGDCpMD/Kdpu48m
X-Received: by 2002:a25:dcce:: with SMTP id y197mr9366070ybe.304.1599567571787;
        Tue, 08 Sep 2020 05:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567571; cv=none;
        d=google.com; s=arc-20160816;
        b=0z5i6kFFOL5gnGDgUSguKtvVZh8g4F6z5tz0A2rQpvwJ55omnGwzYugFRRL7Oz/8sm
         qokEzmZWKw/exX1OhxG7bo8fvgJDMnY+U3/SKYJxoZOu/qAJVWFkGg5HpE8tMMpJDMGe
         fnE9DJQcV/EbOKvpCArUFs8wLm03l1CoJYzuXL9egLDpxyyzdxbyW1nd1MMTQsRtd3zs
         08kCBRndT0AoJxEDOjWbAU3HMO+xECMYQJry5W+YbTQ+6tRB82rjO1f7VmGCNwTfgMeX
         5kiGEsxxRvKNt/EaUg1gkXWK+n/433LGvRNvNrkI8lYjj2dcScFtDUeXMz7NjLFx0DMB
         UmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f0j/2GpDmP1B6JzBQEJ4sMlLnicgwb2jxZZq7qWpABA=;
        b=dYWu6JgpE/UR0nOtHWo4MXDWYOM/g5YUJtA6S4fpEYE/fg3SZHeOdz0EE0v9WLPfDN
         t76ACa32ocJTjnejUjSrejosd5FpTxshY8H3JV/9I5fQDEU1XSGdKg6kG0G0x0L8bh3t
         6Qa6HOqjvW2V2O6b7HO/L5A4P06LiER1OJwoNV3VPMcNt3BdH2S/o86hJlhYaGTVew4U
         2XkeZ9lO/E6ZVpUR/l7l9ONdfelpr2/an26eNUQWZonUqx4TRb16SDF0veGQDFg/IFJz
         r1p4I7/9Oeq3YVNYDuC5PK9L6/84t1Gy10seN1km8Uu2hvOjNMr3ZL9OitThN1El8173
         NzzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ftBZHTVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q132si21562412ybc.128.2020.09.08.05.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:19:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ftBZHTVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcax-0004L2-54
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcTM-0001LU-UL
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36907
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSz-0005gd-Oh
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0j/2GpDmP1B6JzBQEJ4sMlLnicgwb2jxZZq7qWpABA=;
 b=ftBZHTVObZOtu+cu4Qc3buHmJLmL2RhLxmCT8FzkqBVSIrVa/Hd79X5xtoWo+YyN5HpHHE
 RfW7jtv2XdnZRMKn1HD6HspC3wFLhrSYbWNTDkHmtlxOyCsseMAkBOiqBV8LJCigWI2kA8
 23pLJw+GVWBXY6d2JyCLwBSNIom1eVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-zoPMqAYeP3OomxHwBv6fNw-1; Tue, 08 Sep 2020 08:11:06 -0400
X-MC-Unique: zoPMqAYeP3OomxHwBv6fNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6A538030CD;
 Tue,  8 Sep 2020 12:11:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49CE05D9EF;
 Tue,  8 Sep 2020 12:11:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 54CB031FC5; Tue,  8 Sep 2020 14:10:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 19/21] tests/acpi: add microvm test
Date: Tue,  8 Sep 2020 14:10:48 +0200
Message-Id: <20200908121050.1162-20-kraxel@redhat.com>
In-Reply-To: <20200908121050.1162-1-kraxel@redhat.com>
References: <20200908121050.1162-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: ykUr8mW8Q9yy

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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

