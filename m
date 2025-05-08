Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp471188njb;
        Thu, 8 May 2025 07:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYSNXPbN75I2+LMJTj9eqSv4rxUQmuSP6EIrLuEg1UFsY9JMo0Y/r2rA6rWIYsEn886X2gaJRxYPdbMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFcOqVon0pp85AgKIBpXG8RTVWOVPB1PTNN8oTcYIt0k8l2esbsWyL3RMpIl0bemjr7C10L
X-Received: by 2002:a05:620a:40cf:b0:7c5:95b6:b40a with SMTP id af79cd13be357-7ccf999a82cmr546422485a.27.1746715350422;
        Thu, 08 May 2025 07:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746715350; cv=none;
        d=google.com; s=arc-20240605;
        b=TCitWb0fgVLuqrSLYnwyJBjwRBFmNXaKvwBqCt9yENaxcHQweKrOA55q8Oq/XISy6U
         ADEjg4HeNBCiIdO2YzaIGLa/nT4X6jRg9swGABp9W3JfX5MV7PegQRj2S3r44wLPrhbC
         Gh4mL7FRm7T90CLh9ruclB18z9s3smXPBEftdoakJs//kTHAPAbSksR2qi/prDGpknqM
         7Nvmw9ydeilEh9oFPWlY6hy7rz/AuhuMrGHhVlvFNTLKZk49D/z3C8+RfE+ekFT7zdYo
         sL8jAAymE/O7TClLXkZpfG0itmL+9R5Lkcf0EUYOORHhREPWYaUD04WMMXqpiLer2qXo
         fdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O8Chei4hG47ktKgHJke9aTE1rPVeODLyzcx/ix7iQCo=;
        fh=mV1hj/g4izUEtI00kKHr/+DcS8Ht1XYt/8wmIYnJvQU=;
        b=ain23PGOkOynGimm/MXRwilIdV9xKDtiagO9KXrglRZvjOi7nMvjPeHuepomR8GbeP
         +aO06vrhG0nEL1pSNVVwk+Ki3mPXqwvh1m3b1aVnc8+Fl547fKzLrBQBVi+UukVjohXl
         2+SN752en2LBii5tTaD+rDp2wUQVAKu7uy2k9S423OiaBO8FTLHlNXKMcmpmpSLmQyHk
         0MHNa4rxLqFGwZobQaDz5NZcNrTst6rcgCGUnvEH7x+5A46vfUWAK2V7kgbt+uw4znmf
         AU8QHkDwWu88H9ABzho9o2DEx2SCS55pP4SUTykge1l6SDry+iZDw9hXU7VLQflhI2sT
         SFfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IRv4AojY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f6825fsi1283385a.172.2025.05.08.07.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 07:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IRv4AojY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD2RZ-0005dv-AC; Thu, 08 May 2025 10:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2RU-0005c1-TK
 for qemu-arm@nongnu.org; Thu, 08 May 2025 10:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2RT-0004yv-5Q
 for qemu-arm@nongnu.org; Thu, 08 May 2025 10:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746715301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8Chei4hG47ktKgHJke9aTE1rPVeODLyzcx/ix7iQCo=;
 b=IRv4AojYks701jmN9S2LyRvClW0xIaLZah4NirpUSlUnyfWfXCGd3zqBohDdCFp1RsI/7p
 fbKO/ZvtdotXC+iZwpDT9Joei2HaFDAZSVjC+kqFCjDOK5op0DfRyE24SlneMaTyGiiq+F
 A/GO4JnoQFSO+Ivob4UrVI9YHkelqjE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-EkVXID1AN6mtTnRAds5fsg-1; Thu,
 08 May 2025 10:41:37 -0400
X-MC-Unique: EkVXID1AN6mtTnRAds5fsg-1
X-Mimecast-MFC-AGG-ID: EkVXID1AN6mtTnRAds5fsg_1746715295
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A55A3195608A; Thu,  8 May 2025 14:41:35 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 36E5619560AD; Thu,  8 May 2025 14:41:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/5] hw/display/bcm2835_fb: Move inclusion of console.h to the
 .c file
Date: Thu,  8 May 2025 16:41:17 +0200
Message-ID: <20250508144120.163009-3-thuth@redhat.com>
In-Reply-To: <20250508144120.163009-1-thuth@redhat.com>
References: <20250508144120.163009-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KGbXUZb1Q3Lo

From: Thomas Huth <thuth@redhat.com>

The definitions from console.h are not needed in the bcm2835_fb.h
header file yet, so let's move it to the place that really needs
its definitions, i.e. into the bcm2835_fb.c file.
This way the header can also be used by code that is not compiled
with the CFLAGS that are required for pixman or OpenGL (in case
their headers do not reside under /usr/include).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/display/bcm2835_fb.h | 1 -
 hw/display/bcm2835_fb.c         | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 49541bf08f4..acc9230b6a8 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -13,7 +13,6 @@
 #define BCM2835_FB_H
 
 #include "hw/sysbus.h"
-#include "ui/console.h"
 #include "qom/object.h"
 
 #define UPPER_RAM_BASE 0x40000000
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 820e67ac8bb..1bb2ee45a01 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -27,6 +27,7 @@
 #include "hw/display/bcm2835_fb.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
+#include "ui/console.h"
 #include "framebuffer.h"
 #include "ui/pixel_ops.h"
 #include "hw/misc/bcm2835_mbox_defs.h"
-- 
2.49.0

