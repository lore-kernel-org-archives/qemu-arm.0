Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7479667njc;
        Tue, 12 Nov 2024 08:57:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgNhzNv9vG+uCyhX7HT/V5AutYoEhjKF/CG0WixXz5n52uqw9kkGo+4t5FaLnxRGPacNTljQTfyeVFIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHXuIylw4Exx9GQGF2CxG2PYID2lXVUgU/mZGugYb7Kf/eBNJTRcukFd//RSKpEXnvLR6/Z
X-Received: by 2002:a05:6214:5248:b0:6d1:7383:9ca4 with SMTP id 6a1803df08f44-6d39e1e1a4fmr245375606d6.33.1731430650829;
        Tue, 12 Nov 2024 08:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731430650; cv=none;
        d=google.com; s=arc-20240605;
        b=Wm1duFh7rHIaFDgIaU5wVIDgq1qyA44F0UHisqyjhU3Nc283lAMs1HuJSz8k6Pbu+W
         zoWgn5UjwlotbPAbUGK18eU4sjgzdXnETIlFJgCQ8X/4VWDb6dduJqSiNrbsuihanxUF
         njOmajL7HP5RW0gDJp/FdIKXnmnuEDHGh2zNNo5QEjgw/sTpO0Mff3BHLEOYBFHevQvl
         k3cULs07N0+lZreBfe0Ycai0JTJe1+Ak62vFleVH3JxOIX5R6OT4lr4SgYki5bVjWjU4
         VI5fqKkgQFPnMmxkD/8L8qWPLMwwsurGrj5B7M4/ZYbodOsw9XmCmRGQzwySJPpUx4TA
         vS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PSGVGD/CY09xJGCeeutTvTvahP2uY1wNiseufhmpqRw=;
        fh=Xld+tkcDIGxx4coKF56QQg2zaufAWNF4CQtf7tdsoJY=;
        b=L6yrKcSK7brKZsVakdqmW8NPgWGMBw72rU/qsovBgt8y+pO0juGz5PhAkEM92AvCqJ
         UVFoXeRQjClRvvjYvUm53RQ5x9W+b+quv/sUhPKSRwYhwG7RSNBYokoj4RgINsBwXDDE
         LRHDaOljXtHm62Ok9LzApZDGI+ES00C+TG403oiTV7iEwAwJpMAbcYlu45N1VKAaWOLv
         eh49QcFYdZYTwEElU811hphP86OVEFuMTabqD0O/lpuHm4D5pKzwIHRJfxWptHlg/XjA
         ZlTgnj6CNR//sv+fHBU+K1HckVTz4BdiU6N4TMj5BCdCm1Yu1v0uR2w9PfpR/BVD1mSE
         jlhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=IvOfmciY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39664c5f6si137129346d6.219.2024.11.12.08.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 08:57:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=IvOfmciY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAuBz-00035r-AH; Tue, 12 Nov 2024 11:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tAuBx-00034p-9F; Tue, 12 Nov 2024 11:56:37 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tAuBt-0000fc-NZ; Tue, 12 Nov 2024 11:56:36 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-20c8b557f91so64183465ad.2; 
 Tue, 12 Nov 2024 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731430591; x=1732035391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSGVGD/CY09xJGCeeutTvTvahP2uY1wNiseufhmpqRw=;
 b=IvOfmciYSZSY2crofUWH6fFzNhpqBy6wSuX5GE9rwD4m2Ww3jPcwYufdeb+f9XoC+X
 JYVsKRa7KJsFbKiXrK5gIRLTRrG8ZDZX3j76ZiQb6UcGfL2t5Mo4UiAJ/FC6scL8PHZa
 kcfDAE3VjL9jDdmUxpTLpHAiufJGiLyo+B96MKQ1GqZxR9o8+IrGtUD+Om5EN+h2j29N
 rk7OTpfSSpU71hBFRvABBX93DUpptOVv3ketVruiK6pAted0hpIq+AKJPI8NDJE+amlt
 1TDgqeFvelyOUPXWECylvq/FtwAcSPYeWffMdga7XjNvkCdYFzoAa6j/O+zPlIPVTRSG
 TKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731430591; x=1732035391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PSGVGD/CY09xJGCeeutTvTvahP2uY1wNiseufhmpqRw=;
 b=tHvUyzBMCEhhWB3W8MXeBoLGlk26iNcF4QQvb5ZmYWHz2NxV2hFxZTCErlAZFIdGjJ
 Gq6QI7eC/6xu6nbU4fzrUFkai4KU0xWooZ2ijMW0LpJq0OJRfVCAjAXTUSJueTBVucz+
 aww4sd27TUyZViZvBOWbEKb2hM8xFl6yhBqevthuKP/5vZaPBBoAvA3Gzxcllnf1h6U0
 F3kkYKfgl2ak4E6qjLizM0p9gAQu6AjDZUHrqbjBwtcvp3lJF6rtyjg6U34ioInU7qgn
 gQKZKHFBwbyY/kEyIHsDdJsJMcq0XsHdydcMv2zSGjEYuBOUfB5C/HslaBBCCOnxfPEt
 W1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw82jaf9Y4pQjNQvHCiqC5yUgorMrM3pHyGz+jT8obvw91NG8rGjYr4+rn5QnsjzE6ykMaB5/n0w==@nongnu.org
X-Gm-Message-State: AOJu0YxrGve7Go0GDBwq1jEwpSUI5SbQONx2ktEo59LvX+bmQE6SGzoX
 UDnBveDJvut6smCZy7gpRBcCwzEO69ZOO7itvJKKSiPsLKnMnlWlGJ0G2w==
X-Received: by 2002:a17:902:d4c3:b0:20b:ab74:f567 with SMTP id
 d9443c01a7336-21183ceea7amr212975655ad.27.1731430591316; 
 Tue, 12 Nov 2024 08:56:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177dc970asm95824195ad.52.2024.11.12.08.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 08:56:30 -0800 (PST)
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
Subject: [PATCH 04/10] usb/uhci: enlarge uhci memory space
Date: Tue, 12 Nov 2024 08:56:13 -0800
Message-ID: <20241112165618.217454-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112165618.217454-1-linux@roeck-us.net>
References: <20241112165618.217454-1-linux@roeck-us.net>
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
X-TUID: /Um88Dhzx1zk

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

