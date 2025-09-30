Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B19ACAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:26:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3RtU-0007Dn-31; Tue, 30 Sep 2025 00:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RsV-0006DL-MV
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:22:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RsG-0003GR-SC
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gc7wzZUyIJXyoHgHGeLqeL6vT8K0cbzJspgkY8Cs98=;
 b=h1Z4tiedwa5wJ+ebEWr7hBTsmIJDwP4mgb9taKsqas62MC9KYJSNb/L50pkvyV8O0hqIiM
 nwRZupMPDuFmRy1wm8YZaf6fJ3TiHHwTGZ87avfbjm3sX6LeToQ9zLUFPfXNg2oPWaa+fB
 /avu7haqvW47CwbzIsfHZEdNJX29JQM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-kkXyYKK9PWWs8-0mp0wfnA-1; Tue, 30 Sep 2025 00:21:52 -0400
X-MC-Unique: kkXyYKK9PWWs8-0mp0wfnA-1
X-Mimecast-MFC-AGG-ID: kkXyYKK9PWWs8-0mp0wfnA_1759206112
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b59682541d5so5031639a12.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206112; x=1759810912;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gc7wzZUyIJXyoHgHGeLqeL6vT8K0cbzJspgkY8Cs98=;
 b=tdEcFPg7LvbfzXvpCok1ylqooX5MvmjXxZEBu8pxe2mDqwZtel/Blwv5AEakqRcf97
 ezdpyBITrYCXY6dXDd94OLHmjK62oewtewmjSfQyVYRB4axt/m3tp4iElfQ784d89L/m
 MCbdshGTCGLz03B/sxG6fyexYXEtOyVujpG4FXvFSpR1QcK7wv6XK81qnBM6GC8rFCTZ
 ojkmtlK07I07Mg6CXHm7QOhrSKfk6bAVZrjYcm7eaHmEZZPnx7vk9HEauG+EI/kwrNGZ
 L0ichDPqTPc/NxnkcHLM7sqDOoQhSntpYHzyPqvUOMu0g1R43YSxdJRLAq3V5jyzqkm0
 x9yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMLd+NBDgobaAdYEGsSAB5JfiuAUStm4HiiadoCHDM1W91ZHh0TdZUwEmLD8AcXiCvDOsHde4ddw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/dj1KXCbeplRiO0QJPNkYtzSoMYoFVfJ3nz+z6hIxtS8+DWRd
 Ca0TeyPyByeN41cPHdDimT5ceVqcLUNPQrqLbBrbtoAOg2nCPxMf32PAz6d0iR+cLgnhzmb678N
 7a3E5S5kt2HUBGSdCAiqd/BRuwSGl5rqlejyTLsGtIsF5d+zwUFpqXg==
X-Gm-Gg: ASbGncs9h0/zbq412o/14tAksse2WDs0dEx8fejVbg7xR3GuG7ypkoqmFsvGTgau1iN
 dOMIsqR8d/rJu+wkOH5GyKqeWNM+8JrPhrWyZa4ZsO1eXYomlJMuEl6B2SD0cIUBOWvscE2nvbf
 bidjBAqlDQ2jyI3c5XCXu/8CAlORMiOCd2iSBpl1+KBezaleywP4Sh+uuKei8HPJBau61KN5+ei
 M5IVsAg8ZXI+eMTiE2g4/UVF1mhK3tNcWU5nWNaji3pgwNFKHIgN0qRDdtfYr1RoI38XO38zeR4
 B2qyS4d0DTC/Qnh0n/CZoObcz+BFaQEmqNMmZe2hTAYx+6gXtDVS/UhHbQ==
X-Received: by 2002:a05:6a21:6daa:b0:245:fb85:ef69 with SMTP id
 adf61e73a8af0-2e7d82c3279mr23825795637.40.1759206111688; 
 Mon, 29 Sep 2025 21:21:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMk7W4Q6Ln+EuBwkSEVrVfqYwHwVT8JJ4QmdtCFrAm2/+TypgYuSlqlv3DgQ/YnVdYdr50Bw==
X-Received: by 2002:a05:6a21:6daa:b0:245:fb85:ef69 with SMTP id
 adf61e73a8af0-2e7d82c3279mr23825767637.40.1759206111331; 
 Mon, 29 Sep 2025 21:21:51 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:21:51 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:29 +0530
Subject: [PATCH v15 20/26] migration: Return -1 on memory allocation
 failure in ram.c
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-20-84afd3af1e47@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=armenon@redhat.com;
 h=from:subject:message-id; bh=5O+CXW2cDOnC8HtDO4/gLXusDTQkF/UkXMU+X+jO3fg=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKMEjr7ULBNVYZXN2Ps3+w9pvk7DAVmWKZ+7bY6yVq
 zsNOxd1lLIwiHExyIopsjR8DZBtCiiMiLR9eR1mDisTyBAGLk4BmMjNSob/Gd1VN1+5SBdOP2Uk
 UO65JdB2+6Ujyi7hswPtahiEW2yKGP6nmWh1MP94eXz2+pC4CtOSq4GrwioD+d/KHpxaplBiZ8c
 NAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GNsXyKV0D5ow-PxaB6vO1qzTwr_QKFemtEqumL8TjoA_1759206112
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

The function colo_init_ram_cache() currently returns -errno if
qemu_anon_ram_alloc() fails. However, the subsequent cleanup loop that
calls qemu_anon_ram_free() could potentially alter the value of errno.
This would cause the function to return a value that does not accurately
represent the original allocation failure.

This commit changes the return value to -1 on memory allocation failure.
This ensures that the return value is consistent and is not affected by
any errno changes that may occur during the free process.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Xu <peterx@redhat.com>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/ram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 6a0dcc04f436524a37672c41c38f201f06773374..163265a57f26fb1dc88d9797629d58c278e9afb7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3575,6 +3575,8 @@ static void colo_init_ram_state(void)
  * colo cache: this is for secondary VM, we cache the whole
  * memory of the secondary VM, it is need to hold the global lock
  * to call this helper.
+ *
+ * Returns zero to indicate success or -1 on error.
  */
 int colo_init_ram_cache(void)
 {
@@ -3594,7 +3596,7 @@ int colo_init_ram_cache(void)
                         block->colo_cache = NULL;
                     }
                 }
-                return -errno;
+                return -1;
             }
             if (!machine_dump_guest_core(current_machine)) {
                 qemu_madvise(block->colo_cache, block->used_length,

-- 
2.51.0


