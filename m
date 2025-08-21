Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2E7CA0EEB
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:54:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0yO-0000Lt-UO; Thu, 21 Aug 2025 04:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0xa-0006F1-1X
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0xS-0001Vc-BT
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755766057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MpTvm5RaxQiDa+wZwc621Kz6WxGcmOvInmt1mQAj3Q=;
 b=OA1w/yepCAQX+qde3/G8/BmXF3liUaxi+dsPlsFXLVsNrGVrE06YAfjkT7me3P/4SKuA9t
 fhmB6HZ0S+Oe0VUU+cAkxkyr5VAcMVpYjyuQK5BBlol3muZxPs0HFYXl6kVZ2QpKdOQG+p
 hvASyk6xLiENF5HqXRUXjKDGk7vKQIs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-W0h1_yxSNMijD1ejfz4FfA-1; Thu, 21 Aug 2025 04:47:36 -0400
X-MC-Unique: W0h1_yxSNMijD1ejfz4FfA-1
X-Mimecast-MFC-AGG-ID: W0h1_yxSNMijD1ejfz4FfA_1755766055
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2445820337cso8882225ad.3
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755766055; x=1756370855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MpTvm5RaxQiDa+wZwc621Kz6WxGcmOvInmt1mQAj3Q=;
 b=puDRvH0v/eFA2lGyKzmhdWeEyKlnCYTynrJBmvDzQKsOhHvqOfl2abqnwxB9QNiGNq
 4iM02ozNTj6i+ZxECyTCeHgsFIWtpeVVv8LnivZg0L1vF1hSgRyah2TmgQixGsS/Lc3P
 QggxC3LLROmy9qHIBYTSlDbRK+tBiz8RY3pGeGANCL8MKJ40ylkakD5qZkF0DxtEOoXg
 j5AwYDgyePu91DUyY8WKV1DPVoi5br4PEv996xvcm0eXs/xFTojeKC0WtzXhKIoLztxz
 IubGWdCJB4yIk4tM5h4EfNYe/eb0LME8tBsEduqd0+XIXvpBBnjIb7ADwRFNrvoKjXTn
 Q06Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0Y1bIjIWJtN9RjKvW3zT30ox9dUSGI07MYfRJTT6VDUarOnKe4QHot4BHdhM7gug7sRFWXtF/yA==@nongnu.org
X-Gm-Message-State: AOJu0YxosrZxXTpD0ZR2UYu6VMIez25Bqyxk52hyo7DPZuFYDegdvwoB
 uWmQb5CjuNZDkmUUORF9WTRZEtzJ62sccG9BVxFhI9BBzR+gmuKn0ftI6fbpX6PIpgjqfpRvXKF
 KiuWXWHCEp72ktsEOiCstCCjOBhR5QOWJEkcg78NnC8TwnG/qCEc0Fw==
X-Gm-Gg: ASbGnctdhTaSi1W3BxSHMgYPRHAR4X7hDqGjbdfQVRdZYd16hWSwHPxJ/Vx4ChRzfoP
 4lKcb6RxNQU7oASF6uIm2ljaWoIdviic+8XUYVKvKmnzwB9/ymtzte0qvRjNTHmsgqLNy664ePp
 1VehqfNOr0toFG7fCjTOzfPJESnyXylYJtYttJiZSKQFVE7x3o+f7GzJDN9dCdM1oVtsneAY22G
 hwGkUGib44WFucApDdSKHzBSiYC+CHrDTAa/TPoDozwmFUlD8txudUPA5DB77E7AHa8+IJhcHJM
 hkHeKh/WpeFqk2s5sc0eK9Pxn+uriS56Vv5qnqxGB9vXs8spPqku
X-Received: by 2002:a17:903:b0e:b0:240:3915:99d8 with SMTP id
 d9443c01a7336-245fedbbe74mr21816395ad.47.1755766055040; 
 Thu, 21 Aug 2025 01:47:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFzLg2q3w9TIYnk14mg+E8Rf4gKj87xJ8vIu2+1v+kppUc/I3qDWR7oWP5K8yq0h9LgDrk3A==
X-Received: by 2002:a17:903:b0e:b0:240:3915:99d8 with SMTP id
 d9443c01a7336-245fedbbe74mr21815895ad.47.1755766054639; 
 Thu, 21 Aug 2025 01:47:34 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:47:34 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:11 +0530
Subject: [PATCH v12 17/27] migration: push Error **errp into
 loadvm_postcopy_handle_run()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-17-72b803e707dc@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888; i=armenon@redhat.com;
 h=from:subject:message-id; bh=ANnJVFbZEDL4HCdNfafMLBvHi/TIEmuU6PMel/6BCzc=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayOyln0vrUG88+Dz+/vPRioNNEA868G5nVYqf1b95we
 3+ByWluRykLgxgXg6yYIkvD1wDZpoDCiEjbl9dh5rAygQxh4OIUgIk8kWD471a2Y2q1UfAiNwOu
 t1aZ5/6458811C5Pk4opEav/v299K8M/hb1cvFu1L84V97qwdPpmH4EJX/f/tmt/4NTY5PzF6+d
 lfgA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s3xtHLTajyWTydBPdAXQGxomRWVjcVXUNS-m7ebhAIg_1755766055
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
index 6408257ef2148bdc4b753500194eaea8384cd120..348ea9d7e57927c57131e8e747b446c232a9cdf3 100644
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
2.50.1


