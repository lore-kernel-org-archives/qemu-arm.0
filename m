Received: by 10.223.134.117 with SMTP id 50csp11161945wrw;
        Tue, 2 Jan 2018 11:43:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBotu9sytc2RHJYsV9jR5/a6i5Jhn217N1hDamuVECttsSigFyAuOY8oa7lvMBceYsaeMLeOO
X-Received: by 10.37.136.139 with SMTP id d11mr12513948ybl.271.1514922234820;
        Tue, 02 Jan 2018 11:43:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514922234; cv=none;
        d=google.com; s=arc-20160816;
        b=xveDSwdMgMssrPvhpJfNqmDZzdYORVX+9qVcjeQNPwSvCckd+syDC5xorFgwiWsNEK
         B9mO2KjyLdnwfREwLbge1C728i3AuFFEIki4zmE09tWQ+rvh+AcfaDV4aIBtqjRjpElv
         s5odhbv/Q3zKK2r9SyJYsJolPNSc6ZuNQ7+gl3RU6hMpzJbjOCqsWA1q3yVwPxo1vqWm
         +mf5u20RKvM0hJrZg8LYRXSR91cOn3+e2jVs7wNbxCo1k3TEmMbt2EZ2g4EfIsJAsyL+
         U/xnEN3jIzjw02mNxbqBTgLAFGkx+d4QpN6ieC6H58MiKqs+SfBjSjVuN64Y0a1TneED
         59Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Uh6BWoCeucm/RqhnrLog4O3BSbZ2UG1LTw2gH+giLCc=;
        b=sPxHHmwK1YF0kL/cQqtkMf3WBMId9w7BujmIwhaxoz0gs742a0qoY3AhHP6jpSjgRY
         oj5Vry8O1mDyTcu+OvY6L6+shQuRtCu4SnaP5qtJur1vcxuPzgWwr4dRvdsHCxslCr0h
         nKvBr2GyV9HAZ7I2QwQ5v175dRhuRedjtI57+eTghkV7gyeaIg/wtuZM7u02ciddwWMU
         /oJL3DotzPT3jWJJXPduXw4MYIj3klzL/gsc2hOmPaMaEGoM9Umt45F+snCLUBzYULed
         8tgWaFqrnWcO6R3eWyeKng5KiJidYNqOgWbPkfRP5oK6h4m8UYaTgc4w/eihwjVFu6TD
         1dxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mnSohw54;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v85si8353303ywc.468.2018.01.02.11.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:43:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mnSohw54;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSTa-0001EE-AN
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:43:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMk-0003Mi-Ap
	for qemu-devel@nongnu.org; Tue, 02 Jan 2018 14:36:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMj-0000RR-Ho
	for qemu-devel@nongnu.org; Tue, 02 Jan 2018 14:36:50 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:43881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMf-0000Od-Ry; Tue, 02 Jan 2018 14:36:45 -0500
Received: by mail-pg0-x244.google.com with SMTP id f18so8004221pga.10;
	Tue, 02 Jan 2018 11:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Uh6BWoCeucm/RqhnrLog4O3BSbZ2UG1LTw2gH+giLCc=;
	b=mnSohw54NkWEPFTybysH2EBypPgdFSgohkE55ibq+WRR2vsk3/7osaU5d5GcRM6/+C
	8TrGKA9topS6v1dnI6GbTQHTCrpMOYzD4BnmD3fGoAnEmt/6634wyHz1Uvr4HPM9fW8D
	nElYJX53QfO34ZbHpWvikpMAY63szo6xGUUYy+Sxope5varX9QjJkOKxvvN5c1eEoKQd
	hCgl/TE89kyAqH/rud03A+yxvVo4b3E/if+Br11b5+LhMqMLJdODeg4wsiiWM6LT7seI
	ZkrWtoh/tWELkpCjtgMisuhOKQlRioDD4ZZW7rtv44RvDszBLe0TFBjsuGDX5GSnVlSd
	M2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Uh6BWoCeucm/RqhnrLog4O3BSbZ2UG1LTw2gH+giLCc=;
	b=bFw81ju+XszfLWxLoVcMdmlhdHYhQ3krmgE4DEbUYA4hV/GJxwwf6tZVAvJu1L2g+Q
	tL/BiSTn7UH6bl+5KfxcLiaoKg24zhloZbfv1zqAT+uJtAfStxSCu8bF0uK4/q/XZRnZ
	T4XqqO6N0mKB2wRiKhlAuGEKfaeto0fQ0NsdOJ4sLxFQgNBjfY+ODdAN3wzXv17U/yKf
	GAJ1dsPYlifGHnDvu3/6xerlLUAiqPu6P0EGucP8KNtAUAkBfKE+J7Xor2wI+S59+bxY
	IYJ9ZUm377Fhb3x946Z0F6RFMZ5JIsjgL7SMTozTGvwFbm27pO/8WWf5BB1q3pp1BEuw
	wIGA==
X-Gm-Message-State: AKGB3mK4Qk4Dcgo8j6CbcFiEfvjzSFqSZl8qTINRIk9ysFpeFpR37q/C
	M2h8HQGn05oYAo8YWAw8HzZzTtvO2fQ=
X-Received: by 10.99.140.29 with SMTP id m29mr34566375pgd.364.1514921804612;
	Tue, 02 Jan 2018 11:36:44 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:43 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:21 -0800
Message-Id: <20180102193622.27215-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH v3 10/11] imx_fec: Fix a typo in
 imx_enet_receive()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i7cbE/ZFMhzY

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6cb9e2e20e..c1cf7f9c58 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1150,7 +1150,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         size += 2;
     }
 
-    /* Huge frames are truncted.  */
+    /* Huge frames are truncated. */
     if (size > s->regs[ENET_FTRL]) {
         size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
-- 
2.14.3

