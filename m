Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp552041njc;
        Thu, 14 Nov 2024 13:04:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5kDRNG01aFw0T1AklxzMHDbtkD/kHlbBfgq/EHk/Jp184haqtf950t1+mPFcacOXv2sQhK9oxkvDIrA==@linaro.org
X-Google-Smtp-Source: AGHT+IF31HLaKRKJYbZnBcNbt45Nl0aAl3vhqXzbjzTZzVuLlQn6iVfjyw25coXwZisQv2uLtI5T
X-Received: by 2002:a05:6359:278e:b0:1b3:94cc:6526 with SMTP id e5c5f4694b2df-1c6cd1fe514mr73836155d.2.1731618282815;
        Thu, 14 Nov 2024 13:04:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618282; cv=none;
        d=google.com; s=arc-20240605;
        b=GZChu8FAyc19mM8P/abLzztUUC3RSl1L/2Pytn6u351+Ga+mz4IXkh8pgEDt1S2igz
         0pwAZ/dDGapChDuVLzC4PmjK7uP+ig0pFBUmvGAFCx50G0L++lR/wx4XxvhTfIMt1xZ2
         Oi8o8Jnusv7Ywca6+OWAly6aXmW5FxwyBGEm3GDDQeArkhy4JpTVrKGAZot4S4gZuZM5
         A09g0KNj2iSV/2sbCgquB7oFWRReL22sg0xZB7UedId+9UxunHmS0DaB5Ptg/u1CmtSV
         lQAQhNRWvP7lOm3RakBx+Of3ZXSKnGQ2ymAOcj6B4FFqIvL9ZARgaO8BcqWXb4GwVPnv
         vp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Nb6BGc20Jrn3ivl3e3d8GrejdUgzYW7qbVEFEk+JhnM=;
        fh=5jk8UxAyCIlFm5FJTrcugn+mYgKxg5oCAlh/+aIwL9w=;
        b=OteBEX0/CBgh5tiP01lawrbEqm+tr24SYCFF4nMlX831VKQ2cpDumz+lvMhjfntS0H
         vQC31mpoRWTfuFN7bGOc53iyYTnZh4vxYyCjtXYsBTMdnIwk9B/3INUI1vNhVEdCwf5w
         StPwIoxEG0g1UbBmt9EevcgmVkYkhi8Lh5BgT41ZL9eeCfwJFL7omJnF9rsTmSDJjHQX
         5L4Ka/8QWGsCiP3yo22xgR2uOmozna0nGeXZTrNiONcEb0h5r3N6exI6ckwoR2gwqRc9
         igg8gdoowwHP4Kf4b1AZuKhYMv1MIrhXieY5yurSkfRN+WFQbsiCyKeIFZpWTSizT3ri
         v7Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cVQVwNdC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ad6486882bsi11137137.349.2024.11.14.13.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cVQVwNdC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBh06-0005Ty-Ry; Thu, 14 Nov 2024 16:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgzG-00046G-Pg
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 16:02:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgzE-0008DN-A1
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 16:02:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so281095e9.0
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2024 13:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618162; x=1732222962; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nb6BGc20Jrn3ivl3e3d8GrejdUgzYW7qbVEFEk+JhnM=;
 b=cVQVwNdCq9YmOJpndZNgMxTLc6xKryNpSLUVIi/5DcY/MzYsrQVHTH3BNMmiXC8EE+
 9D2sqJEuPxGUcpVNeJYFHPx896SKtIBBSfXzet8momMNk9DhgCMfzjfFeWMKSATnbFLL
 uAdXgHT35qUsZa2Ux0iDR+eM3D4JILOhoSEAUNvGdBJhfjoiP8Cd67wMSu6rt2OiQK9B
 7+LV3CkgNCztat93Mq0kAynJ7YDN7bOnWxvQ/0D7N+FlcVbYB5vgisqBJy3V17bi/rJK
 zeZaUbBRkJLlnF1PyIsRfG0O69hNk3wwD3oKLY1SzGKR4fm/XcANmZx8/PZnKQBbS3HP
 rjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618162; x=1732222962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nb6BGc20Jrn3ivl3e3d8GrejdUgzYW7qbVEFEk+JhnM=;
 b=v7ZT6ERgMPUnK2+hFACv/dfvCAOoUpyVCc9NjzkBppJ+hMzFQNnMuA07BmW7RBIHIX
 /xct2KxpOSQ21sbgnHhg4ck0WgfT+BLt/EXj1wgH/WPLiX131bw8adUZ6sBtIXqc6PlR
 fnujxxl4VKcR8l+5/v3kCbfFNcf4HM7u/64mk0hXGSynU4QonX1ssHa9+y5/dxWibH1c
 VFBFGjNrSfJgytN38W2xdcX1lJ2Vq3I8bqzuvBpzQkKCPdCUoCwAiFcls8v6hvPiSG+V
 yX3cIE7q07DkwYnypjxfzK7/fkXMXSghMKJUdw5+hk0AjSZcTUd3u2tl6gZ9GvhNEmY4
 Cf/g==
