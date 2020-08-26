Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp642656lfc;
        Wed, 26 Aug 2020 03:54:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIwfq8R0qCUjFdhyQvqlggdVbnS2v8+La3tZVTBmbFs9tEBIfkiTu5qNTZpHQaeBBUeatR
X-Received: by 2002:a25:d0c2:: with SMTP id h185mr20404329ybg.73.1598439297213;
        Wed, 26 Aug 2020 03:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598439297; cv=none;
        d=google.com; s=arc-20160816;
        b=zcqioVS0Wzd7pAiJ92Vhj0XZW7MNOcAJEVIdL5Kpr2hzk2BTCy+R3t4jVsDGWl3kQE
         XYRMPoShdSQc4akAUeNUeMfbMAs2UKEEIo5BbzA8qrJkMGxCs5FACWQ1npuZQsdrsC18
         kLnwMW4xrWsdQmC99HAWH7xrEhVzqk7lLvuqlSTMKMGr5cyRpHryeNMsEgouRlOWiYtY
         aJSbmFX+bR9BUkiDtrnSZ4CByrbDoisvDRwaokufZj/udcbp89FD8u4YK6tUTKQJRKKH
         GaRE/OVTu22dy7RZA9g7WlMQkC1S75aRTBxE7GDrUGGuFSWxYt6ElKDDzSvnrswhCj2e
         DPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Uoydvu/WiscURmbyLAIS8dr6OH/NaKKwnnUgO3Jj0Y4=;
        b=BtDU9OdEv5YWXaBlPh8PMW7lQfZhE1RSfof7EsBf4cMKc9VH+UPF13E9nCWi5hiahi
         QB6WTOE7LRpR/E59kPvrx5hsGssgwIN0uLrr+qW9c2ogO7r0qJsQQOdAS6KVBhrPau95
         V7F8BArh9BW5uWN25aqjtT+9ZLCGK5YYhTk+d6KwmKOa4dtafUAGXFpXj7IzXVnd0EF3
         ovZBHEKqbiJBcf1peHRa/hi6Y9Tn79wzV0dzO7DQtdNEL+m7u4FQ5G8V/i0uEUZcw7jZ
         sIUvCb+2zegi5FxO1MUlelAd2PsMyhl9HRnTNuWt7k3ZYqTyFN3FISy/pUhVxRpDznqL
         MrGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fB2IOW4z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si2328807ybk.117.2020.08.26.03.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 03:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fB2IOW4z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAt4y-0001Bm-IN
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 06:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3J-0005jp-OV
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 06:53:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57056
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3G-0001WD-Ln
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 06:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598439189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uoydvu/WiscURmbyLAIS8dr6OH/NaKKwnnUgO3Jj0Y4=;
 b=fB2IOW4zyiQqGV+AK9uF2nZOrqCmt/fbuiMZwZu0PI2ZXW5gkkegarniReGbsM/jmjUfzt
 qwqND8jCcyyDxyPLf9BV7e0soTqIWy+OE6fQ5crrqWey54P+GYnkYDpwqm8FH7jpPUtEX/
 1UvOD+MJDvVtA0IITDR28QCnp3GGnNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-5NryP7DqOOyFFIGNFF-mkA-1; Wed, 26 Aug 2020 06:53:08 -0400
X-MC-Unique: 5NryP7DqOOyFFIGNFF-mkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11EC01885D83;
 Wed, 26 Aug 2020 10:53:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95C705D9E8;
 Wed, 26 Aug 2020 10:53:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F17A131FC6; Wed, 26 Aug 2020 12:52:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/20] tests/acpi: add microvm test
Date: Wed, 26 Aug 2020 12:52:53 +0200
Message-Id: <20200826105254.28496-20-kraxel@redhat.com>
In-Reply-To: <20200826105254.28496-1-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WRqruLMF23gO

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 058ba3886659..883532e531d6 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1008,6 +1008,20 @@ static void test_acpi_virt_tcg_memhp(void)
 
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
@@ -1119,6 +1133,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
2.27.0

