Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCC7C87FD3
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:13:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuT-0001HB-Pg; Fri, 08 Aug 2025 09:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHMf-0003QZ-Qa
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHMZ-0007ap-Sw
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcsB3EUMJsqI9BIo2c/GAiLUjrJplvjvOwLkJgmi5Nk=;
 b=Qw1FURrnrdQ5lsbwIFcl4PwJc/wxaGR1bnYA1GnD9IJ2XrJsjcGE/AuCC/ihpV1yJFzuJU
 Hy7duUyX+LTXUAMjP7m+bb708kUDctgdImvv38gLvt6FJ7lHyAuV5OxczB+alUT7KteYFV
 bQNjd1Vr5RtBvBc6y+8fgWnU9bgkrr0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-p0WogDibP_-Ba2M0Zggm_w-1; Fri, 08 Aug 2025 03:17:58 -0400
X-MC-Unique: p0WogDibP_-Ba2M0Zggm_w-1
X-Mimecast-MFC-AGG-ID: p0WogDibP_-Ba2M0Zggm_w_1754637477
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-242abac2cb4so23843065ad.0
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637477; x=1755242277;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KcsB3EUMJsqI9BIo2c/GAiLUjrJplvjvOwLkJgmi5Nk=;
 b=NuG1RqUbCu0NIVgppk7gskDS6as71IFj3AyCvuKd1i97Z63cjg58M3Qvr4l3oOHnYu
 OQnvqYq1viX44V0nSv9BCxd3Z/mc+IQSfZBfjt01aGmbXvAM8vyDm9Ac80T94oG4V2Bq
 kbdx95IX9myGU9Ej03mDX3eDVYOMxHnXY9MAzk8eE3Ob79JHRampNmmdjoLl2RAhoUyg
 zBRMGlBmNqpgS3gP6RbQ6o1i3KaOfYNZEY2oMWJJuYxYl5t5+nHpFd9fTSXLEsAvtrXo
 ljovz2yXgEXyQ6d/NYD3A1DF2WQT/la8r40Yo3MCXmRCom8wCOqdhAnYMusj9WHLCt3g
 2umA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNGb4ZP8WIVSCH/8DTuClb464rhGex+7XYVSgJxbyxGOEvWZgd8/SpkkkeSpfF4Vsst900OkslJw==@nongnu.org
X-Gm-Message-State: AOJu0YzOULumKm31FqEnXo6k/fmCGnbCZtl454gOYJxr2jmbt+DX1cpI
 XOJCwrUAG3qsHmoDxQe7r0Pd3CMd/IOhGc90dWI9u8iMJR7fVMfQizR20mNMAWGukeQzaRK3e42
 pjqU7P42Ppoe4H/oSQrbdK8P5zYpe3FOPc8ueNQFhtk8tJj/KFPeMWQ==
X-Gm-Gg: ASbGncs5ivwnmRrXu8EwPW/qD5k2nTzg6ZMHK/l5IH5RgdH3ln3TZI2P+qQWzfo17wl
 PxKIr2PkjMgR9h9ybN74c2LZOntn8TVUfvptY4hBqI7q1wh1froUprTeJifeYnRZQ4UuA5laK0o
 corGJbyaV7cet1aydr21hyGqcamoYEyQJZ13x3oAfZEz/vKinOc8fUAktqBmejmZpLkyWVFxlum
 a9ClzEyJA6IU5T7BkvLpQDfLeyAy3RqAwv58+XTcqj+qZ42DoU60SSgqsEeWB+a6jVAbAZoJuYV
 KXISPnJNRD1CZhgRFHGUHPGFSjImA9ZTf7UrMGno0zxcjr8zLJRgUw==
X-Received: by 2002:a17:902:d488:b0:240:2953:4b6b with SMTP id
 d9443c01a7336-242c1ecbcfcmr33146375ad.2.1754637477197; 
 Fri, 08 Aug 2025 00:17:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3hN7DujYoM9+TSxoyb7NDlUo8+hhp4rkWTuxmwSBc98GpZlC3ymThD8OTtI3wY5jdGrC5Lg==
X-Received: by 2002:a17:902:d488:b0:240:2953:4b6b with SMTP id
 d9443c01a7336-242c1ecbcfcmr33145995ad.2.1754637476777; 
 Fri, 08 Aug 2025 00:17:56 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:17:56 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:48 +0530
Subject: [PATCH v10 22/27] migration: push Error **errp into
 loadvm_postcopy_handle_switchover_start()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-22-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=armenon@redhat.com;
 h=from:subject:message-id; bh=Zu5RGittsHxfQZbv0Y5N+WqZG4at5pwqsOTAvATRu44=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxdeijR8yGlWvDhXfo3ad3yPEa/LVxpP2J+rezTCrf
 9Qrs9+8o4SFQYyLQVZMkaXha4BsU0BhRKTty+swc1iZQIYwcHEKwERyTjD8z3Rut7g7/bHfJbmX
 c+VfCjBe2/Ls1Amd6g3yslt35lqZ/mL40aQnfKG44cn7BX9P/mpcuOmj5lutvv8GB39Vb7u+8IE
 TMwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g9jTqZIlsNeIl5eXjTNYRnD7t-CT_zUsw6D-bsz7s1o_1754637477
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

This is an incremental step in converting vmstate loading code to report
error via Error objects instead of directly printing it to console/monitor.
It is ensured that loadvm_postcopy_handle_switchover_start() must report
an error in errp, in case of failure.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index c5566199d00893c4e083ecd27a55da832e2df574..de2bce276faa863a0f25deedafb0b784f10559d7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2538,7 +2538,7 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis,
     return ret;
 }
 
-static int loadvm_postcopy_handle_switchover_start(void)
+static int loadvm_postcopy_handle_switchover_start(Error **errp)
 {
     SaveStateEntry *se;
 
@@ -2551,6 +2551,7 @@ static int loadvm_postcopy_handle_switchover_start(void)
 
         ret = se->ops->switchover_start(se->opaque);
         if (ret < 0) {
+            error_setg(errp, "Switchover start failed: %d", ret);
             return ret;
         }
     }
@@ -2657,11 +2658,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_process_enable_colo(mis, errp);
 
     case MIG_CMD_SWITCHOVER_START:
-        ret = loadvm_postcopy_handle_switchover_start();
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_handle_switchover_start(errp);
     }
 
     return 0;

-- 
2.50.1


