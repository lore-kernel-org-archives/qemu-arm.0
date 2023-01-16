Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1347570ejc;
        Mon, 16 Jan 2023 04:25:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvsZvt8R+7wWkSJjEMRYvNX68BigOT2LdQ1eNCf+LSmbE4pdfglXj5Ebg/ZIhjM3+38LXHL
X-Received: by 2002:a05:622a:4c88:b0:3a8:21a5:d93 with SMTP id ez8-20020a05622a4c8800b003a821a50d93mr146526892qtb.39.1673871904325;
        Mon, 16 Jan 2023 04:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673871904; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRm6pE9Ac6iopqcqG5W8afruPtP4KFsSLitWdcsENMHYPsmmuQJbdojM/dg5CE8yeJ
         LFZnmhG5k7nQ7wNIKY0CVDdp7GK3gnBq3k8SKVA8CjWit9aL0C2DYTHEenTm6q/qDdxq
         ZprESusZq6SBYPmoW+iNDLk2AEFg+4C4268JulgCz0oxyi7rA3F6Gu99z1hHcauk8vQD
         VjgUkGffeU9Qs0NXNKlTSMC/72sqEluTB5ORsCnXf+H/kk/6SR1Ls82bOipa87e5p59B
         Pr1x+IU96Nb0YSxBmy0MTN0X2i5Da0ij1T3Lkx8EuvZVQswsgGuwelYJwMXm5klA0Vvg
         dkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=owx1GxvX7pABOn7kTA/4Lyl/4LpONf/KJwRoErEfOAs=;
        b=k1Ogav0V87LEqBZ7SFE3uVqZY97xV/izeOoNO42l1OceaDOtx570p88bmaLey3XbIS
         lDMeBzKbFAuxF/aMwR6ikHHPz7MB++StLukFRBS9+Yp6OlpO2ihabX/9JR6yRpbtnIj4
         rjeDkhJ89WEDqLqd/9qqc/Bg20ivdU1KBkhTFOR5DKFIy6c1PH8H2NH7K1jlr7xGfxyn
         wm4I1qIzG6DczO+w956tie+S6Lri2A4DmrujFvGTHCOR9nWKRDS+P8Q4SrhDY5XiNYAP
         XiyOCYK9MXKTl9g3QErBU40ESzdxGF3bHJ8ZR7twHNtGbj7FZIjuQVG3biUuCZua/9yr
         Tr5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A06Whdck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gd22-20020a05622a5c1600b003a81bb6a1c4si17244978qtb.406.2023.01.16.04.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 04:25:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A06Whdck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHOXe-0005Qa-Ao; Mon, 16 Jan 2023 07:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOXZ-0005Po-Pt
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 07:24:42 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOXY-000243-C2
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 07:24:41 -0500
Received: by mail-wr1-x434.google.com with SMTP id r9so4517708wrw.4
 for <qemu-arm@nongnu.org>; Mon, 16 Jan 2023 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=owx1GxvX7pABOn7kTA/4Lyl/4LpONf/KJwRoErEfOAs=;
 b=A06Whdck4D2qZzFsypsWNg39LRfLMBQ02SIJvhXRSfLJw+mFkNdZJ0scEOw/4gBwJa
 uFSiThfWH0XXHYftDALH0AvYJeWqjHQDlQeZnuggREDnhWpTCahfbnfx18ohjoZxvfYq
 y+lHyhjM6r4Cv6vJQSUxsF3E898joohAA4owxZQGv6S8Jzi/1McnHBXWcCKny6rsV73L
 UV/KexbZQ4elfG4v/1d/+kUXuv8HA5nWSC+y5cr3cz+38RFkgt7yLV3F+OwWXCOJaVJx
 UFlaxF5SGmU5lmmKqkEc89LomcuHTf7HPd4D7zyMM+Tp9ozREEo20N7it6a/PToLmR0+
 BZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=owx1GxvX7pABOn7kTA/4Lyl/4LpONf/KJwRoErEfOAs=;
 b=AH/sC6wVZ2rdynvW0ndLt9if5dHwhujCGa6mJj1CQu/+ob+6JQ8WwB6FLdAOt7AWgM
 8Wkn8aTHCNvDZ1ae0oVDTSaWKpg0fji+zUHtqajLbiUcZotwFuXr+WhBas5NtvcGV+Ga
 6ocJnqr7RyT/o1d65VzDsvghtmC2YplaSbpGCjm4G0G2bc1P8bSn8BndgRSetSDQ41qB
 +GmtFGF+tujfWOHxjY3D8ZHMxxzKdNDRZJMwutLisW72kzmQtOvLNBmYv37BVJJ3D2Un
 7kJJ9fKvBXbgZjNPHr7dqarNFB+Etu4+KC0N83o7J+4LsygJo2BZaOP56EQ7UyFUncj3
 YE6w==
X-Gm-Message-State: AFqh2kocSjKD/Oq/MzxJSzXvQatcihxqI0aN0rGpbei2LCzHsFhEKpN7
 EZcNKi7NmL1eHpf7Lfzwp8y+Rg==
X-Received: by 2002:adf:ebc1:0:b0:2bd:d34e:534c with SMTP id
 v1-20020adfebc1000000b002bdd34e534cmr10912704wrn.36.1673871878200; 
 Mon, 16 Jan 2023 04:24:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b002be099f78c0sm1829269wri.69.2023.01.16.04.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:24:37 -0800 (PST)
Message-ID: <a11752e3-b777-649d-9dae-bb4816029d99@linaro.org>
Date: Mon, 16 Jan 2023 13:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] hw/arm/aspeed: Remove local copy of at24c_eeprom_init
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-3-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114170151.87833-3-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: A+ajSgnxopEe

On 14/1/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/aspeed.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)

> -static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> -{
> -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev = DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> -}

Why not squash in previous commit as 'extract helper' change?

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


