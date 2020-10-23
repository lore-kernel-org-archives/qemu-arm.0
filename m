Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp291952lfa;
        Fri, 23 Oct 2020 00:17:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFFxYOl+R8uSBTZygVkFlP5a2Eaw/IDMf5gt9IYtTg9nNiwRXeQV1uprcwiUPDi++lbbfR
X-Received: by 2002:a25:2c5:: with SMTP id 188mr1449404ybc.324.1603437423981;
        Fri, 23 Oct 2020 00:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603437423; cv=none;
        d=google.com; s=arc-20160816;
        b=ci9G+S9dZ9LGwz3+T0gPGadg1QkEDqC4OVaYx23uEpet53Nyfp1Py8d44t5/+V5s3P
         dRDuM3GsaA4sBGsVwkfVfev/UyMQIKCzZ/eUte0dX1V308U+yJtSi9/o9DO1pHekgSK3
         rlNxiR2LN9sNhbApnU8a+H2SJ6/zxWNYa8XAcj0F8YahTW7hXfbNXFvrPZxYR8UGbMiX
         PzfEinUK2ewHR3rbqtimXILvYRXKSsEc9ic89UKANuqP04ui/khyeHpYakuSSTn8rV1J
         nwgYM8dmXXLC5y4e5SEh/X00Qx5b/by+WY1SyI1RLxoGuWH8szdGSD3faA/YeMhIneo1
         K99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sIRSitiRXV4ZAKDiiQHiW+bIFcGn9wQPWQBNLG4Ig0Q=;
        b=cRkNeo0E9MCTOQy36ksS6JxHrLCpxcVxAIrnKLTehemirCLPBvLFZsDos6QJv1Fy2V
         8/1v9FVcZ0GwbSr5rvvcq5kWowpzXspniDyHrq0jJWvs9YlpSiwAKU3Xn9kHvtKS0A3n
         ywNSDKm7Cv1DYPbRgsXxJ/NZsw4RD57tWZrBXwUsCHdUdaDfd+N/UwwW2L2NffQtQ/Hm
         D4SAWuzZR7SeM7diIRtbNj3H1Cf9k6oa6AkPPC3Vn1N6QxnRBTiMOFSx2KJGSlQBqdnO
         LRVH4/2G5+xDY9etKbNGfg8hfxEGAIX9M1RueSoDb/14M94jAvhrePt2GpJWT/dtJJiL
         k0Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RQwwo5hv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w203si554957ybe.348.2020.10.23.00.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 00:17:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RQwwo5hv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVrJu-0007eD-T1
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 03:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDu-0001OV-Ri
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDs-0003p1-VX
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIRSitiRXV4ZAKDiiQHiW+bIFcGn9wQPWQBNLG4Ig0Q=;
 b=RQwwo5hv910baFZ5UR3Ao74RlXSkh0KpeaP3yNBTOhVhBsOWm4+tS4zd9VWBJQ+5miWPr2
 4GIlhjDn6ha+a2+e9qqtZpMPzZEhU4VkcIdblxpilgG2bzNNMaZRLcDrYWO+BjvgWJZgzW
 fmbbb5cIAZmZKdcAAQTUBQCNAzaAIsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-6yP6MddiOdqaLda54WtECw-1; Fri, 23 Oct 2020 03:10:43 -0400
X-MC-Unique: 6yP6MddiOdqaLda54WtECw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE4BD107B471;
 Fri, 23 Oct 2020 07:10:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FE0610013D7;
 Fri, 23 Oct 2020 07:10:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 54E5C204A7; Fri, 23 Oct 2020 09:10:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] tests/acpi: add usb testcase for virt
Date: Fri, 23 Oct 2020 09:10:20 +0200
Message-Id: <20201023071022.24916-7-kraxel@redhat.com>
In-Reply-To: <20201023071022.24916-1-kraxel@redhat.com>
References: <20201023071022.24916-1-kraxel@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v9KQ7jXAFlRE

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 3830a40d1041..438cea38a177 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1230,6 +1230,23 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_virt_tcg_usb(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    data.variant = ".usb";
+    test_acpi_one("-cpu cortex-a57 -machine usb=on", &data);
+    free_test_data(&data);
+}
+
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
@@ -1277,6 +1294,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+        qtest_add_func("acpi/virt/usb", test_acpi_virt_tcg_usb);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.27.0

