Received: by 10.223.172.38 with SMTP id v35csp1406522wrc;
        Tue, 5 Sep 2017 06:12:41 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5oQPldpr96nJjEmFh94TV7iAKU4bqZodziuhYQTGJeR4Uy3ldU/9qihIW+fNrDQjLBQFqg
X-Received: by 10.200.49.88 with SMTP id h24mr898606qtb.335.1504617159010;
        Tue, 05 Sep 2017 06:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504617159; cv=none;
        d=google.com; s=arc-20160816;
        b=Zd5xg0wciSG4kdZ4peBU9MTm4taC8eoedSQfKomJRsopREADaYN7kJG7EAurWYX4P0
         pwhrWiVPNZMqGedobT2ql0/FRh7dm72Ol8plkEwJQPEcIIzqIT46vA3ObccLxLRDrI8Q
         EA/XCejzLecPYHITXLBvaQc9N8fr/aWt6ZiPmqk/sExqqlnfegBcKjsRB4XN8Vm9Rlp1
         GaNg8kc/PI3sFa5UiEOxmo3U73x7ULAQId/rpGuyspkTDDXKeYyW45FM/x0srCUb4Klv
         EgQHoqq+PloU9ScTDAQFL3FiNDC+zSC6iqbkCdkcAZWa5OLs5LAU5fIw94ta9lUaAVEG
         XrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=Z5CpixQANV+MJqWzQqCZIeX2kAFGOh+P1uBZ+xz7RDQ=;
        b=rC25MVGnQ55JAqj8J87J6OwGssquq/gqSGC7kLAF8paA7107mUuPgqwEOeyWrmdndQ
         hax9qn5Ue/B8d12iJwunAIQ20a0oIWN1gEP3N+7Vd+YvH/qqONuQY7YZVoTVU/sPRea8
         rH9wwQnVgsYxIHvcCyi5LwXd2vPZjJFYfqbUMtK4JMq5ccn3u/rojyDqhVhYIiO1K7GL
         peYOq3JtPZYb5Evh00jkEZYTkW/h4wTcxNUWEKYFfMcxVylLB9abm/0uK5am8AWehurM
         MYpVU6aqz96ZVBJ1E3YJO6eluZ32d0n411sZYVm0mwj81NhhBbcgSYLV8X/2MEymwMvh
         o4yA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f13si249411qth.49.2017.09.05.06.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpDee-0006tQ-NC
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:12:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDeC-0006Uz-69
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDe2-0007mT-Kx
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpDe2-0007lP-FQ; Tue, 05 Sep 2017 09:11:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BF5490156;
	Tue,  5 Sep 2017 13:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8BF5490156
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6CE77FB9D;
	Tue,  5 Sep 2017 13:11:55 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 21:11:45 +0800
Message-Id: <20170905131149.10669-3-famz@redhat.com>
In-Reply-To: <20170905131149.10669-1-famz@redhat.com>
References: <20170905131149.10669-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 05 Sep 2017 13:11:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 2/6] armv7m: Convert armv7m.memory to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rl371rLre40M

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/armv7m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 4c560dde56..b64a409b40 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -132,12 +132,6 @@ static void armv7m_instance_init(Object *obj)
=20
     /* Can't init the cpu here, we don't yet know which model to use */
=20
-    object_property_add_link(obj, "memory",
-                             TYPE_MEMORY_REGION,
-                             (Object **)&s->board_memory,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
     memory_region_init(&s->container, obj, "armv7m-container", UINT64_MA=
X);
=20
     object_initialize(&s->nvic, sizeof(s->nvic), TYPE_NVIC);
@@ -248,6 +242,8 @@ static void armv7m_realize(DeviceState *dev, Error **=
errp)
=20
 static Property armv7m_properties[] =3D {
     DEFINE_PROP_STRING("cpu-model", ARMv7MState, cpu_model),
+    DEFINE_PROP_LINK("memory", ARMv7MState, board_memory, TYPE_MEMORY_RE=
GION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.13.5

