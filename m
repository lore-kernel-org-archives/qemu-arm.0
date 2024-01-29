Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp26497ejk;
        Mon, 29 Jan 2024 00:18:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv342LSwYaHhCnM+jIOP0TCfqHgsqpOSi/OK60xHdf/KvLLYqJEg42lHUWN1doPawmpUYV
X-Received: by 2002:a05:622a:1192:b0:42a:758d:b1f8 with SMTP id m18-20020a05622a119200b0042a758db1f8mr5960497qtk.71.1706516334978;
        Mon, 29 Jan 2024 00:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706516334; cv=none;
        d=google.com; s=arc-20160816;
        b=anHey6UTpqkwy0gqZUJDMo8bO++xO+mq6K+4UwQbFJKnCghdn/WHqJ2cZ0278rAmBd
         lNec77Rb25AOqgLEZ8oEHeRptUC6B6hBn9+D+YVuM6nkligSFbXHPDy7swUi4y5RtVQP
         b+R5CzLDehgJ/PKadGt6bf1WrrzdkG378C3N1tzFgV3RdlTEx8bcDc/RX6WzxftLRY1q
         LA14MYtgFGI7PXhOAVrSjreb5Z6Gzmz9X4nN7mizLDE9YGI4eXEcNpTxYcUbn+M8E+66
         I05o6sYKIVOfVE5oM/NI/4Nw9J82VboWM1LaRqRDcoVoGtMZdm3h9borhM/+7+axC/I/
         5X6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wpCHFQ+Q7ZokEYTyUg93u3zevpKOJQR/LQ1ziXupeeA=;
        fh=4MFjWk99T14cOfrd/QAZZe1F8g1v4KV8Ub1F9CwTKmk=;
        b=bdhLzoQy2gBlct/Fy5RRrsroqaTx/sV1Kk7UpM7HsrZMpyU4cdrCz8DQSebOG5Gk3Y
         COkhzpssQlBrly4Bu79h1sTpnN94hD5ebWRJa30+1ITr1Aawghfd8xQPQmlMVv05G4gl
         KQNgha5eTzM7R4iyl4rw0b05v1OAOi0tB3M1Q6EyXhg0w6+sj8xazNnVktKPOb4copym
         CO/WwK0WFX+oNwybYM1f802PLuv9HZ0b5+BR/3ycJj6veIZy722+36IJxPzmUJJR1PeK
         mW8U8gXhi3nhQ91/WtPj00rY7dChC8p6gJnbFb9+2FGEHWWoCp4+jVh9CgnYWoWj7jH/
         Fn6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B58FPhwM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020ac8590b000000b0042a68db5a31si3357656qty.27.2024.01.29.00.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 00:18:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B58FPhwM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rUMqx-0006wX-OY; Mon, 29 Jan 2024 03:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rUMqw-0006vl-Lu
 for qemu-devel@nongnu.org; Mon, 29 Jan 2024 03:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rUMqt-0008Ru-Cu
 for qemu-devel@nongnu.org; Mon, 29 Jan 2024 03:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706516326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpCHFQ+Q7ZokEYTyUg93u3zevpKOJQR/LQ1ziXupeeA=;
 b=B58FPhwMyG2eTPQFxgDKvefvamzckg30AZnhkdvkyDu9PTFMH9yGF+nbcG5dr9iCMWEfdC
 cDbR7HstzCStsFzfzMHcw653p8OeTDGlDxlYNsKD/KJeFcu30Jc/WZLRcKhd0gqIOMbaNL
 kOwa8a4ZF9CMPJpr+/zqbZTI1FzdIVg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-zctl31K5NWank48yFX-b0A-1; Mon, 29 Jan 2024 03:18:43 -0500
X-MC-Unique: zctl31K5NWank48yFX-b0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CBF3859703;
 Mon, 29 Jan 2024 08:18:43 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74DCE1121312;
 Mon, 29 Jan 2024 08:18:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/3] target/arm/tcg/m_helper.c: Include the full helpers
 only with CONFIG_ARM_V7M
Date: Mon, 29 Jan 2024 09:18:34 +0100
Message-ID: <20240129081835.137726-3-thuth@redhat.com>
In-Reply-To: <20240129081835.137726-1-thuth@redhat.com>
References: <20240129081835.137726-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.485,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MDhM/ai9apSM

If CONFIG_ARM_V7M is not set, we don't want to include the full-fledged
helper functions that require additional functions for linking. The
reduced set of the linux-user functions works fine as stubs in this
case, so change the #ifdef statement accordingly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/tcg/m_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index d1f1e02acc..a5a6e96fc3 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -22,6 +22,7 @@
 #endif
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/intc/armv7m_nvic.h"
+#include CONFIG_DEVICES
 #endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
@@ -69,7 +70,7 @@ uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
     return value;
 }
 
-#ifdef CONFIG_USER_ONLY
+#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_ARM_V7M)
 
 void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
 {
-- 
2.43.0

