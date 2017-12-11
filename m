Received: by 10.223.159.74 with SMTP id f10csp3052763wrg;
        Mon, 11 Dec 2017 13:31:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBosslWm6k81EXYWHCQTSorFkVxTkW/VYLhIxnPgN8O2iXkVQf+YIK6hGdueUXK8fiazsqbG6
X-Received: by 10.37.40.3 with SMTP id o3mr1463393ybo.244.1513027880999;
        Mon, 11 Dec 2017 13:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513027880; cv=none;
        d=google.com; s=arc-20160816;
        b=H4q8BfIRZ6kilHNnXvIFbg+CEGnWvpy6WjnC4y46BdDo44W5SZUYjWdC3jmCVWLr0y
         GbXXMa/RWvfYUTzCggpHiUz+wfRYnw5VIDKVtRfzc53SyRihLLuiTqa3hMs5xxCwlQNR
         YCyyQl6Vnb9JCcAuca4/Pv+a6VVX6BWCjdXJUCy8O3sOHDYe5PjVUGCjkiObfLDEDT7q
         NAQIi9iuV/FUBKdDCwRqVGJsuOHJPv6ZXm48+P4B64rUNicOEIAnNtiHtAY7KXP6vgiY
         wgtZ8ouaQ5Rod1MREVZyyZHdeT9u3LGxKrtirMvyPZHkAZ1jXF2si1UOkTo8qg2QK7q4
         MYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
        b=C2LkqSUi2otSC5tB2Fh8l2DnN94Lh+wBqd47A3fUtE24FY9ePklL5yA9PUOqd6wDcK
         PmXiNXlrdK5hOW4ExMAUKvlYfWzv5u0sA9YvI7ncBqzEO67LnGyOyR5Bv4+GIPZCyn8L
         GvHCI2I902bl8RqGl+dAIOR4hY92O6apdHabskhRhalVWyeWpbRFD74taiBi2wEf9e/l
         K1NVxHZUh+s5c0OZA4NTWBs///wHgotU9k8qMNv8fHndLKEHjKfGr6PNknzvyARgF4oV
         oP2NVilBEWz0UNOS631HPzlU7itPM0ySjGm1Irf9lzTTD3zeNaH7AEJ9x0uU8H8Kz1aC
         F7/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dO18p8Hf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si1262659ybl.613.2017.12.11.13.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:31:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dO18p8Hf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVfU-0000n0-Bo
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:31:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf6-0000iq-Rl
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf5-00047J-E6
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:56 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:39141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVf5-000452-8t; Mon, 11 Dec 2017 16:30:55 -0500
Received: by mail-pf0-x244.google.com with SMTP id l24so12535708pfj.6;
	Mon, 11 Dec 2017 13:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
	b=dO18p8HfCji6+WTlzIeO4Vyjx/kkuBnudAAxP+UeJ8isAITM8G4aRoUybA7xtmNrXs
	FBh4eg+F++U+Zgs86pzpHF4599j66EUnMcGY3w4+RfAn7qUxH4YcJAkYEKGqomBcRTHc
	rE6kriMBmEAUkSD60A8D1g5fnQa1yeXPSwRLtbfxYiz5Rodlu/8c85A+KFhj+MQrnkXt
	wAf7M2z+WiHaXKI6xlBJcrPbwJEHsYvTkFtEYdcG+LpjOd1DWLBJyyrJBTkVpJjLXjRl
	EcgogD3ZvWwJHymTd81l3M3SVNoRDhmQ9rAGrJYAZbPNhkWTT+0ZAz5+xZKgxcBFQ0ca
	CRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
	b=aL/bmycN7o7cO9isTsvt1FarxGg9CDiQdBdQny6UsA7C31QO6AxJnijg5k4zi51ecA
	a+Hc6Vr7cPN9J/Xf4szDgmZeIi7BERMSL90NoOM7N1IrvYC6LzYeIXkE8i7DhxhPMn+t
	UyB5xdW+PMfMDgbOlDgLyK01RxAvP+nFyu3pFa1bz3rb4oeO8sQhJ1h3BjNxbhBcyJcB
	6SbcJAbLanWBtLE+azIwuHji0JahTHWbsft2LUr6O/wVZvkf7l1weZRjkf/nmroMi1Rj
	RZgbNT5zj2dGNfep2ZWAj4PwoHR+xJb3xx30nkzMe+a55xCwiaURoHv/TIopkpa9zBhN
	GBIA==
X-Gm-Message-State: AKGB3mJs/KPDQsB98XGXylahwM0iZesiUo32byeMAJaZPPsEnxO7Zz3Y
	Bz9fGihsbPwcCzXMa+r0kW5STfpR
X-Received: by 10.84.253.1 with SMTP id z1mr1624585pll.115.1513027854114;
	Mon, 11 Dec 2017 13:30:54 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:53 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:30:00 -0800
Message-Id: <20171211213007.7353-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH 06/13] imx_fec: Use MIN instead of explicit
 ternary operator
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: og9vGwkfY1dX

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 50da91bf9e..6feda18742 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1076,7 +1076,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
                           TYPE_IMX_FEC, __func__);
             break;
         }
-        buf_len = (size <= s->regs[ENET_MRBR]) ? size : s->regs[ENET_MRBR];
+        buf_len = MIN(size, s->regs[ENET_MRBR]);
         bd.length = buf_len;
         size -= buf_len;
 
-- 
2.14.3

