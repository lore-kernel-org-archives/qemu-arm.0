Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp610234lfq;
        Thu, 17 Sep 2020 07:04:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykdArXojfVpyKt5u6bKtSFQ2tGjNZ4ldEajOl984nFaxJrJirporXOPL8hUtTnmGESOzOK
X-Received: by 2002:a25:db52:: with SMTP id g79mr12354849ybf.193.1600351444883;
        Thu, 17 Sep 2020 07:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600351444; cv=none;
        d=google.com; s=arc-20160816;
        b=RpoVUpAlpb5KKJshTSbEThAIFas0NsIansj7Vl/IY2ua81vKVwNMRgNj+SmPF13nJH
         1iwtfr3c1E/t+ekzh2zN3ipRlUDjvPIzWz7IKlDhbOAOc1coO2vn1Doj/SR94EFazuoM
         nh9We9ALSVhhAjy//Pawa1dqp7dGRjz9jeP3hojLRGtsPooaPz1rqskIlaFn9hcxLLxN
         7tQ7ORkxk2kwUPGw1Y6KBA3Uqee2VHRcJXOLx2Frc8ZX3m4nSb/OkEU7OUVp3HTJdcoy
         ih1XhZV1x+8sKDqeMCamwnNAywItGvtDPwylKfD+kkz75Wm9INoCeWYmsfOqC08azZP8
         LXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6dXo9mEeo5X1ztcjNyLshZ6Dr/bA7itz3qp8Aev5p5M=;
        b=qaOh+e1NtegwvaOtHN6KOn1dVRNISoyhTVdJqL2q7NKpue5OM4pELzKhCsy4HFdSM3
         Wpgsuk4zoJUOtpZQyLMfidbnYt/mtaA6AwFC7dE8gjv8VEMLCatyGHIg6aOd/xm6yeyO
         k9M2mdhJu8ek4rSrbE+Wc4AZqkaJKhmuDNUDjHdFwJCzeN/GFqyKbz8KofV15kTmnddZ
         HQzCj2DMLOPHCrtgxBCOOFflZCjC5H/MRONp+OBgRF1pz8bEszMGF/ICp1tFXIT+y0TP
         EeqJjZvD4/l8EX0gPo6bLgOqADssf6iHsayAINc5VikkGaZL3k8xuZWn3x9uGnN9MdJZ
         HMlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gny0fN0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y184si3092873ybf.81.2020.09.17.07.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 07:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gny0fN0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIuW4-0004Xk-21
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 10:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuMR-0000D2-4s
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuME-00086o-JI
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600350831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dXo9mEeo5X1ztcjNyLshZ6Dr/bA7itz3qp8Aev5p5M=;
 b=Gny0fN0S4qPid+kv1gWbME1R8muAyww/P5YvIp4qPj9r4t9mPXebVvkTvdgqscvCTxDGT6
 KgBlhRpUho2KHzuDqedlIaofowOQmt2nrSlFlrHxshl6FIdGC7AJ1ZGqGA9b2RA4lR06aA
 SSr0zYPEJJhythITkFB/SBc3weNb9Go=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-sWTB2SoYOJuaPBlGneOPVg-1; Thu, 17 Sep 2020 09:53:49 -0400
X-MC-Unique: sWTB2SoYOJuaPBlGneOPVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58D361084D74;
 Thu, 17 Sep 2020 13:53:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6EF061100;
 Thu, 17 Sep 2020 13:53:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6702831F96; Thu, 17 Sep 2020 15:53:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] tests/acpi: allow override blkdev
Date: Thu, 17 Sep 2020 15:53:20 +0200
Message-Id: <20200917135323.18022-19-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
References: <20200917135323.18022-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: P3Pl2xcqsw19

microvm needs virtio-blk instead of ide.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20200915120909.20838-19-kraxel@redhat.com
---
 tests/qtest/bios-tables-test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 504b810af583..1779af1cc889 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -72,6 +72,7 @@ typedef struct {
     const char *variant;
     const char *uefi_fl1;
     const char *uefi_fl2;
+    const char *blkdev;
     const char *cd;
     const uint64_t ram_start;
     const uint64_t scan_len;
@@ -666,9 +667,10 @@ static void test_acpi_one(const char *params, test_data *data)
         args = g_strdup_printf("-machine %s,kernel-irqchip=off %s -accel tcg "
             "-net none -display none %s "
             "-drive id=hd0,if=none,file=%s,format=raw "
-            "-device ide-hd,drive=hd0 ",
+            "-device %s,drive=hd0 ",
              data->machine, data->tcg_only ? "" : "-accel kvm",
-             params ? params : "", disk);
+             params ? params : "", disk,
+             data->blkdev ?: "ide-hd");
     }
 
     data->qts = qtest_init(args);
-- 
2.27.0

