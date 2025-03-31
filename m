Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2433911njd;
        Mon, 31 Mar 2025 16:06:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2i8Di8PzxiIXNyKpj3S4SWpz1O2p6cxxI9drWRjeFV5vfRW0KS45uIfEip2pG/CFZQYqQxIOatrS9sg==@linaro.org
X-Google-Smtp-Source: AGHT+IFEEqZ5IFt50+vhEobUqHfQWSn9gFh5Adj5kXmX7Ak/CfAwD0TG5vviE9RSXAHgp2FWFabt
X-Received: by 2002:a05:6214:c8b:b0:6d8:6a74:ae68 with SMTP id 6a1803df08f44-6eef5ed41e7mr13889046d6.29.1743462419033;
        Mon, 31 Mar 2025 16:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743462419; cv=none;
        d=google.com; s=arc-20240605;
        b=IRiMM3wbQwb+G3n62iAVUn2PkWFp/WBz0eQV7bV9jSco94AOgKdebtAagFjhRgso7n
         3cXChiEFMclG8cbJdyBVHt3m+WLffhHhO42uYdsV74UzUfZns4xS6jop/ufGBsckHRp9
         XkwYZewyBMT61Aamifx9xi3XG/p22NYWyUvoyZ0U70dJsWoN+LysyoSLXjX2gJ6qGnTX
         kiS+AQMmMmffqPJjWpf9s8y4N1P7xryDAAyGdypcPw1zsnX9zv/CJ5P1oGvtfjBWzdC6
         bahHI9bsrWO7ZVAypXmFWG+0M8uF0R9URoSR0LAY/sBtNvvLeu3ke8Xwl/3+o+UE3eof
         9vHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=x3LjxVsqmmczyUtTPuboJvEOPPwDsRbo9Bic3ke0D94=;
        fh=4qYxbKLPmP2b57UzJgjGVs1r9M1WWWXb8yIBCAg84pQ=;
        b=VFRqch5wJqpfmoimOmdup675GFNaKHhhejflwyqECPXe+RuzgUtW68DHttLE/p6Xma
         d4IqFtegxtKIb6LJjQ42S7t25QmqPdI8JXv2SVo0uBuyjT/KJ/M1MGm0TRcWDQUHsJAY
         I9evFJ4DhKQ/OdRRfp+eHrLqi/qWU5J+cKItU0w1pyU2gqtd0WYRfuMLP2Y1wqZeJHk4
         jyVnTN4dPKMOK94lvAi0djMZVx/aL7VBX7bvI8v1sJsHdi39PeamFhnchoEJZMJep9DQ
         rNYDPFLQDeLPkEMaKZJUZ/+l0AI1hVF/Za6TYm8uOUIlsa+civ1w3/XGQD00QJ0R+1w8
         KALg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZj1BDQ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec9805dd6si76848626d6.505.2025.03.31.16.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 16:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZj1BDQ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzODa-0000al-8J; Mon, 31 Mar 2025 19:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzODY-0000a5-F9
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 19:06:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzODV-00063o-HL
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 19:06:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so55411275e9.3
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 16:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743462412; x=1744067212; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x3LjxVsqmmczyUtTPuboJvEOPPwDsRbo9Bic3ke0D94=;
 b=UZj1BDQ6KypS/NDRjj09FaIqItv20bzw2OF9zECZI6375vbAKpH2tnRjHORiYW9BaT
 1GA2z6lF6H1r4r9jzJ4gsGOkqYQ9j+v5DZFwxad7V8SCEvBVcZh6sp6hdWVxF5ugTtNJ
 P+7mzdaHng7Bp2NNy8nEhzTSb+w19KA86ZcIGe9loSYBNb+jhrfGv70LQU2t2ufFFj7s
 vsAJL7Dn/u2Oy4RwsReQVlMs53ej2SdT8Mv+7UzmY5mj9UaRNC9uhPHDYk7hEaaxHZzs
 hhBQaaxAhsp6k29DQvFv65lhKHsq3thqinI+Mzm5LqzjE6pXYqbtWB599M0uebl88ddR
 GOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743462412; x=1744067212;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x3LjxVsqmmczyUtTPuboJvEOPPwDsRbo9Bic3ke0D94=;
 b=orOB9Zs86OBf9WIHY8VGKd3UbVAXmaXfzqWs3L5FXOkjPZC7JdjdaKwidQayRmhxfo
 Wful2PaZrJHCy+CpFjW/tEpDcI7yEJh9k2G+ORtWB2Hik9Y8F6AtYoMOvtzC5GEdHkig
 +vtlok1wbP8Fni5hiF9Ww1sy9WJyfcdwP9Z2pbcXMe5u9DPggILwG9EvacDs0ABOdsX8
 k/OHS55v0HvNGdUBiaLi4gxEbNk2Iz93Y5JRTPDZKqBYN3DvfvqYcxr+hOge4sLuO3QU
 Crz5nKf+hNiXip/3AFa++BKs9fX/T+nihcOtXCYcbTOSORKIrRQvwI012ZBOvES93abQ
 ry0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa1jLqSNba+h9C93EZfgBXY95b3y31jT/ATxMacSt48+hhdnvNox3QSBcmTZ7qACsHzRnZNCYxJg==@nongnu.org
X-Gm-Message-State: AOJu0YwGhsuucCo74cPrea/n2wn52b+fL5B7T7vx+X9+fZCccrUZ4xI8
 /9T4IWYkoegqxtH4onBOLnwMwGXbe7XQLdPxGI54P41dXfs3bDPcEpJ/NPcY6qI=
