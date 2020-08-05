Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp215785lfy;
        Tue, 4 Aug 2020 20:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRnpIRfb3CQGtlycdJp/QdRyXtWC5FY8giaR05olor6ZO59rahhP8nhIo0WagkTheg3J9g
X-Received: by 2002:a25:5555:: with SMTP id j82mr1761022ybb.125.1596596845820;
        Tue, 04 Aug 2020 20:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596596845; cv=none;
        d=google.com; s=arc-20160816;
        b=pjT1KKfN2PP22zcSYVBUYkX0kdFN4u+N1Hay7ZU3daEm5Dz8jeQdRzd64P/DJxRTwX
         oaWQV8qR/7Syr24qSUBEAH3BJm9iYrBrYIZ7TS3qt5YsyU2B8WsrBGREKdew2sVGKIbG
         Aj6oxDlTb/Q4a5VC9S3DO2VVnSGetVM2zBJPrWnAy8T3+VHWF6uBoEMwekGpBYLO8Ds+
         DlA39fOk6zpg/JtTElXRwgLe807vSwZgjc44knU5zUOuTBBK0ABQvhOhIDIB6ZEf+32B
         Gd0tiAO6FfuOTu/w8MgwYPkFVU8h/uWjDYQod3XKYx00AWusJx+RbZi9QYm1aHV/vjtN
         I+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Tjuk8mPH4Hs+Fhn/Jhu40zdX+l7fPLPuyWDtsbdLNW0=;
        b=IZz0+HX9mb0nRJ5jjZGfj4epZryWiTj/yILbDGPZDY0qV41ak+FiBkYsUfG90xnCHb
         ql6u5MuzTZ7vrp+m6r+PQQUQ4l5zdQ3b2tjaD6XtBRuoh4a5Gc+pq/EG4zdX8CCBSyJK
         GIW1PjGgEmfBs+hW54fu3CL0kbtbRbikuFD9EH/Tm4h3wblF5GrDq+5Cfl+ryVhYhYoU
         C7Qu7e9l8ROJ5vPntwBh6UuTQHcqLb7/ekIDmpX2ptCi5px2mmY5NmbTlsvhvV7+f9L8
         M9oWVnRo5M2FhzbuR6dFN6FGftVprTZdmvRDxCCcDSXTF1+dv17bMiFjb9PfX1GwOsjv
         aeZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Mb4dVSm/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f192si736912ybb.107.2020.08.04.20.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 20:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Mb4dVSm/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k39m1-0007Oj-7t
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 23:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k39lt-0007OG-Ex
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 23:07:17 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:54347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k39lr-0005oe-Ol
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 23:07:17 -0400
Received: by mail-pj1-x1042.google.com with SMTP id mt12so3704918pjb.4
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 20:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Tjuk8mPH4Hs+Fhn/Jhu40zdX+l7fPLPuyWDtsbdLNW0=;
 b=Mb4dVSm/gvoy/JLzrmgeW2XfjfC2NK5u4/PNYYjyd8tYwm5u4pZuW1O7f+HM9VSvMp
 AwMw2fpvazsb7S8QzQzqhLiIBCKjC3DRbcOCKIspMBpdzLXFLRWxrHvnwncex9OYu1UP
 iPESuNTNBRGfrGysDAYSTa4/ES+1TaA+0/Cd98W2amOKwTT8ZN8uMSP7fV9+SXnW6CdT
 OVX/VJasT8uzc8SkR/lPrXjIQvG6zti264S9oaJHf+Jer0bqE094CvhQ8EjuLq6lcbXQ
 HCD8fXkYyXwqr4Vulf+54dy8Ion5YXqHZdlIrpwIy55fsBAMyNihyu7KcU27/7YFc6Sz
 JjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tjuk8mPH4Hs+Fhn/Jhu40zdX+l7fPLPuyWDtsbdLNW0=;
 b=JgFv3PMUazWBF5Eu6BItSgPflPD9t+MhEZuPNPj1/Oox4Jbv23EEKJ+GPxR/IJqwZI
 FqGC0LtProrIbiBFp3vKd7lCvjQXm4/4gWk5bUfDqIfpR9rFT2CpO6pCs4TKpkqbsNx4
 8WvduXR1OuUxtrqxZg0Gh0LDy7oRx805/+XI8G9JmBH3EYUXax5aZPcbNuvYI/4Lo5QM
 +omPUBBYwrsDy7evmOtX0eSI4C2gYIzPod8SVcqd/FE+Vtst9Bi8EPOIm5ea2CJANS6z
 RPQlrQ00PxW98P9SMXqzu7GfU6K+m6ap7x6hWVUjsG8u7VWAN5CAjDPstmgJ/YJmzTYw
 gTTA==
X-Gm-Message-State: AOAM531LqzJZ6FaseCum1Om0pBACzIqQW/rDS+3TOAHmJEMGhnHnpTIx
 eHA5G0pBU00nTFZZrj7ezwizBg==
X-Received: by 2002:a17:902:547:: with SMTP id
 65mr1142328plf.191.1596596834538; 
 Tue, 04 Aug 2020 20:07:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b185sm803174pfg.71.2020.08.04.20.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 20:07:13 -0700 (PDT)
Subject: Re: [PATCH 7/7] target/arm: Remove ARCH macro
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200803111849.13368-1-peter.maydell@linaro.org>
 <20200803111849.13368-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6a1d0c5-30ad-f6c5-8919-a76b9591b4fe@linaro.org>
Date: Tue, 4 Aug 2020 20:07:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803111849.13368-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lVgEPNUfpX5X

On 8/3/20 4:18 AM, Peter Maydell wrote:
> The ARCH() macro was used a lot in the legacy decoder, but
> there are now just two uses of it left. Since a macro which
> expands out to a goto is liable to be confusing when reading
> code, replace the last two uses with a simple open-coded
> qeuivalent.
  ^^^
typo

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
