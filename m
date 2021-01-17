Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1966482lfq;
        Sun, 17 Jan 2021 11:25:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSFOQt3iHaFlnK5u/FOCBTE/39BzhnB5sS0qREusHpK1XjGYDI69WyJpqDeUh8wOkY9W42
X-Received: by 2002:a25:c090:: with SMTP id c138mr17343440ybf.194.1610911557743;
        Sun, 17 Jan 2021 11:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610911557; cv=none;
        d=google.com; s=arc-20160816;
        b=sfvB70jIh0Fi+tZ7sd8sfQlYghjAb3uGOj4x9lUcuLJOK4c/smo0HVVW561eia34Z2
         dYO3MQZjZ45oqnqAhpUUEOKHEJwPdIyKZ68jdIacrRBzwGx3IY/L/g91nOf17QT9beVO
         N6fvdUz0bZ4tKfNmhoAvqXjhTqAwuFRyKtHlAhfeyx6yzvhoxmPxvxf4dfhp3xIs6z+a
         WPaSAibweVzxXXuikGl248Nvn1Qnd1qHj//NgiqyxSKs0N09yL7ulkm0ivTfgrsFMGB5
         894CRGdJydm1lmm4TWKhWJPMys5crLqW0qQp8BuAj+jg3w+itkwbeZ2JB9ki02KQ0htr
         r3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AlGU2nsRUdTo0zfYKpVmo6pCOia5Vbf+z0yVnRjS/M8=;
        b=v68RlGyx5CYwoIFcPC1hSqVyC/8FqohXzrpv8dW7pPnSWSlvtErG7yb6GXDwvPUs3h
         IMHhXn7llIZT5Kdyt4KSAR6xe9QruBvhKJYaZBW2njDNA5ZK3HrG1H5rxDdlA0DKtoUB
         f+kgKbDX5+4KxRipfXHPnt3e6rDfEStFcxIe39t80e2SeLeWrHwYPv0oXRCTe4GrVO1U
         yfPkjrlbrhnyfZ31qP3RhJMjA/oZaNKNy2tXkBxbxKakZyy1eCL210iVNkrqB8N7LZai
         NARoLh2fAUflZ46ZhpXP14fboBDmPj0lM+w9etKQDcupA9ClZt1yjvhLc5ZBhq7SnLI0
         ePSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nqSVOhr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si3672576ybo.131.2021.01.17.11.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:25:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nqSVOhr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1DgT-0007hO-4S
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfq-0007eZ-2C; Sun, 17 Jan 2021 14:25:18 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfo-00052P-NO; Sun, 17 Jan 2021 14:25:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id v15so10793792wrx.4;
 Sun, 17 Jan 2021 11:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlGU2nsRUdTo0zfYKpVmo6pCOia5Vbf+z0yVnRjS/M8=;
 b=nqSVOhr4bDYAHt6sQopLvtMo2XRxmB7nW0+Z1zomvfYV2slp8usJZmsPVYy7XO/RCj
 n3gczAXJS8UT9Ac7MpiUJV6xB70/EK7cgaVOFSrgeppH/eXe9XFDFZvhUtSW3zY+r4wM
 DdZ0YD3KPsflQeXWaMffKZMYb/4TP8bUiw9sSDgYyqlF0GnTx4rjBhWT8xozR5MzpuCe
 sPOOLYtd//1aP1HFMxGHbHKO3YIVJDf+8skD0DFPAgw7kZNUCuymgrU9oaUo5mQgffo9
 qpVd/5qR4Seyx+OUa/Kdkbfrd9qcgUsWjefN6zYTFz2EY0OxQOlVaCzkz1AwhtadLp53
 wNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AlGU2nsRUdTo0zfYKpVmo6pCOia5Vbf+z0yVnRjS/M8=;
 b=ulNvk3NcaZXRZp7U69y6W7kNs+AyLfvLcxNKKfIPhTX2aw2wiE8Du6L1hFmDuxpYvs
 GBk67c6fif/cgKk8WDy5SmbG93LPqFDkwrhdSAqkoHrgWdZN5LyT7yuTteMIGxYN68pV
 YaZa1RAs9eZm9O84rfySy2BBGQFOOisGfBkH2TDqGYbiQp0zybC+2N9OtfbhzSD+t1Dj
 70ElO49Yaf8N+FaSAmOxrUrORa91vfr8nMzu5ezUnJSgh+OwfY7xcrSfGQc/xhOq5ArT
 ApCo3Ih2c0u9Qogvu9nW0e//KB1uswKHFIhzuyHMrzUiJ3SDxc2ZRU49Ix4joHYbGcIK
 MGlQ==
X-Gm-Message-State: AOAM533/5lKCjP7t/2muNgdqv6QotVqT4d+N4whd2fkHtavCcs+gV4/D
 KpDqIuPJWZ/1vS2DyE8h8Bw=
X-Received: by 2002:a05:6000:185:: with SMTP id
 p5mr22521077wrx.403.1610911512273; 
 Sun, 17 Jan 2021 11:25:12 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r2sm25630352wrn.83.2021.01.17.11.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 04/20] hw/arm/aspeed_soc: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:30 +0100
Message-Id: <20210117192446.23753-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p8nbuvr4nyxK

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7eefd54ac07..b503d32fef6 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -407,6 +407,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
     dc->realize = aspeed_soc_realize;
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable = false;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, aspeed_soc_properties);
 }
 
-- 
2.26.2

