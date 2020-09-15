Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3115691lfq;
        Tue, 15 Sep 2020 05:17:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWyCNsr/TCCJ9rTZq/3ei8jR1r0qf0/C6O8IUBv54mb8SLnDs0A1VLM7sStYbGQkZwGa1T
X-Received: by 2002:a25:eb08:: with SMTP id d8mr8858211ybs.460.1600172223674;
        Tue, 15 Sep 2020 05:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600172223; cv=none;
        d=google.com; s=arc-20160816;
        b=IROxcBe5QmQpe7cpUtOYTHlOfZWluHZRchtDAtuRR+l0KT3MrZmMOVydmLxs/qpMcc
         0tjPVXUB0PUgtL8F2FWZTeaUEseFyaoN0tTMy9iUFa67oNiYMKKys4lCaCnv+/DJd6K1
         0kZeIN47Iy4XA0ya6HSAxuJmaQ+3yLgvB7XTUS1inSM4HhdILIYMr0+pljS1L0FWXI0T
         nKNm9yrmrz2hhY2dac2/7zzTJPjAw1sKxVqjn/ErSBXD5AytsvtsYr2eAKlDY4rKFjaI
         zP9FsTpRDi1N3RB11Dph4RDOh4NEszuyF5OqDuNbesXEBn9zD6LyU3pfdS+GSEkNbRdu
         SCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f0j/2GpDmP1B6JzBQEJ4sMlLnicgwb2jxZZq7qWpABA=;
        b=O1Min4xYGNnUv9XQGbmkIe/ckd7wczRrO4VaKAZXb/C9yOY3ZD2ulig59YEKHW7l7e
         dUnSE7kbDrQ5RPiaFAASvk5lWZdNkwJZaOUoq2Rhwz0c6Uh8TJxwndhDPQgq0Tnpztix
         3kjXqagL7BAP9l5JSSi9yNc0OYJsIib0nrhMbX9onVJXAOWZC3SykiOsEMes90ZoG03V
         1Gd4vx7VmK7vRpxiGnJyEvM2O53J2Vc4aMii1tfD26xCzBxq8+bfUPW/p6xkhOy59OGk
         L5kVp7iiGHkZWBgWKQr5tAOphJFAI20AWuDhsJ2NF2HVAPT/shlWfS+oAffXX6zRFvGA
         sDkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U1TKiD+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127si13421536ybo.314.2020.09.15.05.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:17:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U1TKiD+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9tO-0003T7-U9
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nF-0004oV-9F
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:10:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34183
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nB-0007gm-5N
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0j/2GpDmP1B6JzBQEJ4sMlLnicgwb2jxZZq7qWpABA=;
 b=U1TKiD+mlqedbZ0wqHGZY9e5qFwdgxHz8BHpbq97HKdhNpbt4v/OlLof3oMdi6/2yPQBC5
 wkQiCqAdsNZmScoiXjFkIzqjIE6QOyYu0TFJjTvjusQMWFrNKaeSvC/oD5I/vcEGYihnYw
 wZJYTSuxfR1Ah04RzQ6ZMd5JtEjjo88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-XpK5ZRWPOmuQPMOQPwAFGA-1; Tue, 15 Sep 2020 08:09:26 -0400
X-MC-Unique: XpK5ZRWPOmuQPMOQPwAFGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3AB564089;
 Tue, 15 Sep 2020 12:09:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D5D15DE4A;
 Tue, 15 Sep 2020 12:09:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5C3F140BFE; Tue, 15 Sep 2020 14:09:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 19/21] tests/acpi: add microvm test
Date: Tue, 15 Sep 2020 14:09:07 +0200
Message-Id: <20200915120909.20838-20-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 03:21:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WnzWGXsFCyHl

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

