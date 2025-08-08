Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21450C87FDA
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:15:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuS-0001Eg-5K; Fri, 08 Aug 2025 09:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHM5-0000dV-Og
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHLy-0007UJ-BJ
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VuZFKU3Jg6irtyxMzzHZyLIIYiPtf1tnCGXgXD8zn2Y=;
 b=exEOl0tAq9hGzVUDYU0WsqaMCa92WKW0ihVwMKZ3h/hvq5koqTmtimyRWvWixra7OCVtU6
 /ZW3lN9SNAGvh6u06QnYLdpq9Y0XwnDqAzZ8e76eKJbNy1xb9EGrJvfd0e86hmUPIUotW0
 wXYkytChShXCWtu+6xbLOq9gsAzlz7M=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-My__HW6vOlKdJmeF1maZVQ-1; Fri, 08 Aug 2025 03:17:22 -0400
X-MC-Unique: My__HW6vOlKdJmeF1maZVQ-1
X-Mimecast-MFC-AGG-ID: My__HW6vOlKdJmeF1maZVQ_1754637442
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-242a1390e9eso38572445ad.2
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637441; x=1755242241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VuZFKU3Jg6irtyxMzzHZyLIIYiPtf1tnCGXgXD8zn2Y=;
 b=o7xBT24J9S32TFASe/G2Ruc2OU2KV5cwDy7HSVNgfrvpaoZAb4dp4Opwwr4SM3tcap
 ObsI326zQx2moB0qVpqixS/PwjkzkeBtWiOKjYiVfBUv4pM0g+kRlGBxEY5JPLLS5kNJ
 QhG7Mge9a7ma8ELjnCoP1xOLCguf0jjhfvZukX3Vggw0cuGMYSM1E1UEnLE48p6VclYS
 Q+Lp8N/+xI0BZALwgmb3EGgH+NU5pD9CAtvrb0BNIt9aRm5ZnG7F/cujK7pKhNvj5IR0
 A1Xc81fYl3nj1YUZpyC+mht9+PSRxBc3du3IbKX9QyoCiqDTJhBmqob5+AbC6o7TH42+
 1MuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXgvQlXp7utGul89bCdvXNhN0BaQI/3hXzeDqRus4Xxa+5z5tVRatHK5S2jssCPjVsFYPH5Ry3cg==@nongnu.org
X-Gm-Message-State: AOJu0YxF0OTFE0H51xpcS97aKAoa5o4GyxjfS0kTXVQQtEnoSKOSgDPX
 9RUR86ooftQkcBh/r1Y/JIZONF7p4rOTqIy/INuxkkp3A2oJpfLrXS6j1n2AGSssUUSl3QDhzAj
 IOLI1bMFVUhpi5pUq7jeZSfEJudeeOXqbuPYi3OpH9TSjxL+9ucglIA==
X-Gm-Gg: ASbGncvq/9HNimD+OKt8DXNEgkm6EnTOVsSrErD+05p/Fg4E8Jqyb+RujsdpZvfIefI
 5yL9TX2O/W5gSF41zUkYR8zWhqj8Y9cLGwA6bTvzr85bmIkjMhrcr7f8gUmC77QK1bAFjqLZnqd
 anLWBeeCNn66sVwtjJoHz5eNpH9VogUBFgZZYMHUkw/QCEM/IZ8tHSCsTElRytXvl+JhlBACVR6
 YGQfDLkRkdwFbF/WN0Hr+C204DkSlcR1SdN6H08DkGhGdhCcQIFiEjQ2lEnaf2QbFjkZUArqUSF
 mKicaDAVFqatWlGqUU43EgWELe8v5EyUNtwDu2q1RmLx/NU6V39x+w==
X-Received: by 2002:a17:902:f543:b0:240:6406:c471 with SMTP id
 d9443c01a7336-242c1fdc70fmr24830135ad.10.1754637441642; 
 Fri, 08 Aug 2025 00:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqThrVl7mh9dk9HiCSrkgsfdWDieqAna3Deo2yk1LqZkP6EdRBEe1/XonRml65w2A9GqMboQ==
X-Received: by 2002:a17:902:f543:b0:240:6406:c471 with SMTP id
 d9443c01a7336-242c1fdc70fmr24829685ad.10.1754637441200; 
 Fri, 08 Aug 2025 00:17:21 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:17:20 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:44 +0530
