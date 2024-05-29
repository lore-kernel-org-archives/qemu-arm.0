Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp363458ejk;
        Tue, 28 May 2024 21:52:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxWPHgDtlZpGlVOi6Cf9pH4LKypY3Unnyu+g4z6twxvEwesxhCfC3EqK6dZdgOQga6q2UfFPADoZydTiDycNwa6Z2dUxD6
X-Google-Smtp-Source: AGHT+IFEFwKNEkrbnapbcwAWXGh/Fl6mmiR1fjILwlJiX5wFFbZpIWrrAlMVhh93a/wDgNC7LZg7
X-Received: by 2002:a05:6102:1608:b0:48a:7395:2ba5 with SMTP id ada2fe7eead31-48a739530a7mr7323854137.1.1716958378283;
        Tue, 28 May 2024 21:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716958378; cv=none;
        d=google.com; s=arc-20160816;
        b=bEcuhA2+i/QA1K992hvtVfFgfoUSRp6de4Gm09bhx+hfg5+WNRYJWl9B4b02FwbqcL
         q0lSEGrgvBfRU+FpX1/BiShbIgSf2NmPSOb1qiVIywEjX+pFTFP15IkshrYHu8/4cIH8
         N2MXzFc7uERXfv6OA8NmVRa8dDbUDsx/OfW7mk5WOvw3NnJlWI5pBQuPzwWcokiCJPog
         TZ0gheQWUk4K0OUdvXjMi5JLAP1F4tbfwsWYhSHintqn+dZpPc3fFYADJo3tkicdv65n
         eM8BIpYgISgRkfyZtyC4fx96nM/c33cyLAP3z+XPuJ9hueDwDbEDo6VVNVJpDR7sP/V0
         e78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ttD9JcPHEi0saWEidrIvE6SiGSP0+pQ/uWKx0BiEiXY=;
        fh=rnbpxtq5fTTkYqOWhvzHESpKFCXUDX+uVpaufqRrwBA=;
        b=EC/d3SmIYowOo2fY/s0RsDh/2eaWgxsULSvCmj83iiNyx9p29nwKOjYik7TyS8/vMG
         ji43zs9USdc0WWBwW2QtLn8RNm887Po4TaW0p7uy2ujCeIuZp6H4+UTvEs48SuiMoNfF
         RGmRkcJzscLYCsTY9LneSXMrtEL5qvy2vb7uE8STiFbHdpKfCfIbiT4cVHey0oTwgrWK
         tzPuRZKoiWSnqCYOj6wNfN1/rifzFHJQXKmXFKyh+5J9Y1w1O0fhkMlnJZbLp1ipowea
         XOPFewb+PGDXUXBqsXdGdrkxzYvFJc7UcetnZY06HKNqLA57JhNFSbevlnJWORnQefIO
         HlLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d3efm5ex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b5078si127952311cf.502.2024.05.28.21.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 21:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d3efm5ex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCBIg-00023H-Mk; Wed, 29 May 2024 00:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sCBIb-0001wk-Sv
 for qemu-arm@nongnu.org; Wed, 29 May 2024 00:52:31 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sCBIa-0001ec-BP
 for qemu-arm@nongnu.org; Wed, 29 May 2024 00:52:29 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-529597d77b4so1960825e87.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 21:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716958344; x=1717563144; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ttD9JcPHEi0saWEidrIvE6SiGSP0+pQ/uWKx0BiEiXY=;
 b=d3efm5exuPi7/t0aHz0ul9CqArXUO7OPkGcayFXyTS0y1hzjZAVtp8oVLXpTmF5BA0
 yV9JakAnH2/oYtN1IhwUmvJ0rU6Ra8DfRGQwXimfoOqDtzZODzA755lHg7LgICCy73JJ
 t0UjjMKVRUxr/Dj4ir1rD8QDniGUOvqZy8S0gcFMINLZSDJI+R5B2mUzIALcAMOOnExe
 E8oHXGYpnS/e3sygY1dGYUoTpzMxsYWdJvDiUe1MH9P+UJXIC0GfPDcvjSb010wAknqa
 dcEHpgX2Z0uDLzb3jCBb4XXgSll1BqX/8J3vMpna1v00JkSDyNHPmpHMsQdnyjLgZJg4
 2Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716958344; x=1717563144;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ttD9JcPHEi0saWEidrIvE6SiGSP0+pQ/uWKx0BiEiXY=;
 b=g8ePCCQ1ATxrrUDUStyZcUHn3QGe6VVuJkLmXcuT0dH2X7zsq8cCHuiOpbOeF+T+t6
 xPPWo/rObbVDlEfZSb1+w2kHIUlFUEysWq4OlUiTt6s4oseCOx2GbTmibi9qJVO3MxJX
 3b1xw8R5b9sRSdAx3yxNr8NG9ymAl55wkKdM4AQiE5KsdUofphcoaZtBuv9tLhd5EiEY
 B4NcEGA5eC/gyAsgpMk8pRF35h7bLe/DS96aerWiuCqjjh3L6emEEj0lndMM04nlL1FI
 3ZEvyQjwuOUkHijlq2tle/SLT7M8B+JgQot1Euu7SvDpvlzzOQD7ar/vifpvPn3fXWqZ
 +OEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjuwu+WxBtS2uLAJbaE7oDJv14nN9s6eBaAJ51IIC/hHmScpqJ5XKcbZYjZ3oQkJncA/7YsSspabzx1csLb8FvgeoY
