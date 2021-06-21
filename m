Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2268100lfg;
        Mon, 21 Jun 2021 10:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdXQTDsbtJC+MFiG8X7NDb9PJAg8v1gtF7EFxarnOcUd5MVIuuoZ0OLcNR6bLuNwB3SFek
X-Received: by 2002:a05:6402:358d:: with SMTP id y13mr23344130edc.264.1624296112042;
        Mon, 21 Jun 2021 10:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624296112; cv=none;
        d=google.com; s=arc-20160816;
        b=wq6pWe0nUnhjfbkpRQOD3i18mTMZJcvEck9Tlh9/IpiTj02FEcrGrOTEReyxt3Ppju
         AF6xGAnJr/vkqtet/gtPDcHQdVEKZAqMyDhY5cHiSW7u8GFEeLVuPloB1RLMZyGka0ej
         +i6rqefhIyyvKtlI16BtkL9BXb/jnvAARnu/ZWbwAoxqqwzglD++7gjzf+9Ws1elYedg
         EI+v8330QHPCKWiStQNI/azhGku8IXW2MmZGSNywjiJN3y2hGNBO7f98shLVCuyBI0U3
         wlAyHsoRl6b5DMhaZB6mhjU/DeRrWBcg0ZBZJ5fehBEJhwxyeK2WI+Ue80QUt5Iw7Hjn
         7klA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IhA4cSLftuCCYp/cbOl02JPYx8KmG+g5ZeFChx1n1Y8=;
        b=ad5OhyyGybRjy0U9OjpoN/oex/7OmWMWIoIUJhzTRyxN7TFiot9EnSCc5AOFxlMe5y
         4GuKlS2ZCJ/pTC9HLSA7YiaB28nvFWKyuITWrZdYPtarNXK6MSpdtbFT2nnpwq7/ZJJ/
         6s3qxW8bKSW6Ur7l5lIKRgHFmvRtWT/SKDT05Ep8ylwMSMKQ0RtczFfDz4NMgH1tEUyG
         oy8J9DxiUZGr9rwf9zK+rI00HNMsHjciawGgI7x6RTCskDOywUvh6eYFNzUOHTFZLh40
         7L5/G/v7fdSK6g5l+oWE7W+T/XwF1O9slW8wC9/uS2PlLWMLsBwOAjco3PAL16c27CrN
         aoFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T35TeSGK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl19si10517487ejc.706.2021.06.21.10.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 10:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T35TeSGK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvNcN-00050q-45
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 13:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvNUT-0000rK-Hw
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 13:13:41 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:47069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvNUQ-0000HR-Uw
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 13:13:41 -0400
Received: by mail-pg1-x529.google.com with SMTP id n12so5959137pgs.13
 for <qemu-arm@nongnu.org>; Mon, 21 Jun 2021 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IhA4cSLftuCCYp/cbOl02JPYx8KmG+g5ZeFChx1n1Y8=;
 b=T35TeSGKSUlunj3tvT4XDxgFVrCjcpIHFAKq9eTyaj5A6Kz8yERIgJ3lXJequTXs6P
 UzHWqQDe8tOZXBMXHLCsgvWhUxGMEGVcrYMfGSiDUy9n2tWRMUO5cZ0tp/PjoYpcZwjb
 4AUoCOLRqt6k4UDdoK0End/S7OsQ6n+E1S/QU0QMB9QCgQkcR7uRRQN1lKUV9KNmvYuq
 YltXyRHWgj2+jQ5n4NiXzyJus2TXeAXRXU+GFe3DcdwYs1AXbZvGvlX3XOwXyr7kmkAE
 nenje3biaDADf5zKkvtkyHIoZQpxe31aO/aDK/xFC1RkyJCyNoZmBpRixywxJcz2iKla
 gEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IhA4cSLftuCCYp/cbOl02JPYx8KmG+g5ZeFChx1n1Y8=;
 b=llhlFE6x+9ELqw7x+MvGp6sVK0PiRMrLgG9DwKxF/rUEEuAxvyjdtmjMCgYApuRb7q
 bIHh73EL+LmPtPExk77yVvNhdJOzLRDm1aZEiocEpB0RwTOz/Ef7vYEnm0EwplCPV/nO
 hIuP7785bFnCZXCP02hWFW8Iup6I3iUymyc7CYrXMpTCMhzylZELOGO+sY+T1JEoUPoh
 7+hwqsfz0BUlWwmp9i83GGIIXtlCc5etFa+GVCy+IaLo/fhd5qhVn7qZvrDZ0zivVeHa
 YguofZzOYBnrXnDfWOYU4iq0OJoEghDzdyWtKGzFJl6vynLYg6RgRrmBx3+7wre3YfVN
 xIzA==
X-Gm-Message-State: AOAM5335ntuqk2i7qL/bqX0B+OJpoHRD8kM56IDsQ+td2NzayFP08Y7Z
 DtSLotieUie1xmWquQPvLrM2Bg==
X-Received: by 2002:a05:6a00:17a4:b029:304:a2d1:25a6 with SMTP id
 s36-20020a056a0017a4b0290304a2d125a6mr1780122pfg.68.1624295616932; 
 Mon, 21 Jun 2021 10:13:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g13sm15454228pfv.65.2021.06.21.10.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 10:13:36 -0700 (PDT)
Subject: Re: [PATCH v2 00/57] target/arm: First slice of MVE implementation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <2ded6216-9fa3-2b39-87ac-c61d08e80fd7@linaro.org>
 <CAFEAcA9udbXc9jTJORVfTmH6jdBrSwJLaivAoaeCUom-uVGrLg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c497b5c5-c01b-470c-e7c0-dc7fe81be636@linaro.org>
Date: Mon, 21 Jun 2021 10:13:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9udbXc9jTJORVfTmH6jdBrSwJLaivAoaeCUom-uVGrLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Q7l2bdEVaQh

On 6/21/21 9:37 AM, Peter Maydell wrote:
>> void bt(unsigned char  *x, long i) { H(x, i) = 0; }
>> void ht(unsigned short *x, long i) { H(x, i) = 0; }
>> void wt(unsigned int   *x, long i) { H(x, i) = 0; }
>> void qt(unsigned long  *x, long i) { H(x, i) = 0; }
>>
>> void bb(unsigned char  *x, long i) { H1(x, i) = 0; }
>> void hb(unsigned short *x, long i) { H1(x, i) = 0; }
>> void wb(unsigned int   *x, long i) { H1(x, i) = 0; }
>> void qb(unsigned long  *x, long i) { H1(x, i) = 0; }
> 
> What are these functions for ?

Ah, sorry, testing.  Just looking at the -S output.


r~
