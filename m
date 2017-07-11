Received: by 10.25.44.15 with SMTP id s15csp5022334lfs;
        Tue, 11 Jul 2017 08:55:56 -0700 (PDT)
X-Received: by 10.55.189.132 with SMTP id n126mr710628qkf.89.1499788555987;
        Tue, 11 Jul 2017 08:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499788555; cv=none;
        d=google.com; s=arc-20160816;
        b=l7Cxjkl08Xd94N6JQorOOUgN35Txcauec4g3L/w1fBGHa4OaYqH7QAqxQr7lF8SyeW
         MRQnsIb0zb83GAktenNPiwiYQpENYUJr9s2AkR3GLzPLPQ2f9BaF0s/9OFayC5S101g/
         rY5KndmsDnZyL0YN0NHiVW6/PHRYsnrqJlxseUWGjh9PhCu+ROMlkfOxp3p21IqVz+1c
         8Gu5bFMgnRmHGQoLf8DOr7PcMx+EU+9ezFv40FVPxQVJTbtCHoPgjhK6CwOXjJ5+ivOv
         8CwoeWxBJcit+09hM25j0KtdwhpFMvOUdpNzBgf0ulVj6jgZZ1im6V6b0DmGv/g9c8bQ
         Tq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=tdW3LKmklqVhXK7SKt6lqyJYKZlG137bm2vWyFN14lc=;
        b=Eml9h3gVPBtyn7GOenYfUccm2fObFqUTYgb4CGxaP0IKFcWKomz7JPfd6xmOS38oPA
         /JAj81mvTNkU7w4xVSfTZbiqivz6R+Z5AHfJ6JKz1M6pxqE7los8jZLLCGeA+xk3Rb6W
         v+AwGDMPZJXoD8/C8VJDJAqIF/zQiXcztx9SKuX5ZKdahEZtCxbeusm1f+LHGBldHnNb
         SHSEpdrG5gm6TBjslq2JCIl7D1qKjbZzy0JXdffxDGK0Jw/jIYnqlx0xlV8gcoYvH0TM
         M5RGoLM12mq/WqTmSgJqfI9WvkosKkuOCvMjKR70B4Td1dQswH5TbxQ3RGGkyhBH/v96
         TtIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id c23si259893qtb.245.2017.07.11.08.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 08:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUxVx-0003J6-5y
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 11:55:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUxVo-0003IB-KT
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUxVn-0007BQ-H9
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:55:44 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:48438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dUxVn-00077Y-9D; Tue, 11 Jul 2017 11:55:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dUxTc-0003Jo-S4; Tue, 11 Jul 2017 16:53:28 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jul 2017 16:53:25 +0100
Message-Id: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 81.2.115.148
Subject: [Qemu-arm] [PATCH 0/3] Allow int props with no default,
 use them in ARM
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
X-TUID: 3GWHenXg3bwH

This patchset follows up on a suggestion by Markus for
allowing devices to implement integer properties which
don't have a default value specified in their Property
struct.

My use case for this is ARM, where we have a property
pmsav7-dregion whose correct default value depends on
which exact ARM CPU this is. That means we can't have
a single constant default value specified in the
DEFINE_PROP_UINT32(), but on the other hand if we just
prevent the qdev prop system from setting a default itself
we can naturally get the right default value by having
the structure field be correctly set to the default for
the CPU in the first place.

Patch 1 cleans up a corner case where we had just one
Property struct which was using the default value
(because it has a PropertyInfo with a non-NULL set_default_value
field) but not explicitly setting .defval.[ui].

Patch 2 adds .set_default to Property, uses it as the gate
on calling .set_default_value rather than just whether
.set_default_value is non-NULL, and adds some macros
so that devices can use the new no-default-value int props.

Patch 3 uses this so M3 and M4 have the right default
for the number of PMSA regions rather than getting the
different R7 default.

thanks
-- PMM

Peter Maydell (3):
  qdev-properties.h: Explicitly set the default value for arraylen
    properties
  qdev: support properties which don't set a default value
  target/arm: Make Cortex-M3 and M4 default to 8 PMSA regions

 include/hw/qdev-core.h       |  1 +
 include/hw/qdev-properties.h | 21 +++++++++++++++++++++
 hw/core/qdev.c               |  2 +-
 target/arm/cpu.c             | 12 +++++++++++-
 4 files changed, 34 insertions(+), 2 deletions(-)

-- 
2.7.4

