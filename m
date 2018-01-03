Received: by 10.223.134.117 with SMTP id 50csp12111959wrw;
        Wed, 3 Jan 2018 08:26:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBoseScn6s6AXl1plTRl+lcgqcw+RT9SaNk7u5Pr0JVkaoNZHzRjnhg7OOZ6cKCjbfJrBpoiQ
X-Received: by 10.129.174.98 with SMTP id g34mr1833666ywk.488.1514996794711;
        Wed, 03 Jan 2018 08:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514996794; cv=none;
        d=google.com; s=arc-20160816;
        b=CBbFJ4WqA9FmaDYaJ/7qmUPomx1g9dmPeysjFfnWZxJURudTanBRSrfJUlqKH/qeim
         IBRowmG84mHqYRpcfNkmT532B5cu96zw6iGmrGW8SlcXVZBPobafoWrmDsQf0qt5ksvO
         xGBBY3M6wgO4HAcWRyHyJh42Yto0nguRjo66S5+mOyvoebm2TGI1PqpluvfPAPlsFZsY
         ub1qahVghrJroK3gas5KhX1Rgbi3oEu20bNzkYk/yZ3Wnauip8Z1btsDUGmHyAABHigD
         W6aGmzdUs6MJiuQpI6zppkkpWpoul8jUA4F9AWdyEw6tA7KP29Fkc/N9Zwws3QLqQ/J3
         XvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=syf+Muj7Wjji0hClLilXJeGv6u3kvMHoCi/4Evw2Zug=;
        b=g2S029uAApM+8IlBzXYcdDhyZ4ZwWC2ZlrrCMsLmJImQph6Yv233slsX39+RLyJ1KS
         sShTwXqIQM8SY0AHmgyDVffBsxBYlLWPVvy1Ra2JsPnwTW+45aiKcwzfrsrzNBjN6TMs
         Qwb/duEsrKQtYSHMRP0TPYhaE43Q19LEkypB7m8wT6XxDnia7AriYsgHIWEnyvDAktpE
         FA26UwmthBWP7m3YKmc3AYnsQkOXeS9a0nHBA7HgbzmxvIHUSGpcNe9lrQrKIRqeQPo9
         ViNyfBaRtqYeMJLxVP2A29yh9LQtg94v44KT25QAW4XZkuEauwuwM2pEURrFW126X5rD
         JD6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nEZHjFYK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z9si280364ywb.50.2018.01.03.08.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:26:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nEZHjFYK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWls9-0005GX-Uj
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:26:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlps-00042A-Ph
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpr-0004wz-PW
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:12 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:39750)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpr-0004wf-L7; Wed, 03 Jan 2018 11:24:11 -0500
Received: by mail-qk0-x241.google.com with SMTP id c5so2151778qkg.6;
	Wed, 03 Jan 2018 08:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=syf+Muj7Wjji0hClLilXJeGv6u3kvMHoCi/4Evw2Zug=;
	b=nEZHjFYKUo+os+2hkgATFyuyrh/75ICM5xWkGwmdfIR7WWqcBw5CgbDcEe3KammK1T
	bfeI+XQDQm3LWo4u0uZvK9lvPcPa4TJtxEF0//AAlRbcG07A2UmEydUR3hd6ed7I+ykY
	oUA1QDOZDBO006i3RaM0irx5DO5bn5jCmYSAQfBMBh2ZFu37gmLRZPJIqEV4mvPGYCY6
	33v2ApLXZ2iWwcYnciLHL7N0DufboTdA2WNEbzQf2cXIYwNszFrF/N9FCQ+tceHpwCSy
	H2VkVDmQF3CCuInFK/ISPvVk4Ra5RKAuHFFIklJHKieyGUCPwLwHe6C7b9Cz06QVssZQ
	5csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=syf+Muj7Wjji0hClLilXJeGv6u3kvMHoCi/4Evw2Zug=;
	b=lA7S6qXwyiTx4bGfosa2T0L+uv++myFTNDmHa+6VH7rNseIRVJrcOQpP2ZwbbPjBz/
	L1OfBI4wYdxKQKG0w5+RvdfU3Waa+XS2JjS1E/J35dtvXDryD0yaQq7HVxWF0OP7NuEu
	wq/tQZ8YW2NonGDBwbEFXSJeizWLeAR0cDfTGDdT5lcv92d1oAWqQpLKVu6NY4ZSQFrn
	lNbclrS2MQPL6eDboewY/T0D9oPK6fmQ18ay4JNJXWKydfqSxvaRVsgxxGa0ERAvC1Aw
	Os4I9Z06tDlBE5RjFzzLLhqb9XmvgWF3UqVK2L181z+E+vumojnlhuLLQIANBr+rfdwS
	BdJA==
X-Gm-Message-State: AKGB3mIX0Z803rreh1GLcHCNG73gdZ52gbJMdZ6/jq+ewSJBAi4nwytf
	eUyJ18vqmJyLlcm1GneHppM=
X-Received: by 10.55.210.129 with SMTP id f123mr2375719qkj.64.1514996651133;
	Wed, 03 Jan 2018 08:24:11 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 102sm839393qkx.85.2018.01.03.08.24.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:24:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>
Date: Wed,  3 Jan 2018 13:23:55 -0300
Message-Id: <20180103162400.10396-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103162400.10396-1-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH 1/6] hw/sd/milkymist-memcard: use
 qemu_log_mask()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WDmG4oGY3APL

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/milkymist-memcard.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 4008c81002..5de3e00e2f 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -26,7 +26,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
-#include "qemu/error-report.h"
+#include "include/qapi/error.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/sd/sd.h"
@@ -138,8 +138,8 @@ static uint64_t memcard_read(void *opaque, hwaddr addr,
         } else {
             r = s->response[s->response_read_ptr++];
             if (s->response_read_ptr > s->response_len) {
-                error_report("milkymist_memcard: "
-                        "read more cmd bytes than available. Clipping.");
+                qemu_log_mask(LOG_GUEST_ERROR, "milkymist_memcard: "
+                              "read more cmd bytes than available. Clipping.");
                 s->response_read_ptr = 0;
             }
         }
@@ -163,8 +163,9 @@ static uint64_t memcard_read(void *opaque, hwaddr addr,
         break;
 
     default:
-        error_report("milkymist_memcard: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
+                      "read access to unknown register 0x%" HWADDR_PRIx "\n",
+                      addr << 2);
         break;
     }
 
@@ -220,8 +221,9 @@ static void memcard_write(void *opaque, hwaddr addr, uint64_t value,
         break;
 
     default:
-        error_report("milkymist_memcard: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
+                      "write access to unknown register 0x%" HWADDR_PRIx " "
+                      "(value 0x%" PRIx64 ")\n", addr << 2, value);
         break;
     }
 }
-- 
2.15.1

