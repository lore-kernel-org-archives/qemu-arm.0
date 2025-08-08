Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09003C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:15:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuQ-0001DB-6u; Fri, 08 Aug 2025 09:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHKS-0006Jg-Mt
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHKL-0007EY-UN
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsisoMUYyRrNcEb/+SWb07kdSRIAJIbvwaNSO04Xm/Q=;
 b=bkhH9ZIzIAHUzDOV/BhyFpeoIL4KNoy74VWLPuTM7oyAgkKGM9xldvVLbrz1qd9XinHpzs
 8Lo1LSTN1OGIo5tqVrNxYS4SRxW6UKrRp6xTSWdMDrOOYlCXWVmJrGsyICD+cMY+jTb9z/
 s7srFgwu8BPaPOSxgAwymJfMxMKMnjM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-qADBb-S4OyGjGV2_yf-o8w-1; Fri, 08 Aug 2025 03:15:36 -0400
X-MC-Unique: qADBb-S4OyGjGV2_yf-o8w-1
X-Mimecast-MFC-AGG-ID: qADBb-S4OyGjGV2_yf-o8w_1754637335
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2400cbd4241so28796495ad.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637335; x=1755242135;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rsisoMUYyRrNcEb/+SWb07kdSRIAJIbvwaNSO04Xm/Q=;
 b=Itd8RpNWaapjeVAy0CtLRKY3xDLR1JjcauxAAvxi4yoqZrwwFPsYYzVuDtfsYSOdZe
 tYHvx9ldvqhWYKN2Ppn9kI+m9h4QVOZJR1iz6zVc6qR2EvHYL/PP4dpc3WAX27ovcHcz
 hbOVKzp3ZbZhIf/MNkLVGAaPL268ZR2p/1K8/C8oAKAjRygFRlsplWPR9watPQj6wKJ3
 PisogBu/nIPm9/MgOmvi+uGL+IyZvq/ZAaTIxjH1KpLhYgJ7nEg1vmAxVeHa2zw8XGF6
 bQx1qegDadmvKVd2WkTYhuQ72KOe4vDb8zarcpigO1RjKM9AQvxlZ7A6OIpAOW8mY/a9
 bvMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAORd9HOOUaNDgdgM4nHKtIJPrh7nMRLAlfiVCD9J7cb/fwQ//6/+wmCtwylWraoxvVj6bWj+nzQ==@nongnu.org
X-Gm-Message-State: AOJu0YwRmO3/FxjfpLtJYiPetxHuPXjlT4uUEt6dlL8huOyVKdnVJ+cT
 OqA2s7azh9RUzkgr2vtdLaiFKUAgx0Pw79l9FWb+1yN/F4C0WCMgnUYaQz9fF1Pg1jThJMDgLZj
 uTSDUrX6YrQZgwmA2rVymvMSLvnNMZDMb/89KqP7xhivbBHZSBuPydQ==
X-Gm-Gg: ASbGncs4dl3ThFnAAWoarp3QcEgQ7GNoT+jRwBkyODZlRr0YmIEjwa94CLJ1w/QIUsE
 yGpn2te+Vamra02Tn8RzzXb8g1743fx9Qo+NtSqRpMwjwmiqz9yGaqWk7Sl/k0CAQeMp9phIlQX
 9cuXIrzqsK+DsLtTH0i29mpEOJwyMsYSINdfSB6g0zWHGf1mARO+SImmdowM7q5UAjfAWW6DLNR
 f1Egtc0ig5EM8QjUdyCmsWzEDNw6QLHN5l0ztKQ75KAK1OIqWZXB5LAu7rbBANKEV9aflLG2lvq
 8bxCcp+Ak4bhAax79SyMa9S9sUpVxOL4+vSpjec7yuk8K94ZRfWgHQ==
X-Received: by 2002:a17:902:ebc6:b0:238:120:134a with SMTP id
 d9443c01a7336-242c201056amr35014955ad.22.1754637333381; 
 Fri, 08 Aug 2025 00:15:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnhPr0wQ9L7Rgy46F24TtNuJD+/sys9TTZH+4SFdLmD03pU+jOnP5P7MHFs3/CH0ZsT45Faw==
X-Received: by 2002:a17:902:ebc6:b0:238:120:134a with SMTP id
 d9443c01a7336-242c201056amr35014215ad.22.1754637332951; 
 Fri, 08 Aug 2025 00:15:32 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:15:32 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:32 +0530
Subject: [PATCH v10 06/27] migration: push Error **errp into
 loadvm_handle_cmd_packaged()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-6-3e81a1d419b2@redhat.com>
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
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723; i=armenon@redhat.com;
 h=from:subject:message-id; bh=3mB2h+cFVTVgcyAHN6Q4MYhvAR65KG4PCQXNdhHx3jA=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxVfkvgvWidgc2pXgrC2yvunBr7fzT1duibzl+VLhw
 8Wms00XOkpZGMS4GGTFFFkavgbINgUURkTavrwOM4eVCWQIAxenAExETpnhf/40KbOJXspSNy2L
 7q9QDhJgXb8t13Xe04kfiviSal26PRj+8B+T2mwdtCjnb7jklpknyx8c0k7e8u3j0ROhb5S1Vr2
 oYgMA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dpG5ZFhULsaNP3KKzjlPM1NqZQZQja1OFrq9JEfwfNI_1754637335
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
It is ensured that loadvm_handle_cmd_packaged() must report an error
in errp, in case of failure.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index ef0bc9e989d9de3aee066b16401ae0cf9f3ecbcf..adc4ca16ebc8deb4efe49ac2088cc20aaf795056 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2405,7 +2405,7 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
  * Returns: Negative values on error
  *
  */
-static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
+static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis, Error **errp)
 {
     int ret;
     size_t length;
@@ -2415,7 +2415,7 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
     trace_loadvm_handle_cmd_packaged(length);
 
     if (length > MAX_VM_CMD_PACKAGED_SIZE) {
-        error_report("Unreasonably large packaged state: %zu", length);
+        error_setg(errp, "Unreasonably large packaged state: %zu", length);
         return -1;
     }
 
@@ -2426,8 +2426,8 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
                           length);
     if (ret != length) {
         object_unref(OBJECT(bioc));
-        error_report("CMD_PACKAGED: Buffer receive fail ret=%d length=%zu",
-                     ret, length);
+        error_setg(errp, "CMD_PACKAGED: Buffer receive fail ret=%d length=%zu",
+                   ret, length);
         return (ret < 0) ? ret : -EAGAIN;
     }
     bioc->usage += length;
@@ -2457,6 +2457,9 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
     } while (1);
 
     ret = qemu_loadvm_state_main(packf, mis);
+    if (ret < 0) {
+        error_setg(errp, "VM state load failed: %d", ret);
+    }
     trace_loadvm_handle_cmd_packaged_main(ret);
     qemu_fclose(packf);
     object_unref(OBJECT(bioc));
@@ -2618,11 +2621,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         break;
 
     case MIG_CMD_PACKAGED:
-        ret = loadvm_handle_cmd_packaged(mis);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_handle_cmd_packaged(mis, errp);
 
     case MIG_CMD_POSTCOPY_ADVISE:
         ret = loadvm_postcopy_handle_advise(mis, len);

-- 
2.50.1


