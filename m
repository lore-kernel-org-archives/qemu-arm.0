Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1850824lfm;
        Mon, 15 Jun 2020 09:43:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztAPQmVJsO0NOZlMzttEKUXqXbRYnTtkectOOBRh9HPrAmedNt/ti6vumZiN+fb0zw4Nbl
X-Received: by 2002:a25:3586:: with SMTP id c128mr3973913yba.494.1592239407695;
        Mon, 15 Jun 2020 09:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592239407; cv=none;
        d=google.com; s=arc-20160816;
        b=uVxVxK4F1aHF5eg7rpLQSCmFb8xsnBNMRByiL5AODT9nAlAsG4m0mT7LrjGgS2kmXA
         Z4dwjOLuwVCUDZKGRnr87JGpj7YHcvnIb8CiYHGT/mQsvDcxGzm2KNlBMo8YZMeEKjVD
         aVOD1+5uQwM7R4bGN3JywN7W/o8htczj3ev9EI9+CfS9CIicBNYYKQVE02vUbXHdiqmr
         HMzNxU+sMV6ZGkZ2uVKfedBOaG58U6SmuEsrDE91RW32BipZ7/BQVbeu4hcoO6WZ+ggP
         KmWMKoVeIpkKIEqr0rRYFQvqMpT18qS4TKS0awwlH8T0puCmqXFQfKViLeNkIHJu48NQ
         vZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+glrrH0zDD4nj5i21BuLL7N1zu+uNb/lRZ2iPhQJWBY=;
        b=ta2YpAzoIpvr5RTgW0d6X1EAAI+Vza8+zw9OFHdkez17Y63sPr4J6rAEUaR0gDdbC0
         FMykKhscgiUenmNS0O6aIFOYBBHpfq3BqvfdjPfRPlCzV1qgjATkJLYSahz/VhrULOya
         2q4YYm2+fLbc1Ljn1XvdHSFyYgYNAWQ8GLzwUTjmSHor3El3xs2SbgPK5RPk2d2tnfvc
         MTeFstpBKRG59o7Qu+mdfs4/Gh4+hSOSfuW/cW3/a2DWmez+5W4oyucnHdkxFtPIAglA
         /Y73G4I1njpP5xYY5yq03fZCLmyIVF9uC2TBe+oErdAldCcajaJYoBdlyaoUqclb0XVV
         MOww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WZwiGNcr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si15084584ybn.165.2020.06.15.09.43.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 09:43:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WZwiGNcr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jksCl-0003X5-4w
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 12:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jksCe-0003VF-1t
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 12:43:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25418
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jksCb-0002D1-No
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 12:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592239396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+glrrH0zDD4nj5i21BuLL7N1zu+uNb/lRZ2iPhQJWBY=;
 b=WZwiGNcrn82buzC4FThUKEpLRofKIVwfrmMHdlBZiZ8/aQ+3geFxFDPs5sf9oARI4HcGZa
 YH4PpHbAsHgVK86Bea55QrzAK7uNeXMxnI0Z5QxOsvuz2RUFsPR7uMmRppCA2hwIGYoGa0
 hcLzI9SF7nCZnk1owRkAd/W/xWpXcU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-9NiDuFyIOEWdI6e4gt3srg-1; Mon, 15 Jun 2020 12:43:14 -0400
X-MC-Unique: 9NiDuFyIOEWdI6e4gt3srg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 594B418FE88C;
 Mon, 15 Jun 2020 16:42:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C71AC7F4F9;
 Mon, 15 Jun 2020 16:41:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v2] bios-tables-test: Fix "-tpmdev: invalid option"
Date: Mon, 15 Jun 2020 18:41:48 +0200
Message-Id: <20200615164148.4706-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:17:36
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
Cc: thuth@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 57x80T5wLfuH

When configure is run with "--disable-tpm", the bios-tables-test
q35/tis test fails with "-tpmdev: invalid option".

Skip the test if CONFIG_TPM is unset.

Fixes: 5da7c35e25 ("bios-tables-test: Add Q35/TPM-TIS test")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---

v1 -> v2:
- collected R-bs, T-bs and added fix tag (Phil)
---
 tests/qtest/bios-tables-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 53f104a9c5..b482f76c03 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -882,6 +882,7 @@ uint64_t tpm_tis_base_addr;
 static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
                               uint64_t base)
 {
+#ifdef CONFIG_TPM
     gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
                                           machine, tpm_if);
     char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
@@ -924,6 +925,9 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     g_free(tmp_path);
     g_free(tmp_dir_name);
     free_test_data(&data);
+#else
+    g_test_skip("TPM disabled");
+#endif
 }
 
 static void test_acpi_q35_tcg_tpm_tis(void)
-- 
2.20.1

