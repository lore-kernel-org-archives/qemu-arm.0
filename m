Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5632352lfm;
        Wed, 26 May 2021 10:23:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF9t6fMob/ZXbzHmVAqUyqcGZovS5nBo2ZsDMjSy3gk96nwpdV+mLjkBXXAjIJt6XdEKbL
X-Received: by 2002:a05:6102:3749:: with SMTP id u9mr33341628vst.25.1622049828161;
        Wed, 26 May 2021 10:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622049828; cv=none;
        d=google.com; s=arc-20160816;
        b=tJRGE2+N0/TJX3HkuSTxvVg4Z1/DyxclxvqMNfepOraf/u5WsbAarKMNkoXvIX6xtK
         Y4N8PfSKcUdwRJ9H9XeD6g3zYlodv1lLPQbP8T6ZyodFB3lZLUEFwnrOoZHtmvbTsgG4
         peIz16+eY7ClcjsMssM9AnOfScTHpMN4ueYEceg23n+fIH5+5XYUEFfAfF3B5RQpk5Zc
         LRFJSRKetYMnuZoIwGwn2EwoEYEkx3xauNDcnlyIKU21tHQlmpYF+5UHSK2dgJPnIL/X
         LSTIVEUnyoLfSrbkpCd5QCHo8SJ+rjvBJIYPWSiMx8pJhodnb2hdcUPYiH1TSRB9AjKW
         kG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NrRlnxcfy5rfyxKOgrn4KzLZv/0uqhFPtkaZ4qrEJ9Q=;
        b=Jvtg33yopLiqmkwLk0y2T7Gs+C2gEMgZQjbwwy8M2iSGNBnNEFA4FPpi0v7R+nEC8b
         aLk8RsN7fARsTsOO2tI3GL6RhhLQ0SrAozurPo0agMJ6lbtmiPmNwArmmquvzCPcSDC2
         9dXE21psqzBQ4/xrof9tSuU4Z3boVdFSakJSDEA0bVEzQCOxRLEPpndO56p24HJFNnHK
         YWGjTsCZm3NTDUtmh00GMHwykHnp9wLcHcQm50CI30QoD9h/ezhuWwUfe0T2fsCnXQKR
         y7DbMU0jBbLnbAzNhgbTSO/Mk+OD4xH3oQkbBksfi5WPHcMlcdhQgQaGM2YANqWecLRo
         PcEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JR+UsR0A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m66si1710498vkg.53.2021.05.26.10.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 10:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JR+UsR0A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llxFz-0003m0-Ct
	for alex.bennee@linaro.org; Wed, 26 May 2021 13:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwz3-0007ot-Os
 for qemu-arm@nongnu.org; Wed, 26 May 2021 13:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwz1-0004ZD-TA
 for qemu-arm@nongnu.org; Wed, 26 May 2021 13:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrRlnxcfy5rfyxKOgrn4KzLZv/0uqhFPtkaZ4qrEJ9Q=;
 b=JR+UsR0AsvkiKQMrzDBZXDKmSxcW+atAmHIEvLPGopv8eOP/W2ufuEX62KcepAtzcL15/F
 KQ+kballFLm0vSxh8VxWDAZC6mJv1gZ8xRy78dBKn5LaG9BH+SFzWezNXxQsYdySdHtGKy
 RWQlzh+QV+e4iGus2lUwDvH88yx/4Yc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-yIkTt81xMBS6ZI5xKfCrGQ-1; Wed, 26 May 2021 13:06:11 -0400
X-MC-Unique: yIkTt81xMBS6ZI5xKfCrGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 y129-20020a1c32870000b029016920cc7087so625731wmy.4
 for <qemu-arm@nongnu.org>; Wed, 26 May 2021 10:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NrRlnxcfy5rfyxKOgrn4KzLZv/0uqhFPtkaZ4qrEJ9Q=;
 b=Wyc6qDZWmuJ3a6DWfsd9fjmKljC3DBf0ozD8hpZWu4qAOUR9Gsyk0v6Nft+N+Crb6/
 rt2LWPJ0kZUQsbxNgXesHrnCu885LD8tvrHE5xEwuzNuqohC8ll8BD8rYW9+ml5ugFEj
 htTiosDveLfWW9ZPgUKUHGL9hgAgw8it83lTdYE3VuLhTGLrBy96/4ifuIHOvPwfXwHc
 6FVJJpp4ikQSjh1b2t8EidKMs9pLhTZM3Sc1dC2bpgvYNndyLMZJvbiWWzYTvLwen8Xe
 khF/YnzIgrQzhuURpEsSyfH68H/VlXM3e0Bq9HxpDLSjYP/V3M22fyiUYWhtqvp8w3Vg
 aW3g==
X-Gm-Message-State: AOAM533EsAHw6T9xorE3bNW8hbR8oQ3waf77h2m/0Lk4bD1KRziO7A+A
 GwpCYz8cmQDh3WXuma8kj1x5W8QlwPjznG4W3g9YzGc1Nik3MVnKUeo/5pbe2LM/PUGxO9WeUSF
 zHcYpGj2CrpRc
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr34874283wrr.336.1622048770500; 
 Wed, 26 May 2021 10:06:10 -0700 (PDT)
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr34874260wrr.336.1622048770307; 
 Wed, 26 May 2021 10:06:10 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id v12sm21670414wrv.76.2021.05.26.10.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:06:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/12] qtest/bios-tables-test: Make test build-independent
 from accelerator
Date: Wed, 26 May 2021 19:04:31 +0200
Message-Id: <20210526170432.343588-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2FHzA98ufarG

Now that we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ad877baeb1b..762d154b340 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -97,6 +97,7 @@ typedef struct {
     QTestState *qts;
 } test_data;
 
+static bool tcg_accel_available;
 static char disk[] = "tests/acpi-test-disk-XXXXXX";
 static const char *data_dir = "tests/data/acpi";
 #ifdef CONFIG_IASL
@@ -718,12 +719,7 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
+    assert(!data->tcg_only || tcg_accel_available);
 
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
@@ -1506,6 +1502,8 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
@@ -1554,10 +1552,10 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
+        if (strcmp(arch, "x86_64") == 0 && tcg_accel_available) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
-    } else if (strcmp(arch, "aarch64") == 0) {
+    } else if (strcmp(arch, "aarch64") == 0 && tcg_accel_available) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-- 
2.26.3

