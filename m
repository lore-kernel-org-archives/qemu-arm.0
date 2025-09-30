Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D62CAC5B8
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:22:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3RsB-0005xV-95; Tue, 30 Sep 2025 00:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rs4-0005iy-DF
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rri-00032r-MS
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIIkEdhnleE/ncO4jCGDN+8xNFRhF6XCVj4kpuj7vMY=;
 b=LSUaLIplyT/GXMW8z8V6lbyj/R43lC9vqu7z/g0ho+/3AZNiHEVivd8P669m50Izbjl2sF
 H9tX9d5Is0r7xzODHRoESa3FTf0kpSQSEB95E3iDKxmirk6CxqtmItX3gior8/qNa6kkUS
 NZZ+1FhGfZJvDDfDnk1O053FbLzdfWI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-_izYdnYbP6SyWjRJUyfgaw-1; Tue, 30 Sep 2025 00:21:22 -0400
X-MC-Unique: _izYdnYbP6SyWjRJUyfgaw-1
X-Mimecast-MFC-AGG-ID: _izYdnYbP6SyWjRJUyfgaw_1759206081
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4f93fe3831so7415525a12.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206081; x=1759810881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIIkEdhnleE/ncO4jCGDN+8xNFRhF6XCVj4kpuj7vMY=;
 b=omtyZuL54pBNIqfYLJGjziGyCdkYMLoJtf7OovpIwe+6lYfsvtjdDCixf2MPYQHuCr
 jjoEdkoeUcMl5tAe6PFEJJLIb+r7PsSYigburKq02UTlcKDvURc14TV4/NwDXpBITasi
 bzh8W0Yq5I+RXz0ZJgzIcN8vy5v5vjqABjbyWvhKjKZAhk+JRZN3+BPkZVZuxvKqPFvF
 kd+22rJls/Qk+43De/xaJb+K5dSFGZHSeatkkSXUnA7klc2NhY0pAtZbcaqTxEqK70sA
 KF0oViJFNOfJyMrEHCMGfZm89L5P3L10Jae0kmjvbTeFdZgm+rYo+VQgHXXWeZUr5lwb
 /biw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVp63V9dC3CP1/+SkznbIu5HH7zWgcmTOPf1q7EB1H+JWjL+sVoGwsC8acnZAp6XkatBwg8QYzRg==@nongnu.org
X-Gm-Message-State: AOJu0Yy9fZC/QrCorNZe5HmTvwoAUIdOw2P99z7S3ZtT2KHxOmHPvscq
 3cbMqNR0cSag9ShtqJIHcV6wsd1uTQZqrq7+ANeFCw04/GVhIzswDti70jbxelqoEFtkirGFKxl
 UtEsnQgnsPJwIMq+p1LNW1I5cwnN+ANWFjcy3VCWWmeDZEP0e8dvNDw==
X-Gm-Gg: ASbGncsuTub6CCXFDFaKQuxpZydoLTK5rmozJBDP82+HYM0Ux2edFYWAgcOjft27Ubs
 NHKRPm9EI1f4VSM6mTXrDt7cJEw7uwB019/UCH7JJVLoT+u9VpZrMYMOXxhaFfZx/SlIti7fo/J
 lsMbXtU/38R362VwHqYOiwxfa52q/bAvFdf3RFqjUvhwpwcb/3w7NwbN4YSeu2mVcMDI6QX7DuZ
 DUrgUur/bpD5liOG31LMxgM1RD5e4YVDQn7zaiGU/rtJ0MMc/Fb+EReQbT+9eSfSTAoiEHXyj1V
 VQZs1wAy08NO2jclOsWIDgdxGkFzCPk3F5+aXFM0pUIO6dSCbHHOt/dKLw==
X-Received: by 2002:a05:6a21:6d88:b0:262:8422:5774 with SMTP id
 adf61e73a8af0-2e7d10991e9mr24956149637.39.1759206081156; 
 Mon, 29 Sep 2025 21:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEvcgEQsoPBNC/Buh9OnGMsE/naVAMknGhFi74qzEUTxwc9CRuZOnT5WUlmvQ1T9q/ADlFAg==
X-Received: by 2002:a05:6a21:6d88:b0:262:8422:5774 with SMTP id
 adf61e73a8af0-2e7d10991e9mr24956121637.39.1759206080800; 
 Mon, 29 Sep 2025 21:21:20 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:21:20 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:26 +0530
Subject: [PATCH v15 17/26] migration: push Error **errp into
 loadvm_postcopy_handle_run()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-17-84afd3af1e47@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=armenon@redhat.com;
 h=from:subject:message-id; bh=gmtVzum7WhZI6TobCuUuyorZinEIl/+8OMg03Aypz7E=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKMGv19Lyo/ulv01pu9Ondn7eR/VfD2snmL65H3Bk+
 u1Z3cyrO0pZGMS4GGTFFFkavgbINgUURkTavrwOM4eVCWQIAxenAExk1TqGf+qLZrXcbFkzV6fD
 h/380+tF22N+BDzVO+Onfv3K37DO8GkMfwXO7uNlaeW8ql8+rfUqh67+DSN3ng0NCbzbRR+eNTT
 8xwQA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: si4TKQLca5GRaqxuZjY2CwqMYD_h3GEHTcmYYu9dN8k_1759206081
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
It is ensured that loadvm_postcopy_handle_run() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index ce88f56498cf88a30de4f0d50c2b5068e4e3939b..f7947160fd5af351a09c0ae75879e80710df4c7e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2273,13 +2273,13 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
 }
 
 /* After all discards we can start running and asking for pages */
-static int loadvm_postcopy_handle_run(MigrationIncomingState *mis)
+static int loadvm_postcopy_handle_run(MigrationIncomingState *mis, Error **errp)
 {
     PostcopyState ps = postcopy_state_get();
 
     trace_loadvm_postcopy_handle_run();
     if (ps != POSTCOPY_INCOMING_LISTENING) {
-        error_report("CMD_POSTCOPY_RUN in wrong postcopy state (%d)", ps);
+        error_setg(errp, "CMD_POSTCOPY_RUN in wrong postcopy state (%d)", ps);
         return -1;
     }
 
@@ -2626,11 +2626,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_postcopy_handle_listen(mis, errp);
 
     case MIG_CMD_POSTCOPY_RUN:
-        ret = loadvm_postcopy_handle_run(mis);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_handle_run(mis, errp);
 
     case MIG_CMD_POSTCOPY_RAM_DISCARD:
         ret = loadvm_postcopy_ram_handle_discard(mis, len);

-- 
2.51.0


