Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D7FCAC59A
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:32:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGWh-0007lX-RE; Thu, 18 Sep 2025 11:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWd-0007Lb-R8
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWb-0003A2-Ua
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EK8ZniS31eKfAuecJyHjMuA5swX2F7mkJn3tAORFulo=;
 b=RNnm/1L9o7xvzNkNiTuwVHlEijuLc6aedwSzdim2kNp8TzsOp07qC2q4zNgyTXwat7aKGC
 Vg+meDvcotbD4Eh6IsXasaKAM6fQ2D3DHjOnI8XN3zvROCCS6QYSt+BdbFeIHdXQQ4LLAU
 tnBXsErYvbwfkDZ67zkCY1VqhYY791U=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-x3SiZxvGP5mEPtbsjQmg0g-1; Thu, 18 Sep 2025 11:26:14 -0400
X-MC-Unique: x3SiZxvGP5mEPtbsjQmg0g-1
X-Mimecast-MFC-AGG-ID: x3SiZxvGP5mEPtbsjQmg0g_1758209173
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77619bb3871so1843118b3a.1
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209173; x=1758813973;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EK8ZniS31eKfAuecJyHjMuA5swX2F7mkJn3tAORFulo=;
 b=wSQmKRZbbO+gY+KW+W3OS+YpqVkyhYdH5E+IIncscbHvUSWzZj8/zbWCVVNVOUA8Di
 Zi3TPi7rOej1FlfeWCGvzz6sV4izm9CDwOK4+hgLxXzYXpOJhuF2ihmBIVmjBzuKsCAx
 0xX0iNdqsbq+UhSbeK0iGl7Em3MyrFyIqcMJzmKEkczFfkQeWECEe+7JxUFuKBWsWiwk
 Sg3KFi2EHs3pNcmufkNqJR56upfZLDPZDtX7WUbmF81mf3+YmDp58boHuHjtxpA+e1YU
 S7XKokTLfk2R5A1WNr5EkFsQHw84fE0QN/M32nnSFS3nFcHudD4EUcsuPev7WPcl/arR
 HvTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFZ+qJmrJxxAOF1HZaYbuptwzJgETB6s/eH1LAAMm2zlFmoZCudOW96xYzKf1pJt7SJA8svlqpog==@nongnu.org
X-Gm-Message-State: AOJu0YwUg7Pa9z/KOPKSB+35e6T82LH8RAtdvKdDTQFcvy1KeySTcnPY
 oSsEQ/4ePbfkaLth0nVHkarkU4KcUqJaPcqxR4c0kkGjCcnFjKn/9+ULFTLuup0lbOfscu9UPNX
 YzEvhIWRM8Bg5Qg8F9VJck95zIwcRNr/+mSXzg2EbGvpGz5QyKWsy/g==
X-Gm-Gg: ASbGncvQLrzDHdewUoc8cAYgS6dGXKZ+pMukr7axaiQch7r0/B+FxDYVzAcCUHV1eiJ
 zfktG2+qV+35XBPlqvY4Y9B9ri1Dn2tmIYmg3MvCIxdml6Tx6wJ809kFdWz0lhZLXf3OJ5dZ3/X
 TUV0QeQ37dkWcQgXiDLkJ06nMVMQLNJ5SB3HM2oP4BKunzNZ9OijIQfjjN7+hy0mV9pw6rqRZv2
 iIQaihBQBHAg9jA0OLAh4DZH+wW6fhh6Lt/hMSfWTuo8aPQ0qEgNPyoCdUkeBJw0+Mw1VDAm+BK
 sgCD2Sw76zLdJaThdPoOJTI8RWKwRWpAV6o5Hvy7eF0CoXhKwVEcaw==
X-Received: by 2002:a05:6a00:7096:b0:77c:d54b:8c86 with SMTP id
 d2e1a72fcca58-77cd54b9014mr4631221b3a.0.1758209173257; 
 Thu, 18 Sep 2025 08:26:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS0MJecLzlL9sKl0qZUacYM/7yKkS7NxjQ3nl1DAwAkINLP/TulkB4/M2hQdedZlvGaQyZ5w==
X-Received: by 2002:a05:6a00:7096:b0:77c:d54b:8c86 with SMTP id
 d2e1a72fcca58-77cd54b9014mr4631196b3a.0.1758209172898; 
 Thu, 18 Sep 2025 08:26:12 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:26:12 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:34 +0530
Subject: [PATCH v14 17/27] migration: push Error **errp into
 loadvm_postcopy_handle_run()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-17-36f11a6fb9d3@redhat.com>
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
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888; i=armenon@redhat.com;
 h=from:subject:message-id; bh=Bc7pNWeaQQJR7xn/IMqCNxln9K0U+dn3FXOfz+z8MlM=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R+7Nt1bVjzvbN6qaWY+F5i1P8ktnzQ5yfDkBNelV
 21KDh662lHKwiDGxSArpsjS8DVAtimgMCLS9uV1mDmsTCBDGLg4BWAivx8wMuycHRAgUD498bZn
 ysqnRf+E+ZS4Dojvn6/NpfHYp+nqmjmMDIsS3uQ3SG5+EGKQYxitcvf9sZ7jx3LztidN5dqfvvS
 uFCMA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6U8k3CBlg-l9ZYa03FSnZTIdvxalqMTwnmx3SxniUGA_1758209173
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


