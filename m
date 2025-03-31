Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2425839njd;
        Mon, 31 Mar 2025 15:49:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzdo9+U7tUk3EjLKkh0G9c+VlshfHXUlM20jGQ4UC9dqdIaDYxI+Z3xwTtps9WzSh18n1xlVkwzPSuQA==@linaro.org
X-Google-Smtp-Source: AGHT+IEcfgNgwwNBHAmXEX8agvKOaLyPBji4xVQZQeWrIj/bJoqJiPIWBd61/Ub0xVuHWczQlE7V
X-Received: by 2002:a05:622a:15d2:b0:476:5fd5:4de6 with SMTP id d75a77b69052e-477ed67a657mr134021791cf.40.1743461394097;
        Mon, 31 Mar 2025 15:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743461394; cv=none;
        d=google.com; s=arc-20240605;
        b=Jv1VbR7uItck0wadWNDNuVe7GjYnh3zITpjiKMPG3i6GUbfr51dbb0au/2tQ+2Nem1
         UevT/7SUGB0jGbt+kRl3eUa2qr+nw60Uj797Muv5MW64jYjCgTI6tGLh1dFJWxsBx/6k
         UzW6WCwkD+JVdH3FauCjsTin+9bWrMhFud5yNh0q+gS/hVdEAd1O2Et8GP8kYTr7NwQJ
         DEAS381EToUWTVjc36fpsFsFKw2ug3MtFiAwOj12jq6HSResSXJn4X552TXet+3YGLuV
         6lBqIeEqYoLDFDy8H5SgzEoAtb2TWFpOHTQRTS5L6PnW+3Pd660xL1y37aZt8yvZHURk
         sYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dIgofOQ16FfHrqCR+n2/TXJ8ZAXHvNpoy3xWYKJ8Uns=;
        fh=7Zg3dJIBXu1DPuPHQMDPH2w325gKpns0ra7ayYkDT5M=;
        b=CzaUoU4WyIio2I33iVw8SbMC0BKPm9L4DxqdsGv34w8LDp+GhLxjE3DgNZhc0m9oN5
         Ou4s+8yvXcokly3fPYXw+WLL5kzMzeYJMerGNQi3FgETjREzmqxLskZ19CQKI+qM+STh
         04yM/nl9GJfHogdDZf0kXSif1xr0ERyFwu33HeCxI8hCXuctAtcdQfCsomKgU0Paj3wS
         jGl2VJ4wZss+pqqRfeNVdL8zRxIscRcswCThVSsbd3GJWjInEBaf08+Xbl79sfUvdhfw
         0guJko7PEHeACBVGJ9u1nJyyQX1hPb29F15h7A/gKnwtS3ZuW50+73cFanCgWdQVNV7S
         pBQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htahq61Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47782a5edf7si76892711cf.193.2025.03.31.15.49.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 15:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htahq61Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzNww-0002g8-To; Mon, 31 Mar 2025 18:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzNww-0002fm-3n
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 18:49:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzNwu-0003WX-5m
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 18:49:45 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso32431255e9.2
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 15:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743461382; x=1744066182; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dIgofOQ16FfHrqCR+n2/TXJ8ZAXHvNpoy3xWYKJ8Uns=;
 b=htahq61ZL0zMXNQ+GO5q6NClgw4EOpC22v+IT+QOtkRvbx1YB09r0ie5zpN2HST81J
 QNOWtuJypyXNLcbRFi9719xf8CXqr3RYOQzQl1CeYIvdNg1dtA2Zn27isPw1RecjpT+9
 5PrKTrXa//Yj2yaUZA21c2BKs4z+b3MQOmkcEESwD0Py5YX1hpQ3VNWxfBLdng97BQA5
 YceW8nZ/Pu1B4gMitSjH8cyLKJY4Fw/tVT2LNLcQ1rypohBwZpaqdibmoR0xtkGZKxlh
 TKY6Q3i8/Lfp4+x1dm+HcCQXuzDkJk3qu0QVUFyIgIPUdGSQuUKjv8cLZqrdN3lS5/s6
 hxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743461382; x=1744066182;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dIgofOQ16FfHrqCR+n2/TXJ8ZAXHvNpoy3xWYKJ8Uns=;
 b=Ulsg07vPYYdRoNs2zT1MM4TpUl3fZ5mUo4cZwZWYd5hGxfZws58SoCiQQtEgpONmKH
 PvxQZVMa+EKx3ZAYoc7gwdEN5T/GomeyKFZ8akrwoFR1wIdrhIv7Cj2NWIf73JXl59MN
 ya+ssOrhlQIQenqW/jGiowqgX70g4qC/vqvY9ujK3M/jfwvlATWBPEtSkCMSvdAyHY4X
 Mf5JxYQdRen+t9+9lqTQIFgH5xPJIUqHJQf+d41gsmTJ1bcsv+l5DpbKGov3K7D3FoOw
 9wp2rAuwvCJDll/XXAcDYNOJlJKnzOGX+hv8u4O+tWyKQ33Nkm+zzFtizCoz5ydM4HKr
 vfwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBnD9vlvjAP6M43OYyP6Y8xmEBMsQQLUXcVyfD9Pr/q/DBcwH/Qm+u77DfsCliHlClOpzltB9SIw==@nongnu.org
