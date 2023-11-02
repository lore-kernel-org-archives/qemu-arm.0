Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp321459eja;
        Thu, 2 Nov 2023 04:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaTzKYb0dXVkf8MPIjJUnD2Aahv9cQULygG9BdY+dZxz9hCaf3RmWuLt7ESLs5lyZ4IjGr
X-Received: by 2002:ac8:7d10:0:b0:41e:41e3:72ac with SMTP id g16-20020ac87d10000000b0041e41e372acmr22301743qtb.65.1698925437238;
        Thu, 02 Nov 2023 04:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925437; cv=none;
        d=google.com; s=arc-20160816;
        b=qrl0z+orxd6et1Q5MeA0+V/wDpyg+HV9YG2nVS5qlxp48n3If/qHtioR+Go18PQyCF
         GYL2/VjLa9bAWeiwZkf31KpnkR4kHtttugrtzyXNpAupTZzOBObAhb5rWt+VsKI+8KNo
         3gPZy99bbYcOwOXyqZ9Cxlv1TmiPeqMIUDvBqzyKgb9Y6Jx9jMVbb0cNRcUKstYBPHyq
         iadfW0GuPDyfO85ysRrs7vKjUXcMcPJDBh4R8mvZfnBA3Q6VoKTqpD3DSGMYj8JEm5r0
         kqWkXO5hQ4nEg0U4BhUggRoPfBV37qI+S3j9x5o2oxzafNTlsAhREdTHfT4hNfKBrDPz
         tSmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6nMXgCoVhISLBJNOjtiuvCJB8LXGvZSvy0RxY6VNnQ8=;
        fh=T4EM+6jbLn5eRwObk7JR2S+dK3nM2HMDfFhJxfrmv8w=;
        b=EoK6/B2zzs1MwMYS3w5zhGUgOS93cKcchCruqD9269+MIy3ost/5OY3UpshWxqrkP/
         hd59Ed6dWrJ1c9kPm/RFiUrzaKyRj++kVbVRGA+yxcDpHByyslwMZva5fOzbuklssZ3i
         IT21DQUBZWRU7efrDm2RMYty4M1FgLj+XyoAhM4JARWTPOHnwh3HAonNj+dPTCMa9eKK
         iZNhqWUWaJhIw6fUgjx1QiOgPq0TNEyxf5GTtU3xn/TfUu5LVi9QAMMMJvi5S8fIg7Ev
         B6c6qiAORPFawofY1gIZ81QGcSe6m9EjrQ5jxq6Mu0iTwKWbB9O2YYs47qlnBH5xBp0A
         jiqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TK+7EC/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a05622a188d00b0041cc4e7c208si4308382qtc.417.2023.11.02.04.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TK+7EC/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW6k-00059C-Rz; Thu, 02 Nov 2023 07:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW6Q-0004Er-Ln
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW6M-0005dz-JL
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nMXgCoVhISLBJNOjtiuvCJB8LXGvZSvy0RxY6VNnQ8=;
 b=TK+7EC/JH0/lXc2D1kygANyvNmyMGdQCEkDTmu/pnN7y5FHeWFzuOAzN0l4R91dW9OsSKi
 19aUk/IpJqjOEiV6um2TceshxGpUMG2y9rtEHJCM7i3NsMdlcJDiV+dVDKScpCbAGmqas6
 t/60HKbKBPdYj1XK/YkaifHmyb03K08=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-600-zh0O5OqGOmaFAuQ-9m0-vQ-1; Thu,
 02 Nov 2023 07:43:00 -0400
X-MC-Unique: zh0O5OqGOmaFAuQ-9m0-vQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 789CB3806623;
 Thu,  2 Nov 2023 11:42:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 418212026D4C;
 Thu,  2 Nov 2023 11:42:51 +0000 (UTC)
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
 Fam Zheng <fam@euphon.net>
Subject: [PULL 15/40] migration: Set downtime_start even for postcopy
Date: Thu,  2 Nov 2023 12:40:29 +0100
Message-ID: <20231102114054.44360-16-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: u8E6o9++FZ2r

From: Peter Xu <peterx@redhat.com>

Postcopy calculates its downtime separately.  It always sets
MigrationState.downtime properly, but not MigrationState.downtime_start.

Make postcopy do the same as other modes on properly recording the
timestamp when the VM is going to be stopped.  Drop the temporary variable
in postcopy_start() along the way.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231030163346.765724-2-peterx@redhat.com>
---
 migration/migration.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 6abcbefd9c..6dcdc5be2b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2126,7 +2126,6 @@ static int postcopy_start(MigrationState *ms, Error **errp)
     int ret;
     QIOChannelBuffer *bioc;
     QEMUFile *fb;
-    int64_t time_at_stop = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     uint64_t bandwidth = migrate_max_postcopy_bandwidth();
     bool restart_block = false;
     int cur_state = MIGRATION_STATUS_ACTIVE;
@@ -2148,6 +2147,8 @@ static int postcopy_start(MigrationState *ms, Error **errp)
     qemu_mutex_lock_iothread();
     trace_postcopy_start_set_run();
 
+    ms->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
     global_state_store();
     ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
@@ -2250,7 +2251,7 @@ static int postcopy_start(MigrationState *ms, Error **errp)
     ms->postcopy_after_devices = true;
     migration_call_notifiers(ms);
 
-    ms->downtime =  qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - time_at_stop;
+    ms->downtime = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - ms->downtime_start;
 
     qemu_mutex_unlock_iothread();
 
-- 
2.41.0

