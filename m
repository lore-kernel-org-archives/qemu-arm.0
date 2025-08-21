Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498B9CA0EEB
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:52:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0zG-00026o-Rx; Thu, 21 Aug 2025 04:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0y0-0007FO-NZ
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:48:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0xp-0001be-Ed
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755766078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJlG6eaVi9W+kzO8rXIp8Lrphbsej0OBLy0MdGC0lwk=;
 b=GBIa/feq2y89i9Nz1i76T4T1WJObysnjZCREov5z7paRArIMIT0azSDDvwcM37xLeR5wga
 DDmKRDJfZi282mxymvmZmpRlXF+bPpGu07W4UOmbaBYQSqdggajciIp5tKE1+TFU3HLn47
 WiHkGFOCR8Z/bhL4gadw7sJ0rJUxj9w=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-3dapabldNeqpdgvjr8of6Q-1; Thu, 21 Aug 2025 04:47:57 -0400
X-MC-Unique: 3dapabldNeqpdgvjr8of6Q-1
X-Mimecast-MFC-AGG-ID: 3dapabldNeqpdgvjr8of6Q_1755766076
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24458264c5aso9085795ad.3
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755766076; x=1756370876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KJlG6eaVi9W+kzO8rXIp8Lrphbsej0OBLy0MdGC0lwk=;
 b=mUleM4dtCRO2jekUv/66Iz8etgjFz7xuPrG28Xi7gOLDfdLmoUdPqcxKqatJJ9+hEj
 pkhZli8LsnzaYey6HFd9jjmJIHwxTf/ZKEZ82glTcBYT1DuudKgfNVw/9ztcqYbrQEU8
 TocpbcDLFqZWjOH0XeZZ6UyPmZCCdFp+83PWjrPz+4hn9vEVGg3+RE1m8NvX7L3NTNKJ
 /Q/895Nqm2JaACekO/9uhPaTMD4OpsWnDAPj94l2iIYun1vI1e+dTVTTqG/DvNt9EdWY
 1+aEAsctCMp15Ga/OdvsT1VSUi1p4Qd94gYnSVKWHYqm1CcxV38uLBEav7fB3gvehmK0
 y0cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgsezDxhbhPQHok38r0b6oVbq+a8QlrsD6RXyQaZIPbByEA2oslQhM7d8bwVp8dIHNXHOtKoE3eQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw0N75pBpEIS3nlK/ixTZmypnDRq8K+UcFifv/OPjIJk0NFwoDB
 Sh3q63dUq45MGwlfQOz7FGf50dpwyJNNaRBqC9zpFpyo7xjB3+lARFVPQnzM4rxVlJaI7YgKfQL
 CAVou092o3kiltUMyIlU25GLTCRvS5SkJFzcHCVRaihxvygXGbEw8gw==
X-Gm-Gg: ASbGncs7BfeVooohQZUxrWA8n655kbd2QPzw+ngLANNaEp/ZjuZRTVc1pr8jgOOjjuY
 M5YCM3IyH74FU2DQgTVFZNG5Mv8FJVWsTLJUqtoL49QTXHmIgARU7c74HzRN+IWUJ7kCwqWHirN
 r3LNFTyWWeMAPhmGIYGA7JYDV08HjLZSfje49NVvNN9wwnwAXUbEdsD3ev2D0UOe/4Sl9XIa0P4
 x3HPCmocbX/Vk8eAbpHiN5/wonFpV5zNyEVWUSzsBzEfLZF4oiJV9mrKKvn0BUFJnbth0O4HXxn
 4wEOeN6d8ep14QmOkHE5sYyltmnZtpVX0+VXYGywtFuoxz5Thas+
X-Received: by 2002:a17:902:f705:b0:246:163b:3bc6 with SMTP id
 d9443c01a7336-246163b3fcdmr6881965ad.49.1755766076532; 
 Thu, 21 Aug 2025 01:47:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWAsEqhujn6Bk0t/fZD02dptuBuAc11oIHOx21SZ6Lc2e943pi5zoWyzVfCCacGKB+jK+GyQ==
X-Received: by 2002:a17:902:f705:b0:246:163b:3bc6 with SMTP id
 d9443c01a7336-246163b3fcdmr6881685ad.49.1755766076133; 
 Thu, 21 Aug 2025 01:47:56 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:47:55 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:13 +0530
Subject: [PATCH v12 19/27] migration: push Error **errp into
 loadvm_handle_recv_bitmap()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-19-72b803e707dc@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2599; i=armenon@redhat.com;
 h=from:subject:message-id; bh=BqA2d6fUfxPl55xxwpfeFmITzSTIT5PTLX/2vaSWHXY=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayOymx03KftR+aNSeU/+uWKzop2vF+3xOZJHdxsJXvX
 K9n73+ro5SFQYyLQVZMkaXha4BsU0BhRKTty+swc1iZQIYwcHEKwERK+Bn+WZgW2qrOTnpWc+to
 oz1PyUTTg31qK9484dN6ur6QheEtKyNDT9C+dy0zA3YZZXFcvDbr39Ir67umWP/9Fzlt/Q8uo1u
 rWQA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ErVaq8WxlE03B2agZGkRPBQEYcRGyjLFq0Cq5JCwIw0_1755766076
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
It is ensured that loadvm_handle_recv_bitmap() must report an error
in errp, in case of failure.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index c38646d5c3d75c64712561984f6b1df92ad55feb..359264cb639605a3f63a2b022c57afd511c47a05 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2476,32 +2476,35 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis, Error **errp)
  * len (1 byte) + ramblock_name (<255 bytes)
  */
 static int loadvm_handle_recv_bitmap(MigrationIncomingState *mis,
-                                     uint16_t len)
+                                     uint16_t len, Error **errp)
 {
     QEMUFile *file = mis->from_src_file;
     RAMBlock *rb;
     char block_name[256];
     size_t cnt;
+    int ret;
 
     cnt = qemu_get_counted_string(file, block_name);
     if (!cnt) {
-        error_report("%s: failed to read block name", __func__);
+        error_setg(errp, "failed to read block name");
         return -EINVAL;
     }
 
     /* Validate before using the data */
-    if (qemu_file_get_error(file)) {
-        return qemu_file_get_error(file);
+    ret = qemu_file_get_error(file);
+    if (ret < 0) {
+        error_setg(errp, "loadvm failed: stream error: %d", ret);
+        return ret;
     }
 
     if (len != cnt + 1) {
-        error_report("%s: invalid payload length (%d)", __func__, len);
+        error_setg(errp, "invalid payload length (%d)", len);
         return -EINVAL;
     }
 
     rb = qemu_ram_block_by_name(block_name);
     if (!rb) {
-        error_report("%s: block '%s' not found", __func__, block_name);
+        error_setg(errp, "block '%s' not found", block_name);
         return -EINVAL;
     }
 
@@ -2640,11 +2643,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return 0;
 
     case MIG_CMD_RECV_BITMAP:
-        ret = loadvm_handle_recv_bitmap(mis, len);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_handle_recv_bitmap(mis, len, errp);
 
     case MIG_CMD_ENABLE_COLO:
         ret = loadvm_process_enable_colo(mis);

-- 
2.50.1


