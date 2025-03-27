Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp4124951njc;
        Thu, 27 Mar 2025 09:19:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAiKieYYsMZLhHff+wtAJSIE3dcgWWieZ4c7Qgz6b/FscK/5xL7CDiPQCjKqFZSnswbieuwYQ0XIH2Mg==@linaro.org
X-Google-Smtp-Source: AGHT+IEnXfz7ZPzAfGjnmOhobauPRtv9SI2Xoy9OxzDB23ZR4JWs4UQ20mrOJkFAg7QyfD8cGJgO
X-Received: by 2002:a05:620a:29d0:b0:7c5:a424:1f67 with SMTP id af79cd13be357-7c5eda0e587mr594396185a.29.1743092398655;
        Thu, 27 Mar 2025 09:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743092398; cv=none;
        d=google.com; s=arc-20240605;
        b=FQmSTL42L1QjnE5n0/F213aLdOAL6tHavzSgkNgy//jmORqXsLpNKHEyxrAKXQHlNt
         WkGtkHcj0zXVCRIOgwjhslNWuXhfhYV0FuLXl+kT+8zXSwlYI8uTu4cL0zZpC1dETvjY
         HOQIpnHA6sPvgIO4PNCrryR7eOKgGHT6YfT1jyQYQkRI+uDiA+cTvFcj+SSSTBi6ZzzF
         HYhofOFjRLKm2z00fufSQmBm1EDcQ6kENP9vC8tg2khqkO8JPwKSmLezA8X0yfYxvdCa
         wVJHfo+b5nbp1ML+3BLIumtkvkMwu/hdk8f027VB7w9nWkx2L/k4yMLzpOWlexFRCFQP
         QuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=37UGgZRLaje1C1bfuPmce5xftJXysUTQzfk1dmd5uEA=;
        fh=rDatvgtbdRxc3ATmVYT08HshDgnez6q5p8pdwPTRc3c=;
        b=L7hIVZaX25nzaEK+LUe1qVH19rnYt6i2RBX67H/BJl3rYcn1+58OEwMO9P+vZ8qfgq
         kAYM3loyDgNwWGFxCn4h3XXBqTQan6oR7jCKuBfUDQ97QaeJLZ1bLj42+m8nMdV9hj4M
         o4NI3Kms0nfsgFhgKr8xOIfM5hGnalA0bi5YuRkFT3qPg8XM1q3J+WvTofaaPQFXjbT7
         XJb8Vhgwu+vM0fsY9KbDzAMA3lZWGJmp1UWAPbMZhPkCc1xEu42lB49qQAcTzlONVrfb
         2T5M7H761KBFa5qxMO2mZ6IH8qb6FyNNZk7iKq4z5hTt10KKeKet5A8m9SS1OwirlHG+
         qKig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eQ6mrWqF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f776db5csi13129285a.324.2025.03.27.09.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 09:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eQ6mrWqF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txpxE-0000Bm-6C; Thu, 27 Mar 2025 12:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txpxC-0000BI-LF
 for qemu-arm@nongnu.org; Thu, 27 Mar 2025 12:19:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txpx9-0003Pk-PA
 for qemu-arm@nongnu.org; Thu, 27 Mar 2025 12:19:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso769724f8f.1
 for <qemu-arm@nongnu.org>; Thu, 27 Mar 2025 09:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743092373; x=1743697173; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=37UGgZRLaje1C1bfuPmce5xftJXysUTQzfk1dmd5uEA=;
 b=eQ6mrWqFDFgH1STHx4XPVfv9v37epiKNDRDMbIMsC3uHIFmsr/+Ee+TZHXczwxghFM
 TmXIGS6Ag6iQ7w8ReTjxCn2H+/Kxcqa5JnGBTm5RMbX8jUepJ6EAiWiA7FobidzoRq7l
 cfBaj+luH2kzvF5Vqn8hOHl6hz5U2P7ijHAL2DL8fYbb++RCgAsYHTli9suc5Bp6CDb4
 bHh8qMovAjeAHn+Urrvs90qk7yzHHNM88Q2xJwR/ZjLCKWmPimVXNI8ujhN8h1CKp882
 TbB7bVnxOtx+r7D/j+794h8oqNlzIVd3jPIOlW4y1e3qRXBiZWy3jwuwYSWuw30/jz3F
 xZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743092373; x=1743697173;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37UGgZRLaje1C1bfuPmce5xftJXysUTQzfk1dmd5uEA=;
 b=gzFgJmwmRgHgEu2yiUPa7+fvIVkXcy/NOxzEfQ2g5xpya7pQUbS9MkZmsv1I7RZOhm
 EvtTvMJgzW0wPZ8VQgZLblX2vhwqmCUQrZWqwymGyAEf1gESGXWLZzzcprZHFM6ziCDw
 oUupyK+sW/Gf9wSRYgK9XVzLEFUascOwWl9ygY4nf0kAxoeKr8Ac2Pkh5uPJWU/ZkA4a
 OW26GAMfRZEpPzBsSD4QBV/OqWJv1tblCMz2sS2mZMZ9KO2sz+cVJk7waWrUn0vicSOV
 LqyPjK3uMwuzBg4rN6/1V5b8w73GGmHy/ep1zz2GA+XJD91KRHjhmkiEk7Kpdt0rw2GI
 bZ6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjFSfeXecDO+1sTuJqBMPSdcwpI7Xi8KEjk6ix3TgI23Ny2jVbimkFX+FiFQko0UFBFFgO280Zzg==@nongnu.org
X-Gm-Message-State: AOJu0YyDEsJQo8uBPSXhrEiOjApqttdlBprOhEDmjjkOAb38HfBlB4i8
 Xrj85PaYeCsfK0tok+HKn5+jilBmaVAuT5TFtv8XZKTK2jz03v2qunSXOG+jA/0=
X-Gm-Gg: ASbGncs6sxaBcB0AehF0hcWZzoDv/3lAAp6uIYAvYdeGEjE6P3beX9XLlrszWCY1XE7
 he9PveSFqocEfs2pDRwMBIKTlh+WyOZ0pMKuvuCgimoImyKCJFRd8/74Zm+4P3akFIWWza17QIn
 gDgDSN3+IZgYndqyaCFqRvNYFuAJWwdtFX1dB6z0cg6bwGNtnCGMV7XS6o667XRcqkBhMVX264I
 0Puxg/GG4hgmbhX4IbTeTpokRZicBhwgLVeMnGEy4sUYKtTP5MkhAI/OklC964BLtrBuJbWcllf
 dmJhYuPq/JAnMy74JWE/zfbsRWiuLpexgGdZ0++Z5/t2vNCgVjG2GVa01GmpRZ9YN/7sBPTvLrH
 PYyhkRZVzTEqk
X-Received: by 2002:a5d:59a8:0:b0:391:22a9:4408 with SMTP id
 ffacd0b85a97d-39ad1749fdfmr4514037f8f.16.1743092373409; 
 Thu, 27 Mar 2025 09:19:33 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dedc88sm42627815e9.1.2025.03.27.09.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:19:32 -0700 (PDT)
Message-ID: <c794ca2f-43f7-4abd-86d0-650eb53602d4@linaro.org>
Date: Thu, 27 Mar 2025 17:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] i.MX 8M Plus EVK Fixes
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250318205709.28862-1-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250318205709.28862-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: ++cdj080c0b8


> Bernhard Beschow (3):
>    hw/arm/imx8mp-evk: Fix reference count of SoC object
>    hw/arm/fsl-imx8mp: Derive struct FslImx8mpState from
>      TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx8mp: Remove unused define

Series queued to hw-misc, thanks!
