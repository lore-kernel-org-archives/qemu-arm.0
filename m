Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881E5CAC5BE
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:21:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Rr4-0004d0-Pt; Tue, 30 Sep 2025 00:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rqw-0004TE-OG
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rqm-0002lK-6b
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14VHipwcm8yELLNadiH6eM3jZMQkmlt3jk09y6vePWQ=;
 b=P9vPpZHBpz4/CoNFiWL4SiZYc7+JK17vntyTVpmLZIf1h7FslB5uL5AEVDMZ/PIXkw524A
 lrQay3/UMuQMLgYTvse2c9RyIv9Tzy+1gJymj0HpKKktGkIDMlxffCG9O2YHK2MoMKVZ2m
 2gqTSxw4wNc4RtfQmpkeSPhQEr86vRQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-FT_V9yjrNH63s59kK0HPrQ-1; Tue, 30 Sep 2025 00:20:23 -0400
X-MC-Unique: FT_V9yjrNH63s59kK0HPrQ-1
X-Mimecast-MFC-AGG-ID: FT_V9yjrNH63s59kK0HPrQ_1759206022
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-268141f759aso51895705ad.2
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206022; x=1759810822;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14VHipwcm8yELLNadiH6eM3jZMQkmlt3jk09y6vePWQ=;
 b=OZ/ug1aV5B9sHgPQhHJoJF+e9YJnRDnDYfj8p+C4VcveHfEH422iJCOcUYuAQJHRO8
 pARy8rkSWYN0LxHSyeO+mNpXKadBhWywLkO64XqjAKcqMUJMG8wAbmGN/lrT6H45pUTX
 zM5RfMOjNVnfTZozRRlNiwh2KHdh/kig0MtibGAV4os/Kel/c5e4u2yV9GHr511WAN14
 WSGWk5ozNecd64VleT8KSVSNSwYSuAqHPZjOLg3wjpwZA8bYubjkqng+yuXiCS/0dHsb
 kQ1uvLKyuwKtZSAJLqYIEiPfZSZcC8UfiDFf4xf1sCIlLSrmpOptH4nue6PzpVv1Edig
 9kmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2/A0EMmgvyYBwKxqyqM8DfEZ+j4pRiazp82JkpqA2Qz3xoDQwBNxTCG0E0hQYuHYYkiQdoyLPXw==@nongnu.org
X-Gm-Message-State: AOJu0YzyTU9osQDSILvMFLByHSJNHT894kq2zhrW8FHft5aE+JLIl7Hz
 Te5aewrDu2sXUeAUHi/FKuGkIOaGp+mTBvb6HthRPLj10btyxvdvg5I6GXMIB57JDV0rrzwq2oh
 Q3iecb/9r/gjfTjY3aPPPjx0X/jgWjruRS5ScN+eWIIABKZ3fhCIAUw==
X-Gm-Gg: ASbGncu4yLUs66n+2asKUvRn5vlAOjinfx1dNz0+RMgLPey/ZE3Q4naIcybvgREiE3G
 Y/T89zXzRvxSuGPxXs05bKmReAi6lBBe5kDlhRZfLW56FSrnINeM09N0RfwGei1z8GWKHSzAqW4
 thXBQJ7il9/3bSeKWt7/Y9aMV529iIMxefWQE2OXrB31MHoKzyrOezGVT5vfqlqUoMEryTHh3Mc
 LeM7BkXHhnS6wcm8/Qgcxu4OG/mN+9msQtKT9KRbzH/NbOhUAXgBeSJ4U0agDQx0ncoounf+qXp
 GnicGJDw4T8HocS/cTQZVi8/3jvErJSQoTmcUqvhfa5lfP2J1MnKfXrqdg==
X-Received: by 2002:a17:902:f78a:b0:286:456f:8c8a with SMTP id
 d9443c01a7336-286456f8e5emr78764085ad.50.1759206022034; 
 Mon, 29 Sep 2025 21:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYCsDxHtX8mWuQnaMw7+Qz69pr0xfkio2NDsObnx2861LVsFF/MYSSfcTM8M7kVeL+g/GKBQ==
X-Received: by 2002:a17:902:f78a:b0:286:456f:8c8a with SMTP id
 d9443c01a7336-286456f8e5emr78763715ad.50.1759206021602; 
 Mon, 29 Sep 2025 21:20:21 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:20:21 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:20 +0530
Subject: [PATCH v15 11/26] migration: push Error **errp into
 qemu_loadvm_section_part_end()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-11-84afd3af1e47@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3197; i=armenon@redhat.com;
 h=from:subject:message-id; bh=1IkIzHbrEWLFZ5EcmFCbm0rd9Sz9Qy2MDvDIIloh0BY=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKMGbzysuy/xT6Jivtoj1Xc7NEO7WyL08UdwbhA23c
 lzL+c7VUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCLT3jEyXGiQZn/33OhkSdSR
 udxrt73mk2L512n1wSl095p1fQ9qPjD800vyW3vy+InvQRyKsTN+3um+y2Dslji50X1CJPOBJ0H
 2LAA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XhQk3FEryXUyW1DQtTr8A25AiNHwACZMo3eaJGTIXWY_1759206022
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
It is ensured that qemu_loadvm_section_part_end() must report an error
in errp, in case of failure.
This patch also removes the setting of errp when errp is NULL in the
out section as it is no longer required in the series.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 83d8fb8f4144fd54fa7970eadc81444d38437659..c1ae36b50a5d602360a47e3818e82954f8694369 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2803,21 +2803,19 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type, Error **errp)
 }
 
 static int
-qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
+qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type, Error **errp)
 {
     bool trace_downtime = (type == QEMU_VM_SECTION_END);
     int64_t start_ts, end_ts;
     uint32_t section_id;
     SaveStateEntry *se;
     int ret;
-    Error *local_err = NULL;
 
     section_id = qemu_get_be32(f);
 
     ret = qemu_file_get_error(f);
     if (ret) {
-        error_report("%s: Failed to read section ID: %d",
-                     __func__, ret);
+        error_setg(errp, "Failed to read section ID: %d", ret);
         return ret;
     }
 
@@ -2828,7 +2826,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         }
     }
     if (se == NULL) {
-        error_report("Unknown savevm section %d", section_id);
+        error_setg(errp, "Unknown section %d", section_id);
         return -EINVAL;
     }
 
@@ -2836,9 +2834,8 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se, &local_err);
+    ret = vmstate_load(f, se, errp);
     if (ret < 0) {
-        error_report_err(local_err);
         return ret;
     }
 
@@ -2849,6 +2846,8 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     }
 
     if (!check_section_footer(f, se)) {
+        error_setg(errp, "Section footer error, section_id: %d",
+                   section_id);
         return -EINVAL;
     }
 
@@ -3108,7 +3107,7 @@ retry:
             break;
         case QEMU_VM_SECTION_PART:
         case QEMU_VM_SECTION_END:
-            ret = qemu_loadvm_section_part_end(f, section_type);
+            ret = qemu_loadvm_section_part_end(f, section_type, errp);
             if (ret < 0) {
                 goto out;
             }
@@ -3132,9 +3131,6 @@ retry:
 
 out:
     if (ret < 0) {
-        if (*errp == NULL) {
-            error_setg(errp, "Loading VM state failed: %d", ret);
-        }
         qemu_file_set_error(f, ret);
 
         /* Cancel bitmaps incoming regardless of recovery */

-- 
2.51.0


