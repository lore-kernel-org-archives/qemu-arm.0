Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1129675lfq;
        Wed, 23 Sep 2020 23:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlh+YEU9XzbB8TTEWEA6PwJerFRxgzI3iWYlMrsavnxwF9R1Uf7U4tlctJMATFQvpyq+vD
X-Received: by 2002:a25:81cb:: with SMTP id n11mr4988520ybm.490.1600929156035;
        Wed, 23 Sep 2020 23:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600929156; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtZa1FSbLOF8knjUOdSM2fu18HHQSwU07kBjPFyotve0C2kUqqidjY5rwnd8fhRgMz
         iZ4gK+BZ0INcd/romGVnhSR2moclSPBrARR2iozFl6Jruz87IB2PROjYvjNaVtpUlyB5
         oCj864xJ43MBOpbTvap5H3hVrbOUfDbsku5/v7rD2wh/RBBFKAyNR/rmonD0WLidS6ZH
         X+hj8pr+PX0ONyxNNEcPi6igNupWeicT8gSJWbZnraJiF/bE2KExJ3fVa23WjTqbJycf
         vJWgW0fJSwGepYGYRThD/EdmRv+/42z2r4/h/nZXuPfb12sysffVb5SDTRVKoLhjIaQT
         n7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ulJPgjIpl2XyO449+EHu5mkiuBDnH4C3ggw1OqLstoE=;
        b=zJs6bMQ9geE5/kTXV4ib9ysg5v1FRdmrbYjwTB2ZLb83i3Vmpks/K5YLEEQZfam8uM
         va/UKl7uPFI7Z9jLsBw0RrttxHAKTdOOLYH96dIn/pIhigvmdTzPpaNebpYjrp/CTLbK
         Xc+pyLYjrOkpRBoJbWChUmhizP6PczXVnX9TzCd82A6sD9e8evTkZJ1t0+oT4CNmb1Pc
         +FtJNLgdEra/SQjGBHvjLFz07EychATbJn5eO1QS6to2+rgq8+eiDQJxov16H1pLX6JZ
         +XomQkgceNG1fgjJcxJXZTAW+JuA/I3SMtLuaogYo0AUEKcdHEow/LNHLiGEL2l+KR8f
         /qpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bK7I5DQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si2616195ybk.434.2020.09.23.23.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 23:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bK7I5DQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLKnz-0004zg-CL
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 02:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKja-0000J5-5T
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 02:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjW-0001iS-JP
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 02:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600928877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulJPgjIpl2XyO449+EHu5mkiuBDnH4C3ggw1OqLstoE=;
 b=bK7I5DQitDs3tKz1Jch2K9N6/vBubriYIKB0TjMYcRMdFaJt4KoKuQfiVTedl5P+ErzHsG
 CLweueiEgAWC7WC5s0bhM1xs7lKQ4V9+phoKts+VY1YTplN0JYnutJEntM8V3gRPc3I2kp
 D+CYHIaEF4RPAJlQAIOJ8a1DAoJoj7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-mLhF6GkXMBqvyI_VQ3hc1g-1; Thu, 24 Sep 2020 02:27:56 -0400
X-MC-Unique: mLhF6GkXMBqvyI_VQ3hc1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4C2F186DD35;
 Thu, 24 Sep 2020 06:27:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9312F55771;
 Thu, 24 Sep 2020 06:27:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3822531E7F; Thu, 24 Sep 2020 08:27:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/11] tests/acpi: factor out common microvm test setup
Date: Thu, 24 Sep 2020 08:27:31 +0200
Message-Id: <20200924062734.22978-9-kraxel@redhat.com>
In-Reply-To: <20200924062734.22978-1-kraxel@redhat.com>
References: <20200924062734.22978-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
X-TUID: kLYlt8PjiXTX

... into new test_acpi_microvm_prepare helper

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a9c8d478aee3..cc4579d914e7 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1044,15 +1044,20 @@ static void test_acpi_virt_tcg_memhp(void)
 
 }
 
+static void test_acpi_microvm_prepare(test_data *data)
+{
+    memset(data, 0, sizeof(*data));
+    data->machine = "microvm";
+    data->required_struct_types = NULL; /* no smbios */
+    data->required_struct_types_len = 0;
+    data->blkdev = "virtio-blk-device";
+}
+
 static void test_acpi_microvm_tcg(void)
 {
     test_data data;
 
-    memset(&data, 0, sizeof(data));
-    data.machine = "microvm";
-    data.required_struct_types = NULL; /* no smbios */
-    data.required_struct_types_len = 0;
-    data.blkdev = "virtio-blk-device";
+    test_acpi_microvm_prepare(&data);
     test_acpi_one(" -machine microvm,acpi=on,rtc=off",
                   &data);
     free_test_data(&data);
-- 
2.27.0

