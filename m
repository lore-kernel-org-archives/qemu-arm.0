Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3520122lfq;
        Mon, 28 Sep 2020 03:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTu/3OKJ5yv/IaECPbSedmpuMPX+ou1qp8qxT23YqA3itsmA47T4ks4z+6yGnwdqlwMJzJ
X-Received: by 2002:a25:e710:: with SMTP id e16mr1132941ybh.358.1601290002681;
        Mon, 28 Sep 2020 03:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601290002; cv=none;
        d=google.com; s=arc-20160816;
        b=npPe+UTvNCaKJUCzvti+zaXEjSuB1E+IfCpGcplAy8svGuE9QryTNDlRCThpB6iGaw
         lNkBvAJ35gVCSH6qHojOIbeVxCQFhmfAvQNwn2mrxSG71+g1Vgn2bujzbJJb97qI7V3Q
         ZjcYTwetJQW3whXMcgMjst7WbXHFV8UsZRyIO42mDkEBY2JUZroUudStID2SoF+VqcGl
         YG0ke00wC76tqukysrbGqWjUF1PFxFff3WGZab28pXPKJnkvGh1OYXehs/F4tqoMAIJN
         zVNGg5VgLlTY2pTHkbO1Lyjqi48PXtabqw0n8ZeEZz8MyEpacs58jwxrDrdwrQbhWxqm
         NGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x0No8/lNHDWses2JAiQOSnCsiaQe0Jlum0U1EgQFNxA=;
        b=g/ILh0Axd/B3lbhB0kFo+bZI5EFKsGfJscsUYoNT4fdlyWLXqGimuuVzH3E/um/Hfq
         mL8raff+bYfTIok0lWB8opEDkX57opCgrL/BeHr5e8AVCwzU/6h/iRo+g8ZthCNKhmWu
         wvMhKcNRYgY0e7oR8YfZ/W21tGcxpUPyqgaUOYmNVIzsU+NdS5Qqyh/6wtPNoKUlLlLv
         KG0gyLHjx1obS4VGEGOMhBxxCkZBGqfj2rxxvyFp5hnVihd83rWv4Y7O0fCpjIM9OY7a
         LWRoLETS3w55bd6xBN6zvxkX9+aCi1Rs9zGiNApO+YlrS56Il3fRPpcV5+wdLkZqz4Oh
         pJxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fpIQ4P9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j133si465017ybj.75.2020.09.28.03.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 03:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fpIQ4P9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMqg6-0003Tp-35
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 06:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqco-0007nf-KK
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 06:43:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqci-0006H6-5h
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 06:43:18 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601289791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0No8/lNHDWses2JAiQOSnCsiaQe0Jlum0U1EgQFNxA=;
 b=fpIQ4P9blHRLN9UkiLhUSycNjBa31beviY/TCHJwWXmR4ux1JLwgmZNxJ8dQG8CwF2fc8L
 dQPLb9aMjsHgyF0SGVyofEPYByMk7LX5OPIL581GZPrpcl+BmzXd+asoVP+DriEvUYySi9
 dyEPmuWUM/VFfkK952c2xQaLo2bPBeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-ChHKRiu2MGmPSBwv7sJs2A-1; Mon, 28 Sep 2020 06:43:09 -0400
X-MC-Unique: ChHKRiu2MGmPSBwv7sJs2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23D9B1074657;
 Mon, 28 Sep 2020 10:43:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4A291002C03;
 Mon, 28 Sep 2020 10:43:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B7D0A40DCF; Mon, 28 Sep 2020 12:42:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/12] tests/acpi: add microvm pcie test
Date: Mon, 28 Sep 2020 12:42:54 +0200
Message-Id: <20200928104256.9241-11-kraxel@redhat.com>
In-Reply-To: <20200928104256.9241-1-kraxel@redhat.com>
References: <20200928104256.9241-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7daJ3/1xufDh

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index cc4579d914e7..bf34be5decf3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1063,6 +1063,18 @@ static void test_acpi_microvm_tcg(void)
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
@@ -1181,6 +1193,9 @@ int main(int argc, char *argv[])
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

