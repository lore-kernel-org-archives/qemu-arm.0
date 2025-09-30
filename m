Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1D1CAC5B8
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:25:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3RtN-000774-PZ; Tue, 30 Sep 2025 00:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RsH-000603-Nd
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RsA-0003C8-0Q
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nt2BdcjCfw2C3SywznVrdvSqpi6ZfH0CwzvWi2Q/H10=;
 b=QFrcwPQQDlavoMF429ul9SApMWuRX3gQ6X1MeI4sUmWECkxvsB1MWhPWuipCUM7DUGaXct
 9oSdiflZgx43sY1zt6JCogYAygtDczHGRxefPd3TNcIEKhB9O3XdyYhadGl0OEpmRwnoTt
 9V21ko2At4DxSUAYnOHcY6pRy1cCojw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-fhAbJ6NTPgyUnCUOqUv4Aw-1; Tue, 30 Sep 2025 00:21:45 -0400
X-MC-Unique: fhAbJ6NTPgyUnCUOqUv4Aw-1
X-Mimecast-MFC-AGG-ID: fhAbJ6NTPgyUnCUOqUv4Aw_1759206105
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3304def7909so5337166a91.3
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206102; x=1759810902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nt2BdcjCfw2C3SywznVrdvSqpi6ZfH0CwzvWi2Q/H10=;
 b=Ll61UDS71LiCza+4hODjR1c7De6xyWLP75oIFlywRag3RLu6eJdDChe2Yj3neDRSK6
 9wZzWJPAEBcllMgPdseV+9P4ErvwRc6O4GVAKcTd/zlMMe1h1uUq6ZTsNrTppk3OWQ09
 ZlJev0J4nac8TEZiIzAOJjFpC1PRAaWQiSxjny5Kl+vG8tezNeQIIf0jaK0TEqrfUg+Q
 ohmRgiDRUbryzPOTDjaz1V3OFYnizBupN9cA9qwRT/ACYnBaAmiJHVpuZjMHbzm31Wlt
 ldcDizcjKuf0ZacCAYp3dnMpZifIgg0S1gOXuudTBS2f1juajhzfSf5/jq7MYqZiPgoW
 eyIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMQn4lq7OFEjSq1WI81S0EgwLYXvDDPvCUJCD67P/R6IktVG6YgD/ssCRkFqlzLjlTu+FszIK4Yg==@nongnu.org
X-Gm-Message-State: AOJu0YzHs4+MmmdeedilFUUnedrYqIZajcp4ryUknPDiE4cPmYKL5BX+
 StBF7OZJksVW0IW0QJUl+xpMgyZeG3ZN4ZLaEZQDkzLHCmo4HMha04haYzOxg07RbyhifGruhFP
 8HFaZhnEgz7tGjLd1RywQBU/eiwaEM64TJG44a0o2Tzdax2s6PkNx/A==
X-Gm-Gg: ASbGnctIkJYW7MUPiTLTGF2lKRBjjJ14m5wZe1tGiZOqy46+5LzuEX9ouLxjfnhUiQS
 3/VtRdEzfGE017JhYa4vngJBFb12vWc9kJEC3URkfOoXaVjAvD5uDNWHnfBWpTgNLRGrXrCk27s
 /yVEm+8hq+tSje6rIDUHtGBEHWeNs3mj/ukrfVuPOrZQja1CItffGCJL8zEpxhdCp7+fEYsqjE4
 GW3P45yJAFnrHSQal/bdCkOE/gE56vm9RerO+0IP/K/3leUx/0NgzIzqmFxempfVWDB1469UzSL
 Y1m6qSUFEL1atW+G1swesOiweJUDdiT9Vr94yZaP3BqcgPu1M43UXhzzUg==