X-Gm-Message-State: AOJu0YzSu6nOuzj6xDKfOcOGNcvkaigI6Djarc1J237aJVdpdqu+RLeF
 5PCgn49ejl996EvVYTf9cWbBavUDEiylc5ca9BIrPIOPP0kqBFZSsY0WS9S1+VE=
X-Gm-Gg: ASbGncvL3Pc0ObRnXxGNWtC5X1pfdilBcVXK9rCMo8b8gYOMtfYRUdEIe+rnPikAfm9
 0cJwdLOWwZF1QezvWIm275ulh/ZPdmsMCAtO45wyzxmSp5fQ1rNQHKvMpfmqh6ABRQEd3z2FYMm
 2TadPes4Tc1MwBVqE0VlYm+edI7sOhwsu2wsSSOqTRl3ywR5XSktgz7kVosa52VqNmHc7ttDMxo
 NdYX2YHBL8gozudPjJ0+wvX0dgIL/9vm9xsEstVf4tLeQY20ZhiuQVKjNZnjEB34qeL6r1gBgP2
 McLve3xs0aDwQ4Kkt2YfovgYTB99CUnEBJ/y8mbUmqiWK5aStgyydtE3fZ/8AkrKsUayJ5uIxaf
 CbgKBreLmM5xk2GoJZ7+1Y9c=
X-Received: by 2002:a05:600c:468c:b0:43c:fa3f:8e5d with SMTP id
 5b1f17b1804b1-43db61b52e5mr111621165e9.2.1743461381918; 
 Mon, 31 Mar 2025 15:49:41 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4239sm12614094f8f.94.2025.03.31.15.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 15:49:41 -0700 (PDT)
Message-ID: <0b6fc8e8-e3a8-42a7-a38e-1008bac0ab42@linaro.org>
Date: Tue, 1 Apr 2025 00:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/aspeed: Correct minimum access size for all models
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
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_+YvS7zTuosAxK8zMgBTD01SRheAat7WbHsfLHCCFGcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: YupMVX6z5zIZ

Hi Joel,

On 19/11/24 11:29, Peter Maydell wrote:
> On Tue, 19 Nov 2024 at 02:53, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Mon, 18 Nov 2024 at 20:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Have you reviewed all the device read/write function
>>> implementations for these devices to check whether
>>> (a) changing the .valid value does the right thing, or
>>
>> I read the implementation of the read/write memory ops and I believe
>> it does the right thing. We want devices to accept reads that are of
>> any size, instead of returning an error.
>>
>>> (b) whether there are cases where we should instead
>>> be updating the implementation and setting the .impl
>>> min access size ?
>>
>> Reading the documentation for impl vs valid, we definitely want to set
>> valid to 1. There should be no machine check when performing byte
>> reads.
>>
>> I don't think we want to change .impl.min from the default of 1.
>>
>> I'm not sure if I've missed something that you're trying to point out.
>> Are there gotchas about setting valid.min=1 that I should know about?
> 
> The "gotcha" is that the memory system's implementation of the
> size 1 and 2 reads when .impl.min is 4 and .valid.min is 1
> (as for instance with aspeed_apb2opb_ops after this patch)
> is "read 4 bytes, return the relevant portion"
> and the implementation of size 1 and 2 writes is "pad the
> small value with zeroes at either end appropriately so it is
> 4 bytes and write that". That is often the right thing for
> the required behaviour of the device registers, but it is
> also quite common that it is the wrong behaviour. For instance
> for some devices the write of a byte is supposed to only modify
> that byte, and leave the other bytes of a 4-byte register alone.
> Or if the device has bit-clears-on-read behaviour for a register
> then the default handling will incorrectly do that for bits
> that the guest didn't actually read.
> 
> Conversely if the device leaves the .impl.min at its default 1
> and moves .valid.min from 4 to 1 (as with eg ftgmac100_ops)
> the device will now be called for byte reads and writes at any
> address in its range. If a write to, say, byte 3 of a 32-bit
> register is supposed to update bits [31:24], that won't happen
> unless the write function is changed (usually if there's a switch
> on offset the write to something that's not at a multiple-of-4
> will end up in the default "log an error" code path).
> 
> What this adds up to is that it's a bit misleading to have
> a single patch which changes the minimum access size for lots
> of devices at once, because for each device you need to look
> at QEMU's implementation of the read and write functions
> together with the spec of the device, and confirm that the
> right way to implement "byte writes are supported" for this
> particular device is to change .valid.min, and that you don't
> also need to make changes to the read or write function code
> at the same time or adjust .impl.min. Putting them all in one
> patch with no discussion in the commit message of the device
> behaviour and implementation was just a bit of a yellow flag
> to me that maybe this complexity wasn't considered.
> 
> If we get this wrong for one of these devices, it's also likely
> to be rather easier to bisect the problem if bisection
> can track it down to "we made this change to aspeed_timer"
> rather than "we made this change to a dozen devices all at once".

Could you respin splitting 1 device per patch?
