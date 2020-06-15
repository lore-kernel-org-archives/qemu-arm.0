Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1709676lfm;
        Mon, 15 Jun 2020 06:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDVzAn6WL7dmbazZjsHrEdXsuHcXWtKy/m9rDhpkZ/z4jVbquVBvrMWmZ0tIpuiTz/iWbT
X-Received: by 2002:a25:ad5a:: with SMTP id l26mr41476443ybe.188.1592229078779;
        Mon, 15 Jun 2020 06:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592229078; cv=none;
        d=google.com; s=arc-20160816;
        b=eVOAeEAt9q914b/OM5rLqpkAyvocuPVgIphZatRGQAz+rVJF9XUrdM4/hXe6T4f15c
         H/8cCUqZo2dh0scuP9j8QvQmLifT1ym5R/CuYWkgRfVOriONwb108kw4IGx9WSHT+uvE
         i1h7N3FGKzvPphhe8jLiRdv/eqk+yhze0jroDnC6ND2LzNyu7b7ZdQLUjyCP9BymVq3r
         b+SO2mBsRiLEurfB6/Bp6sr5CVtY6BJRs0UvUEkrxtNVTTPGz+M3RlpQ4wl11gCCUum1
         eKILu1V5faAjNIUdNyFMFpZS/u0/epXCIpr6+MB63ieualfe3CPSImItAfdDiHmw9aVC
         qCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=R1vmQhia25dZPeeC9y6WkhxF+ixuZ7VSqwLTNTglzAs=;
        b=fP0OaanSde0hhoc33ytc8rNZeVag0LyiBQo+ei+HrVb3mqfLZw23OUPFVxG43AWOOF
         /nbFECbdCNUKNFEP2fIEpm+vhMr3M5ovBf1tU9Nlur3EMftkLf9eJmuAPlhlQp5JvhqA
         sSPT/a6zuRYD/gqMfMVXUnYevnPPLPCFSwjmuZ7BlhMr2cFAAi43X+FKYKN1qGNxpPzH
         ZcDOt03GYguuJQaBIrOuBhk2bBtrlOXB0iHNh+GgaeyZlxOA3m/NrJXJGGOeHhCtrZbp
         7ZnmHZlARc6er8BsmBoaiNEr1AQoKFVcwz9zxPZ+XE4Z7JZJk1XXr1Uidpo1dvb2PdDU
         Yz6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Db2Sb00j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si13632707ybo.142.2020.06.15.06.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 06:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Db2Sb00j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkpWA-000800-4q
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 09:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jkpW2-0007ye-UR
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:51:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38993
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jkpW1-0008NS-G2
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592229068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R1vmQhia25dZPeeC9y6WkhxF+ixuZ7VSqwLTNTglzAs=;
 b=Db2Sb00jDogaW0u6BOn41s5Pxs1ioHEhgVCXo0LhBwtHr7+Pz54aV4yjXf1ruFn5a6OndF
 Q/x/nlQErVJpwbe6iCtyHOVHLayy/mfgli8q4QLsv7p3nEVITMyU426LSpFdddd79fLvnU
 twa7zcOEfO1tU7EkjxTyjnOLkVVdBqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-dsdNhBGdN6quX4rsai-tvA-1; Mon, 15 Jun 2020 09:51:05 -0400
X-MC-Unique: dsdNhBGdN6quX4rsai-tvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B297E18FE88C;
 Mon, 15 Jun 2020 13:51:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09AB95C1B0;
 Mon, 15 Jun 2020 13:50:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH] bios-tables-test: Fix "-tpmdev: invalid option"
Date: Mon, 15 Jun 2020 15:50:51 +0200
Message-Id: <20200615135051.2213-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-TUID: j6MQccefyLLQ

When configure is run with "--disable-tpm", the bios-tables-test
q35/tis test fails with "-tpmdev: invalid option".

Skip the test if CONFIG_TPM is unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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

