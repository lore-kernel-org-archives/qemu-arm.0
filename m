Received: by 10.25.44.15 with SMTP id s15csp4048952lfs;
        Sun, 16 Jul 2017 19:38:46 -0700 (PDT)
X-Received: by 10.237.47.132 with SMTP id m4mr23640709qtd.200.1500259126684;
        Sun, 16 Jul 2017 19:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500259126; cv=none;
        d=google.com; s=arc-20160816;
        b=sX8UXHnaujEWLvjWOJOkDAvSBusu7WDDDIPppHIbSsAMGDAs2sUh5Zh64crlxHVSHX
         l5kiBzyxD1abrQShAhBkqGr6rppKj8ONYpi3jz1ps/VIGkgYAUplnEX1qjW07INgflj2
         Kq5N6QZ7hSkGkMuIlZ45yJGkh/P3k8O6353TGooNmAa65gTYxVN2TbYrafqeFLnLCVCA
         aDnATXExtswDRKY/UstG1sfP9J8wqg+YcJmPH1SSldVwDbFU6vfWb03BjQi84ygOkIW/
         6mxALAsmPD+1UZc+IgkHFIUxmLCFO6MNriYnzlmfBfaHAjM47aPfiqYQaqmluppnjFa/
         3PaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=2/SzxmIMiRuMH9+4MdSqaaJmJFlDx+dAxP4lPV7dCOw=;
        b=Q8yewaxDQu3aNWLqgWJmDpJE48PsmmplDfP6tlDbZdVsr/9i+jY2yU17TLFypKMtZV
         tFWGoBsIsaE4vvD0S6LgaEAlvqpxW9uKHpjfq5Fd6PRxCtK3g98Hw0wQmlc7h6fId3Xf
         CZlrCrD80AirWXFFbvuDtazgMnl9ISVICLVeFVB9/Jchi0zVuCdhbazq9RSTrlseJA54
         Rymj17qW8fkj++OweI9NYSXsxlknUXcd3zFZzvZQgSqh2FjB8eqX04Sz6NM+/q49XwAY
         EW9GW+gY+nsg8GDgXkDpxKn1FpdDowq62gpL663BCmedxi81/t4+0Lcy8UsJTjQXjciH
         raEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b134si9433545qka.123.2017.07.16.19.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 19:38:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWvvo-0000QL-0k
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 22:38:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvf-0000J2-8U
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvd-0001UV-9R
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dWvvd-0001UL-3i; Sun, 16 Jul 2017 22:38:33 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 154CBC049D5D;
	Mon, 17 Jul 2017 02:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 154CBC049D5D
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 154CBC049D5D
Received: from lemon.redhat.com (ovpn-12-94.pek2.redhat.com [10.72.12.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A1C0600C8;
	Mon, 17 Jul 2017 02:38:30 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 10:38:20 +0800
Message-Id: <20170717023824.18796-3-famz@redhat.com>
In-Reply-To: <20170717023824.18796-1-famz@redhat.com>
References: <20170717023824.18796-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 17 Jul 2017 02:38:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 2/6] armv7m: Convert armv7m.memory to
 DEFINE_PROP_LINK
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0WqrR7VaG71i

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 hw/arm/armv7m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8efc4e8..1c837da 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -132,12 +132,6 @@ static void armv7m_instance_init(Object *obj)
 
     /* Can't init the cpu here, we don't yet know which model to use */
 
-    object_property_add_link(obj, "memory",
-                             TYPE_MEMORY_REGION,
-                             (Object **)&s->board_memory,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
     memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
 
     object_initialize(&s->nvic, sizeof(s->nvic), "armv7m_nvic");
@@ -248,6 +242,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 
 static Property armv7m_properties[] = {
     DEFINE_PROP_STRING("cpu-model", ARMv7MState, cpu_model),
+    DEFINE_PROP_LINK("memory", ARMv7MState, board_memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.9.4

