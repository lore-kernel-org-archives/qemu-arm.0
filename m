Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7488638njc;
        Tue, 12 Nov 2024 09:06:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+bGdSAPSCFl6CAO+Dz10x3XHDLO7fUKuHsnhad/vnwkcBJPxGbGnCiqxDWWRosoroBl058k5aIJimrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHZ6BRpnY4RItFCzZ1RzDvJAQNreSZxGOT1BFYRsU+2PGj2TqIpbjq+ZoEf6ddGTKTImg7y
X-Received: by 2002:a05:690c:284:b0:6ea:7831:e436 with SMTP id 00721157ae682-6eaddda3e80mr158661227b3.12.1731431208104;
        Tue, 12 Nov 2024 09:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731431208; cv=none;
        d=google.com; s=arc-20240605;
        b=YtB2jGgR/ta4H/9C5rforKJS/XhrwKFF7typi9xSltmk+mIUqbG6YLtVOFjnlVOWH6
         tlOzyEeAjNDB7tNcDbPagBodUHk92CCO/CoJBZCogjRe//IxA3ZIUuSFpF85mtqUZSOu
         fOjtvCVDoSccP/hjqx1if+x9kAWcNpuHDHKa8HYjGvnTrV7f/U4V7KrDGh/em9yIskxE
         Cu+rT/GinY0wuGUyGicpLH5IUrhy9eXlrts1mL3w6EHsEQGWhFgiRPLx96TFY5XYtFl0
         xUsyKD0dt7UP9m6siVJAN+C031idM+qsDBQMCPohMiEV977ku5GcDo2cUiYs2ILycsC2
         aJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PSGVGD/CY09xJGCeeutTvTvahP2uY1wNiseufhmpqRw=;
        fh=BkhXGqvt50q86KuF80WbJ3X5yAkiCvVSw8+X+/D86Fw=;
        b=QhvARu3iotrp1hfgsquhZOkrPj01X+ZToU9vnKN4VtRBi47A/CwHAXeZXeP4grHaC6
         ziehjocYY16oHz9aq7EV300EpPeHzcwVKflr4nv5LWD6ALeQsKfqt9qHCwQeUyauHnTF
         NmqDzak/VGU3SJFWmcwUkyrdVLiGqjp3XHRNtideJ++EJDgt8APMo1bQaOCK35Nhs+Fq
         bn2u/fBUgRQFKuGJGMjq35YxO4Z+J58qn2Eu0kmfGndiUvSbbMjxYLuQbbGgJS467xBm
         opB0K3CR9SXtasm4CopccwBKpSFNp/gMtZ79uocjqUi3znrYxIj8lmd9VsOvPKYvr1ue
         SE8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b="LQ7e/+aa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6eace8ab5f2si22981777b3.60.2024.11.12.09.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 09:06:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b="LQ7e/+aa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAuKW-0005jp-Ih; Tue, 12 Nov 2024 12:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tAuHd-0003Js-1v; Tue, 12 Nov 2024 12:02:32 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tAuHZ-0001Ta-4w; Tue, 12 Nov 2024 12:02:28 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2110a622d76so52164825ad.3; 
 Tue, 12 Nov 2024 09:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731430942; x=1732035742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSGVGD/CY09xJGCeeutTvTvahP2uY1wNiseufhmpqRw=;
 b=LQ7e/+aargvOBk3TIyGRp0qvo58wQ5pauuy51jcP1OeCsoc/hpx7tLYxR9Ygy8Rac8
 1w4pMW8vp7W2q4CPtcHOR+VeLG0h69asHDuHhu4ceqBJIJFMZCFNjc2WqPpY87ucDZDd
 9BgO+DQUm6QsZrSNPzfBiq1KorY5NxgGyqgaFAJi1NeaQ2MNXvbvjYhQGar1ii9nu4ay
 Cm6a8pUWQo32iegm3WZxn5GVS4DrsoP4oKMtXGUDVkG8/XzDc3USpGrqgdqU6wQu/tf8
 pa0T3HLz+Q4lO4WcPf1Jp1ov6izqrqP/Tel+WhLx6zbK0jLjKTC6vMHdLPhoIiFHYAYu
 oPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731430942; x=1732035742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PSGVGD/CY09xJGCeeutTvTvahP2uY1wNiseufhmpqRw=;
 b=Nkd6EcjJDVW8FJmqWkCsKyBXDsCxUJYCZjnDFVmOG6Zp4xxLsdO05Bi5QsZ/SXJLdr
 Sza56zJ30aCpffvxfTEBfabV+NVGr2qym6J3WaQZBrcb8n/+E5gbFB1KA7EipWffZ33h
 xNTtAp3nZmncWHUp+HY6IbqHMXtbIyqKZwY7d8GdrgZM5SxIQg7Wr8uZNL6Ur8I2uGxp
 kYaqVZwkiX9VIobYTY/GzRQ021RkTgvrXvx84M1rW0UTj4nJ+CNTeegDwfH4nPeyQLtU
 gNxATXFlQ1EMizci7ZH9fkvTK2wJ0kLuykA0Wcrs3FyPARXeq4FvRQ9wRrlXHsMB7u10
 Jn2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUChqsrflQkrBtwN84O4oDG3oitBIVy5pwobfuAI6B7fiu+L9zNo2pgpK8VARwEgBk49v9CVYJsyQ==@nongnu.org
X-Gm-Message-State: AOJu0YwfcVC67KX8d6pdbIYcQOz3Ywf9YOb3yd4Cw2t0dOSQo+lQDXrs
 c50lYEOpnFZG3DDKfFa2xliYHjev5/I2OQ+6q6O/KuBZj6tqvFWix1GP6w==
X-Received: by 2002:a17:902:e84e:b0:20c:7661:dce8 with SMTP id
 d9443c01a7336-21183d668d4mr238795415ad.36.1731430942122; 
 Tue, 12 Nov 2024 09:02:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177dc82e8sm96514785ad.49.2024.11.12.09.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 09:02:21 -0800 (PST)
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
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Subject: [RESEND PATCH 04/10] usb/uhci: enlarge uhci memory space
Date: Tue, 12 Nov 2024 09:01:46 -0800
Message-ID: <20241112170152.217664-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112170152.217664-1-linux@roeck-us.net>
References: <20241112170152.217664-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Hn4gdyG1bi24

hcd-uhci-sysbus will require more memory than hcd-uhci-pci
since registers for some hardware (specifically Aspeed) don't
map 1:1.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since RFC:
- Rebased to v9.1.0-1673-g134b443512

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

