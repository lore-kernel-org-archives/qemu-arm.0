Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2041862ejb;
        Tue, 24 Oct 2023 06:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+J9dLuUJ7Z1qhXZAkSB8fkYoS5I+PXIRnhYl3dYxbNt/C6DVF43BmM5wo+N7RciBSuE41
X-Received: by 2002:a05:622a:151:b0:417:934e:ade with SMTP id v17-20020a05622a015100b00417934e0ademr15087312qtw.15.1698153593661;
        Tue, 24 Oct 2023 06:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153593; cv=none;
        d=google.com; s=arc-20160816;
        b=NMZ6lUDYFX0SRRzXZqdKIZonigNhred6yedwzPWO1vI0upoE93KUl7S5FVEmiUAVXr
         +hrJuiI5oH7/ykaxSNUSlnetGM7gy8+PHz0ZV9aCjpFg2EwtG3rnvIu5FbAULstOUdey
         lfF2aUgKOlintVPGsqGUhr6Q7G/vl/urw6eUY3cN8DbcMQ9PO0pZC9DUyfyJJhSQO+F0
         rAnD1x7d9VmhLMGO53oJ4hb/kmFY4pEiHBCwdigs8r6kt4JBjqrZfHYOlwDqW2PvaLuh
         h42j9JfZ+Vh6GLZ9lEUnYNTzFXf/1oUVS7kRh5IqNFwAwdrhvqvjKTHhgbl/l2iY4jeA
         P7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wSytcPgXUihOAo8jO1TEKPhY/Cs4SiCxtxaCJgHSibA=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=ejnLxvn9gpRT1Wm2cuj3D56jBkabPqRMBYqqeby4NCh9eDe+vlm1q6LbC2IRXJaEHL
         FnpPUlhIj1Uk/Q+vR6nm1p65sZyjK0v5A/8CZnQZYDw2r60Nq3QP0m6IaXRe6PblTqEH
         sk+QuuCpYbSrI89qfNGWo2qtCObPFSTdgkEErsaHp9eO/POWF9dYpIx2n7cTcmxgVb27
         xcPB+US1oky3U++ckYOPe3M2UYduL10x/UlsUhJeRJ/aVxxVcMjRd8vfUR0/iihN1DsP
         9gKLPCA6PLZhB3qChsFT2HKPjBtzPlvIaboJSXhpldndL6zgtcHakZkvT8e24F7Gz9y0
         O6DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/ABcIAt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020ac85803000000b00419842fb21csi6832927qtg.488.2023.10.24.06.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/ABcIAt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvHEM-00047Z-Ox; Tue, 24 Oct 2023 09:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHEL-00042W-4E
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHEI-00013A-AI
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSytcPgXUihOAo8jO1TEKPhY/Cs4SiCxtxaCJgHSibA=;
 b=Z/ABcIAt7ZxT/ObeUHva7DRpqjAp9KoFC9FJ3y1pjfRpPGEpQTuiPt08WwbXItFX7TELWZ
 6yXZDiJoC7z+LR2radJ2YilzofEX2NyIKp8HozFY6PqwMOU5m0fOfP8u4Oq0ccOFJhqZJv
 nWpLP+6Z/kp9OZZYGYac4uyhT5H4ELM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-Vg8m86fZOGaYBel35wJwoA-1; Tue, 24 Oct 2023 09:13:48 -0400
X-MC-Unique: Vg8m86fZOGaYBel35wJwoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62EE980171C;
 Tue, 24 Oct 2023 13:13:47 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3798C1C060B9;
 Tue, 24 Oct 2023 13:13:41 +0000 (UTC)
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
Subject: [PULL 05/39] migration: Receiving a zero page non zero is an error
Date: Tue, 24 Oct 2023 15:12:31 +0200
Message-ID: <20231024131305.87468-6-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-TUID: eXj+FvLRyWL5

We don't allow non zero compressed pages since:

commit 3edcd7e6ebae3ef0ac178eed5f4225803159562d
Author: Peter Lieven <pl@kamp.de>
Date:   Tue Mar 26 10:58:35 2013 +0100

    migration: search for zero instead of dup pages

RDMA case is a bit more complicated, but they don't handle it since:

commit a1febc4950f2c6232c002f401d7cd409f6fa6a88
Author: Richard Henderson <rth@twiddle.net>
Date:   Mon Aug 29 11:46:14 2016 -0700

    cutils: Export only buffer_is_zero

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231019085259.13307-2-quintela@redhat.com>
---
 migration/ram.c  | 15 +++++++++++----
 migration/rdma.c |  6 +++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 92769902bb..4bfb20c94a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3715,16 +3715,18 @@ int ram_load_postcopy(QEMUFile *f, int channel)
         switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
         case RAM_SAVE_FLAG_ZERO:
             ch = qemu_get_byte(f);
+            if (ch != 0) {
+                error_report("Found a zero page with value %d", ch);
+                ret = -EINVAL;
+                break;
+            }
             /*
              * Can skip to set page_buffer when
              * this is a zero page and (block->page_size == TARGET_PAGE_SIZE).
              */
-            if (ch || !matches_target_page_size) {
+            if (!matches_target_page_size) {
                 memset(page_buffer, ch, TARGET_PAGE_SIZE);
             }
-            if (ch) {
-                tmp_page->all_zero = false;
-            }
             break;
 
         case RAM_SAVE_FLAG_PAGE:
@@ -4030,6 +4032,11 @@ static int ram_load_precopy(QEMUFile *f)
 
         case RAM_SAVE_FLAG_ZERO:
             ch = qemu_get_byte(f);
+            if (ch != 0) {
+                error_report("Found a zero page with value %d", ch);
+                ret = -EINVAL;
+                break;
+            }
             ram_handle_compressed(host, ch, TARGET_PAGE_SIZE);
             break;
 
diff --git a/migration/rdma.c b/migration/rdma.c
index 2a1852ec7f..2d963fd147 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3592,7 +3592,11 @@ int rdma_registration_handle(QEMUFile *f)
 
             host_addr = block->local_host_addr +
                             (comp->offset - block->offset);
-
+            if (comp->value) {
+                error_report("rdma: Zero page with non-zero (%d) value",
+                             comp->value);
+                goto err;
+            }
             ram_handle_compressed(host_addr, comp->value, comp->length);
             break;
 
-- 
2.41.0

