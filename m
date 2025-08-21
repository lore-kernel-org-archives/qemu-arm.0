Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92866CA0EEB
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:50:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0zW-0002ir-V8; Thu, 21 Aug 2025 04:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0yX-0000a9-HY
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0yM-0001hr-W5
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755766113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ah4Uv2NmfsVg3D7OI/2kgxz7SXyNpLL/SJp2ZD+26OU=;
 b=O4UCwokcjAED/SZW0IEGYTxWA0ewneMjt/e8N7HRy8cJ6SMwHu4pRD+lO4cleS9iQvKSx2
 WUshhKS0ERR1nT9DNYI7zMkIpFrj9meeUSQfQumUBcJt1wkTMOqxCu91gdnoSsuCnStRsm
 C0FO+OmCmOjvgV56OVa0Ayr0NupUYhQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-VjLmYHOhMV2PLK_S1PlDng-1; Thu, 21 Aug 2025 04:48:31 -0400
X-MC-Unique: VjLmYHOhMV2PLK_S1PlDng-1
X-Mimecast-MFC-AGG-ID: VjLmYHOhMV2PLK_S1PlDng_1755766111
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24458121274so9645275ad.2
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755766111; x=1756370911;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ah4Uv2NmfsVg3D7OI/2kgxz7SXyNpLL/SJp2ZD+26OU=;
 b=MUI6gmXv3zD30eZSYQAhplbiDc8V1QLTTuVzDXufEQau0rVcgdzAu8nT2OBBn20EBd
 1i9brK6NE4Gxc/pMA5wegW+19EoBfSpsWamnYvVB7OP5ymyOCWqHjy7zhgRDu3xnzeup
 wZMjyJr9Ylg24k1MjgHkDjDGUzGXlRGsGySEb+WpJgrLmk540IMWB8K3a6gznyGZc1R8
 qddMKfF+Tgo5PC0TNv//sAbbUFzYzzBb9iGk++FWkXyphb7Tf6KJ4EO+NFkjirnff/31
 Na0Lyh2RbMpZTK9/Z/iZzShbHjXjTPPEoL4sZggW6NoiAINx/iIbGL5KkeUxDDRI3ZOn
 93mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa+zsaS5+9sY27xZpywZ2zt1x0WDis5g7Kg8JN3J5tMLeO8iZbHDjGmg/ByMcSyDo+x+s0yWFevA==@nongnu.org
X-Gm-Message-State: AOJu0YzoJXnLknRH+uZq31nVP/Z/toZCya7TX/iCj1m9LRMlQimTskAy
 X1TzFU98ug/mLV8y9gHEpeWBJB/AktOgb001iSBW5b+GkTP9bkqSmyYFSjFbSxJieCRuhbSYpzy
 83WdERquIcJj9oL4J3GKoW7n9A985G31+1EK9d6DZeRIDffGyZA8vQg==
X-Gm-Gg: ASbGnct5yVwrNyBM8liLX3UjeB/zKk9n2+SxUlT7jBtnxv2OGuQ8NUSGeGwoWWjed0Q
 WkbMzRqZYvwDHhNsCN6a6UDUGzLwZPW/DDPpJ3Ddr7z/j0TqTB1IBNDPwOCtizTNxWos6PJtxAX
 dgk2TB9JqV59eKQ8zkIpboUUpYrsMZHgTCwlelkCJSTuEOkB81ZdEeroo1xWb52xVNxoyzVqkYr
 baflC68ZdEzy8FxsjFldarw36ZRlMpQd/vE3/90qI/YStgqVerOtkQH2gzlomvgWJalzihCHzT5
 29uKay/gO6BR+woIZzjZRJtVGxJQS9JgA9wYXRY4yQae76fBIukC
X-Received: by 2002:a17:903:428f:b0:236:9726:7264 with SMTP id
 d9443c01a7336-245febef6edmr18933345ad.5.1755766110918; 
 Thu, 21 Aug 2025 01:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp0OBwace6JtDd3gOc8ecN4jglwkBTVS8P7+ODN7AEvowznH8WNOWF6k3OOcbw5WELNq1lQw==
X-Received: by 2002:a17:903:428f:b0:236:9726:7264 with SMTP id
 d9443c01a7336-245febef6edmr18933035ad.5.1755766110545; 
 Thu, 21 Aug 2025 01:48:30 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:48:30 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:16 +0530
Subject: [PATCH v12 22/27] migration: push Error **errp into
 loadvm_postcopy_handle_switchover_start()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-22-72b803e707dc@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=armenon@redhat.com;
 h=from:subject:message-id; bh=lJWbWSUx257lH9idp8Ne7CrwWih8w2pxWnaGbaUKfYE=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayOymXl+2OYtOJ/DZd6OPDyxrFLOsniU2PPspnqH0y+
 TaTocLnjlIWBjEuBlkxRZaGrwGyTQGFEZG2L6/DzGFlAhnCwMUpABOZtJGR4f+ZBS8ORU1k3TQn
 uEykcPWK1o0LPr7JP1iqlXln/q+NOnEMfwVeXedcJe+4ffrPng3KjVZGhVyLkoPiu421WQ2cpGR
 qWQA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aLbI7c2CNSMVTd-O0R6regJNGY6AW9cZMjZmglmmpbM_1755766111
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

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 3a1aa25dd86226fc9770d0dbaba51ee673f8f663..b53a9db8e21a68b9fe4991dceda89bbfff738caf 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2534,7 +2534,7 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis,
     return ret;
 }
 
-static int loadvm_postcopy_handle_switchover_start(void)
+static int loadvm_postcopy_handle_switchover_start(Error **errp)
 {
     SaveStateEntry *se;
 
@@ -2547,6 +2547,7 @@ static int loadvm_postcopy_handle_switchover_start(void)
 
         ret = se->ops->switchover_start(se->opaque);
         if (ret < 0) {
+            error_setg(errp, "Switchover start failed: %d", ret);
             return ret;
         }
     }
@@ -2655,11 +2656,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
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


