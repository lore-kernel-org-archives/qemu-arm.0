Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5748094lfq;
        Wed, 30 Sep 2020 11:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8IsHFEEyt2ujP6t+l99mL9KnwnA2HsG6t8Lqsr1DpXTSwwLFUqYEc0f6/PAqTbdG+Oxu/
X-Received: by 2002:a25:aba1:: with SMTP id v30mr5345149ybi.518.1601488872387;
        Wed, 30 Sep 2020 11:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601488872; cv=none;
        d=google.com; s=arc-20160816;
        b=JUYPFLXBjsqrbKsc7QaU6hpHbHAEcZHV01oYLw3yzdQMKRsZ0jo1FWpIGm6KT/xs97
         9rZyUMArNt4lI9LUlOsJ/ATNtYZc6sOF1wK4SwdXojS8+ygxWve2p/pkGhha4DnbKh7K
         V7zI4n9ODkwhSMiYGaXPbKRncYCO15xNkZZHI2KJmmNKdoUju/itb3rhk+Zn75EL85Oc
         jYTVJkxKcjw7DxTtwaVYhVeU2GrgT1Rgluhoh9E0tnbKwugT88Ic+XnzdkY0BcaP7yaf
         3sOi8km74uVUUHZz+quope9LIff87B+dMr07BM3hj7omPrNG9BLdmkNqwOpoCat4+v5H
         iR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RekXMZJJi9/OYXpPR25DJMNK7IVPaYnVxBZCNzQlolM=;
        b=HPvrGl2q01yzifisv9vy9TBxS3L5yrc5uJqKjOM7+YhM1LSGWJi9ZTceyYb5UXOfKC
         fH+2Qyuc8XjyekpYKXID0tNPNBpuH0MJ9ese60E2KwRrukx3FFcvErl+I5B5htGOOhwd
         dquxwqYHyY4iTjX4BJOMMFfIDwam3anOi1Rf5HTCbtPD2CAadS2vzdaK7xhGGFWaqbxI
         7h7qUJZ/19a4/IwYyk8APn0Uu/TWfRaB9xiLa0IVKQl1fmmMiGLK/y3xP6yH1gdXU68Q
         dABgu/XPclS+jrhcF3g41YLl3Y+DQn3uPudZVMaV+XehdorlwoCeQUDe01/ZSh+H9Dzw
         1eRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JSOMPhvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a65si2230917ybg.440.2020.09.30.11.01.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 11:01:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JSOMPhvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNgPf-0001fL-Ik
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 14:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEK-0005Rf-4d
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEH-0004l5-6C
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:27 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RekXMZJJi9/OYXpPR25DJMNK7IVPaYnVxBZCNzQlolM=;
 b=JSOMPhvU8l1MY1FoY3Ok7tJgQYMkT40J5wIhkDNCsqiSHZtf1M9CXYLleO8a4yu27atOCj
 sRepv60/o1pl97G8thxHKbfV0rqjUezOwDujpf3tlW3ogOcClVNWmFCtbH2e6TQZ4LFUwG
 0oCnE7qvqggU41VvCp6ynaprbvyHlxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-sd68iLxxMZagu1doMA2Gtw-1; Wed, 30 Sep 2020 13:49:21 -0400
X-MC-Unique: sd68iLxxMZagu1doMA2Gtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 117B3801FD5;
 Wed, 30 Sep 2020 17:49:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AF461002C0A;
 Wed, 30 Sep 2020 17:49:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 723EA3F118; Wed, 30 Sep 2020 19:48:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] tests/acpi: add microvm pcie test
Date: Wed, 30 Sep 2020 19:48:53 +0200
Message-Id: <20200930174856.11296-11-kraxel@redhat.com>
In-Reply-To: <20200930174856.11296-1-kraxel@redhat.com>
References: <20200930174856.11296-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-TUID: 58SBak0ixmvL

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200928104256.9241-11-kraxel@redhat.com
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 7be2b3131e16..edf672d26f0b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1091,6 +1091,18 @@ static void test_acpi_microvm_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_microvm_pcie_tcg(void)
+{
+    test_data data;
+
+    test_acpi_microvm_prepare(&data);
+    data.variant = ".pcie";
+    data.tcg_only = true; /* need constant host-phys-bits */
+    test_acpi_one(" -machine microvm,acpi=on,rtc=off,pcie=on",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg_numamem(void)
 {
     test_data data = {
@@ -1213,6 +1225,9 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
+        if (strcmp(arch, "x86_64") == 0) {
+            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+        }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
2.27.0

