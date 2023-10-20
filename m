Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1028055ejb;
        Fri, 20 Oct 2023 00:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBGHz5OVsKb3/2puSquMtGsIM9pTX31YAwOyVn9yd2p7YGroXzyMsY1YRsgWgQMg13ddIh
X-Received: by 2002:a05:620a:444f:b0:778:a0f6:24b2 with SMTP id w15-20020a05620a444f00b00778a0f624b2mr1335988qkp.68.1697785236053;
        Fri, 20 Oct 2023 00:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697785236; cv=none;
        d=google.com; s=arc-20160816;
        b=hfUoXQvLj48NcpQ9G3nD+cjWcgzSMi0o8mY+5CnXJfYnEpjpKx0fTIDiCq0Hz80piJ
         4nll65P+OcnOFYF29ZHNxucQOtz1BqpdgM5sjWOG044//+ymPUvE961hEKr9DyhmLNK1
         1Wzvhn55pgxOMWLcYTn0nhV3iRGPiqAhz3OhBLHFsgNqMgZbjWV6GwKWytb3S5FJqiuZ
         Pj3BKEPkFrUHjvAiPF420J/WI0TPwuEa7rHIEk+1BcQ1BkGKMdBQ+ji0MzK9ckBj/9Uw
         5613ERpmTJdFaeJ8om5Z/jssd5+CcktRd73QLhFBkVvE5gF1iOdaiA5uPjk3A0AkCSNw
         zhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/ct7tpaBQF/mAugReIGRzRiq07xyYjlXknJgUpBhWjc=;
        fh=fTjRJWWf32rfQWm8ROIsswmsB54Y1g6a+adPg1wBxPA=;
        b=ZUwY0kcNbhhtGowr5m/WIBGmh3yYuJhMB+RAeEezG+fh6MxjbSlrzvI4lITxfoqVbj
         cRwBDdSjmMIEHlgTqW9JdSN6wN8qw+wlY7TC4IpRjJcnGbI9UtgNjeHtW8KERFYD9pTJ
         TQKrCusbgVrvTUd2l2YHUhkbYBAGKpyorDo0uCFJSzeZ7MMTNnZIWUqlm47bRhjppQSL
         oENCZpTI1eEWKiOipYZHw0HiaPM8SwTbqzR/h8ReZQClV/2wJuU1JFuqi9zVGo07wUnq
         lMe2KbVv3A+taMXR9o/3IBexOvyFh8bO+JoEjBki/kUVbR9lzOmI06YdqK8eoL5tUGxo
         RTGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iY2MqIg1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18-20020a05620a109200b00773b364bd64si794655qkk.391.2023.10.20.00.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 00:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iY2MqIg1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtjUN-0006LB-KO; Fri, 20 Oct 2023 03:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtjUG-0005yq-E3
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 03:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtjUA-0004M3-Mh
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 03:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697785194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ct7tpaBQF/mAugReIGRzRiq07xyYjlXknJgUpBhWjc=;
 b=iY2MqIg1tf+ABuaXT5ScWLuwSs1w78A4g2OgnSvtzYt0/8zyoU62pZXRZSLptV/bp3dVIR
 OIl4n2Gx4p9w6JAB29CYCVXrgiJsUAwWhXqC1cfbaJ3zATTQUjwDm3UTEfYH6fo/k4ldFo
 dXPadOMM0pyVHVmuRb3QDvHyBbUg3H8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-9Ml-1w3MMcu4zB3EHdme4w-1; Fri, 20 Oct 2023 02:59:35 -0400
X-MC-Unique: 9Ml-1w3MMcu4zB3EHdme4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E93B86B8C0;
 Fri, 20 Oct 2023 06:59:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E540B25C0;
 Fri, 20 Oct 2023 06:59:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 kvm@vger.kernel.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-arm@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Stefan Weil <sw@weilnetz.de>,
 Peter Xu <peterx@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jeff Cody <codyprime@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org
Subject: [PULL 13/17] tests/qtest/migration: Specify the geometry of the
 bootsector
Date: Fri, 20 Oct 2023 08:57:47 +0200
Message-ID: <20231020065751.26047-14-quintela@redhat.com>
In-Reply-To: <20231020065751.26047-1-quintela@redhat.com>
References: <20231020065751.26047-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r5IPvU9k32L+

From: Fabiano Rosas <farosas@suse.de>

We're about to enable the x86_64 tests to run with the q35 machine,
but that machine does not work with the program we use to dirty the
memory for the tests.

The issue is that QEMU needs to guess the geometry of the "disk" we
give to it and the guessed geometry doesn't pass the sanity checks
done by SeaBIOS. This causes SeaBIOS to interpret the geometry as if
needing a translation from LBA to CHS and SeaBIOS ends up miscomputing
the number of cylinders and aborting due to that.

The reason things work with the "pc" machine is that is uses ATA
instead of AHCI like q35 and SeaBIOS has an exception for ATA that
ends up skipping the sanity checks and ignoring translation
altogether.

Workaround this situation by specifying a geometry in the command
line.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231018192741.25885-9-farosas@suse.de>
---
 tests/qtest/migration-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index dfea75b76f..9959a0dc12 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -757,7 +757,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         memory_size = "150M";
         machine_alias = "pc";
-        arch_opts = g_strdup_printf("-drive file=%s,format=raw", bootpath);
+        arch_opts = g_strdup_printf(
+            "-drive if=none,id=d0,file=%s,format=raw "
+            "-device ide-hd,drive=d0,secs=1,cyls=1,heads=1", bootpath);
         start_address = X86_TEST_MEM_START;
         end_address = X86_TEST_MEM_END;
     } else if (g_str_equal(arch, "s390x")) {
-- 
2.41.0

