Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2007092njc;
        Mon, 4 Nov 2024 02:28:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWykEFly8OmoHKv1LVXNo9JrMRUlZ1gc32WB3VrltR9bWjOragj2A83Wfro8ictcgg80kWh5Xwxzz3+qw==@linaro.org
X-Google-Smtp-Source: AGHT+IFEiu00sadf3LEbzx5MfodVI25g6dNn1EjKkW6/FJkqQR5VomomxUv5gF6P6qrsMpig0Mi/
X-Received: by 2002:a05:6902:18c6:b0:e30:dfdb:19a6 with SMTP id 3f1490d57ef6-e30dfdb1a6fmr15616196276.38.1730716131519;
        Mon, 04 Nov 2024 02:28:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730716131; cv=none;
        d=google.com; s=arc-20240605;
        b=UAGZwNYBujpm6rSGA3NxQi0HEiuMIr8SNoGAMuSOvT6NjCBvhHI6Ch4/yP3Ci5J6sb
         mWkNpq/a9DkyeHnzozCoI/VB7Z1+2p90LjXQvbgd04VyPKQEyYYnYnOXDCsiFsQInEaf
         O3FoaS5vjqGfv+ihVEKh+9lahdYteBrDqUP2L/ME+XhIBrZzMtzYLU0boHhL6A7cQl2I
         3lIxMrZjhITxHMqy7IWHClPDEPN0AR62tDQ1Elw6s9boLM9Oth7xbWVYv4CIDEm2xIm4
         Q3GaNzPi7ydz9GVRRYUliaGmbgLm9LI3OrNzeZBjRBkpA010UwZRTgD65zFWM1+EiSen
         fM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HL1wmtLlw10jUIRW5AvDG7H4j+TXTlub5SE0NycX1iU=;
        fh=k2Jhu0jITknvxMxr7RKJoBkjR+kyin+imTMIf2bL2EU=;
        b=CKrPwyGqi7WD+f8am0j3C7aC669Kna39F1XJ7hD7di6E1axG8oM8PfffZFNAfZYPJl
         6SSZZJvMNzp+o7nE7cJoWZWIjJ/ijkqpGW190IobLXMNc1M1sYztFA1OM7g85Q0JhxCv
         k3kOuhZH6+wtz374BIYj2Vh+wNLvepkJKhpLXtMX2u2r5pzzFBNrdbVRc+Mcv9xXDoGH
         E3fGCzorAYpYyJ9NvXp3SpRlhWGdh4s/Y/7igPUIeZxIUSKNhgbaMr2eHCgZcPptRUEE
         NMsJ1AFKvE3sJcd5/86JwRdGBrfOE17RhbokDPH2RlZ7zRQeeJvQ30EMxycUJ/uAif6O
         edCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g7citQF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b1d57si102830391cf.150.2024.11.04.02.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:28:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g7citQF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7uJz-0003Gf-Uq; Mon, 04 Nov 2024 05:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uJy-0003GM-Ki
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:28:30 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uJw-0000Mt-1T
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:28:30 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539f72c913aso6456306e87.1
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 02:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730716105; x=1731320905; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HL1wmtLlw10jUIRW5AvDG7H4j+TXTlub5SE0NycX1iU=;
 b=g7citQF3Rdaib8BRZz/ooKaV8lSQjnzcdYtJ4w+STT+j43jcrM+W5uClkB5RfrUmJy
 IdtvkZmUbHEykxLL9vQJOCQdAsKACP+a9hoWh1IkLMmfrOoTDnqOiRm2TEfM5Flc05Pr
 I54KcBNN1jYiXqInqoIwWY8Wl4nk611e+9iyQ8xJ75WwkHNkaRNGNs6WgemMZcSW4w9f
 Sw9Ptw1/YEIavc9f9JOeaEkhPvHqh7qN6vPYLg+KCPzgR9yapFC5ScUc1O3gp74Lsz2P
 0sd9g1B49cvJrd+achNa76bUUkzNJ5rWqXGVMNrh9g5tAs/nX+I+0hAtQ4s7u8guSVa9
 PRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730716105; x=1731320905;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HL1wmtLlw10jUIRW5AvDG7H4j+TXTlub5SE0NycX1iU=;
 b=q13nsYEyOT77+KLZPfMrvRG+RiUpowlD+J/wADo0jT37HP+j4VB2qBoL0ukkZeTB2S
 LfwvQJWDvQSBykX9Qm6kgJLOBv0nl9aDqmOnTfY1/2oMIrZLpMaRshgT0Z20cRPhpZsy
 8lXEwBkQEOBwiByxFZ4m/Ym+xG+OxeAdLJ1WAXKuK8gZzRsNREFifroXsgE4mIRV5phO
 jn+0FmbK8eUyVw7mGNMRmbYwm1Bb3ge6k2d/GXLZdEYJbgE02BwLcdopWxY1caHcM2xo
 8K0+t1cEaZaBoYW0K/cUXn3pJ32vWYyJdOtgkgXGutzREd64UuH82aNasZzSs5tlO/Mw
 BRhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRuPZr4GQg+BW21xu4eQ2G5mJgnZw2LFUx8bJLTTLHzzH/kYsvS/CxzxbFzcwAqdewsFrPBH7ruA==@nongnu.org
X-Gm-Message-State: AOJu0YxDnBd+4VDavxYPw0gYuWuweICAIMBFm7Q6FR5VUzR0KTdWwDlp
 yZDvs5hjC+WLQUpy4ZI5OgPsPZU+fGA6dGd9bXUsK5Uh7ORQp9AuVX+wTO6LlHI=
X-Received: by 2002:a05:6512:3d94:b0:539:f754:ae15 with SMTP id
 2adb3069b0e04-53b34a1908emr18098991e87.41.1730716105100; 
 Mon, 04 Nov 2024 02:28:25 -0800 (PST)
Received: from [192.168.69.126] ([176.176.145.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d6852e4sm147290475e9.29.2024.11.04.02.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 02:28:24 -0800 (PST)
Message-ID: <11a071cf-1006-4945-ab2e-38a18ff8ab19@linaro.org>
Date: Mon, 4 Nov 2024 11:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] hw/sd/aspeed_sdhci: Introduce Capabilities
 Register 2 for SD slot 0 and 1
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
 <20241029091729.3317512-7-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241029091729.3317512-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: B5kqO+ph84g1

On 29/10/24 06:17, Jamin Lin wrote:
> The size of SDHCI capabilities register is 64bits, so introduces new
> Capabilities Register 2 for SD slot 0 (0x144) and SD slot1 (0x244).
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/sd/aspeed_sdhci.c | 40 +++++++++++++++++++++++++++++-----------
>   1 file changed, 29 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

