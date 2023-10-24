Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2045575ejb;
        Tue, 24 Oct 2023 06:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtmMJyDzV87JioA8Vkm5zWICfUwfPZOnFCUuI4A/+x1oKD6MJY2ijmlVf8VNmv2CWoPf+h
X-Received: by 2002:a05:622a:1344:b0:418:597:b71d with SMTP id w4-20020a05622a134400b004180597b71dmr16395766qtk.4.1698153956877;
        Tue, 24 Oct 2023 06:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153956; cv=none;
        d=google.com; s=arc-20160816;
        b=hD4Xja0g70jFnnGSfKH/ROp9m/ANKEdUJfu2HPAQve61TANRLJEmdmSR06Q+8cp7bh
         +VycMxwlA3SeTvCVUwmF3uvaeoXio/u23sqqWvGLHy0axF+MgFzCJRz1uqaKHe18fFp1
         C+3OiLyZxUxhXeTeKkRvhU1zfHznMFXDZqz36R8co09z8ohDznBuHAh7jD3tq5LvEOZu
         8PNdcVUuaRZ6+WKDHx1U78V6CipRYxSek0AlDhwXbHyidV2BTYTsLQzHr3A6oUluNEeZ
         t7BeQ+rI7kMsYQfjLkDV29Mk6/vCIrwy2ZrrxmXtGVrtwl6Hz/6rDv5yWCJ87cY/g4R+
         odPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=77QZXHxmGIv+7ff6eBAOwo4yRfWetR/ODM9nZc4xPZI=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=zQpRw+rbrBJDcygd9ldKA2y0xg3l9d83D3ZI3JnU6iGU3koCQifvOJ++qhrG0PUzb4
         GLB0gn/pEq3bdZGJjXbesv2VLPWnPm6Bx2DdovcILpwdNEC0aeyDkCQ3nfGnX5tyv4zb
         zX51XDgTSMu9o/UiKPrkdtS7F4TKlK8TOmPS+DNnECXt0tJj8gm5s3Tx7zpAPA++DA6c
         uBTaQFWxgvMgnd6sLsgnzHaRJ7zCqaPLqZHYsJkckKUUK4uYDoYLuevcbH+e7oa3aarQ
         ZFdgt8QvbaZOkzAGcfD2kw9+4I9QylKPeoTUc+GtOU/1fw0mOaWfKOrc3kWi+7UxORmJ
         bFxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hKRNpnT+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20-20020a05622a055400b00417a09a99b2si7203464qtx.724.2023.10.24.06.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hKRNpnT+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvHK3-0001Jz-D1; Tue, 24 Oct 2023 09:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHHj-0005JQ-1E
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHHe-0002DO-E8
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77QZXHxmGIv+7ff6eBAOwo4yRfWetR/ODM9nZc4xPZI=;
 b=hKRNpnT+T5eAzj1Y9ASOp5cqRh+8BdpbX5WNUER623nD20OLIVs1F7RFuny4QS5t8eH6q1
 CG4ygiUWKfN+t/u9UECnaz/ONvZQmZkLtyVE3F55xChUBCF8tfvNDVCBCl4Idar8lGz2EJ
 odreBTYfdaEzmBFumEaWoFJ3k30TpVQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-n0PP6jFyMoaYSyuBQyT0tA-1; Tue, 24 Oct 2023 09:17:17 -0400
X-MC-Unique: n0PP6jFyMoaYSyuBQyT0tA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E004D80171C;
 Tue, 24 Oct 2023 13:17:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E69B1C060AE;
 Tue, 24 Oct 2023 13:17:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 36/39] migration: migrate 'inc' command option is deprecated.
Date: Tue, 24 Oct 2023 15:13:02 +0200
Message-ID: <20231024131305.87468-37-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-TUID: bFyMV1EanPyQ

Use blockdev-mirror with NBD instead.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231018115513.2163-3-quintela@redhat.com>
---
 docs/about/deprecated.rst      | 8 ++++++++
 qapi/migration.json            | 8 +++++++-
 migration/migration-hmp-cmds.c | 5 +++++
 migration/migration.c          | 5 +++++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2febd2d12f..fc6adf1dea 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -461,3 +461,11 @@ Migration
 ``skipped`` field in Migration stats has been deprecated.  It hasn't
 been used for more than 10 years.
 
+``inc`` migrate command option (since 8.2)
+''''''''''''''''''''''''''''''''''''''''''
+
+Use blockdev-mirror with NBD instead.
+
+As an intermediate step the ``inc`` functionality can be achieved by
+setting the ``block-incremental`` migration parameter to ``true``.
+But this parameter is also deprecated.
diff --git a/qapi/migration.json b/qapi/migration.json
index db3df12d6c..fa7f4f2575 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1524,6 +1524,11 @@
 #
 # @resume: resume one paused migration, default "off". (since 3.0)
 #
+# Features:
+#
+# @deprecated: Member @inc is deprecated.  Use blockdev-mirror with
+#     NBD instead.
+#
 # Returns: nothing on success
 #
 # Since: 0.14
@@ -1545,7 +1550,8 @@
 # <- { "return": {} }
 ##
 { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
+  'data': {'uri': 'str', '*blk': 'bool',
+           '*inc': { 'type': 'bool', 'features': [ 'deprecated' ] },
            '*detach': 'bool', '*resume': 'bool' } }
 
 ##
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index a82597f18e..83176f5bae 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -745,6 +745,11 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
     const char *uri = qdict_get_str(qdict, "uri");
     Error *err = NULL;
 
+    if (inc) {
+        warn_report("option '-i' is deprecated;"
+                    " use blockdev-mirror with NBD instead");
+    }
+
     qmp_migrate(uri, !!blk, blk, !!inc, inc,
                 false, false, true, resume, &err);
     if (hmp_handle_error(mon, err)) {
diff --git a/migration/migration.c b/migration/migration.c
index 67547eb6a1..06a706ad90 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1620,6 +1620,11 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
 {
     Error *local_err = NULL;
 
+    if (blk_inc) {
+        warn_report("parameter 'inc' is deprecated;"
+                    " use blockdev-mirror with NBD instead");
+    }
+
     if (resume) {
         if (s->state != MIGRATION_STATUS_POSTCOPY_PAUSED) {
             error_setg(errp, "Cannot resume if there is no "
-- 
2.41.0

