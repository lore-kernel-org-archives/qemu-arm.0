Received: by 10.223.150.237 with SMTP id u100csp2786960wrb;
        Mon, 6 Nov 2017 07:52:43 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QHYg9idBIPTCvf6sOBB1l1ZfQVo0On67a4gB+CkWPiKWIvEuwy3hwGltPx2aGbUx5MVK2C
X-Received: by 10.13.252.6 with SMTP id m6mr10042708ywf.451.1509983563524;
        Mon, 06 Nov 2017 07:52:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983563; cv=none;
        d=google.com; s=arc-20160816;
        b=cZR7kpHy68ikgfM9oQa13MqAAvM6vIBbdWRYECmn1gI5n4rQ5X/bOrUE+qeRv+YZbm
         DpxhsGHPvdbhJSt6JH8FJlDBoCIStHI8YiJjA3qkVqtrKszwYrJdOLFrXuXHlsGoqjG7
         P1t4TNjHfaGlS3FF2+ypf4zvRd3b6v/2UGYYTX9wJub1LZNjPDribqXYkZOF/fQx+aqq
         XqIhK8ABgk4y8EwOAYZOmKLMjytn5tXq7TXf+36hnPs5UVuojZTK4jBTzcH9x71Jie1m
         TzdN9RFOo/jMfsAudo4VM6qK4RDXj3/sq21SWYpuB/wv7Gzr2VEzpNDopSbchMeMzhyC
         xHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ml7HHgjRn40HRIy7B5QtPZ8X4ufJWKltIpewiKBGh3c=;
        b=KDahKql0fS1Q66MEQy/MrAfHhWa7ESfcr7QBueLv7pxbiG159bCil+CR22tUzIKhLq
         MRQBBrPJVi68P56uWpZtM+alDEdoDYAf6rhlZl0nPgqw/VkHY6xE7OO2dkNZBA2sxWAz
         FTmD6xbUs3y4dHL6zh2uemL9dDMiUVPtN+zAPUkcelAzICQoOB0j344rH7MlTSEGo4Hm
         eftK0CfEDiOkP3140h4qC4CZZDFmRQXevJaK6e1iVK413cVx2chGv2AC695fPriKP+9x
         aUgU43o9XnJQjeCPeVQUsBsIhtnwtsC2QDi+wc4axUqE3lZIY0gZewCtSwwrL+XiUWzR
         CPVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=awy4Bl6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r71si2849009ywe.305.2017.11.06.07.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:52:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=awy4Bl6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjha-000276-V8
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:52:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdi-00078w-KZ
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdf-0000Rf-AZ
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:42 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:56914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdf-0000R6-46; Mon, 06 Nov 2017 10:48:39 -0500
Received: by mail-pg0-x244.google.com with SMTP id m18so8494046pgd.13;
	Mon, 06 Nov 2017 07:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ml7HHgjRn40HRIy7B5QtPZ8X4ufJWKltIpewiKBGh3c=;
	b=awy4Bl6KgWHS4UpYt2OKQZ7Xm5MlFdunJwEplqjss38sHA8L9c26lI2fmmXe+IWeBi
	PWs6i6MUCvh/D1HH9Nx4MgAGWkfIo5HMsdCI4l0NvRh9rMFhEOpIMug3gemxcZYwIJSG
	30ceGCXb/WVFec0WV2YugMpLhtxLxc1glFLQVkOlaZ9/qaC6h37v6mwtutuXWPo8OhrO
	3mQqMP+K68JgXzwrnvMCLrsX1w+xa8/BQ5VWjTuOqLMY5+hiqi+Fq8xXhJ+Ctu7NnpJr
	slCBi6jB/rS81ep3Oguy1P/9Ti4YO1kv0SRv8Bm5pNf7Kpqs8jzCP0dkrQ8MxXUwmG+z
	0/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ml7HHgjRn40HRIy7B5QtPZ8X4ufJWKltIpewiKBGh3c=;
	b=iMHr1tIkHc0BAY8IfG6yQLgeV32F7pZ/IDaAAHqsvI4q+79M2eBva9TsCwIsusrml+
	+7hVoCaycr0k4u2sZtuK/vn4sZrFs98K7tviSiJZdaVncENkxdgHiCGPbRVH8pA/hAMp
	V3x5Vz0Z4zgs+8MED6DHHlY00i3R96++YQfIHUwECaiRSc+t8iDCTflb6DDQMglWOvGW
	KXkp34z7dfnap0OIdbHqLkx/M31EXUbSBFlC89maZ6ovqcR6kdpLt24aNF15kZ1rpl3p
	OZzJL1FYgqsbVSGNj2qwf+2FrNS5hLGXi7xkUEMWUHFMkyEj7MdEQ4tUG2mKMuD0EQQD
	tM+w==
X-Gm-Message-State: AMCzsaW05o6haLH37ZTeLHRXxmuxtF6LpGGfL2X7v1mTUYRhnFbWit3q
	Fy7qitBjJuDrN0wncamzbaccWERTvZ4=
X-Received: by 10.99.42.210 with SMTP id q201mr15366029pgq.7.1509983317940;
	Mon, 06 Nov 2017 07:48:37 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:37 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:52 -0800
Message-Id: <20171106154813.19936-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v3 09/30] imx_fec: Fix a typo in
 imx_enet_receive()
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
X-TUID: p1k1fllYPj9i

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index eefb3b2c62..48d012cad6 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1121,7 +1121,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         size += 2;
     }
 
-    /* Huge frames are truncted.  */
+    /* Huge frames are truncated. */
     if (size > s->regs[ENET_FTRL]) {
         size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
-- 
2.13.6

