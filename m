Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2785614njb;
        Mon, 3 Mar 2025 09:58:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGHlFF1w82VmAc76M0hBudtIhV5Kru1RGoM7c+fi4OLbduu8xRafrg4w6VcU7c8KgpVVh0HACn2pOHfg==@linaro.org
X-Google-Smtp-Source: AGHT+IEVqMvrgE1Qa7W6BPowG7dxY+thF8YW2dBT7nEUkYIuZSDwefO9ygKyFKTYqqHgTqy9Te5X
X-Received: by 2002:a05:6214:e62:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6e8a0ccd0ccmr193889306d6.8.1741024706154;
        Mon, 03 Mar 2025 09:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741024706; cv=none;
        d=google.com; s=arc-20240605;
        b=j6wN992PPZ6RCkbDJ4cY/Qyf1gRFVTZbu0UgMu6vZkm9xUkgpMI55SB+qNcMIvIOLe
         ts20HO9LJFZFOo8HEr5sQ3/SnsOYz2XmyRe4uVnbvptokZO3ROTo7/k5LQyLGBwSBvbQ
         jvCYFe4FD3tjoWkj/NFPbEnwixN8EZeUXEJsPoZn1qPx/jdlnmKW+4wjlPSUh9vF8RwB
         Zk/Ge3ENPd5rR3ULBSpBsNdlkaEXJZVtN1H+xP7Iu9v7MBcTYbs2sHA7gCZRThyFIHqB
         UkA3U3Peho8oXV5n7R/xgjSNSNnXA9RYwgoy+S3BFufrzu2XxkZh9HgvfIutRcNqzKvP
         GwBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ig1O+P684D2zxZDZEH1iwaJLNZ3uO/yV94Srxs0Fy5c=;
        fh=i4sb1qJkjjuHChgJ+4D90x+Mw8TPxHecTv2RTnaFk+s=;
        b=C6wh7VCcirVuXvZnkGWLLY4dL57D5o+G8RLoJ8yEaEw+gqnQa25u5ot+vBpvzAxFRL
         m4+AXyyYgJfjiZ2VUNGtrWS4pVhtVuQ0B3r+FZjGQFe992PAW1IzD0RntIaMqamXFzly
         WIopRWJBxhJyggIFwX43iqWLdQ2y4ZKcwol9yU4Y/xvVVcJESehDBw4xHDRDeO/rf7ot
         OTa7bRxL3S14Qw3fMDBbigHLwkLe8dBbxrCPtUXtBw6QN82H39TscxHdXCxFzph0Ngon
         QnCRFpqEgrlbpGCnuk/aDsMW3dAtbQi2vjl7SuJWWCcaZ7lnzvkSk/Q1lCF+HjdAuvVk
         Wxnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IaxQHXRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976009b4si92335516d6.116.2025.03.03.09.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 09:58:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IaxQHXRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpA02-0004ZA-T5; Mon, 03 Mar 2025 12:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp9zl-0003wq-Fe
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 12:54:28 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp9zj-0000Rx-H0
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 12:54:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43bc48ff815so6809535e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 09:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741024461; x=1741629261; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ig1O+P684D2zxZDZEH1iwaJLNZ3uO/yV94Srxs0Fy5c=;
 b=IaxQHXRLlfDIvx0bDIEifkyqqokGVEXrGmFgw2Htth4qDgPtLNCuoogqwafRwwCeXk
 pqLErCjtQENLTbkD9jj+zYKLO4OIbxPFsOuRrVPfiiqH2GmDg3H0t34PiXOIU5uQzT9V
 mYrO4uDmtHFqPEaH+tjbbd6oS7l6/JX2mcQCzeeO5wtt+G93CyL0mOV400g7E1LaSOBE
 9wgy5oCe0NYXTkMfzHYVZIeR6353LODMF1H74UP/U+F3D/5/64W0X5cMbHix5XyYbJGf
 YSlNkFeHsasX67O9gVEI6UmRTWsqMaifVer2sJQ7HJls+OB7GDiGBshgd41WRHBq/Qwi
 qkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741024461; x=1741629261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ig1O+P684D2zxZDZEH1iwaJLNZ3uO/yV94Srxs0Fy5c=;
 b=OXZ7NYd9ZA07D4t05OAxNWiB9DnR/UPJRZicq4U1IXuH6EBW5mW555H5P18SJvGuLK
 GyjdsS1AjZGPh3xkkpuZblaFcCyPNNLYGTtUT6A4zeMpwWR9jxds7rhOL1YXzD8ohK6J
 VkgqQyJwwlAb9TUEQNbJW7WTG3sxuavA21BnNcbk501pu+4coE8u6OZmfoV88dZsxevS
 DvpZPBDCOGR8oKs8M6g5/4AdoHCTm+neN3G8ThAgpugX4JmKbtJpDz5/aWu4LsBxs298
 cPdahDjUyDO278qjHoRH6fRaSsgEhke+7VbpLZuEF/NNG6xbCzbB/e6MJ/tf4up7nYTW
 AT2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnLTFlKOu/xWxLn8vgYnnmoaea3HAneeyUBdRn6ivbWzT9GVxxkAYoDdAlz7dHT1Q3ktIHc4VJ9Q==@nongnu.org
