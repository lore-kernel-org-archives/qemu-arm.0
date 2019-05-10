Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1456778wrh;
        Thu, 9 May 2019 18:37:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwq2P1pD14QKMVD/2GMxloXhCTQYQOrfvgLCzE0qeoDShCSi6V8eralyIIjxZymhifOuo2L
X-Received: by 2002:a7b:c3c3:: with SMTP id t3mr4875603wmj.88.1557452261821;
        Thu, 09 May 2019 18:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557452261; cv=none;
        d=google.com; s=arc-20160816;
        b=MvQ8Q5eCduPv+BHwdJ5KbxxYKUSFBYmOeO1OWc0/PT7nNEtOJDpP9Q2GBSOY7KowXF
         J1Va1LDzqqtkZ8FIRREIB2S0H7Rql+mNKw7qJsvYEcR3C5K/MV1hzJl6bcYH6on6Qs1q
         Uw95lxGwp/sFlFyY9Y73sGnTy91ad2XsWRTSeNny3ZX00Uc1OgZ8xlHKQYukzeLO8Y7f
         izWDdDwOiykCYQQs8z+Rj5OaVHG1bzybAwJkEbFPO3TXhcIH6FHTzQskOZPVWLU/UkPy
         BG0FNPtiKfmeMPZi6kN4iM0jPUVYfefuhltHmysQtSDwOba7eAj8cMKrp5Zhveuhri0E
         6mzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NqFQGLUWEK2q+OruuYLxByccY86fvPfXVx23TDmISjI=;
        b=TWL0U18K7AXVX+qEQ22LLeUnExh6kwCwSmeaTIoBs0nq2JA/jJq4hNa8/VdQj3KQ9G
         6tavwfsHlLDnf/mpwh80SLCdBcDLFelieGq4tmuVuOwnurUNG+Pd8+akBGy5aQxlzj8Y
         /BKl1uYMh9NCjNBgs+1BsUzd1lSHJBIeEjXwp97wEBKPiVVtiMpwTyrkWvXhZOY5u5gi
         oZvKEByGIogF1RnF+4zh9JIMjHvqHrE6vrnr9hXEHXMOUzo2eiLE8WeS2mU1sHPZ0FUS
         mpvL1JOq7gcbOKmnSL5RKmNduEIch72SVAIy0CuLemEVaRJ4XFm3Z4FPsprNI8DNSAsj
         fYPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PmKaoaZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si3077627wrs.68.2019.05.09.18.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 18:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PmKaoaZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOuTk-0000vK-UC
	for alex.bennee@linaro.org; Thu, 09 May 2019 21:37:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOuHr-0006MO-SR
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOuHq-0001Gn-3u
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:23 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36029)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOuHp-0001Ft-Tu
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:22 -0400
Received: by mail-pg1-x541.google.com with SMTP id a3so2129410pgb.3
	for <qemu-arm@nongnu.org>; Thu, 09 May 2019 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NqFQGLUWEK2q+OruuYLxByccY86fvPfXVx23TDmISjI=;
	b=PmKaoaZexxoZh96Z5SSBy4MbrFYGDyGKI6XKBNjH7wuaKs10QNgrTo1r9QxWIm2Cxt
	o9BXZS6H/B/w1JbrIW62I5XQTVJ2JlkpYmG9vea9erBWiW8RnLJlcExHDm9tv4oWRvVy
	fn14ogW1auLxR6kQG1c07EiYK0NnlBTeh6377EL8KTopwKRG3l+gIsuBKJ6UTihSQioE
	r+HMobJf+sYB91Zk+V6XdadNcyhtm6c0ULvTP/pKGjhTt8SB6g6t8PXm1oAiaI/QlmsF
	F3jUIInF2+ic9gJ0zx/REhj82vTKXclXusWv6lzvAqUcitO/1FQs7rBqjnTDAZZSg1ft
	BMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NqFQGLUWEK2q+OruuYLxByccY86fvPfXVx23TDmISjI=;
	b=LQGMsNgFk/wsbpPQJzuyHD3MbnShnUMfIPxAFynOmqv/x8FIY+U2aGsA+7+NOiijki
	HgDmUVSkhHxc4H+iXuztsfySGAFO4cdulFWR5evf7I5PtE2v5WjxG41DJjRja7MvgKvL
	prf//t1SJkz460L2WeGfJ14oco2j8O7+z+IqY3mXhruxdMYmS8eJcfiEt1wvxb6Y0u6g
	UmuUtRW9sHbzpfQJhzZ7f9C/BE7BnU3jDF/luJZWKkMr11EIaigP+kkXKHsusBDcbgcA
	aV/93Z87TtHXOyHt4qef43xDowhfKkBTso2MXGAMJQEeDrDJpIMSPQcxVaks+zmqvp82
	vEeg==
X-Gm-Message-State: APjAAAUVKUaWKkd2jXas9dBBh/1CAlJTdvDePgSUWt3N4fLae8/kwSUs
	K0DWe5tSJkT12pCZ5Xb9xQypaho7oVA=
X-Received: by 2002:aa7:842f:: with SMTP id q15mr9927856pfn.161.1557451521062; 
	Thu, 09 May 2019 18:25:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	n18sm8252700pfi.48.2019.05.09.18.25.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 18:25:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 18:24:51 -0700
Message-Id: <20190510012458.22706-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510012458.22706-1-richard.henderson@linaro.org>
References: <20190510012458.22706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v5 17/24] aspeed/scu: Use
 qemu_guest_getrandom_nofail
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ybIdFmobEorq

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of rolling our own error handling locally.

Cc: qemu-arm@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/aspeed_scu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index c8217740ef..ab1e18ed4b 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -16,7 +16,7 @@
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 #include "trace.h"
 
 #define TO_REG(offset) ((offset) >> 2)
@@ -157,14 +157,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
 
 static uint32_t aspeed_scu_get_random(void)
 {
-    Error *err = NULL;
     uint32_t num;
-
-    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
-        error_report_err(err);
-        exit(1);
-    }
-
+    qemu_guest_getrandom_nofail(&num, sizeof(num));
     return num;
 }
 
-- 
2.17.1

