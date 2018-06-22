Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp866406wrq;
        Fri, 22 Jun 2018 07:00:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLof1YCC6mdW0rmIUOm33PtELzsrrGHnhBRmoMNVQz4Z76rZoObVr0/Gs6AGFxoBgdP6AVu
X-Received: by 2002:ac8:4a0:: with SMTP id s32-v6mr1469504qtg.2.1529676052328;
        Fri, 22 Jun 2018 07:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529676052; cv=none;
        d=google.com; s=arc-20160816;
        b=RElPGoB/ecr5H4jnZKvLsEhaYSj2qsKoK41xQRYpp7qjT5hHVTJb63ajZEZmHETKT6
         MXUEpTgevpFZTQ24HMox+Vlm1AYmJFEnwR0RqNHJ/C08/v/o9+qGf1I7iRbbkN1zB1qa
         zI9mRMb1ZXDQbqii5im9YTemFgCwIgd5xuAol9XIovty1ZuRDHuvApK+/Qx8rTWGqGDy
         7Ik95Eb1s1WLRQEj6Dji6loc77E7h4Kvl9UlOtImmMPOMczhy5AYDPT03QDcotZ6En7S
         lO++YcTkNAvexCV17TPYvhqhnmm08DiNphbUJMDzQvLwC2rOiQchQfl3SjxF4MO6kaj6
         UYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=PXIZKg3YGLOO4vafTYVLifGu8wGdKxGuAfiQyEwO7dw=;
        b=00npHWcG0cS4z1a+H5BXD9VjT+jhgZn6uqIQPeptTy8r2LtPUz0UayqaQzCKrIjX3G
         vCItZkUmhcyzr8xA4PkHtXYe7ZI2J/zH2oziCHQ1yMDPTC/78Fx9YYw0JxFKenJGvMw5
         6zbjuQCo3+QkC5Ciry5h8KONvkMErrzMVq2oZroX8L360KV3r6ZGPfN1ntScMNUHaTNR
         PZWtQeRdTyvVXOtkRjY35TLn3ZikCJYvdvLFdUWLOTOqJvCqqcJNYvoMewY6+8/x010M
         bCy0YBVz6O/wXdODK1tgbK5mRUsttplTfOtmGi8htunGv/K4UtCOYreuLCpw/8LpgV7H
         OEDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HPDzjrhL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h45-v6si4453819qtc.151.2018.06.22.07.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 07:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HPDzjrhL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMcN-0005my-Lc
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 10:00:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJe-0006WO-TQ
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJe-0003xm-0D
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:30 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJW-0003lx-Pp; Fri, 22 Jun 2018 09:41:22 -0400
Received: by mail-qk0-x242.google.com with SMTP id o2-v6so3652933qkc.13;
	Fri, 22 Jun 2018 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PXIZKg3YGLOO4vafTYVLifGu8wGdKxGuAfiQyEwO7dw=;
	b=HPDzjrhLRNUoHN/eGImj3kLw4TI2hk0e4vZdvEH/FpctkmIQi+ECe+3pehmNwqyEU3
	khShTnvhoZljjRu94Rlui1Hb1LnCwJgPO02CPNk2bX6iCqKcWwZBYk7lycO50kDNpE7O
	7J/N3yseJhwsXwbHTSCVhlqGSGG8IHEZ7xqSZkeWKtnxUdH1rNeFDhEvLC/0yYxNTNZY
	2U/xg7GYzzcaAkIQP+ztgKLLzFJTjLwZHhiKhu9vlam93f8CNB0+90YfDzYtCc6cEytA
	qprR22C4oVe8KtAX4TggiI7+MuuImUGpFwkYjcxj6/OIshBxIIDb3Dwh0M8FsckqV2sA
	3jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PXIZKg3YGLOO4vafTYVLifGu8wGdKxGuAfiQyEwO7dw=;
	b=kMh8N/cxi6J4r11id4572+lryguQRo6Hy5HoPeFs2ngmkNeCoO/NvGdl/AggaWJj3s
	D8j83p60d9bHlmRoWSESk6XVuUs+rRB1ViV2ZyYhQkGmzhuA/+/OSzlQBqX3eJXh0afq
	/ipJtUo1jjfmfIwdb/s9e9AyF1Vrfz0Wc9dJDBxefh9/JxmsZL60eLu+rc5MHvqtrD2F
	Ax6tyEZQrZmRLqsGK7vFcP8/pernHHoyt4FdWukL1e7YSyj5o3BA+SOIfuVqZ4V+yHa3
	kk6VtRYvdfKSqO5LIhZ5VXOkJYl6MtsieiO7Xw7pG9Yhzl4Rb1fyMs4S8QQV8f7dp+lN
	DAQQ==
X-Gm-Message-State: APt69E0BLQzH33yYQfYB2BBP7oHO5l653qNUS75nAbSrGtLZxFVh9hr/
	jHNX98kmOvjXm1X8ESza0pkZdSDU
X-Received: by 2002:a37:18c4:: with SMTP id
	65-v6mr1291846qky.415.1529674882196; 
	Fri, 22 Jun 2018 06:41:22 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:36 -0300
Message-Id: <20180622134036.23182-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH v2 14/14] hw/arm/stellaris: Fix gptm_write()
 error message
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bjyPr9ZGSK81

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d06e366402..42baa768b2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -294,7 +294,7 @@ static void gptm_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: read at bad offset 0x%x\n", (int)offset);
+                      "GPTM: write at bad offset 0x%x\n", (int)offset);
     }
     gptm_update_irq(s);
 }
-- 
2.18.0.rc2

