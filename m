Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3520638lfq;
        Mon, 28 Sep 2020 03:47:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7MC2jq4Me4xRFnJwC8DexEIKP9PwGjxZ49iBx+12WVwzlLbxobN6A7PfhD4ezXaICt8FX
X-Received: by 2002:a25:cf04:: with SMTP id f4mr1039659ybg.493.1601290051302;
        Mon, 28 Sep 2020 03:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601290051; cv=none;
        d=google.com; s=arc-20160816;
        b=fVVjixwZFXRfM1GnTuHaowkfWxG9Os4zgKaEK+LeRQ+2VIyv3dMMBD9Cqt211jE76A
         E55oByqljCVorOeZnjA2CrY0RK37h5c4OKmCE8AAWyvKTVr8bKKQfqPcW0E8Ju00Ai2O
         qIM+vpz/I8zalyRxl3ajofoOPYtbPsLVIIUta6SrINoD1rvy5nUxqB/5R10NcT6y2/TX
         ZaYtFuQg4HGHjJwq4sQa4ChXAxc2y8FvwidnEdOgXhcWoOIIfIkniTuR6JVmdjapRbOr
         P8IGTE4FRIA3Tc0bR26oeesiszChORf8YMl3T59prx/BWUUQEogtElMf4e3dgf24Pvsb
         agkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JaPcQwEHqerYKqLEANV9RSxXv5blceOOW50EhMacRZU=;
        b=BAhosz0cYtTmYw5/o5wWfTGvZAC+1/9jDPesp2/rMG4vYQjZ3wPnYBJ9BzGrWRiBev
         ziNwGv4GrZG8L7zOfirXFGJnwVHQxLdj/YujQT5eZYMr1MOkth74kp+EB3rqpl6Ko118
         i2vJB961jHLjjRzbPcboy6mfd4iXE0D6KXKHuuwmgKxqfJmuVcBHqqcYZ5FokbX8mlUo
         ZPgUeQsbVoqgliiRyOCw0267IhvELTISws2xkPxnIeDZnq8OHez4wJh0BC0KTv+tbPQX
         0yuM36OKXkUHzaxLuhVmHjicJsjBdWl7fFHhoN5H0vEKCwmBXpyPtwuLVkD2qDH/7LJ6
         jdYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZdYskgh1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si572683ybk.84.2020.09.28.03.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 03:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZdYskgh1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMqgs-00044T-GJ
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 06:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqcm-0007hW-4P
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 06:43:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqci-0006Gy-0L
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 06:43:15 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601289791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JaPcQwEHqerYKqLEANV9RSxXv5blceOOW50EhMacRZU=;
 b=ZdYskgh1h/HUcYBaUdNBtPDpuNrq1RlYROWkE68l1/Z6fdlRbCN0dpsYqBRRzldgs9KbRc
 WoLc5uJ7xT8MRDI4Jy7YtWBOjBcABf+HRTsKCNR+InQsbKFAz4ELLjdrM0jsGpHGtb8lrp
 LXJG5hahlUdIsxmk5xBjmsynM+gT3rM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-cwZ2NOJ2Ol-YyzItxVQJ4g-1; Mon, 28 Sep 2020 06:43:09 -0400
X-MC-Unique: cwZ2NOJ2Ol-YyzItxVQJ4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90B3186841A;
 Mon, 28 Sep 2020 10:43:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 814DE5D9CA;
 Mon, 28 Sep 2020 10:43:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D19C40845; Mon, 28 Sep 2020 12:42:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/12] tests/acpi: allow updates for expected data files
Date: Mon, 28 Sep 2020 12:42:51 +0200
Message-Id: <20200928104256.9241-8-kraxel@redhat.com>
In-Reply-To: <20200928104256.9241-1-kraxel@redhat.com>
References: <20200928104256.9241-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pqxshpqG0lUb

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..53109c22a56f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/microvm/DSDT.pcie32",
+"tests/data/acpi/microvm/DSDT.pcie64",
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/DSDT.numamem",
+"tests/data/acpi/virt/DSDT.memhp",
-- 
2.27.0

