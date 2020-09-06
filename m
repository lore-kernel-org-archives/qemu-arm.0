Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2739177lfc;
        Sat, 5 Sep 2020 21:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf6qsJfNFMtltdWr7RI/T/gLcXKwE3jhJWnOByoBmHMUE4h9ilNNDvfgu19dVQUyGHH3+L
X-Received: by 2002:a5b:186:: with SMTP id r6mr19829168ybl.295.1599364992041;
        Sat, 05 Sep 2020 21:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599364992; cv=none;
        d=google.com; s=arc-20160816;
        b=PyYd/Jm4qyQKhtAGJoJ7d8X9sinzEONq9KmB1hwSQXA3bGyWDIU5KNbM/bxHmAjLA/
         AUMXdyXyIxELO9cNQWrwOpwJp+VxzA6zGiJPKsB9QFIYxLIMrfbccwYN7cpCyZ4ycoqm
         Sp0+is7QVlKJuLDoyt0NxLYW929qQD14zrvMJUrHdhhn9F7v0qrJkAyiNI0YMRriuGjY
         q36BhLgqiTZ8gnQ0M4xkTZwd2dEplHV2+iD8+P9aWrV9Lc5nD2RUpvEmfViXbEE2Ce/8
         Thj4vASC9ofiNcIcCcedntrcikqO4/8L84blLy3sGHBqlE+ZXy4O5WeDIWg/dQyeNDo3
         nf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=F/yrApjoieedPs4WcscGvUC363fGK8G23iY++bTYdgE=;
        b=Rs81yd2B13OZf3GVv4gOOEl5GXgbTjTMdmPFRgOmkB0tPB9JWQ8mWt5VnKBYhAkzEj
         w4M+tSe8LMeKkOCufInr28FZt31Dxx4Ws7KipjdR8M7p9HQ2bvQY7l3z3hWScBZ+Zuqq
         ZdcPLbEufL/Y36hE0VjLZSKvD9VVOC6zOVb213m7PIXSnq66kMqLNNMgbYR33SWtoU8v
         TbzZjaj3pvDq3F9u7yz+S9HKeYZ08aV9WRHc2zZ75RsFa6RuYNaP1piuDvzEbrPc/vF7
         3Wrd6ZxX50k3R1ie2KPVBBDDyaZdUleW9R5lmBTBnQ2QfXMoml5K9OzbAWCu4ODcLKtK
         GBhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l2dkmEpZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si11362117ybe.375.2020.09.05.21.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 21:03:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l2dkmEpZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEltX-0002uU-Dv
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 00:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEltK-0002qq-MF
 for qemu-arm@nongnu.org; Sun, 06 Sep 2020 00:02:58 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:35053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEltI-0005VH-Hc
 for qemu-arm@nongnu.org; Sun, 06 Sep 2020 00:02:58 -0400
Received: by mail-pj1-x1043.google.com with SMTP id g6so4854066pjl.0
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F/yrApjoieedPs4WcscGvUC363fGK8G23iY++bTYdgE=;
 b=l2dkmEpZsjqcHGt4C0xrTxC7E3zLVKk8+LXfF6lxIqn2fv6dUFn/JIGDYKsRt0MxKC
 6LfxZFppnJthDaJbX3wHp19Cth5/VwK64RruP0nnLIuEuEDlj5w31V8FTtl8t+FOmp7t
 +V1CIIlQN4iKz414Ux0SuZ1yv5uEm6ehOKksIegQ3mDTXCGgimPtQ08pZaHNMAjViVNf
 yUTelo0E6uNzjMXaHR3a0rvMYiIYf/IZ7jzkzIZo/YUHUAk0R1MgnU99QcbioqBkhhua
 tCv0o6stg0rGKZsFhgXWW2Q/S3UpZU3FlvqJkzSvyXY+MrN2eDeD/CO8A4fe+CjOesh3
 NjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F/yrApjoieedPs4WcscGvUC363fGK8G23iY++bTYdgE=;
 b=ghGnrSmZ7mhAChxIFBhqs/+9JQGKQ/1i7fyU7M1TA2m7PFEyQjtvCGVl1cFy9DpOcY
 e6MTb8VK1ZqIYgRyDqqVDvQ4iYqtYUWEmdVEr/S5HjxNwQDkxcawn2YrQbemka2T5zDU
 e7rRtYHcjzT/mUiFMmTCkWS72Pg9Qn/k6N1RpPxdklg1oIL+Vy+vFqRtu3KdbJoh/hxF
 mMwB5LB94zAiNWJuDeH1jfAkDgjL1f+09tCBglA01s6P7ev4+zOVEFfhLylinOKUk9J8
 KdBuh4vO1pAc7EuAWF7N5yl8RMTlhU2l5/vVb3NjfyylQfEKczKp6u90cfnVPxNNy51P
 uXXA==
X-Gm-Message-State: AOAM532wTAXRILUuvXsNvMyMFrjVBjH/S1ilbTLzeDaSZ3QBhJNi1ZlF
 C5xu8U9XYRYp2PftG0yKL6B7+g==
X-Received: by 2002:a17:90b:f09:: with SMTP id
 br9mr14610755pjb.102.1599364975234; 
 Sat, 05 Sep 2020 21:02:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e1sm10906425pfn.78.2020.09.05.21.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 21:02:54 -0700 (PDT)
Subject: Re: [PATCH 11/13] dma: Let dma_memory_rw() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce74259a-b1f8-8f28-b496-5b422e502f17@linaro.org>
Date: Sat, 5 Sep 2020 21:02:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zub+6RygAKQK

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling
> dma_memory_rw().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/pci/pci.h |  3 ++-
>  include/sysemu/dma.h | 11 ++++++-----
>  dma-helpers.c        |  3 ++-
>  hw/intc/spapr_xive.c |  3 ++-
>  hw/usb/hcd-ohci.c    | 10 ++++++----
>  5 files changed, 18 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

