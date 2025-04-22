Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2286537njd;
        Tue, 22 Apr 2025 04:41:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzVnqyPPVwA1693JaHKG2d9pBKh5OUeWDyzc4U5lZSW+edoT0NxsHZ6AAvhB154yQMwLVSRaS7M2R8Ww==@linaro.org
X-Google-Smtp-Source: AGHT+IHKjgqC5MaufusfEuep5KplqIpxJGDY27Uyw0LzIMoLqvMdN16YWEA8FyLhDygV0aF2nVg9
X-Received: by 2002:a05:622a:46:b0:476:c656:4e80 with SMTP id d75a77b69052e-47aec4c454emr205001991cf.34.1745322099866;
        Tue, 22 Apr 2025 04:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745322099; cv=none;
        d=google.com; s=arc-20240605;
        b=Aii2IpZ+tzuFrD3LZwMtWeIDD4xQypPsiMvWGAgVwkakp8VQlwnxz0KGyOzQEj0Ww+
         2zxZ8wGLTuzZWAcPS0vbvYGHsvybm1bcu27L6DAIiN2h5sMt485GiVA9B47PRS4BXhdR
         kZF0ihqDQOXje4MA1HKVu5iW5YxCS7SGqrlBHw/FX20WhIKVrWVgt4LZc7qbd2Qt/Rfu
         2bi04xKCuF4elnbAlL6I81rVe+LFsFiBvGhiBQMfMYNcTBYIJ9au+oALuzXR+sSGlUrb
         aeAjj/8o2FNG6RO9ocvdp+7AKdGHu3aeTO435R/HhwfKPHcxR6vVgMWBC6UWm84gyAWJ
         sj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zI20vdCU3DZBX4N2VwQ9zKRVDbYA6xrFjzmm8KOiBBk=;
        fh=q8HvfJ0g9wFlenn3NfOFdUjDJeEw1vVndzJz8kAe/FE=;
        b=ROd6WRY4VUhCjKIsX2QuPiHnVv9N9ciiKJhyeFNjjx4Vaxoux1u4S3P/yjy9BN0uSP
         8o+UVRsDvaQq3ARkC2EyFNDknQ2T+KPNXcOAsCqoT6okX+1nJ5RP6Bhkxx/fF5l4NYnj
         otqFQ4WOfCWOlFcvEgVV12gQkwVePrAmQe1jwyrNGMvXNtOD/ZN0fNklA81ZpZn8YyZf
         KbjkZIQJkCRg/im/3S23j+MDAgGlwwF8FOv90pTd6FPM751K3uNG4ZfOjZ3qnTsw8RVD
         WdS7WXrP32YB7x7gB8rlHmWkmDTQXOvrkwr5l4oRHpNuGdWxmqyKihMYOe0oWigxA7cY
         9I+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9DiUXpB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47afa104bfasi86439781cf.604.2025.04.22.04.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 04:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9DiUXpB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7C0E-0000uK-Jo; Tue, 22 Apr 2025 07:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u7C0B-0000tZ-Kr
 for qemu-arm@nongnu.org; Tue, 22 Apr 2025 07:41:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u7C09-00089o-Fb
 for qemu-arm@nongnu.org; Tue, 22 Apr 2025 07:41:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c14016868so4986635f8f.1
 for <qemu-arm@nongnu.org>; Tue, 22 Apr 2025 04:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745322079; x=1745926879; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zI20vdCU3DZBX4N2VwQ9zKRVDbYA6xrFjzmm8KOiBBk=;
 b=n9DiUXpBzFarlvPXqaTuHsfZ/0IO0EiTsgIkL6llsHVFqZ/U9kvBEViSbZ6KnCAXw6
 fteevWPPD3DzQgxW+wpsLElDFAnBWmfVOaNPU8IgGXnN31I33OIDQpqEjEI93gbKm0WD
 OPfWgznG/BuyxDaKNBl1d5OZloDBJGIeODKu91B8y6FJpBLKEYNVqLGg/9tzii7cywwJ
 G07rOqrXB6sWcMIhigpBbXfKbQQqxJw1P44DSQnM1/6Le79XS+Dw8V8o1U9riC7eAgzP
 gu6VdiYRe3FcO6VNAw5shBrgxln0NFPZFIu3NNkeNgC+KdI1T0NAdO2kJHQ3+z3AfVMx
 pbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745322079; x=1745926879;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zI20vdCU3DZBX4N2VwQ9zKRVDbYA6xrFjzmm8KOiBBk=;
 b=unx+nZNa9AnXNkKmH7QugFQ6JKn/ZSH4o5uinz/ceqrPqSN1bq3Gv+UdIGL0arMXep
 gqPJjCMWgHuFovghCUcB2Fl/jmsg4U02VKHFcTAupklrvH7WZtEocSO/NDugzFnnUx06
 kJSR+sdHfVLaPDmcurqiQCGD/Rx3UnN2JItqkOuOR8HKxzlHLEZ9bo9yQtENLXEphloI
 P1IZMjkUlLKuBKaNth78qAEXVv1UetcOiCMoMDUAcI160SU5i6F5LyvkdzhsjjxI5PoT
 kTmqvomJshGhvF7dFC35m1XDlnxfxQWXeRKpG/toj2XuvM1OEeXYO6gQMG9B6EW0rmdx
 rFSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4yCKcSij/dAXWCDg9kCaz2Tc6nYUMOqIiOyJvCHOvlydoU8WxocvlRZf4LFrvEZi0umY+AxqaMw==@nongnu.org
