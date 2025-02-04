Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp91987njb;
        Tue, 4 Feb 2025 01:22:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbNYsEEt9lMMD05aylqQIv4r+BGRk5aQ0JgHhhxbmuaUsb7oNeU3S9xddlrPs+yfatj4L4bNgCOhlryw==@linaro.org
X-Google-Smtp-Source: AGHT+IFT4E7xPne2pi6v0t7H5llKniPWpanhVUh/YOBwZ1YLYPzSF8oXIhurH4mY9CehwROXFHLN
X-Received: by 2002:a05:622a:12:b0:467:737f:d5ac with SMTP id d75a77b69052e-46fd0ab34d6mr327196941cf.25.1738660931340;
        Tue, 04 Feb 2025 01:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738660931; cv=none;
        d=google.com; s=arc-20240605;
        b=a/lxy7Qlfw2lNMN/xIbgFUg7XL9eMkYJl71OcnF8X9gUkybz/z9YU4V0tmnnEMV1oG
         JUll4E76LDGtRrFHnc16LchYubULXLD8G+cfKc6aFV/qowjsZ3+angbZ2T++1Q0QmZBF
         dYT7pw1zShICBm+ngKXQo1UmLv2Zi+lA8KPw8RbD4FGwghrhT7Lazq8NIQj1k8qoxJyg
         d52YkLHkIJxrQRD/K1qfDbGJqtyND36aJZHuSSG1VQqzK2vHfvi2LElYemVqLMgRGX0F
         PH9HTC+LGy9OyM6WRBdpzWvSUTi8k5Hd4ydkvMOItIM4fLDoSkPVd1621vaheRXluIam
         GpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BEASFFo5LT5KQx7hc6rH0of6npLqn1pGunpDBSPvkfg=;
        fh=hLi6hG/k2KnegcaVHNDwy773f4i6RH3Npe3+uUA+Mak=;
        b=HmX9yMWUwv5TeRVDf4Tf4oPq/XB8Um7R0uU3oSYwXik5AgFcB79vmIcj/VScSG1wRf
         tcwG8Bfb2c8/Kcnj6bTO7jmB7naQCr2Lz3JB78yUX0UOtSX4ICsNlA5yyhAYruVgbao2
         OmxQ56nJyngZiBNjsRc9R+sVEpGqsXDSLGnSVc8jBpgIq9SRSg8yFrOWlvAiNc8DdUG8
         RdkUAJaLUmdZ1QaR0wN9eIHsb0aLstEIv5xJ+V6j42qBjlLZ8s8l/igcYVielnJ7a7j5
         lP7Nw6rhWAMsaFGz52GhwZ3Xp4X2iVluvHrlCZuhGsXdJ4EPRJKXECbbeol4J1BJLiG3
         9j7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GvxtDhGE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016b7dcd8si23228561cf.307.2025.02.04.01.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 01:22:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GvxtDhGE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfF83-0005V8-TW; Tue, 04 Feb 2025 04:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tfF7n-00055M-CJ; Tue, 04 Feb 2025 04:21:43 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tfF7l-00056Q-Im; Tue, 04 Feb 2025 04:21:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38daf156e97so127333f8f.0; 
 Tue, 04 Feb 2025 01:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738660899; x=1739265699; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEASFFo5LT5KQx7hc6rH0of6npLqn1pGunpDBSPvkfg=;
 b=GvxtDhGE8B4D6ZJ6T8E7kfjYc7kXb4kAoet/viJWag47/MvQzbqNknZVLxAsI1fcEE
 culpwCtqp1m7XACOvwujO5+7rib0zbTm8ZnIOhvGYLfDNR0Thd4vn0O0egggvmiA2+5C
 jMbTut2/I+S+prxtVeDhOLt4hTATML8tQbjkjsbyeFLJyzGlJPL+M3z6YTfZ3JW8UZ6l
 Q9ao5sNPBupojx1pDnL1Mvj1Ry0QArOYhyeSpn3aBTzPTxB5HdvTee5+ybNlijiE/XU0
 zSNtQxNnFI6VDl1lL8ys8FDZntNWb/vIIw1/of9PfhxYBHBjHqRqf/5yU143b2Ww3rBy
 1IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738660899; x=1739265699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BEASFFo5LT5KQx7hc6rH0of6npLqn1pGunpDBSPvkfg=;
 b=XchEIdFN7PMkyrcwLTGKJFXlASMofYFG4Qtj3/2fT5WLI89w2RML4PG/Wa0kBkoZEG
 FAmaLDHMPpmtMDktazPeQK1AbUJZ869zvh0+trm21+7KsUoSryGHZWYjqiEfuma9zEnX
 NhaPR/3gz8ud1W+Et2yhrAfTA5l9+vECPKXqHp60PRZGX2tyfgdnk+F8GHg9CQ5EOmW7
 WZN7Xw74sQ8NJwcz8OYmvIWrdMnZ+TEemIG33+E5WUbicGPcYcJ8bp/QJ/TEXVUpSFhW
 4x/OAYsfRyPR2nyJRC3u19PeBpdyBgD0oXRZzV1PBxts+YhA+YOk6vaOv5TJI+bCllvO
 18Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrghrij5JZKNcdGH8tNmiItnh3uwYjRyW9w7hkBYOY7b1PYKvSbOkSejyV7t5NjiQb5mZ+XemOjQ==@nongnu.org
X-Gm-Message-State: AOJu0YwH+W9ZBbkRjDnbwDQ7CHZHEuOOcyYi9HTdvYtd278b01MU9i7K
 +lINDuW7dt4lXcdKYZYgtGymRuO1Vlm1BllwTEg/q28SRDJLSHEEiC6MqA==
X-Gm-Gg: ASbGncsRibIGa9Tz6WYcVyxlnTVWiiQkA2F/qmohw+2jAPrxdrRxJPJKha+8qWnsoEV
 CO4HTSd2zWRdHG18Nzrnd+MvGzdStGkcaeDPKBsfH0GrrXxd/fsYWkIqVXffez28btn5zbwynm6
 PtwJ5PPcREjVTC+SFKCXfSht+26x2w+MixIqoQ5WSt6EpS+8AmJOMCdIXJENbELFlFXKBXS3CDW
 2r4Fr+t8SkAVU1GhtnxQbMbKqxoxUn9Xuru5fhTKgpPcA1hRQveq9PnhV6b3w97Sy9tMXyZGTVL
 iE8MpvXJB2Or9Y/q0ynLfZVfyfvfLp1KzpNHWCdzjBhDN4bpZx1fV4a3glHsbecSZWVlMsXYJiE
 B3t58nnt53Q==
X-Received: by 2002:a5d:4348:0:b0:386:3e3c:ef1 with SMTP id
 ffacd0b85a97d-38c51e91b5emr18543431f8f.35.1738660899201; 
 Tue, 04 Feb 2025 01:21:39 -0800 (PST)
Received: from Georg-PC.fritz.box
 (p200300faaf0043006a2cae69f03f1c85.dip0.t-ipconnect.de.
 [2003:fa:af00:4300:6a2c:ae69:f03f:1c85])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42c7sm187233595e9.3.2025.02.04.01.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 01:21:38 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 17/18] hw/arm/fsl-imx8mp: Add on-chip RAM
Date: Tue,  4 Feb 2025 10:21:11 +0100
Message-ID: <20250204092112.26957-18-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204092112.26957-1-shentey@gmail.com>
References: <20250204092112.26957-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42f.google.com
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
X-TUID: ayiSNvX8qYOE

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
index 6439639110..e0dfe06e15 100644
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

