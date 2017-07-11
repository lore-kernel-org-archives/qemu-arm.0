Received: by 10.25.44.15 with SMTP id s15csp5022491lfs;
        Tue, 11 Jul 2017 08:56:04 -0700 (PDT)
X-Received: by 10.237.51.70 with SMTP id u64mr752817qtd.211.1499788564410;
        Tue, 11 Jul 2017 08:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499788564; cv=none;
        d=google.com; s=arc-20160816;
        b=HxC5JhM8ccb5T29ruFyjDFE5zBEU3WpMC+UmO0RwcZOA2vhQTURzzU9V3dqpZ0j75I
         5T2Qq3kTYJUxTiVh1FmwrKbt4zOnAef+Niyf5wUF5l06STZwDt3lqFFwhf+bv5kTiGNG
         wJLWrZiJ9iOriyPp31wDcs0nVyoUvLQqJWKIOZ9MWCkWoSxTySgiOIAQwBGS7VnxOb5o
         3uQ6QBSpiFs8wEVaKjVrx2+GI15P3Tzq8yLwPO0hsMSqzKDndsVMtHOShGGcRYVNxk3Q
         PN3bZQPVUUqzgqu106JntD37xWEAXadrRhQpYqSggNgcWyHtHqJ+nTXsVdYT/or9luRO
         Kj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3hpTiMdVrnxhfi/BhMzOdQcqOQjBwcmmC+IZzF5BL6c=;
        b=NLS0QG9xJBr2XlC9XzWl4pEgo/SHhpICEJ4Hq8+3Ws5+nH0UatNOIrAtY45ypIm5oZ
         qKeATOYlTV/8C1CSpFsfF1+4szIM2YrEuQyfOoMOavKWR8F0IjBHwK8qnhN+LTp5O926
         EnodhXljpEqSsYKheV/Ng0b5VXokuy9yxaOSh1849jjT+b1jbUR73Lc0lM+IpyOP0HhA
         JWtMMvArSOGxZqINcr9XsTeG27Brdu4Z25ag3x3ypnfSosdDBgKDz56Bx8z/wn/fyFh2
         BZER2tQFdQLVYVB8dZi0VkVV26Yy016wjN7at52X9Dpx4fjxMcEs6pS/SR33T2IMfAiS
         6+nA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 96si245974qte.300.2017.07.11.08.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 08:56:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUxW5-0003SS-Qi
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 11:56:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUxVn-0003I0-Da
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:55:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUxVk-00078v-AW
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:55:43 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:48438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dUxVk-00077Y-2G; Tue, 11 Jul 2017 11:55:40 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dUxTd-0003Jz-GY; Tue, 11 Jul 2017 16:53:29 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jul 2017 16:53:26 +0100
Message-Id: <1499788408-10096-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 81.2.115.148
Subject: [Qemu-arm] [PATCH 1/3] qdev-properties.h: Explicitly set the
 default value for arraylen properties
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CDaUbv09LQDa

In DEFINE_PROP_ARRAY, because we use a PropertyInfo (qdev_prop_arraylen)
which has a .set_default_value member we will set the field to a default
value. That default value will be zero, by the C rule that struct
initialization sets unmentioned members to zero if at least one member
is initialized. However it's clearer to state it explicitly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
If my eyeball of the sources is correct, this is the only case we
have of a Property struct that uses a PropertyInfo with a non-NULL
.set_default_value but which doesn't explicitly set .defval.u.
---
 include/hw/qdev-properties.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0604c33..36d040c 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -110,6 +110,7 @@ extern PropertyInfo qdev_prop_arraylen;
                           _arrayfield, _arrayprop, _arraytype) {        \
         .name = (PROP_ARRAY_LEN_PREFIX _name),                          \
         .info = &(qdev_prop_arraylen),                                  \
+        .defval.u = 0,                                                  \
         .offset = offsetof(_state, _field)                              \
             + type_check(uint32_t, typeof_field(_state, _field)),       \
         .arrayinfo = &(_arrayprop),                                     \
-- 
2.7.4

