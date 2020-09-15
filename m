Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3110839lfq;
        Tue, 15 Sep 2020 05:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz53yO6tz1mWgYwVG0rSpU/w8/LrBYUlq2w1au9ioi5ftNeLSaNTGARHEYM5RmIXS35LDMY
X-Received: by 2002:a37:68d4:: with SMTP id d203mr16340065qkc.125.1600171854076;
        Tue, 15 Sep 2020 05:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600171854; cv=none;
        d=google.com; s=arc-20160816;
        b=Ec/9yNbsrp6/c6BebHQhIgE46nG3ckD8OVG6VmzYBWOsa0j3duylg8r9RjwTP2MgPR
         YwanM6tGNAFQgIWoTU1XeVhCB6yy6khAEI+4q18U7OoFwSg/3u+qimtSFqGIdaa7ltT2
         hAeI0PEwwqZGVNNGn2mmtW0qQNiUUb0jx7ptBgnToXgBNxVUZs+nI+PfKl/5Ek3c54PL
         ZpS6dROOmqWGmkPtky9mJazdYr7oBCHiO/X6oMtleQkAMQUpDvvxltE1IKXHY9keB0Rr
         B6bdOAb62PkLaBdKaUxQVKvjYwmkNFguFR1+zy3Kpzo7LBrlnpdoqJxCWldK+CpydmjO
         wLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CjMaQq5b7d6xZab6r1I8iIsLu0kAb+RnTVO4UWJ1lpA=;
        b=tkzNOeBZgXyv/AVWke46gu+IN04pa78206aNsYl2PE0TE7PF7CObDIUWK5QQdzifkg
         SW+dj8fg46DC74Z/mYEFtwPULwOPRnqM6R64Fm19RVF8xZuigX/vRGcOdOmLm0Oz5NSo
         mCleZcX8gGykgQDkSjat+k766kPUnmsRXbEC38OxqA5oRkAcceK7ArqhAzEs/wMI44hN
         Uiyydf/cxvVm0E//xAxUJovYIsVP4V5EGJznoqXemn0CKEYsjsVKEi5LC6ugNHM7DoO9
         Fyr3pIzRB/NZ7l4kuOzR00Qi3ERrb0WROAvNLu4zc617/WEQwP8jjABdSOKjchTbj1vz
         BuZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VxZbO1qd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t35si8459705qtj.38.2020.09.15.05.10.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VxZbO1qd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9nR-0004Tm-5g
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9mH-0003vs-AK
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9mF-0007Sz-CG
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjMaQq5b7d6xZab6r1I8iIsLu0kAb+RnTVO4UWJ1lpA=;
 b=VxZbO1qdJpqd7H31vUksSrJR+ozHi6F4Qfzcu2bqKGuqURrafvZIuioRV9pjWZADVk5RfH
 fvdGot1h96LGls3rCTIxvQ9YRyGTzDkJ9XwPyP4UAnZa18XACXaVUI1lPGskHoxRXS7/rI
 kfu+GCfF+g+ylxjPEiq2swsGLkovlfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-_npvyFLdPbKjl14jxEqXnQ-1; Tue, 15 Sep 2020 08:09:33 -0400
X-MC-Unique: _npvyFLdPbKjl14jxEqXnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 545C31009440;
 Tue, 15 Sep 2020 12:09:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA09A51574;
 Tue, 15 Sep 2020 12:09:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 533A340BFD; Tue, 15 Sep 2020 14:09:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 18/21] tests/acpi: allow override blkdev
Date: Tue, 15 Sep 2020 14:09:06 +0200
Message-Id: <20200915120909.20838-19-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
X-TUID: 4us7KXrL2TTs

microvm needs virtio-blk instead of ide.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
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

