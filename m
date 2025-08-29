Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BBCCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:25:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNe6-0003ES-4V; Sat, 30 Aug 2025 11:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5NA-0006Ku-5l
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5N8-0005Br-M3
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756498013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZ5qpT0ubEUqCdewMRwilIH2qM78jxpQ70y0QUZWscE=;
 b=MgSp/ITX6COAikUqSKJnHF3kJDqJqLZS7EXr4N5FTczj6+97/q1SMXwFoGLq9YT+Fd/cwd
 i1/3l0Dslf2etgN36YXDJhTyp3jSVuUc5r3mVoWsRHRQ5HjKE6s9sM5GjyGfhZ1A6P3pAU
 cPMoxWczGXMt0HqQ8AGTc11LfTGlDNU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-zcbDaohJMg2utOL08N11PA-1; Fri, 29 Aug 2025 16:06:50 -0400
X-MC-Unique: zcbDaohJMg2utOL08N11PA-1
X-Mimecast-MFC-AGG-ID: zcbDaohJMg2utOL08N11PA_1756498010
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2e60221fso3805673b3a.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756498010; x=1757102810;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZ5qpT0ubEUqCdewMRwilIH2qM78jxpQ70y0QUZWscE=;
 b=RByIhEafbfdkMuvgDHf9OPQPZJlr+g+8PToiSeVAbY/w56jzPReHpzKgfu0owPLhP9
 y8CUTkAcwTRTILqiWdEKDVK8sGuRR7whAld7rh8lpUOcfUsSdWQH/PVp19Ds9d1MpEN5
 ZaVhZlboYR1bF29MSgaHgtD1wu2C3FIqQwpBwumRryWRUzvqF6zGjYDs/Y6iooNfiA0R
 ukNEBs7AEd80nOh6xup0uXQ6JifAPnYZYlV7CpHMUarIXVboyj39xknYw0BNSSB17zpn
 5PEM3tlrpUqnzwGbI+ikCBxjV2aKf9Cemq86B3GvwNc1tfL7+51zhoOwsERxtb9/Ijkz
 kLOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQhW2N6IdRAwtuzrIKJXo3vWFIFNTv+s7BnqJrd5G7VHt/4SYlK2VLrBsL/eFtUAb46kTB/nS6/w==@nongnu.org
X-Gm-Message-State: AOJu0YzgO5wFW2iQ+gLWLQEB8r2hHvUn/PuLLwvFE4H7RsS56zOhNVrL
 TO8sF0Pvl4OVVp6LfQdHDdtd/vKyEyvAm6ZaWpxfqEEhf8zR224kSzQw2p+Nsygnbiq+IzM5xXp
 knqR7t3uCsTihAM60IrNob+7jYxy0qPiUCaced6VOzyka98JR3F4Uag==
X-Gm-Gg: ASbGncsaNE61hzuvqAoqMqElL78cTGJnoK2per6sjjVoNl45coly1TR3mGBLGMPuv4t
 Rv4iZPfRmjOotOC1Jpu8FGK1vky8QQGzNhLbkCKJt0a1eQhDXmNqlGNfUdRlTq2rpQK87IEX0CD
 k7oO/QnniQhxxV0fcPdLNax13koavzj9w2hHPj6V6wL+YWGf8I9HU/7vy0Jl6kls3196j2jLtBm
 FFUa/QNlpWdvafG4fQTG69ayGcOqCVq8zFwi6hDfsNzTSoGvYay44btq2MoXnEBtiIPVItjR0kw
 07gk5DiL7zLwy+LFkDNNr4acVX4ttkQ9HxR54QGR64MqP9NZOfGs8g==
X-Received: by 2002:a05:6a20:bf29:b0:243:9c68:a031 with SMTP id
 adf61e73a8af0-2439c68a272mr14163545637.57.1756498009690; 
 Fri, 29 Aug 2025 13:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzxD8C1zYL0rbc7Yjbu3zMPRGvor1m5j0HTq3pLV9i0V3YW5hxnfaaHWO++/fBbgZAw5zcaQ==
X-Received: by 2002:a05:6a20:bf29:b0:243:9c68:a031 with SMTP id
 adf61e73a8af0-2439c68a272mr14163511637.57.1756498009263; 
 Fri, 29 Aug 2025 13:06:49 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:06:49 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:59 +0530
Subject: [PATCH v13 19/27] migration: push Error **errp into
 loadvm_handle_recv_bitmap()
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-19-a4e777b7eb2c@redhat.com>
References: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
In-Reply-To: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645; i=armenon@redhat.com;
 h=from:subject:message-id; bh=sWsUM8lShaPXtDP2lf9BQ1xaS+5SyRjp1vtDn8Aau4A=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdt+Pv6RD2HUU3ftefjr82CNNWTIz+IWJ/Me/TReDS
 s7cFTvZUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCKukowMV35y8u88fI9Nx9jg
 +suWmSeP7HBtu+jzXeepyoZDFzX73jL8zzitMeFzda0/U3L17Lq9dZunTvvD9SmAR6L5u0Xc7E2
 7+QE=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WNlx_nTL6mCUtYHwfNDM4KoJwkz3SHrEzQOjPjCdJqg_1756498010
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

This is an incremental step in converting vmstate loading
code to report error via Error objects instead of directly
printing it to console/monitor.
It is ensured that loadvm_handle_recv_bitmap() must report an error
in errp, in case of failure.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 01cc186b9e0324053e804c4fedebee02d8df4052..13a809564aebf6346228f46fd60f611ba6104bea 100644
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
2.51.0


