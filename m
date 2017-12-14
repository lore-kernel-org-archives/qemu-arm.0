Received: by 10.223.159.74 with SMTP id f10csp6411815wrg;
        Thu, 14 Dec 2017 06:59:09 -0800 (PST)
X-Google-Smtp-Source: ACJfBosgpKNgSjiVy+uis1ilc2VYoiOkUHfDsxdNhvcBZ+MFlySJpnfVsXxCvrtpDEDleN3821wi
X-Received: by 10.13.195.65 with SMTP id f62mr4327257ywd.52.1513263549092;
        Thu, 14 Dec 2017 06:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263549; cv=none;
        d=google.com; s=arc-20160816;
        b=Jgc52FQKT188wbeEYUtA5/hglLBMya7QdfK5pm3f4S5KqlbEjz7T1kj62scPP96c5g
         p3kaPOPCu00CBbOqt0XiLl52aq/ax5OHl+QAzSU4qZcFOp7LupFf4GL6CF1zzThMrqyq
         PrZSPtsDeI89Y8szGLFIE4eNJyQSTx+43Cn7j394a7YYfTtKgYBAgpOusL8JJe+hdFDK
         d94ekczJjT0BxblZiImvBrkqSJmoRw0ZQjR8orjPmOCnYeGDZrBrRYrJZegvC3BrDmhm
         6R3PqBUunMIvtTSY5Bfx2/jV83kSrla2rFg9knS8Gp+mHs6s/C+abXIwoRBYgIh4MHNW
         rgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
        b=SvX7yazZZ0vAmJ1bDlgj2cQNFbEtSN9UTTlA3jnlninzmC63S1xIwtmO3z6U93FM0U
         qdKQh75dUpRuFMjdNqJLQyP2mNJwmTsDngr8NBPR/BzN1Ip2TJLLaOnIo/FcMymkviP1
         Yb5u/isHxxwXwZRVtSbLA0PeyP6tdrJdCGofV9Hb6nQkRua9X6ZazGDzIFVmPdUmJZnM
         xBFu449VhIFxgo/DTAV8bvGVs4/Di5lF28ZrZANPkvmqFLh69Gl93i0KVxckrnjDamKr
         PX6aA+bKvnTIRJrbEm9to++wMhNH20c1vdMAgOj7stRT+fqjGm7GemrdUBDyO3wPAHFM
         VcdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ffewbUoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w134si829047ywd.801.2017.12.14.06.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ffewbUoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUya-00066Y-EW
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:59:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtC-0001VT-1D
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtA-0000YD-Si
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:34 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:39292)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUtA-0000Wq-Mi; Thu, 14 Dec 2017 09:53:32 -0500
Received: by mail-pf0-x241.google.com with SMTP id l24so3768018pfj.6;
	Thu, 14 Dec 2017 06:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
	b=ffewbUoLB9UQfWWwDqrub0YHVMbHDoyBmQfR/nIRu2A05kI9euKnOrDmNYuDo6RMlI
	Ay+DzUpw+uF3bxnD2+ubC5niX/rwYk7ZyeMUM0XoivsW6o8NieGn+XfvRXQ6JgE1nflj
	v1ExP2x/5lzLfdwBNh5S5LiUp+Sc/hyviA/F2quLOTDf4CW0EQqoy2fz/Lwqm3m23Owz
	gWm42CunSEnVMzDv5ejCiaB57ykC3cu0R/ZYczZ+OyZ8zusq71wvkranKeUbhjp954VV
	DuK0L7229/iYSLPTjbc4/AzyCv3mly0XrrUjnhNGID0uAumJfto28EKqc45D8EwSMedJ
	9l5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
	b=RLIlFSvx/p1mQZF35M28e1ywsME95+6DwA3M2JzjmlP1DbKQOcyoMHkmfSjGSCdp1V
	LlHeuRz3Gmi6kYhugYFK2rPOiAeBeIfDhkrq3c8fq6IbFvqDxng83dCWvSFqFT/jsjOY
	XdRqbYcVRsW15APEl2G1jyr963MyuuhVgc6UaN64o/JT6MH+/uLsHFjo2EIVNF1hPK17
	ohwkALRqcYVpMjBKRuqQ0QjzlPWtZXG4FZkQr5xmcfyF3NWM24/AiA2I4OMKMOlycKL7
	g3ZTK+iHGCUeRSrR9Lh9/UoPsSynQuWVuYcyLisOQh2fTwvJFVK+SMPBm40dhT5r1Dn7
	LkfA==
X-Gm-Message-State: AKGB3mJugq4RGMuQan3NHVOkaCxmxWFnjEt/JGqy0JwT0oenqwvQ1dun
	e6nDJ5FDHMufJ+lTUMAsqgc58JoC
X-Received: by 10.84.151.70 with SMTP id i64mr5697496pli.330.1513263211424;
	Thu, 14 Dec 2017 06:53:31 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:30 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:49 -0800
Message-Id: <20171214145255.31545-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 09/15] imx_fec: Use correct length for packet
 size
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
X-TUID: z/lysr2iJ2H0

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
index 77d27f763e..6cb9e2e20e 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -556,7 +556,7 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
             }
             /* Last buffer in frame.  */
 
-            qemu_send_packet(qemu_get_queue(s->nic), s->frame, len);
+            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
             ptr = s->frame;
 
             frame_size = 0;
-- 
2.14.3

