Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1839238lfm;
        Thu, 2 Jul 2020 13:54:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4P3mzQxH3XSyEekHvcHh6XfpK5Vb+C00jsR4GcEKoDwjGWKtRSjiV0c6GRrmdx4bO+01T
X-Received: by 2002:a25:df09:: with SMTP id w9mr39615580ybg.189.1593723286830;
        Thu, 02 Jul 2020 13:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723286; cv=none;
        d=google.com; s=arc-20160816;
        b=iHw2O+TJnwPKZqvcIFfsT8kDHzQm1Mr8mcZ3bINx7YvQRvAiSI4FfSLZ6ElNSpHZ81
         WzZe+jE4MRs1aITcwv9HfVR+uKJE5hL9fFNBcebhkUrGJ2fLRCa0vJMT0nVJ9cO281hd
         nw6i8JtwNsNaCJMdK9NxdwKWTN38lyf1lh0fHyaWsicrxEJKHSoS5AOP+eD95dGzxaDL
         jCjS1OnKLFBNamiHMezLuI4a1BwtOgMWYuF9feAC0HTtKmWvrHvcMyK1kp9zwUqkHFrO
         tAs57EQ7zR0ObtXnpcHgwJyXaSfbjXpdePnS6sWj1n/UlB/EJVM3DEv0eDJt35io1qgx
         m4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Jc3CkjMTS6eJgOpPYjcQtTYta9twaD8HtlqKoRcWa3g=;
        b=Yb12lFZrblLl+V1dkTj2t9PB0qHhlFL2kvnnw//0Y2kJ4718213ALsOEHO5CflzDyL
         iP10cKEchaSTkcakLDzUj7AOPyl/WdIO9vMYwSjadybp9YEA60z0F9oBhFSZKF6pi10X
         EvFx1M6boP38R1W2wTaxU/x7y/aUfyujjYMro/puPPT+Hj6VXwjdbpmFkYUOccdPD8zH
         mpvkxkUrKEYJcUKMDoOPB/TBV89WR8AR/+IGndJS30GZgGHJnu+/sFf2Qw+kRA8hOrnM
         EkxAPaylPe40wegh9gkznyL+jZdHFXgD9+gmbl9PFFHqpf19G7uu2OuDoeKYfLIIbVuT
         ThWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JvIugqFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h29si2749576ybj.301.2020.07.02.13.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JvIugqFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6EI-0004ff-56
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69B-0004XG-PR
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53402
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr695-0003Yo-LU
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Jc3CkjMTS6eJgOpPYjcQtTYta9twaD8HtlqKoRcWa3g=;
 b=JvIugqFGHXbxpRAoq0asALCIX2XNUcCBgfzZMy/F+HnxZkr5rxBCdS61efGZteatfZ+sL4
 Si/aGKFViNtD2i/TBOxSv4GVi2DhqY3Pmf0z7JYnKLCQI7lwH7296YoU+MW1ur6U40Bn04
 I2INYePjgYeqlessSJThwrCe7ZafVxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-uJKbw7bFPWmuxLNoM8rbQA-1; Thu, 02 Jul 2020 16:49:19 -0400
X-MC-Unique: uJKbw7bFPWmuxLNoM8rbQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C693107ACF2;
 Thu,  2 Jul 2020 20:49:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A81361A928;
 Thu,  2 Jul 2020 20:49:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A9D4131F0A; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/21] tests/acpi: add microvm test
Date: Thu,  2 Jul 2020 22:48:58 +0200
Message-Id: <20200702204859.9876-21-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/xXip0q28Rg

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 24b715dce780..b5b98d5c0742 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1007,6 +1007,20 @@ static void test_acpi_virt_tcg_memhp(void)
 
 }
 
+static void test_acpi_microvm_tcg(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = "microvm";
+    data.required_struct_types = base_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
+    data.blkdev = "virtio-blk-device";
+    test_acpi_one(" -machine microvm,acpi=on,rtc=off",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg_numamem(void)
 {
     test_data data = {
@@ -1118,6 +1132,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
2.18.4

