Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp572857ejb;
        Mon, 18 Mar 2024 04:32:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqaMZHr+0aHYkb57tFRg5AP3n3ysBGH4G4qzLRXwU+5hvLVGlr9CZYlOpAOuxYLykgKs0ybd3wT5y6mHFRSFxR3nxqoTM+
X-Google-Smtp-Source: AGHT+IHDXgUAjp5Edseru/bOWfTgjiDbz26qlYbJcD/a58J2oa2zFyOjNcTSKZHrlr1ymoaC+q9G
X-Received: by 2002:a9d:7cc4:0:b0:6e4:d6d8:fbaa with SMTP id r4-20020a9d7cc4000000b006e4d6d8fbaamr11481375otn.37.1710761560843;
        Mon, 18 Mar 2024 04:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710761560; cv=none;
        d=google.com; s=arc-20160816;
        b=A+tH8/EXrMx+AU4ISyzRFZDu7V0Q8U0OU8bMTLUaSOJYHJoQXKYNkOtTijf46eBKO6
         2aJymPOfy9b3Q5is/sBulBlGYy1759cmhkLe1tBWepuduyBtqJsrSilFf6mNkSBIxdCq
         8W6GbPWGIMvvpOHZ/GA0FGoM5SOzaK9NnjBzZ9FddBt9NTKF6qxOLM4e9LGofGGrYJJJ
         02BW6Ychr8RXXt4SNM6CLFq4ftokkOptS2oJJD5bK5DKwu9QtdYYSNZvnoBzRw4cux0B
         teioyUhHELm2PwdZFKl6oiTQ5IcJiL2PmHO/NeFWVeQ3XQhsYsvCaonpcJ2pto2Rh+5J
         BuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SFthmmsYp+m5f9owLwx+hyTocTKSDvu4WqZSfWH+cu8=;
        fh=yfwDdSKcr6Se3eGE9F6E1ezNMLd6LigQ+5HydIWa3ho=;
        b=R4ttPnKCawlonFvTFk3/bv9GptqbVoszA+p1Demhb5+7ZYpusfXmFF7luIydLjmaDa
         bV5bQczU4rJTaQuRzqW3gxIOjkDN/DQiD80gYIUpXwaY2ukfU9hpg8yJsjFI4MGTfyXk
         4PDOZwSkrY+rUjEOLgzzfDPdf7T5/xOFft9sBZEGhefQQYMiqoDchqJmSsywCCMxypzV
         uelwpl6DsBWKf665Uf7XZ4CxROPLdHHClFm//2P2S0nd2SqDJZ3WVti1l8ZJIvihBCNV
         c8avkzlvg2FvkByB2fbazWRWkQMo00dbsUlybuY+Hnj++jItT/hJyX0BnPYP3RIJ/WJe
         Vt2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/kUTwkP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020ad45f46000000b00690047b8120si8166565qvg.539.2024.03.18.04.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 04:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/kUTwkP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmBDk-00088X-9i; Mon, 18 Mar 2024 07:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmBDi-00087Z-9k
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 07:31:58 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmBDg-00077O-Ne
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 07:31:58 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-513d23be0b6so4212459e87.0
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 04:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710761515; x=1711366315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFthmmsYp+m5f9owLwx+hyTocTKSDvu4WqZSfWH+cu8=;
 b=M/kUTwkPeboXlUZublF5oMUWc/IoCL9w5+sb05yAxzdFHilC5Rs9LJdUHtkhHEgtgF
 4nFtjgh6nTMEt9MkNO+pk2pyon4wFbzjyfyscx2r6syPJBZyflZ4Zm/sYaZI5k7J2mxF
 ARIvup7v1S+3OW8YYb+QfF+ac7ICmxPUoFP0mm0OwtIX5hLOB7rso+DkgBg0bgsx00GG
 QtdsLxyJD0s1B+h0UPSOAtBfv0FV2O+ES7KOveXk8shEzTr8MDiuBXnzobK0hfRiq14w
 giTbUOEL3cU8chozV/dzeYVRSx6HsDaTvJrEfWnclYmPjohciKKyDR6F+yHUHLr4BbAP
 nriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710761515; x=1711366315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SFthmmsYp+m5f9owLwx+hyTocTKSDvu4WqZSfWH+cu8=;
 b=bZ6i1fE8oRngbss2qh/BvbFgmbXb8Ku0dk1AneD5otf1MN/jnGfRxiqpfjoWQcvXef
 OM2OZbh5/vzLHVXI+cGUbMi0SXssGSS43Nq3b6ts/I0W5XUmm4nEHXkbaOJs1mBxfrru
 ivp1I+qJhHB/0Hy4+jnrHXxlq+21s4rmksg5K0Zz8Szj6cAEgti4XYGUPnvbrCaDWoEf
 UoCm6mnt4LRRrWOFohadtXxd2QPMrSs0twa7E6bGHUKhI8+NqKGbf9Lqml4VPYV3zzCJ
 gWy0VaItknjnDyOwIlJ9zWUV7eiqvSVE4cU/JEY+wLbyGI2lJXjgd5p47iJBslXVGT1E
 /Jtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyxGdBG8sRPaJn1E5nRRYZEZDoXXYzvfGliTwJ87LuTRmT76ht3Yc7GfSC/I7ryAvt76HaM5gEDiSzSEBkoDfc42Qm
X-Gm-Message-State: AOJu0YzxsWIuu+QvC1CRPmbMBFtenB9/jFisWuhwFOo/lAT1jqGVwwV1
 vfwJkHA2PeOaYyxjyGy6BxMIHtaieqgEnt/sRum60FyZHWYLHtaOBrgvB3ptw3g=
X-Received: by 2002:a05:6512:2205:b0:513:e7ff:15b8 with SMTP id
 h5-20020a056512220500b00513e7ff15b8mr2758956lfu.51.1710761515074; 
 Mon, 18 Mar 2024 04:31:55 -0700 (PDT)
Received: from m1x-phil.lan (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 m10-20020adffe4a000000b0033de10c9efcsm9536719wrs.114.2024.03.18.04.31.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Mar 2024 04:31:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 v2 2/3] hw/display/pxa2xx_lcd: Set rotation angle
 using qemu_console_set_rotate
Date: Mon, 18 Mar 2024 12:31:39 +0100
Message-ID: <20240318113140.88151-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240318113140.88151-1-philmd@linaro.org>
References: <20240318113140.88151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: mmASsknCt5Ga

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/pxa2xx_lcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index a9d0d981a0..7d03fa57d0 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -1439,6 +1439,7 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
     s->con = graphic_console_init(NULL, 0, &pxa2xx_ops, s);
+    qemu_console_set_rotate(s->con, graphic_rotate);
 
     vmstate_register(NULL, 0, &vmstate_pxa2xx_lcdc, s);
 
-- 
2.41.0

