Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp784751lfa;
        Thu, 10 Jun 2021 12:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKcGkbla+FK4/vftiIX2s3ZPTLlbbeLT2gR6QUdulu3eX0mImtTGOXazG6AQcJtMQ+URad
X-Received: by 2002:a67:fe0a:: with SMTP id l10mr7163030vsr.33.1623353691376;
        Thu, 10 Jun 2021 12:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623353691; cv=none;
        d=google.com; s=arc-20160816;
        b=R+mmLXjlrQeQd72dbuOvhszUsvAPObEUbI4B9TTWkAPefyKQylHJ2JT6GVFzrzAJo2
         1+w2UDDDR2q8x9AsnkePg8qHXdlwtEJDKsUxqZtS7GjAnrazFH5wVzOg6uh6qHHgD0+k
         1NSyw9vIRjbf8lZ0JcBgh/0mQ1Nc4mAx+P5FcoG/TcROYrcnvLycv+ZEqew2AMasUstQ
         pzr64VljD5xKRHEWVbnEL3F8z1C/RaI346KBF14aexmsrasfv2VJ8Ck6O+z6jCDN5ryg
         OJxxtdyPUi6YL8aoYdvxSUbw9LmtdRbTK3bCPFssyF4qev68fI3Bv3SDtmK+3YKET8XK
         NdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PLV1lJxIrd/zU5Hs3B5njuLGEOX1odPFK5GQb7+WSXo=;
        b=mOxlb1ccvC1ZSFKClq0mtJ8PqFu7KZ7xv23mlhkIL5A21n7uDXD0XhuiIjd2vJITTp
         9toqJQ2eOdVFLi3wrimj5R0ALRntnEeEewvm96Kp0M2Y4QcYpLhvWJQoCmq/PcDLB0Vz
         iFg/aMIEUr1aLaPSHS5qJVjoUUuFlKQ93oUT/H89uevfCTKRwHR/hRVdjfERzVzQqxCo
         +k5gkzcrCOixrTwWq6/1rQPSWubCu91vN8bqplJwW72oAyTgSLCXKc35DilqzJVWtC6N
         i/EROk4VDmNjZSr7sOHkDCVKKjt7klJ4S9jcwZkU7rmNikfj6WLoz5bvi69YUUxYX4dE
         6ToQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oV5VMlqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si2389478vsb.163.2021.06.10.12.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 12:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oV5VMlqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrQS2-0006qy-MW
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 15:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQRu-0006qd-Th
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 15:34:42 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQRt-0005xo-8r
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 15:34:42 -0400
Received: by mail-pf1-x42f.google.com with SMTP id u126so2458567pfu.13
 for <qemu-arm@nongnu.org>; Thu, 10 Jun 2021 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PLV1lJxIrd/zU5Hs3B5njuLGEOX1odPFK5GQb7+WSXo=;
 b=oV5VMlqIBsPDFrMD0zwjG3yVrgux5LtOMzc2b0WdjteOjmR4TIR/dvi3a1S7cIrS4G
 UsLwaeoRmd8zGBJuMhf5XC5asQvEhIHrtQi/jcLWpzwP2yJNjoMFUjhmF8UaDGb/qZl8
 nDU9Q65sL///r4AAJtCKcM28Pi+h585L9bDWVee+fmL20onPhdHQhiU0JRIK0BJDJrWY
 jEd12rz3VO8PDd8diJnBRm1BtiVx1RsQ8E2w9KV1yTfRk+5KYji0t/WZmxNrjfMt5n+V
 UJMyBDQUA291FBIr96xcYXQ7dSP9yX1mb9nfsc4o96cNNojeVG6tQFMLQpI/QfA3mVgu
 yKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PLV1lJxIrd/zU5Hs3B5njuLGEOX1odPFK5GQb7+WSXo=;
 b=F6tYJPKnXTe6BJELteh8gSPAekzpq7kbrywOhlf8l5tv8sg/aNSeNtg6NYy1WI//Ty
 QuQLh40N8kzwUOu21/Xv7UPVB2JBe5w466IoQ2OOmDQlnHsBlNuhdpBga7yxiDWsBdLU
 hrecdcyU8/ma4XTNSzCYkSSrgzv/XEA9mWtN32BeAfOC54J9io21+9nn+QWjhptT53LZ
 0Dsxlygh507ygTY38RRmU1dK9+JAZsHr2pdjspf7Q1HvXOIv/RxWStP2VNxBchOWlIv3
 VJFG3CX+PLbiaRi1DPwk5UPeH30L20fvrIvwL+vHPSZH4r7NF/D0+GrzP1h44bRrvuAn
 3yvw==
X-Gm-Message-State: AOAM533dnTBFdl1KZfN32qmUEG1Nma9QdnNqNbDxQXDn4ZuSncqNQyQ0
 UczriNq1DGBf7kBqSFrW96/UOw==
X-Received: by 2002:aa7:8bca:0:b029:2e9:e0e5:f9f2 with SMTP id
 s10-20020aa78bca0000b02902e9e0e5f9f2mr4442257pfd.33.1623353679563; 
 Thu, 10 Jun 2021 12:34:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u14sm3056453pjx.14.2021.06.10.12.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 12:34:39 -0700 (PDT)
Subject: Re: [PATCH 49/55] target/arm: Implement MVE VQDMULL (vector)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-50-peter.maydell@linaro.org>
 <5b0a7b23-7e96-4d0e-abe9-5f137da131da@linaro.org>
 <CAFEAcA8UNnD_gzdNTAVb=Qow7rLc_a7W7r2H37MBz=+e-JSVwA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d14a954-6301-c341-fa45-e07684b6f5ce@linaro.org>
Date: Thu, 10 Jun 2021 12:34:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UNnD_gzdNTAVb=Qow7rLc_a7W7r2H37MBz=+e-JSVwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uPpuE3T0cUIk

On 6/10/21 12:08 PM, Peter Maydell wrote:
> On Wed, 9 Jun 2021 at 21:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/7/21 9:58 AM, Peter Maydell wrote:
>>> +++ b/target/arm/mve.decode
>>> @@ -39,6 +39,8 @@
>>>    @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
>>>    @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
>>>    @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
>>> +@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
>>> +     size=%size_28
>>
>> Move this back to VQDMULL[BT]_scalar, I think.
> 
> Why? VQDMULL[BT]_scalar uses an entirely different format
> (as a scalar it uses the &2scalar arg struct with an rm field
> for the gp register).

Oops, mis-read the @2op vs @2scalar.  Sorry.

r~

