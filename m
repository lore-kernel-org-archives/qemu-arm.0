Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C636CA1013
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:30:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGXU-00026O-A8; Thu, 18 Sep 2025 11:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGXQ-0001ov-MB
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGXO-0003Lj-9K
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ex70HvFHCA+0PjVijQlAjy4Lm+10k8XimyJ545WFrYo=;
 b=chY8iX1xvUpLPkoCex1kdGFWOO5DAust+JoifsTdGxmUo4SimXLQ7wwZd2H8mxP56PPC7J
 J4MiYfFTH8cZ3wjuoPHuj2zAFASJiM3kyTWYN41qgdLhcPmM6OxAj7aF+Q7Q18tq8qOe56
 DUNQuM7JbWC75m8p3uNXkHR1PY9ul8U=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-9t1Fz-2CNvOEzT_Km4hjzg-1; Thu, 18 Sep 2025 11:27:06 -0400
X-MC-Unique: 9t1Fz-2CNvOEzT_Km4hjzg-1
X-Mimecast-MFC-AGG-ID: 9t1Fz-2CNvOEzT_Km4hjzg_1758209225
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7761dd1c845so1137201b3a.0
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209225; x=1758814025;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ex70HvFHCA+0PjVijQlAjy4Lm+10k8XimyJ545WFrYo=;
 b=M6Rvwn30azxUt8MalrP2LQZorP/USc9GX3cuRV96FBEQlT6y7NNY8JrI0IIte3tzhl
 lVRowpFH78Pz4Ayc7t0MEch5eFat1XCCe8s/CNSgEckzpnbNsp/qqHbJX6TWN80FKhKB
 hHnYKvuwGe1HjFo566eMGPiCal1Qf1b0CWB+REjzFDwIaUq0V9H3vSm0EoVJdZ4bj/0h
 +ndCWM3MwuULsoVis2kzSKo80b/2L4szzvAvVvbbAX/fE1fiNzjnkoBd/rNwbyp2Js7Q
 ff1ZmDQAnybQ7pZFwaBdumDEZpzI/uvjdEY+vTt/+OGiAZhFzwAL6HmCfIcU8Exr1aqL
 9FgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+wNUt+mvEvLeBb79mw1t3oNzdEp5PBnAdEGwYX9e7Iwx9uSuvaSdYk7DUBwjqjRieUHq+3X6aWQ==@nongnu.org
X-Gm-Message-State: AOJu0YydCHIbdPN2dnI5IggmTPpRE13lTVmqqyjiWZGvEIN4KrbNqtop
 wwM/D9dC/QrIZtkEbpfgGMm2SfCkUiin8xuf9W0jspH/4NPURDwDVrqjrvMT8zbmhuLwoHlj5nz
 k3hNS09vsuIRgrPFqtV5jtZ8i9Fhi7B3vycFXuQbfHD9Tiy694Rqlog==
X-Gm-Gg: ASbGncut2wpwQEkbOEglL6P5/XCltshwjgHwwU1Hmhuskk3p72pdwf6NCn1mPVFVXL/
 eBDFmFmuEaO50/W4Adl1Q1vKE3l8C2NOTZRyKX+DdJkI1f/u20qCN/a5/ooUE21RcwBCvt5hhyi
 8xImgyAe80K0oN44eEVm8vRRrFwzB2kXz4P7lVmDhbWgzFDHLqVV0jcJznlBnEGw2a1J8DUhCKT
 PXmHKZBDv3FqrprarzpDl1WtTqozk4lw+XjaZcvxJCwJ8BcG7RCFtzPS1t2h6d4KyZsaHi6gQOu
 pqlBLlpawDVVZaUcBl2DuM9ildEDqbQSizwqnIqyShz28sVEaMS/Aw==
X-Received: by 2002:a05:6a00:3c95:b0:770:343b:5457 with SMTP id
 d2e1a72fcca58-77bf926836cmr6879159b3a.16.1758209225206; 
 Thu, 18 Sep 2025 08:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFptHNEH9tCswXZHG2989Rs4/bM38KSXM8njI1sTSjzTP5FFJDpvoHgN/7DxjhUWdGBd3ATxA==
X-Received: by 2002:a05:6a00:3c95:b0:770:343b:5457 with SMTP id
 d2e1a72fcca58-77bf926836cmr6879099b3a.16.1758209224779; 
 Thu, 18 Sep 2025 08:27:04 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:27:04 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:40 +0530
Subject: [PATCH v14 23/27] migration: Capture error in
 postcopy_ram_listen_thread()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-23-36f11a6fb9d3@redhat.com>
References: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
In-Reply-To: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=armenon@redhat.com;
 h=from:subject:message-id; bh=dpJRFzd7gm8KScLE3AM8NwdARIO3OP6+DoU1jE8PGBM=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R+7/CLWHG3a2ZqctLtjyjUD7Vfaq7ea3X7F+m2yw
 k2/lPKzHaUsDGJcDLJiiiwNXwNkmwIKIyJtX16HmcPKBDKEgYtTACbiYcnwT3H+thUT+C4vP+QX
 Pyu/SnOhc6zFK+3fs59HeAsxrAn5sZWRYf+jHasnaa5uLmxb57vbc0XvoowGI6EJDeWTJN+p675
 VYwMA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J4iclbHSaj5ApCgVRlIiZuP2-FtUa9zsKQ6hSVmsFMQ_1758209225
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
postcopy_ram_listen_thread() calls qemu_loadvm_state_main()
to load the vm, and in case of a failure, it should set the error
in the migration object.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index b0fd51d0f142c30ce21bdc02204ce947283fea49..71f4d8399349934134c2c02609d3ede6f61754f8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2095,6 +2095,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
     QEMUFile *f = mis->from_src_file;
     int load_res;
     MigrationState *migr = migrate_get_current();
+    Error *local_err = NULL;
 
     object_ref(OBJECT(migr));
 
@@ -2111,7 +2112,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
     qemu_file_set_blocking(f, true);
 
     /* TODO: sanity check that only postcopiable data will be loaded here */
-    load_res = qemu_loadvm_state_main(f, mis, &error_fatal);
+    load_res = qemu_loadvm_state_main(f, mis, &local_err);
 
     /*
      * This is tricky, but, mis->from_src_file can change after it
@@ -2137,7 +2138,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
                          __func__, load_res);
             load_res = 0; /* prevent further exit() */
         } else {
-            error_report("%s: loadvm failed: %d", __func__, load_res);
+            error_prepend(&local_err,
+                          "loadvm failed during postcopy: %d: ", load_res);
+            migrate_set_error(migr, local_err);
+            error_report_err(local_err);
             migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
                                            MIGRATION_STATUS_FAILED);
         }

-- 
2.51.0