X-Gm-Gg: ASbGncufoDqFxDD3uE+ze76PKhYt9C96rg3qDJ3mJrIhahxL6pFQPYGdaLI3Vzgk048
 EF3+/NcCy3UVFJ2DCrP1feHu/i1LBO6462rjPycPDDX5lpFNGWasNNBgrSJNldunfZOtWlkHN80
 koiLzOE2CeUx9ZPdHh/plbphMAFNmqsIVJdlJ4l2BYbK6/fabR9DkVRAhQBbeDm5YDt5dRq+uBV
 shmd2GgCSZ8GJo2SPhrkZkhqcxb0Z0h3oyOKk0AO8bRXYJJ97LMB8zF3KpgkiLyEae/q8gDn7B4
 B+RWdJMNKnX3+PgjgfH6zO2pZ9s+2ZGDxOGeBLi+toof1NHrEfS+AjGw8ETr8UUf2aifFOjc2Vi
 QBu9zPHGfaxML
X-Received: by 2002:a5d:47af:0:b0:391:4bf2:6f0d with SMTP id
 ffacd0b85a97d-39c1211d462mr8426715f8f.52.1743462411895; 
 Mon, 31 Mar 2025 16:06:51 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a41a9sm12764927f8f.90.2025.03.31.16.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 16:06:50 -0700 (PDT)
Message-ID: <02a9f971-34fb-4922-8644-146a93df57f8@linaro.org>
Date: Tue, 1 Apr 2025 01:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/aspeed: Correct minimum access size for all models
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 BMC-SW@aspeedtech.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20241118021820.4928-1-joel@jms.id.au>
 <CAFEAcA9tPhbjnJ6XjMcZq6iWS4i1BdrTB+=391L5UgaVSMkCLQ@mail.gmail.com>
 <CACPK8XeFP+fmws+tcG-qgz1WXyKAtMicpfcgDG-pd_jp8PLXwQ@mail.gmail.com>
 <CAFEAcA_+YvS7zTuosAxK8zMgBTD01SRheAat7WbHsfLHCCFGcA@mail.gmail.com>
 <0b6fc8e8-e3a8-42a7-a38e-1008bac0ab42@linaro.org>
Content-Language: en-US
In-Reply-To: <0b6fc8e8-e3a8-42a7-a38e-1008bac0ab42@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kgtVfZCO1X2y

On 1/4/25 00:49, Philippe Mathieu-Daudé wrote:
> Hi Joel,
> 
> On 19/11/24 11:29, Peter Maydell wrote:
>> On Tue, 19 Nov 2024 at 02:53, Joel Stanley <joel@jms.id.au> wrote:
>>>
>>> On Mon, 18 Nov 2024 at 20:40, Peter Maydell 
>>> <peter.maydell@linaro.org> wrote:
>>>> Have you reviewed all the device read/write function
>>>> implementations for these devices to check whether
>>>> (a) changing the .valid value does the right thing, or
>>>
>>> I read the implementation of the read/write memory ops and I believe
>>> it does the right thing. We want devices to accept reads that are of
>>> any size, instead of returning an error.
>>>
>>>> (b) whether there are cases where we should instead
>>>> be updating the implementation and setting the .impl
>>>> min access size ?
>>>
>>> Reading the documentation for impl vs valid, we definitely want to set
>>> valid to 1. There should be no machine check when performing byte
>>> reads.
>>>
>>> I don't think we want to change .impl.min from the default of 1.
>>>
>>> I'm not sure if I've missed something that you're trying to point out.
>>> Are there gotchas about setting valid.min=1 that I should know about?
>>
>> The "gotcha" is that the memory system's implementation of the
>> size 1 and 2 reads when .impl.min is 4 and .valid.min is 1
>> (as for instance with aspeed_apb2opb_ops after this patch)
>> is "read 4 bytes, return the relevant portion"
>> and the implementation of size 1 and 2 writes is "pad the
>> small value with zeroes at either end appropriately so it is
>> 4 bytes and write that". That is often the right thing for
>> the required behaviour of the device registers, but it is
>> also quite common that it is the wrong behaviour. For instance
>> for some devices the write of a byte is supposed to only modify
>> that byte, and leave the other bytes of a 4-byte register alone.
>> Or if the device has bit-clears-on-read behaviour for a register
>> then the default handling will incorrectly do that for bits
>> that the guest didn't actually read.
>>
>> Conversely if the device leaves the .impl.min at its default 1
>> and moves .valid.min from 4 to 1 (as with eg ftgmac100_ops)
>> the device will now be called for byte reads and writes at any
>> address in its range. If a write to, say, byte 3 of a 32-bit
>> register is supposed to update bits [31:24], that won't happen
>> unless the write function is changed (usually if there's a switch
>> on offset the write to something that's not at a multiple-of-4
>> will end up in the default "log an error" code path).
>>
>> What this adds up to is that it's a bit misleading to have
>> a single patch which changes the minimum access size for lots
>> of devices at once, because for each device you need to look
>> at QEMU's implementation of the read and write functions
>> together with the spec of the device, and confirm that the
>> right way to implement "byte writes are supported" for this
>> particular device is to change .valid.min, and that you don't
>> also need to make changes to the read or write function code
>> at the same time or adjust .impl.min. Putting them all in one
>> patch with no discussion in the commit message of the device
>> behaviour and implementation was just a bit of a yellow flag
>> to me that maybe this complexity wasn't considered.
>>
>> If we get this wrong for one of these devices, it's also likely
>> to be rather easier to bisect the problem if bisection
>> can track it down to "we made this change to aspeed_timer"
>> rather than "we made this change to a dozen devices all at once".
> 
> Could you respin splitting 1 device per patch?

I addressed Peter's concerns for the SCU only so we can get the
issue resolved for the next release:
https://lore.kernel.org/qemu-devel/20250331230444.88295-1-philmd@linaro.org/
