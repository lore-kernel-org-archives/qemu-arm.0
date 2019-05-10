Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp98918wrg;
        Fri, 10 May 2019 10:46:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1/EPS1SGDxu+XqdloYiU0+gdBWqSaYTqQ0R6uY96/kC1Q0fQ9iZI8FSrjfhJhS+XtVzqf
X-Received: by 2002:a50:86c9:: with SMTP id 9mr12511496edu.216.1557510373526;
        Fri, 10 May 2019 10:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557510373; cv=none;
        d=google.com; s=arc-20160816;
        b=jKj0L/HJK0uGpv8chCWg4LtI5oYhdbzFE90MLHCahQl9JrxjvRO8Y6BFde5YJa0xdD
         z4VgNzt8brCMeam/giwX5XUB8NXZSnyTjCR0whjY8ZnWPG/jQnAO3HMdl0sSo2Vspz1y
         LdBckmTMLpA+vZNsnm612MWHg/pod+AsMCer37C9hTNw8R/9pu1sDo4q4vpP+MkyInOT
         7CNO2OUjFW1CdMM+ZSo7T8wdlDdNTfhXpRu2x0NxQOtP3NnZTFYb2MzBNTSKczZiWQYR
         dARA1jCxpeNt5jzBlN6ORAH1zVyIUPe7OmnvJLv6ZOcNW6OEQ9oofgy3HQEKnrc49exH
         9hOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=iRt1ekpVqMBTFPlbEkwvccpMEH6z9s1kPn0wCee76Ys=;
        b=LTJg4Cl0esKK+R1BhjOE2J9EeVwU5F3ZXSMA8TkYfOq82mDtvI2bX3SMARcbed37v2
         vnlV6Esp04Bbu0SLMNthZjJwEcRzUilkddHD6CqgQF3EnNLy0B6LmxGc4goIFw449RX8
         hqEGuLm4EXLZP8ahe66omUhuPs7tNwVooTlPmnjzqQa/6VG1Z9XXHpBykhDGVNWDMaBy
         EqJPezoqy9lQ5kLPdyNXABF0hKBJc9hOfrTrmrM8VuzGCYme5eotOr9jvuVU7Hf68VE0
         Yb3CjOOUnRmMGsV3ETIRsCw0w4KhNaqKlhsvsskF1dprq6y+nSTEA8H6TyuEDj432dpz
         kGQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ehYp3aoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k45si4783028ede.243.2019.05.10.10.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 10:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ehYp3aoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hP9b2-0005iX-IH
	for alex.bennee@linaro.org; Fri, 10 May 2019 13:46:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP9MZ-0007Up-Ie
	for qemu-arm@nongnu.org; Fri, 10 May 2019 13:31:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP9MY-0006AE-Kj
	for qemu-arm@nongnu.org; Fri, 10 May 2019 13:31:15 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hP9MY-00069m-F9
	for qemu-arm@nongnu.org; Fri, 10 May 2019 13:31:14 -0400
Received: by mail-pl1-x644.google.com with SMTP id b3so3138069plr.7
	for <qemu-arm@nongnu.org>; Fri, 10 May 2019 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iRt1ekpVqMBTFPlbEkwvccpMEH6z9s1kPn0wCee76Ys=;
	b=ehYp3aoJk6VPXB0pVCayxMCdYclH7yxIWbfUw9HmALoWfx1ww1+x8dh8NkU3Mm61pn
	qp0V/jNsvuDFUBloYorQnMIpz4cu9R88FlvMwFFpm3o4ldLmwjPNM/rKhZW0qGDTbyh1
	Y7ooTEjVXBiFk/MtZSBVTfBP2IcOST+JwL6JKSmGFi2S6sgWiDT539/vwYyhtd/K7aCt
	VLsU5v/xqpNRC0NQFevLXL121aU+vNNHn90nS0gxQ8gpZpCW5FighaCQMRZnotwFtpf5
	DrlD4bwdMgpqV5O8tXZaWTr/+1H3fjb5Hrw5EN8AVjXgfc+N4hsbqZwqCiLl2brwYjTh
	O/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iRt1ekpVqMBTFPlbEkwvccpMEH6z9s1kPn0wCee76Ys=;
	b=emedo4OLdeMbbFKxNePNfo9xftpFcbJBWSSHWymbme3F3UYXm5p6pTDYFhlx24O3dY
	TeSYvJ91Zl1pHBqvWcd/UwXEhLTiYooKa8XwNZvKCSNkJFnMLU0kfMd5e2fXGo0YaDGM
	h922r0KuKmTxFTzDg94dU6QsAgc54MRX5rdFnw5JhFNTKaEm4NzN/6ebxU3LbEOhjaiK
	BSl+pfvIqIZMJF3Vh9C5ZvKqy61y8bGNBUdm+OX9n88a4zzuOjiWopwEpb/oGRcb60t7
	fqzshpVTSg1FpoGUSaWIzXAnNVkMck0IiqTl89A619p4r/Ph3gqSyoRaBk/1JN/iQDhn
	kOJQ==
X-Gm-Message-State: APjAAAWTXoVIVfWW9n25/XGGqeTonRVsaJ5YAEdPojpv6chKp/Ofm19Y
	/wcMVhlZKHI7ReZuEzx29bS8JQ==
X-Received: by 2002:a17:902:446:: with SMTP id
	64mr14480345ple.322.1557509473495; 
	Fri, 10 May 2019 10:31:13 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	v64sm7936792pfv.106.2019.05.10.10.31.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 10:31:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 10:30:42 -0700
Message-Id: <20190510173049.28171-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510173049.28171-1-richard.henderson@linaro.org>
References: <20190510173049.28171-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v6 18/25] hw/misc/nrf51_rng: Use
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K0leJ8F7vJpQ

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of error_abort directly.

Cc: qemu-arm@nongnu.org
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/nrf51_rng.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
index d188f044f4..3400e90a9b 100644
--- a/hw/misc/nrf51_rng.c
+++ b/hw/misc/nrf51_rng.c
@@ -14,7 +14,7 @@
 #include "qapi/error.h"
 #include "hw/arm/nrf51.h"
 #include "hw/misc/nrf51_rng.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 
 static void update_irq(NRF51RNGState *s)
 {
@@ -145,7 +145,7 @@ static void nrf51_rng_timer_expire(void *opaque)
 {
     NRF51RNGState *s = NRF51_RNG(opaque);
 
-    qcrypto_random_bytes(&s->value, 1, &error_abort);
+    qemu_guest_getrandom_nofail(&s->value, 1);
 
     s->event_valrdy = 1;
     qemu_set_irq(s->eep_valrdy, 1);
-- 
2.17.1

