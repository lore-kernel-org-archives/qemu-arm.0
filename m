Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp878589ejb;
        Thu, 26 Oct 2023 23:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVUFttp0FQLdtx7eMcCtHpMFpNZs0JbA6h7ItlXHlYdw+nNb01JbIyGw3CVjqdlK3qOyNU
X-Received: by 2002:ac8:5a47:0:b0:41c:cca0:171b with SMTP id o7-20020ac85a47000000b0041ccca0171bmr1980739qta.32.1698386852580;
        Thu, 26 Oct 2023 23:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698386852; cv=none;
        d=google.com; s=arc-20160816;
        b=PjOz8puZ8Op1m68pwtxEKf9VVFimPPpqOlVf/CVj4Ks45Q57ZqbPOUQCrXzQi/+Gwy
         Jwz3XYNqHsBIv1BJNDqziCovJ3BIaGoibuiePBTGfn6A+brkS1Lx1Z1ezULYnROXq3NF
         zVRU3vZ9taloJm9eFJUbHcf+izL3DYljyAO1c+Y4eYr1mK4CfaFC0DsUmqxvmviXFyfL
         /4sTzftrY5HhDQT9/uvvTAd6ZKiFJk+Rhh1oAA/oYQjp+vtnPvKSFLHgdJUOSaE3hJii
         Ul7M9lS7iUP88/hxX/JjkDnZ+5zT1x/7D5/yqcR3kPbkDhtadM3oIPMpxnPUNNhTHMlJ
         DlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vzLepVbCar0JkiTW9XVwgKL2r1EV7yOeGtAAEZPis0Q=;
        fh=qGUyRo0UIMpHkwOq0Lcr+v2qgCuc70tZpkITjSw4Vwg=;
        b=02+XmULjVf1cXr5dz/hSTZ22+5JThQtElrUMifzCAhbGxFKoULyiMlcjT/c1H+YGio
         t114t+hNR9AHvyIZjlIiOHt21uIj/8FGKDuqLwWZmRlTsKLlru1HrLd1q3lEWhsCHadG
         TOmseNeYwjsdc0JDf9TOqj02UmmEStVHDy8V6ZSNpQ5FTKzG/hc19COxZuFLUcBEkvGL
         yEUvMxjT7zUK5ZAbbyJ4vL+WLLdf0XEY11FgsiH3irf6zmZyKQcmWgMx8YOgl22ilxB3
         5dnE6Q4p4QHotf7WjaiD0UVl/X6XeXnV2fNBONOKnA+fNmQOk8lsuBn8dRYlqfXm4rJo
         MpzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J4DdPxAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a05622a03cd00b0041989dab884si454247qtx.77.2023.10.26.23.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 23:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J4DdPxAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwG06-0003Vu-TL; Fri, 27 Oct 2023 02:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qwG05-0003VV-EW
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 02:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qwG04-00088T-37
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 02:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698386835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vzLepVbCar0JkiTW9XVwgKL2r1EV7yOeGtAAEZPis0Q=;
 b=J4DdPxAnz2WGec+OxemCZP+o7qpZ++7tUAIpeOk5g7ueZJNtvpjS/ztAx2jvfKO/SjgsNP
 AF5wMIeB6tCJeQmopvK4xeLh0hz+hf0eTmGPz0zUcLdWi0Szgp2jCP7SA+gPJzQcYu8PgL
 4RazbLabVSjS2IbZ6AQO0FB3/Ku9l+s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-124-tplu8pV3NviObdC7dTL7CQ-1; Fri,
 27 Oct 2023 02:07:11 -0400
X-MC-Unique: tplu8pV3NviObdC7dTL7CQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 122253C0C899;
 Fri, 27 Oct 2023 06:07:11 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24C142166B26;
 Fri, 27 Oct 2023 06:07:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Make sure that gicv3_internal.h is covered, too
Date: Fri, 27 Oct 2023 08:07:09 +0200
Message-ID: <20231027060709.242388-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 81MB/VpfkIpq

gic_internal.h is already covered by the "ARM cores" section.
Let's adapt the entry with a wildcard to cover gicv3_internal.h, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d54c6fc2b..2c4126b63d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -700,7 +700,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/intc/arm*
-F: hw/intc/gic_internal.h
+F: hw/intc/gic*_internal.h
 F: hw/misc/a9scu.c
 F: hw/misc/arm11scu.c
 F: hw/misc/arm_l2x0.c
-- 
2.41.0

