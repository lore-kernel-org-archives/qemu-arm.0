Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338BACCD18A
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 13:52:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7DPe-0002T5-E7; Fri, 10 Oct 2025 09:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPN-0002K6-Ao
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:43:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOm-0007tD-87
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:43:42 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso13873055e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103771; x=1760708571; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glWOQWNC3/3zXE9lsfJz0FVW5jre8WEcmZkI6CO0cfo=;
 b=EFzhVWxfOGOZcgMwM9IZKXokT9pM8ZaxsVx0y+xggG2iFyg4aIEDYLSDcVU5g7sF52
 uZr8q+j/itYmHi7aKYu5K87C/zW0lFN6RBeXgqDhTF/OLwr8akBkRU2lHl4xnDM+16RE
 ehieUmfoPZN94sO0dQHUSoxndbq61L6TcyHJxWN6wyxOOJIChDbzcVsvC9VfDvKhBOPB
 hk+oXPpX8ZFPD61JYAvMKL2EOoTgxivzlk6FBvmTXGbpr3gidJwL74j8/TdmpKTXNwws
 0CJEVofJQBj9DmkGmaC4KOYizzWRg2uZfbULufQSticK0ufTM0+OPvOX6px4IEPGOArc
 fx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103771; x=1760708571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=glWOQWNC3/3zXE9lsfJz0FVW5jre8WEcmZkI6CO0cfo=;
 b=UBuy2cVgsEEF6esC4iD5HcBeBNhI59JGXfGAanuxS1OgLI6ylNAA5VyK/3UQy4o25N
 bwxfdsD09KbuzYGSnNXOUH/k2lsmCQ4wCW/VcWccgLI651RLG1J1GUevt/QIEley91le
 Wfhd6y6+CXFzHZYxr4ME+5q/P7OVnGMhhz2lAHfbUGQB6nT9WhMZTpKefWQ2ShPEe+dV
 L+l1Ys7tJEHdeLdJOG1n9oGzOu0gTh+8fbe33BGfh6FPBKp22r9cKt2JktfHBriRG+n9
 lUwTBsF3cpUAH0dz2HtoKmeZTyT6sgYoOTalZRTL5o2mQAIVbN6ydBSYhC2WIWSRaLFQ
 CGXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrt8vqrLjOUdtN1tjbWOWjwrLKDtgs6Lj7vmEALaVj0sxM4AO+OBBSNsILusMwUhU/Z9sFC+kFaw==@nongnu.org
X-Gm-Message-State: AOJu0YwkFzyX98rc7sAjNMkm9vl/Aom788c7raqlMxl/1NAuyuPflWyQ
 qe5tNUE4Io1J4AVbSv0LAihfXQU6vTEV3ivv0M/YgMnKtn4UAjkpq7GjOG7pQN7Ovhg=
X-Gm-Gg: ASbGncuSFEH5Don5Q0+s6o4uMYnxrtLrXPhh834GORCRzMl8H/yiy6d8XKQK6/z0D/R
 R9INN0F6KWcMbCcrlgdrohxIpVtqSmMVbliKdoywW6z3w1socxRdl89E0lDmRmysL47QN0CywcW
 SYcpf6SxyovTiHoNd8OOuwOVdNSzmtBR9W31yYA1OXqqZYZtVobdXV/RgOHJ/qUsALAqobZWBS+
 Ro6szimKyLXbOYEB8X3coWRgl80EZq5MCO8NUxoRvf8zY88h8TJIDX+D+uNNQvXz8BIGz9fgLLQ
 9Kl918/Q2kDNwuqgMK62VlE6eI6z0zZV6zUsMukLD2oyu9xI+6bynLExGgrOugg/Xp29PuLvqQe
 u9Qf4JQ9YoRQyV1lok7Fvm55Q2NSkTkeCKhcaRqgF8LhDI0NU88zjOpB4qKzw5ER9/kecT7rhfq
 qef2n/EcKSrx0gnUlsOTw=
X-Google-Smtp-Source: AGHT+IFj/ht5sl+sluGOMrkKYrfsxcYSRA4eSOSl5wJQr2sAZXH/Rlebae2Q4vcDEqBBJVKVMRb4Fw==
X-Received: by 2002:a05:600c:1e86:b0:46e:4784:cdf5 with SMTP id
 5b1f17b1804b1-46fa9a9f254mr89740875e9.15.1760103770793; 
 Fri, 10 Oct 2025 06:42:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e0a03sm4250770f8f.37.2025.10.10.06.42.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:42:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 04/16] net: Replace HOST_BIG_ENDIAN #ifdef with runtime if()
 check
Date: Fri, 10 Oct 2025 15:42:13 +0200
Message-ID: <20251010134226.72221-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 net/net.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/net/net.c b/net/net.c
index 27e0d278071..11d1f7616a6 100644
--- a/net/net.c
+++ b/net/net.c
@@ -593,28 +593,26 @@ bool qemu_get_vnet_hash_supported_types(NetClientState *nc, uint32_t *types)
 
 int qemu_set_vnet_le(NetClientState *nc, bool is_le)
 {
-#if HOST_BIG_ENDIAN
+    if (!HOST_BIG_ENDIAN) {
+        return 0;
+    }
     if (!nc || !nc->info->set_vnet_le) {
         return -ENOSYS;
     }
 
     return nc->info->set_vnet_le(nc, is_le);
-#else
-    return 0;
-#endif
 }
 
 int qemu_set_vnet_be(NetClientState *nc, bool is_be)
 {
-#if HOST_BIG_ENDIAN
-    return 0;
-#else
+    if (HOST_BIG_ENDIAN) {
+        return 0;
+    }
     if (!nc || !nc->info->set_vnet_be) {
         return -ENOSYS;
     }
 
     return nc->info->set_vnet_be(nc, is_be);
-#endif
 }
 
 int qemu_can_receive_packet(NetClientState *nc)
-- 
2.51.0