X-Gm-Message-State: AOJu0YxXvmRyJ7Af1DuShWj4+nkS1GOci3x4FIv/G2Dp1lKOAlpeXuxm
 HyppL9Spss3/BC8VbMqabo6VjitiSC27pAfFb4meNQAfPckKCBabyfZHKr/Dmpw=
X-Received: by 2002:a19:7406:0:b0:523:90df:a9ce with SMTP id
 2adb3069b0e04-529667cfa1amr7917970e87.49.1716958344329; 
 Tue, 28 May 2024 21:52:24 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.204.141])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578524bb5ddsm7880225a12.93.2024.05.28.21.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 21:52:23 -0700 (PDT)
Message-ID: <7d746f7d-60b3-4513-bd95-5bec7e799b67@linaro.org>
Date: Wed, 29 May 2024 06:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/input/tsc2005: Fix -Wchar-subscripts warning in
 tsc2005_txrx()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240508143513.44996-1-philmd@linaro.org>
 <CAFEAcA-apsUZeNdpC9QfJm+Xqr8Z-LhfZXiv6YxcSXo2bKsocQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-apsUZeNdpC9QfJm+Xqr8Z-LhfZXiv6YxcSXo2bKsocQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 20IeOLeHNSyo

On 20/5/24 14:49, Peter Maydell wrote:
> On Wed, 8 May 2024 at 15:35, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Check the function index is in range and use an unsigned
>> variable to avoid the following warning with GCC 13.2.0:
>>
>>    [666/5358] Compiling C object libcommon.fa.p/hw_input_tsc2005.c.o
>>    hw/input/tsc2005.c: In function 'tsc2005_timer_tick':
>>    hw/input/tsc2005.c:416:26: warning: array subscript has type 'char' [-Wchar-subscripts]
>>      416 |     s->dav |= mode_regs[s->function];
>>          |                         ~^~~~~~~~~~
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> v2: Use Peter suggestion
>> ---
>>   hw/input/tsc2005.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
>> index 941f163d36..8d35892c09 100644
>> --- a/hw/input/tsc2005.c
>> +++ b/hw/input/tsc2005.c
>> @@ -406,6 +406,9 @@ uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len)
>>   static void tsc2005_timer_tick(void *opaque)
>>   {
>>       TSC2005State *s = opaque;
>> +    unsigned int function = s->function;
>> +
>> +    assert(function < ARRAY_SIZE(mode_regs);
> 
> Missing ')' -- this doesn't compile ;-)

Oops I apologize for not even build-testing :/

> Applied to target-arm.next with the typo fixed, thanks.

Thanks!

