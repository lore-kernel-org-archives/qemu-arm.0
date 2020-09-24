Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1130144lfq;
        Wed, 23 Sep 2020 23:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWHJECRjrpma6pmBORudSlvXrvxpodF/Dj2BnOevNNzJ+fxF+1JcogRPfENBhlZ4s3WxEb
X-Received: by 2002:a25:cbd1:: with SMTP id b200mr5422660ybg.293.1600929210583;
        Wed, 23 Sep 2020 23:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600929210; cv=none;
        d=google.com; s=arc-20160816;
        b=00Lq8VuMxALSlu+0PNTNYyC228wX7XA0FLG5iMSMNrv9yFC9wE1EtpQG1U54G36epm
         M0cudK+STmlHd/UgdhpTCr98uYlK5D/C3WrwdAbD7CLHVodDBAxW5kl2CbugflR3ntaV
         a+ZfcXtnvg33DS1MR08wRpbqzmUpF7dcrbUxu6ukNRmPtAob59ubx5rAE1VxR6PW/6lh
         uOhZ6Md6G55tQqZ20DOACZm1wDfIIeE4nQFMcD70NKIDgzwaUMZDWWWWm/VH0L+I0QqS
         ohiq5qTKWTmcOuzOOi9pCkthnhS6CpmsAgco2jyMlYMnoDZwMmLtPvWzwUh7JRjU6kvo
         Ztfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IPmEnRFcFSvyam6kK9md9AYbbcpkSrMMfMVDpAvfMVI=;
        b=WzbaHS9OppFkkmQiziSI9CBGQ/c6L8nu9Qd6mYFfEfQAVjlMqYLUFC7Qwjk8ibuAou
         4+9F93px4CIP2UUuK1/a+sHdidZyAZ0qcInUVJVdlpC3BAKawexJQZpYJc1hpq0cTdDz
         IXP1vRYGCYcSQgnhTmR6QVNojMQ+SAPk0ytjAqakwq33uVLBWt5zbYcEEG594ajzrJzR
         hkTcGA+RxDb+ukPmwbDyYBQfO/XS1WQZlPe7+jGNzGdmKXEzfaBi9yp7grv+00WsLXIu
         BwP0/V5cwbFwlF218QSvTCDUtDigP+Xnd55BiulLs20ZPPDIeyOq6KMcs+kpBuLmUci1
         08XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FuevuuCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si2281957ybd.407.2020.09.23.23.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 23:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FuevuuCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLKor-0005qH-Vp
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 02:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjg-0000Of-04
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 02:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjX-0001j4-Va
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 02:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600928879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPmEnRFcFSvyam6kK9md9AYbbcpkSrMMfMVDpAvfMVI=;
 b=FuevuuCWUGIwgPtwa1ucNPHVT3JzJm5R/JVofSL2xcGLvt4OwvAOZYNqO6GgpySgywXDvf
 yAUojAjRB7Xa2ZBGfSaGoDkclUmKiAiROjSb6UtiA1MagsHK6u0FiY7VIrjV1C9UXqCV1h
 kiaqxTxsahP4iz17Zm4YjjydVVox7Ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-c3W-ja5UMaSfioOfIQcKSg-1; Thu, 24 Sep 2020 02:27:55 -0400
X-MC-Unique: c3W-ja5UMaSfioOfIQcKSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BAF21074646;
 Thu, 24 Sep 2020 06:27:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB525D990;
 Thu, 24 Sep 2020 06:27:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2EBE031E68; Thu, 24 Sep 2020 08:27:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] tests/acpi: allow updates for expected data files
Date: Thu, 24 Sep 2020 08:27:30 +0200
Message-Id: <20200924062734.22978-8-kraxel@redhat.com>
In-Reply-To: <20200924062734.22978-1-kraxel@redhat.com>
References: <20200924062734.22978-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
X-TUID: hHgqz7G+4IxK

Also add empty tests/data/acpi/microvm/DSDT.pcie

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 tests/data/acpi/microvm/DSDT.pcie           | 0
 2 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/microvm/DSDT.pcie

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..1ee19a1bcdf8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/microvm/DSDT.pcie",
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/DSDT.numamem",
+"tests/data/acpi/virt/DSDT.memhp",
diff --git a/tests/data/acpi/microvm/DSDT.pcie b/tests/data/acpi/microvm/DSDT.pcie
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.27.0

