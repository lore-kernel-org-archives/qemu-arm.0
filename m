Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1309744njc;
        Sun, 23 Feb 2025 03:48:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkqrwlwM6437QV/825k+o0SIOl69Dro/Z8rs6tFrYJuTwN+03nG/ZiNSc0GZbSLSVmnCBXrCSv+aMNDA==@linaro.org
X-Google-Smtp-Source: AGHT+IH+qoKx0RUp2LvZujW1jkgIufyLONYgzRSp8G4tI8CBvd4BfNLT+RIh62QrAkGBa3F8exXW
X-Received: by 2002:a05:620a:1a18:b0:7c0:a944:c22b with SMTP id af79cd13be357-7c0cf118597mr1315712985a.15.1740311317161;
        Sun, 23 Feb 2025 03:48:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740311317; cv=none;
        d=google.com; s=arc-20240605;
        b=aIN+doFIgCD9k9Z+WE+Dm/LrhKzVBr1qJ/w7cD8yZL5jsiiu4BZAZZoYDF8nqt/hMq
         w+O3ZU8v4U8GokHKoe/Y3bclDxLHFs2xcwpjjmNuoPkyMXN2ypIhRW2K8gTUcSludu8B
         0QEacRhCUMEwGAZf2W2rMO9oRL9SaETELmDXF/9+OMZ423zQD0X5ipeJt+SBnR6sHVYj
         UPzi9ajaVPyk2HEi1dQAPBN9shzi9NCuSe640keg4u0xV6CoMz3B8gvqcsq0OEbcEvJS
         tXl5gnmWq8wRMWgoh7u4udHQnYtQe0xNkTMfi/7kTViY4xDHhxefNcTksLSK73j19mp0
         ZdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7YIiAkHCNYFkCmeDVpQoR2NxLDJUpXDkIjUftXDRK+4=;
        fh=mkOPUiwPNM6c3t38jPZ54+CCSHmSJ4WNEu0iQqyxf5A=;
        b=P6Sq3KWT0R3bQUy/gi8X/wSasEKpTs28Yi7RD++fd4Dqo/upUexKCEb42Zy5bzS2Us
         F42ypKEMggWzkLRkku1fkSR15Lvw2UJiOBomf+KFutQ0280VcO9NV0E79vSVZgOHH6bo
         q1zqi3loliHA+GU34SC0iTCOmnfEp1tyZppNj7lTA8nc62PhobJkcQAHhZujvjmRcH96
         7yWamJeT5aWSlPpD3wlekejI8LsSHuXQmMgjErbo96xrxNhGzsvqvvE3+eVX75AuDZu4
         XL/SD9HIajZSRyB1D4MxzxxY6R0u0EoG8RSKQEKH/3RBAnDLx/EzriwBBbQhe06I3lK3
         duAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iNRNcd6S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0982c8323si1312298685a.465.2025.02.23.03.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2025 03:48:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iNRNcd6S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmATE-0000v1-9s; Sun, 23 Feb 2025 06:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tmASd-0000Cf-Pb; Sun, 23 Feb 2025 06:47:52 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tmASb-0005zP-By; Sun, 23 Feb 2025 06:47:51 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abadccdfe5aso623357766b.0; 
 Sun, 23 Feb 2025 03:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740311266; x=1740916066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YIiAkHCNYFkCmeDVpQoR2NxLDJUpXDkIjUftXDRK+4=;
 b=iNRNcd6SIc+/1kjw4uc4kSi7QDV60FHf+5Xh1MG4v6flKMLL6CahP0tD/Jz+x5OFcE
 tcTrZQK3vBKOFjp4wTo9+Psu+YEzv+AAPbuWpJ6YZIsh5dIdHTNBfPHAJeAAcxZ3sv9Z
 1cJNcSiIw/WE41EoWNn48mMIhDx6/QcVhLMrDggpCvdc+t2lwd1KjJN7b9TZ4tlZGZhE
 ttP+xRIRqPh9zFi7aLyV37Ck1tPJMoRXwXZgqr8HHbGQgkLobG7bd/KXyGTclfat7hq8
 vhTEZ03D5IwhO79ESJgPz7EpYxPeRchPXSGX3Ec5zsN/aIXPZHApLiioWlgJhcVKKaoI
 op/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740311266; x=1740916066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7YIiAkHCNYFkCmeDVpQoR2NxLDJUpXDkIjUftXDRK+4=;
 b=k0O627nOG8W6Wm4/zWbIWt/mueVUQbWZOvLLQvEiFcCpmOiY4XH8mn7Bw4uCnJKgmS
 9eSUYl3s8zZYfWne0IVtT0eWuwaTRNqnRSW1ALaF4hnQFNU3j+NnWs2qSSecXosA3p0O
 8ILhYuXX+LMfjR7SwqRU57Q5Pzsj7iLEoXOOp4OW1QIgIG9wjBcYq5giqpJJTPRNklX3
 lgKnf233t/8cjz0qTLuhSZSLzU0oITWgMJ3QG/DPYykRp3My+IrAeRQYYiwxwIlSv4PX
 6x7AINLusgPBXiiMPwiz4wp8FQLsyXEokNqYaOqTOW2WEe9jRkZBvNo1ILvpAzFtg1UA
 RxTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBIDgl+n1OIhiWXjr2z+J8SI9nViXJoyt3WLbuas4dOSx4xwIFA8WnvVEnkJdCz21k+GEitirjkQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy1U3RsnURQQ79RKgex7FH3UBKDEOE0VJuEMynmvTHqO9mKPDY5
 4hX1NQd/v/hEk/ggkd6RdkooICGRsdjrAnvoyoifBRS1kVhBzqeZQKlX7A==
