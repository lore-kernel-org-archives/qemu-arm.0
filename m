Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1848356lfm;
        Thu, 2 Jul 2020 14:06:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySIRd/pEuLgvHuV3nWyvv7NP7/tMFx12OOpfzPM4Hm0vb0oEUZp4T2dbp2w48fLRv8DT2X
X-Received: by 2002:a25:d104:: with SMTP id i4mr1922931ybg.80.1593723998833;
        Thu, 02 Jul 2020 14:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723998; cv=none;
        d=google.com; s=arc-20160816;
        b=X1ua+js8Pm6yiab3tvQrOlZ2YJgcOCeAB7wjhGRpHljEdtX+JDQCus3btjnqp2UTDo
         07f24AjZjLmM3GUwakvJDUoUZeVNmHxx4v+aJRY84Kq6G87xeZuhZ/0PqkTmv4LSCY9e
         0D/xpVAtZ9hKSa+GLw4rFSHly8iTEWIx2hJunevli/O3v0Yv58tkT0XFQMirhM2YwiPn
         8DFEdoh1aksac5far2qkRbta2h9vyM1ln5pgaUszKXbBJZhIv3IQtl6/c7eUR/dQ4dHI
         br7o7sqNgJtn1p/9Jf2gtCe0CVV3u71V7sGYPuoyqP+jGBPvF+RYUm8/LkSeunqQzZpc
         wOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=K/9W2PZSeIS82Eh5NLCJQJCCPYbFC6ZhNnw1M1jPilY=;
        b=Wa/qu2JC1aMQjQuuuy0r6qmpjEx/aobf0fFV6tvbTQG7fMx+7KMhMuPMAfcURScs5U
         nKGKAowHv1GkxlErilJVHOAZGy05roXo8zh2T590kDkIBeG9jBUL39bdPwuA+BDlgZCs
         qHtprzXVaQ1k4CHBfaplr8spZQPSi06MVJysJQhTiPg+49Q9Hok+QiU7mpGJihjCAdiK
         0UAlMLr/lS4Srfat+ydd77QtR+U7hdSdPMZUszkpxA5vmLsRTZPbWHbNmfF3TcSFWRKD
         3SWokCLYpFuUPkY/SIxKSO6wzV222+k3UY9tXn3YCidoqKIBl1u9WPMrAcIZllbNi7dF
         NBag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gZOML4JE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si9375570ybc.441.2020.07.02.14.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 14:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gZOML4JE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6Pm-0006rp-7K
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 17:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69L-00050h-Pn
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37199
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69I-0003dH-Bt
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=K/9W2PZSeIS82Eh5NLCJQJCCPYbFC6ZhNnw1M1jPilY=;
 b=gZOML4JERq2eQ8m/DwN4EuTavcIHQy955QPUpbofA6xUsKa0fuvLn0UJaj88xodwAOWUJf
 Oo4KyxGgPqQ8EkHiDzkLcFbFQQo1A2MN1h5lwbAWEVXBzG36D/PIa1QDnQmnuZYLYqevL2
 Qofht6yPg3vhu6KF3fUXgKrym5A6Ics=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-KY7YVoi2MsSdy9BKe8o29g-1; Thu, 02 Jul 2020 16:49:32 -0400
X-MC-Unique: KY7YVoi2MsSdy9BKe8o29g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC80F1005513;
 Thu,  2 Jul 2020 20:49:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5973960C81;
 Thu,  2 Jul 2020 20:49:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8E23F31EFE; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/21] tests/acpi: clear bios-tables-test-allowed-diff.h
Date: Thu,  2 Jul 2020 22:48:55 +0200
Message-Id: <20200702204859.9876-18-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
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
X-TUID: x/tMHtl62TKi

Leftover from acpi cleanup series.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8992f1f12b77..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,19 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.tis",
-- 
2.18.4

