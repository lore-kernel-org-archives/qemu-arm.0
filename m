Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B057CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:41:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNeB-0003er-By; Sat, 30 Aug 2025 11:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5My-0006HZ-F7
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Mw-00059a-67
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756498001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gj+j75kbzZRr8WyC+CT6yCwQ+uVU6b0xjRbHU07xHqI=;
 b=R0IOHKOFeVs6Qq48Xdb/tHyf+V+gAvHYMjQ/4heWKAqtSx7tQkjnWjJw129vY+g4mHaCRY
 CVNtvRW4SAoQIJObeyZAg5QQ4JSf7VSex4vSz7NgUy9d5ZIGptZfLXI5pVA6mMAyS3a4Zz
 Go8KNfVa4D2u27BSeFy0iv9l/qHn1zs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-uxCSTFnXMb6_cP7IAGwVcw-1; Fri, 29 Aug 2025 16:06:40 -0400
X-MC-Unique: uxCSTFnXMb6_cP7IAGwVcw-1
X-Mimecast-MFC-AGG-ID: uxCSTFnXMb6_cP7IAGwVcw_1756497999
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-246f49067bdso25035625ad.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497999; x=1757102799;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gj+j75kbzZRr8WyC+CT6yCwQ+uVU6b0xjRbHU07xHqI=;
 b=un+x2CYr+8hAO/NM4EHSDDyly+buyGurtbHMH7hg3mZIgHNk/8A/NtDl5gW/GWcAk7
 p+kY6p77WjrUPVQF88IS2hwmZuOFRah/O1Q0g55+fhUoUz4vj8l1A9i9IZCy0eJ9S9+3
 NeQPpDGvQS4pML2L9S1pa1sHQKKaB/djggSnCuDk9Q2hsJDzCNSTqFmCgfErhW+CHeLq
 zlnpK2y/TeO3DrVzidTIPRlz4qbhQ8Adm/p4AEghFuaadDKndiwJ4WUrS75cy4o7eiXW
 8OwMOXmQJAaVvHi/YONgd4cINznbenbxC92g54C2etAcr3HpHqgSoyNE/OzWovew6NjL
 D/8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+3wGTGZAINf4+ui/zLSo/KIqL1kDu+ND4Gfirnt5e8Edms8OA6jkZ41wqwQ1GWQ4a+1GShJBCrg==@nongnu.org
X-Gm-Message-State: AOJu0Ywg+bVjGiXXa3qsfp0HhCux1OGpnazku0RJIBsG2t+JhEdA2JJY
 1bvMTPgRh0g+aD5eVC0zhFrZiy9pp++45FK3vbE35xluE8emrcBV83vyn4wd9/GBgDQq2pYmopq
 5us8Ae6JT6XeeGUtWTsz/zkIhIleL1U/4va9EgvRM/pr9gWjP9l3FSw==
X-Gm-Gg: ASbGnctY/t5NBeSOmDrBIeyHt26WgCzjcY5d4fZqcOOPe0MYjYZL4HOpRyuxJzDf4ha
 rGemNyZkFnLt/hexf+911HUnJW0P2yeEZX8vISSSo9tMylYxhp1VRZ8/F/qt1LxFuVWXyATY416
 bAS6n8naEDt0xr16iIlHTQYb9JfaFegGu/0wlTBPEH8y9OOuA5pFPqkJPbdqMzNbjBWytN5yqq0
 yxsw44wNp9EcLBcQokF9nN7e5WmtzRMi0/MJN7Ffz5zGpSzsvyk/99tjEX872HwD4pZfQNjfvci
 B4CQg5Q7tljlVjU8CkuqaZJwf6BRsr2EW3BbXQ3lFDS2RgNHj6+gEQ==
X-Received: by 2002:a17:903:3d0c:b0:248:f55d:447a with SMTP id
 d9443c01a7336-248f55d44bfmr95115545ad.3.1756497999121; 
 Fri, 29 Aug 2025 13:06:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh2ZU31P8nEog5eR2YeSUb8M/iP6niwjTYkDYZ34N0QwuJtfh5AbNkf3nThrtGd+RIbPvDmg==
X-Received: by 2002:a17:903:3d0c:b0:248:f55d:447a with SMTP id
 d9443c01a7336-248f55d44bfmr95114845ad.3.1756497998606; 
 Fri, 29 Aug 2025 13:06:38 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:06:38 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:58 +0530
Subject: [PATCH v13 18/27] migration: push Error **errp into
 loadvm_postcopy_ram_handle_discard()
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-18-a4e777b7eb2c@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4329; i=armenon@redhat.com;
 h=from:subject:message-id; bh=r7TvIL4ZIDOkRB8HrM5BHB1nfGTyTk+rEFu7cLDvTA4=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdl+9pRd7Gu5xCzmzPdI7v0bo7/rmp5K5R158/cmU5
 ZHF+PZxRykLgxgXg6yYIkvD1wDZpoDCiEjbl9dh5rAygQxh4OIUgIns6mL4zSpqyTJjX8CqLtG4
 HuW1dY1FVsJLtrryt0efDFi99fbNBQz/Y/pmt2qKpnG8WMTCZahTc7QzW+32jDv1GrfkpuZfFvn
 BCQA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e5hgGidZevUosuNp8oTH9n221gtjKNPha3B-r12jodA_1756497999
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
It is ensured that loadvm_postcopy_ram_handle_discard() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 3ab20bd3de980ecfd79ab29697e3e1527ab3e73c..01cc186b9e0324053e804c4fedebee02d8df4052 100644
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
@@ -2629,11 +2633,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
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
2.51.0


