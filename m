Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADDDC87FD3
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:14:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuR-0001DR-Df; Fri, 08 Aug 2025 09:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHMA-0000yn-QB
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHM8-0007WF-SN
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eu+DxJs1BSeNduampGqfs17K2lrTwCheyveRHInPudo=;
 b=Lal3/mM8+wqHeRGWmeO3+rBUFRmSWCFqYMxV8Pv10QJFBgISHzJx7zRcTZTZ6T7DUKOHw8
 ZaAxysMhFQKJbs6gRKpy+toeXL8E8zdOVQGduSb36ahAn0e+BRrkO29g+cIrdJo+iMBonu
 SQDbLSetZ9h8XcCmQr3zGkVVmQNaj/c=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-VhBJEGhWMsKjtL1rDikatg-1; Fri, 08 Aug 2025 03:17:31 -0400
X-MC-Unique: VhBJEGhWMsKjtL1rDikatg-1
X-Mimecast-MFC-AGG-ID: VhBJEGhWMsKjtL1rDikatg_1754637450
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23ff6e5c131so15400055ad.2
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637450; x=1755242250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eu+DxJs1BSeNduampGqfs17K2lrTwCheyveRHInPudo=;
 b=uL8bJDVHKjMX0WQCD6o7F0OxkdYvs5xzoBmYVjw8KsLymwVPRMZGbdwBIZQBhocHkN
 vznWh1aNVvybrArsJIZxbimyLLywCqyLHwNjVp1e6Mr6aBRPi7A1pNJP33uWuw8Gl0ao
 tBG7dNJL6yBrDjHqv989p/99euaG2BJPXFMSKSlleEtvFPwHTMYglNNoqVjWGFZyYgdW
 fjwbioKbixJtm89PVW1uXLiBWQGSN1tr93SNTsFh8bhdfEICCEgt9Vu7skhvpOMBluql
 SJCb/6dHtg/wElh5rDvA3uCxgc+O+HBHww3i1nqJ2wQiJ6vcaPiQjuGovxr7dby4UBKj
 46dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg2A/CjDUJZVLvVOdTt5yaVgjuCIJnT/Ug3aHka16myf1XCmEGE1w0OIyG5ZbTk+z03XCjO00m6w==@nongnu.org
X-Gm-Message-State: AOJu0YyDRQPLEzuA30zWlrk+P6UZZohA37+6DHCbMf7Jd8I0jbSvBdcL
 Q7SMq0FpVwLbcpNbSqmnMj1dpuow2VOrNS1JhD/SQWyhIGUtAu0zUmxeyGIO9PS6/pQQghkDexi
 QukN4qVPJdslDlnvIVJsDvlT/Yz+vollWMknfKBZAxVsL3oVqxvGSsg==
X-Gm-Gg: ASbGncsHtvIslU4pIacufcSrHXx70xY5dZcmIPtxfoQbYm34oL7+Dpdtr3Exc1Y/hAc
 EhK91gDPEbuI1bOTlYlxtT6xxYCBAQmpINS18A6C7TMx44yB5TBcnvaoYz9Hh0UZgOfM/SNJU15
 tvg/Ixwe8yKW1p+Ft2+Ko4BV4rgwdllYPRMOulfweqakrxVpV0vdMKkvssyzaOcZy77PnL7Re8s
 yqFVPsW+mVg+p+07ThW0jfmtJzzIwp1bdvUIBVA7g3N75mdTnoTr/s8J4TmGMHZqWL+VEHepT5h
 RrJRthrwl/o2/zbcQKtDUO/2piWP2hVTBdZrsjMsdZByZvP7K7eKGA==
X-Received: by 2002:a17:903:1a90:b0:240:4d19:8797 with SMTP id
 d9443c01a7336-242c20074b1mr34129845ad.22.1754637450390; 
 Fri, 08 Aug 2025 00:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGemC7iQ7O0BrvbpGtL+M+66HUW48UKdhlQ+z2m4fnJaJjeKXbJtFEcXXamDc9KeqN9hMMfrw==
X-Received: by 2002:a17:903:1a90:b0:240:4d19:8797 with SMTP id
 d9443c01a7336-242c20074b1mr34129305ad.22.1754637450032; 
 Fri, 08 Aug 2025 00:17:30 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:17:29 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:45 +0530
Subject: [PATCH v10 19/27] migration: push Error **errp into
 loadvm_handle_recv_bitmap()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-19-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2614; i=armenon@redhat.com;
 h=from:subject:message-id; bh=74qopHTRjtnmkfH588NqXXJeVZqDEAzpYH9EdbLScjc=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxdeSN1lEZ+yo4n/nG5M6T7h6rsBOPq/pwX0fmo3tD
 blUPm3uKGVhEONikBVTZGn4GiDbFFAYEWn78jrMHFYmkCEMXJwCMBG56ww/Gact2F0zOetr4QyP
 VxOFH7uGCIkLVSgL6D03XrXi4nr3A4wMfyp8VjreUNGpvHFFp2vRXaksEz9nxhDzWx7PPfd79wU
 wAAA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p10t9a7MMxVeWu7ZJYETuyyyCfKr6j5fseGSsiC8HKA_1754637450
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
index 9098c4bd3394d7b9ed77e20afbb26fd9c9be6550..a7aede1b3df9164e322e68f3889df7c4166876f5 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2480,32 +2480,35 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis, Error **errp)
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
+        error_setg(errp, "failed to read block name: %s", block_name);
         return -EINVAL;
     }
 
     /* Validate before using the data */
-    if (qemu_file_get_error(file)) {
-        return qemu_file_get_error(file);
+    ret = qemu_file_get_error(file);
+    if (ret < 0) {
+        error_setg(errp, "migration stream has error: %d", ret);
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
 
@@ -2642,11 +2645,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
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


