Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D89CAC5A0
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:25:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGV4-0003hT-AP; Thu, 18 Sep 2025 11:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGV2-0003gR-AD
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGV0-0002iw-EC
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfMeHNkHXITJfT3smIrT5NGNTBXHlf78w/tF67kcbe4=;
 b=iqW/sHlqxzzlS7uSm3QYeux9XX1Y84re96NMZiWurfhkrb53zN+n1dHCEKZ/PzxI9RKVFJ
 8A9H8YoPPjiQ3OwUSuMvJ84uWHvqi9xZ7aszz19eLmnl27BBV2jFwE6ErDgj4QNgXdaIK6
 FPslsnqcN8kYxLU2dAJHMAIR/N5wz58=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-G_A2jzR3MQ26Udl4PkH4OQ-1; Thu, 18 Sep 2025 11:24:39 -0400
X-MC-Unique: G_A2jzR3MQ26Udl4PkH4OQ-1
X-Mimecast-MFC-AGG-ID: G_A2jzR3MQ26Udl4PkH4OQ_1758209078
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32ee62ed6beso1383662a91.2
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209078; x=1758813878;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dfMeHNkHXITJfT3smIrT5NGNTBXHlf78w/tF67kcbe4=;
 b=KHW02xKlAcNXi+4OtkCPFX1ojeTA6u7YU79VWIODBcpCmO/ZXVYxF8Dww4HYQGwM6B
 zVRpdykd7CsGaE7TRZelkPVho4G/hhkHEV4NWCVPv6Mj/VA+daTSAGPvI53KiVcPe/NB
 PH97D1f4LAVfBI59Id8Fc93wHcK/b5nokDrYUiJTDQE/a601/CgqHbLWbU7cdmnHlOpT
 510/lRk8hUZbq0ZJZAUv3vC31b68MJetSOXMAUlLdYF/QjSfclWibmYqfyueL0yVbfXK
 XKX8y1DssppxA2gXS/V7+C52CFSs9Ngod4RuRt3upSkTW6c4Q1WT4Hg7TlHGw9uPKkSr
 uHzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxKB9qHm0QJag8uLpgvJnfW/H+4mA8q4yWSSSF8yimUV3AElNGIGQYnJz5lVcliLNk5LzkTff/Tw==@nongnu.org
X-Gm-Message-State: AOJu0YwdOyKiyywrrYL68UgaKqpR/mbSSX73LB6CDiRpcUzrq8xV3YVB
 gSZHIggNc/AHyZaLCvXU4wsheZNLCLT+/9nFjT50MumS3kqT/Q6MWs50QTD2b7kEn1FaviRGBes
 Sqp29p4lxy6lScttOF1WVHdLevIlUhWgacBlbB50PBUWx0Nt9jn4Leg==
X-Gm-Gg: ASbGncuzCOoWcL8qt6V3Zu+DbKXyplQo+jMXck+mMhJiWmIokU5sqh8Qpf+Gp10Sbr6
 Ui8Y+2nLqIJ4+bLKw5FytdoOXgkggEBq0dHRXjNdupS0W1kmFoAjbvx3BQBws3MTSVCRDk4VRHI
 31uIaMTK0d9WX/bjki2Gtg+vpARqq3N/Py01rBzw5XMT3Dpv/DRbDo75wY+flCPhEH5eBqK25iN
 1CicI4L6pGUjrfJzOc6to3ZftR02AsZbYYJKY4++FZt2wAN92+TEZRL0bR77MQcxliNQV8UWu2y
 DHzViaYD/Us/kzTQJ3EL+I8TuTxtPqe0oiNEXJqwgIcea0BuRaSMeA==
X-Received: by 2002:a17:90b:4cc7:b0:32d:f4cb:7486 with SMTP id
 98e67ed59e1d1-32ee3f5d61emr9249767a91.19.1758209078190; 
 Thu, 18 Sep 2025 08:24:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHchsePdUAtT/bSNdlGCYJzS2Wc/PL0J09GzLGLkbB0fLQqtWjhtABACbxujfBEKLRMLBdihQ==
X-Received: by 2002:a17:90b:4cc7:b0:32d:f4cb:7486 with SMTP id
 98e67ed59e1d1-32ee3f5d61emr9249730a91.19.1758209077774; 
 Thu, 18 Sep 2025 08:24:37 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:24:37 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:23 +0530
Subject: [PATCH v14 06/27] migration: push Error **errp into
 loadvm_handle_cmd_packaged()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-6-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2769; i=armenon@redhat.com;
 h=from:subject:message-id; bh=EGno3AsWvaj5rUCkbXjfvd8MsWC3MPQGycacGbWUg0A=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5e9Wd17VpotteMXcvu72nQ0tAS0e/oJT80Xa9Q/K7
 5b18JzaUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCIP/zEyfOtrj1TsnMLm9W2z
 R90l/5r5+s+KL/kutjmmwCC7e4qWMiPDvCfln+IXq75/FGR+6senV3F5oSq97z5N0Pnx2CWlVGw
 6LwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QF_whnpOtJbMmbJBV83RPsT_laSasZHrF_V49S3rjjY_1758209078
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
It is ensured that loadvm_handle_cmd_packaged() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0e9935aea3e1a214cfa0ddd0e30fa5cf925373e3..de5671ffd1cd06e728227a3056c3f895d3a6e6f3 100644
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
@@ -2620,11 +2623,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
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
2.51.0