X-Received: by 2002:a17:90b:33d2:b0:330:9c0b:5494 with SMTP id
 98e67ed59e1d1-3342a2992cfmr19981668a91.22.1759206101693; 
 Mon, 29 Sep 2025 21:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7GdRMSHqdEqMK/fZHh7igzuyFGpe3tNAm5kAEqwInUMCT0Xn8hyl81qdC2vxPkOlCgjUe9Q==
X-Received: by 2002:a17:90b:33d2:b0:330:9c0b:5494 with SMTP id
 98e67ed59e1d1-3342a2992cfmr19981621a91.22.1759206101335; 
 Mon, 29 Sep 2025 21:21:41 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:21:41 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:28 +0530
Subject: [PATCH v15 19/26] migration: push Error **errp into
 loadvm_handle_recv_bitmap()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-19-84afd3af1e47@redhat.com>
References: <20250930-propagate_tpm_error-v15-0-84afd3af1e47@redhat.com>
In-Reply-To: <20250930-propagate_tpm_error-v15-0-84afd3af1e47@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Steve Sistare <steven.sistare@oracle.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, 
 Hailiang Zhang <zhanghailiang@xfusion.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2748; i=armenon@redhat.com;
 h=from:subject:message-id; bh=eQZYnlZRcR0SBqpqymYhsTca0TVM2HZLHtbTROMUgkI=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKEGvqF2555fMcTVkOpw8/7+8xPF3DRNspMRuWqzz0
 FnwJ1y0o5SFQYyLQVZMkaXha4BsU0BhRKTty+swc1iZQIYwcHEKwEQqExkZPk89qfDftStlfdrX
 nwtZBcsOdWXPnNBTqWxjo94zd3fadEaGlxWGAmuVyp4vdw3tO9p/RtJ9hebK6vsy+XNtb3Ud9+z
 mBAA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HPFJ2f1wC6W2WD10u7r498dzuR5Ta6BkcYOHzFjSvCw_1759206105
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This is an incremental step in converting vmstate loading
code to report error via Error objects instead of directly
printing it to console/monitor.
It is ensured that loadvm_handle_recv_bitmap() must report an error
in errp, in case of failure.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index b80da04b47ff08b4cb6aed1a57c703acaf3eb9ac..2e8776768fcc7d139b9f06fff9285673166a8951 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2476,32 +2476,35 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis, Error **errp)
  * len (1 byte) + ramblock_name (<255 bytes)
  */
 static int loadvm_handle_recv_bitmap(MigrationIncomingState *mis,
-                                     uint16_t len)
+                                     uint16_t len, Error **errp)
 {
     QEMUFile *file = mis->from_src_file;
     RAMBlock *rb;
     char block_name[256];
     size_t cnt;
+    int ret;
 
     cnt = qemu_get_counted_string(file, block_name);
     if (!cnt) {
-        error_report("%s: failed to read block name", __func__);
+        error_setg(errp, "failed to read block name");
         return -EINVAL;
     }
 
     /* Validate before using the data */
-    if (qemu_file_get_error(file)) {
-        return qemu_file_get_error(file);
+    ret = qemu_file_get_error(file);
+    if (ret < 0) {
+        error_setg(errp, "loadvm failed: stream error: %d", ret);
+        return ret;
     }
 
     if (len != cnt + 1) {
-        error_report("%s: invalid payload length (%d)", __func__, len);
+        error_setg(errp, "invalid payload length (%d)", len);
         return -EINVAL;
     }
 
     rb = qemu_ram_block_by_name(block_name);
     if (!rb) {
-        error_report("%s: block '%s' not found", __func__, block_name);
+        error_setg(errp, "block '%s' not found", block_name);
         return -EINVAL;
     }
 
@@ -2640,11 +2643,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return 0;
 
     case MIG_CMD_RECV_BITMAP:
-        ret = loadvm_handle_recv_bitmap(mis, len);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_handle_recv_bitmap(mis, len, errp);
 
     case MIG_CMD_ENABLE_COLO:
         ret = loadvm_process_enable_colo(mis);

-- 
2.51.0


