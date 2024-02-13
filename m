Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp215386eje;
        Tue, 13 Feb 2024 07:52:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLo4WGixeZmZ8/2M5vyGKsms21xgJqxPwDMjXi7Z/ufhHD+/HCm/6Mm9t3pSCUJ1MdtqvnkCQzznHMDrTWMQ4xBKsuVBax
X-Google-Smtp-Source: AGHT+IECVWMtsqvq4WZuH2oIXa/Myrz2I9DJ16ErwDN8i7cN2C4UrKKxp7B5dvR7uGVGwgY7omR5
X-Received: by 2002:a9d:755a:0:b0:6e2:e09b:a68a with SMTP id b26-20020a9d755a000000b006e2e09ba68amr7476261otl.21.1707839559052;
        Tue, 13 Feb 2024 07:52:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707839559; cv=none;
        d=google.com; s=arc-20160816;
        b=oQAYmDDaGQknyxv67srlt9o0ctNRMjvhK+X/PJWSImWh3ua5wo38VgS9AcSstSf8yG
         FDUvLGfP4o26MvVbRjyPuk646mfeMqxV9oznfQUVlpKONRuth7eorYQcqFpCOUpMmdVG
         hjN3BfM9k1iRp8ljfirRKguFHPAgnI+JLoA4GuBV6C/EQp0YRMyQgNc5z/yudHRe20dL
         seVfyjMdIoVWkZWgTT3HyTulkNj55NA2BmCgzwzrNYdThCMkJRzgoM9UoEGJROpHvJev
         5D1Zs7aJlQ2F308o6oQnHWFWSqmk0+vbk5xvdfttrjtfsFObOuaLBNklar/eviYaDoko
         QWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xSsYQg4U6OTgmMC3iEdz8zOlXRVYqFoVVBPQrIMDRro=;
        fh=jv2mRhbV3u+NMB88xXNGpiWJpb8cs8mA+mFiHTagz+U=;
        b=vcu6a9pOxYmVaIEiI3xQ1hmQo8P1RsjKwpj/qHzYOQIyZqP7T/MSLIUZoa7EIWqWh1
         y6j1h6UPSnx8rZS3/EuetQ3GI/GYLKVB4yhxm+caqpypfA9ELA7V0jYt9dE2W6k0Xxjb
         bNYsKOsO7QcjaihFX6LkET45//uBqhTHaQcpnw2tISMAaipqroittiJTTuYkki9dcy+o
         mTWAqFzTckGnX4g6z19/FBiDMD+WaHrfXCKJuLby5D6K8rKZltcmDhlbFIuwwBDHNNx4
         k08VY+gZ24bY7iVzOiR4IWEDhnCsNOUHtqBLcAkdwAKb1/AReCOQMf1QsyPdfkdNDEZo
         9TWQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tUNaMDNP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCX5w3GbzRF10vrUbH00alvkUmRlZTC4bbO7KaejrkOFCw+BGcWU372fdpRp4W3xtUKhUtenkcuni4vI7mxan3+N7DXCwX+p
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a05622a00c700b0042c4b18bb07si3441974qtw.440.2024.02.13.07.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 07:52:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tUNaMDNP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZv5I-0001Jq-DX; Tue, 13 Feb 2024 10:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZv5G-0001BL-L7
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:52:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZv51-0005hC-D9
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:52:34 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso35553375e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707839537; x=1708444337; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xSsYQg4U6OTgmMC3iEdz8zOlXRVYqFoVVBPQrIMDRro=;
 b=tUNaMDNPZsIbcjKrGQqO5Y1qFPeVBf83uqj4zRrjgaCX/gaJun0a3IPduwUcrxAFcn
 bcQuBowVLOxEbxYHycuP1AHlgLE/UQ7FkmVVgaYGle+nN4rQxNRKtnS2k659XbqZ6sYM
 L/uloQjoW96XKmZyCu2BidNLUPWjRCybgu8jCZow8A6F53Nxs8mGfJmFhCa8vSBef/0k
 Nk2GD45PrnlrJSbVFNDgShr/E86nzecPG1eDfGC+57L9cy/0N/P7yXauY8K7pOEZjpDx
 PltIkFAnOQBzS8judj9RgUWDoJbktM24OSqNRUUCbzMVq9K2jqcvbgJIz04TrOtl58Vv
 R/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707839537; x=1708444337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xSsYQg4U6OTgmMC3iEdz8zOlXRVYqFoVVBPQrIMDRro=;
 b=HZNyXnCOEOgO/Bd2TEZbNewwSnEiYCk8KYMIEqhH3/FyLLJxi1k1pXnCxHhCr3dhSe
 92W1oqRHFjSssJ3HEAAHE4CP/LNVyyV452LoTAlkV/XE5NBbShH4ZLetPV3k7pxsr1rT
 q48GgNHV34ae8zZk7IxTHgxGhGusFCgoG6cXYdZ34HFO6mchlkFgOZs4E8Yt7lKXS+aA
 wOBYLRpp+NoxOkCcvhQHi5PJnMnonIGHZ/+FbZD91vY6JL0CO1vuoGuP/WmFanLCSrap
 NBwGlN/aNOZ015jpKmoYPLQ9B3VLgJeuq2hwsPjzIEujeW6eznCo6Ft1BpHN0wH39otn
 ECOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4SqeFLWg0KEvpLqL7bdgXkdTpLq9Otbs79wKcV3wXIZ/yj7mrkNrrH/r0eTRMKLxffXWizUgaoh7SCTe7fbu3hMHO
