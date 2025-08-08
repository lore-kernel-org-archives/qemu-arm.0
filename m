Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED68C87FD3
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:15:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuQ-0001DK-Oj; Fri, 08 Aug 2025 09:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHKB-0006DE-VG
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHK5-0007D4-Uj
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01tgWRjsp4Nmp978hJEf36J87Ju4L/qLp1nYjZWtjHU=;
 b=YY/nilkUmAC7mBOObf4Jr+VJgk1WqqDW1lWV4Bt7h1VZAn1F+W+4rH4bXAPaGWqi55sIYz
 UDcqFhjxzlJILCxa5LTMVXuxoZFn+bbl1j1mtJEYxoi6pue6XEsgJhktSUtCFL24aJ7Kzd
 YdOwnkjqKSgZD/IrrZnLhwQ3QBiyqbc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-EKXmNTijOJazkW7kaCqPgQ-1; Fri, 08 Aug 2025 03:15:25 -0400
X-MC-Unique: EKXmNTijOJazkW7kaCqPgQ-1
X-Mimecast-MFC-AGG-ID: EKXmNTijOJazkW7kaCqPgQ_1754637325
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2424aaa9840so19904125ad.1
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637325; x=1755242125;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01tgWRjsp4Nmp978hJEf36J87Ju4L/qLp1nYjZWtjHU=;
 b=NXmUCGEUJmTtGFaB2N7XK+J4mExnsZe99wdWSWVlt/GZ/m4aeBdGzQcF07jajTxv5M
 rpmpI/5EPsfvXgZ+rKIy3zisWeDQM0UbjdnuxvNT748VpM/Z1U/qh8a0rOHjXkoaG86w
 UTE2s1fSSmRenDX3+CINtFUDmPzUN77EQlYactrL7/qEd9DpBVqM5vN1Obqbr4+CFziq
 ZecQ7IN/1+XCV0yFXZ7AyT9qVtpBlZSFgZXqLv8jbqeojCV1w7pgxAKB0cVF5GYCF28x
 Vkd4kaqaRdEmtf6caEt+RMCg5wAtCwyjIsXqP1WwV3tJiPGoL8Q5R1rujolSUTQPA34B
 j7pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoiZmx0bKtdjexvXzpUWBJGEZOBMWrJ8dUQZ6gFnlElqcXlgwwALagQHU6mPVyp+KsuS9DuT3BBQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx+s5Cnrgpjr5CuXMildxxzntFL5B7BASR/t33vHhmqWYK8a6Re
 RXdRgOnW5Zbx5DcnWH836X+C89XGk+gwZEcmZsPdlkq53wVS829zMunRNokNYlGen+VE0UgWA9L
 CY68+9gzRrvemODFfZ7w2hVGS8mE+tmtPWC04IabzJQ3UE/1ZAdW45w==
X-Gm-Gg: ASbGnct9li0SzCF4E0vUr9qmmiBNZBx2kA7WaJMtn6J/CRsQoPbV/XgPRHvC6fsX3Gh
 b1BtVWW5zAXyHDTapHkGwUrT8HinOnAutIglWsXGOsvt17FxdKBZTmgN1mpkz5eVEWMixLYhYr+
 JfxDcjwWzDTAoFv0RodT75IgN2mY3G9+wUBhmCysO99MmRNKROEa9AK6Yb/Cpwb7uP7r+/BvP0W
 ZkGs3dcYUNBxQcQ0TZgMhAjmlS1JbI2ETwsUG83HMHmwWboAXQ2l/0y+bmGGd8VXM5ecu95UDXK
 fYL3A0OcZz6e04pkT0L/BqD4nzFW0MntiGqpHd9qZRy9rAMfH7LHHw==
X-Received: by 2002:a17:902:f64a:b0:240:3f39:2c73 with SMTP id
 d9443c01a7336-242c19ac4f0mr27596125ad.0.1754637324585; 
 Fri, 08 Aug 2025 00:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESWoKTvJ1rCfkD//4MJ+pa0WEgaV4NL0162vL0R0cyCgGTDo/EUAGcUfgRLYDyREZf6z0doQ==
X-Received: by 2002:a17:902:f64a:b0:240:3f39:2c73 with SMTP id
 d9443c01a7336-242c19ac4f0mr27595715ad.0.1754637324193; 
 Fri, 08 Aug 2025 00:15:24 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:15:23 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:31 +0530