X-Gm-Message-State: AOJu0YzdowoZMyclxELphPczN/uCDDCoxMEXuqRYD3shloJaXZe/JNC1
 Tju6C++zViHWUSSzSHmXArzZnktItEQK6xFQaXnPXN3ZZzC8mj5u/IlKn6rS//c=
X-Gm-Gg: ASbGncvQvVrq7tvJ9e5ISuw0AbPWFkCsMuULHej5eulXUDW3NlXkNZXR6Y/DGenj8x0
 F/C7GLKGVZR9sGIOhNGmNRYRrpf69OH9VMxXQox0fSZI/sXd1gHHWLfFgM6JJYOgvC95Caq7fUz
 l3P76LRtCCmWP7Lkj03EjQ7tZB8Aekp6QcIyB7MyUHAtQYyl1jgxOZJt9tPdTMXkJYsbOO3k0AY
 eF1CMZKCe/cwSZztlbvp8BWmO3WT+2fIR4k+5fK1hjpuYJA6ydqv9JOaGOxd7e5Okiz7WXavUc3
 Mkn0O8nxWXkl6WAaSvAcDAw+kLWdgwDBXCC8Rl0UUBtMw/jtq+ISjjv69yIFKYCQl3Jk0WlIZKA
 Oun9sc5fGsfkB
X-Received: by 2002:a05:600c:a403:b0:43b:bfa7:c7d with SMTP id
 5b1f17b1804b1-43bcae04e3cmr1971915e9.2.1741024461181; 
 Mon, 03 Mar 2025 09:54:21 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc2d76c9esm39334795e9.26.2025.03.03.09.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 09:54:20 -0800 (PST)
Message-ID: <54399bc5-2dc8-4494-a501-ddfbabf4699b@linaro.org>
Date: Mon, 3 Mar 2025 18:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 04/11] hw/misc/pvpanic: Add MMIO interface
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Alexander Graf
 <graf@amazon.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250112210056.16658-1-phil@philjordan.eu>
 <20250112210056.16658-5-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250112210056.16658-5-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: zdvb8Iezcb9i

On 12/1/25 22:00, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> In addition to the ISA and PCI variants of pvpanic, let's add an MMIO
> platform device that we can use in embedded arm environments.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> 
> v3:
>   * Rebased on upstream, updated a header path
> 
> v15:
>   * Constified the property table.
> 
> v16:
>   * Removed the DEFINE_PROP_END_OF_LIST marker to match recent upstream
>     changes.
> 
>   hw/misc/Kconfig           |  4 +++
>   hw/misc/meson.build       |  1 +
>   hw/misc/pvpanic-mmio.c    | 60 +++++++++++++++++++++++++++++++++++++++

Missing MAINTAINERS update, who is going to maintain this file?

I could add it within the vmapple section in the next patch, but I'd
rather pvpanic have its own entry covering all variants.

>   include/hw/misc/pvpanic.h |  1 +
>   4 files changed, 66 insertions(+)
>   create mode 100644 hw/misc/pvpanic-mmio.c

