Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp307338njc;
        Sat, 8 Mar 2025 13:38:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNAy+Mfo7kwJJkk8gErSRFEBCa4OXnYpelugxZ79OOppM99wWw2cjKXaQ2Lvp4TYHUaTqlNqjKeDvOag==@linaro.org
X-Google-Smtp-Source: AGHT+IF4yh8uozBYG5ej2Iopcox4Ojkj+nskPD6+SQ2ZWfuceF/vGbo81hCoWZ7HPEMMCpiHB0Rs
X-Received: by 2002:a05:6214:e6e:b0:6e5:a0fc:f65d with SMTP id 6a1803df08f44-6e907cd8cccmr59179886d6.10.1741469916386;
        Sat, 08 Mar 2025 13:38:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741469916; cv=none;
        d=google.com; s=arc-20240605;
        b=hhXgs8fK9jLKmOlrxR5dZgYTs/iIh5TRcoGa/s2t5ssigWH/01z/QCnmZ1fyoIwjuz
         dXvKH8OoTFYjRohoJGK6ue9zHiglWUSTIU1KKDh042nRaBv4nq4NfFXbPKb518YqmVry
         FURtHwv1zZprIGYTqYByRhU7bqTGwszOiZrsp9ysIZvXciJWjXrTPQ9MVZQLheuYQ/QU
         aHZBIoesnf+ytvBdnNVNBCEiLbGVTNaLZCX0Fj+k85WrWRm1OD/wnH9H5pwxsR3VmwVQ
         XYrUsHz9a7WEhndZ4N1Y/2cqfnk/D5x3FYN31qw44dNPc/FxN5wBQJmGnFfKQ7Suz3sb
         5s3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rGeGYkd/RvTeD7MNw4buaroHbkJmR8tAE2eHN3vxKfs=;
        fh=TNsDfFn8J/cdDfoXQ6bq3iq7FlIJ/aYiaHNtYPD9y8I=;
        b=kMEHiNwrafW0VIQmLOhPifVoAZRjoOsRyBrdJUCZU6nmR4kAfxPx+zwSiUPYXDrsgS
         opLN80fO5zP+MjZhPyEClBO6Y0MW8LYMQIuX9wiQV8xPd5g7+NlunSkKUOsFNuWZ77rY
         dJnP//BRlJ+u/4CCuETIwB5YqhuNNKiyLfi+6Q8WYkSHv2BmXdVWXFBcAmJai8caZf7T
         yDJPYYNhVL1TiuTvYtmQPBCe4ypV5HK1vVkU9LgSgWP6jKt8DV4awXMvet0+dwaoEOXW
         emd+TvQbWcRHKT5cgMIX/+1vf8I2Yobw9AgPGyq1UuTl9aY7iiom8mwHxtCfsDY9PZCz
         JsWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gjUlNPWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7174c23si62717086d6.314.2025.03.08.13.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:38:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gjUlNPWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr1r8-0005VC-48; Sat, 08 Mar 2025 16:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1qv-0005OS-0Y
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:04 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1qt-0003tI-Ds
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:00 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so1556658f8f.0
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469818; x=1742074618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGeGYkd/RvTeD7MNw4buaroHbkJmR8tAE2eHN3vxKfs=;
 b=gjUlNPWTugBQD2cSA/a8U99zncJYPIx7pHUmrDsBWEia16XmZzrqrYD3L3NwzAb7wO
 cpuLwJ9oss1pmskcInwY3WSkVbeDY3GCkyqncZn9jzAboznTO55DClQt2odWLBSIhILO
 LVlYlliwnfjPPeBr6O3N/9UMHk7j8ZKAFERBBlDoNpdtgfuOXRYeCZOWroCpzR0zqESA
 vfniYH6+Di9Yllibfz7Atl/CzAP87eeFezzLLj40NALR+UWKVKCI1heWgpFDdvSFFuyP
 Cox7Gt2WBiW1aDixSU/CiWuyNkHMRGAm9o6+s/Op+BqnpXXE/wdbAT9ggRS318+Vulot
 dbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469818; x=1742074618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGeGYkd/RvTeD7MNw4buaroHbkJmR8tAE2eHN3vxKfs=;
 b=UfRbwLoet52DZAqKfHzFI6P+gxl68xZA/G80TgiAvfsDq+EBqYZcgwxcqWsTCaT31V
 BhNUJcW3vaPtWqtMgyHiM6YQrCWsUkBHVgEWq2TIZ4mYAs60pSj5IEuJ9SBVdP+mw2LS
 4DTWYYYdQu+cxIXr0eqImyXC6LucRBKfjfU7VsVL0r/S1JDx4Gk3Z7I7Y5qqcl7W9D5K
 qprKUubJRH62gsrcchjaz+kjDgoUIHILfOMfCQJh/vW032lwXHYC6j+H1juxXrNNCGIl
 yMkJjiALJ9kmdBBW3iQ71HGufkG+1pVpOwery3tffdNOxvTmVp3BSy7vomn+i77D2CFX
 ub1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCURFfE9Oicg8yDpZLe83VXn4gmrFIkNoq7p4FBm3iH/VQC0pWPU0gYd1g/YZakYCZTDBxSr2NYSsg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8fp3YWsoUo8kfp2Ctl5BEnqLPqZePeC9jfrAzI46P4Z2m7UmJ
 M4+SJo7KIeDZber4gjncjRIBflOkimv97iFlfR72QV9mL9YL7b5ws//3xABMDwk=