Subject: [PATCH v10 05/27] migration: push Error **errp into
 loadvm_process_command()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-5-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6217; i=armenon@redhat.com;
 h=from:subject:message-id; bh=6GpLRCgLM9xCK0aD7MRFnBnb/kEapNprwCbc+wBmSTw=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxVeWP572N8d53wSfxOk37H5wqj3q4OK5G7I5eMGuw
 zKvpjv6dZSyMIhxMciKKbI0fA2QbQoojIi0fXkdZg4rE8gQBi5OAZjIdUeGv6J5fGJ+PmzlBx/1
 XokxX9si013mnWZoYCmm7Wj1gb/Tn5FhPnPrrfAfLy/9iXirPOm352bOP+1LhFkY2qaV/Nl3xMa
 QFQA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HtwDgKcVhUXISFHk9bLA5T21xNqKxZw0t-wpYBwh0-I_1754637325
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
It is ensured that loadvm_process_command() must report an error
in errp, in case of failure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 78 +++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 5806c1822c5712fa7c22185e02050f3b16503757..ef0bc9e989d9de3aee066b16401ae0cf9f3ecbcf 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2546,32 +2546,35 @@ static int loadvm_postcopy_handle_switchover_start(void)
  * LOADVM_QUIT All good, but exit the loop
  * <0          Error
  */
-static int loadvm_process_command(QEMUFile *f)
+static int loadvm_process_command(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     uint16_t cmd;
     uint16_t len;
     uint32_t tmp32;
+    int ret;
 
     cmd = qemu_get_be16(f);
     len = qemu_get_be16(f);
 
     /* Check validity before continue processing of cmds */
-    if (qemu_file_get_error(f)) {
-        return qemu_file_get_error(f);
+    ret = qemu_file_get_error(f);
+    if (ret) {
+        error_setg(errp, "Failed to load VM process command: %d", ret);
+        return ret;
     }
 
     if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
-        error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
+        error_setg(errp, "MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
         return -EINVAL;
     }
 
     trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
 
     if (mig_cmd_args[cmd].len != -1 && mig_cmd_args[cmd].len != len) {
-        error_report("%s received with bad length - expecting %zu, got %d",
-                     mig_cmd_args[cmd].name,
-                     (size_t)mig_cmd_args[cmd].len, len);
+        error_setg(errp, "%s received with bad length - expecting %zu, got %d",
+                   mig_cmd_args[cmd].name,
+                   (size_t)mig_cmd_args[cmd].len, len);
         return -ERANGE;
     }
 
@@ -2594,11 +2597,10 @@ static int loadvm_process_command(QEMUFile *f)
          * been created.
          */
         if (migrate_switchover_ack() && !mis->switchover_ack_pending_num) {
-            int ret = migrate_send_rp_switchover_ack(mis);
+            ret = migrate_send_rp_switchover_ack(mis);
             if (ret) {
-                error_report(
-                    "Could not send switchover ack RP MSG, err %d (%s)", ret,
-                    strerror(-ret));
+                error_setg_errno(errp, -ret,
+                                 "Could not send switchover ack RP MSG");
                 return ret;
             }
         }
@@ -2608,39 +2610,71 @@ static int loadvm_process_command(QEMUFile *f)
         tmp32 = qemu_get_be32(f);
         trace_loadvm_process_command_ping(tmp32);
         if (!mis->to_src_file) {
-            error_report("CMD_PING (0x%x) received with no return path",
-                         tmp32);
+            error_setg(errp, "CMD_PING (0x%x) received with no return path",
+                       tmp32);
             return -1;
         }
         migrate_send_rp_pong(mis, tmp32);
         break;
 
     case MIG_CMD_PACKAGED:
-        return loadvm_handle_cmd_packaged(mis);
+        ret = loadvm_handle_cmd_packaged(mis);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_ADVISE:
-        return loadvm_postcopy_handle_advise(mis, len);
+        ret = loadvm_postcopy_handle_advise(mis, len);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_LISTEN:
-        return loadvm_postcopy_handle_listen(mis);
+        ret = loadvm_postcopy_handle_listen(mis);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_RUN:
-        return loadvm_postcopy_handle_run(mis);
+        ret = loadvm_postcopy_handle_run(mis);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_RAM_DISCARD:
-        return loadvm_postcopy_ram_handle_discard(mis, len);
+        ret = loadvm_postcopy_ram_handle_discard(mis, len);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_RESUME:
         return loadvm_postcopy_handle_resume(mis);
 
     case MIG_CMD_RECV_BITMAP:
-        return loadvm_handle_recv_bitmap(mis, len);
+        ret = loadvm_handle_recv_bitmap(mis, len);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_ENABLE_COLO:
-        return loadvm_process_enable_colo(mis);
+        ret = loadvm_process_enable_colo(mis);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_SWITCHOVER_START:
-        return loadvm_postcopy_handle_switchover_start();
+        ret = loadvm_postcopy_handle_switchover_start();
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
     }
 
     return 0;
@@ -3074,7 +3108,7 @@ retry:
             }
             break;
         case QEMU_VM_COMMAND:
-            ret = loadvm_process_command(f);
+            ret = loadvm_process_command(f, &error_warn);
             trace_qemu_loadvm_state_section_command(ret);
             if ((ret < 0) || (ret == LOADVM_QUIT)) {
                 goto out;

-- 
2.50.1


