Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1402454lfg;
        Sat, 15 May 2021 09:53:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmCOOdFrO61MvsUrk8/lBENkYM1j6VM9fIZ/8h4tODh32Ph3JgfwXohFN8YX840rg54BJg
X-Received: by 2002:a05:6214:178b:: with SMTP id ct11mr51831378qvb.37.1621097610163;
        Sat, 15 May 2021 09:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621097610; cv=none;
        d=google.com; s=arc-20160816;
        b=A7qJFgEyWLzywAU8AC+CRVnhA9n9/cWImX+Y/M+0X/VOSgdDHvQtMf/3AqECpDG94X
         zlmp30PxMGGHYBcVrJUewY0RylVuSka2P7QkOvTiUB0iSo+EmJ7Lvcw8bUWvVQPR6VJO
         Spu8NC8LGijjoSF/U9u9N2QAUpkhuximvKiI/50YKk+AgZgI4klCbU4F9uemKlYDDTld
         grlbBepsV+Ugw85ZwIM4gZsi7/vwvL7uBwgqZR2AIRSptDGgapkKVQCbbABzamUF/b3y
         JNLAeNHDrMFrnvzUBftqgjgLbGgCxt70ECjI8oXS2qptiq22z8yR0qzIlDlu0St6gl+l
         3IyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GrkRmTeWIzLR1r18xTUqveCaCC36oyZeJtZGCG2Z8K8=;
        b=zPCzXBoWBPbzBYUuFUNJ4RnlwVg81YYy9xDp5sXSMWC1bJenJJdVCuvbq32utfhGKy
         NcK9BnAV274LFPRa1Rdcv6js8444dSmgCtsnjr5wOwing8HlYdBmTywoZtPK7ObkK276
         TeAvT6e9WtjVSGgk1fr/QWdmrmw4xOqU5UXb0DwPneiAKD81RJetlVS3QPksxrUcPKHM
         tvW6QIBUqQ+WjdQgY3Aqdk8jjg2/LreLzG1QCy7puFvxKXoaqcWvxh2Utzr5MZcMS8Of
         JqQGutrWuAlbk71J0AnHilaZtnX1fUbxdEErHVm2EIZchjj+OAFlXIgi95pjdGIEaizT
         V2iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lX+G+c6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si6850223qtx.235.2021.05.15.09.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 09:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lX+G+c6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhxXd-0001q0-Ha
	for alex.bennee@linaro.org; Sat, 15 May 2021 12:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxXT-0001mu-SN
 for qemu-arm@nongnu.org; Sat, 15 May 2021 12:53:19 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxXQ-00080B-9v
 for qemu-arm@nongnu.org; Sat, 15 May 2021 12:53:19 -0400
Received: by mail-qt1-x832.google.com with SMTP id f8so1913313qth.6
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GrkRmTeWIzLR1r18xTUqveCaCC36oyZeJtZGCG2Z8K8=;
 b=lX+G+c6R5Oh4P++pSeoTLpDqt6754fAFUPxEtY0bV9aebTvQcpKcCA7FuXkocR2Lge
 2RbnBQnaby+B0jEwtgND/IsfNGMcFhZfG10oC7z0XKWetWrIlVXzWIh0oxXd3gMt/OTe
 0dJk/RzcYThYHsAZf0LKUdD2PFBX1BiiAdl3JhfCqHBxuHRr+p5xS2y2AeywQL6J3M5d
 knU/HZVdAakI6dVmUM9uSsscvfGTjzoTZQwvdohQpFTrHgWrSJ/uNISqok2DSEa1iLbJ
 PYEpqMUZ86ySqVNmkcxk0YUlCNzFtQkx6FbejEtazPZjRHjrUsm6XPvEL+Lhb4g0lusk
 M0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GrkRmTeWIzLR1r18xTUqveCaCC36oyZeJtZGCG2Z8K8=;
 b=WExYC0/fH+yY/FQSGogF9MaLKW10rSvR7LRGmbfgPcPmkL1/rnIbXE5kNtI2oTs1iP
 KoAT/y0EqCDJHzjDlS9xpgXnGeDIm1SVRayjb/UKH0e6tXSrDyU3FelnPb6liXYHeqg6
 lDeu0Htw26QHeSTOtQXQqCFomqvbS3Ull/sR1q9BCOwEMZZ7cl99Nrukc3ccqQ/+5Izg
 Z2OhAtd4be9RRGP7NXvEPrs9sKQ/diATdsNleP/5lQVHE3h3rgy07aqBhtsGKkFcrGiQ
 nZfJdc7D+pMu5ddKoVLgzRv4OlmushJcor7qF6e0l7kQgRWd/daVSlTU4KGDJ7L2gE7j
 9CwA==
X-Gm-Message-State: AOAM53353DjXGTDwizUM0uUHkiDMsx0h2SX86pemaco+g9UrMwq+2O5N
 1bgdq2AN3Ip0Kc7NGbbe6hEjNw==
X-Received: by 2002:a05:622a:1189:: with SMTP id
 m9mr41477973qtk.277.1621097595158; 
 Sat, 15 May 2021 09:53:15 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id c20sm7072283qtm.52.2021.05.15.09.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 09:53:14 -0700 (PDT)
Subject: Re: [PATCH v6 72/82] target/arm: Implement SVE2 bitwise shift
 immediate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-73-richard.henderson@linaro.org>
 <CAFEAcA8FVHHYsH+nEVmJLYYvOGk-dsStvPKD0Yu_Qp-eDJQVRw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7e78b70-fe48-e5ab-9846-1422e2247cd1@linaro.org>
Date: Sat, 15 May 2021 11:53:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FVHHYsH+nEVmJLYYvOGk-dsStvPKD0Yu_Qp-eDJQVRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jx+Epb9/L3QE

On 5/13/21 11:57 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> From: Stephen Long <steplong@quicinc.com>
>>
>> Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU
>>
>> Signed-off-by: Stephen Long <steplong@quicinc.com>
>> Message-Id: <20200430194159.24064-1-steplong@quicinc.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper-sve.h    | 33 +++++++++++++++++++++
>>   target/arm/sve.decode      |  5 ++++
>>   target/arm/sve_helper.c    | 35 ++++++++++++++++++++++
>>   target/arm/translate-sve.c | 60 ++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 133 insertions(+)
>>
> 
> 
>> +/* SVE2 bitwise shift by immediate */
>> +DO_ZPZI(sve2_sqshl_zpzi_b, int8_t, H1, do_sqshl_b)
>> +DO_ZPZI(sve2_sqshl_zpzi_h, int16_t, H1_2, do_sqshl_h)
>> +DO_ZPZI(sve2_sqshl_zpzi_s, int32_t, H1_4, do_sqshl_s)
>> +DO_ZPZI_D(sve2_sqshl_zpzi_d, int64_t, do_sqshl_d)
> 
> What is the rule for when a set of operations on (8, 16, 32, 64) bit
> values should use (H1, H2, H4, ""), and when it should
> use (H1, H1_2, H1_4, "") ?

Depending on how the address arithmetic is being done, and unfortunately, you 
have to look into the expansion macro to know.

If we're indexing an array of uint16_t, use H2.

If we're doing byte arithmetic and casting to uint16_t* afterward, use H2_1.


r~
