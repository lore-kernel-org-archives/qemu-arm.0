Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1184249ejh;
        Mon, 8 Apr 2024 03:53:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRQWDRL0xziqeVVRfC7N5I0/zzPeHMqjtP6I8L+aGHCot5YJOgyLrHXPnzZ+Tile6GUKCkeQnJ0u/w35BbuQQqZWhOoDzR
X-Google-Smtp-Source: AGHT+IEoIpKfX+Z58hNBL8F71Zvmc6IOcnxc4ssArIUcJ3PNXEYixPkvtjaxJK22VdeNe3dY3XAi
X-Received: by 2002:a5b:287:0:b0:ddd:7456:d203 with SMTP id x7-20020a5b0287000000b00ddd7456d203mr6010382ybl.41.1712573585878;
        Mon, 08 Apr 2024 03:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712573585; cv=none;
        d=google.com; s=arc-20160816;
        b=Wx8JuBonCemuKnKJ3cTrfKQSahCktxbzY9pP7pYj/TOBOuamoa3t5eYFKamfOWjI3V
         O5ngRLSANUMnpDtj4XqZlykyop0kI6cADtIudLqb8kOnCIUfYLCCt6a7QD37jII4ZFBy
         v+EayVUZrREUwOgacXTVuSl7iKQoa3ymT1i08CJyqihAPd/IfBQQl8+wzVenOREKIsxw
         Ccn2PCEvUPg6ILLKkq5EwfHPj+aLWT1dYF5zmrfYFRV3B1zL+3ejMm4b2ONPlsAmBcuw
         VNI7Ghjk1JVbxIOs5GzNgFczGiiyg0xEsFlO2XsV73A6EXEIb1bj86Wapzd1MYrL+5PA
         cZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MNFkEWahBP6+0XNPWOMbRiFKrOw7mESIctQanLUg3j4=;
        fh=zepeTXkxZbVh7DV2EE/w8yWeKf9rmwTwxZmSBI5yPwI=;
        b=T/eVeB1qDEB+aJ3zeNHsXo9naiQpxgZycdbmtlRQBcbu9O3ntvFSR5+N/IerCyZ1WR
         qkHd/gXFk1ZIYriif+pLzqzIbmxji1LIq2bjYXZFC4WYKu70yx6H5DIgF+DdtPlaH+cj
         EeEF7AoxjdyFVtsgPFyUNk3MQp1v+4FzmXXIH51GGaMI3moscPtKz4NbwNzNeLjzVNIP
         oYjDq8+Uup21JHR80NDadv1197IfInGM9Ug8mZZu76je9km3dk+XOi6nuHQcnav4FNJ1
         8wYEZt1RedzMMJ5TbBKgk0TZxTmBvRzZFNlHQxLyagE98fAmuBiGPQwMAoHkHIHXSm8G
         lebQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v7sk+vPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020a05622a111400b0043466a414cfsi6666836qty.210.2024.04.08.03.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 03:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v7sk+vPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtmbf-0002rq-Hm; Mon, 08 Apr 2024 06:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtmbc-0002qa-2X
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 06:52:05 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtmbZ-0007qz-0Z
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 06:52:02 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d886dd4f18so12401271fa.1
 for <qemu-arm@nongnu.org>; Mon, 08 Apr 2024 03:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712573518; x=1713178318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNFkEWahBP6+0XNPWOMbRiFKrOw7mESIctQanLUg3j4=;
 b=v7sk+vPQQqcBIBr9wBaYl8id6gWxDAMt2HxYjO7j0vHBY2ynPyXJsSLHr+bnvW1hsa
 8xARVyNmH+c7KvYRgXFA+JSPVyCd4MXX0sJNJL6FpMek/zO9z3IM9xjDvilFX3kCVewp
 lT1bYwWI4M6uYzZAhdYYMySXBCtDg+1Q6/fyk+BodgVMDxAIRU+oQr12oE+6U7/0hiFa
 WEuJTacypyO8zYkgLvqcAO01uksNE0uHfjpwv/I/jJxhJj941zwSfrCxtc7/hDwuVSzM
 vErmfb3QlBLQmqW2OcRE4I0aNVeSc24lbNnrUWKA5IFVVZdfRG2HCtXhsMurz1hEx2c/
 7xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712573518; x=1713178318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNFkEWahBP6+0XNPWOMbRiFKrOw7mESIctQanLUg3j4=;
 b=AAqRWATjZ92EZYWxGjG7tGZxthkeFMOCDArD0MR8oEt/tfM3N6GsWcGmeZSfk7dT9r
 b6svdouAy6BJhTZHoK/knLU+F0Rzqc/sJ4I/NiDJZFIeSNV20fqKlQhGN/ZPFP+3kbE6
 kYIEJG2rY18VLhatpKFBbgdpnRUn1YBDg37G57aAIU4LBieBbt0WJ+8iPigCyL7PCFtM
 JbmZt8O5G0rtl4xVBOo30MaZ4eHmogkc8XfH2avF8tCjRhYq+d2HbA6wz3Ysc3CPcMjo
 VRL6+6a2O0cAKlnW/ZFYQnMOxnKoBat+zf6rqzBCbUQZTTT+KsA8mhXEtdzMeUlTP2ty
 LVig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYpkIJezHzvJ/pw2CVltNkL8yYa+I/ZdtISDZ0CjXlv2XhppZwoaStwRVgmWGngx43CtfVPK43reIQMyaWdBhEoBpr
