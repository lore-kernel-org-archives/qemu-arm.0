Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DBFCAC59A
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:27:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGUp-0003ac-CS; Thu, 18 Sep 2025 11:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGUn-0003Ya-Fy
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGUk-0002cy-Fz
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFESQmOnhzZW2+hXaXl8rxhwnVtiVIyzJTwYSrM4JVM=;
 b=Ec8HSLbQvvy75pba6T146BVd3HJLDvmC37zjc6IHuOJbpsP66hPMOnEhmC6nT7f6MAUiMu
 mZJIdEPWpw0dvlTjNxw+3h5q271+Fgrx4Tbcgjm+8Yb7m7qhWV5TjuhylkcC450Cnv8hf6
 ZG3Pk4UQBt1eF9dRo3c2lho+jybrW6o=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-ArSbvG1FNoi5dxc_6A0NOA-1; Thu, 18 Sep 2025 11:24:22 -0400
X-MC-Unique: ArSbvG1FNoi5dxc_6A0NOA-1
X-Mimecast-MFC-AGG-ID: ArSbvG1FNoi5dxc_6A0NOA_1758209061
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77422201fd8so1228937b3a.1
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209061; x=1758813861;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFESQmOnhzZW2+hXaXl8rxhwnVtiVIyzJTwYSrM4JVM=;
 b=OXUG8AZoUsKuv/RODksx5qxoeV65Ae5weHQPyNZOEv4qw7MFweZsqN9UbRrxqhUnu6
 gJI85f1RkbwkniMfZ4miA6L8TaHxI6hBHJLU7yyU2O5vj6O5T6sJIYx//T0k6b7Xih+T
 2iEdlFhfGvxdyGos4PJ8Jpp1XcQpK/+CyKyahFQcgD9S5t3kp3zUKbpR/VDHyCR0qha/
 q2VP0MK8ejOY9bhf4FUAdtQjfab2GyzvtRScj4Hrfgf1nopIG20zu2iSgl+6z4dx34kv
 NZv5TAtJprkZN5cPyt+54Et9OxUFeWBC3VYbvP2+D9lDuytbHaGlsWOx5laQcKurg4fn
 D1sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYrtWxCyJNG8Rq4VopgtfiwM0xLybGIM3d5JwOX1U0fYAm0St9k1QIb91nseWywV/SjOXIkUgIag==@nongnu.org
X-Gm-Message-State: AOJu0Yzn2ddjIlunpn8JUvTextuRt7VsVOEDZsNu6LovKiVYtfKsxhXY
 PadzQPfl+a92R34DDadbWZF4mjMN9A09c1RWQNpluWDJKOYpOyuwNvsW2CLPFrmUnrOEWye34eZ
 zW/WrTBGX+Rn6ZFa4ZrPBIaeY8tukePmXBYqCFxGDTzCqnbRPoLkZgA==
X-Gm-Gg: ASbGncsYTB60N/CtZNnKSAuYuubY0Pd+BUhtTzXxvq5JlDYLjmVvaVN217QWc8ZtaaL
 6gWsI1lFGuOfpA4LGJwEg3gUkqTPWhApUhjL6HvwSAQy1BbWNQioXVsLP94TtM+P6H4rKoHaOwK
 TMxE9UtWQpvw8ZxmLsn8llgQhOX2eVOk/VGn1FheUUqh1dfWEVK8y9xvFKPWzPr3mo/IqZhWdZl
 gCKkug+W71Saqva6gcHumLjrc4bhF/k6x76ntkz0S1YjWxSmpd1fokCRMKa/03FLKPfJRtI/gfw
 AoRO19NTF4OsB9raEt/H6yJcvOT6l5KFda6wjYxgHKPaV4GXd1dfnQ==
X-Received: by 2002:a05:6a20:914a:b0:252:2bfe:b65a with SMTP id
 adf61e73a8af0-27a91197b56mr8094339637.7.1758209060930; 
 Thu, 18 Sep 2025 08:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGolnpvDNp6OiuqBqa/oKTvoWxO1Stfdk0DbqSDPcJZmrdDAwmEQLXP1c6dzN2ZUlCbhn9blQ==
X-Received: by 2002:a05:6a20:914a:b0:252:2bfe:b65a with SMTP id
 adf61e73a8af0-27a91197b56mr8094280637.7.1758209060495; 
 Thu, 18 Sep 2025 08:24:20 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:24:20 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:21 +0530
Subject: [PATCH v14 04/27] migration: push Error **errp into vmstate_load()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-4-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3264; i=armenon@redhat.com;
 h=from:subject:message-id; bh=XNWOL0PRpe00C/2zRFfhJytxVRezN65+i4XThQwPhbg=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5e/P1vrw+z4W1bsW5u7L+3OL1KvzrtySJxbtfvfUL
 egcT59KRykLgxgXg6yYIkvD1wDZpoDCiEjbl9dh5rAygQxh4OIUgInYcjIy/MiP+vqwwPDnRN3J
 pa8rzp2Os73WxqYr//LXjQ2Ht740u8nwP+vnj1WWnhss90mGMsRGebvVn3y985UJ70Kx5/qRX8s
 YeQE=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 86hj4ngOgoYE9QgQGFhtV-HHtynMq_6IJEJsSzV-84I_1758209061
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
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
It is ensured that vmstate_load() must report an error
in errp, in case of failure.

The errors are temporarily reported using error_report_err().
This is removed in the subsequent patches in this series
when we are actually able to propagate the error to the calling
function.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0c445a957fc99f826e6753ed3795bcdd51f1e3f5..40dae406db22dc9ddbff2f5ada92a32626b58e3b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -963,14 +963,20 @@ void vmstate_unregister(VMStateIf *obj, const VMStateDescription *vmsd,
     }
 }
 
-static int vmstate_load(QEMUFile *f, SaveStateEntry *se)
+static int vmstate_load(QEMUFile *f, SaveStateEntry *se, Error **errp)
 {
+    int ret;
     trace_vmstate_load(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
     if (!se->vmsd) {         /* Old style */
-        return se->ops->load_state(f, se->opaque, se->load_version_id);
+        ret = se->ops->load_state(f, se->opaque, se->load_version_id);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load vmstate version_id: %d, ret: %d",
+                       se->load_version_id, ret);
+        }
+        return ret;
     }
     return vmstate_load_state(f, se->vmsd, se->opaque, se->load_version_id,
-                              &error_fatal);
+                              errp);
 }
 
 static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
@@ -2692,6 +2698,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
     SaveStateEntry *se;
     char idstr[256];
     int ret;
+    Error *local_err = NULL;
 
     /* Read section start */
     section_id = qemu_get_be32(f);
@@ -2741,10 +2748,11 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se);
+    ret = vmstate_load(f, se, &local_err);
     if (ret < 0) {
         error_report("error while loading state for instance 0x%"PRIx32" of"
                      " device '%s'", instance_id, idstr);
+        error_report_err(local_err);
         return ret;
     }
 
@@ -2769,6 +2777,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     uint32_t section_id;
     SaveStateEntry *se;
     int ret;
+    Error *local_err = NULL;
 
     section_id = qemu_get_be32(f);
 
@@ -2794,10 +2803,9 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se);
+    ret = vmstate_load(f, se, &local_err);
     if (ret < 0) {
-        error_report("error while loading state section id %d(%s)",
-                     section_id, se->idstr);
+        error_report_err(local_err);
         return ret;
     }
 

-- 
2.51.0


