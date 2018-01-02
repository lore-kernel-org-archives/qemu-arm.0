Received: by 10.223.134.117 with SMTP id 50csp11160416wrw;
        Tue, 2 Jan 2018 11:41:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBouL/xz0sF0DsDUWukY/ua0buh3CLlxY7JJrXmPxRopouVgG6eb5R4rfCVQKRqqJnnG6qL0/
X-Received: by 10.37.22.6 with SMTP id 6mr34583515ybw.321.1514922114301;
        Tue, 02 Jan 2018 11:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514922114; cv=none;
        d=google.com; s=arc-20160816;
        b=prqvXfRmWm3lwF3B8yrmkkjAtK5ubwNXojZBZHVYwxT6U5a62VbYuvXqOAg4n0fToQ
         yrXmq5d4pF+qIs7Feg2UYhAEy/2iaxlM3lyHZ3m1WTt10hjFGmtvSr6DkWV/6HG9lZK0
         IuGerqKbOS+uoPq039ks0WRBkYePd8LCJnZb0Koqi7np0JkJ9qZ5SmL8EqyM3wRBWf4Q
         yzv1dGo34BQL4qq9GZ4NTXsTeuGe0oZLe2fg1U0BAw6U63bZOeqmpphPnP0W82pa56Z2
         uRP/8dx9y+3TBbkTXkxuHtuJcLz3gyhJRTKn2xU6HVLP6c7JgKNI6hGc+pGZXCyavxBV
         o7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
        b=H41fm598t2DA5PuyGLEYLtsQDLBX8d2t+7utxZzMBSmKuPqxXzkh95TTIOSMJsikef
         Z+ldB8RsatN7LRDbeq0Uy0gJQQpB04iarVALquqIZ7BjnazeM4Y1tiOX9yrt+jurBtQI
         gUr9Rah9rMv7I7CVk/znf7HtHTj4XSYhEyVuvRCY/P/Gzwy3TSFpApW97XhjgweyX2L6
         zkVr6PWk/cbi38cgA67asW3+t6KJhtjAlcfARz0ksHn20z7LDDN+ONjfL65Rs5/CJYth
         5ut1rD2sL/llzyhShpGhWK8eCmI3a1BVVPIbISRMXChNDoGFh841SrJoSqKCL6iJFkMS
         0Wbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ouKbJSan;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si4108123ybn.609.2018.01.02.11.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ouKbJSan;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSRd-00079s-NF
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:41:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMj-0003M8-Mc
	for qemu-devel@nongnu.org; Tue, 02 Jan 2018 14:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMi-0000Qt-KA
	for qemu-devel@nongnu.org; Tue, 02 Jan 2018 14:36:49 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:41582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMe-0000Nc-Of; Tue, 02 Jan 2018 14:36:44 -0500
Received: by mail-pl0-x243.google.com with SMTP id g2so29239178pli.8;
	Tue, 02 Jan 2018 11:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
	b=ouKbJSanIZp+rZnPARz9MhkePvWj3DTiMEBO7MWbPceHK9/g1yQXolBc8MYJAMR5zP
	9KNtD7XN7GLY+7MYAAiertR6fca8Aun30t0C1DavrJ1kdJcRlM64l8JMmRaBRigOUnxs
	kE+mJ6hG3zNkrdx0g7s36ZZeJW94P8iHX1KtdTkihvjKQaZDuu+jjaUtC+0sp598Iayb
	FazMsfCgw5n5ejPvnG/AQ/z2vskHu2DYC1MSSOiYMxuYP0/A/88U57ES6H+nVzdOJp5T
	HC99byAZ48ibzQcma2VwZiwkm1P3DzQhSx8LUkJuoJGF20cto6TsQn0AomEgjobM0TJC
	doaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
	b=ksWWGoQj2gsHb+EKMKXupvWMlW8ztIXVShILq1/bqCVKL6Rh47yKxmB4wD39LQSRdg
	NUMByB60gXetJb10d1JauieGnP5xmb7LA+JVAfTwgAQLcIL8gNlHLApVW2p4AUoD2/YZ
	ug26dGBqNdHCx15nU7YwMOwEGr22nGt1num1+kBABDxVAn0HA7M1k5ycNOUtZOu2S3ZD
	1XTcS9Y/w5Unn6WjfN2RDy7DfrrG1nPEt82kzZ96kaFGQ8n6LGEUBUUkgAr5Xu1I3Xva
	o22I9LH7jEtq2plAw0Z4sCAphtq1Ctbj8zoE8D26unREct2FZO78kNqqoycI1WPLFs4J
	1cMw==
X-Gm-Message-State: AKGB3mIeDjkjpB0pwEUe7LFpMvn9F6P/xI0sBJdF6HK8VVTcQwomLDi/
	w2RwVjcN9vzA1yGoFyvqbOAuLmZjpr0=
X-Received: by 10.159.194.204 with SMTP id u12mr46617608plz.191.1514921803592; 
	Tue, 02 Jan 2018 11:36:43 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:42 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:20 -0800
Message-Id: <20180102193622.27215-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v3 09/11] imx_fec: Use correct length for
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
X-TUID: s+CzECb2KTaC

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

