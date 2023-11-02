Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp326951eja;
        Thu, 2 Nov 2023 04:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRvIJAs4Ici2r7U2E7av3zhk8mquvWkk8nIzj4uI1fJDbW6H8rkPS83rFEo0kYpkr4bXHn
X-Received: by 2002:a05:620a:45a3:b0:775:6726:7e77 with SMTP id bp35-20020a05620a45a300b0077567267e77mr21161635qkb.10.1698926082489;
        Thu, 02 Nov 2023 04:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698926082; cv=none;
        d=google.com; s=arc-20160816;
        b=LxTSxSKHbg0fAB3nXxxMe9tDXtM8cgtL3QfP+sp8PFVU6aebTWwHAtmuW/Am+6NOH5
         CyUXdu32XbAaMFLseySqsYgodSUPw1oQelnZw/9UA7Mx8pULSSaKhybHX6tzt7HkIhwG
         nQ/9Q8SJSltA4pP87okZW72tHxdgX4DQNvQrtquiEJxu0NA/Uj6xdbB81O3Dvhh/puIq
         Qv08VoXBdqyiKv+HcZ4PU5XIvQjQaM0ViSxFZg8jobnBgl5UY7ZE+V5PDwsdFzttpyDw
         zz+4QCUlA9c4eH85MIx5Gs3+YjJPo/mphFedVcfO/eD5PDph5tj+DN7/wg7c5PZNijxL
         F0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nU3JuMWHygF67xfbq/l2au3y8PAann8vt1M9q4g8gpU=;
        fh=ES/vJtI5J5RM9CDwQFbx/OtSpDk18PEyXjfn3CS+k7o=;
        b=HxWETt/LsGNR4vZ9wkInHvw6DB0+kXcEJ1rpS+67y9GllC5TDxBZJIJC2/xVGl7HG5
         rct4lKjXVWCgEB6KIpJBLOtE97n1s2SftDw0PYR/3ssbwo8xzNpf80JYp7Ctudgo1Dl3
         p7QuZ+z5l/ywtxahxgR3Dr0/pP3qqq8HFVs99WWrj18CrYbHtjyPmv5NStj1VtB7RXe8
         H5eC12OAGmdQExbzl8Ba5tWONWX94drQeQiGHx/UiQtcnyiOtpCyrb93czOP9fnPkG8g
         R4g1S1bCeGbevg/qg1v2sKtwsRmk2au5sP+OwbONYp10I8pLHQhjUdBh4ZByw6KSvqtW
         IZIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfxTmH6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020a05620a066900b007758e5dba43si3928972qkh.481.2023.11.02.04.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfxTmH6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyWBg-0003Jm-Qi; Thu, 02 Nov 2023 07:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW9Z-0000AL-Sf
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW9V-0006yE-71
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nU3JuMWHygF67xfbq/l2au3y8PAann8vt1M9q4g8gpU=;
 b=LfxTmH6Eum5V107paY2hEcS8zN3krNlYTQnA+Df8cNMEno/H3qnNFVYkURoVCOFK46Vpwt
 It4zG0jqOTEg57mUtwv197tdJT7d8eDNoGMiZmh8I0BAr0RrNnhvIx3mhDV7wN6Et0rHru
 tr9wuKMJIWXCVIDC7JKdry/BfJUCovE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-VqLnO8mIO529w4tlw41hDQ-1; Thu,
 02 Nov 2023 07:46:15 -0400
X-MC-Unique: VqLnO8mIO529w4tlw41hDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B73E33C14911;
 Thu,  2 Nov 2023 11:46:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25D7C2026D6E;
 Thu,  2 Nov 2023 11:46:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>, Het Gala <het.gala@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: [PULL 40/40] migration: modify test_multifd_tcp_none() to use new
 QAPI syntax.
Date: Thu,  2 Nov 2023 12:40:54 +0100
Message-ID: <20231102114054.44360-41-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: J1huLopaDDHx

From: Het Gala <het.gala@nutanix.com>

modify multifd tcp common test to incorporate the new QAPI
syntax defined.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231023182053.8711-15-farosas@suse.de>
---
 tests/qtest/migration-test.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 047b7194df..e803b46039 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1310,7 +1310,12 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
 
     migrate_prepare_for_dirty_mem(from);
     qtest_qmp_assert_success(to, "{ 'execute': 'migrate-incoming',"
-                             "  'arguments': { 'uri': 'tcp:127.0.0.1:0' }}");
+                             "  'arguments': { "
+                             "      'channels': [ { 'channel-type': 'main',"
+                             "      'addr': { 'transport': 'socket',"
+                             "                'type': 'inet',"
+                             "                'host': '127.0.0.1',"
+                             "                'port': '0' } } ] } }");
 
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
-- 
2.41.0

