Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp59192njb;
        Fri, 6 Sep 2024 05:27:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWW9yL3TxsC+fdgJMNk99D6rsK+WlpGxqMRiurgrkTRmqiC+ESFl8OXhcPLJbr+TZ1S8RSMNRNtE9u7dQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHk3GkGGK4/nY52j33GcJbUSc0pg/7CgEPDZOChvF2a2eEJLe34cOZIEFlPPm61dwEJ0QHo
X-Received: by 2002:a05:620a:170d:b0:79d:7cfb:884e with SMTP id af79cd13be357-7a9973284efmr259570385a.4.1725625634426;
        Fri, 06 Sep 2024 05:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725625634; cv=none;
        d=google.com; s=arc-20240605;
        b=fV05gK0iM0B/EQ7xDB2Vlmy6BfqpZs8t50C7U1G8jTzjvjokMdYjKgdk4/7YNBy1Az
         tlavTn51SwxB9EMBux42Vd735V8nsKvm+mB4hq8Y0JQmoIu94GtbrRAh+wIUm15CoQcn
         jzByW+ns7dE4rd6VXuo3DtGZ058x8bkQQJ2U63fdp38jH3zSG2WjX5MKsNr+gTGFooDL
         4NfUAmlXV170V9Y6amg4T+R5oGwuYW3U/+uTISzfiR3TuMVyRbdFR031myUBio+E98Av
         0kvjFxeYd0XBfWlCi6KgKU96gXgwJTg393cbT/CymZGn29wX4Altkbb56jGp/kT7Wc7x
         9ZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JENbbTmp0ErxcaPJIt5HfkB82B17/9dJt6qjK1TiuG8=;
        fh=MJNguGbhQwbe2wh67cWGD0t5jdF9jTiLMP7m2HQlG80=;
        b=GsA7kzDtvM49VXWv0+pN2mAVV22o3jsvgu0FkZggbLxVHJRY2QMpbwWIfb1wy1LJve
         8wIKaxjl5/FvZAnxvrl19KZOHxeC2F+vgZHnOzABazskoGXdQdemZUmuKB+CQdlDm7Ur
         X/GGhI+HlHr0FhmwjRq6KZPn1EoIBqQ+GhK9uyLicQlnS+q2R94NyQ33k4VZGEwk0I6m
         RkegcOdfkNviGDkBMpOhYY68hWejk0I1J6TgI/LpzPtIH8PtvanuVLXq1wt0FDcLVmBT
         z56KLrdkh8IDIy04jmZNWgKOwRz2iImNsKGaLiKH2ufag53rk1TpzaOxS2tSGlMBZ5OC
         T7HQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=OUbTWr0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45809c8c37fsi28604641cf.407.2024.09.06.05.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 05:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=OUbTWr0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smY2T-0001PT-DD; Fri, 06 Sep 2024 08:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1smY2H-0000e8-8V; Fri, 06 Sep 2024 08:25:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1smY2F-00023T-OR; Fri, 06 Sep 2024 08:25:56 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-715abede256so1593260b3a.3; 
 Fri, 06 Sep 2024 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725625553; x=1726230353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JENbbTmp0ErxcaPJIt5HfkB82B17/9dJt6qjK1TiuG8=;
 b=OUbTWr0MNgceh3DF+or4WtDwE3a/25+fJczozx0RANRFTqkXeXeeANoM+e18tvlF5E
 rcSVCCju+klwvjrukpU5U3E4IMVvQy3Bpa8OdLGihra2oRgrz5tBWkEjhzt4vTxpTEul
 BWMEZVWu+JfTgxTg7Xht07MGr6yxa0SoVNgfFmoGKg9EWFWFLnSc2RufPhArumxg9YLg
 GuK9BWf/bVJxszHTJJ3vZTjoAG4oT+TAy0SFX3SndMvubZqbePdtSpwNq6vZ22i4nU+V
 Yee/2QonY9EGsTBY3BPDAU5IhlXK+o+Gy3V8Wg9w6Y04pjiA32qAce5snMesjqasbvO1
 30Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725625553; x=1726230353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JENbbTmp0ErxcaPJIt5HfkB82B17/9dJt6qjK1TiuG8=;
 b=ibDHeIIwGgqSRWje4oFy+UVoNV5S2TXeHzdwRMI3lcW0KRCNLOia41x/qNQ3pjiqLv
 BuY65YiwZJmxBbI6cB8nYehEY0aXSMSwqlaQNGQkvGgY4NwFqxKM8mRqbM3dz1k0GgPk
 05GNtM7yvCCXOob7EwvaAP3uSh9+qB/HsGOczBcM/e5T/ypnjc/99MO/HDS44NJ8sl8I
 zeA7ErtgW9/mgiaOA0fxfc6QqYdkxkGvp/WbH4RRLxLauUHRW+TGoYnq+HCvKM3Jc8dP
 v6CYc2Rq9OJGdsFd216P8UbPyLP12lcpSbP1fu+bKqLvE8kAIpFNBeprcrL6YLQlAN88
 WDYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHmyGLku/xm2ASsiMwHarlTXIt8TG7fPzN8SkhvyT0Oe7ldi3g7p4cWfOGKl1HOsYcOJFfC3nEZw==@nongnu.org
X-Gm-Message-State: AOJu0YxHWaSHw4s4cY9ZXxZvnK4ofTjwV+3IbYUZlHoPPazgH7s+wwep
 TACiT4YMuhMJFyAm6QlN5DL3lM2Trc84X69BmX2XklELYVr7V+tCnj1VyA==
X-Received: by 2002:a05:6a20:d98:b0:1cf:1a3a:9016 with SMTP id
 adf61e73a8af0-1cf1d1f86e1mr2314817637.47.1725625553609; 
 Fri, 06 Sep 2024 05:25:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-718de738bacsm314951b3a.105.2024.09.06.05.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:25:53 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 4/8] usb/uhci: enlarge uhci memory space
Date: Fri,  6 Sep 2024 05:25:38 -0700
Message-ID: <20240906122542.3808997-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240906122542.3808997-1-linux@roeck-us.net>
References: <20240906122542.3808997-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5vIasu2c7NkI

hcd-uhci-sysbus will require more memory than hcd-uhci-pci
since registers for some hardware (specifically Aspeed) don't
map 1:1.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/usb/hcd-uhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 68b72f8d3b..d2993a98b8 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1212,7 +1212,7 @@ void usb_uhci_init(UHCIState *s, DeviceState *dev, Error **errp)
     QTAILQ_INIT(&s->queues);
 
     memory_region_init_io(&s->mem, OBJECT(s), &uhci_ioport_ops, s,
-                          "uhci", 0x20);
+                          "uhci", 0x100);
 }
 
 void usb_uhci_exit(UHCIState *s)
-- 
2.45.2

