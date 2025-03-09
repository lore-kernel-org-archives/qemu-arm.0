Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606616njc;
        Sun, 9 Mar 2025 06:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXF9YVSW+1pBj2wPABDnXgKuoSbOa5M3kGXsF3eq3hEYY2++47i/ObKWg5j3xu9N4WyQ2s6/i4lCGP5Xg==@linaro.org
X-Google-Smtp-Source: AGHT+IH1hqTvrE7uMmZXzMeAH+Y6zPiN7l9NFgFEkvM2AGptYKY0hSMWvVM7k4YA0e1CBedHX4Eg
X-Received: by 2002:a05:620a:26a7:b0:7c3:ca0d:6ba2 with SMTP id af79cd13be357-7c4e61ec93bmr1483748785a.58.1741528410650;
        Sun, 09 Mar 2025 06:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528410; cv=none;
        d=google.com; s=arc-20240605;
        b=KZL0A4RY00A9jdqGoH/euJKjniY7gk16kwqwSXmXyIUB+2lb+8upJe9qbu7yyIhIi7
         TdoYJZpsJZIkMvR8aSXXEPcD+uDAHkhCh9CM9oyxbb5LZmThpjxtjJkUm4hgPH2Gr/T2
         DSRDHdaq7TW0Uj778X7bGpWavDAimINmOIgmdAQXnmbSeYzEbf/WtSJyq1xUNQ4AvEKh
         I0v+m0pIr678s2732rOin0k83HtWaV5Fy/PSC7FCo5oh89SCdpNwdpU6r+rr6zGooEC/
         WKBqAotl7Ny4jSCLQ3cMpQ3RDlAIADUZPilRRRMu3bjt51n7Gbt7Q9m1zkoKATOUQVeY
         AoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LVXUEqakFFGFIufSKgqBIp/Umytf/vKztB32JmTIl68=;
        fh=GLQWF9GIKNJw7BGJIf7bqeGCRnGQUB/o4OntVr3KiAc=;
        b=HowCx/0aaEXpWzXOZU29b5DMnYznTDCUDnQAhtVoq61Av0hYMKcx+UFqwEAmk8FBSN
         Hf9gDzwOltJgg0ex20iI1QY3zpk4ogMES3WXmcqjIQ5Yex8JHDhY/2UJYt13TieF3WtK
         zTSLKMuJVgNUtDoMVeuAONVEva87f8mASUAQ1nYufjL1Peaz8n6eh3yB7DSxnsQt6w0V
         L5a4RfMzgGOW2uKARLRgoMi7Luz+hThSgCv7+DKxhoqH1tlcYKcRWXMpPvbNpPIk093W
         47hGmETO3fn1g0Cl0SGwI/Z9+nv9+WngCDQVwfw8QATIulT4FMpcdFsx0fWA9+vo6GUS
         qINw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kf1vZOFA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c543ba76dbsi252326685a.368.2025.03.09.06.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kf1vZOFA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH4b-0007ax-NX; Sun, 09 Mar 2025 09:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4R-0007Wi-Tg
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4P-00029P-Py
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVXUEqakFFGFIufSKgqBIp/Umytf/vKztB32JmTIl68=;
 b=Kf1vZOFAc22FbFVixpNegpmi1BI8Og74IGZ3tio70kjwGMINaYWdyODtcZ+BLpVaeMAj4o
 77LmA2+fhwoupkShND5TKgyoJR+JwxdXA247jExw95nDItEtTGAym9aU2T4AoxMKSV6maj
 FtWrz5zU/i4C3KJ36OICCb8E6UpwLiA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-hh_luJo7O4uxhnC-lK0neQ-1; Sun,
 09 Mar 2025 09:51:53 -0400
X-MC-Unique: hh_luJo7O4uxhnC-lK0neQ-1
X-Mimecast-MFC-AGG-ID: hh_luJo7O4uxhnC-lK0neQ_1741528312
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A63ED180035D; Sun,  9 Mar 2025 13:51:51 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D730B1956094; Sun,  9 Mar 2025 13:51:49 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/46] aspeed/soc: Support Non-maskable Interrupt for AST2700
Date: Sun,  9 Mar 2025 14:50:50 +0100
Message-ID: <20250309135130.545764-7-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IIYe28VpmurZ

From: Jamin Lin <jamin_lin@aspeedtech.com>

QEMU supports GICv3 Non-maskable Interrupt, adds to support Non-maskable
Interrupt for AST2700.

Reference:
https://github.com/qemu/qemu/commit/b36a32ead

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Link: https://lore.kernel.org/qemu-devel/20250204060955.3546022-1-jamin_lin@aspeedtech.com
---
 hw/arm/aspeed_ast27x0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 2d0c99f1591c..3e373f966b5f 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -470,6 +470,10 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
         sysbus_connect_irq(gicbusdev, i + 3 * sc->num_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+        sysbus_connect_irq(gicbusdev, i + 4 * sc->num_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
+        sysbus_connect_irq(gicbusdev, i + 5 * sc->num_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
     }
 
     return true;
-- 
2.48.1

