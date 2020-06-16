Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2347237lfm;
        Mon, 15 Jun 2020 23:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGrKzY8VDVKGgQbOTLI2fNvbhUCKTaVs9e27EjAmzFgj4RemK+2LI3fCAo36LZDWrE0lz6
X-Received: by 2002:a25:bb82:: with SMTP id y2mr1630802ybg.392.1592289136300;
        Mon, 15 Jun 2020 23:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592289136; cv=none;
        d=google.com; s=arc-20160816;
        b=tMTk0j7U6FkaYPhXNEKW2C5TrXT40gybjVPMfEN4jnDZPhg5lOfu6Rzp+tvwMjWEWt
         EcoEHZcY5cBtVyJGdin4Njkn+kOrYJbeHIL418qK30Xks2BNR2M1S2UMicVYnrMlRwAX
         ldLcc2u76JULnaRNC2VTkkw9N4nc32OpcrGP1vCumWoi9qyO9Odxwr2hhwPnqSBboV2t
         se1VP66Ubl+ASPb2N4l/MhQPNGjqXqnVS0guECJ3/Boj9x+n2XvVmGthv0FLu9s+T2nH
         fTCPONKpX8XFfo6yvgbLf8kwxoqIiQd6WhKW8gFeAX6RLyoi5ftWcoAHdTM7oEeWjd0v
         aG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fwp2bV7YJjkiLZTrttPTVnsH6xKa3HonthSU7rRzJJA=;
        b=KmwMNah3EwcTNK9A4yC/ViHc4BPWaIZS2KPKBWmbWUYZOoC1tlY5jNJHdh+qUukkox
         II+bfflt+WL0gDFhrAzDiIqXqFajqOMPuJD/XAKcoNEs39/uxr97YTE1yfzgsx0i/aWj
         98G2UOB/pyqsSfQxJFHZZLkbdXTcJ/D6g+lNUmtQJ5j06ZjxLn9H2To7deCUEeiJM6lc
         TC577dMDyPqKeCe/vS7jUgGZiTyOZlW+HxRQBi7xGGprpU6pv9DruSY/ZlAtAbV09TnW
         XVsuqjivdsftd0TvS/pv7BiL0V9AC2fYLjztMA7QTfDc7B6wtZ82bAwVkIORhZSFi9Tc
         hzzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="MmNw4K8/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j126si15044096ybb.172.2020.06.15.23.32.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 23:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="MmNw4K8/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl58p-0007ub-LC
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 02:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl58e-0007u7-2y; Tue, 16 Jun 2020 02:32:04 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl58c-0003LG-N1; Tue, 16 Jun 2020 02:32:03 -0400
Received: by mail-wm1-x343.google.com with SMTP id c71so1700267wmd.5;
 Mon, 15 Jun 2020 23:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwp2bV7YJjkiLZTrttPTVnsH6xKa3HonthSU7rRzJJA=;
 b=MmNw4K8/gon6mgxA9LK3rVLZq+tpX8RgeZx33g6F8PL2+ox2TeCYAIdN+aKQoxMEHA
 X4MYXVYC6qgJ41XhPfRzB+VVTksKfMtjpOLrhHcNYZ/zpjd7qW9rC10Nmh5HuwWL54Ou
 QnWdq6q776ucKZ2WGHFuiKAiURLEhoGejsj5N8BtD8Vzu5hRjT+/I2SVpdDbxB5DcF7j
 8ZiHXRHJ4YI2W1AEAPlPzg5mpl1vj13rzEv0CofGxkbcWPnf1R38mY34BN0aYnfsqz3v
 eSJ2y1OnqTYGRyUOHc9fDzwD7lZm3WAN6+iOZ3ycwUnmSEnCySP+or7sq60Cfdly8vci
 0vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fwp2bV7YJjkiLZTrttPTVnsH6xKa3HonthSU7rRzJJA=;
 b=N5GK4OZrGloQHTZqdC/b1zi21eazo27bU+8IDfePCfljSR7N/bgU3rdJiolumlcuVv
 MAOlDsVGJrrXiCbIx0MGNFrUlY6pCGMakhBOLaso1J3ViAgH8nN6QKAZVA1lXH45sKth
 m3aRJ+vr/IV/G5W9Vd+184jcX0J+fJ16PP2VdqNFo7CbeqNG1RaoJ2zOwJWtoWInav6v
 Y8m9k7SUMry7zXjmnPOTD3pyf8EdVTOIcFoBVqP4K2JS/ryCdvcortXJZHwQ3ljnfx5n
 VVhHj7gFWhZ25+afCQjmxuI0PEEvEOLZG8EjLyAyUNVYmX2iIBTAkq0bgPwybAfQMT4w
 BfjQ==
X-Gm-Message-State: AOAM531a0a1U3VsBLeP1u+PlcYViVoDqk0nKVftaoe6w60pZMPXR4PXr
 ojM2UbBlQCo7Ma5HDlrfKtPRNkan
X-Received: by 2002:a7b:cf31:: with SMTP id m17mr1446887wmg.47.1592289120628; 
 Mon, 15 Jun 2020 23:32:00 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id t188sm2483250wmt.27.2020.06.15.23.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 23:32:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] hw/arm/mps2: Rename CMSDK AHB peripheral region
Date: Tue, 16 Jun 2020 08:31:51 +0200
Message-Id: <20200616063157.16389-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200616063157.16389-1-f4bug@amsat.org>
References: <20200616063157.16389-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SuF5HRanxvoE

To differenciate with the CMSDK APB peripheral region,
rename this region 'CMSDK AHB peripheral region'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index f246213206..3cc02c9018 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -212,10 +212,11 @@ static void mps2_common_init(MachineState *machine)
      */
     create_unimplemented_device("CMSDK APB peripheral region @0x40000000",
                                 0x40000000, 0x00010000);
-    create_unimplemented_device("CMSDK peripheral region @0x40010000",
+    create_unimplemented_device("CMSDK AHB peripheral region @0x40010000",
                                 0x40010000, 0x00010000);
     create_unimplemented_device("Extra peripheral region @0x40020000",
                                 0x40020000, 0x00010000);
+
     create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
     create_unimplemented_device("VGA", 0x41000000, 0x0200000);
 
-- 
2.21.3