X-Gm-Gg: ASbGncuN7/gh4aNzu+bwwlbaz+UtwApIolssTaA4MqggpKoUw55OaCArRtKQe6A7Mup
 3zT6oc/HFbMHUmZ6YJHVuPdH+pDUbg2HL5VdyI3mvH4xraIufOhWZZLSoZorY4tTkZfRBPQHpOR
 hxaAbDLivzk8NK/eblHoaLz6gKnCuvyI+K7RaCnpcZ2ktnzytBuyfE754hQqadnxVY+GD8fyO2Z
 MWzM+dYnGnEttVf/UW9NgnYYa65ywV3+VnXsHNs+fz84RiNR7HHBHx0EEuSi6Uqj/VNyKmkSjrQ
 eBq9EFSXj+rvokQ1BPl0eMNZ82m7n8KrgYckqa8vmGnx4fU+ftXGslFQeb/z9BsHZ74MsMZ3p4p
 Uiw6xgybfpPVPEQwTTNs=
X-Received: by 2002:a5d:5987:0:b0:391:2bab:d2fd with SMTP id
 ffacd0b85a97d-39132da96c9mr5536253f8f.37.1741469817935; 
 Sat, 08 Mar 2025 13:36:57 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cec487fb2sm22294015e9.37.2025.03.08.13.36.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:36:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 03/14] hw/sd/sdhci: Introduce SDHCIClass stub
Date: Sat,  8 Mar 2025 22:36:29 +0100
Message-ID: <20250308213640.13138-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308213640.13138-1-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8Vj5SJx+zFFu

TYPE_SYSBUS_SDHCI is a bit odd because it uses an union
to work with both SysBus / PCI parent. As this is not a
normal use, introduce SDHCIClass in its own commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h | 9 +++++++++
 hw/sd/sdhci.c         | 1 +
 2 files changed, 10 insertions(+)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 48247e9a20f..c4b20db3877 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -107,6 +107,13 @@ struct SDHCIState {
 };
 typedef struct SDHCIState SDHCIState;
 
+typedef struct SDHCIClass {
+    union {
+        PCIDeviceClass pci_parent_class;
+        SysBusDeviceClass sbd_parent_class;
+    };
+} SDHCIClass;
+
 /*
  * Controller does not provide transfer-complete interrupt when not
  * busy.
@@ -123,6 +130,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
 #define TYPE_SYSBUS_SDHCI "generic-sdhci"
 DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
                          TYPE_SYSBUS_SDHCI)
+DECLARE_CLASS_CHECKERS(SDHCIClass, SYSBUS_SDHCI,
+                       TYPE_SYSBUS_SDHCI)
 
 #define TYPE_IMX_USDHC "imx-usdhc"
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 149b748cbee..4917a9b3632 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1960,6 +1960,7 @@ static const TypeInfo sdhci_types[] = {
         .instance_size = sizeof(SDHCIState),
         .instance_init = sdhci_sysbus_init,
         .instance_finalize = sdhci_sysbus_finalize,
+        .class_size = sizeof(SDHCIClass),
         .class_init = sdhci_sysbus_class_init,
     },
     {
-- 
2.47.1

