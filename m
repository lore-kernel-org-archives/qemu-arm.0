Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75E4CA1013
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:26:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGWI-0005sF-AW; Thu, 18 Sep 2025 11:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGW2-0005R3-Sh
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGW0-00032A-4A
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E61UbPQ98vkxoeM+8ySKgPLne5BO/4Y70dZrTRJJ2TY=;
 b=JeYvsqmLygJaY8GLueuRf3k4Totl/OZUKLljBssJQB/voeJ/lWbJJTBsCRlhb8LOyaxWDq
 g5b+/ItZYSs/Y1f4crXSvA1CNBpyi1sHZqO/Z8Na+ocrnvz4AbfdokGKfQX3tWRc9DukQa
 o076xejgqBkil7g22mStFt4zc9JCUPk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-ucxFuER6NHWz3Lfe-V-2Tg-1; Thu, 18 Sep 2025 11:25:39 -0400
X-MC-Unique: ucxFuER6NHWz3Lfe-V-2Tg-1
X-Mimecast-MFC-AGG-ID: ucxFuER6NHWz3Lfe-V-2Tg_1758209139
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77d19ec75bcso1016049b3a.3
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209139; x=1758813939;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E61UbPQ98vkxoeM+8ySKgPLne5BO/4Y70dZrTRJJ2TY=;
 b=XuyDH+WHGuAx21gorVD+RerEgkLiseBIrePpSHJCarjvePcmzsvXh+WvWOZOPGcOLp
 2ZAwca2g66j75KRCr9LuUqYycajAQZloX+HA8zFOD9dSr11C9yhQChJA0mmZtphQvhVx
 IBoYH+/HXPAcu/9fvEZNdMAj/bwI1bXQqnfJEcbgf3nSOIxRiFeo5/HdOi3l7zKdA1MO
 oSym9D1E6IiRouuzzB9L0MFge3eFp4gyk2v+7UOUNfwvpk6QFK/la/JoVrJBeHGWwziu
 EKRFgE/R+KmKOPPohj4xr2dJO6CZUqc1DV5tCNAlX9h1IupccOsx1iosh3ztAwnD9ZAc
 K+Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz4os0cJ6/3NYqmRVooPUnwOE23rKRUp79yjF9s5BMUqc+xWmDB+FPp/YGbD8hFbuQIY2F5wQjJA==@nongnu.org
X-Gm-Message-State: AOJu0YxPeft9f8970BJjs5L95Ut949JnXiwAz+giroIYTICvxZiWQL9e
 WmrjhPva48iLPq7rCuxQFxtXqaxc8a7UhzZhQQV/HK409dURBCnjnEchoP8YiFCwM1KPuv/csWN
 0GR5/BW/ni+mKv5yRdmj+pde1NEQtzIlmkUsDNPfTfuspKB5rgzgw3g==
X-Gm-Gg: ASbGnctDU9K8DiLExOdBZINElrMu7fP6LCVwThMlbJOQZU1Q8AJ17ki0VaOAFuFOXun
 TK3czz7GddO476ZlJAVpwZk7g+1joM4/9FKbXtG4QtivbkDxrqoDWY8GpLipaJA5JwPXpiPp5CH
 65wMuXvKc+Nx0EhskXK9yP+5XjTxSWV3kfxGqDVDfAXqKRYgEOgqjvohOVC1uuIVHJQygyKmR7m
 k7VIWvXOXG33dqHerRB5rPMu0WSNqcW3qpB0UrR+vtRuJwOc4uFrqURvdR2Pom15Q7pIsJQmEQb
 MEqgxbnuk6bJWAZW9G96Z8hNLjt+ksrBO/vQnfrHvduVTBb9McXYJQ==
X-Received: by 2002:a05:6a00:8d1:b0:771:e2f7:5a12 with SMTP id
 d2e1a72fcca58-77bf6dce4eamr9126425b3a.6.1758209138719; 
 Thu, 18 Sep 2025 08:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEqxvr+s7Cnj59Yo4v8MSL5aVfPGr/qqLYwstSZpAITU5ySBcpQECIplhglRdTgj2Kb3g8gw==
X-Received: by 2002:a05:6a00:8d1:b0:771:e2f7:5a12 with SMTP id
 d2e1a72fcca58-77bf6dce4eamr9126358b3a.6.1758209138184; 
 Thu, 18 Sep 2025 08:25:38 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:25:37 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:30 +0530
Subject: [PATCH v14 13/27] migration: make loadvm_postcopy_handle_resume() void
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-13-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052; i=armenon@redhat.com;
 h=from:subject:message-id; bh=J3tCTCrF6nSfsNZa6QUxbIzpTTI6Us9gYinavq3Uol8=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R8r5HU3undL7di+r4/FOHc/T8lPBd+tIk4Wh5e/N
 dnfcyK/o5SFQYyLQVZMkaXha4BsU0BhRKTty+swc1iZQIYwcHEKwE3OZGT4brhjl+qzU7UrFfsT
 D0benpXkVKWy6OFkvrQGRdENd1IYGBm2mj2pY04W3PBNfvmeVQ9XPHNj1l5u73ZPzPABf1S/lxs
 TAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RqNr9i0HHrC2V_PRFyCx0JFxS7o-EQoqH8VhZ10p9wQ_1758209139
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Use warn_report() instead of error_report(); it ensures that
a resume command received while the migration is not
in postcopy recover state is not fatal. It only informs that
the command received is unusual, and therefore we should not set
errp with the error string.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index d54028b1be4d7a1e4615c2b05611535bd7478e2b..c079942b7ecb959b3b668b977174d906f73c2777 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2334,12 +2334,12 @@ static void migrate_send_rp_req_pages_pending(MigrationIncomingState *mis)
     }
 }
 
-static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
+static void loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
 {
     if (mis->state != MIGRATION_STATUS_POSTCOPY_RECOVER) {
-        error_report("%s: illegal resume received", __func__);
+        warn_report("%s: illegal resume received", __func__);
         /* Don't fail the load, only for this. */
-        return 0;
+        return;
     }
 
     /*
@@ -2391,8 +2391,6 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
         /* Kick the fast ram load thread too */
         qemu_sem_post(&mis->postcopy_pause_sem_fast_load);
     }
-
-    return 0;
 }
 
 /**
@@ -2647,7 +2645,8 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return ret;
 
     case MIG_CMD_POSTCOPY_RESUME:
-        return loadvm_postcopy_handle_resume(mis);
+        loadvm_postcopy_handle_resume(mis);
+        return 0;
 
     case MIG_CMD_RECV_BITMAP:
         ret = loadvm_handle_recv_bitmap(mis, len);

-- 
2.51.0


