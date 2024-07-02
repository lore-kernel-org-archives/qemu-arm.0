Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1956882njm;
        Tue, 2 Jul 2024 06:13:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKfHEES2sNdZf5N6KqbNCC8M+KaHs6D4rUq/mky65LunwP3JO67bymUKNISoUlED/5tUggT+IhzzI867v1a3gT8N7Dd9v9
X-Google-Smtp-Source: AGHT+IFaJQz2OjOZAVEq7CC66ymq0hyYXGc9XCOIm96u1KNCgJgAuxNH5GqpfQrdivNY3PUpbTeQ
X-Received: by 2002:a05:6214:c2f:b0:6b5:8f73:acea with SMTP id 6a1803df08f44-6b5b70af99dmr99444796d6.25.1719926022984;
        Tue, 02 Jul 2024 06:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719926022; cv=none;
        d=google.com; s=arc-20160816;
        b=BOwbO9wBOFoMPL3/x3ZvV1P52yC2X8wH8bnjlSedsXWz55eKTyhphWvaQ6WT0EYZ1J
         ORWf1br/tNGxYbpVuwdb7ibKEj09frMLCAXmghG0x03q55AMQGK3jCTPwGMt1Ub8kK4E
         09Xsy59qg9YwocxtqfF4wEJVu1iT39O4AHw8Qy+DweXwdKtEuFqwqdgq9meNybq1CbLC
         wu/56xtSwpKqxq1fz8LgMiDxWnDbw1Gy18vur86LVAGppbZfg0aBa5XEK1EMLC32/IZG
         sEgwjHn3dK4iH3DQSp4iT9s6J+/REaWrZkXPa2l4T2pKFyCr0I7t1sY4etvk/CgdUL68
         l8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+rmne+xyIGF6fQn4FWIMhtON6Ac6PmjVIP071xB9hBs=;
        fh=fihB1LgVVp3yJ5XFFzacRo0jC8mdOVqkIdDR1nhsWmo=;
        b=QVISlFFv47uP0CEq3M/YZFXxO6USK+6X4atgplxDyPvTdge10sh/MXpRXUKvDb33AM
         h0jaLaXbS2OLNF9FMtMbex85UVI8W4COGbLuFhs5Km7BKc1eCNXdb202b9Yzzq8gLOmD
         jt16LcC7oh5NoGWGTF711zRrZQ1hGX6Nb6z6Tgt0SrR+AyxM8uv0A8to3AJNEY5YxmLs
         KtWqfYDDTyr9A/jLWgh7OKCuuP9K35Ck7KM9NcN8aSFc509VDsOwsHiKp2beUiQ2gV2s
         ZMTNnv0woUNKIsRjAyzfUZA03diRlDlXS2pkrQJir112AYk2GJnhiQ9VKtRpj0luxxia
         2s1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zk8fxBO7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e36c664si108407436d6.156.2024.07.02.06.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 06:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zk8fxBO7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOdJm-0004JI-OC; Tue, 02 Jul 2024 09:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOdJk-0004IZ-R6
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 09:13:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOdJj-0003Fw-1V
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 09:13:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35f06861ae6so2502291f8f.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719925985; x=1720530785; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+rmne+xyIGF6fQn4FWIMhtON6Ac6PmjVIP071xB9hBs=;
 b=zk8fxBO7EwvB+62CskFWvvwBFok1bf0A5oKF4oaT7L1pD4y3shhLvgM0TA8uPuj09x
 AMLsYhSVQe/44rY1svnFq2esmArnebMBSpfJLDQVSD3DFRDxlllwdt8I6tIzJfjcjkbA
 dH86n5dcJ67HfLiwxIvu3LFiuEPmTT8ZXY+bMRk1w4eSGI03KmwWhCkN9xzCzTupbUbE
 Y3M5mcJvjyEBxyb/lav3turIxyyT1G1esPT3rqFyA2iwPKtWbQ6ODo5VughjHJnfIgrP
 DuIPoVWfJW6H1a0tIVjLxM6TMykB7tyqjN11ZbkwDmdT3Q98RowmtdhFV0LsjI6vkW9p
 MmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719925985; x=1720530785;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+rmne+xyIGF6fQn4FWIMhtON6Ac6PmjVIP071xB9hBs=;
 b=T75mDhVuIMpUjIEYJqQIfkNjJHV6aNTk3c95hUzFLe6Jvq5ooG6fXDm2CzzVUoBKb6
 If/Pwp8t6TunNrpIQa+Z/FyUsW0GL/HYWgE7lk5Dd1K9mCUS7YrhvWaiCrOV9J18fZSz
 K7/p9CySPY3sTMfsOOujfDw6slPtdNJkKhkIFpIMnmd2wPtbyvrI/n0nHFnTLX7j0BeB
 23UnsL8DIw0fBSDw40mNE4yctA6AtV0VL5j4s6/5/hEdYqjYmaFF26Vk0ZDSMtNfmlvs
 X2YctFGeKLLea1KRmqY5qc1mmrYCiDX4rzzO5l8Di8VIRWjaC57mDs7CHp7dKwfDtljP
 liMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDqal0b0gQ61maHGRKmb0dz7ZRAeyg2cGiP4YTgE7YbFUJay9gI+/selE/wPfdah80yAlqbmYQJUCid8p5I3bNuMCO
