Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp243997lfm;
        Wed, 24 Jun 2020 01:44:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzns9Eive1p72LVRNnLkBmZojpeuFKEigSzzBUCzRhfwdfsVHlBLHLE/7VNSrv9v/05TZkS
X-Received: by 2002:a25:880e:: with SMTP id c14mr18286520ybl.376.1592988256257;
        Wed, 24 Jun 2020 01:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592988256; cv=none;
        d=google.com; s=arc-20160816;
        b=KcBwRxAuwGLzygULfQQEYsdG3JGD4ACKi2eVW157UtjVF5+ZYy1l8hviH2sTH2UaDH
         XFTmBwoylxgorQA37YOCl9lN7bYLU4NFijolZbQMwWxVfEznysJEtckP7zHLfofN1bJk
         fvCz6aJKFhH3Jow9SgY7IN6hhEQNwe24QBSGyAefj2rni9oMm/eLRlnSAFGuF+iRlbA/
         rrYc7scX1DYMitOeBefcZp5Qbp4iO84Ai3i3BZCEaw6zhA4Uw5Iz9u7Tbdl+Uk/3xlu+
         lumrtVDkLe8NTon0wsBBZkoMiDa3Kkmh0JkYxe8xeuhzut06HpNkYkboWS4dgMGyW7RZ
         8wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0Qr72sm631JF+RrTWNdiQ/mUb2qKvf2TxUupv/c7kvg=;
        b=ybfp5GQQ8MNusIM8u1ss0wrMoTZ1eUVJ3DuymfuUf5uCn8aiDq1lR+wfapAxbv95IL
         Ev839yGMoZbZKuwHPIMFDu/HqBmtYyrTiv2iuf6zSmff2zsjPsP6z01TMuJaqLOhinEf
         sr+eVTLdZ/M5SK/J8r2JjaJxk5V3AkcR9MI2hj3YvCmXfhO0hj7zOHBLvLMcnom3fcdh
         IiK7BOvVX650FzTgvs90DHDCjz5p8iJqJ093LMBWbhpHGCmMvbzNZRndQEy+1sIqsMCf
         S89Ikx3Z0SyueAC9185pAUTbkme4CluSNmsN938cUXnpaCW+M8PU/ow6OwZxAYiXx6/V
         AXtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="f6U/+4W5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si17718041ybn.352.2020.06.24.01.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 01:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="f6U/+4W5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo10x-0004gz-JQ
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 04:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0up-0000wL-Sj
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 04:37:55 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52115
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0ui-000275-BO
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 04:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Qr72sm631JF+RrTWNdiQ/mUb2qKvf2TxUupv/c7kvg=;
 b=f6U/+4W5E835YR+vc9KLXodJgOZQ4iBGTTzFcbl2LwgFzl6r0cfZ4pP11rBKZP3lzcfnS6
 liFqUGvGQ+glDXLrZaIUrIy4vsH5YOOlYFgVY2njasFEXk5bKv4BeUwL/tK24/C3EU00s5
 AxEQ2BBS/QHAKY1eVXUaY5MHp9oYY3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-zlobApVxPHulYoXF5VVkTg-1; Wed, 24 Jun 2020 04:37:45 -0400
X-MC-Unique: zlobApVxPHulYoXF5VVkTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27DFC107B765;
 Wed, 24 Jun 2020 08:37:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB66E1A836;
 Wed, 24 Jun 2020 08:37:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CA9B91138484; Wed, 24 Jun 2020 10:37:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/25] arm/stm32f205 arm/stm32f405: Fix realize error API
 violation
Date: Wed, 24 Jun 2020 10:37:34 +0200
Message-Id: <20200624083737.3086768-23-armbru@redhat.com>
In-Reply-To: <20200624083737.3086768-1-armbru@redhat.com>
References: <20200624083737.3086768-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f17PPyMxC7Q8

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

stm32f205_soc_realize() and stm32f405_soc_realize() are wrong that
way: they pass &err to object_property_set_int() without checking it,
and then to qdev_realize().  Harmless, because the former can't
actually fail here.

Fix by passing &error_abort instead.

Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/stm32f205_soc.c | 2 +-
 hw/arm/stm32f405_soc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 19487544f0..56aef686c9 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -154,7 +154,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
 
     /* ADC 1 to 3 */
     object_property_set_int(OBJECT(s->adc_irqs), STM_NUM_ADCS,
-                            "num-lines", &err);
+                            "num-lines", &error_abort);
     qdev_realize(DEVICE(s->adc_irqs), NULL, &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index c12d9f999d..cf9228d8e7 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -172,7 +172,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
     object_property_set_int(OBJECT(&s->adc_irqs), STM_NUM_ADCS,
-                            "num-lines", &err);
+                            "num-lines", &error_abort);
     qdev_realize(DEVICE(&s->adc_irqs), NULL, &err);
     if (err != NULL) {
         error_propagate(errp, err);
-- 
2.26.2

