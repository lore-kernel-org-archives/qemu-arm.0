Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1028100ejb;
        Fri, 20 Oct 2023 00:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7HcQuHAGNi2lyA3Km/NbddpzdJQiqven6VcPwGQHbnkp3Fzk2fbqmdOkAmOFUNtox8sL0
X-Received: by 2002:a05:620a:2782:b0:770:70d6:417c with SMTP id g2-20020a05620a278200b0077070d6417cmr964823qkp.33.1697785241006;
        Fri, 20 Oct 2023 00:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697785240; cv=none;
        d=google.com; s=arc-20160816;
        b=iVOv1HbrLzdd27MUMmq4lpTdAgiMdEf5CJJTkoqgKIus3tIVXa5tS0TOZUS/q1ArYy
         J54RGHxUjU76SJaM0K5dz9C5jfqNfkstSR3rhI8tVsD75JE6ulCn8F7Se8+j8zSTgTSi
         c6n/fMt8tcofr8VCNSrfUd7ua4qRMuP7rRdGlZol10hCA4yQo/UoBCzUwEuQfx0lR0q5
         0s9GRKmK6HxMw8MiEPEgm2gf/ASq+K4j+c0basHOkY4yY5n637pZSaJ6xgQwdapL7DDi
         C+CSiY2IQbwF8+rreTlOuKcOQFfI6OAb1ue81KpV88GsoC5Y9j4RmIg1eE7/ENnfR27k
         oloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0AjHopf0WSr2ZtMzzl7kHx/e4uPmz/VqQWHe0zDEnXg=;
        fh=fTjRJWWf32rfQWm8ROIsswmsB54Y1g6a+adPg1wBxPA=;
        b=BGq3X2Kza/x2O+kWQNp9Z4CgjfNOgh5FTYrVELPN9je8YXQ10sF3SUkffEzVTn4Gbn
         N79B5w5Y91wIEE0LSPrtB2EJmLvUNf7ceMLWMS3lNIP5vZsJGmq8GSYqM/ScmmFtEX8v
         wz8MNAHNwCnsNtWneO4ath+BdIdAVSgaO0BU2FkRrgrUsB2U+4R8Cp2kX+eSzyVpiV3V
         p1dgnE1QHTJpFiS/7JYj4dR/YOGAbKOJRcPimaeEz5wL7kV1pWjTAoCYZMuIXKGpPX+r
         oxEnQkf2XdWl9xXrAcVSHq9mZ5ej2cZw6zjDMy/FIKsU9sKDvCs6LffDVHkG6L34BaMz
         6i1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UOzdSDEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020a05620a11ba00b0076daeaded07si802516qkk.74.2023.10.20.00.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 00:00:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UOzdSDEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtjUM-0006IK-LE; Fri, 20 Oct 2023 03:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtjUI-00069g-Pb
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 03:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtjUG-0004Pl-7z
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 03:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697785199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0AjHopf0WSr2ZtMzzl7kHx/e4uPmz/VqQWHe0zDEnXg=;
 b=UOzdSDEshpDA6LZHOaexl5ktDp0Eb6H46Nxa24a2rwCEA69/pfU+Gkim44zzwdDpe13SVD
 wxZv8SYPlgg4zkriLuIPTKR/oNQocuUxdKl/QBUUrPSGglkBBvvX785nsausVtbA6FOHB0
 uPokofwKudU97DyZBop6zB0gMffajak=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-G2MNXjNWMiGGAYIq1SYCYQ-1; Fri, 20 Oct 2023 02:59:55 -0400
X-MC-Unique: G2MNXjNWMiGGAYIq1SYCYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64AEA3C025BA;
 Fri, 20 Oct 2023 06:59:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C911D25C0;
 Fri, 20 Oct 2023 06:59:32 +0000 (UTC)
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
Subject: [PULL 14/17] tests/qtest/migration: Set q35 as the default machine
 for x86_86
Date: Fri, 20 Oct 2023 08:57:48 +0200
Message-ID: <20231020065751.26047-15-quintela@redhat.com>
In-Reply-To: <20231020065751.26047-1-quintela@redhat.com>
References: <20231020065751.26047-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V+8pW0UMLDbg

From: Fabiano Rosas <farosas@suse.de>

Change the x86_64 to use the q35 machines in tests from now on. Keep
testing the pc macine on 32bit.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231018192741.25885-10-farosas@suse.de>
---
 tests/qtest/migration-test.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 9959a0dc12..03f3feac7b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -756,7 +756,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_dst_resume = false;
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         memory_size = "150M";
-        machine_alias = "pc";
+
+        if (g_str_equal(arch, "i386")) {
+            machine_alias = "pc";
+        } else {
+            machine_alias = "q35";
+        }
         arch_opts = g_strdup_printf(
             "-drive if=none,id=d0,file=%s,format=raw "
             "-device ide-hd,drive=d0,secs=1,cyls=1,heads=1", bootpath);
-- 
2.41.0

