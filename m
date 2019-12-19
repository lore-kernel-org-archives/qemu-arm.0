Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2542740lff;
        Thu, 19 Dec 2019 09:55:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwskGw9aL8q6wCzsCLtTi2HmlgbfDj/AuHdDFQFtCDrv0zUsOXs2kOfOIUWmUpruuqCYvPA
X-Received: by 2002:a05:6830:1e5c:: with SMTP id e28mr10285030otj.293.1576778142181;
        Thu, 19 Dec 2019 09:55:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576778142; cv=none;
        d=google.com; s=arc-20160816;
        b=FeRS1lJwjO9B2vuSgnd8xNxcYpQB2mW6ajAEbgCGwmE3SEWskooZ147w/HzEzVE/vu
         XJyh+vUneyPEGB1eiijy68CTHxBt8prV6ewJCcGzdH6r3w+sdQvUj9ZPoEjAcj3XMhWS
         Icg7tFVnuZ2X5QX5SO4FodAnpMT8F4a0rhYzZQxfhtX7CGZN9gGf7svCPS4I6dycHYEX
         xib6UL15cB6rNG21q4ewu1Zlt4jqgLP7xV+G8/hd/MSHOmkNGhMG0laIrPfsRNbmvS96
         qM/7PO69Gj3jI70rwxox58284gXipAIBwpn0SSFVWHjuEDLHR6b/+sBfqWcMqojwq0VZ
         2kiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4r1dJHdQo0OjsGUYx+/2Vrzn84OYJujOtfe17Ka8aVE=;
        b=MUpx5LxLiftZjncuaOiXBSv1RvqLqyqxtDFe3fI9/N/2hvHaYs6mHkPAPRRRIykq7C
         Aznldcvbixe3cIsfWC3pnDujxhDmqEG/jguH4qbb/f7v2Wr2KkL5a/pcI4HRJKcqvjRr
         iEcTm6hD8jpAxL68M2a9IieH0GO0fytcfurbSl0eN8q6zQfirgyX5m7TOAJyZDIjuR31
         5pIxvbqIJu8//W+EASDTbkAFPYRi/2tix7xiIlvC9w9fCa81wRxTUb8FKmLg2qZe4nqN
         493L4NffoXplfZxpM9EEJ69LBJE+/O1cMM6w/ElV3qMulqPVCAeLNt/T3S7l4UOab8w7
         WsAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R7m8dzSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a205si3478207oii.95.2019.12.19.09.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 09:55:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R7m8dzSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii01U-0002iQ-Nj
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 12:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihzx4-0003yZ-Jd
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 12:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihzx3-0004zV-JF
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 12:51:06 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35803)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihzx3-0004tc-8s
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 12:51:05 -0500
Received: by mail-pg1-x542.google.com with SMTP id l24so3516408pgk.2
 for <qemu-arm@nongnu.org>; Thu, 19 Dec 2019 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4r1dJHdQo0OjsGUYx+/2Vrzn84OYJujOtfe17Ka8aVE=;
 b=R7m8dzSXDXUEWY8YDLMUipwCYPic6/eXVvFpCcf+FFwBSwrjL/GH3xJrXv8E+nq6C9
 xxrPvYbL8zbsWC9TijBP5toRPx7yXUKrnYuPRJsAG5rfGquefKqCs4QSLE7kiR5h0Zgv
 +Hq88OpkYenBEYgaoOh3dTkb488LL/wKRgOO+vwhUO5DFBYp73iaqHDLoVIJxKKl/fP5
 RSJDFbSmqXTzKWsfeGHvuAAyovmTfTBm2HfrLu1zKwuDZ6OQBhdN+aycelVE/0L3fsgj
 EXOgBIKOkkBQBMR8qHfo/Zp9y5dbfqPp+C0x+sV5+/HHz9xmwR81jhqSDOofnV9paz89
 SVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4r1dJHdQo0OjsGUYx+/2Vrzn84OYJujOtfe17Ka8aVE=;
 b=nIozfe0/I/N1FDJAtOolqj0I2dwjYAm4axI7pXf3/RtjXaiqciGuoEO1yY/hKJ2YrA
 OTEFWsnVSkgAN8AzLt5RL9w0wjSIDBFilkZv8NeIW5NJ7bNomForeyGF0Rf/KaOy38T2
 uGScvEEb6VcV+/QHn8AN1aCZJeaa+1jAygyNrwkFsu0i1UC1IXHT+O934rsbnSRNYkdV
 wT5ksG9RD+86n+DkjUdEumSl2kBm/r/nJ8nHDyOccjKcFNOa6eiNdyMkAOL58qI8YlIv
 /xdjSeZqEUTgiOwWVmP0j8orUoN7jTv/nK2wMhs6MZS/APW+4dU24szg5nf/M1RaKLrP
 Hoxg==
X-Gm-Message-State: APjAAAXQlaD872kFSAvbuAKOe7KPICzw6ijvtMJJJ3vls5WYLyIirWpu
 z5C3ishMsrZbqBIVAtPYW64Vag==
X-Received: by 2002:a63:4d4c:: with SMTP id n12mr10509796pgl.212.1576777863828; 
 Thu, 19 Dec 2019 09:51:03 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:9de9:bce2:6ae3:53c4?
 ([2605:e000:c74f:dc00:9de9:bce2:6ae3:53c4])
 by smtp.gmail.com with ESMTPSA id r1sm8091054pgp.15.2019.12.19.09.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 09:51:03 -0800 (PST)
Subject: Re: [PATCH] target/arm: fix IL bit for data abort exceptions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191217210230.99559-1-jeff.kubascik@dornerworks.com>
 <7a274247-e593-5828-73f8-2042971e8633@linaro.org>
 <CAFEAcA8Egy=Jkw8yKSumkeX=+Qxi8bPy-0fJjopHR6gCmz3FLQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64d31889-6269-1f6d-6aad-8e863310cf79@linaro.org>
Date: Thu, 19 Dec 2019 07:50:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Egy=Jkw8yKSumkeX=+Qxi8bPy-0fJjopHR6gCmz3FLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KxNYlQ+Qxb9F

On 12/19/19 2:43 AM, Peter Maydell wrote:
> I think this is a regression introduced in commit 46beb58efbb8a2a32
> when we converted the Thumb decoder over to decodetree. Before that
> 16 bit Thumb insns were in a different place in the old decoder and
> the 16-bit Thumb path passed ISSIs16Bit in with its issflags.
> (We should cc: qemu-stable@nongnu.org on the fix for this.)

Oops, yes, that would be my fault.

>>>      /* ISS not valid if writeback */
>>>      if (p && !w) {
>>> -        ret = rd;
>>> +        ret = rd | (s->is_16bit ? ISSIs16Bit : 0);
>>>      } else {
>>>          ret = ISSInvalid;
>>>      }
> 
> Rather than setting an is_16bit flag, we could just use
> "dc->base.pc_next - dc->pc_curr == 2", couldn't we?

We could, yes.


r~
