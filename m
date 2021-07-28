Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp4904672lfc;
        Wed, 28 Jul 2021 11:18:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJpfAJOWwjfEBSbPOOZZ+0BZW7zYpBXok0Vuo/m8gndBKuvuVisFqgD0su8g0gGAEEuBmP
X-Received: by 2002:a05:6102:414:: with SMTP id d20mr1320088vsq.25.1627496281589;
        Wed, 28 Jul 2021 11:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627496281; cv=none;
        d=google.com; s=arc-20160816;
        b=Zs8gduYdc0Vl3mdPF2wBOdSQZiM0U6JrVfrikXuq1IXZnd626LQZZDAxXtN8rpGvnA
         /9fma57G3Mv0y/44kXm7Px0xcEMnnLZ3TrmeSjkxi0/OaSN//Z8peA66MnlQKzh34QNN
         HfDvWQbKTXbWlyd+Z6FsTGQyRi3+tK0VWiqcp8d9nEItVT+/RGWvfL8RRlZMZMGD2Ey6
         xWQ/RX+ozFqmBdVK2KsksKou4Abrg9HzMkFpD+Ho0CLr8c6+XEYVwwVrzBPzfOVkatRb
         DcawXZLac+G0xm4NGPGo3jBcsqoOK3yKO+ztu5UVzRDR0tgogbpPkmlVJEc1jy8cyDSN
         ygqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rpJr73sHcD06uaEUnanxw7L+gRVTgFYkDb7sUWR7li8=;
        b=AbWxU7gzNgJPusqdh+L0OWkKVsY7ufMUisGIqBCnqFU3HAQwP1L8vMauBL3dWa88cT
         UJSmlmMOOBc9duk05hWMAlQdN8CSlVz2JlHfCTM6Gc92c+h54IQynckoPs829QOPXVZv
         1vKAo1AGI/IH6YkrvYpqVrhMVeoS+l2Y/IOW3cGfSLr2oe0VVD4E+yVf+NY0LnM91xh7
         rNUdbI67xccFM8ma4eH4rXijMOSSD6XVzNOwYs9opV61SX+MVORo6/asFT37y44qKN7Z
         ZLh1zehe9wTMaD1fTvEdgeRhAHExRK8ms490OB1IraGFJwbScUTY5gbG8MxVPjpjZZmc
         CCjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IZlCmLCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si294245vso.299.2021.07.28.11.18.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jul 2021 11:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IZlCmLCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8o80-0002gU-Sn
	for alex.bennee@linaro.org; Wed, 28 Jul 2021 14:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8o7g-000253-Sm; Wed, 28 Jul 2021 14:17:40 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8o7f-0005GJ-9R; Wed, 28 Jul 2021 14:17:40 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so5021341wmh.3; 
 Wed, 28 Jul 2021 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rpJr73sHcD06uaEUnanxw7L+gRVTgFYkDb7sUWR7li8=;
 b=IZlCmLCtZtTVWI/l7DJ2ATbnmmDJMYSGAJZVba0a8irrPX6zOYMF3OYFWkslxvJzh8
 2LIO6Tira7B594R6Sxr7011d+0l9qwhlviexow7ZsHzSynWeVzWjPNRgGyhU70P8/906
 8ly4XwuJi+T83lwtNrnwBSM72iB1xfCcFhr27HkRUbTA1OAJ6e1N7DoHfMNfJwkwV/km
 itGFvxAe2LTzEXRSXbi9AOiRODoCfTONeifdcOW+ZYpL/bFy23MJ2bM0nt5nZqS+WfdJ
 XredUAhkyw3ldWYfhjKx0qnllJ7tKgJoTNp1SYmxOHAC411C8i/o8z06kMEBJRG5/CX1
 BleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rpJr73sHcD06uaEUnanxw7L+gRVTgFYkDb7sUWR7li8=;
 b=YSoUUvfbR7DtK4SUGzuks9HCLzArVWTDX8RWNjt4bklW6U03jApjX7usEv/9IBG50Z
 Z3onSXScs/e5rCkWu9EpHwOgdXuqtDCasH8rQOA/f0nURgqVXw1XfHUrZg6PXFQv10Ct
 h9mzEJp7M7j5eWuvVlVAc0y10ZSi7rrY7vAYbjiai0NdscgFe6ZM7PvC5Tg8Za+kuaYp
 B3hviLIQFgFzkHwEcDODZdPcAGLoF+zOp2ODM3Pbbj1j5dsBpFjsoH8owZEFW1lHCIsa
 VULyJq+Uvg/3coeB2P3Ynk13YVy8TtNC4WEiCvbkjOcDil7Pgf4e/ZpVQ0d15UKnVkjT
 iHXw==
X-Gm-Message-State: AOAM532EjZOJR/K/Sf/HVVEV3d8xxzWrnc5DGgbh89HeBoregMM64rzZ
 GR6hdowGTMb9EaY3WaBTU+XxOQJc7eGteA==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr10670921wmb.156.1627496256645; 
 Wed, 28 Jul 2021 11:17:36 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 k17sm605872wrw.53.2021.07.28.11.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:17:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 1/3] hw/sd/sdcard: Document out-of-range addresses for
 SEND_WRITE_PROT
Date: Wed, 28 Jul 2021 20:17:26 +0200
Message-Id: <20210728181728.2012952-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728181728.2012952-1-f4bug@amsat.org>
References: <20210728181728.2012952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t8KrJJtvA/5H

Per the 'Physical Layer Simplified Specification Version 3.01',
Table 4-22: 'Block Oriented Write Protection Commands'

  SEND_WRITE_PROT (CMD30)

  If the card provides write protection features, this command asks
  the card to send the status of the write protection bits [1].

  [1] 32 write protection bits (representing 32 write protect groups
  starting at the specified address) [...]
  The last (least significant) bit of the protection bits corresponds
  to the first addressed group. If the addresses of the last groups
  are outside the valid range, then the corresponding write protection
  bits shall be set to 0.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1f964e022b1..707dcc12a14 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -822,7 +822,14 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
 
     for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
         assert(wpnum < sd->wpgrps_size);
-        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
+        if (addr >= sd->size) {
+            /*
+             * If the addresses of the last groups are outside the valid range,
+             * then the corresponding write protection bits shall be set to 0.
+             */
+            continue;
+        }
+        if (test_bit(wpnum, sd->wp_groups)) {
             ret |= (1 << i);
         }
     }
-- 
2.31.1