X-Gm-Message-State: AOJu0YwmCzM1EeU1XuiDZvW1oa8Mi+KeOfmcQYGSWkXNGNoUYjyi6VcT
 WzU58+MZ5edu/TzqnoGZ9ph3mtwzSrf9XcpJ6/zpuN7EwUcxKdUhk9FaJ3wKilM=
X-Received: by 2002:a5d:5988:0:b0:33a:f689:1bf7 with SMTP id
 n8-20020a5d5988000000b0033af6891bf7mr9251095wri.48.1707839537468; 
 Tue, 13 Feb 2024 07:52:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXAG/VlkQjB9+ZR9V8U5bDEGjdaOL4GoCAFLfu+3iPA2uZzEGKuBIyg+8+VglZmEfUv6NrBWekiuT9/KOwV/DsugwlbGYOhCUELH5zmHRPlacdt9jfVrLUBpgdXxMdNipxE6iUdpRlTee/kfQapznE61A==
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 m41-20020a05600c3b2900b00411d0b58056sm766181wms.5.2024.02.13.07.52.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 07:52:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/4] hw/arm/stellaris: QOM/QDev cleanups
Date: Tue, 13 Feb 2024 16:52:10 +0100
Message-ID: <20240213155214.13619-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5B1ptWrTIhvc

Since v1:
- Rebased
- Split I2C reset as enter/hold/exit (Peter)
- Added R-b tags

Gustavo wants to access the QOM path of an input IRQ line
from the NVIC, but since the device is orphan he ends up
with this nasty path [*]:

  -device ivshmem-flat,chardev=ivshmem_flat,x-irq-qompath='/machine/unattached/device[1]/nvic/unnamed-gpio-in[0]',x-bus-qompath='/sysbus'

Add the missing parent so the tree is now:

(qemu) info qom-tree
/machine (lm3s6965evb-machine)
  /gamepad (stellaris-gamepad)
  /oled (ssd0323)
  /peripheral (container)
  /peripheral-anon (container)
  /soc (container)
    /v7m (armv7m)
      /cpu (cortex-m3-arm-cpu)
        /unnamed-gpio-in[0] (irq)
        /unnamed-gpio-in[1] (irq)
        /unnamed-gpio-in[2] (irq)
        /unnamed-gpio-in[3] (irq)
      /cpuclk (clock)
      /nvic (armv7m_nvic)
        /NMI[0] (irq)
        /nvic_sysregs[0] (memory-region)
        /systick-trigger[0] (irq)
        /systick-trigger[1] (irq)
        /unnamed-gpio-in[0] (irq)
        ...

[*] https://lore.kernel.org/qemu-devel/20231127052024.435743-1-gustavo.romero@linaro.org/

Philippe Mathieu-Daudé (4):
  hw/arm/stellaris: Convert ADC controller to Resettable interface
  hw/arm/stellaris: Convert I2C controller to Resettable interface
  hw/arm/stellaris: Add missing QOM 'machine' parent
  hw/arm/stellaris: Add missing QOM 'SoC' parent

 hw/arm/stellaris.c | 47 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

-- 
2.41.0

