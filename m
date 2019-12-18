Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1474037lff;
        Wed, 18 Dec 2019 15:28:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJKq+iilIfsmsAu2fDCZqs/cz5/rKtPDcCd5TASTrU89gLK6KmTlHYxNrf4yvcLBjqaM55
X-Received: by 2002:a05:6830:1715:: with SMTP id 21mr5489552otk.67.1576711703219;
        Wed, 18 Dec 2019 15:28:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576711703; cv=none;
        d=google.com; s=arc-20160816;
        b=QVcMe3f/quVMnhZeNosXxbMPi+EGM61Ek0aY8eczxi75Hf3LbAuczdplrFc3ZrfYA7
         Y0W7y5axnyjYQo7goHa9w9XKLDagRNkp0yaUUBXvMdmITIiy4kMOYwPNTEV2s1YSaSBk
         UaYkE/+m2cXZE+YkMuHFRwBRapZPBWo6dEu91N2ao8Q8o6T5otAGnQQLaMbH1/SMFJUQ
         waUcCLY7oxxSGgLvXiZ7QlzEc7iYWwPpl62PksM9XsN2tGoPWLG32iwP41fGvsEfmBRo
         DWM3lGgvS+N7bn4xKJFHOYZ+qEjOkZGeDU2v/D697YJUFBSG7WylKjGIY5PGeJOrGUYz
         EW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Eren9MLX7bzFjzWNgpuKzO0ZxiULws5PT2XeNzaV3mk=;
        b=b77a4bz0gtKcF117+KJT8MmNiRrAaWIHm00BQbB1/flpFRncRecpAUlgs8EW2peYQU
         HjyzAuDhX40tIhOWiSo0yc48gk3YxL/S0eiEl3fAiPSLyR3OgE/N15J4BeGtdy7QoIH4
         QgUM0IMyCE/fqe4g9XyC4hJouNMlFdtIJU8z/3mNF7vj1b8CM+DR91LDIs5ohm9mlUt8
         XYkjAN99xsXed+4NxXpQ9pVqUnzLC3mV7y5pPLFf8kjxonT9xPOqGEErjOaAMCdZoeNb
         /PYZ+D7p4nhrJ07jc8hBwU9cXzuKJJNixTRtMhk6yL5L/j5JZ1MgDsOFHOaoeNPBkKeR
         XXuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vt7d/Wjx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si2241992otq.317.2019.12.18.15.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 15:28:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vt7d/Wjx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihiju-0002pH-7m
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 18:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihihM-0007j6-P3
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 18:25:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihihL-0003lu-D6
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 18:25:44 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42489)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihihL-0003kQ-5n
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 18:25:43 -0500
Received: by mail-pg1-x542.google.com with SMTP id s64so2078436pgb.9
 for <qemu-arm@nongnu.org>; Wed, 18 Dec 2019 15:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Eren9MLX7bzFjzWNgpuKzO0ZxiULws5PT2XeNzaV3mk=;
 b=vt7d/WjxHgqZ4rfBM2Boqfjy0fqwZRtQnv6QVXOQfkKRb1RVQ7OBoYYrBA0e0zHO/v
 F1ILRgO982EiuNMkkflR3gIjfnQNIIwRsu1nihJEqaNxN+VDYmVRictlAlttajZ0sNUD
 l4HMhVBYYvsO72WcTiFOc3cT1Jxx9Xg3gygVPk98QkVgwWOC2h9RSPk59WpB5NNZwsv0
 hR6vVQUgafApwPiemnZcW7fXDdxN3yVRbyGNgy9yokLoaZpdBdnNkonhDnE1uF0hFYJf
 idRyj/eBBTmxHkdJdrmUfReOxcZwOpz8Sr+rQgPfoxR+h68En5+xIi9zutCxtpKuYufS
 yQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eren9MLX7bzFjzWNgpuKzO0ZxiULws5PT2XeNzaV3mk=;
 b=PGtqQ86t1MzdVT423vzpfN3oanNALnlrBww39ybak/XaN2n12PdNJKcFytpZXCFfez
 JQtoPTeW3mBllXm7cRDc7Agvdd39UItXAnv4DfwbGjaiEz6X8ITQ/M6ODRcc72Jyi8rT
 vv0VQPMT5gxup+8YMKwRTFKkgNF8ZYsB+sw1pg+7cIb9Ta56Oa+SNlGbtqrxJfJ73X1w
 qCUDRIdpdoU/8ONoz6Wn3XKEzXEH5zS1D4JJQzBSk9jXq4QUJGJqmuZwXilaGQFOoI8m
 GzAZkMBEQvlBDtxO0ACjggrXUUm9bTUHg/lZRqC3sUSpMKZsUgkkqr4n13RcnoZQhZeE
 15Yw==
