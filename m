Received: by 10.223.161.27 with SMTP id o27csp233912wro;
        Mon, 23 Oct 2017 13:17:17 -0700 (PDT)
X-Received: by 10.129.92.198 with SMTP id q189mr9894138ywb.417.1508789837362;
        Mon, 23 Oct 2017 13:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789837; cv=none;
        d=google.com; s=arc-20160816;
        b=rRYaH3VC8Ek21Dj43PFaT/iMwL2aH6E3LmJojTRDO+A/36IZpFu7YTlAKlZSc9e3ay
         EfkzohuThDP2ExLcbkw8lMvHxrid/taP6Vzqdknf0jJS8ijCkhEoyugbdf995hUiPQbY
         Jt0VDwVlMvGzccj5kRk0v+DvnJfP/BsfsUEC17mxKFgeFIvAhd2lM2bdVRqp/z+CqqyT
         7oXyIrBtj0otYGPrgjKpzCr9qXXZuhZcO18H+9T0q/kOEt8wLvjwn/FqYD6ktHya1NHf
         bASzsTVTXmO/j4pmYuGSBKDHx56oN19stXXOaFjWpaY6DanrHHPql53bj+6eEQH0cdsE
         MhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=AXC+HkATDLeFYVG01o6Y11ZoKWqxGPN/yDzBAxHUdWE=;
        b=jweWacOWr8u+HBjAn+ie0NQcwOjiFBykugmFI7cNrWEQr7fj7IGmnWE2J0UuquOl/d
         leyKCazX689V+UY90I/dKYZayYBuUXelrA0mM02lDfolq1srQ7bAlgIrD4CQ2K6YHI7e
         u/x2NjV6uHUOJtK0zlBMhHz26FO2IsROi5tghWRCBIwpVXJwdrLPVbCmjYQVWHPD8UWe
         sSoOD5Ji1/1ANMA7EMIMVu5SkpvCQjqCfg6cOwvAvK70VtbzT+uf6Nh8U+kA3h7m5HHr
         a2lGykD6VNq+SOMI6XwZDCAZ8XmyM7evlDbV5hy6hrYvh5oLGVRyn2T6d5EmBmYtV6LL
         hsVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TUrt1l+2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s185si1345589ybs.617.2017.10.23.13.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TUrt1l+2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j9w-0004hO-KG
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:17:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4L-0000HE-AG
	for qemu-devel@nongnu.org; Mon, 23 Oct 2017 16:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4K-0002Vz-EE
	for qemu-devel@nongnu.org; Mon, 23 Oct 2017 16:11:29 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:47826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4G-0002US-FI; Mon, 23 Oct 2017 16:11:24 -0400
Received: by mail-pg0-x244.google.com with SMTP id r25so12629985pgn.4;
	Mon, 23 Oct 2017 13:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AXC+HkATDLeFYVG01o6Y11ZoKWqxGPN/yDzBAxHUdWE=;
	b=TUrt1l+2Xd8eWSBiC8ridoWy2S/oL9WQc5Wznkw8MBPushH0J3AR/mY5mQ7eIKNVyf
	qSK5vZsqgP3hmlR9bF6n0sY3UNeT+nKTNVeP3/1and0ncLhQ28GiVJgktq6mqSHf+Rlb
	2D9gw1jMZ7L4rRR9t85BSAnoi7/s8DqRTZwXc1tmBC8oUIYhoQ61/bf98Yu1toz0GEYB
	LGf99Sc6f3QhdqLbrPQrORc5n13/+VzrVjB54Bi8/zcdj5p4VVM8VgVY0VbO81qW5C6I
	aYD3TV/wZZH274s/SxMVRO+xFHFLxmvWlixVNGBpSKKH6Xq7zxBkHHlnsgBjo+4XZbb1
	o8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AXC+HkATDLeFYVG01o6Y11ZoKWqxGPN/yDzBAxHUdWE=;
	b=Qav5a1gDc5rD8Zia1+YMF1KxPt/dVuedwvc4YYC9uB1EgbRU52rXxciZbe7Yj7batL
	71zlQ/MKAE9dJNL+AOe37uGqwd1OL+ydnuiTtLbT8xsjDAl5cceC73VQcylPnJE3bjZu
	ik7Rzbrl4USGzY2t2Hdw7XgnTX1cNlmssYQFWSW5pJEAzjwIAIPBt2guuic9DZu+cfjm
	o5I2Gd9CeLckMTswvPDgoYoI6G04K6+7+Fi9AWAMFxpgFWxjU1PGT9J8cCBkrefnFyH6
	BnaKzwCwGVebaM6xJgcHh41PMTluvuftxie3EpNvPnsxzyXD2UpatJdaElezCAGfOA5C
	oYvA==
X-Gm-Message-State: AMCzsaU7L7ZtE7tVnONfec19ZqXbqLD0bhy+VjLfwnMEQbyJzJU5o5Kw
	AA3zRseThhaJXiE2xH8apgLpcmTI
X-Google-Smtp-Source: ABhQp+RMnbU1FuJ/6lu4POqA+ymBSdxF38k+HRFygaThSpAHwz/C3dIk0t2phfy86GU30Qs8lHJCXA==
X-Received: by 10.98.74.93 with SMTP id x90mr14075063pfa.177.1508789483339;
	Mon, 23 Oct 2017 13:11:23 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:22 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:36 -0700
Message-Id: <20171023201055.21973-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH v2 08/27] imx_fec: Use correct length for
 packet size
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
X-TUID: kt6M5A40X0s7

Use 'frame_size' instead of 'len' when calling qemu_send_packet(),
failing to do so results in malformed packets send in case when that
packed is fragmented into multiple DMA transactions.

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
index 38d8c27dcd..eefb3b2c62 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -528,7 +528,7 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
                 }
             }
             /* Last buffer in frame.  */
-            qemu_send_packet(qemu_get_queue(s->nic), frame, len);
+            qemu_send_packet(qemu_get_queue(s->nic), frame, frame_size);
             ptr = frame;
             frame_size = 0;
             if (bd.option & ENET_BD_TX_INT) {
-- 
2.13.5

