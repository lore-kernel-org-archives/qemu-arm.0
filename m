Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6270757njn;
        Mon, 20 Jan 2025 12:40:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdp2eqfGWowuCSdjP/hwFPwyLVUcCdW3eJ1qKdNP4JhpesODUeBNLcM58rCD30t+NNloBqKHqXr6oTDA==@linaro.org
X-Google-Smtp-Source: AGHT+IENLhSId0es8+/iJap9ZPkVIeuOwCCsHB/p/SM0zfAiqTvv0cRIYavTMaPA3uJJVjIZBjJy
X-Received: by 2002:a05:620a:2687:b0:7b6:d70a:86df with SMTP id af79cd13be357-7be6320aee0mr2452590885a.27.1737405606210;
        Mon, 20 Jan 2025 12:40:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737405606; cv=none;
        d=google.com; s=arc-20240605;
        b=DHM9FdmZ5G7YFcNyTnFXhOHhHSP8hzUaDBftgS5XRZKoAHqb70jdglLKoHd4JWiRgn
         VxP8Qa23JxnrKtXGIvFItVbMCeeS5HzQnCkhRs7iP++SxThDNo7ukXdf1dFEbtiVUNye
         /8OqZXPZr5GBKEKt33/6n96IhWj+kwNrvq0FLz/D+lv6LJP00Rq42FoBd11GGlQZ68hi
         VQhQFgPO2XKOhNP4DttlQ16Jk9ZNwxAxUA0xSpsp33NPbhqwZx5vueQQZdFlsy7Gimln
         EvRFxD011zOQuVeR6D+9DqaSnW+BH1pxEC76ZslskXEsAP3iSHu2wn1bDEc7p++TLCcZ
         xzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=98ku84vcnPVXCm+Wkpqkoy2ntxeeyCGaHE4mQ+9ylwA=;
        fh=CScC//6icSMwXJhrjFPEi3l2hIKgeKvqA9tmZL4+H88=;
        b=HIHKDBQNZnjyFjuLAOzRx3R22xBsyRAhSV/W+qX+XE1myYeZJ3iCnGsAJ0b6TYm/k2
         wfXLyaVP1wdFlGHz56+k/iz8WDnDwDGoJ94nfrlbRlIMYMHAn4DqyRVX9hzt6Tj4eQJF
         YyoiP6PFQ9vpNnBmZJfTwMh3sZCy3OXuVUUmxm/83IsJLLmQOvocW1/2sN9VUzOBIQOf
         c9yoLKHgT1je9knFLUltLIeVA0SnAAMr2PgD3c1d2416joww8K4+3G6Ib6eAUwhQqvFW
         0xYbOEjNpOOlM0uT+PAfXyoWgggvS2uFwTMYkT2FMRj7rF4HaVolJI0/IkL0TvwEZwnM
         3mOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NTSm4TND;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614eeea5si1099996485a.575.2025.01.20.12.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 12:40:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NTSm4TND;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tZyXW-00044y-CN; Mon, 20 Jan 2025 15:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tZyXS-00040q-NK; Mon, 20 Jan 2025 15:38:26 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tZyXR-0002Zo-5n; Mon, 20 Jan 2025 15:38:26 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso7382817a12.3; 
 Mon, 20 Jan 2025 12:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737405503; x=1738010303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98ku84vcnPVXCm+Wkpqkoy2ntxeeyCGaHE4mQ+9ylwA=;
 b=NTSm4TNDpDt2WK7/L/KQSDcQMVRLPcTZrCV9ddE66wNpSd4GVLxy6pfrasDa2aXLeF
 zXN8Cd3N15SU1V5VbybgEuJNFDWvv3f0U9Y8iEheTbSuarvuRAcKVcdVvyTieUn5M8I6
 915gYQYvahqFeY1wtP8MH7SnSvyvHTTsWUTgf5TIxKKUK4onSn0Yt2CBMSYnkAxw+Sds
 8i/Wp6wyQouBib150x2RA88Meq6sise0XfsQRpPH67nvOCzvBf4BHmJ3wDGrzbjY2zI2
 PnR1mCrQ1/4f5wOtRlb6GX+oA9hcBGwvzKFld5bVnkUbmOpJsnZP13QZ972LunXsX3oL
 awBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737405503; x=1738010303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98ku84vcnPVXCm+Wkpqkoy2ntxeeyCGaHE4mQ+9ylwA=;
 b=k8UJW6tTvQZ5VTgWZRIcPnqco2BQ25DRdwxY+sVyQ7hd4dOyLq6/RVWYOino7Xvmdq
 RRobSTyApFxV5VK4/2DebWRjZzpXppw285hY2Oz3fg9SGG9yovSkf2WJxWuldBoGMp0r
 GEVu/Rj/6jHr0tvIiRuFLWjhXyo8CADoYdWY0hnfYQJ+FWtYdAS+hxPhs5TZqfhjUrfo
 q+7hHWzM/jCyh/fCa0w6jntC31wd+XKb20qjRSEt8KSHeT19OSn+QyQAPXS2jILevIHa
 z0tkSKlfQDWZZyiNSycWJ7sBs1GJygJvCfpyFiYxfOTu+hcZzaW0sdn5BQqMM5BT0dsX
 cJIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgV8iI3GQlssA1VHxGW19+zvsgmQcVrWH+HBMj2vuTMHsAUzH1h/OrQzAJtdtCR10h1Jl58wlAOg==@nongnu.org
