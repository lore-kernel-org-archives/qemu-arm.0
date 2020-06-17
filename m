Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp321100lfm;
        Tue, 16 Jun 2020 23:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhRuppr/r5jbr50uGVt/IZtXdIzn9qEGQP0qnbpya7OF4n+VPSuA1xtP9rHUYxm1UHiOJ8
X-Received: by 2002:a25:cbd8:: with SMTP id b207mr10679290ybg.63.1592373652470;
        Tue, 16 Jun 2020 23:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592373652; cv=none;
        d=google.com; s=arc-20160816;
        b=aDzwgdg5d42e68HPQE7EYZJju5opCdoVzvLq4DD/wgqVlsYiwkp+NVGTGkq/H1YJSF
         t4pduHLKNn/iMfrhMeyisahUKHgVobzvwT601tBt8EvaltkzD+hIGGJV2TjoKYoGcak8
         awtBfUu/arsRd5BUHegA2UKfl509ExhDGuzh2wlP7khgr0dgdsIrMXF9cz4jOlE6yLx0
         0eoOiNBcjJlpvOHbIr1HO6LLSBk5Iynj5+hYcrqP2wjk9JZVWzBBctsW3/xpc6db/NiK
         EwV0sXC/71kGY+0pWlS/xCyfo9KI2F0CcSn8AsQGCXpbFN7XPQ7BCvygXjBwNPbpcHOH
         /upQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9KNJnLBp1OneKNvTmDgKiylMxA5dVLV/Msl/G9txJEk=;
        b=nFuRxb0PYJJqwJ/Ex0pwI02csr5jIwUW6kP5YrDEH6mx3i2A0bOyj8KDbFFg480lyJ
         ErVo+UZPFDys6ybA/NynSEgncRiuzcJy6N0ufOnqsbgR3hUgWzY7oCPdB7ykFRWlBmFy
         4pLXli+fpioy6svtVCT1Li4GgxwEyU/0viGqT7G1DrEA3PJfhP5bPewf44UUhcB+8ekJ
         g0POAositvh0BhZOXXKAX6KbpeLYzkKJGeMaPbriG7y8+L+WR+mmnfUznutvyaQin2aO
         Ael31Bf8Vt9zKrynHpBGMoo7/w7ulI1V4PSPH20O677eUbeXzUyfSQJXa0WZrZkHitnD
         LvSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BFWdVgF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d78si18887711ybc.122.2020.06.16.23.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 23:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BFWdVgF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlR7z-0000ug-Qk
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 02:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzp-0002wj-PD; Wed, 17 Jun 2020 01:52:25 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzo-0004Tn-9W; Wed, 17 Jun 2020 01:52:25 -0400
Received: by mail-wr1-x443.google.com with SMTP id x14so940353wrp.2;
 Tue, 16 Jun 2020 22:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9KNJnLBp1OneKNvTmDgKiylMxA5dVLV/Msl/G9txJEk=;
 b=BFWdVgF+mrx7gmkDsLV47SX2+NbpUyzKQvJvPtfBeiSaadfUSZj8XX/c+BtR/eIyJi
 MJHKsL4W7MBDlh3kDlzWFEEWQihWxMgvv+Gn3tdpPU610ZlqdEp74nAgTXkwbUoZhfFG
 5LntNKz244CaSAKTS2UbaI+N0ukJ2X1Tt3DzvVDNkrBGw3STfcDU1po9vyYSirsdFJv4
 lPA+5YXThflvb4QIgLTdWUPUoo3k+Jjzu2cWAFr95oiqBKF+8suAHYT/v7N03ffE2a5m
 AB6WCYLqlIJtqQWqbnXGGHCe4GCswX9CuUn1NG+cgdQsghuRtH/gVxHLnZ7uov6zuEik
 t+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9KNJnLBp1OneKNvTmDgKiylMxA5dVLV/Msl/G9txJEk=;
 b=URfW+Fv58i01Ai7m1VPS+qbrCI+n73K4sAmSHDSTXCew+ihGPQ0X+fhfzVHv7LatAX
 YOlFgn7eicaC56X6fBt0K9cifHao/PW0m0VIXOiIsrLlEeiYJoBeYm7y+3RwdPHpmfti
 5Dkz6C7T6TSDtAIFPlwqsUJlFhyadUeKl2qKC39TRgWgtoYMc+79FH9d3v4RlaUJXJVD
 OGZgajzh1asoGt8ctbFUBDXetdYjMJmrsf+J4/mWIuv5SS4De8K2Vsa3eblmjJuKz1cw
 xY4MhwvMQ0VJ5i6gpY6N1uZlN/9yK1rwC/9Ou7VsmKT4g5KZ3CQtoyqj5TjA6LtMqZhL
 Rb0w==
X-Gm-Message-State: AOAM5330wXVMkob87l9vEDBNl7/UlnGQzmbROryetc4phimJXIbPbeBI
 OzYH4q1LQ1uKtYvE3ffwKGUG1TxR
X-Received: by 2002:adf:f84d:: with SMTP id d13mr6172214wrq.99.1592373142394; 
 Tue, 16 Jun 2020 22:52:22 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id d28sm3000809wrc.50.2020.06.16.22.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 22:52:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/14] hw/arm/mps2: Add audio I2S interface as
 unimplemented device
Date: Wed, 17 Jun 2020 07:52:04 +0200
Message-Id: <20200617055205.3576-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617055205.3576-1-f4bug@amsat.org>
References: <20200617055205.3576-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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
X-TUID: ka9tKw0V2Bhd

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 2f6acbf2c2..d1653a7e6e 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -373,6 +373,7 @@ static void mps2_common_init(MachineState *machine)
                                          0x4002a000};   /* Shield1 */
         sysbus_create_simple(TYPE_ARM_SBCON_I2C, i2cbase[i], NULL);
     }
+    create_unimplemented_device("i2s", 0x40024000, 0x400);
 
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
-- 
2.21.3

