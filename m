Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp293802njb;
        Thu, 8 May 2025 02:35:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUA9CgiBcMHOGeQBf0FQ+R8Yf60rU0ixzu8nWyLQ5zCz74jzDpF3au6H/CVCPMpLtv5gKxefdCtAh73GA==@linaro.org
X-Google-Smtp-Source: AGHT+IEiUpWnzNTN7UlJ57IUiopgjt2M/0oClDDnmVS/s09X53IrpxTBgvrZ4Jkwkh03RPfhsghJ
X-Received: by 2002:a05:620a:1a1e:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7ccf9dff6demr381033885a.12.1746696950453;
        Thu, 08 May 2025 02:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746696950; cv=none;
        d=google.com; s=arc-20240605;
        b=bzrurELqgAWeVQOdnw5OmxnatzJWZJiB3r4vJ25IGMl8TM3WJ9cFxOLeikgJ29Hmyl
         6Dsesn9Trps3PYiEXGvFd09itpzEOtOA/OPvDh8P3DVsoyfgYqWKq6tSYOCevW0X7H1T
         i4Az2w4CqPSIHqEAcVXFVHQMTuYNOWDRpI7+ZsSZwBCaE+KMf1B3o/HykVnYDDR2dlKJ
         nlphuda8ycYNU7C3VD0jpHjDAtNAsonwAtPgqLr2NJCZHX1FEnQs9KDo7618UqU4p8X7
         7O+TkElIMSrsfXsjhzFaRMeNJqUvAYk9LT0uKgdcVnf2Jmvpjnur+TsqJB9BCElb5Ykp
         Z0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eNH+9+7QTXRWk+e3bpZ/v+MuL5PpL0qfimiWv+KO3fY=;
        fh=cp5/pjrGBiOSnVnIYR1qYu8cyK1vwqycjiVaN+zSIMY=;
        b=DEGXFx4gthLc7aH13ml6ohHLcwSjdk71M+V/PRc8891IzGH4UNfV320i/c532g8oO8
         4Q+vXb3r9XiHitTl1g+uPEF67+UiQH2/fdtfJveJjasNiwgSTHKPkgCBIFf9aDq2uXRq
         880pC3R74hMLPE3PHlO4GsvvD5S4RD7okfnvtinR2CqWFxoux8ytb7zikOE5L2TBoOxX
         bHwUFh0773EPRrqqvzR31AADgEFCFqQr4BHo+ruoD1lS/fd3tFTRypUypV/Zr4RXzYu7
         dDyhvz2PFhUufa3hd6G7id7GIVPbZSmnQZ96C083aNYkgBgU03kID8PXrmtQ4ZezvyW1
         +U+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RHFOH6rd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf751f1eesi403750685a.130.2025.05.08.02.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 02:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RHFOH6rd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCxfE-0005Mm-Mr; Thu, 08 May 2025 05:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfD-0005Mc-Pg
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfC-0007ky-6I
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746696933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNH+9+7QTXRWk+e3bpZ/v+MuL5PpL0qfimiWv+KO3fY=;
 b=RHFOH6rdKkcxvV1Dcg5PHAdPCIK06LctIqNsysrS0Kt+SmHKNz1PUUY+3Vj2g7eJxCaEOD
 n2C1ediL+EehR7+a/JP5twUDVKqKB4eyzmdIfpaLXLmdbQGTUcK2MvnMc/HLJzPkZ48m3X
 NebRzVg+k9bhq/rNVfp5+WOr2rHwnJ4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-q_zXvZQgP4eTtxo7Qnb50A-1; Thu,
 08 May 2025 05:35:30 -0400
X-MC-Unique: q_zXvZQgP4eTtxo7Qnb50A-1
X-Mimecast-MFC-AGG-ID: q_zXvZQgP4eTtxo7Qnb50A_1746696929
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E9F2118001D1; Thu,  8 May 2025 09:35:28 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 62D501955F24; Thu,  8 May 2025 09:35:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/5] include/hw/dma/xlnx_dpdma: Remove dependency on console.h
Date: Thu,  8 May 2025 11:35:15 +0200
Message-ID: <20250508093519.144004-2-thuth@redhat.com>
In-Reply-To: <20250508093519.144004-1-thuth@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MJhJJG7WMcISAOqHjt8rd-jCa-OFtzt0Tia5kuWcbgQ_1746696929
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: Jp2cLRXaV5bs

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

