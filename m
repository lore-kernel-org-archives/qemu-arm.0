Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D42CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:25:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNdJ-0001VS-1r; Sat, 30 Aug 2025 11:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Lt-0005nB-BT
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Lr-0004zs-KG
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756497932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E61UbPQ98vkxoeM+8ySKgPLne5BO/4Y70dZrTRJJ2TY=;
 b=UFnaBPj11Uf4RzH1HdTVn3Uifk4kD2ZNhbplTHwBugWd1Rraukkor2vHNSrRca9ijgntK0
 SlG8JmtsOcJEbrozjG6I2Jdz5FfyhXfas8+7q49YPMuYr5kZ3L8UeOA918EbJh79seuzif
 7ZhPAxdbySeS74fbeVs4ahXqLMQCETc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-Phr44hZONkuYB0JgirFjlQ-1; Fri, 29 Aug 2025 16:05:31 -0400
X-MC-Unique: Phr44hZONkuYB0JgirFjlQ-1
X-Mimecast-MFC-AGG-ID: Phr44hZONkuYB0JgirFjlQ_1756497930
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-324e41e946eso4302328a91.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497930; x=1757102730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E61UbPQ98vkxoeM+8ySKgPLne5BO/4Y70dZrTRJJ2TY=;
 b=gpCZh3mt7jJXx2tmyEpbDgtsn2RTtbKu0BZdhmVPyXNHz0MAxlFXfDZIe4jdORur1O
 ch1CJeWqlS4F8b8xaugFFvgcm7tU8JIOXN6kwV3sk+p4qv1P5jV6oIq9C/3XSlAg/YDk
 oeUdzsb6x4cxkmiw9kYh+6HN1wqFca3iFQHE0YYlSIV6O1W0g0TIPQ5ZHyjgocRvP8fT
 OPH82sYZ0Mz2PrMYKpdFUBnKHvj3e9dUEaQv2/qslUbcD/++aN+KD0In6C31eaHCOkPV
 XWNFseEF2hzaRH1Wvk2U6V8wNMzpuzOtQzAezRFes9P/9X0w/inp6XL5iR+D3XAZjbf7
 XB5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqgUJyfEpXh7VWoTjKlDbWSIgyTiTPNt+kx/gE2+yXU8CrU2mQApmtPQ8v4Jqt7BI/mLfUfo1GNQ==@nongnu.org
X-Gm-Message-State: AOJu0YzJgFSFPn7W3w8WaYj5TVtUyrBXX3YPAzKqOo0F/Z0c97OqsXAN
 Lkm24i1NxPM48Z55aFyz5HU2N8gKHxYcaa/M2G14xxjPUfzgKJ59dM6iaOauCOYsVXr287tjyfu
 GaHa099n8rLjDNFESYHTIkyNo/VY9z25sL8CelWij/yISWdnKwlajLA==
X-Gm-Gg: ASbGnctaYqP4ePBXrNV5hc/Kz8wNe9/f9kEYp/Nfu2U5bFzY0XwhAk2fWbAGbVJ9Ar1
 f0y9SV2awj6qRhQHGzp7iWCiwKfnks5H6HRHPd4JAvZdutk8RTGPk7YPtcohq1V3Ghh5V/7iR2C
 wD2LUU0rDcyApMJ/A5rRQqPVB9MRbZPcYkY8k0SEiCGQbcUAsTQAK1dHfrfUm9uyDmUDqFGyDja
 NjEe09+lQSrMHqp51b5mJ48mJNguFeC0BVyR3pEgUW0foPOoLLOr+Qve6zovRBnwtZGanmr7GrD
 9TZqRNW7xtbUAk6rjmheEAiB0LVdaVxnwVi3jgdZFjmfWESAbMrkoA==
X-Received: by 2002:a17:90b:3b43:b0:325:c492:1541 with SMTP id
 98e67ed59e1d1-325c492175cmr22835612a91.28.1756497930083; 
 Fri, 29 Aug 2025 13:05:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuX/BrZGUS172oogpgm5e6mzBTOhZOlFtQqbEyr0ARMKNzXC53YQE91AW8LSA472NHdtRa3Q==
X-Received: by 2002:a17:90b:3b43:b0:325:c492:1541 with SMTP id
 98e67ed59e1d1-325c492175cmr22835556a91.28.1756497929609; 
 Fri, 29 Aug 2025 13:05:29 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:05:29 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:53 +0530
Subject: [PATCH v13 13/27] migration: make loadvm_postcopy_handle_resume() void
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-13-a4e777b7eb2c@redhat.com>
References: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
In-Reply-To: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052; i=armenon@redhat.com;
 h=from:subject:message-id; bh=J3tCTCrF6nSfsNZa6QUxbIzpTTI6Us9gYinavq3Uol8=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdt/ciOUuZSfElEo/hXLe3BQ6kSdq/bYj2WuSj8tua
 9a+xj2to5SFQYyLQVZMkaXha4BsU0BhRKTty+swc1iZQIYwcHEKwEQEWhn+6R77/EEq7FXO3nf7
 zm3VmHqp6XfGp8+yyx1EUw96Hv9wQ56R4eiDt8fvT94s/2CP1Fl31e1uIpY/1ig2WUyT+msyJ2z
 1TiYA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DvUrUtdQt8rxn3rURLs_DCCNKY686_O3gv92CCIDFOE_1756497930
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use warn_report() instead of error_report(); it ensures that
a resume command received while the migration is not
in postcopy recover state is not fatal. It only informs that
the command received is unusual, and therefore we should not set
errp with the error string.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index d54028b1be4d7a1e4615c2b05611535bd7478e2b..c079942b7ecb959b3b668b977174d906f73c2777 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2334,12 +2334,12 @@ static void migrate_send_rp_req_pages_pending(MigrationIncomingState *mis)
     }
 }
 
-static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
+static void loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
 {
     if (mis->state != MIGRATION_STATUS_POSTCOPY_RECOVER) {
-        error_report("%s: illegal resume received", __func__);
+        warn_report("%s: illegal resume received", __func__);
         /* Don't fail the load, only for this. */
-        return 0;
+        return;
     }
 
     /*
@@ -2391,8 +2391,6 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
         /* Kick the fast ram load thread too */
         qemu_sem_post(&mis->postcopy_pause_sem_fast_load);
     }
-
-    return 0;
 }
 
 /**
@@ -2647,7 +2645,8 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return ret;
 
     case MIG_CMD_POSTCOPY_RESUME:
-        return loadvm_postcopy_handle_resume(mis);
+        loadvm_postcopy_handle_resume(mis);
+        return 0;
 
     case MIG_CMD_RECV_BITMAP:
         ret = loadvm_handle_recv_bitmap(mis, len);

-- 
2.51.0


