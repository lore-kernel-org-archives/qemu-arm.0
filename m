Received: by 10.223.150.237 with SMTP id u100csp746250wrb;
        Tue, 7 Nov 2017 18:33:45 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SqfmMOqG9wKSk9SVIlUQTISdyGQX4FnEiwZRlivXanigMfPGTo0XcGYFbOLleA32rpCHbc
X-Received: by 10.37.16.213 with SMTP id 204mr458042ybq.294.1510108425642;
        Tue, 07 Nov 2017 18:33:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510108425; cv=none;
        d=google.com; s=arc-20160816;
        b=b+LLmKeltdOi2INnSoCwu7e+C/eD91CLW8PLsh++VVOAG7K+a86pSkfaJ/UZddr5IE
         8dloiENdCj+o3cJ26FnUAWRLZAhsSH1p80f0QX+8hCihrSfxx6uyLgLn+Ir/JOjDwFPW
         WhA+gvsWHixTKAtNbrXd1ptxzo2gaME8cGSYCYEvt2i/Cn5KedX35YHycr7QMCsAPe1X
         c2lrTFnn0g9019V2NA57IDes7MBBhQXv7N9fUkPtKHxlW52e3P7XK02AK78No6AZ82Mn
         5MbHZxmTswjendiPYIZvXiMN/smJz8Sgd1Y1KtLY12A4HkRTuC8WQvRfC2eJTDxt37ph
         07YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Q8sZaFtBmuE+Dfxl0SlMpk12qqV+DAd+RavSOP3SejE=;
        b=CRauXc2mI3gkwMrN7n1IoRVyFSeW35j29yec9PZVtDiSgWnLe0wAMMYeJ1HnIc7O3C
         T9MuSdFNtznLC4uMRIpbkqCJAZhfB+JoPagtzhtVa1EmUuqbeQfVmTwYiw+Q4vPfcNzU
         bbtXdNONZiz3NTBTLZ5P3jltRvLyRLilVh+bBSvN70o/IczRK8SWGefPsNgH8Fpggt/e
         9c9gX+mF57Mn2WSZW4CMJnpjjdGypjBTQPP8Qcdtgzp8oA4zZeV/dVx+xbpTSR72VXzV
         hSv0UUHbG62rKrz+yakPvHmjGxG2Y0IteTqohEh+pc231THzuyPRvNzVrxX4SFIAtyAf
         Pfiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H4qSmOoT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6si631016ybh.174.2017.11.07.18.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 18:33:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H4qSmOoT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCGBV-0002ls-3O
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 21:33:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCG70-0008OC-QN
	for qemu-devel@nongnu.org; Tue, 07 Nov 2017 21:29:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCG70-0005Ht-17
	for qemu-devel@nongnu.org; Tue, 07 Nov 2017 21:29:06 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:54358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCG6z-0005Hm-T2; Tue, 07 Nov 2017 21:29:05 -0500
Received: by mail-qk0-x241.google.com with SMTP id n5so1599881qke.11;
	Tue, 07 Nov 2017 18:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Q8sZaFtBmuE+Dfxl0SlMpk12qqV+DAd+RavSOP3SejE=;
	b=H4qSmOoT5eNq0Ev6VruEPAXjnSaWmXbYrBgkAWI+oDQoQtNvz+zdysA7jjeFhoHTFA
	Uv0tEHj7Hjcx6rq0+XPzOXfDaCQyAEcUMBqZ8WQpExoWZByduN4OVwf7zg0XeF+YZidE
	X1chGRy2wo6CSXwKFHWSWiBO1tL5qcVsvSjqgldq7l7ym7FjlSEG6rwDdYfVdhBllIp3
	fh/Uvamif0Wk2Z8fgvKooYSMyCByC1UPn9A26e+c02P/q04otSq6DUyapBWi9l04mg+W
	vE4UxCk3Hd1HhJKQEyj27XFZtTMKAhJHOwpHcljtl5VBXTnsJG1U4GxLHZK8oViiw6M4
	ffMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Q8sZaFtBmuE+Dfxl0SlMpk12qqV+DAd+RavSOP3SejE=;
	b=TZpGJpBYBIJ9uGKCdzq+2n18Mbof/TZCKgakIdx7U03DHia19Z4HE+TRcxU9xiiPeb
	1YH6IWUW0TqpnuY1rxThR5WJQog262dJudv/NerftSLZzBzZGPBlIKSvw1bWFriCKtdE
	D7uwgz7NIjFuubVJcyX/KMljybB1iVj+KdKDZh11zW+ggRAh5sOpKCLF5N9aLo4C2FSs
	UnoCG72t/njYWu4hqx/UOvSYchxc0+RcerydOzWn8M9G0B42qgBl4VZ0ysROqa9LMZk+
	PdyjRQMg6QnjQzoGC4bMsf3Ly3HN5jRLFozx59Vz5UrQdwZKeMkydNakS8vxnu1G4NXT
	p0GA==
X-Gm-Message-State: AJaThX5iQLLuclZ/ONRoBc7kQlizsIOUSaTSjyEGtTfB/YU8wysRTq07
	YigWE21h7uOqB9Z89ko4rZ8=
X-Received: by 10.55.41.206 with SMTP id p75mr1119982qkp.207.1510108145364;
	Tue, 07 Nov 2017 18:29:05 -0800 (PST)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	a190sm1971772qkg.15.2017.11.07.18.29.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 18:29:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Date: Tue,  7 Nov 2017 23:28:25 -0300
Message-Id: <20171108022828.7242-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171108022828.7242-1-f4bug@amsat.org>
References: <20171108022828.7242-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [RFC PATCH 3/6] hw/arm: deprecate the Gumstix boards
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oqkoba+vF5Jv

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/gumstix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index bba9e9f57a..160f7f089c 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -129,6 +129,7 @@ static void connex_class_init(ObjectClass *oc, void *data)
     mc->desc = "Gumstix Connex (PXA255)";
     mc->init = connex_init;
     mc->ignore_memory_transaction_failures = true;
+    mc->deprecated_reason = "Unmaintained";
 }
 
 static const TypeInfo connex_type = {
@@ -145,6 +146,7 @@ static void verdex_class_init(ObjectClass *oc, void *data)
     mc->init = verdex_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c0");
+    mc->deprecated_reason = "Unmaintained";
 }
 
 static const TypeInfo verdex_type = {
-- 
2.15.0

