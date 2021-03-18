Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp721224lfg;
        Thu, 18 Mar 2021 14:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhJyhKQ74oTLBILbOuuJQVuO6nRU2HliO6IqYlsIDSdKHCmnpxH6HZvXvTXylmQhF6IOeC
X-Received: by 2002:a05:6e02:d4e:: with SMTP id h14mr426015ilj.80.1616102071057;
        Thu, 18 Mar 2021 14:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616102071; cv=none;
        d=google.com; s=arc-20160816;
        b=gBse7/IQQzMIkAcXV5XAl/Ml6Hxrfymlzq7J2q9PtyKR5LFgXdyCkBudiiyFnmkE7z
         ije9UE5aY/u1Ha/utiUbiLTX115mYxAdzwfWEESCSaK/Anplt5q4TFMoQxdxKJBX6Svh
         sqpkA0cz1dwfz2125Xa4q1CAr63unXZry2IPMVe8GRV4UHbERC03PYoJ+/uDfEYBDgix
         yRnUfXBjme6MLoKh4A1XbxYgINOK0l2ux2DQjRQ+lxu7kn2msEmE6y+2mGVGJlleYyer
         oU94p3ReVdxa9C3ejjnnnZRApFGoB21XqcbaBvUFSZcSUBS5Okwz8fb6eOgzFlNvdIuI
         jVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gVKvW9rSAO0dP3lXSgeqfRbuP0yqwxlRmxb/jqCOt4M=;
        b=vN4oo+8suBBm8eCofKfvvCo1ySPXxCqAebo8zykhcuW4IJzy389/EjqpJtA18tQe2m
         46O0t3d3iIQFw3WAuTL3pv8ngkecbEazArCh6FmwjIKhRyaSiojGLeXu+6VFF9j7xPoF
         ltnIS9c4vdajQZ9g/YmrqZtrxMoBHM1FTlqsgM2nMQ7gqYdn7aCB/QcZRDWwx+vJuIcf
         POR3fNpVsuvRMZY2YqfxNr9qjCC9DyqDXpL7Cy7EkCOLG4SaCP6JWeAxH4yuy1DbNoiq
         8dNY9HcsngPAMNWrSQSWHhZ4nmRdc2T2wHC/ADI05owtWHjalSt9LPwXkNhfMkoBpcmk
         5yBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q55OKyMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si2465291ilm.97.2021.03.18.14.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 14:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q55OKyMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMzyQ-0003wo-CT
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 17:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMzyB-0003wZ-SF
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 17:14:15 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMzy7-0006lO-4C
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 17:14:15 -0400
Received: by mail-oi1-x231.google.com with SMTP id d133so2481924oib.3
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gVKvW9rSAO0dP3lXSgeqfRbuP0yqwxlRmxb/jqCOt4M=;
 b=q55OKyMG1rL0820gm9Datyd7qhzduf3lapMX9RSOVKKCNOW4qevj8kBhf07hrmzkMi
 kySqgM+cJhBADWSCmpzWrbBKrrQxnbkvMFWqP+XnJoIak9fl9VzzwJSz6BxvE2Sdjf2b
 4D5nIRrp1IrH8AwAhr7nWLF59M3YlFl2gbOVmFnboUE1lsq75uEWWpOWMumFLH/qcwQn
 7JxiRSofCqJjQWHfkXoxaGq75M3O6ZrRiW5Bk98XFj/zJS7HxgEypV9lLuVhdvghKL4f
 TJ0143GcXDHTXxSmhUadM0Seyeb5GdvNMGs9kO2qQjZUa7dMtz8EmCzMP8DsJmV01x/8
 HkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gVKvW9rSAO0dP3lXSgeqfRbuP0yqwxlRmxb/jqCOt4M=;
 b=XkwFcDLpOCFfy7BqNoLbgg0J/pEIJ8kSVmpjVR3x+I3GvUe5qyB+J7tr0xZfv2vUpZ
 e5bd3yTeGrpetydyORQF21uJe0d94JbiUAb4Vu9IBJpoyRskiHWDh1YTHs0uhKFKOAzR
 +ry8aXovCUTlSfDkXMQ+1y2XYyb4sEO3vq9zdrLkQ/GAxbUNmpkKre29VVH1pp2S9hKG
 eCtXDcOnD8JhchiV2O57XeorLESad2UDyMfoJGWQ/pWfRa+hLr1W/bLV8xZTC0L1aw5p
 8XMCrbCgCz152Aa+Q6/7YFw382rrjdBUENZeeTGE98X+G9jDUX3IEie16UhhPevV8al3
 weJg==
X-Gm-Message-State: AOAM533tTzg3Bu6wvDA2D+5HhKHA2ASv//Nh68+rQGChf0oeB/qm+MCi
 RM6mFMOD/aLqofZqyPhNWLY25w==
X-Received: by 2002:aca:3058:: with SMTP id w85mr4516774oiw.19.1616102049429; 
 Thu, 18 Mar 2021 14:14:09 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w11sm800129ooc.35.2021.03.18.14.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 14:14:08 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
 <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
 <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec96b321-80d4-948d-b482-dfad61eff67f@linaro.org>
Date: Thu, 18 Mar 2021 15:14:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7vrcfPF1P4lD

On 3/18/21 1:02 PM, Peter Maydell wrote:
>>> +     * Note that we do not check @as against the 'as' member in the
>>> +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
>>> +     * AddressSpace which the rom blob should be written to...
...
>> Should you really have this special case?  Nowhere is this going to verify that
>> @addr is in @as.
> 
> It's the "happens almost all the time" case. Nothing verifies
> that @addr is in @as anyway -- see the "Note that" part of the
> comment above.

The comment explains why we don't examine Rom::as.
But we do check @addr vs @as via @as -> @fv -> flatview_translate.


r~
