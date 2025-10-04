Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DCECCD183
	for <qemu-arm@archiver.kernel.org>; Sat,  4 Oct 2025 20:02:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v58Rb-00015C-K5; Sat, 04 Oct 2025 16:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1v58RO-0000x0-VC
 for qemu-arm@nongnu.org; Sat, 04 Oct 2025 16:01:15 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1v58RL-0006DY-9D
 for qemu-arm@nongnu.org; Sat, 04 Oct 2025 16:01:14 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-339d53f4960so380694a91.3
 for <qemu-arm@nongnu.org>; Sat, 04 Oct 2025 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759608063; x=1760212863; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkEmxt6vEnFyV2JF65ofIRkC73zMsDRURKE/QlhKGg0=;
 b=l4u146B1/tcqVVD3V6NiUuKgkexC7SJqHAuB9ARElhfnKjhRwA0jDwpb1OeQKmFg1v
 EeQWdjF7y9wa+IH+rwmjODNjsxI5OvYFvHJ/Je/wNBo9YYwlc87MLyOP6TMxArNuyQY9
 twkI61zgXLcWYpBnLHtBz0CHWXTFd0HMQDBfut8JoC7+2MC2pAR3l1zbF9TCUDC6QV32
 y4kNPh++0A9ikzeG3KnV3GtPqQ4rIG9XI1WVJKN2aHArb8mM78UWbLzxL2CV0Bh3/CKg
 W+xf+Z5Z5slvIUnAHMeGhwkYgV08r8uviVKk4htkVdw+U8Io+IwdTmNpz6lGPyc29Xw7
 UT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759608063; x=1760212863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NkEmxt6vEnFyV2JF65ofIRkC73zMsDRURKE/QlhKGg0=;
 b=Z6jDN+3Dwstszf+KeWySN4whWPnRsQ9zB03R5X/mzQWjWwWo/SAncEoiyH8dLoZaAW
 4NjPLzvTwtni/ydfuJS8GDkX5o8VyAKbgQuMGrmvcydY9B7EbKiTOkLzPKrzim6FIvpv
 B5hNNAzA0XxQoyupI8mwFyIpMRQr7K2y6Iw6kkQMyOiOibWcNyICKoljOTyYrivcpVRK
 tA+3pgfaj0JcfklEAofyqV1qijSg6dAY625NUC14XGdZj05uPqPkFIzHkW1ezdJOr4/p
 MtnkesRJ2SPwXdMZ02kh/nDXOhsWpofEEf3rPT1Z6sULMCtpdK97H/9Q+g1MPe/uCaNP
 STpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSaX7d24r0ZUM6JK8TII8bFwspufrAruulVzD9gEx/PegUmNymjfDHwwvH31jM2ywA/UdJG7ZRSA==@nongnu.org
X-Gm-Message-State: AOJu0YwZ7u2FZ1uiHStK8pozxtwj8cvYwBAo7zF4ZP91JAvl9HGE7Gm9
 g82CSyXl3LW9w3FALzsstSqzPJHvCTgvAPd8oDmQHh3oWMyuJetdYEoj
X-Gm-Gg: ASbGncvdyG1zn4yx3Pcj2XDngKj3GBtaszP2+x7CpELoZhW4MlnMbCf8KdnF5Ol2Yld
 4BCZUDA6f47WRusx8Nd62MHwQibidgHUSYDh1aicwLC5m0zlrdAykm9dezRYNAS7JYi5qCoiBo9
 a+ffToWiXMnzhT8ABjmpXnFTykkAl52qcpI83MqGHzNQSi/WdRiQ0OW1t5YdEmRXqCsJLaweC5n
 PjjiLgcCbQuqhu978YrWMZRzoGm1esQmj1jl06XMeEsPRq/xOTgBiz5enrpafljDYCmEj6CynoX
 t92CaO38kcb+ppi0J8Olj0liAfZtpqDaCIT9FL/Egi18KvIabF6PcsoDVFAFNJa3oE2jC8m102k
 +EnrZ2uL7uJ/YS54ISIxCZS0dXF4XnR/qCThcjOvZYmJx5dgtRFJ7w8ZNfE7CLCt2VtfPuQ==
X-Google-Smtp-Source: AGHT+IFJcqqT4evhHgnUaj1lCkhATFv/mO7vJTFyr3zu7XDVd++wJmh1i8wTp8DbEj8UN9WomoA1qQ==
X-Received: by 2002:a17:90b:1c12:b0:32e:d599:1f66 with SMTP id
 98e67ed59e1d1-339c279cf58mr8530911a91.30.1759608063087; 
 Sat, 04 Oct 2025 13:01:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3399cdc7b41sm7333981a91.3.2025.10.04.13.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 13:01:02 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hw/riscv: microchip_pfsoc: Connect Ethernet PHY channels
Date: Sat,  4 Oct 2025 13:00:47 -0700
Message-ID: <20251004200049.871646-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251004200049.871646-1-linux@roeck-us.net>
References: <20251004200049.871646-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=groeck7@gmail.com; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/riscv/microchip_pfsoc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index ba1d090d9b..6e2a6e721b 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -414,6 +414,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
 
     object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
     object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
+    object_property_set_bool(OBJECT(&s->gem0), "phy-connected", false, errp);
+
     sysbus_realize(SYS_BUS_DEVICE(&s->gem0), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem0), 0,
                     memmap[MICROCHIP_PFSOC_GEM0].base);
@@ -422,6 +424,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
 
     object_property_set_int(OBJECT(&s->gem1), "revision", GEM_REVISION, errp);
     object_property_set_int(OBJECT(&s->gem1), "phy-addr", 9, errp);
+    object_property_set_link(OBJECT(&s->gem1), "phy-consumer",
+                             OBJECT(&s->gem0), errp);
     sysbus_realize(SYS_BUS_DEVICE(&s->gem1), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem1), 0,
                     memmap[MICROCHIP_PFSOC_GEM1].base);
-- 
2.45.2