X-Gm-Message-State: APjAAAXNwdnwurhvsd9OKoL/mjTw+L2Fe0Fp4HxF+jAtj+sMbvUMQ2XP
 q0/eqCnMdpgVnYs8i2K8pdriQA==
X-Received: by 2002:a63:d00f:: with SMTP id z15mr5779169pgf.143.1576711541896; 
 Wed, 18 Dec 2019 15:25:41 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id i127sm5108224pfe.54.2019.12.18.15.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 15:25:41 -0800 (PST)
Subject: Re: [PATCH v2 06/10] arm/arm-powerctl: rebuild hflags after setting
 CP15 bits in arm_set_cpu_on()
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191216233519.29030-1-nieklinnenbank@gmail.com>
 <20191216233519.29030-7-nieklinnenbank@gmail.com>
 <CAPan3WpW1Q3zpnqgk=MWRWe99=MQ4XoW2kw8L3tioFxfEBXd+Q@mail.gmail.com>
 <CAFEAcA8Viii4Em_bf4Y=AG0jU+EFFFTX6dO-52qd=RT4uHbCVw@mail.gmail.com>
 <19e4f2ac-6067-f61f-f340-108545fb0f02@linaro.org>
 <CAPan3WrcvE_43=3+b4Ybn==TEQcKj+F_VWjJRBJ6MyXNrcpUbw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ec61650-30e1-4377-6b22-5b6ef827e69c@linaro.org>
Date: Wed, 18 Dec 2019 13:25:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WrcvE_43=3+b4Ybn==TEQcKj+F_VWjJRBJ6MyXNrcpUbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KJDg0lJ0MKgS

On 12/18/19 11:01 AM, Niek Linnenbank wrote:
> Hello Richard,
> 
> On Tue, Dec 17, 2019 at 5:41 PM Richard Henderson <richard.henderson@linaro.org
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 12/17/19 6:12 AM, Peter Maydell wrote:
>     > Cc'ing Richard : this is one for you I think... (surely we
>     > need to rebuild the hflags from scratch when we power up
>     > a CPU anyway?)
> 
>     We do compute hflags from scratch in reset.
> 
>     It has also turned out that there were a few board models that poked at the
>     contents of the cpu and needed special help.  Some of that I would imagine
>     would be fixed properly with the multi-phase reset patches, where we could
>     rebuild hflags when *leaving* reset.
> 
>     In arm_set_cpu_on_async_work, we start by resetting the cpu and then start
>     poking at the contents of some system registers.  So, yes, we do need to
>     rebuild after doing that.  Also, I'm not sure how this function should fit into
>     the multi-phase reset future.
> 
> 
> Great, thanks a lot for confirming and clarifying this!
> You mention the multi-phase reset feature, is that going to replace the
> arm_set_cpu_on() functionality?

I don't think so, but I'm not sure.  As I said above, I don't immediately see
how arm_set_cpu_on() will integrate.

In any case, multi-phase reset is still pending, though I believe it is high on
Peter's priority queue for the 5.0 development cycle.


r~
