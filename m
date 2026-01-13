Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F56D2D0FD
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 14:02:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfeyE-0008AO-SM; Tue, 13 Jan 2026 09:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vfewg-0006QD-6v
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 09:00:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vfewe-0001Ch-IE
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 09:00:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so5384378f8f.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 06:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768312827; x=1768917627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Zac00euugjIftyT7AIVVB1b7PyfaqNBS3tcrkWDujE=;
 b=y/krsT8JRt+kgXHMepb5mVcmn74uV4K2wi3wBhX0rjO9/BygDNVmzWjXpkgeIrFkUm
 qkPzvzd4xwL71o7ZHbEoUwJJCAG0J1okR1K/UwSgxHhsBHpL6TsB8g9vh5VBiCZRhRa+
 /YN2JBiQU3AMZlk6a1Dy/ItLeSfNZDW+vrOT1aauGywisbTDBfI8FB8+7hQM/Ha4rjeM
 clz01KFde8WGPkkT1z6cccbOxNVuIZuJoGLfthX23/ObqofwthZoFXFnPujIVjzc/vYQ
 jvB9gI2SYNPpthMW2/Vepi8x0EWXPH4SShNZPTB+MjC5tLyQ2Du39nX+U/fYVZqetgDt
 dxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768312827; x=1768917627;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Zac00euugjIftyT7AIVVB1b7PyfaqNBS3tcrkWDujE=;
 b=FqIkpGMR4XZVUhtZO2MWeJBkKFOLapXxfO5ygGaj3wcQtnfopAxxNAnQKVt3PC8dqr
 bz+GP07Oo8GX+gD3kcz74rTG+hcixtYKAzZwvUY5NFZzVZ5qoReC+5x4M8ekKDUB6VdA
 YSBeX03MURqZEZNFQy+mEr/Evb0fWH2gDc2aGLKvHDfd5jK7Xdia8FaDJlk8okT1g1aT
 9xyVlflahGpHo240qM9dJ8DTvzFwm6iTDspXcmmVaG+uUhJVFkZyIppG28Xxfn/O9sfx
 W5RvMHY23p3JJC6jkUyaFl2CHudmSfKoyAHES/tdpvC0I0LBusUQNuXInDnKIGAfU4pY
 13Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVli4g2/uficlXhIH0hO8TbO2NbmOh/3Ck6m1nOu7rMBncQVPkfZSBpOOc4WdWEKboc1iCe3hMyw==@nongnu.org
X-Gm-Message-State: AOJu0YzS/ZvELjA4nJhCZcRvkhGzquUOWRX7sZA+9UHYMzEnTtyoURc4
 /z4cJXnNCPDafxGa1fZnIsVpIGXYBW/OMHec67ksKjigNA2UTuEuD5qR6oHW9N1JixI=
X-Gm-Gg: AY/fxX6hM5b0KNZ8qC9UzjBomXmgXTYpHMYWi8GnIfumntBUC0RYlhFIrvWGbTcM72n
 M74lRo8k//PKg/vSBnbenDIWpCInh9e9lSLc1ZHxmP3W/w4EMTjz75PEdJVv3CccM91G+yRKsC1
 RZbtkK1fXjyX9+BMZMHsM53XfXX3vmTxikihccdBOcrNxTeIjs93cfP3s+8vXKfQYj7Mnhf+baS
 +Z4c24Moe634RHLXl1R5B78L7ZcaYzE0kyMuM+QQI7WbHlrnaCINBmHCsRt1YpRVZbmh773E9aX
 enfFr5ZZxy4jKDFbneCVJtH/mk6nZGL/P3RTkb65rHZ9GhWc+cmo2Y5GcSXOPzJdESN/k4qz7iq
 LAPt4eh/IFgvJ3i7t4KykacEo/t0kZC3Lk3kxSxJaCwPB5znT3O9B313ID1E1uVaylY5ilC7hGa
 sy5RQBJROHwso9SQrU1Nz+CA==
X-Google-Smtp-Source: AGHT+IFjYYBwq43MslnARq043/5r3kfg4K3nsGx1cQwDKi40tlDkO9QL60vpnkPn+oV1n+kQAQQDzA==
X-Received: by 2002:a05:6000:420c:b0:42f:bad7:af76 with SMTP id
 ffacd0b85a97d-432c3775a39mr28025812f8f.15.1768312827019; 
 Tue, 13 Jan 2026 06:00:27 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df96asm43589627f8f.28.2026.01.13.06.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 06:00:26 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AB40A5F805;
 Tue, 13 Jan 2026 14:00:25 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: <qemu-devel@nongnu.org>,  Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,  Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Joel Stanley <joel@jms.id.au>,  "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] tests/functional: migrate aspeed_rainier image
In-Reply-To: <1c0e0499-97a7-4b3a-a116-a7c781d23a5b@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Tue, 13 Jan 2026 14:15:45 +0100")
References: <20260113115138.3171479-1-alex.bennee@linaro.org>
 <1c0e0499-97a7-4b3a-a116-a7c781d23a5b@kaod.org>
User-Agent: mu4e 1.12.15-pre1; emacs 30.1
Date: Tue, 13 Jan 2026 14:00:25 +0000
Message-ID: <87jyxlk3ye.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 1/13/26 12:51, Alex Benn=C3=A9e wrote:
>> fileserver.linaro.org is going away, migrate to the new share server.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/functional/arm/test_aspeed_rainier.py | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>> diff --git a/tests/functional/arm/test_aspeed_rainier.py
>> b/tests/functional/arm/test_aspeed_rainier.py
>> index 602d6194ac8..025e5751dc7 100755
>> --- a/tests/functional/arm/test_aspeed_rainier.py
>> +++ b/tests/functional/arm/test_aspeed_rainier.py
>> @@ -9,10 +9,8 @@
>>     class RainierMachine(AspeedTest):
>>   -    ASSET_RAINIER_EMMC =3D Asset(
>> -        ('https://fileserver.linaro.org/s/B6pJTwWEkzSDi36/download/'
>> -         'mmc-p10bmc-20240617.qcow2'),
>> -        'd523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd9=
0b')
>> +    ASSET_RAINIER_EMMC =3D Asset('https://share.linaro.org/downloadFile=
?id=3DPaCHfyerwpSr0CV',
>> +                               'd523fb478d2b84d5adc5658d08502bc64b14869=
55683814f89c6137518acd90b')
>>         def test_arm_aspeed_emmc_boot(self):
>>           self.set_machine('rainier-bmc')
>
> An alternate location is :
>
>   https://kaod.org/qemu/aspeed/rainier/mmc-p10bmc-20240617.qcow2

As that keeps the filename as Peter asked for I have sent v2:

  20260113135941.3361163-1-alex.bennee@linaro.org

>
> It is backed by OVH in Europe.
>
> Thanks,
>
> C.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

