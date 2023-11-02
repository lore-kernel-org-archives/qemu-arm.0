Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp323346eja;
        Thu, 2 Nov 2023 04:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOJ/ByLQCf0alLqEdyKIQYoI0RI2ChgREoUk5p3mgWkksch315XuPw99wMNtobZwSSw5zd
X-Received: by 2002:ac8:5882:0:b0:417:b746:8dec with SMTP id t2-20020ac85882000000b00417b7468decmr20336400qta.58.1698925646417;
        Thu, 02 Nov 2023 04:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925646; cv=none;
        d=google.com; s=arc-20160816;
        b=BJhbiSa3A9WJzecHJNKIwVSIT0r9hzyZ9qNcCyOiNWYPxqFhStMYCICDEzZazf9wW5
         guvDLMzLsnEJuHiHhWysmljl+RER+lM4YGNOhCs6qoyJRCFHf/YGoW0zQq1H2MccbT6n
         KSG+8/3tBb/2V9KMtFNPn4x/DwpQ9efk2DvuyMW3pUz9aUnFuDmpNCYhtl2yfnno5i1y
         FgvlmMIHEz3K0SyX3UFZ9fFDwSlQKM089zgNDegOXX+sfHO5+drHncfVejFgmgv1X+QX
         f8acUd6nj13yjbxJoM3lCtMrrysxOWrM4YeF7gZd2I9HKT01J5dyxTdwM342lAKJhruL
         d4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2UJjtoKxeaTq7gSOWpQNjc21A04IDbpuKKE5nUOQ10I=;
        fh=ES/vJtI5J5RM9CDwQFbx/OtSpDk18PEyXjfn3CS+k7o=;
        b=kYr25pny8l+XZhkyw2YRZqf81jEipz3241xTzvh97PRoUPxaEaHqk08+WyQKnibZTh
         spso1ywYpX/E6YZba4dPnnAuv2GocmTu1wjX3Y2LBErqWye8UoKcBKya0LoC8s60lmzN
         7kEmtA06zDwNqjwMcnX09/8XbVIZHMF0Z1l1NttuvkOJVXiayYR96Or0wF/MsnDJIkU2
         YpzwfGaARk2n+izt+o1IYP72mmZPjQz8Aw3bq7WgYAPGzFa/zniKCCF/O9IpxjPmQIw7
         eYVuS7ALhzD1NXYwUVtlX4lx+xBt10AUDl/35+qNhmw6N/xWD7a7S9/2dWgO3FB3QDDR
         ZxOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPPVNFV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15-20020ac87f8f000000b004054648ff3bsi4236169qtj.284.2023.11.02.04.47.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPPVNFV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW8v-0007gP-Dy; Thu, 02 Nov 2023 07:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW8J-0006k8-D8
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW8H-0006JN-1B
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UJjtoKxeaTq7gSOWpQNjc21A04IDbpuKKE5nUOQ10I=;
 b=WPPVNFV4xkEETQf/AZjZGBvLeQgSAF368Y2enKOXeUg6vaV4c/dwBk8xGKpvVjWZvSxRJs
 ggofUaf4YjFh0ExxsYFa+hY8rvJdO4NBHybg/o/Zanm+BE6X664n5rdvE94+qKmw54LMQL
 qpzgLEjcw1DwIh/mNJ8gcWwypdNl13c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-wAZf_UDXOBar1PRZN1Meag-1; Thu, 02 Nov 2023 07:44:56 -0400
X-MC-Unique: wAZf_UDXOBar1PRZN1Meag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2DB1101A52D;
 Thu,  2 Nov 2023 11:44:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F28D52026D6E;
 Thu,  2 Nov 2023 11:44:46 +0000 (UTC)
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
Subject: [PULL 30/40] migration: New QAPI type 'MigrateAddress'
Date: Thu,  2 Nov 2023 12:40:44 +0100
Message-ID: <20231102114054.44360-31-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GVgHJOHrO1rM

From: Het Gala <het.gala@nutanix.com>

This patch introduces well defined MigrateAddress struct
and its related child objects.

The existing argument of 'migrate' and 'migrate-incoming' QAPI
- 'uri' is of type string. The current implementation follows
double encoding scheme for fetching migration parameters like
'uri' and this is not an ideal design.

Motive for intoducing struct level design is to prevent double
encoding of QAPI arguments, as Qemu should be able to directly
use the QAPI arguments without any level of encoding.

Note: this commit only adds the type, and actual uses comes
in later commits.

Fabiano fixed for "file" transport.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231023182053.8711-2-farosas@suse.de>
Message-Id: <20231023182053.8711-3-farosas@suse.de>
---
 qapi/migration.json | 57 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/qapi/migration.json b/qapi/migration.json
index 3daeffc95d..182b150b87 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1584,6 +1584,63 @@
 ##
 { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
 
+##
+# @MigrationAddressType:
+#
+# The migration stream transport mechanisms.
+#
+# @socket: Migrate via socket.
+#
+# @exec: Direct the migration stream to another process.
+#
+# @rdma: Migrate via RDMA.
+#
+# @file: Direct the migration stream to a file.
+#
+# Since 8.2
+##
+{ 'enum': 'MigrationAddressType',
+  'data': [ 'socket', 'exec', 'rdma', 'file' ] }
+
+##
+# @FileMigrationArgs:
+#
+# @filename: The file to receive the migration stream
+#
+# @offset: The file offset where the migration stream will start
+#
+# Since 8.2
+##
+{ 'struct': 'FileMigrationArgs',
+  'data': { 'filename': 'str',
+            'offset': 'uint64' } }
+
+##
+# @MigrationExecCommand:
+#
+# @args: command (list head) and arguments to execute.
+#
+# Since 8.2
+##
+{ 'struct': 'MigrationExecCommand',
+  'data': {'args': [ 'str' ] } }
+
+##
+# @MigrationAddress:
+#
+# Migration endpoint configuration.
+#
+# Since 8.2
+##
+{ 'union': 'MigrationAddress',
+  'base': { 'transport' : 'MigrationAddressType'},
+  'discriminator': 'transport',
+  'data': {
+    'socket': 'SocketAddress',
+    'exec': 'MigrationExecCommand',
+    'rdma': 'InetSocketAddress',
+    'file': 'FileMigrationArgs' } }
+
 ##
 # @migrate:
 #
-- 
2.41.0

