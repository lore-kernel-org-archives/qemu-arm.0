Received: by 10.28.173.206 with SMTP id w197csp1021790wme;
        Thu, 11 Jan 2018 13:12:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBovGGKcwUVw/inqKBMK/EUwGeCg4QKA5jvMbsChvUlBqIZSlZTqlbqEdgjlTup3LZ7j5aFaR
X-Received: by 10.37.19.69 with SMTP id 66mr4648410ybt.292.1515705122813;
        Thu, 11 Jan 2018 13:12:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515705122; cv=none;
        d=google.com; s=arc-20160816;
        b=JjCND+/vVyNcteBRnsCP+0hmAndA+0VTt/QMC7wMD5mJ3SA/OIE2PCsEkoeTAqa98a
         Cv30aUsoU83YvJp5F6TSqHGelPorcL9jUwbhg/Rha9qar7e3S7A9ADeQSkWPmHTNhOiP
         d4LqssgUq6T1twv3KLDTy0IC7ZiYCxic5aXuKVeTjcIdKu9FrcJSg1++bqfPQuGEM3JS
         Z8+iVD0dfzAetlkEgTZF5RQ09QUhqybJ28Flle5ARJXU88jMjjuU3S68AdPRpmCRHjI+
         iTkWZGZM33BmAuuxvvmDJMtRYArC6bCrtpydyucfu360+SPCVwzYf3SribYF2O5m8Fmu
         +iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RPyxVCPTqw6yAvuy3WrDw0s7InlJ5TOtAXbOqVImte8=;
        b=Oz89ctJmXQwl3NxFFbYdRUCK1EdClj3v07qclP9qV0Z1L24byZXIh8ugBkIJLRQC4w
         rCRZ7KhIkUbO+k8JyliaaotClhcpZCcIORdbQksdbBvLVwqjmZjRA28wcQRZgbeHL3Hf
         s8x9ssMZG0mo8IvMjZrjrq2dLN3wbmXWlmgW30BT7VKi1WjLBgVpj1H4CYinGMYAg71X
         TWQlWJ5URuHxmSCjDeo9ayktUmp/JLLd2NcKiiN7jXmRW9uOh4B+PLBd7Ax/6VViAXPv
         5e/eduRWRsBWN9ZeCmwURQ4ZKoBhFLjky5lwrNAO58aBXvoA6V7t9ITt9rJoEdDWZtwn
         r84Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TUWpE0yN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z185si578091ywe.155.2018.01.11.13.12.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:12:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TUWpE0yN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk8o-0001bC-6C
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:12:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvA-0006Ph-8J
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:58:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjv5-0002uB-FB
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:56 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:39323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjv5-0002ty-BE; Thu, 11 Jan 2018 15:57:51 -0500
Received: by mail-qk0-x242.google.com with SMTP id r8so6096620qke.6;
	Thu, 11 Jan 2018 12:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RPyxVCPTqw6yAvuy3WrDw0s7InlJ5TOtAXbOqVImte8=;
	b=TUWpE0yNZJAO7f8eIP0u0CVBIsLGVmqIvkEyI1vzvU7kFa3JnCA8byAwWPJNH4IhOT
	jwqN+Jz4vMWvWld9doEBiy7rXxg9fkoRKgiyNPLslBcaXHPWMmbXKx1SSemmpTugKLpe
	VazXYxdNDw7teQUy9MO0dZYU7OhG5c6cldTOF39NvxnLidUszC8yuwTMinbzalkJ0H+v
	QacXiD3hsrmoMfRliJrTVjcxwe8ZDZ8oNC83kEYR4A2kVUYkcOyyye/7kzNzO6NaKi50
	0o5HAA5Y1nhC+sU4FHfn63pNWwQd2YRHnisHkoNVFqqqlWc8XD3h+Fv5V/AjvhU0uogG
	tb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RPyxVCPTqw6yAvuy3WrDw0s7InlJ5TOtAXbOqVImte8=;
	b=mz/x8eYu8qww4Wl6qwcxHDylGoyGe/XM8U4w3WG0kcwcWS8hIfwfJ4Q3wPiKcZ1N1R
	kXlSdv+kD1h1G06ZFvjFs6dKWh1HFUZJY8UfDMhg3ftPCG43vRoNKbw9ssF0dksD7b2K
	NObhKZ8A7fMZC4l+BzO/7nw4Zv9ElBZnnLD4Btdah1VvYx8SbWYeSz6X44H09dES4fSI
	YXyi7fmVC0CQdMkwcokrJXkyQUtar9CiEiqSly9c6KEkorA6GHQr9WxzCIcD6rKBEpkU
	9iyOyXWb2Up2nCbjmEwTTAANMt57ikzYVXbG/eeeuolU2B4ljmwOUqqao3tAOQsrmZzH
	JfMQ==
X-Gm-Message-State: AKwxytf1NDL3p4MivrYHpB+H3evmUCBqMofh9VoqCGiRbDc1of9sbxF2
	gBm6vNO8TDqc/jnpNDwdcBk=
X-Received: by 10.55.201.210 with SMTP id m79mr30904331qkl.287.1515704270719; 
	Thu, 11 Jan 2018 12:57:50 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:18 -0300
Message-Id: <20180111205626.23291-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v6 13/21] hw/arm/bcm2835_peripherals: change
 maximum block size to 1kB
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6oI5UxM2ivTo

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