X-Gm-Message-State: AOJu0YzzGh7/0BdkrKhOo9riZ+GDGO163XtbLYOsVhyVMGM+WsFyymzE
 urY8DRG0b20JV0w7uHqGemlM1W8FVvkZdXBBZKOw2nEiNYeK8C+skkE6tjw3SCM=
X-Received: by 2002:a05:6512:554:b0:513:da61:9b46 with SMTP id
 h20-20020a056512055400b00513da619b46mr5192172lfl.53.1712573518197; 
 Mon, 08 Apr 2024 03:51:58 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.144.67])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a5d4acd000000b00343eac2acc4sm8044440wrs.111.2024.04.08.03.51.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Apr 2024 03:51:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Chuhong Yuan <hslester96@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0? 1/2] hw/net/lan9118: Replace magic '2048' value by
 'PKT_SIZE' definition
Date: Mon,  8 Apr 2024 12:51:48 +0200
Message-ID: <20240408105149.59258-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240408105149.59258-1-philmd@linaro.org>
References: <20240408105149.59258-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L9PCJ2U/uSGg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/lan9118.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 47ff25b441..7be0430ac5 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -150,6 +150,8 @@ do { printf("lan9118: " fmt , ## __VA_ARGS__); } while (0)
 
 #define GPT_TIMER_EN    0x20000000
 
+#define PKT_SIZE        2048
+
 enum tx_state {
     TX_IDLE,
     TX_B,
@@ -166,7 +168,7 @@ typedef struct {
     int32_t pad;
     int32_t fifo_used;
     int32_t len;
-    uint8_t data[2048];
+    uint8_t data[PKT_SIZE];
 } LAN9118Packet;
 
 static const VMStateDescription vmstate_lan9118_packet = {
@@ -182,7 +184,7 @@ static const VMStateDescription vmstate_lan9118_packet = {
         VMSTATE_INT32(pad, LAN9118Packet),
         VMSTATE_INT32(fifo_used, LAN9118Packet),
         VMSTATE_INT32(len, LAN9118Packet),
-        VMSTATE_UINT8_ARRAY(data, LAN9118Packet, 2048),
+        VMSTATE_UINT8_ARRAY(data, LAN9118Packet, PKT_SIZE),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -544,7 +546,7 @@ static ssize_t lan9118_receive(NetClientState *nc, const uint8_t *buf,
         return -1;
     }
 
-    if (size >= 2048 || size < 14) {
+    if (size >= PKT_SIZE || size < 14) {
         return -1;
     }
 
-- 
2.41.0

