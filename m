Received: by 10.25.44.15 with SMTP id s15csp6358735lfs;
        Wed, 2 Aug 2017 09:49:48 -0700 (PDT)
X-Received: by 10.200.36.36 with SMTP id c33mr14341009qtc.298.1501692588540;
        Wed, 02 Aug 2017 09:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692588; cv=none;
        d=google.com; s=arc-20160816;
        b=wOoaDWS+s7xWO6fh7fI6OUaeccYT/dgxcefZGLD2JRum2D62+MjwEhRN7NFr1afANG
         PJYo+n7fW5la3ZRLYw2N9zq5wmkrZM+jYeatjkJYTEsUtMkjSyN78a8EuP8qLvtQerg2
         z2jKsZNi94Lsh47t4zuvIuptBF0EHXt4fgFT6tOBya6JtUANMzS9oyTYjRHqbxX0kOsc
         uMez49PYtTHZivNVDsNA38FcnoxYWt0dMrInRqvFlgC3U5OJfAiPEp+uckn7aEMttr5V
         aN8mbk2HmARadi45oTZI3EoDgAly1+y3+HPmIkkMw1AX9Ycx6w6TQXLch5t8BRjsDRSX
         mmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=M/Ta+5+FLoCioBcaYj4TWwcHbecwb7lppqdwhp0Lp/4=;
        b=u8v4fsLLc8sx9Hj/rcyb80a+Wi+mXScjS0jiyWqK4+t0KK5RuEP1XlevNgWW6rqCa+
         a6uJD856YhLeh2XT+80aKX0aNSffL33lpyGRvwFm1SkNGdZzOUARYp0nxsIMpE7pZx/r
         LaKW749K18p4DYOTLJtmUhJGfdlEp8BEcn+ttElutaTWcMtI9x3RDfwnAF+fmEHhaEzb
         /IUWCv5cm9OSNzWmwM7A/Ftlsfzd/WE2el9P8VVhmHKKW1PHr+15Ritkz/yqJOpQDnx7
         TR5XuIfWaZFdUwOfyvLYmErpDz2Ih1ESSQOzzQCYzjMWmWe2s9+G4F1MS94yIdMoXOi6
         OrzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7si14815772qkc.264.2017.08.02.09.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwq9-0007ZG-RO
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:49:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlB-0003ax-4U
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 12:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlA-0004na-Dv
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 12:44:37 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl8-0003zA-CI; Wed, 02 Aug 2017 12:44:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkf-0003yE-Vq; Wed, 02 Aug 2017 17:44:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:53 +0100
Message-Id: <1501692241-23310-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 07/15] target/arm: Fix outdated comment about
 exception exit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bH1dOSDRXXbd

When we switched our handling of exception exit to detect
the magic addresses at translate time rather than via
a do_unassigned_access hook, we forgot to update a
comment; correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fd83a21..cb88c66 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6143,7 +6143,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     bool rettobase = false;
 
     /* We can only get here from an EXCP_EXCEPTION_EXIT, and
-     * arm_v7m_do_unassigned_access() enforces the architectural rule
+     * gen_bx_excret() enforces the architectural rule
      * that jumps to magic addresses don't have magic behaviour unless
      * we're in Handler mode (compare pseudocode BXWritePC()).
      */
-- 
2.7.4

