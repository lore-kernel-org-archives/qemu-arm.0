Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4950359ejb;
        Tue, 20 Dec 2022 23:16:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXumMEkpuei/NvmQA91k0k64PAQLRDgcFwMRl/IM/q7ivfmz94/DTn7+ICWSINgn1n5aUKq7
X-Received: by 2002:a05:6214:37c6:b0:4c7:6454:5b1b with SMTP id nj6-20020a05621437c600b004c764545b1bmr1262775qvb.6.1671607009474;
        Tue, 20 Dec 2022 23:16:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671607009; cv=none;
        d=google.com; s=arc-20160816;
        b=psMwVNEWbeU9V0yvZRE5J41Nr16UYcz/2E1rLU68YeJLu4IPeCwV0xW5Ix9EdEgpZ3
         31EU3ylRJT8Y/AQBaBI/UzzBMIVCmJ+8va8TdBBZ0qa4leYt4EzvMvn+s6I8ZWzoadHV
         huQqn6rzzpbDB/2trBHmxdH0HynFGYvR/eVJMhXZRkXyjC0UNlRCRsloARknqskkho6I
         9N+3R7lbJBXUGHbkGoz+4C0Hvwo+7pbEFSCnvZzwXS47f74uNYnmaMt+7FIo24VxU9va
         XhAb02u0KbZf5IJwb5cHMByspBNEHFf1NSlmFMadpOjVLcIwmw/Aw42qIPjdiW3eIXge
         0hEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dD9OcS9dhPhnWdTVhyUVnRBRQyOg/tkXlZTQonGB08A=;
        b=h5+FOGpYo/Vy5OQusHnHqVRPkRRYPWrCYSzSuAQ+JUrQDZ/810U+VhWZIywuWSmrCi
         FAsaEYyo3U9OdM5FjVl5KAcbGlSMgETA1UEPHERgtfNqfXxQCFHW0jMLCgIpw2eikpGl
         plKSMKlmk4CXnqx7yX6DGRRjNnAJ+0yInecwAWIpH18p1HEAnd1JiRY+uKcbqtR5024S
         mRwKBBlklcVddalgneuCnTwx3dtlqsMFz4xPN+K2P5cJd+8G4Keo3wU+e+m59+4yRt1B
         4TbOOz0woUB7U508sH1PJYZweoCcjxJ+ELLOKzIx6gdcWaXHGcfzHktZmKsUZp0XqNwH
         X98w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rBaaP/YC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a0562140c6300b004c71e35a318si5937136qvj.541.2022.12.20.23.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 23:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rBaaP/YC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7tL4-0006dT-Gg; Wed, 21 Dec 2022 02:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tKt-0006Xc-MC
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 02:16:19 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tKr-0008NE-JG
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 02:16:19 -0500
Received: by mail-wr1-x433.google.com with SMTP id f18so14015918wrj.5
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 23:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dD9OcS9dhPhnWdTVhyUVnRBRQyOg/tkXlZTQonGB08A=;
 b=rBaaP/YChnNAhAmuWhUCiJDSEjQY+XhsMUchtM7A689/bP0er96IDXx8SZrkGs1Xsk
 M/7A1OG/Rx48piI8rx4lT55X1OWHO/9z5phXcO2fteT7LA+rjqnDdDYjkgg1lsEpQpx1
 T23jPUpHk/0Wj+b2/hN6/X/XL8swbtRY4Jc81wBkE7yQAzdBczhD2gb94Ed1XvmbCZX5
 +v5VTaEEd32yTQrG6I6WadF7ReDpj3t9b8wd/qWx8GCux5H4nytWjGHU2mJngfrc9GXw
 zapAo3FwTs4MxnQQ9fzo9XTQCGfOsUv6ap802YM8yRz8YLXTsw5wG4AO39ZyMBwcTKkO
 P/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dD9OcS9dhPhnWdTVhyUVnRBRQyOg/tkXlZTQonGB08A=;
 b=mFvrGK8g71q9svbSaacwMeeTgytYQ0Ma2Sd7jXquR2qdEk/rB7j452ZpBF8qqPNEkg
 GYjCZv8F7j75uI15OBZy6KymMpRFd3uk4movl+pqzOHV5Ae5wz2pB05z37Z7dtRFnwRx
 SmyuNB4+8OJX4VBTADGI5gRBMvjub5wOzDCx3tkDlpisB4g7iVEzWCoFl1hiOuBgTufb
 JF3uPz9iasaHxrl1wrSgjmq2pnnXjTygDKEY8waiU5DqFX8GTI3fGCgXNgZvPzJKXd3N
 v5Qmje2X50NQhhFPw7LY0gjq3X3vFy4R67GGw3u3VEk5kkIRhz4MV4RX+ydCXRSe+08Z
 OB1w==
X-Gm-Message-State: AFqh2krBngaSMHVrdvH+yGQzlfJD5RAiew/gcXBsrF3nvhG8LRzRs4sN
 J9POi8XAsxXj2P5iDSszH3aOHg==
X-Received: by 2002:adf:f742:0:b0:242:1551:974f with SMTP id
 z2-20020adff742000000b002421551974fmr443918wrp.13.1671606975699; 
 Tue, 20 Dec 2022 23:16:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 cc6-20020a5d5c06000000b002428c4fb16asm14586593wrb.10.2022.12.20.23.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 23:16:15 -0800 (PST)
Message-ID: <4398ae9e-c29a-503f-0738-4a4a161eb714@linaro.org>
Date: Wed, 21 Dec 2022 08:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] hw/arm/nseries: Silent -Wmissing-field-initializers
 warning
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20221220142520.24094-1-philmd@linaro.org>
 <20221220142520.24094-4-philmd@linaro.org>
 <eac96f81-8cd5-5951-6b0f-69da5985d47c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <eac96f81-8cd5-5951-6b0f-69da5985d47c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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
X-TUID: GIy6T/JGWACU

On 21/12/22 02:01, Richard Henderson wrote:
> On 12/20/22 06:25, Philippe Mathieu-Daudé wrote:
>> Silent when compiling with -Wextra:
>>
>>    ../hw/arm/nseries.c:1081:12: warning: missing field 'line' 
>> initializer [-Wmissing-field-initializers]
>>        { NULL }
>>               ^
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   hw/arm/nseries.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> Not a fan of this specific warning.

Me neither, and I don't think we can enforce it on QEMU codebase.

However I find '{ /* end of list */ }' cleaner/clearer than assigning
the first field.

