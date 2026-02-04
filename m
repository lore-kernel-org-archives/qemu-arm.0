Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8066AEA7944
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Feb 2026 19:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vniAX-0008SQ-AK; Wed, 04 Feb 2026 14:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vniAS-0007n3-Py
 for qemu-arm@nongnu.org; Wed, 04 Feb 2026 14:04:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vniAQ-0007xQ-Du
 for qemu-arm@nongnu.org; Wed, 04 Feb 2026 14:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770231837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pDLl0CipBDb5NTwlLQHww8+blGdI/WR9oxHWsPKmF9s=;
 b=BoIfOLGvopwLL/pyojEiSx3aKPVJIa9/GgsO1fOi7D/92BEhZiqNovwy8enH9qJI/4OBgR
 qKV+lYYsCq1aFZN/QlJBrP5dPWr9iyJuzV4PJAgLOQzVX0aXzY66UY8vpYzbGmJNt6wyXo
 sGTXcGQRqBjlgPwa0JUxRKT9taYd8B8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-QiieXfrDM_mWVzAG9zmiGQ-1; Wed, 04 Feb 2026 14:03:56 -0500
X-MC-Unique: QiieXfrDM_mWVzAG9zmiGQ-1
X-Mimecast-MFC-AGG-ID: QiieXfrDM_mWVzAG9zmiGQ_1770231835
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48057c39931so1465925e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Feb 2026 11:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770231835; x=1770836635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pDLl0CipBDb5NTwlLQHww8+blGdI/WR9oxHWsPKmF9s=;
 b=tzUY8TrRckCatTJa4SA9oXX99xf527Pb4JErrQ45525tLCxil3LxNIVLcY7Sjv/9Nk
 IV/SGN2lH9pSEqkv0hV3oQGZ73R6GRjPFaaL3YAi4OEnvVaYtx6IW010JZ4Quc7QjTNi
 Xgr810T5yXnd5rXEQjhKXto8JFgvQX8Kg3ndBUMxKeGW769/8lb3xSkbhLOp7+RokGjT
 Uw71Z+UDocyGzi1H1iFmcgOv4oy/oxD3FNHa2/ZE4AgE3hXzadpQfzvE7jqpf8pV5Whm
 OE1oLNXNciXcqOhvLUSYbXV/oBTnXYFjZ9r3DgDw9aSmtasaBTe7UomDPKUU8YaZYrhB
 Vrgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHhUey80NRBBrvjP/lqztZSMHfD7vJuG1hc69iHHmRL66olJoqbjeuLVVmO6fsfqjQGYdVfj5HEQ==@nongnu.org
X-Gm-Message-State: AOJu0YwQ3fyJYL8tCoc5Zt47J+Xu1MVAm+fUZReaGMvXzWba2N+jWOrl
 d8cE0iWaUIxH9HAHKb4BPxK2RfdMfl9VZ7c8o9FczQX4O1fCRNqSb7sG7PUT+cJs32GnRp8V/O+
 3qBTLxeJXgefiTSGN1A9vS2UnFt6sHwSJFwbILaT2Qd/zmjtAYePlRQ==
X-Gm-Gg: AZuq6aLXXhoGTNa6W+o35fhstc+PxFq6lja2LpIOIJp3CwSz3qQo8vGrqjyhcrNFRyh
 H+ntk5jgNJ4uYYutGaihtLR6fYVwyqyKNgHMSxuXnaA0H3pdH/bk7zJyRDgzJzCNRZIHDlqMmm+
 X4mkNcbpxeRG6m2nlBo8WcjD2UXzaDxfwugEKN6xOvurg+fS/yM3fqNVwFPSqZodqbgQUx1v2PY
 xnqRhNFQng1vSpqQQA2eOlnZShSq1ohyvZHyHLTJJeqkRYf5cwZ8bPtnYDOg4dSXbObuOqv3HnJ
 arOQT8zdhhP3qHKRQQhedgLFucmoPIzeg3rvutbBJWhdcdtGWuk24vjAF7+x82OebTKYoGAFH9U
 M1qWNZ7ZeAs3NgI1ieSotukZvyaGKkQNa4A==
X-Received: by 2002:a05:600c:6087:b0:483:a21:7744 with SMTP id
 5b1f17b1804b1-4830e977f1cmr52879785e9.26.1770231835313; 
 Wed, 04 Feb 2026 11:03:55 -0800 (PST)
X-Received: by 2002:a05:600c:6087:b0:483:a21:7744 with SMTP id
 5b1f17b1804b1-4830e977f1cmr52879395e9.26.1770231834923; 
 Wed, 04 Feb 2026 11:03:54 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805fec6sm7965375f8f.32.2026.02.04.11.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 11:03:54 -0800 (PST)
Date: Wed, 4 Feb 2026 14:03:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: [PULL 28/51] target/arm/kvm: Exit on error from
 acpi_ghes_memory_errors()
Message-ID: <afabd70d34547ea812cf2094917cef83dae85843.1770231744.git.mst@redhat.com>
References: <cover.1770231744.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1770231744.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NUhsNL5qXgEVMzd8DNkCq2D2Coc4YHhLwW4bPC78yzk_1770231835
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Gavin Shan <gshan@redhat.com>

A core dump is no sense as there isn't programming bugs related to
errors from acpi_ghes_memory_errors().

Exit instead of abort when the function returns errors, and the
excessive error message is also dropped.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20251201141803.2386129-4-gshan@redhat.com>
---
 target/arm/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 0828e8b87b..b83f1d5e4f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2477,8 +2477,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
                                              paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {
-                    error_report("failed to record the error");
-                    abort();
+                    exit(1);
                 }
             }
             return;
-- 
MST


