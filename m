Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6C7CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNeN-0004BD-Gj; Sat, 30 Aug 2025 11:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5NI-0006OM-Ta
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5NH-0005DP-Do
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756498022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LB9SXkQgOnyONEMwUfFwYKtNNWRhU5cy/RayQLcVHSg=;
 b=Tv57tOvrepVg0B8oOUht2AmdtnHRmjoUQXE+rLFvrJAFErjErE3o5HcWzrQzlbTOb2a/HS
 XauErmGSTw4Tgm2OwJssROQMOWmTBjIzbHt5svUSqy+IIw2kJfGEDJikNktoGguHlApasb
 BexvpK/K9Gvxbbvudh1C4u10yYj0G2g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-Zr3uVG6dOX2LqbFr-AtpWw-1; Fri, 29 Aug 2025 16:06:59 -0400
X-MC-Unique: Zr3uVG6dOX2LqbFr-AtpWw-1
X-Mimecast-MFC-AGG-ID: Zr3uVG6dOX2LqbFr-AtpWw_1756498018
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3275d2cb1cbso3805730a91.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756498018; x=1757102818;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LB9SXkQgOnyONEMwUfFwYKtNNWRhU5cy/RayQLcVHSg=;
 b=lYXRL6u1RI5MZZIHfBjNXwyNM6oaRpAwLacd/+aGu+mHXGmswwbgHai1LmoGjM7YXJ
 Q7e7oS+5RKVqoElYt04BW+YriCy2+p4nNmY83SIXjaRmUvItUIm49mxfcYwWbF4aGdhf
 +mcKoOAwvv6sIknJJp+vYaNP57voMUiv99MJMBnbvfCqjYkgxQ1gweZ3YyUyVm6AOqhZ
 rjKGEPLM6vA2xDYBBhmHUG0+OScx0HvPQxcAfofdMcj+N1dv/FEUJOZZHP1kuJQwY256
 ui+faKatUugGjGFMdiXHHJGn3FUOSF+GjoWzq0S/pDOyb7htJCVfVfHXzT5bUmCthH4M
 3o8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOHK/BrZMAQ8U2qXyIoeI1hEwTATDN5fiTLDCcHknxV8dH3SBTeuPWfQbmwuIL4ql+C6GcTuPxXw==@nongnu.org
X-Gm-Message-State: AOJu0YyHeNlJnSI6CKYJqqzlCMoU4T40x117Y15F1GaxaOtDEtSpgCtV
 w+Q/XCqDpSmquLMYhdG2jp2i0UHpdy3pYQnD38s9szLgZ47ThyY/NP+TcmftmLX1OhuInC9cFZZ
 1Sc2Bhs5qM/cGvzgURMJCAHFTXrxbfExqzPL8tTvGJTJsLE+Wh31nGA==
X-Gm-Gg: ASbGncuvIAIkwErpneODTZIARBFZk3RjLIS2NM2VS07tEOcXvwTSnQBBFbNt9GRVVY2
 jWoE2dhXyl+Fsbp0b9vtDM2rnCOyZFsYoDxgIAClGbn7F6oKJLCPwbf/vXGdgRODc6HBZUf8QhM
 9rJlGXCCHke1ijNEcanwH3KZpQS9TBTuGIaJFgDpJtmpM7jjTS5vFcTeO0kYZpanehcyYDt1d9w
 XGXyf4gXwhCBdDwPgpPPqKQz0jqDdXbGQZUoW0tVjhxAp3tdW1/iMukPK/I6Q1mgjgkHJIuX7di
 vpBAaXP+20+ZNBmE6dgOTjg0pm45olQS4EN2ZfZCtfF7fv9DJGUCMw==
X-Received: by 2002:a17:90b:3ec3:b0:327:9b36:87cf with SMTP id
 98e67ed59e1d1-3279b36897amr11823635a91.30.1756498018303; 
 Fri, 29 Aug 2025 13:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzMPgOWkW3Z/4cS8GAbpm9n7G+CRS0xMZOkYARj7xvIwczkHhobX9mgYoAfwIenaYfThB81w==
X-Received: by 2002:a17:90b:3ec3:b0:327:9b36:87cf with SMTP id
 98e67ed59e1d1-3279b36897amr11823606a91.30.1756498017874; 
 Fri, 29 Aug 2025 13:06:57 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:06:57 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:32:00 +0530
Subject: [PATCH v13 20/27] migration: Return -1 on memory allocation
 failure in ram.c
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-20-a4e777b7eb2c@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=armenon@redhat.com;
 h=from:subject:message-id; bh=LbrL/8rC1j/1roMz22wMr5Cto4+KiN2vW7a+UxDKaz0=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdr8jL2r0mK/qrVDmvbC9yLNL/Kc7f3X+b+HDQobhe
 WXa/lc7SlkYxLgYZMUUWRq+Bsg2BRRGRNq+vA4zh5UJZAgDF6cATOShNcN/v8883qyLDXu2fly7
 76prgU3L0pl+rKd92cpPB2denJk7mZGhU3x6wwTVXzfMX51/dt25ozXgnUGPVp5Qu0XU1NW+67L
 4AQ==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2FBqkiAK6ppP4Q7C-AumozjrrlFcicFi02zFNngk_3g_1756498018
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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