X-Gm-Gg: ASbGncs96tqf5mCk8HLcLPn/ePAUuj8YH9KSKMlxPDAWUlgwRUGW9N1v96cGlJDLlcA
 Az6I6eV81MzayRvxsaaRFdF+CC+bTPXGW1YjY9+XlwbNewLKpns4dxAWYfufohcLDtZKU9VE3/S
 H9LSUhBadCBTD0vgQb9nO1fki9T0TRQYZ6PveNrQ8omuuQNRvluUG+0WVUZdioaZXodoImSz92E
 bzkKBT986cUKWq0SUNPwUoHvy+M8THUgecMuQSsPAQBeQyQLGR8nocu0YnfxRK6dFWbkN+kj9sh
 6+DFTyw4qd/UBiwNHKGo1S8QKYz1BscYqd2sgtkVKt9enIKcFGwWUifZiJ6a2CuM/Jh96TDHext
 OJpekgi9QftHs
X-Received: by 2002:a17:906:1da2:b0:abb:b24d:c631 with SMTP id
 a640c23a62f3a-abc0db50b2dmr788876666b.34.1740311266111; 
 Sun, 23 Feb 2025 03:47:46 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-011-167-038.77.11.pool.telefonica.de. [77.11.167.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abba4b9ee98sm1240515466b.167.2025.02.23.03.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 03:47:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 17/18] hw/arm/fsl-imx8mp: Add on-chip RAM
Date: Sun, 23 Feb 2025 12:47:07 +0100
Message-ID: <20250223114708.1780-18-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250223114708.1780-1-shentey@gmail.com>
References: <20250223114708.1780-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ri0bi4PXKmXI

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/arm/fsl-imx8mp.h |  1 +
 hw/arm/fsl-imx8mp.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/arm/fsl-imx8mp.h b/include/hw/arm/fsl-imx8mp.h
index 4dbe30f524..03f057c7db 100644
--- a/include/hw/arm/fsl-imx8mp.h
+++ b/include/hw/arm/fsl-imx8mp.h
@@ -69,6 +69,7 @@ struct FslImx8mpState {
     FslImx8mPciePhyState   pcie_phy;
     OrIRQState         gpt5_gpt6_irq;
     MemoryRegion       boot_rom;
+    MemoryRegion       ocram;
 
     uint32_t           phy_num;
     bool               phy_connected;
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index f26cf5984e..4e6c4d0767 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -661,6 +661,16 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
                                 fsl_imx8mp_memmap[FSL_IMX8MP_BOOT_ROM].addr,
                                 &s->boot_rom);
 
+    /* On-Chip RAM */
+    if (!memory_region_init_ram(&s->ocram, NULL, "imx8mp.ocram",
+                                fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM].size,
+                                errp)) {
+        return;
+    }
+    memory_region_add_subregion(get_system_memory(),
+                                fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM].addr,
+                                &s->ocram);
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(fsl_imx8mp_memmap); i++) {
         switch (i) {
@@ -673,6 +683,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
         case FSL_IMX8MP_ECSPI1 ... FSL_IMX8MP_ECSPI3:
         case FSL_IMX8MP_ENET1:
         case FSL_IMX8MP_I2C1 ... FSL_IMX8MP_I2C6:
+        case FSL_IMX8MP_OCRAM:
         case FSL_IMX8MP_PCIE1:
         case FSL_IMX8MP_PCIE_PHY1:
         case FSL_IMX8MP_RAM:
-- 
2.48.1