Subject: [PATCH v10 18/27] migration: push Error **errp into
 loadvm_postcopy_ram_handle_discard()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-18-3e81a1d419b2@redhat.com>
References: <20250808-propagate_tpm_error-v10-0-3e81a1d419b2@redhat.com>
In-Reply-To: <20250808-propagate_tpm_error-v10-0-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4283; i=armenon@redhat.com;
 h=from:subject:message-id; bh=RIny+MVa8NwcBOwJOpnRsRtDdNQCfAqkefsPQQZuy50=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxdd2szMUrv7DNFnko1LXevF3ojPq14r48c/WV3Y7s
 Hsf56KvHaUsDGJcDLJiiiwNXwNkmwIKIyJtX16HmcPKBDKEgYtTACayuZKRYfatBb8up59KulW3
 8ecfySPC1yJbDnyyvF9+TOeDjWr0vS0M/5TzXub9P8T3gV8mgtPj2BTmA9pTuVPZCubKL+itW8W
 5kgEA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iTk_Ti0eqh_tet9CR4M0O1DTSmXDkAEx945CbAd8PAg_1754637442
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Aug 2025 09:13:19 -0400
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
It is ensured that loadvm_postcopy_ram_handle_discard() must report an error
in errp, in case of failure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 18ca11e14aed906d0b1a7190acd6449f3f117e91..9098c4bd3394d7b9ed77e20afbb26fd9c9be6550 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2004,7 +2004,7 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
  * There can be 0..many of these messages, each encoding multiple pages.
  */
 static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
-                                              uint16_t len)
+                                              uint16_t len, Error **errp)
 {
     int tmp;
     char ramid[256];
@@ -2017,6 +2017,7 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
         /* 1st discard */
         tmp = postcopy_ram_prepare_discard(mis);
         if (tmp) {
+            error_setg(errp, "Failed to prepare for RAM discard: %d", tmp);
             return tmp;
         }
         break;
@@ -2026,8 +2027,9 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
         break;
 
     default:
-        error_report("CMD_POSTCOPY_RAM_DISCARD in wrong postcopy state (%d)",
-                     ps);
+        error_setg(errp,
+                   "CMD_POSTCOPY_RAM_DISCARD in wrong postcopy state (%d)",
+                   ps);
         return -1;
     }
     /* We're expecting a
@@ -2036,29 +2038,30 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
      *    then at least 1 16 byte chunk
     */
     if (len < (1 + 1 + 1 + 1 + 2 * 8)) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD invalid length (%d)", len);
+        error_setg(errp, "CMD_POSTCOPY_RAM_DISCARD invalid length (%d)", len);
         return -1;
     }
 
     tmp = qemu_get_byte(mis->from_src_file);
     if (tmp != postcopy_ram_discard_version) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD invalid version (%d)", tmp);
+        error_setg(errp, "CMD_POSTCOPY_RAM_DISCARD invalid version (%d)", tmp);
         return -1;
     }
 
     if (!qemu_get_counted_string(mis->from_src_file, ramid)) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD Failed to read RAMBlock ID");
+        error_setg(errp,
+                   "CMD_POSTCOPY_RAM_DISCARD Failed to read RAMBlock ID");
         return -1;
     }
     tmp = qemu_get_byte(mis->from_src_file);
     if (tmp != 0) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD missing nil (%d)", tmp);
+        error_setg(errp, "CMD_POSTCOPY_RAM_DISCARD missing nil (%d)", tmp);
         return -1;
     }
 
     len -= 3 + strlen(ramid);
     if (len % 16) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD invalid length (%d)", len);
+        error_setg(errp, "CMD_POSTCOPY_RAM_DISCARD invalid length (%d)", len);
         return -1;
     }
     trace_loadvm_postcopy_ram_handle_discard_header(ramid, len);
@@ -2070,6 +2073,7 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
         len -= 16;
         int ret = ram_discard_range(ramid, start_addr, block_length);
         if (ret) {
+            error_setg(errp, "Failed to discard RAM range %s: %d", ramid, ret);
             return ret;
         }
     }
@@ -2631,11 +2635,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_postcopy_handle_run(mis, errp);
 
     case MIG_CMD_POSTCOPY_RAM_DISCARD:
-        ret = loadvm_postcopy_ram_handle_discard(mis, len);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_ram_handle_discard(mis, len, errp);
 
     case MIG_CMD_POSTCOPY_RESUME:
         loadvm_postcopy_handle_resume(mis);

-- 
2.50.1


