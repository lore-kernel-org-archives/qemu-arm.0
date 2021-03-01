Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3243258lfg;
        Sun, 28 Feb 2021 20:21:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy18N08Xlu4F1MAnW4qVUI8OJOFqLwUGLZwQB0F3QO87WI1wDG6nUggntskup+//i4cICD4
X-Received: by 2002:a25:73c5:: with SMTP id o188mr20541799ybc.261.1614572477559;
        Sun, 28 Feb 2021 20:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614572477; cv=none;
        d=google.com; s=arc-20160816;
        b=PuE1DNXM2V7sQj7/REm0qKKr7/yTD9wDdRDEqTbHVdDeNYFBcZNvWz5BIyHDplvJ+W
         bFiDdHp3L6h6VVQqUvNyUYSj+70+k6fRSfjSNUbf6+MK0QrrkYEIMh4X/wIURoWK8Xu5
         C3bi1x0vVa+GyruT4ZfAmGPPS+JW8AQBi5FNlSeo6ZKKypFBmtggL0lW2CKqHwxHIHNg
         tTD2UZ4FqcyjGzrhCeozqpke9ulIHinmEzbN/7Y0jjvswf6E8zZkWSvdqAzCvk78B3jU
         5dOrJKpWBOxbhUmqfmveE33VSKxQbW6DPz3CXU0wQhcWazSqlO1OpCE+pcosIaCod8zx
         sp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oQNBZmYRf6tbno0YJw6e1dlEhetLAGlUZoz0Ct6xSKs=;
        b=kXzEmyPrkOzgoItTzpvCP8h9y/iYlfQgNpbhTDmF9xf1GOyKkWTCpJV68dN0FIFnT/
         R5iB7lIHbuSMHb9VK3Q/kpfqtI6r6XD8GVjkSiNrgGztIRbtC2O9hGFKs7GRjynJuVyM
         zCSIlqGLJJSyOQ/VmjXJ/GNgYUmVh9dKPnejnxgIGEYgLcx4kljb3vqGhVIHZMpqEo2g
         1hUdz0tw830ECIF31UkWgmn1A/ybh8jNE4ZtrgPjzb0x7db3oAkD+mIbpmRj8aZEwztU
         eEY4FdmOssipWqkOcIypikrn29OPo5fhlqaDaIQs3WAFBLVyVvBIUFyVgeX/a+z/23oo
         w+Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ni36/Y5w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si15657024ybn.267.2021.02.28.20.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 20:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ni36/Y5w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGa3Y-0008U0-Th
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 23:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGa3Q-0008TP-6S
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:21:08 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGa3M-0002iy-H8
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:21:07 -0500
Received: by mail-pj1-x102a.google.com with SMTP id e9so10864698pjj.0
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 20:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oQNBZmYRf6tbno0YJw6e1dlEhetLAGlUZoz0Ct6xSKs=;
 b=Ni36/Y5wnHtdc3EbeAGPVAGXEl0SwtLWFJy1nS+BxWP6cpAw9L5UBBwgR3mMyzsMjQ
 2StxRl8f64APVITGi9rXdt6O8QVcwlNoEGtpEKVRVHFZMEspyyxREyZNsKT8AddSdflq
 bMKvWS9PR6Ae6I6VSq7B8j4DCRNoRxbsanIjyHQ7V0o0D4uS55nAy3aEMxAj9xU2+Sh4
 /iVwuvFjdp/rjCArjHFTerxiL7xSXgBD6WeOVNR7o3Op8KyOXSE4fExaWdm1iLTarrbk
 pY9LetG1r6CoFbctYFdYcR7MJsxZnYqon+5kVbrCGLAU7H1j4D0ezfNUxgKrBW/saI3/
 mN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oQNBZmYRf6tbno0YJw6e1dlEhetLAGlUZoz0Ct6xSKs=;
 b=igCMC50WfPsRofxwlFzbHKcKe5l3p2+bPjndOMAmiNT4Yscyhu2NTmPtdUZdP79BMK
 hhs9TifFVlMzz+BdnnJM+Ul/9GtuPbjy8Q1DjXS3xnGDvRPL8OYcH4Fte6/eQ8xqA11Y
 2rrP2IF3A8rZXMezNxeE0j+nv0x68OYE3cBDoetdm3ts0T1Rioa5AECr1ex+LPSowcKa
 T5jS+SxU0GvnWFAc+MspHdPbqY7y5GAOHXccr00grOBz7pFi5o/iGZRVqKlOm40pstHs
 X/EUajYweTw0tQjSDPKuzocla+Y7Z/XRbnnBSGu3mehhKE1m7dZulaIWOKPo9zI/OhMi
 1A5Q==
X-Gm-Message-State: AOAM531F0d1hX4DBgG/9tIJt19+aOHwi3l9yVW1WjNciVsXwY2mMkqXm
 kOHx3H4WqpEtNuk/MZm3tjJyIg==
X-Received: by 2002:a17:90a:f0cf:: with SMTP id
 fa15mr15911571pjb.20.1614572463025; 
 Sun, 28 Feb 2021 20:21:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id j35sm566414pgj.45.2021.02.28.20.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:21:02 -0800 (PST)
Subject: Re: [PATCH v2 13/24] hw/arm/mps2-tz: Move device IRQ info to data
 structures
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7378f3ab-b858-8d0e-293e-3d32b6e40238@linaro.org>
Date: Sun, 28 Feb 2021 20:21:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sQJj2a5UezTi

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Move the specification of the IRQ information for the uart, ethernet,
> dma and spi devices to the data structures.  (The other devices
> handled by the PPCPortInfo structures don't have any interrupt lines
> we need to wire up.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 52 +++++++++++++++++++++++-------------------------
>   1 file changed, 25 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

