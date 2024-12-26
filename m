Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5905496njk;
        Thu, 26 Dec 2024 10:15:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVkOq21EOaIE6Ku7wp8G3BU0VWkAKqLRAYjVtmXU/LYzS9xdQdhTdIvoFI2wMc9zYKTVILV9xZrCh1/Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IGhlwmb6rQi0TxoHRGyc5XXYjewGlzccpw+DXBpthBUi2gMoPznyDAHuFjchXiSUKdIMIec
X-Received: by 2002:a05:6122:8c0c:b0:518:9582:db90 with SMTP id 71dfb90a1353d-51b75d6fb20mr18172453e0c.11.1735236934461;
        Thu, 26 Dec 2024 10:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735236934; cv=none;
        d=google.com; s=arc-20240605;
        b=KH1lyT0Pdhgt3BZpxzcXB8JHUe7WY31B0/xpU+YS/TqMFSXyn0CdAQJQnJz5EM5ea0
         zRQVcyCpLZbs1J7dfHgBjcsDM6x/Ne35NydmSvHJduLVMfUl6Hb88Z2bN0NylZVUWuwX
         adVI9fqruxEYzAqkw5WRwPKOE8hiqWtVc15xVutwSzX/0cYEmxHQkvZ/I0+08L94iC5v
         VNhojB5m3iOJWw7W4F62YwmM8AU/7OSDWHgkALJgNRxu2ETEfvj1LNRe/l3B1kLFycVT
         UO9Q9ZUWvqwZcSyn6O2GGAFFLRSMtR+4ayAr0cxYHmxyoDgyrldM18eJZAoBqVr5L1NX
         lvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=yZxcQV/uJ1VCGNHwpU/aUUMEKkIOqwamSiGVpPx0Y/k=;
        fh=XrFIUC6645Aw9AhmpCzTtpgbE41B6bPRQYLgvT1UiPo=;
        b=Z5/GlbToHV4zp8jv0HtljalBZMHFlAv8YERP+F/fuMNRmLIpXOP2R3hgDL/kWnAnfm
         6GdDv3ZvKN8n6wo0NpAC4a0isfiHOBasOKmwP+LnPlULYpwQioXpRZTgOoEp1t4Xi/ZB
         Eh+WEcoiKyRAsivjpx1b/6P/4Fg/KEOFo/98161oDQVqZwV+sIEBdqANBNVrlV/76H4j
         15QpEoerkXRpumcLHNEe+n14ocKMgEriEtzCAN/4RyVLmAoRp7tLapqAxyCwFJfTaeBT
         P8lyLM5CwlLh0AOE+/12rVepUTF4SSzsaekgCfiV19Hs997qpbmefxbbaNxACWHowupx
         bc0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCU9mGXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51b68b84446si5791409e0c.23.2024.12.26.10.15.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 10:15:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCU9mGXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQsNz-0001vt-Pw; Thu, 26 Dec 2024 13:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tQsNy-0001uq-BK
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 13:15:02 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tQsNw-0008FJ-Nq
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 13:15:02 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2f4448bf96fso6055982a91.0
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 10:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735236899; x=1735841699; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yZxcQV/uJ1VCGNHwpU/aUUMEKkIOqwamSiGVpPx0Y/k=;
 b=pCU9mGXJ9spjpnIomRX4h2RcdtL6PbCKYVIu1mSX7Pw3++OnR6dPP/xBmD7zZ2XqqB
 E9/GtKmwMUVS9fNPObi7AtHh/lvBMWxdWSlHPGBj82WrnyNIrU1bjV6f4ByTlrk9MYmi
 ewQ/iPYrGD2Tk9XLZDRvZPXaXvF3SQQGSkh1Q68tZ5aYtA1SjYde+RygfjU7Xt3QQjai
 Y+DPXi5TlEA9FOTDjvvZNXiuerjS0JC92rnJl6KN7nvgMrDsroOW9upNYevRXZogIW5j
 Cz4S47TydiCDuhcyMwQ5nLPxs2AboKfuXkK61xQb1lZcd8qzRqCflVPEur2ooMNI5M5u
 ggDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735236899; x=1735841699;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yZxcQV/uJ1VCGNHwpU/aUUMEKkIOqwamSiGVpPx0Y/k=;
 b=FlyYJdLq5hTCko3c1sZX+Ghmze5TNe8+dKxgvaSloBUTaPs/1k9gDK7zZHNaUlT3FB
 lx9X6DNK5IiGWMhhvQ3ycXkuWWCCN07xgRSuqVZJrfoSJf39Vi1IPxsDBoBPbzMeIuSL
 rdsRA8scZaJSogzD5qvwOee+EQzM4oXhw3gZim8+5XbsUvcAKncIxmJkDwnjoi4BATAF
 FGw4dXtlpVrPyRJ26byY1sMGjkXr0nrScwURclA6yS2wpmwwTR56TX/9lHzBrhFDPl1c
 m8fP8N+cIZ9a6FyaxM6tV00YDvGq5T3cx6V2K5n9AG0TZBUpM3eZfNLW2hiVK2KHu4b1
 Bxqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrHSYAVEQJs2TOQZRxh0asLz9ucZPH6H1kjQNZs4a2/2EK6w80PKSUl914GM83HWrZKxL2d2A2uA==@nongnu.org
