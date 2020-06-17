Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp318352lfm;
        Tue, 16 Jun 2020 22:55:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8sSLcJ2KSDp11LbHK3U/nnGcrV+gYzHhhAiRHuKbTTlyhlorsqfVdcx6PgsGcLeLr+t7i
X-Received: by 2002:a25:b882:: with SMTP id w2mr10370314ybj.160.1592373341401;
        Tue, 16 Jun 2020 22:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592373341; cv=none;
        d=google.com; s=arc-20160816;
        b=r+mY+0Vf8y5fUIJfqgooyY1Ix4Ja9xsyyzkmIliLLHi9SMdUUK5uG/AcSvsuWubHen
         DzImcgkeJVolOfFCskP1w2+dGFQLvdUiVWq77cAGTIAioOu7u2DYFKGsASiks4a0kenP
         4cNULxS6traEFKpvujy5H//B3VFUlh+OJIOsimxT7jNoTUzGYqQNdlpeRYg/RAvWTK9y
         2An1Y1t7DFlYvyH9Ev4jyZLkdTkIKTihnV5bmOHvTiW4eG7RLT6gke9cczWpoPjo4pYQ
         AdJFM4o6DlUu1Xven2sgmmdngTg3xBJljTOotspw6HFAHZQs2tECpII8iHqkCr0A2Z6/
         ehtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FBTuMSOiLwpA4yPchfEYPLFdnrdZHjpXEDQDsJPN5pY=;
        b=LwKWCQvswXtxx7iuPxHhSPBjGMUTm+TacqveQJifFm7vPjVkMt6A8H5mqSh7/9sJn+
         I08Re3rH1Zm/p1RIvvIAE3C2OfX/uCQKuk4WnR+k7GaUJYi/H88g/PVxxtUbrkRudaPI
         WjSX6J4jy3SxurUieumzFdmPRNeCom/H/JlG60kMwAhCGlFMoWWBPb/PWhOSE5krtUeH
         to/2dWCbMqPKPZ6nMlIbAH2GMbe5kIQUNaDvHhGwy4CmyXfbMLGNADEI5H8GigfT1BA/
         i9TbFQ6fOZb4V05N1PBrhLnssF9ywyJIQaOiinH7fAIU2BJcADHJ8hQBMyuLg3Gm4iO1
         th2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mrlojp0n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si17770346ybf.91.2020.06.16.22.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 22:55:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mrlojp0n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlR2y-0008TO-Od
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 01:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzi-0002hS-VA; Wed, 17 Jun 2020 01:52:18 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzh-0004Sj-Cd; Wed, 17 Jun 2020 01:52:18 -0400
Received: by mail-wr1-x441.google.com with SMTP id h5so918700wrc.7;
 Tue, 16 Jun 2020 22:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBTuMSOiLwpA4yPchfEYPLFdnrdZHjpXEDQDsJPN5pY=;
 b=Mrlojp0nSZ29AmemXES5Q+Cn9i/ZqgpH6z08Zc9+kpJ0uO206wK1ND6JlxQbSewHSj
 SfolCoqZD2ueUROvAT1F4s8Na74rhZzJ4In2twsQqeF35WGn1UEBpDPDHXFgZuux418Q
 JjHWCdDeOtwtkiQ1CU0ncCZ1UVorA4kxdfaFWTWsB5PNU/skjRBXRd02+QqKrV5z6GLf
 sRrCaD+2pBbAQKtLHYa0rk19JJLNkyTMXZIzRveP+jsEIY9zlw8GUE8AkizZUes/ck5C
 vTqUCjyaK3zw5PeO6g5u5pSZ6cSzWm0kVByQI8q1d6XSoNhK5aN23V4bXKgxMN1QCMSq
 dqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FBTuMSOiLwpA4yPchfEYPLFdnrdZHjpXEDQDsJPN5pY=;
 b=MihQy/PlNp8RfVYNmdosDW1w0XpeHDLp6hMmeGpjrMCGYwG+xoUDG0WT0cElylk7LG
 8VxuB5mYKfFs/w78L2K4LWTe7Dwi8t/3LEnXwkVdUA5BBvVGe+ZOqmpWb4cmgimtxAh6
 3JUT0JrQs0B5xyMcevkcv6vqmCQ2zWoPgffZhuwXAXZcOtlpU/7kLVGklb2ww7jZg9jN
 U9oR3qOhF1MCyTfy6tQLtyyiLJABZmWHwc1rXwd2+hZJbgJHd7Lk6uUlVhlh7zCQ3Its
 DR1d/1PwyxkCoz4HDryVI/8RyMgHWOen3PsGzrX+ZDjJtOU5Iy8VUz3GjoNv1wyDi9vg
 pa5Q==
X-Gm-Message-State: AOAM5326C28x1eX7HZNFuOucsVQ5Y5M143wKhRhI8XLkQ8Joso1ZyQtz
 jZyZHuk1p0QBWlAOs2bpCJtV+T7K
X-Received: by 2002:a5d:5230:: with SMTP id i16mr6460923wra.325.1592373135678; 
 Tue, 16 Jun 2020 22:52:15 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id d28sm3000809wrc.50.2020.06.16.22.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 22:52:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/14] hw/arm/mps2: Rename CMSDK AHB peripheral region
Date: Wed, 17 Jun 2020 07:51:58 +0200
Message-Id: <20200617055205.3576-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617055205.3576-1-f4bug@amsat.org>
References: <20200617055205.3576-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JfuVP9kvHH/U

To differenciate with the CMSDK APB peripheral region,
rename this region 'CMSDK AHB peripheral region'.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index ee555f919d..4fe5cc8622 100644
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

