Received: by 10.28.173.206 with SMTP id w197csp6990929wme;
        Thu, 18 Jan 2018 12:44:39 -0800 (PST)
X-Google-Smtp-Source: ACJfBoukQII7nEooEWH73UOuask58ecbElLhkYy0Ne+H9MOBizsx/ezVGFBaLDn+DI+70Aaf4+Q1
X-Received: by 10.129.114.133 with SMTP id n127mr7121812ywc.296.1516308279616;
        Thu, 18 Jan 2018 12:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516308279; cv=none;
        d=google.com; s=arc-20160816;
        b=NLNDUecbQWMsEBAT0iLAYDIrX5REWCYtz7j0S/D+HUutERg8TbiI3ygC1cK4VcSIxu
         9d2gcW8nAGEA2Mk6egVTcG6QdOSzsk2fSbr2scUe8lKSONwP59mhESpMJ/aOYfettDDP
         F7y1vo+6UFz1vQ4ZwTe4BbpG4dl5qyGJuUoytktroHAvQ5uhjuUuvecIfvWxac0BUTec
         /0WYaTvNB6cevpylGZdpUmhAFAbLJG2tW1UCoI3AV9eub7NX/UmkEsRhEOiRs/8rz6yG
         Ge/g4xykiOF15KTkdPFjS2zOLjJ5bmmq13nlZCUnutBmQx4cQ/wTJwMOhojOEFmRoWXq
         Y73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RPyxVCPTqw6yAvuy3WrDw0s7InlJ5TOtAXbOqVImte8=;
        b=BypsBTtPcl0uYJNdqU85HhLX7ez6hCWv9iqpgOAPcFQyfvpbRv/YzyakDWP9K9ZZRG
         jgzSyPFwfbBINIfsBH6KvxaHqLZ3HMeDYsbHZEFCZ3JVW3TYNEb3cH3Tc/AsRhuE7W/i
         rMgVKS/6Zpa3Zb466/vsJTJP+BldKmaI/LaGAXI4oV/N6Ez0nfhnZTq73wWIVTGyWvd2
         iC5FLrEyN65d9BrYnz+4g8vwWKnEk6ifrmMD0BDf3hT38pVg4EG2lG/Zedi1N+kY0VIG
         5vq9kimqyjHmFi9i8GzKZUPHp2Qil+uznUZY289T4tC8EHDdGYFbXR/VmmiIjjEMV6ne
         Bimg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h1B/Whde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f84si1892121ywb.331.2018.01.18.12.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 12:44:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h1B/Whde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecH38-0002yQ-TJ
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 15:44:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH05-0000Y2-AM
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 15:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH01-0007Ud-Iw
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 15:41:29 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:42367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecGzz-0007Tn-IA; Thu, 18 Jan 2018 15:41:23 -0500
Received: by mail-qt0-x244.google.com with SMTP id c2so33611413qtn.9;
	Thu, 18 Jan 2018 12:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RPyxVCPTqw6yAvuy3WrDw0s7InlJ5TOtAXbOqVImte8=;
	b=h1B/Whde1z3TN3DvWE5majUjfrURb+4GAR3y+xq6tEXAEKsn3OrOKl7xZs7uVe6naC
	MGvy6VkhnYVXINfq4TuOXm/kxB4fq5U13Rq3tc6KOTvaxER1hfkt/5Q1XUxF4Ieoeukf
	2HVWqHYpx/r8l2aEjif66HLrIXmG5eVAVYNV+TL/bXWy53QCzkPJA9UE9t3uUTIqHHt3
	VYc/gxdu6t9yn++3j9kN6iWiLOCMq7YEJWkRwZNzn6baL0eJothH8Z4wweTiyQN8uB/y
	T13T8vwj8kS/abAsS81PjK6qBEI3pns/SvdY+t2WT370i605EB8H+6BbnN0jE5jN06KG
	h7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RPyxVCPTqw6yAvuy3WrDw0s7InlJ5TOtAXbOqVImte8=;
	b=hjgJFpCo3gS01/VUVXPIqeR8yUMwyeerMwhu3u70IMtCuQPKQMnsxY2VjOhYKOHh6e
	n3s95fJEnn2f3h2D4vSjX5j1/2neI5kGlIg9NsHgwGZWOa2I3yYEEnS/IaPnqK+fc2N8
	aS2X7lxVP8us+pdqBh/xo6BUzywmxleW3JLEq5vnEvO0vTpdoXInQXfHeSzvowm5nrtz
	F1W1ROIGa8yB8NmocgKC2vPBwYB+BkIRw3r6ao26wg9r0RReQR8RHF70lqQoINiFsj1H
	QNLgSjHHrn6hAbXS6yqEWJbSnSvXk7RDXuoeqeYc0loN+cZsWESMkwG8xV3HzCmJH8Oq
	ckrw==
X-Gm-Message-State: AKwxyteCnGeNZ2FrSlzVdG2MZUui79nZAo5UvCDEcD8ci4ZfDka1ARLg
	wU4IyreRwrHLWTwGlm/x1Sg=
X-Received: by 10.200.0.18 with SMTP id a18mr18298629qtg.162.1516308083098;
	Thu, 18 Jan 2018 12:41:23 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 24sm5484621qkv.64.2018.01.18.12.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 12:41:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jan 2018 17:40:48 -0300
Message-Id: <20180118204058.5768-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180118204058.5768-1-f4bug@amsat.org>
References: <20180118204058.5768-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH v7 04/14] hw/arm/bcm2835_peripherals: change
 maximum block size to 1kB
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GYzwwQ+hmguH

following the datasheet.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 79d680cb1b..72d4dd73b5 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -272,6 +272,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     object_property_set_uint(OBJECT(&s->sdhci), 52, "max-frequency", &err);
     object_property_set_bool(OBJECT(&s->sdhci), false, "adma1", &err);
     object_property_set_bool(OBJECT(&s->sdhci), true, "1v8", &err);
+    object_property_set_uint(OBJECT(&s->sdhci), 1024, "max-block-length", &err);
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
-- 
2.15.1