X-Gm-Message-State: AOJu0YyZiGU4WlSvrVMJGMvnlcBfvt9/IBLGQmZDkLT+e9Htw0SZiHTD
 7oG1neCJzYB3rSh1mhk1sCYSnLAa2Rca0ksIJIHBUfAycNJJ7IL8I8HHeoW3Xis=
X-Gm-Gg: ASbGncuE8dAO8ArTUKgI/VBn9gwCn2CQt2r65dnHW7OWReVhXB6xV/hGPfYHWpjVWOn
 gX+PQcOAvHhBQLSD/AKHanBBybr4eLdGwHjoAieYRrx5n6xYnzxRrnvl022vxj7C2RyngdDinIz
 +HbCJSPYOlU9XuT0oZJR6Lk1CPAj0MXIiNqQmXVrCJ53ZGG7lvkbRa0iuPZ4pH86d6DG2dgXlyn
 sM9AOM3mU97jkYQf0OJVf25KoAHawtfTCFdcwsOB8bDELSU6jkdgDGhfHQGtPvBGzndXRY9/xwQ
 UUpbOtKrX5h9GQSBsdSgGs3GFqrV266ip3rEmrA=
X-Received: by 2002:a17:90b:53c7:b0:2ee:b2e6:4275 with SMTP id
 98e67ed59e1d1-2f452ee7147mr30001370a91.26.1735236898755; 
 Thu, 26 Dec 2024 10:14:58 -0800 (PST)
Received: from [192.168.125.227] (syn-156-019-246-023.biz.spectrum.com.
 [156.19.246.23]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed644846sm17755604a91.28.2024.12.26.10.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Dec 2024 10:14:58 -0800 (PST)
Message-ID: <e6843d5d-4b49-4737-b950-650cefa034e3@linaro.org>
Date: Thu, 26 Dec 2024 10:14:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw: cast 1 to 1ULL
To: Tigran Sogomonian <tsogomonian@astralinux.ru>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
References: <20241226095815.15377-1-tsogomonian@astralinux.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241226095815.15377-1-tsogomonian@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: gpo7WKif4g78

On 12/26/24 01:58, Tigran Sogomonian wrote:
> To prevent integer overflow it is worth casting 1 to 1ULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
> ---
>   hw/misc/mps2-fpgaio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
> index d07568248d..297cb1b602 100644
> --- a/hw/misc/mps2-fpgaio.c
> +++ b/hw/misc/mps2-fpgaio.c
> @@ -198,7 +198,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
>   
>               s->led0 = value & MAKE_64BIT_MASK(0, s->num_leds);
>               for (i = 0; i < s->num_leds; i++) {
> -                led_set_state(s->led[i], value & (1 << i));
> +                led_set_state(s->led[i], value & (1ULL << i));
>               }
>           }
>           break;

s->num_leds is bounded by MPS2FPGAIO_MAX_LEDS, which is 32.
There is no possible integer overflow here.

Please give more than a cursory look at the code.


r~
