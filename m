Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp808003wrv;
        Tue, 16 Jul 2019 04:01:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJH6/pssAJmUvv6W7ftUbIcWsfe4lDyeeNYK6OziMmuR0xZVtvWNNi+C9UlMTbSytnd9Ae
X-Received: by 2002:a17:906:b2c6:: with SMTP id cf6mr25827375ejb.274.1563274861441;
        Tue, 16 Jul 2019 04:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563274861; cv=none;
        d=google.com; s=arc-20160816;
        b=CH6NTiR+RN3pGapl5juZo+j5DtFC4mFEUnjkGJg4NfpzsNDWgN+lU5tDeepGa03CTU
         OgTaVE6LJF5nDc8WV/zqLJdAqo1DM2Iiw+AWXtwjHdx98/886Ao2VmAmCDaVWxp7FNU+
         j/dbR3zzMh/I7nvVKJIzuj9pMWJTYkmjVRHc0K6qZR/a47/MNBaEUImdCXS1DhUaLCmr
         rU34H+jQFgM76tVjux42Dlb/PdIaptsLDT3WYhV7It2/uBbj2cVJa2/2HTYs7GF8pKNu
         UMjeCT9TA3KvOIg6WK735ATzTYYG9jgHcKOuX8pzJ5zqhKpc1L0eeq0RaX5WAuRzj3bK
         pDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=Zp2PUu/AWHv4Ey8MIvSoqx4r9Y7qfrZOD7/iZct9ZPY=;
        b=Pg/aG6ATNRaCB0NyMVlBbxdUstU7xLnU9aSpL2CQ1fEnW/VWHBdoV4vjC1Nvkn04JH
         0bWQJaGjb/8TBeT8QggNeJzM4JJc4H6TIw8MhoSueIgl++UaERf5iAMPu3VXNX+xKDTZ
         0IGpXtr3hPtJgtfPeJtjtkYNZ9nhYvqYURvvFGdowT1aE5WARaV9OLBYh47rL45XQxm2
         v3mWxKqRPef66aiVk8J5i9+HyoPwZpAnzEeTFXDe1/5i0cxRguWTotJFviukp9+Q1fAs
         YNeDM2hvCnpIFSHMQ0fYLPjzcos8rLsI00HkuZnVyN6j2OzkDvSGnjQvtPP9HtyJZnk8
         tiDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u33ZmDmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si8703815ejs.337.2019.07.16.04.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 04:01:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u33ZmDmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnLCe-00060x-9U
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 07:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hnLCX-0005md-L0
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 07:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hnLCS-0005pv-Mg
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 07:00:53 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37995)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hnLCQ-0005nn-3k; Tue, 16 Jul 2019 07:00:46 -0400
Received: by mail-wm1-x341.google.com with SMTP id s15so18229246wmj.3;
 Tue, 16 Jul 2019 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zp2PUu/AWHv4Ey8MIvSoqx4r9Y7qfrZOD7/iZct9ZPY=;
 b=u33ZmDmKQI4TJY/7UlTTYmYmooa888KZzfsFyxT//joEefLqDf6Xu4mqM0hfihiVub
 vfXk6Mcc1yinThP6mUGQHgWjtATQTRQ/t7lvHTsZOk/P7pjKfa5iXKp/TCESLkai6xvy
 susSM8o3bINB7bRPQqg+2V4HFWIAU4hPB+8TX3oevx78IRbrTc1khf3MwXS1XsypqC26
 +Iph7QzVGwU61lahgKtGRxkQDVo+cyxE+jb0hX3sZyE98pFvlqkmgEKbLFnp5T+8EvUX
 0oep/D0DI3kiEWbSgJg8w1dDRJA63tAczbuqiIO7RrlqsxhLHff9f05d3hx8USoLWvjj
 Ej+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zp2PUu/AWHv4Ey8MIvSoqx4r9Y7qfrZOD7/iZct9ZPY=;
 b=LrjIA9xoSv/JI8ClAqVu/frFOEeD8Aaku/oqXlz45MMgEusGu+TGJwPBltAg3HNJHC
 zLLOal2fx42nga7p2ng6KAXWNCPVww2Sehvh+hPJsnUrI7GG3FcRTIYlvHEg/8GSnNip
 OuKDmj10Nh9V47HsOcSw0x7J9VKSgjBZP2SP2ziSTe2y9kixH8M35O91zD6bmgh1I2GL
 YtWfpqMe9Yq+Fqu8JFRDWi5vb6v+U0tDUYF0PV/gxJeniHJ76Ewp2RL0qogKPzKEtXGN
 jG7aaf+rOwWZElOrAOrLdHERho3Nf0MdX3gwsdbTNoJCrYuwKeYY4NWuClYq/tnw05Qa
 WJGg==
X-Gm-Message-State: APjAAAVOeim5jU1MbM2UHAetk3W+bK+8boHPU4OrohZ1uHQoHdwUDJJD
 uxekzcLhQ7opEXbZV2TO/wOnyzY6sM4=
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr29781529wml.157.1563274844774; 
 Tue, 16 Jul 2019 04:00:44 -0700 (PDT)
Received: from localhost.localdomain ([141.226.31.91])
 by smtp.gmail.com with ESMTPSA id e3sm19289127wrt.93.2019.07.16.04.00.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 04:00:44 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 13:59:51 +0300
Message-Id: <20190716105951.25446-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH v2] net: cadence_gem: clear RX control descriptor
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
Cc: peter.maydell@linaro.org, jasowang@redhat.com, alistair@alistair23.me,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Ramon Fried <rfried.dev@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lmCINrgE3uxH

The RX ring descriptors control field is used for setting
SOF and EOF (start of frame and end of frame).
The SOF and EOF weren't cleared from the previous descriptors,
causing inconsistencies in ring buffer.
Fix that by clearing the control field of every descriptors we're
processing.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---
v2:
  * change function name to rx_desc_clear_control as proposed by
    Jason Wang
  * Move the function call above the comment, as proposed by
    Philippe Mathieu-Daudé

 hw/net/cadence_gem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index ecee22525c..cca3ce7f56 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
     desc[1] |= DESC_1_RX_SOF;
 }
 
+static inline void rx_desc_clear_control(uint32_t *desc)
+{
+    desc[1]  = 0;
+}
+
 static inline void rx_desc_set_eof(uint32_t *desc)
 {
     desc[1] |= DESC_1_RX_EOF;
@@ -993,6 +998,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
+        rx_desc_clear_control(s->rx_desc[q]);
+
         /* Update the descriptor.  */
         if (first_desc) {
             rx_desc_set_sof(s->rx_desc[q]);
-- 
2.22.0

