Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649509wrq;
        Sat, 14 Jul 2018 10:16:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdO/26QICLhaTevvo04nelFUYCzWdvUCGERVY3dcQ+0zOIWPvoOnVWUurIWVAAHgkHNnCbm
X-Received: by 2002:ac8:2f84:: with SMTP id l4-v6mr9817857qta.83.1531588613465;
        Sat, 14 Jul 2018 10:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588613; cv=none;
        d=google.com; s=arc-20160816;
        b=YTXNRlIRJLUdfvOrvR2lY+3AwbA1VSxoofpNO8dlhH23g5i9B2l2BW2BjbaRRkyax6
         +Y3Rqb58/GR4O1fmzspnwlzGr54JKrXjdWpnt10y+yzGy76zpZoPl3gM7N+l7iOzUINv
         rB1KICAQfJTieul7TSW+LR/95D2CbxvASrp5H3sm3DDYI2pOfAhN4MTEwm1tZ8+XzZ0y
         0oyYA9Y8ksaxY7V8k1wwji8xB2ThMsfJFUE5qVVpPxVv3yGXZcOAhVFsgiUXbnEd0ocV
         JuhiXyjgAS0yuw5uh4wBjAUlphHgsyvgCFThKnB/dm+u5L060RKNYFf8dhU4ybKEiNde
         wXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=V/t3xf5CuE/Og7ZBEJIKrvSkyFOpBvJHqsLrK5RtbzM=;
        b=YI0nV/4CX2QUD76sSck1aeIPfK59y3QA3gD5vZCj7nxjb+XX0I0NQYfMPWEU8BIy4R
         uxkSJt7MH13a920B3BRfBiAQiMkFOxxn02TJ5Vo4eAxvahdlncmOhGI0tun65sEEKkAs
         i2lLktQG3MpNfLdOIkfQq0C5iH+CL+brkbJ3gTxqE0pjF46v3EflU56jgtWvs5UM1e3R
         lw6aW3rG7FdAmXuVvgvCCwvgh6W2Q7V20HJXAaOC8o+Bdnx/4rxvHvAySHwJGncIBv4Y
         FxzheY0scvunp+GktpkA6OPpCMcawMptCE/Jd3s2Uzp/SFUrPE8TZRuv5BJdEq8PVa1y
         05mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="vV4/QXMw";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=enhlSUeg;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=enhlSUeg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y24-v6si159690qve.2.2018.07.14.10.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="vV4/QXMw";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=enhlSUeg;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=enhlSUeg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOA8-0005lr-T5
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:16:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0005k7-AK
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004Pk-27
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:30 -0400
Received: from greensocs.com ([193.104.36.180]:57252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9i-0004ML-Mj; Sat, 14 Jul 2018 13:16:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 32443C7AE3;
	Sat, 14 Jul 2018 19:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588579;
	bh=R0qo1qb4zMgWwyZkI0Car8T0C8eMP8Rof3Obc1oH8Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vV4/QXMwNU/WfrOkEcLDINZVOcQM6V5jyPGDqPkyi529CUXoS8JYBl5ZuuOV/an/G
	iZIatPxa4K2cPoMvvOFvVFMnEO1//SIkgETe8CnkknDZmxQJTxMJe/LN0wOuroI212
	3FZWJfDsyIOhZWwoeMHziWUnXiLdA0IUQYk3cDO0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=enhlSUeg;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=enhlSUeg
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUA-Qmim85Te; Sat, 14 Jul 2018 19:16:18 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 5B75DC7AF0; Sat, 14 Jul 2018 19:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588578;
	bh=R0qo1qb4zMgWwyZkI0Car8T0C8eMP8Rof3Obc1oH8Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=enhlSUegUdJVrF9/RvMlGwisL7rcUiCW02pZqc3GBcJfwmv0C5nCxyWBhpowhl+lF
	P8BvzD25zZ4FHvwyrWmkQfs65BQ3jmBtjjyHaUT480QGB0d8FNcGy6kFS9FrH4OiT2
	Mkopq593x8hoXIwAmQRqscVvIjCyRJqpXHnvWXcQ=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id A2EACC7ADD;
	Sat, 14 Jul 2018 19:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588578;
	bh=R0qo1qb4zMgWwyZkI0Car8T0C8eMP8Rof3Obc1oH8Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=enhlSUegUdJVrF9/RvMlGwisL7rcUiCW02pZqc3GBcJfwmv0C5nCxyWBhpowhl+lF
	P8BvzD25zZ4FHvwyrWmkQfs65BQ3jmBtjjyHaUT480QGB0d8FNcGy6kFS9FrH4OiT2
	Mkopq593x8hoXIwAmQRqscVvIjCyRJqpXHnvWXcQ=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:45 +0200
Message-Id: <20180714171601.5734-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 04/20] vmstate.h: Provide
 VMSTATE_UINT16_SUB_ARRAY
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M+f8BvV/AJeY

Provide a VMSTATE_UINT16_SUB_ARRAY macro to save a uint16_t sub-array in
a VMState.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/migration/vmstate.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 42b946ce90..2b501d0466 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -923,6 +923,9 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_UINT16_ARRAY(_f, _s, _n)                               \
     VMSTATE_UINT16_ARRAY_V(_f, _s, _n, 0)
 
+#define VMSTATE_UINT16_SUB_ARRAY(_f, _s, _start, _num)                \
+    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint16, uint16_t)
+
 #define VMSTATE_UINT16_2DARRAY(_f, _s, _n1, _n2)                      \
     VMSTATE_UINT16_2DARRAY_V(_f, _s, _n1, _n2, 0)
 
-- 
2.18.0