X-Gm-Message-State: AOJu0YxdN9PqQ/h2rqnqhkpfDLu6o4+CBNfrY90UqaRqeB06+G5HOhgc
 lwQIkZXo6WszQfH9FK7Yblqrx6dlAvQ9MLkylpRfuD4n6Xi1jUVay5+8ak9l
X-Gm-Gg: ASbGncsjUvt7eUxKS/JnicO9euVbZ9Ol4s2NbKukWITj8z0LMgDbNfKLiTx2ZSksPVa
 JVkFVr2yiJSAUvitxlvm0EWaj8LYEfOuuJfJWooNpFz4+qxFRZbzCWbZR/5bwSO9VdKviyJXN9O
 RYrDEV6gegoYwVRR871ieRFxV1SI259kLi4MJGPq3fLtxcIkJd2pV+W8v5RdTTr50lqNyGvitKY
 2P48nppIByXdCwOQ5VGZiEMCbMRu+Q/wGRZjDaaHpNbA/g8Jz6qNPFfheEylg/SV4xNxY8+/Ziy
 SFeeFEcuE4rRQzWp4LiKKsvVgfkFAyRwnLXQoTU98vfmvCgZP3aZt8N+8kmT
X-Received: by 2002:a05:6402:26c2:b0:5d2:7199:ae5 with SMTP id
 4fb4d7f45d1cf-5db7d2e3014mr14020891a12.5.1737405503008; 
 Mon, 20 Jan 2025 12:38:23 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-181-102.77.183.pool.telefonica.de. [77.183.181.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db7364258csm6021077a12.1.2025.01.20.12.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 12:38:21 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 18/21] hw/arm/fsl-imx8mp: Add on-chip RAM
Date: Mon, 20 Jan 2025 21:37:45 +0100
Message-ID: <20250120203748.4687-19-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120203748.4687-1-shentey@gmail.com>
References: <20250120203748.4687-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: KFeYuROME2Mv

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/arm/fsl-imx8mp.h |  1 +
 hw/arm/fsl-imx8mp.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/arm/fsl-imx8mp.h b/include/hw/arm/fsl-imx8mp.h
index 326c4ddf69..e0442665fc 100644
--- a/include/hw/arm/fsl-imx8mp.h
+++ b/include/hw/arm/fsl-imx8mp.h
@@ -68,6 +68,7 @@ struct FslImx8mpState {
     FslImx8mPciePhyState   pcie_phy;
     OrIRQState         gpt5_gpt6_irq;
     MemoryRegion       boot_rom;
+    MemoryRegion       ocram;
 
     uint32_t           phy_num;
     bool               phy_connected;
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 9688e2e962..cb4b0ae5bb 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -665,6 +665,16 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
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
@@ -677,6 +687,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
         case FSL_IMX8MP_ECSPI1 ... FSL_IMX8MP_ECSPI3:
         case FSL_IMX8MP_ENET1:
         case FSL_IMX8MP_I2C1 ... FSL_IMX8MP_I2C6:
+        case FSL_IMX8MP_OCRAM:
         case FSL_IMX8MP_PCIE1:
         case FSL_IMX8MP_PCIE_PHY1:
         case FSL_IMX8MP_RAM:
-- 
2.48.1

