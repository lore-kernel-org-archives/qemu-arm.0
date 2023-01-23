Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3045696ejc;
        Mon, 23 Jan 2023 08:23:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvbKjw7qG0LAt591b6OZlT3Lm8yrWN+XPxvW+wtFjpniXRUbUwseTYiMAfQX/y3AuYWGVX
X-Received: by 2002:a05:622a:1aa5:b0:3b6:a1fd:19cd with SMTP id s37-20020a05622a1aa500b003b6a1fd19cdmr22647859qtc.46.1674491010787;
        Mon, 23 Jan 2023 08:23:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674491010; cv=none;
        d=google.com; s=arc-20160816;
        b=uZiapUTGV5j6mIl5A9LnxGkFxe2/6a6cp9TVzouWZN6sMxApAgREXOOrqGhLlz89lX
         LkyD72XI4R60bfhFfZJbFeE9Sxtzi3PBz/rswKVHYDo8VHdpvXkHvQApSEEfV3K2K0Tg
         C2U3XCmsNdqlK/aDdVub/NgsfPr8RAz93wEZMJQG9d31yD6POv2PFGovCN13KVv/V1ws
         8DLOL5ELCpk61nK+rlKfwchMSsawEr6+DziFC6HCQaSLe5Sqo6iLtPDyS8u7ZiY36BdW
         Sho/JnbjsTOyEOv4ha0D/K/M1+jb3klnMratExKufEK122lIphtE5zavkUsqWcqKiw/E
         vyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=C+EScrM/BlF+L0aCDcrNncH4RADSJ3Df3ccUc0bOkbE=;
        b=p17cYfJzhg0skqKkHhsgkLRV7ETFRz8fXJiyaPkJDHknKjo0G2Gg9FwBrTdxb1eUmb
         QtXbtHmwFFQyNhnkj/IZkOvM6980KhAUYIPcSxLq5dusdfrfpo3RyAotmwTGj6AdwPoD
         AoDU+sOvb0bqaUaj/Jt0fjPk9+fA342I/ytDMH0aEyMEm/KkSKD5Uz81HpmEBZrDMH1a
         ECSYVAmz9vN2VlkcCxGmjcsCChaCEvHRQMXnuUNIBwMgjx5l+LFU+nrZOk2DZe7/pCfs
         zkxAtTilJpXmxP7Ky9rNn9k2KadPI67EMLbx2z28iRAReAxIq5MsWm9QwRMJVe4Udb+a
         3iaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=RDaN6vK0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020ac80647000000b00397e910165esi28609124qth.417.2023.01.23.08.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 08:23:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=RDaN6vK0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJzbM-0007eg-Ul; Mon, 23 Jan 2023 11:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbL-0007du-Aw; Mon, 23 Jan 2023 11:23:19 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbJ-0003bQ-Ot; Mon, 23 Jan 2023 11:23:19 -0500
Received: from localhost.localdomain (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id 84FA320E1ABA;
 Mon, 23 Jan 2023 08:23:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 84FA320E1ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490996;
 bh=C+EScrM/BlF+L0aCDcrNncH4RADSJ3Df3ccUc0bOkbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RDaN6vK0qainpzsagd4sNqdQLynkm5UKnpd1H35XSHJoEnz52H0A1dbSZRUmJxJzS
 sGVOQZ6kWUx3oP9lKzX0ii4qnJwdB+xZcHDk8mShWql+gJm51prxUPjDMorty++Qff
 xlm+U06kmDvhw4xURy7DFpysEqCCP8/oMdm6HElA=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH v4 4/5] hw/char/pl011: better handling of FIFO flags on LCR
 reset
Date: Mon, 23 Jan 2023 17:23:03 +0100
Message-Id: <20230123162304.26254-5-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: D0m4qpizaQD8

Current FIFO handling code does not reset RXFE/RXFF flags when guest
resets FIFO by writing to UARTLCR register, although internal FIFO state
is reset to 0 read count. Actual guest-visible flag update will happen
only on next data read or write attempt. As a result of that any guest
that expects RXFE flag to be set (and RXFF to be cleared) after resetting
FIFO will never see that happen.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index ca7537d8ed..c15cb7af20 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -92,6 +92,16 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
 }
 
+static inline void pl011_reset_fifo(PL011State *s)
+{
+    s->read_count = 0;
+    s->read_pos = 0;
+
+    /* Reset FIFO flags */
+    s->flags &= ~(PL011_FLAG_RXFF | PL011_FLAG_TXFF);
+    s->flags |= PL011_FLAG_RXFE | PL011_FLAG_TXFE;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -239,8 +249,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & 0x10) {
-            s->read_count = 0;
-            s->read_pos = 0;
+            pl011_reset_fifo(s);
         }
         if ((s->lcr ^ value) & 0x1) {
             int break_enable = value & 0x1;
@@ -450,12 +459,11 @@ static void pl011_reset(DeviceState *dev)
     s->ilpr = 0;
     s->ibrd = 0;
     s->fbrd = 0;
-    s->read_pos = 0;
-    s->read_count = 0;
     s->read_trigger = 1;
     s->ifl = 0x12;
     s->cr = 0x300;
-    s->flags = 0x90;
+    s->flags = 0;
+    pl011_reset_fifo(s);
 }
 
 static void pl011_class_init(ObjectClass *oc, void *data)
-- 
2.34.1