X-Gm-Message-State: AOJu0YzX82hLWh8+M92qELCKJJXXHfLeETXKHRq6nJZbe/Y3GfZnvAyS
 +HUqBhUzBWB/n5k/VY30SRVq3pg5dS3BTIcApUEzC5krsMfVqkIPmg2EZrtmXmFswULMOucAghe
 D
X-Received: by 2002:a5d:5f43:0:b0:37d:48ec:547 with SMTP id
 ffacd0b85a97d-38225a32a44mr185997f8f.29.1731618161876; 
 Thu, 14 Nov 2024 13:02:41 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38221c9d838sm1380709f8f.6.2024.11.14.13.02.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:02:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH RESEND v2 19/19] hw/net/xilinx_ethlite: Map RESERVED I/O as
 unimplemented
Date: Thu, 14 Nov 2024 22:00:10 +0100
Message-ID: <20241114210010.34502-20-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Upm/AAAg6x+0

In order to track access to reserved I/O space, use yet
another UnimplementedDevice covering the whole device
memory range. Mapped with lower priority (-1).

The memory flat view becomes:

  (qemu) info mtree -f
  FlatView #0
   Root memory region: system
    0000000081000000-00000000810007e3 (prio 0, ram): ethlite.tx[0]buf
    00000000810007e4-00000000810007f3 (prio 0, i/o): ethlite.mdio
    00000000810007f4-00000000810007ff (prio 0, i/o): ethlite.tx[0]io
    0000000081000800-0000000081000fe3 (prio 0, ram): ethlite.tx[1]buf
    0000000081000fe4-0000000081000ff3 (prio -1, i/o): ethlite.reserved @0000000000000fe4
    0000000081000ff4-0000000081000fff (prio 0, i/o): ethlite.tx[1]io
    0000000081001000-00000000810017e3 (prio 0, ram): ethlite.rx[0]buf
    00000000810017e4-00000000810017fb (prio -1, i/o): ethlite.reserved @00000000000017e4
    00000000810017fc-00000000810017ff (prio 0, i/o): ethlite.rx[0]io
    0000000081001800-0000000081001fe3 (prio 0, ram): ethlite.rx[1]buf
    0000000081001fe4-0000000081001ffb (prio -1, i/o): ethlite.reserved @0000000000001fe4
    0000000081001ffc-0000000081001fff (prio 0, i/o): ethlite.rx[1]io

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 5f1ff7b712..1be38c44dd 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -95,6 +95,7 @@ struct XlnxXpsEthLite
     uint32_t c_rx_pingpong;
     unsigned int port_index; /* dual port RAM index */
 
+    UnimplementedDeviceState rsvd;
     UnimplementedDeviceState mdio;
     XlnxXpsEthLitePort port[2];
 };
@@ -304,6 +305,16 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
     memory_region_init(&s->container, OBJECT(dev),
                        "xlnx.xps-ethernetlite", 0x2000);
 
+    object_initialize_child(OBJECT(dev), "ethlite.reserved", &s->rsvd,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    qdev_prop_set_string(DEVICE(&s->rsvd), "name", "ethlite.reserved");
+    qdev_prop_set_uint64(DEVICE(&s->rsvd), "size",
+                         memory_region_size(&s->container));
+    sysbus_realize(SYS_BUS_DEVICE(&s->rsvd), &error_fatal);
+    memory_region_add_subregion_overlap(&s->container, 0,
+                           sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rsvd), 0),
+                           -1);
+
     object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
                             TYPE_UNIMPLEMENTED_DEVICE);
     qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");
-- 
2.45.2

