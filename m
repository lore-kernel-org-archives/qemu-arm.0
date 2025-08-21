Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F33CA0EF8
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0xH-0005DO-FK; Thu, 21 Aug 2025 04:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0vR-0002gm-SE
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:45:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0vF-00010y-Lp
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755765920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FHj/lICNn3ML/tUvoadsWlJAIkq5LZEwx29bd9ayqA=;
 b=QQboe5VJhi/DpcaLcExug5YkEmpdowEmQz/OmqE7Xy9GVCKRlCCylN0Qekf0sQekWZa6aP
 woI7D61i07qdnvxY1g/JYvzTOj5apQOsdgyqY+DtCyCl5qHTWXf7OIVP4VwlFGzb/RR2aC
 zg24JowMfPKYqwBx6I+SM2lk+r+u8L8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-7FQLH4BwNfq0il2JbAefWQ-1; Thu, 21 Aug 2025 04:45:19 -0400
X-MC-Unique: 7FQLH4BwNfq0il2JbAefWQ-1
X-Mimecast-MFC-AGG-ID: 7FQLH4BwNfq0il2JbAefWQ_1755765918
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244581187c6so11005525ad.1
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755765918; x=1756370718;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7FHj/lICNn3ML/tUvoadsWlJAIkq5LZEwx29bd9ayqA=;
 b=bH9xk6rfOoC0XDCyTDfH1WQvekSBnniC2Ul8UpMNiam6HsuG3muYrIyhADKZqHlYI6
 c5U6/npLk0v2KcuQbQ7o25zLH8aae0k2KsIO4E87BClu/1geEn2eIpjstN6GS+O7G1og
 ItLWsjK0XVsgZi+We/UL25WxkWmn/EJjp/9dCQo3E0UA9zisXe5WIRwpeSAISBsAEtQY
 vrVyQ9RKJmoALvibb2A/Zxz+ExxLcSuP1IfaI7p6s5A8mqzNGp3JzPd5rEzWh0bgtYyq
 uCg541NFjgcHKkpTaP1Qj1WklRQFoWYjYTTFFsz/vewNjMv04I14g1bNNY6YihpTTdKK
 gA6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv7QywxCsrWR8q//E2wtqI2Ho8+ohBqF1dWRdKCNOu5IHMEXOeOH1ovuNReufATVNqScG66StqsQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSKSXACtaHFqYaFzg9qDEsTU19sGwU6jqVv1CtnyDubf0PuIoJ
 zNAH9Fm5Sglis1Y/fX+LvXnQJiKhLq2oR4pGiwnwWQJYekBdTzC8Eq6HnscHMxDy7z12nr8jZor
 DJ3LyOJqQ1BFDjy5iKHI4NK+W2eahUhK3UQurh2sBvBHGyTU4Elcg9g==
X-Gm-Gg: ASbGnctikA87E4AdWD6G6T5RFQeWtm5Ezp11MoiUwjPNHixSYcYFbTn6WADBcCUsiXR
 Zi9u9x4CR8GyatrGBDCoxvnGFqoISP1kwBtywUpWkSY9GzXXBI2Sy4O1beTGj1/ByLO8VkkKn4Q
 r8i+iZ3Ns87x/FapUgL9jBCIKKrGRI14naN8ADtuCJv6aS8yd0G71bKtsR/iFyJtN2l7Q0RnpsW
 ojN/8Q58996RtbYgnZ9HosAJVcLa5HPW3FD02CQYuwp9x5CeIyvRCyPWn1jrcY9JP0PGz9J75wq
 EIQbteMMHcWM07zTI53wxxAL237GvCKHy/0XpiiYQF63i9XTGZ1X
X-Received: by 2002:a17:903:37d0:b0:234:d1f2:da31 with SMTP id
 d9443c01a7336-245febe190fmr27355055ad.2.1755765918427; 
 Thu, 21 Aug 2025 01:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlMzUwOBltdKE0wwBWmO7Kvd6vmVNDQ2rsfSif1WJ9uJO20VZmr2B3kDPNtWBrIeL1+y1+LQ==
X-Received: by 2002:a17:903:37d0:b0:234:d1f2:da31 with SMTP id
 d9443c01a7336-245febe190fmr27352755ad.2.1755765914249; 
 Thu, 21 Aug 2025 01:45:14 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:45:13 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:13:58 +0530
Subject: [PATCH v12 04/27] migration: push Error **errp into vmstate_load()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-4-72b803e707dc@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214; i=armenon@redhat.com;
 h=from:subject:message-id; bh=lexYJKIf4MTAkJUsIsA8XptGUSYcowY9vJmjXRBJ4vg=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayO8mudtrpHlcWPtgeHF/1cuvkazwXGh6sMt5jmajqz
 Pza8kNhRykLgxgXg6yYIkvD1wDZpoDCiEjbl9dh5rAygQxh4OIUgIlIiTMyrLFLNq4T6bvdkh+x
 sdnux+UWp9aCDQsrErmtRXlVrOYeYGQ4k+4tLldop8266M4fi1kTufMOtotbPuaVfBEtoW1S4Mg
 CAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B0PdOxIdrN2kydENjvq3HxfdxTkQHjT8UHkvXQulsvc_1755765918
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
It is ensured that vmstate_load() must report an error
in errp, in case of failure.

The errors are temporarily reported using warn_report_err().
This is removed in the subsequent patches in this series
when we are actually able to propagate the error to the calling
function.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0c445a957fc99f826e6753ed3795bcdd51f1e3f5..e19156a280c00c5aead9ca84e143e6c7a7de7501 100644
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
+        warn_report_err(local_err);
         return ret;
     }
 
@@ -2769,6 +2777,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     uint32_t section_id;
     SaveStateEntry *se;
     int ret;
+    Error *local_err = NULL;
 
     section_id = qemu_get_be32(f);
 
@@ -2794,10 +2803,11 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se);
+    ret = vmstate_load(f, se, &local_err);
     if (ret < 0) {
         error_report("error while loading state section id %d(%s)",
                      section_id, se->idstr);
+        warn_report_err(local_err);
         return ret;
     }
 

-- 
2.50.1


