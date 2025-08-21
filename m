Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195F2CA0EF8
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:51:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0yC-0007wd-Io; Thu, 21 Aug 2025 04:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0wx-0004QE-4I
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0wm-0001Ju-KZ
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755766017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpqnEptwezU1dB9sFAUu0JGNQXbWEN6mcNeNsGNkqH0=;
 b=CxLZpbKhETou0Xy++udOjHsbdvh2VFd52FhBUUmaDbSbZif4xFTuX/opieH0mY1iwR4oZO
 AZriZ4k45rn9Q/Xh1qZYlQtQopGoJ++INIBo54QfyK7oiOH9BXYAPkp2ZM+4CqZ/eCIRTc
 feEMCk9IAy5l/NJd1axhPVeZyREpGe8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-DeQ9hUSHOJ6i7oWijK6dnA-1; Thu, 21 Aug 2025 04:46:56 -0400
X-MC-Unique: DeQ9hUSHOJ6i7oWijK6dnA-1
X-Mimecast-MFC-AGG-ID: DeQ9hUSHOJ6i7oWijK6dnA_1755766015
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b47552d8643so613431a12.0
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755766015; x=1756370815;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zpqnEptwezU1dB9sFAUu0JGNQXbWEN6mcNeNsGNkqH0=;
 b=brvgsjuGmhyHxxke2lF66wLH+Xh93L5pTDh+3lBVN7JcX0KYIGSGWpHR2dD1YTv9T5
 jAKW8JvEm0ANzvhdBno4r8Snic+6TwmhPngJmQjh3t+NDXqLSEzFT3p0VR1VzgEiKMEo
 RKg+KcOmL7ngpzPVt6se6YrdW498Mvgh32OpfsJjwmmMV5sOta7lIt+nmyQxinEk7BxL
 HAbz9S2+GtudFEnV1101tR/Lbz1BoDZOJa8TTtYwe+8AGSN9vljnQvUbAE6g5/YZ/sGZ
 ayfl6dH+MLrker/qGZ/aimcp9SHelsYi8D23nb8vxSgUQHOvgICKbuSnTlu0z/gf5/yQ
 rPgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3SEapxvZUTTJrUtf43nJFKOieKZQIRIMMRB5KlK236/PaIR8Qd4nzKm9SsyczXHzxzkiszlGO2w==@nongnu.org
X-Gm-Message-State: AOJu0YzxreLABbet2V3WM+OzDXaC0MLRUfx7zN5OAlV8yCHFftO+4Tp4
 EzvKMOa/nDEDAj6zWynIcNmRKtVItn6oAt44OvfsgnQ+KNn7BbuMyaHoafFnmgTeoA8RyBO20Js
 2gaB3QwEtqpZjX16Xh1MZICxu5DjcRKYgY36c43sHuB3vEQQlYZNe+w==
X-Gm-Gg: ASbGncvzYap5aEkibu6GuLNg+2Jkc/ock+Jl9S1mU0bDHHCTC2q/KyrrqV4+YoDl4t+
 1FSzaVOLtTx9f++QNddiSEnHD3d+kiYpSMD3W9tmeTHSJg0tJgnJ3yCIEf0P4DOmTx38z5TdAO+
 lSC/UhuxzMTMatznVK4InJMdBnkIhGD48UYZb5OsSPysoIC8snuJFE8gXTzDXJ0xTqA4u63OQRm
 CmraGscYW270tw3lvMDZSVt5ocYMUH1scDX78kIGcHJxQtKFeSjnzX+zbNNzzGZd741vzLWC2DL
 gKOHgjc92KgWHItgsn6WzXRmrFa7/Lf+rO2Sb1j8E+TYWQasx9f6
X-Received: by 2002:a17:903:4b07:b0:240:1bba:fc7d with SMTP id
 d9443c01a7336-245fedcc268mr21255025ad.33.1755766015313; 
 Thu, 21 Aug 2025 01:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKLbSCd0SyJ3NhUYkW3PJAKfF3wYS6AAK7+AeX13WRmQ2ymnBFjaNYjShfRv7WuX/JHFlmoQ==
X-Received: by 2002:a17:903:4b07:b0:240:1bba:fc7d with SMTP id
 d9443c01a7336-245fedcc268mr21254785ad.33.1755766014846; 
 Thu, 21 Aug 2025 01:46:54 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:46:54 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:07 +0530
Subject: [PATCH v12 13/27] migration: make loadvm_postcopy_handle_resume() void
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-13-72b803e707dc@redhat.com>
References: <20250821-propagate_tpm_error-v12-0-72b803e707dc@redhat.com>
In-Reply-To: <20250821-propagate_tpm_error-v12-0-72b803e707dc@redhat.com>
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
 h=from:subject:message-id; bh=N5pt1gunHOlKLf2QzPY2g/q1GokUjbzWIX3PAZeY0eI=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayOymcjfPYby+PMA4ydgtb2ax+ZIVGhcXGA6ZsrhpnE
 xy/hut2lLIwiHExyIopsjR8DZBtCiiMiLR9eR1mDisTyBAGLk4BmMjGqQx/xZ1Y1x9jmmrvsX/x
 XvtZJssfc97X91SakGFfuvLgKrm3Rxn+B01nu7ZMuFNl35PjaffU04xTf4RrWcSen/DJKFyPtSW
 OBQA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BTTCyyefmcrEbXm_1tUPDrbRAGPd5RY1HY46miz_-Rw_1755766015
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 2446711e862233801d5689a775517adabec593d9..f13fecb5cc4778974c883fbbc007b0cd18d90e64 100644
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
2.50.1