X-Gm-Message-State: AOJu0Yz1qcE7PPdfT/crkWD8u4dLc3IaYUby0yFFDSX/ZQ3fvCUic9cf
 Gi8BIVtYCA7G7a1GDE8BMXVL9aFXbNuvzBsmm6DzW3nekVxlBm6qjKCLcFUJNRs=
X-Received: by 2002:a5d:5253:0:b0:367:88c2:bcfc with SMTP id
 ffacd0b85a97d-36788c2bd4dmr1127742f8f.1.1719925984974; 
 Tue, 02 Jul 2024 06:13:04 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.209.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e146bsm13174866f8f.57.2024.07.02.06.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 06:13:04 -0700 (PDT)
Message-ID: <c64e9127-8932-4ad1-abee-90d349300181@linaro.org>
Date: Tue, 2 Jul 2024 15:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/23] hw/sd/sdcard: Generate random RCA value
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shengtan Mao <stmao@google.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Bin Meng <bmeng.cn@gmail.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, qemu-block@nongnu.org
References: <20240621080554.18986-1-philmd@linaro.org>
 <20240621080554.18986-10-philmd@linaro.org>
 <37f83be9-deb5-42a1-b704-14984351d803@linaro.org>
Content-Language: en-US
In-Reply-To: <37f83be9-deb5-42a1-b704-14984351d803@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 9Nd2d2jI20Bb

On 21/6/24 11:44, Philippe Mathieu-Daudé wrote:
> On 21/6/24 10:05, Philippe Mathieu-Daudé wrote:
>> Rather than using the obscure 0x4567 magic value,
>> use a real random one.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/sd/sd.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)


> Hmm the NPCM7xx test is failing:
> 
> ▶  58/450 ERROR:../tests/qtest/npcm7xx_sdhci-test.c:101:sdwrite_read: 
> assertion failed: (!memcmp(rmsg, msg, len)) ERROR
> 
> But booting various Linux / FreeBSD guests on SD cards works,
> so I suppose the test (or TYPE_NPCM7XX_SDHCI model) need some
> rework.
> 
> $ git grep 0x4567
> tests/qtest/npcm7xx_sdhci-test.c:47:    sdhci_cmd_regs(qts, 
> NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
> tests/qtest/npcm7xx_sdhci-test.c-48- SDHC_SELECT_DESELECT_CARD);
> 
> In tests/qtest/libqos/sdhci-cmd.h:
> 
> /* CMD Reg */
> #define SDHC_SEND_RELATIVE_ADDR (3 << 8)
> #define SDHC_SELECT_DESELECT_CARD (7 << 8)
> 
> IIUC setup_sd_card():
> 
> card address is queried ...:
> 
>      sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0,
>                     SDHC_SEND_RELATIVE_ADDR);
> 
> ... but then ignored and magic 0x4567 is used instead:
> 
>      sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
>                     SDHC_SELECT_DESELECT_CARD);
> 
> OK, so this test need rework. I see the sdhci_read_cmd()
> method but it reads the SDHC_BDATA FIFO register, not sure
> this is what should be used to read the RCA from R6 command
> response.
> 
> Shengtan, Nuvoton folks, what do you think?

More than 1 week passed so I'll have a look at it myself.

Regards,

Phil.

