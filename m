Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp738115ejb;
        Thu, 15 Feb 2024 10:02:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUti8lv0Y9Uxe1YVHYbR4G4g2UwzE5uunHCvPUfzARAjgaB7w+wF9jAwSmXAu7nbcisWSXF6vhX/N+uiAICw3M4TFkuD6qJ
X-Google-Smtp-Source: AGHT+IGHCSfElFtJux3Aih4N0JcTsD8j4H+Qg7lnWgTO82+qRICo4hBy0oVZ1mMDrc/Jik9s7yUF
X-Received: by 2002:a05:6102:440e:b0:46e:cef9:bdbf with SMTP id df14-20020a056102440e00b0046ecef9bdbfmr3674753vsb.3.1708020172562;
        Thu, 15 Feb 2024 10:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020172; cv=none;
        d=google.com; s=arc-20160816;
        b=QOfgbfucopYPz35bXCSCV3HIX5mX+Yf3V/rxEY8xCCceyyZmokLzQQtxAFQjTnm8Nm
         cTbJg0dov2nf/Sf7sjNGWBQpJ30L949xh+UsADmnKCrnR5Pcgmf04gLB5XCgrNr4I004
         HJ1jyq5dYUvrVIFbD5njGZs0hKhdCtGYpU2LMLKwvWT+LDJPVpg4NQMk0ysnIVZq5KAg
         DjEK8JCnkSoRFkI/JYz+nyCwAr8HfNN66SOKlXdBN6WAx0VRkxLRpIU/z2ial/Il+lpk
         ew1SYs8s9vTrzUixqndusAG9Sx/N5kxGkYU8pAw6irANVFQe91/EdnGP2pZ2n7XiF03Z
         +eFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MdETzWg8sMtllnYJcpe7xJU6Mgoke/FLcBGSchABTcY=;
        fh=H5zZhjSfHnETgMAsFp86qi0+Xav2zfYe6WkqSEHM2JA=;
        b=aYqWoyL8q3XiZitkFKOxbRZFXqyXDrkqpDQghHizDVr81ibC/e4M7yjMbUHsSy4olm
         d3+hyMAZrhEmUPmmkc76rehe5gIqxZoCbb4FKnjBt0/80iOeBym65548y0ozSSYC5xt9
         Yj6WU3EOdAOl7zWhZM+PvQp+0gG2UqVLX2602D7QgM+IoDwT5T61jHHdQiDZ0HxZqnmu
         BKZM33atB7bqr47BoNtTkspf7wu9fx/RpUlGNsXsYL2gyXLGRqbznXVw2kKCWnm2vq6c
         Bvg4C+6/ULXAHvIx4j0p3aNKuWva0BF+9rxIa5iwA4qNVFU50MEB1KyTWTEOM8qs9pCm
         mb1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTLvtPi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hz17-20020a0561024a9100b0046b12098baasi427723vsb.758.2024.02.15.10.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:02:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTLvtPi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag2T-00019B-Ew; Thu, 15 Feb 2024 13:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2O-0000Wz-BP
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:44 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2M-0002Jl-Jh
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:43 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3d6ea28d46so262482166b.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020041; x=1708624841; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdETzWg8sMtllnYJcpe7xJU6Mgoke/FLcBGSchABTcY=;
 b=CTLvtPi1TGn19RPnyO+PoX1Gsm1ioB9587tJsSDWrmc02ysB0ikZKow1xOyTAkGIem
 Cxdo9LdTFIujscwm57NCaYcOqm8fu1m68/wa5W6qe7WTfaaWCL/FUEhkCXNW8TooPtnr
 6LncgT1wkksPYiwXNubkpAQNZkG9bwoyS05yi3HIf5Fygbms/kBXoGtOiLqs95ni5vmh
 Oxgb2SHoadUczkahuRBuNBpNr+j6Gft57tx1Ag8c/JRhhfvJhAC+Mi1tcAVBr4PfdKJP
 1nt3xuwt2S0H0jUWn5JxuwtWqQ1CTxyV1Kj8V6F3ECDGIs+HzJ/0Oj6njscRmDScW3dc
 HKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020041; x=1708624841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdETzWg8sMtllnYJcpe7xJU6Mgoke/FLcBGSchABTcY=;
 b=aEexDvxXXGOkh7izHlAGCKx3GCQrkh/1jYZ8ptnWiVwNdd6kHYRe4ixND4ZA1T1Oum
 Q8hSUGOqMb9wc2dJzmOlE+1Y6cpU0q5mChUeecPFN1TZFDbcxg1aFasys6ZsLxfWPKeY
 iNE0Rry7PD8nN/lqfWmxdYDv0Drw8lolwIssk8mn2pwP9YrDpN2Eul19bKOYxtJbJFM6
 JJmVcWG646rtEzy5l1ow56ybh861/QzqraqocRjC2TTngaGjWkLl5Q5i76u55hoEN4+S
 HVUU6gMPGl1bVjQgBqLspdggxKUFcYO79Nd2YuCtMIHmosl30OJ/imKYNGSaIOejEkJj
 XvGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsMGYaUqEKzxpVwlvBBH87uo3Oy50EjgqKTHDogHZzOdPYa0az7KX3lhbTiIT3JbuhYxdPipl+QuvkSwaq8SKat25+
X-Gm-Message-State: AOJu0YyDi6j/PKxiRdc0YiOV42N4oHkN6lPOGg0bZ1NZ3my2eF7H4n/3
 Jzv8MjWNgI3yiure3YzZl+GWi/n+ftfR8/Q0nkKzmvcMsF0XJaJw2DeyezDlEBU=
X-Received: by 2002:a17:907:6d0c:b0:a3d:37a4:809d with SMTP id
 sa12-20020a1709076d0c00b00a3d37a4809dmr6462232ejc.7.1708020041080; 
 Thu, 15 Feb 2024 10:00:41 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 fj5-20020a1709069c8500b00a3d310a2684sm783255ejc.158.2024.02.15.10.00.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:00:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PULL 25/56] hw/sh4/r2d: Realize IDE controller before accessing it
Date: Thu, 15 Feb 2024 18:57:19 +0100
Message-ID: <20240215175752.82828-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hK21R2ILWTpc

We should not wire IRQs on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213130341.1793-8-philmd@linaro.org>
---
 hw/sh4/r2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index e9f316a6ce..c73e8f49b8 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -285,9 +285,9 @@ static void r2d_init(MachineState *machine)
     dinfo = drive_get(IF_IDE, 0, 0);
     dev = qdev_new("mmio-ide");
     busdev = SYS_BUS_DEVICE(dev);
-    sysbus_connect_irq(busdev, 0, irq[CF_IDE]);
     qdev_prop_set_uint32(dev, "shift", 1);
     sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_connect_irq(busdev, 0, irq[CF_IDE]);
     sysbus_mmio_map(busdev, 0, 0x14001000);
     sysbus_mmio_map(busdev, 1, 0x1400080c);
     mmio_ide_init_drives(dev, dinfo, NULL);
-- 
2.41.0

