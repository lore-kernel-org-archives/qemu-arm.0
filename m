Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2245064ejx;
        Tue, 12 Sep 2023 11:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXJXfJFzZGSE6w1yrSlUW6TPEOcK5MuBAuYlL0Azuj3bsyfL3WX83nM9j3MtYYh6Mf0fB1
X-Received: by 2002:a05:622a:1914:b0:412:1703:f7e0 with SMTP id w20-20020a05622a191400b004121703f7e0mr195659qtc.32.1694544099760;
        Tue, 12 Sep 2023 11:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694544099; cv=none;
        d=google.com; s=arc-20160816;
        b=nPTqvPia2H47XAtp1CU2gojADSQjqE0VWd5zLZ8k66DdiYGlccSBpKUawJV3cD0p3R
         vKgzQEiJBfizkRUN+N91kXklmITwUBkwQtaNedrv/tdOz38ELX1GRnjwTWYMLc35mFhF
         3I9AxCWwFXQggeiU/xbohrUC10gX55RFvttDoYMk04+OGElBj7YzEI1qQl6e3KKGMGXu
         v4ELYvolUG/nJ2lnHQUdSB1eAUAHq732iPhZC6FnZPiNtQua1jp1G3KrUKmMtEH8osGT
         jNaEpldNNC2pKf81+kwn5+LOiej2ilj9/hozAGtrwEbuCVMTtIRtEDvek2ATYq1kArmm
         W5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1AIiAYRZUIN3tB/gUJdVsd76BMtXSUjRQoKp5b2WIkc=;
        fh=7i2B42VHusWKsnJOPWSYnjvVgBurff/6q9zEPTejEek=;
        b=T0n5OGyUWi7wh5hzu982pBTmEtKGM94rDXFRuxDxJIDfGyGKT0gO4Myt0RghRARV2P
         spZmlxfXOUHJgD45kAUCOAUwzttJ80AVVvzUcXOjx/epDqiBW0G+NWRwQ/bw6g8rXmC6
         UZnhURaLg9jezBil/c14I/h5wnOTLRRgW6hkoWvp50qTATAYZ7kuI67VoGuXiHgiexIt
         CgbuoE/wmdXgbYM7MUSt5cdCkQOq7nC8arz97n56iaCw7hty0t1pft8UrRSB0smzor5+
         Hl8BLO/MMHjSauORLcuNfM8hjHqJDaV2s+Fokmo+hIiL3GHsxZReIj2L+pETRA/gSbFv
         4tHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GVa9fJKl;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w21-20020a05622a191500b0040376c123cdsi6760522qtc.41.2023.09.12.11.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 11:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GVa9fJKl;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694544099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1AIiAYRZUIN3tB/gUJdVsd76BMtXSUjRQoKp5b2WIkc=;
	b=GVa9fJKlLmFQ5rEaVH+9vnH/ebzH93Aa91hQeEMOmkjNWsoUOD4TeUKuEctUqL43kWVyGm
	sb7Da/3Mv4EWQD6TGdEbWX72+GipvwTo6ts/y6elXYoOe7VRBKAyNJlVqcsts1TzAbJ+cG
	To/ek7YocERIwG2lV5hfiPdzNIv6YKI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-HbIXb2yRPzy_eoWRstNw4Q-1; Tue, 12 Sep 2023 14:41:35 -0400
X-MC-Unique: HbIXb2yRPzy_eoWRstNw4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69BF53810D39;
	Tue, 12 Sep 2023 18:41:35 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A22ED63F9D;
	Tue, 12 Sep 2023 18:41:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/4] microbit: add missing qtest_quit() call
Date: Tue, 12 Sep 2023 19:41:27 +0100
Message-ID: <20230912184130.3056054-2-berrange@redhat.com>
In-Reply-To: <20230912184130.3056054-1-berrange@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: N/HvwJ5T0je8

Without this call, the QEMU process is being left running which on
FreeBSD 13.2 at least, makes meson think the test is still running,
and thus execution of "make check" continues forever.

This fixes the regression introduced in:

  commit a9c9bbee855877293683012942d3485d50f286af
  Author: Chris Laplante <chris@laplante.io>
  Date:   Tue Aug 22 17:31:02 2023 +0100

    qtest: microbit-test: add tests for nRF51 DETECT

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1882
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/microbit-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
index 2abcad8e31..72190d38f7 100644
--- a/tests/qtest/microbit-test.c
+++ b/tests/qtest/microbit-test.c
@@ -434,6 +434,8 @@ static void test_nrf51_gpio_detect(void)
     g_assert_true(qtest_get_irq(qts, 0));
     qtest_set_irq_in(qts, "/machine/nrf51", "unnamed-gpio-in", 3, 0);
     g_assert_true(qtest_get_irq(qts, 0));
+
+    qtest_quit(qts);
 }
 
 static void timer_task(QTestState *qts, hwaddr task)
-- 
2.41.0