X-Gm-Message-State: AOJu0YwKNBb9lzR4fEhfQDE8ZcfNF/L2WGrk8xzAxnxttLzVzBKotSOE
 2hHjlX7D4dNSkv7+DkoJC6miK7muI1DV+OjtFBz5Xmwbbh3OjhE2a4hIT/neEG4=
X-Gm-Gg: ASbGncu0Mlb1zG3dnyEUfACYQfUpfKJU7rHqTGN3yAA8LI3SsVpYvnYHr+LBA6CvU/z
 9oBwSmaM7WOPeq7/7VgS6yBXwCJkcFYKNtIum5Qdp4re7FsXoXFXF4VF6yiZn0FlYsdKEQUGyYg
 6+ouV9PtrhhtBy0NkzFXBZNIbYkhqz74W9nrYRv+gnZGvZa8+gBR37y3LJdvJaGnFP2DGiXKkjn
 dbz2dNx9XkOqXaJaGSVix32lHZi5t/Sl2wMQ3vwRWoaiSdR2FL2DkDYey0yY12a+wuvDWu1MFXY
 fgnhwvkXcYpQOeN0oLl2oN10aml5zDvgBhiF+5RuRIE3d8RlXxniRx2vWEyagcMsDbhO4K7MCE3
 bsGAhcV2s8vNbGFP0qlQ=
X-Received: by 2002:a05:6000:4201:b0:391:456b:6ab7 with SMTP id
 ffacd0b85a97d-39efba5db9bmr10960878f8f.34.1745322078900; 
 Tue, 22 Apr 2025 04:41:18 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5cf313sm171554275e9.30.2025.04.22.04.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 04:41:18 -0700 (PDT)
Message-ID: <495a29ff-c87d-4a69-96ba-c3ef1d6ce3d8@linaro.org>
Date: Tue, 22 Apr 2025 13:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] tests/functional/aspeed: Update test ASPEED SDK
 v03.00 for AST1030
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250422091504.3666464-1-jamin_lin@aspeedtech.com>
 <20250422091504.3666464-4-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250422091504.3666464-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5P5SyJ+uq5cD

Hi Jamin,

On 22/4/25 11:15, Jamin Lin via wrote:
> Updated test to target SDK version v03.00.
> Removed redundant test case to simplify validation.

> Cleaned up unsupported shell commands.

Does that mean coverage is reduced?

> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/functional/test_arm_aspeed_ast1030.py | 40 ++++-----------------
>   1 file changed, 7 insertions(+), 33 deletions(-)


> @@ -49,17 +30,10 @@ def test_ast1030_zephyros_1_07(self):
>           self.wait_for_console_pattern("Booting Zephyr OS")
>           for shell_cmd in [
>                   'kernel stacks',
> -                'otp info conf',
> -                'otp info scu',
>                   'hwinfo devid',
>                   'crypto aes256_cbc_vault',
> -                'random get',
> -                'jtag JTAG1 sw_xfer high TMS',
> -                'adc ADC0 resolution 12',
> -                'adc ADC0 read 42',
> -                'adc ADC1 read 69',
> -                'i2c scan I2C_0',
> -                'i3c attach I3C_0',
> +                'jtag jtag@7e6e4100 sw_xfer high TMS',
> +                'iic scan i2c@7e7b0080',
>                   'hash test',
>                   'kernel uptime',
>                   'kernel reboot warm',

