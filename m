Received: by 10.223.172.38 with SMTP id v35csp4239837wrc;
        Mon, 18 Sep 2017 14:55:17 -0700 (PDT)
X-Received: by 10.200.49.129 with SMTP id h1mr50286069qte.330.1505771717710;
        Mon, 18 Sep 2017 14:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505771717; cv=none;
        d=google.com; s=arc-20160816;
        b=v7SgQLbfGg6b6C2f6B4zEzFiBEVPzZdBj67Ld9r4WiddPmNVsYwRKS03td9KcgnSmH
         cQDrBXwPWQztM28cutiURMRM1rMVsdy0bmd90k8N3Css3uH+lTL1SfZANA/l22Sb8IHs
         i++pxlKcFQxPGfe21oj8wrU9/K63jpr4T+jpPGOV6joxy4Rn6+soD2MKPTJ9NaHomwth
         iLsWnqgf7FY0iA3Gy/QRgcvn2oVKOzf7zow8Q0dyqTrSJzn2PYGKC2Upr9+M4gfDmiRM
         fIvj9aZV94s22HKcpraZg/z5WzbBuXbwRSIty/NS/hQNR0HkkjZwxFC4ULM9kLwBVv3U
         i6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=a9f8P6M7oLFyu0iB5ZYmbbA3iMN0aiScJr9Gi6SMIoY=;
        b=slWHssc9p47MS59nD/h6Ax+acXhUQEUwVB7WJA1etmmGm10BcKRaRRaPnEi6ITgp8s
         0So7WqjSZhWnqzcyPGm3hPgP3g5sskJGKlxYJXTnQsn/VLJ+MZwT3f3fo0e+8EZwg75w
         GRXRlxG/TSrBH7kM19f1lCkOqT+s9E+3BGhfy10euBhFEwxncZC+hWIQmrpn5BYus9aX
         OQktKxg3Ial0/D8B+OEtdKgkJFeR1CWDLpLwQbI1ecJ15Sd1zYYL4Wmumuk5OvcMROO5
         J6vNAsYhYQJIM53vnUN6kamwM0SctndCwdMjKiogzAJSyXIP3WReOAmR4J+xSwwpE9Zs
         vHxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=olXAZHvL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z37si7793072qtg.402.2017.09.18.14.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 14:55:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=olXAZHvL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du40Z-0001oB-GA
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 17:55:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du3zV-0001Gb-Gr
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 17:54:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du3zR-0006H9-D5
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 17:54:09 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34660)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du3zR-0006Gl-8x; Mon, 18 Sep 2017 17:54:05 -0400
Received: by mail-qt0-x244.google.com with SMTP id q8so1231865qtb.1;
	Mon, 18 Sep 2017 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a9f8P6M7oLFyu0iB5ZYmbbA3iMN0aiScJr9Gi6SMIoY=;
	b=olXAZHvLP1KIr7dNyDHwqPQ3RUmlTDVqHTV93mo0EDlJz6L2GQVaImFuM2b5jNjn1p
	uqQhvSj5vQnKzBijczTmYwoiKS6dl8OI1eYAkgNsg5r4iSpTXwQX0bgxz7qYOvNHO/dc
	myQovB7VydRHOQ1qtu6hjr4zV1snxI31/yzVg5tLeUVv27YKIuBjUuQD+j5c9pVdIFAO
	X291Obvb70KZcM9A8nfYaohFLXgbKfwe2WStvJzeZpMg3z4eoBfP0kqxSh4ojxeRQypo
	sI9zivg3gwHFJAlPDf79XWQ7C55ZJcRWbJplYxElV/b4ST7zNR6NUQEF+4oJOVC7LoBO
	iRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=a9f8P6M7oLFyu0iB5ZYmbbA3iMN0aiScJr9Gi6SMIoY=;
	b=O6lF0q+rY5a+uQsgclK/mtHBDWRWjN8uKSmXhFyJrykiUWqURMmQFHhoOkeIPUXmIw
	rStKN087PT/KEO2TOc1ReCKfA+wKmxDdvd9Aa+ic48OIquiZm/Vt1xj/dh+OWFc+vmlH
	DyoEsUaHD6jP2qQ80VeVt+ZzNZDEFHp+DbP/7ZCMqy4bEfetQF40+NvPcl8lAcKEP4oW
	rudyPRiK1IxjIsr6/+87K0YMJ5tL5LXQTFIcug3NdCs9L/ML4UgKZfuy1A8wAM6TPVlO
	q9+KelRQhIYSHOmC+gIHCDJWlneKCS1kARRPjUy9+DQArqGVvmSXDMdTAJeQ8E0FeES9
	3Twg==
X-Gm-Message-State: AHPjjUhe/Gp1Lv6B7UriocYtIilIWmaUv4OBpIdaBB7zq5IWdQeIBRH2
	XSD2WOZShDB+Bg==
X-Google-Smtp-Source: AOwi7QA6gh3Opj9gl2zHlqGY1yuDh2PmTnyIPYOfGcRRcpURPluJ6cv9GNGD8d2pNdIM5vlSG4RAeQ==
X-Received: by 10.200.43.228 with SMTP id n33mr3037794qtn.241.1505771644625;
	Mon, 18 Sep 2017 14:54:04 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	f69sm5893876qke.27.2017.09.18.14.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 14:54:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon, 18 Sep 2017 18:53:51 -0300
Message-Id: <20170918215351.16318-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <1505318697-77161-6-git-send-email-imammedo@redhat.com>
References: <1505318697-77161-6-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH] !fixup arm: missed comment update
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Had6Q8d5aP/4

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: 1505318697-77161-6-git-send-email-imammedo@redhat.com

 include/hw/arm/armv7m.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 68cb30d611..9ad316c76e 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -35,7 +35,7 @@ typedef struct {
 /* ARMv7M container object.
  * + Unnamed GPIO input lines: external IRQ lines for the NVIC
  * + Named GPIO output SYSRESETREQ: signalled for guest AIRCR.SYSRESETREQ
- * + Property "cpu-model": CPU model to instantiate
+ * + Property "cpu-type": CPU type to instantiate
  * + Property "num-irq": number of external IRQ lines
  * + Property "memory": MemoryRegion defining the physical address space
  *   that CPU accesses see. (The NVIC, bitbanding and other CPU-internal
-- 
2.14.1

