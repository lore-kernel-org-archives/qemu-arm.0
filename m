Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6743398lfg;
        Thu, 4 Mar 2021 17:28:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXveGEZd7apBHUAErD4087AxsvUwm1yPaOBY059hFOp3XwgQ6rm6i9iFWJQ8LB/hr4dSVe
X-Received: by 2002:a25:d943:: with SMTP id q64mr10057518ybg.508.1614907717715;
        Thu, 04 Mar 2021 17:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614907717; cv=none;
        d=google.com; s=arc-20160816;
        b=ghKkMC8qgc0obK/Gc8/qxNFYs9I4BOJZ/FtsQGPl41PgXGST+6WzZFzst5+D7R4shT
         SOP7lZR0kWqW4edILdtXPGU9JnX/DRcvPNyG0pwHXbeGedt2KsPeHRFU7gapmP+VtvPl
         MS6futfDzeavfThl7cpDvIuv5IpYHmT1ie3IJjsXraIn2DbCZo+8MC+I2jia6IoVmxWy
         xl5edS5ogB7UZM2s1pNdK4qkF/5szxHYaI/vJRvj9O19gBVvPaftc/32oIeCnlnYmjI/
         nqLVuJtKhPcJWr2CXPb41Fa9Daop/7Ho06cjHg3+vuUcdr843pEUxOU9vsSrPDsqcLuk
         O+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oS1q/xRHxmjpWz0g8w+cth4Wgn4vgSIMG/wYS75TcaA=;
        b=bEWXecx8+6uOfvBaYsJwvANagokwTLo6ZIAZrDY2PdN97rpke1le0Yf1TADWwimaPo
         b4L5Kx473lHw+dymMDJVzHSKAHhpweeWI+LlK4DXv8cqPrfDijj/PiMAfoaQ3tz9X2KT
         Gr7Ny+6so1xtnLrdLzuzFEenyBtu9dQ+wdIAmZi8Wd8rJ4pInagrjLDMtVCXES6ZWIZj
         efTlWA7a01qhvp24r+7meSEmho2IK3wfgVA9spxseWVfiqAnbChhomG8x6NZThnHtz+e
         7cuUQphyCtcKb2KZaNLx13jSAD6++TXsZ9g8pAGF452FRo8lAH1N2sUJSi4gIu/orQjA
         F13w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cNIS/P92";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si940176ybt.169.2021.03.04.17.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 17:28:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cNIS/P92";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHzGf-0007i6-2n
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 20:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHzGS-0007hu-74
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 20:28:24 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHzGN-0002OF-4w
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 20:28:24 -0500
Received: by mail-pj1-x1035.google.com with SMTP id jx13so843590pjb.1
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 17:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oS1q/xRHxmjpWz0g8w+cth4Wgn4vgSIMG/wYS75TcaA=;
 b=cNIS/P92pHsK1D8ty/ddn9UAiH3Dx6Tg38SsUAQ6pugGGXfVEBlOhKzZG6vsWPWFsF
 44BTzSUwxk/9XI+iI+/0ou6X0YU4etpZ5En/AeJLkgyoHmHqQD/Q2itsmqdzCXbNWepd
 QnUdHi56RGB6/GfwZooQUdiT9Ymu22wkcV1BJ2R22VkNFquKg+yM5ryYUal6QplCJcud
 lhtslhNFj+xR0gms3X6Q94hTE7gqOCYdCderSnv1CzsXcKl2myH2j4oHe0OSySqWt6vY
 x4hdA3yUIFFiTpznFTDn3qTnCb2eZC42lWZv2OJ9LjA7CO5yHJ/q1aT8myY+j5Gppmei
 EurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oS1q/xRHxmjpWz0g8w+cth4Wgn4vgSIMG/wYS75TcaA=;
 b=N6KJBm/1kiR4z69R6ph5UaIo7NKu7KkyxVwkVcDKuQbqqfyFb+porKlhKziHmONNF9
 GSeguQtt+gLOcgKmyildB3OBHlIsx/9877RbUmA2U1SHlQOVulfmCtI24KwsudZ5IBPg
 rMsqgRKJo/rwgcLeVJIDJwTMekaSo1T9HO9S2Z7hVUVh6VXZv/6TaAoGF6XT7Np5BYba
 tNNwBbJ/PDm9cGa5EJ0+F+MGHF/LVD8TPQvPqHyycLoqw0h0T8ucoGdCbYw+OD8ky5jL
 lbmS2B8ZKlqkMuKaPxuJvXjiVKTzT7CgajH/8PP3Yc+Ab3OIluBUojwWiMlFAqPt6CwX
 3KUg==
X-Gm-Message-State: AOAM532f1wrQnzPJ93f6di7jGd4z2MMNu+DWnbVlSQ220IdhVX/ThtAQ
 Uptqaa10vLQUXRP+4XHkqq76Mw==
X-Received: by 2002:a17:902:7286:b029:e3:cec5:f0cb with SMTP id
 d6-20020a1709027286b02900e3cec5f0cbmr6433364pll.70.1614907697538; 
 Thu, 04 Mar 2021 17:28:17 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t23sm531211pgv.34.2021.03.04.17.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 17:28:17 -0800 (PST)
Subject: Re: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new
 mps3-an547 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-44-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5283165e-f8f8-fd5b-843c-2010d212785b@linaro.org>
Date: Thu, 4 Mar 2021 17:28:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9ZJUmbaDJKo

On 2/19/21 6:46 AM, Peter Maydell wrote:
> @@ -1,5 +1,5 @@
> -Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
> -=========================================================================================================================================
> +Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)'
I think you should drop the list here, as it has gotten *way* too long.

> @@ -27,6 +27,8 @@ QEMU models the following FPGA images:
>     Dual Cortex-M33 as documented in Arm Application Note AN521
>   ``mps3-an524``
>     Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
> +``mps3-an547``
> +  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547

The list is down here, anyway.


r~
