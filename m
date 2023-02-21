Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3005179ejb;
        Mon, 20 Feb 2023 23:16:45 -0800 (PST)
X-Google-Smtp-Source: AK7set9QBSyErP997FAmp5OtkL+YTE8RcKYQg90METeROhx9QvdPEuXXQMi1H7xuQFBX0+dQ543S
X-Received: by 2002:ac8:5c90:0:b0:3af:ba3b:db80 with SMTP id r16-20020ac85c90000000b003afba3bdb80mr19573028qta.33.1676963805786;
        Mon, 20 Feb 2023 23:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676963805; cv=none;
        d=google.com; s=arc-20160816;
        b=TajZ3iZpzL5zbHDcCMjxIz8BTxxlxMi9h5kGlQbdPV9ziJpVg8CPxk/tdd0XWkdYjR
         ro5T+mXprix70v7oDNx7GfvQ20dMrxAxVXxxyn1Mxq+6l5IsbRWVWPLQ1qi2ensE9z9w
         b7sB6pbykwgwfpmrPV4APzPd/KOsSRuScvxSLBbMmwaDWL2WIlorK+EN1+vQzslyXcCl
         WmLJx2apHBPIkFBKGi7Gl7AqFr0ol5H4jM2aO0PVUB9HQaDYKoQMrME33jq82bc3p8js
         UNym0Oe4Ne1Neb0WSxLwcy7r32VX1KyaANH3S/bPqtZJU58wW5PkBdBbfUMpkjp5qAnN
         PiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=icWWngUHMVw04oXWqJ9PeNtR5VBg0geCEkmiO3AzBos=;
        b=G8VPKz5Erkvny7bCWlLR1CHrhJau0F/RATjgL5h9fa3+OQ2TU94J/tddmvRiJfhuHo
         YlI+y3xjXUeFibNxSe3ukFSq0LlFmBagZyG1Z6BX+jL4mCXGMlLpsPF0kNhknqH7WdIS
         7ZlzSIk7Hc3kJO9LnoH9eoNtGLi+rD5YZX8j7bJBZC29FtP4gDVdxqQn4aPE6obyDArz
         YGNmkIZ9x++3DIRJQWhkH9RU1LAOZBVYfWWBmhewxqjKP/h1UbVt9i7vODgtdb7qsFP6
         UEMEb0IcgDDFt+kgRfoeJ7StBtLD/Y6cPNDZd6fZaAjvLmEc11UTV1XsPDHnqx11hOv/
         XwUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKcaGrlH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a05622a004d00b003bd00fdf974si11797584qtw.9.2023.02.20.23.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:16:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKcaGrlH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUMtB-0006Jb-Rg; Tue, 21 Feb 2023 02:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMtA-0006ID-5i
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:16:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMt5-0003Ya-GW
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:16:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso2720510wmq.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 23:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=icWWngUHMVw04oXWqJ9PeNtR5VBg0geCEkmiO3AzBos=;
 b=aKcaGrlHpvFL1WcvneVzuICedtPX1A555OKbIgsR+74vwAgSCnWMOqCv5ZzRA4VZlq
 EOlJ/bMmISlkuO7ZGc0ja8xTFIpKNy7ffD3/AIlPEYryexQrGVZOMADhNsPJiGQ2NBIH
 H4Ylxvnx1Oevb2yBgLopyADmRI/hRi/UJH29mygMMcF8Qexu2aUkAm1fHEzFMMLAP+5k
 FIAUbABdWLf7/7cJ9LlTkWzp1rLA6boMN6WKmKZ6GokHWYdT+8Q+I/l1MbuFM90/gm2Z
 yibKzBLm61sNwt4RoGD/4yf2W4OR+QmhnNC8arcNIU+11MHIY0USHdaSmIJQfpXxA9Vh
 68mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=icWWngUHMVw04oXWqJ9PeNtR5VBg0geCEkmiO3AzBos=;
 b=wqrBJhSINcawbFLwlXrYZoDMRSYOzrq0YRL1xSE0FuNGSJS6JFTCdy9UXsXhsJyiIS
 HT/n51eXMIxU3Fkb8VngBnhjTspo4vu8OsYAXrqI+AGdwAiycQoAnivORuooBJJMDx+J
 7YaunfRH9ItJRoSYrCuYMLlolD20RQXY9NJVkcXb/EXx/NcUmaKl5XRYcLfxeNl6cIUl
 ykLr65g08YcaKm+doHoMkgUc8l6NjbajnJpZAZomLG9HcHfxwytAneWNxnyX+teOVJ+J
 syfRBe06xAca/35MxIxtcCelMcwr3R5I5hZZG+rH0UrAvCID5M815pTxZUs5AabfkWLG
 Di7Q==
X-Gm-Message-State: AO0yUKVpHC8wfYFxuQVxgMrcETyC+GvU6pJt3yV3PyS2Zg07fJDcDidS
 qtAymZ4+bgOUDu+wZnjT5rygbg==
X-Received: by 2002:a05:600c:2e88:b0:3e2:201a:5bcb with SMTP id
 p8-20020a05600c2e8800b003e2201a5bcbmr2343481wmn.28.1676963789734; 
 Mon, 20 Feb 2023 23:16:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0a5200b003e733a973d2sm1993902wmq.39.2023.02.20.23.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:16:29 -0800 (PST)
Message-ID: <6862e485-66d9-9f03-ab40-5ef5f407961c@linaro.org>
Date: Tue, 21 Feb 2023 08:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: N9Pc5X9XYTTr

On 21/2/23 03:19, Richard Henderson wrote:
> Rather than increment base_reg and num, compute num
> from the change to base_reg at the end.  Clean up some
> nearby comments.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/gdbstub64.c | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

