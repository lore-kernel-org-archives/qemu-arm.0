Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1341293dlb;
        Thu, 9 Jan 2025 03:44:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbjR/kD7YB95/xgr94EAvIBqlrqimGrqE7SjM+07NyOgLzezog/oBHQTBwt5pbhPwEFI+eFvK4Vs83SQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGYSiqGEgK1nmif1mO5813BqRQxy0YD/jhGzQfVFqUJWUjpozDKA9KZEWbJDhVE+gA2i7Qq
X-Received: by 2002:a05:620a:198a:b0:7b6:dd7a:9709 with SMTP id af79cd13be357-7bcd97a2805mr1103216585a.36.1736423096277;
        Thu, 09 Jan 2025 03:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736423096; cv=none;
        d=google.com; s=arc-20240605;
        b=IDeKqAnocQeAijVhQ46NPDhYeYDzcKkoZkDk6AkkWNuaSjyTZsN9Dzlt+Js9q7onFa
         oNTq8LYGaOvOAsi7xcZ0/G2HBJduNmBI/A2XzfDuPjnMHz7JqON3IiqQDUsW5Q45f6uG
         NuRv+PE5lu1OZ8cD6WCoR0cPYUE9Mv2QvMDCLfbhfAJSTk49V5EAUpvNYfowCGDEajoR
         C+Ol0PR0LXoJOeuEdUwUWXWGM+6FJ2y8jXWB0Ty3/d1gPqRgCyuQLK5TSSLdUvop4dyC
         E2t6NjB/91Rl5/tVbFbdxz9Le5yM5TZjx3AKlm4sD1rs3qhBfLG/MXVC4fmHWrruP4fH
         7MAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1dPTeGJrbX9baIFiTLk3WzwlPQ1HlrZdbxq7RBAH93g=;
        fh=OV2gnJ3gUMexX31eA272aYvT/ii2Jm6GnX+zd1Ra5kA=;
        b=iuZnZd6kO4mGKOsjLEGmv4qjC0O1oYhk4QI9XTWYqWw2r+Cq/7mULv55xeMGmS33KL
         j6B04dy4Y57T1m0MxDnI88PLdxjZ8F9uLDPdgdKK+otTcwv86Ukinru5mROqDQRZr/3B
         myXFwxvotFOaCj7Uo+gFxUje4xSHj7ghK7rTVzExThCl6Sd7pDGdTHx99GK9NVwGEMyP
         /OXn3/T61sdpsuQeA3yS5QZA6LhPGFeQxRc0lpk0juMcGwNoD0MOekqWWy+GqXnpfOjS
         BtuxFA0SKCccv774izsl7vQ0kA/XIx8KL51l9F3qgCoGE/v4cS1s437utDRLjpazhclX
         HqiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTy7MYSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce350c178si143615485a.633.2025.01.09.03.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 03:44:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTy7MYSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVqxn-00062s-GN; Thu, 09 Jan 2025 06:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVqxc-00060o-CQ
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 06:44:25 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVqxa-0000Zv-1a
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 06:44:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38637614567so408149f8f.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 03:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736423060; x=1737027860; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1dPTeGJrbX9baIFiTLk3WzwlPQ1HlrZdbxq7RBAH93g=;
 b=CTy7MYShEhZyJ+p2mrqr2rIW8v7Pmj4Av9ixJ9VstcOXTbJVe6GSlzxLSS5E8dAdgJ
 +Rr9Y5qs/3SCEiE2haGxaf/uAxzyxbZc/vXoO7N5CLbGbunW5nmuvoOROTlWd1mELppv
 VPScD+pTdV1vspzPS5eUMnCrINtspfcWhMKbxRe7m8T9EpAlU2D+3gsVCcTgoSAyIptQ
 lprec1S9YmEIg8K5Dluq3BS+TQqY8nRjILWLKX2QqzVTrdxe28Yfx2UQJhYlyA0DMQ07
 hz/0rtmaUTv5ppOE9TQ+xHbtBLgB+BafqkjDDsLi214F9rr2JHRG1L4XQg+T8kfOsrQt
 GfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736423060; x=1737027860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1dPTeGJrbX9baIFiTLk3WzwlPQ1HlrZdbxq7RBAH93g=;
 b=CubkA1Xl0/DHaEqezyOCxOM5m0a72fT5WLJu9sLL7cai8P/Fc/mXWonsputhPYdGwZ
 yCiANTHSG+4BUY8WpCKZ+NUVC79FkyM4CIeJO/L8NylrOul1YvNfS7VcpITWm/EYTG1K
 NhzIThVxuNqmN6N9DyKyMp67MPhBliIE6G/jY4IwppLvmXUEoqf0x8ekyEMrLU2/ffie
 U8BPfu1fpsNv6c5zyrCSXP0oB039nlyO0POiXfmtEQhWzN+mjVg/NQQGFDN44mxtJnae
 Vjn5HdsoM4FPgXS0mQWCX1nJWnkX6TeE8t4o9Y8PFcbpRg4Dtupc4p5fEU3EAIw3UqSN
 bH9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlgd1cPEnfaYoFcvh9k30wmxK5EyWo0J2iZ17yEM0z3SiBgcbnSYnKQEKBOkSn3YYgJwadxcs9rw==@nongnu.org
X-Gm-Message-State: AOJu0YzPjMeq3UVJTalI297jJqYSFbgzXCT//vMRZpJDRJKa8PmEBZ9a
 vTAKosx+mWUC8aavCkXBMFR+f4AFp1lW+UPaqbDuJ7WnXy91fkHNPGFyxH5Urjc=
X-Gm-Gg: ASbGncvkP6BVxqRJOsunOWNVf+r5I3HtbxcyXf7vH3c91k3slpJa4F+rrqdw1HCFfm+
 SPUOyeeoWdjQrEKg6RVX4JI4NjQb0Sj42ixR28LWTP4mNXvonPhRURLZKtMEf0B6kCVE4aX4oGK
 i+gkczca0U3u8PkyRSmTeOBJ/peD6U3V/HhxBdz+N8HX53sgPz1Mb4YiXIjjxRPLX44G6sYefAM
 hbYwdNTrTcBB4FhkQVvJ2iB5WaHOMOFVI37nLwP5ZFZyWH3R3cXwtc+xqTciRMFg9y9Vy1YCFJ/
 5vTjixqSGpQNh3DYU0Nj+gmy
X-Received: by 2002:a05:6000:156b:b0:38a:8d4c:aad3 with SMTP id
 ffacd0b85a97d-38a8d4cac18mr1575841f8f.18.1736423060288; 
 Thu, 09 Jan 2025 03:44:20 -0800 (PST)
Received: from [192.168.69.102] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03f49sm18017905e9.19.2025.01.09.03.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:44:19 -0800 (PST)
Message-ID: <5af52807-4e08-419e-bc61-93c5823c3297@linaro.org>
Date: Thu, 9 Jan 2025 12:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] hw/misc/imx6_src: Convert DPRINTF() to trace events
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-14-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250108092538.11474-14-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-TUID: Uc/hckyM8pCl

On 8/1/25 10:25, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/misc/imx6_src.c   | 23 +++++------------------
>   hw/misc/trace-events |  6 ++++++
>   2 files changed, 11 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
