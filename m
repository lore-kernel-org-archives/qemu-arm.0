Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp679558wrg;
        Sat, 15 Jun 2019 08:51:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/QILIULYjNeiOY1vAEpqtg2JE6RodbUPfGLc7t62zSI31KLdOUGgAwCOiLL9CtbdAneSO
X-Received: by 2002:ac8:2e5d:: with SMTP id s29mr77848020qta.70.1560613886323;
        Sat, 15 Jun 2019 08:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560613886; cv=none;
        d=google.com; s=arc-20160816;
        b=IIyAMfftaSt5GfVc8kq3EmWZCVMQWCJc5uLSldocCzDWke1vkuEz/f6k6hOc9hFfyV
         E5Rrwx3dWEb4nxBJ5iLrgxnTIUfgJ5XU+zP4edxejVALhv/jvdavGifdi5bZPgOU+JOy
         sOmFulvr3JZ/qwlpVjj/rDsbtPdyeZ9Eo4htyC2w2igtq044jkKi6n8QlygSceexNBFR
         fCjp+d0k+iQC+tkxD3yrGMMaYnA5+1BfFQwLLnr3420jKUPCyMEmMjX+SJFliFBzwLi7
         Eg2PNcGRTRaskszlR4EhqARJ2MtqWxBqHGe7i2Gt+1QZEIchMoDEX4R/xKrzExxAuHNj
         R0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CMX/gqFPwW/6FWqKJAQQmisbwRzLgyDW5WZzP1KRCgI=;
        b=dbjqDyVSVSwdYGEfVLPpgWOVuleAsdFeLT7FVul37jXsXEzI+bSeuD9vHVuxrcQdrf
         RRFf6JtcizGuzPl6mPMGzG2e7EG4fxrRV9CkLadgn2M3pgUMwfA3NFgbQMFglDqD2tie
         41OyE+GPBtCu3JwItRVgI937QP66f4SJMmg53JXJijp0f/PW3mlBvOd3mhv+tnWZMKaN
         gOf4bSTAXbOPqKOobby5njX8BvfM80iP36jKOFejg7oapwCaUeKO8xuuX838Qo+hjv8q
         cpfW9ciaMOaAnIifDS4V9jfw40/b2Kzt5Lwi27PWngCb7ZQD/RNFl/fWEtlr0+SJ1GRk
         RFlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w50si3979080qtk.227.2019.06.15.08.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:51:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcAxh-0008RR-Rv
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35539)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqh-0003fA-BK
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqf-0008BO-JS
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqf-00081t-CR; Sat, 15 Jun 2019 11:44:09 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 132BB85539;
 Sat, 15 Jun 2019 15:44:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EFC41042A77;
 Sat, 15 Jun 2019 15:44:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:34 +0200
Message-Id: <20190615154352.26824-6-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 15 Jun 2019 15:44:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 05/23] target/arm: Add copyright boilerplate
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Robert Bradford <robert.bradford@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tb6WjpLYrarS

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
---
 target/arm/helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index df4276f5f6..d3f3cb57d5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1,3 +1,10 @@
+/*
+ * ARM generic helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "target/arm/idau.h"
--=20
2.20.1

