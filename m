Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65913CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 15:47:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNf9-0005qe-Cd; Sat, 30 Aug 2025 11:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Mi-0006Cy-Lh
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Mg-00057u-U8
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756497986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EK8ZniS31eKfAuecJyHjMuA5swX2F7mkJn3tAORFulo=;
 b=GXClXWebli5hyVEsHLe3hdaUEmmSJhbVhGLLPLdnGo5EH1a9SoE1zvQvb5yhreL5fxaKZa
 8VLYUe/zO4AfnIEdVf9qXslvFyZEIPcqMdpUVLMO758vTg79StObVHVUtU9IQYEma6ol6R
 bLGqXzie2abrTgygcmU6rUAVfSziA8Q=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-gPJu2F10N6mOgglrvldipg-1; Fri, 29 Aug 2025 16:06:24 -0400
X-MC-Unique: gPJu2F10N6mOgglrvldipg-1
X-Mimecast-MFC-AGG-ID: gPJu2F10N6mOgglrvldipg_1756497984
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2445803f0cfso32572325ad.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497984; x=1757102784;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EK8ZniS31eKfAuecJyHjMuA5swX2F7mkJn3tAORFulo=;
 b=uu4VaYZNnMzBLzp8/nbM+7qnpuO7yFAZQT+s8MkCtf0NEmu2PobeAKxWdVptrxWjCx
 4zMX5bEKewqR/a+NWyVhljWRd5Q/ty0uSs6yFMpQRN/0vayHNknMoED05tLz82+E7uOk
 +PStn433rSDZJ4NEvpfhMKA0Q6UpsFGUuvalWAKNQm8YU91zJypTy2TNUwjM59kVIO1R
 L0/dWW63s1V62xuvotrTkwGN8fXkM/qRB7mGGVK+MPr3fBchEyusyJHYcw8u+IB8wcR/
 wgnOI8B2SDm8vR1ViXCd/cTPwQYd/6tsw6XwAT0JUoVxP/2vV6dHkb/DkJ4/HozZ45S9
 rB3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOE62VueGVCVcbHVZk/EBknkmyLxOwn/Ohtu/bnETaS447zGEacwLPxFLas4qoZwFfKiYGtiq7+g==@nongnu.org
X-Gm-Message-State: AOJu0YwVQx+6rj5mI2fmh7MbWD8Kzomcy5QrNYzgyRk0yzpT6KCq6H2q
 3ABfED21EZwBt/B0OY6LoRUx/y0Zjkz9mh/ES/nw8fgPj0YYrnLNUl2/jJv2k0cVBw4r7hn1CSC
 ABZUFE8k2oR+5IMBSHciysaav89N4lwiyDJHnKp47UETiFQ2iCWlXVg==
X-Gm-Gg: ASbGncumhk6EvxC6celACQema9Owj108RNmWci7woxHIXRrJdJn/38Cwr5ndWjBmCFq
 D2A5Yu+kILBeJQZ6dBwihDrs5RWYZjZnQTKY+lfsU1igrKdOBf873HxXRYFXM3XNG5xD7iqYIac
 C1lLw7nn4SKI3v0sl9zDLgv9y2sNUndLxUNNcj25F0rtyBbuL9BMaP0atPzfjUBq6vPMa4Eb/YQ
 cctIui9uJ5/hU7kls4W708qTTZLVKYxpjdLuPmeDGYvBQaCvE0wiK4wsWEGhP6Vc17e7rfDEKnz
 PVhx1KHawG/ALGE3o/jdf7ol0WLiLwedz2Ao9UZdVm7UOndUUdF2gA==
X-Received: by 2002:a17:902:e54f:b0:246:a532:3343 with SMTP id
 d9443c01a7336-246a5323a3cmr315115635ad.10.1756497983756; 
 Fri, 29 Aug 2025 13:06:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaksZqggjQ8NuqRcRP2WUGJ0hf1LDRm0cmz7dgENVz/im4xsVjGHviXLKSxNPegdTOKSJ8Wg==
X-Received: by 2002:a17:902:e54f:b0:246:a532:3343 with SMTP id
 d9443c01a7336-246a5323a3cmr315115155ad.10.1756497983318; 
 Fri, 29 Aug 2025 13:06:23 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:06:23 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:57 +0530
Subject: [PATCH v13 17/27] migration: push Error **errp into
 loadvm_postcopy_handle_run()
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-17-a4e777b7eb2c@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888; i=armenon@redhat.com;
 h=from:subject:message-id; bh=Bc7pNWeaQQJR7xn/IMqCNxln9K0U+dn3FXOfz+z8MlM=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdt/GP3zhWkejXE12KHN/+leSIp+5xzVJ8+iFtTJ7m
 N4XK8zpKGVhEONikBVTZGn4GiDbFFAYEWn78jrMHFYmkCEMXJwCMBFHTob/Xjt4xSzzNwvsFtrx
 XK6QbbaTWdwlPf6Us4+vfLPS9/14hZFhxk57zj+3Q940P992LTsjZ/KJEwcPyNw58OaOlWbjpCv
 7mAA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mf53IkuzJm2BEg9Tkt6N9aMwgZ-dyJ0KkiyrOuZk2d0_1756497984
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
It is ensured that loadvm_postcopy_handle_run() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index c681d6d21af356a97645f2a0d36e7440e3bd95c6..3ab20bd3de980ecfd79ab29697e3e1527ab3e73c 100644
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


