Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp17340lfc;
        Thu, 16 Dec 2021 00:47:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpPpd42ydXPc58iObPnlFCu5ey47VeXPaDvhbfL4ie5xbwdMJoR7/ixrSnIvbrmnnA7DGV
X-Received: by 2002:a25:ccc7:: with SMTP id l190mr12466882ybf.466.1639644444114;
        Thu, 16 Dec 2021 00:47:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639644444; cv=none;
        d=google.com; s=arc-20160816;
        b=ah7rGkrV4EqprWNd1RfpH8F5A1Tl+eBO+vcX+KlSxwDPji1DtcA2M85ZumjKjX+vU0
         y4GSyJiDC5tbxYFN/fFLlWq0H9c7aO7rIkwGfQFG45uVHoybC4OFnXQnHfeIY6vRprpW
         WcUAgavrTkDr51HxLeg3F6+auuQMrc3Fh3NpMvy03HesrTdLZlSvuo9ZoDgtETPv7pCU
         +jiOnN/f/qo6nHp7DLVnAm9jF5YM/ZCl85yyMlYLIM2ZcDLQoB8Ci7SFs+xRyntlxkV6
         rdSbB7EFbARAsIqZmXJZwvQoqouhNDZxrAsOorDh0uQvxPe86rxqxgB9jtgb1v+EQJck
         ma/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NsGkgLg/FTwpFvrnErxAcsQIbF5SaAPwAKaBC1NuFFw=;
        b=1A1MdVAJnVRjM3SBhocIoKNC6evFzuPIY2Ag2Nh8lv+F1KyGsWmsHJSz+E9rOE3Q11
         wCWJ1WkCocRxSdM0xN/Idl93+xQpwuU6z1wY5v58H7L2MpUO2338kzC2YdWXjiJVBZnD
         2I/Yk3asDAkekxkEYq3XpizEl90+MQ2u16VujxQKbXXqJ1LZaLcGVeRCLC2IYsze0d35
         LwygJ5FyVsdSOWgAWAOZFYCxKAOszsQqfCfhIhj8tDyTL6ziaVIS8dmcdOCvYPd7fDGh
         Hd1L4cKhd/eJlqu4z4kcsQobfxiX6d3JLA5HIxoiRG8w14gZpQxdpC4LC8Pj1IvIJ8ul
         pqTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=TTqmbdwr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si4908541ybm.233.2021.12.16.00.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Dec 2021 00:47:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=TTqmbdwr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxmQ7-00022K-E7
	for alex.bennee@linaro.org; Thu, 16 Dec 2021 03:47:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmOa-0000IG-Gj; Thu, 16 Dec 2021 03:45:48 -0500
Received: from [2a00:1450:4864:20::32e] (port=37425
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmOY-0003I7-LU; Thu, 16 Dec 2021 03:45:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso1171879wms.2; 
 Thu, 16 Dec 2021 00:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsGkgLg/FTwpFvrnErxAcsQIbF5SaAPwAKaBC1NuFFw=;
 b=TTqmbdwrTuYtGxNO6UZ9OZSlYOQk1mnBWSbxVx6UVofNubiFcbxHsLkAlUnYzcaPQU
 7nkDpDQIFtYPQur5HrFX5qHRn9vEiEvBiw6mkFqH2M+e7TUBL3iwpKZN8HFBoKz4+7Zh
 mlvyY8WfEKZpGqJe4RNHEYLOTByulavBfDvD/0v2qFQJMJO6uZTVUSKbUXJp8F2cAvva
 rhkEkt1pzFq/pCu1LJ4FFBtB6AR85b0gF8Yd8EY+NGnaVoF7YhntAM4MxZ+0VT7BjMT7
 Bb/e1kHEeQjcgpik2odStH0JQZEZ8qzgu/KRbLebjblHR2TEDOTfJlNYZRJ2xfmQhUXO
 2NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NsGkgLg/FTwpFvrnErxAcsQIbF5SaAPwAKaBC1NuFFw=;
 b=CWIo+2b/nXwImvCs80j+7Zk2AVNS3lVeD/SNnSjcnFfPcJxECcN/R1g0P6DOIc4ZVS
 HcGVWYDwUXwXyk/mEevwMkQydMsP+lfPg5IkPSfSXgRviQy0/CzWpQRCjZIE9HRLuzqf
 KwnG0geHPwd3AXUnMv6Jc8DNl7XPDW1J++9RyDytryWCQGOsU4uoMFPPR+aSQPA3EPss
 2r6ht20rXAaDt8dbQiREdEHoHFtnAPJWspIsCtqxhOGjRShJx3iMlxMC8gL00Yi/tnTQ
 OD9gJQRpsgYUti4EO2CR/SIg+hCoy+NWjR2GR5g4woh1/iraOXJxegkPatZW5CYEiDIn
 7dqA==
X-Gm-Message-State: AOAM532zphaVcBxvUHn+xFomlfuX0TbpyXlnlS+jsnBzEcGfmDNQXZ37
 ltxFbfvaIuAFzg4B6+FdCXHkrD8qnog=
X-Received: by 2002:a7b:c008:: with SMTP id c8mr3849651wmb.87.1639644344844;
 Thu, 16 Dec 2021 00:45:44 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g3sm753057wrp.79.2021.12.16.00.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:45:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/arm/musicpal: Fix coding style of code related to
 MV88W8618 device
Date: Thu, 16 Dec 2021 09:45:29 +0100
Message-Id: <20211216084530.698125-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216084530.698125-1-f4bug@amsat.org>
References: <20211216084530.698125-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mnIMK/R/S6jG

We are going to move this code, so fix its style first to avoid:

  ERROR: spaces required around that '/' (ctx:VxV)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 2d612cc0c9b..6b5310117b8 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -309,13 +309,13 @@ static uint64_t mv88w8618_eth_read(void *opaque, hwaddr offset,
         return s->imr;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        return s->frx_queue[(offset - MP_ETH_FRDP0)/4];
+        return s->frx_queue[(offset - MP_ETH_FRDP0) / 4];
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        return s->rx_queue[(offset - MP_ETH_CRDP0)/4];
+        return s->rx_queue[(offset - MP_ETH_CRDP0) / 4];
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        return s->tx_queue[(offset - MP_ETH_CTDP0)/4];
+        return s->tx_queue[(offset - MP_ETH_CTDP0) / 4];
 
     default:
         return 0;
@@ -360,16 +360,16 @@ static void mv88w8618_eth_write(void *opaque, hwaddr offset,
         break;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        s->frx_queue[(offset - MP_ETH_FRDP0)/4] = value;
+        s->frx_queue[(offset - MP_ETH_FRDP0) / 4] = value;
         break;
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        s->rx_queue[(offset - MP_ETH_CRDP0)/4] =
-            s->cur_rx[(offset - MP_ETH_CRDP0)/4] = value;
+        s->rx_queue[(offset - MP_ETH_CRDP0) / 4] =
+            s->cur_rx[(offset - MP_ETH_CRDP0) / 4] = value;
         break;
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        s->tx_queue[(offset - MP_ETH_CTDP0)/4] = value;
+        s->tx_queue[(offset - MP_ETH_CTDP0) / 4] = value;
         break;
     }
 }
-- 
2.33.1

