Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp471212njb;
        Thu, 8 May 2025 07:42:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSi7F3HrA+io1vhZFHuFJ6iTtmq7PFF6Ey6d0f2lZ+Vu+zbIv6V5SX2OceG89isTwCBQjOiwkAtYQXrA==@linaro.org
X-Google-Smtp-Source: AGHT+IGmd+9bwwiDY2ffneoJNZmveseQszSn7J6tX1Qhsm+qq1FA2vsHFCQTGYy6gniy7SADFkrC
X-Received: by 2002:a05:622a:48a:b0:48e:5cbc:bc6 with SMTP id d75a77b69052e-49449299251mr59747221cf.16.1746715341016;
        Thu, 08 May 2025 07:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746715340; cv=none;
        d=google.com; s=arc-20240605;
        b=eojNhscrRB/ZYNJQVkLST1ifgYD/O77ryN8CcOYw/6sI+XWYsX3a5rJHAOPT4Nuqv6
         Pmm/jMeLQ0sNtmhTjpmBodR99/PSziPMCL/XBbLFUguoOeNqNRFiiUtsEHyBWy6qRv9E
         a+X+0gBQA7jtp//pwID77aABQUGWrvfdLoB2+IJuvSCNLvXO2cQOtX3xQa1QWl13N8N+
         l8imKGNF7+RXI9uuVD4Z51a6cv0VpuzFr28pNClzz+Tvq17tvgbjthy5Bj2xkrpkqqf3
         mPjNXNd2/+VKd9DB8vvatlkLU7oeUcADlQchCBqYo6TirSSfC8tfl5YqeI6vlCellgFf
         ih/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eNH+9+7QTXRWk+e3bpZ/v+MuL5PpL0qfimiWv+KO3fY=;
        fh=mV1hj/g4izUEtI00kKHr/+DcS8Ht1XYt/8wmIYnJvQU=;
        b=Yy4F7z4qcYWHWZGJNHhPojnGETRljOctNLqScgtj+aJ6vb4/Zs0QqjiCVUbmfNH557
         kt4O9SoYuzzJtuHzyOLfXikCINm7bbOr9UApkVnbl4K2noYsuDKm4g/UPRxwRAFEnR3t
         2+6k8E4TZ8zokgCw0u+DgT1UgqPrCVjBTeZnXtN4BTEmPb4PePylTlOWwm5nkJLk1u48
         DCDKHEfTpiA7QaUpnQTv0/2lHkNxYXgZRvE8cCtVZCXEJ0vKFao8u7Tep+PXVtebfUhA
         D9j47lGsh8HbzNmPfnDFa9U6AZcQ2S7JEbW1BumihS6Iy6z/UhdYirOw2M6TD40MppK6
         8m+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VHl7AjuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49222d9f6ebsi45458851cf.439.2025.05.08.07.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 07:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VHl7AjuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD2RR-0005Y6-1c; Thu, 08 May 2025 10:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2RN-0005Wm-0O
 for qemu-arm@nongnu.org; Thu, 08 May 2025 10:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2RK-0004y2-RC
 for qemu-arm@nongnu.org; Thu, 08 May 2025 10:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746715294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNH+9+7QTXRWk+e3bpZ/v+MuL5PpL0qfimiWv+KO3fY=;
 b=VHl7AjuUbe8/ptW8pzk3OFW2MQ0dTwZO8Pj+yLPHvAZA9onjAlIuqtgRPdGlGBRBauVrW+
 jna8ftUEsMryjxwGBm60zWV2Kr9tonOYWT2hrpX3zLDo/+rgjnuNBUVJWkx7kxfZLYHH8n
 vv+xjS/3DeR0T9UnYiygsub88+3loEM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-Ed3tA8PePQGQViqNanhrMQ-1; Thu,
 08 May 2025 10:41:32 -0400
X-MC-Unique: Ed3tA8PePQGQViqNanhrMQ-1
X-Mimecast-MFC-AGG-ID: Ed3tA8PePQGQViqNanhrMQ_1746715291
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AC7BE1955DE7; Thu,  8 May 2025 14:41:31 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F1CF219560AE; Thu,  8 May 2025 14:41:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/5] include/hw/dma/xlnx_dpdma: Remove dependency on console.h
Date: Thu,  8 May 2025 16:41:16 +0200
Message-ID: <20250508144120.163009-2-thuth@redhat.com>
In-Reply-To: <20250508144120.163009-1-thuth@redhat.com>
References: <20250508144120.163009-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VgFDz7lPPHlp

From: Thomas Huth <thuth@redhat.com>

console.h brings a dependency on the <epoxy/opengl.h> and the pixman
header file (if available), so we should avoid to include this file
if it is not really necessary (otherwise we have to specify the
dependency in the meson.build file, too, to get the right include
paths everywhere). console.h does not seem to be necessary for the
xlnx_dpdma code, so drop the include here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/dma/xlnx_dpdma.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/dma/xlnx_dpdma.h b/include/hw/dma/xlnx_dpdma.h
index 1ec0d265be2..484b2e377f0 100644
--- a/include/hw/dma/xlnx_dpdma.h
+++ b/include/hw/dma/xlnx_dpdma.h
@@ -26,7 +26,6 @@
 #define XLNX_DPDMA_H
 
 #include "hw/sysbus.h"
-#include "ui/console.h"
 #include "system/dma.h"
 #include "qom/object.h"
 
-- 
2.49.0

