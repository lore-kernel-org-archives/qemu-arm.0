Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1295914lff;
        Wed, 18 Dec 2019 12:31:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqw81hmy/VX59LOaG/xG+GXJaNcWnLAyo/jUqUx5nPPEr/jgFjfGODkStH73mJpjAO2/R3lk
X-Received: by 2002:a0c:b034:: with SMTP id k49mr4370491qvc.144.1576701069734;
        Wed, 18 Dec 2019 12:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576701069; cv=none;
        d=google.com; s=arc-20160816;
        b=JC8805m3bkkDvrRN68ZBG3l7Z5785X5t4mHZp/6eH6uMKbBuP7xvcQDU6L80SpAdQX
         vESkjadirwF3z8D/QYddOy2WJ0j6KdC/2AAinG/D7Bjo83vsxuBIRIbOIBVkOGoDsKBu
         5VigIicINjIMRnNyIUG+h3IJqcBZyRsJ+Th7EpPiAZ1mRCJz95VAFtvncvftdoDbRQwp
         StlBrK5GzHLEXEeE8ywhbSg/AEtZ5W6Vw13MWPW0bdqFg3cV2oe6cgGVRtg36VWG/RFZ
         6/FVO1UxkRZMkoNG1PLnI4cRPK4Gh54iP4U0BOK5GB1owGGBPC10Ll/FOMQLR/8n3kA8
         8ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Zwl2+Ft+3Qu+jRfq+fQCSw9Ftp5WH4Fwu9KoZnjQnYQ=;
        b=0ASghv5dauP/7gWVJLiSaG9EIRJ0uaXriHPnsF7+VhnbAAYvHFraMA0fMnv1GQdGqL
         ffyftBHXJic1Qag8Uk1XVGrPKpTYgjlAJb/LUVEZ34zXNo8mHnMxdYRWzJZACq/M5xYz
         ae0GjcRDbRxrlU9OGt3Sf4qSLtKpOwujg5N7iuSmRYs2Z1Kes1zitaUVsrJd4BMHCOUX
         cdPUqdUOOeHoXJKC9C+efnl80V05tKuDI2SZMDLvBELGth85Pu6ztI1E7IB5yQ57PbHr
         ONrHWHEEYcBu6emYdht/UNWvgJ7rPmmW4ystqZptIOfvwUQViLNzvyDR6XEOfGcW78hK
         66LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDS+QciK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si2058978qvy.181.2019.12.18.12.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 12:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDS+QciK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihfyP-0006eY-0C
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 15:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihfyB-0006eE-U7
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 15:30:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihfy7-0004Vh-UC
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 15:30:53 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46168)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihfy6-0004SG-4Q
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 15:30:51 -0500
Received: by mail-pf1-x444.google.com with SMTP id y14so1833309pfm.13
 for <qemu-arm@nongnu.org>; Wed, 18 Dec 2019 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zwl2+Ft+3Qu+jRfq+fQCSw9Ftp5WH4Fwu9KoZnjQnYQ=;
 b=wDS+QciKsWnATGZ3S7yh04TBaSWMvEFWXTR0MnNheetTSCV7jjDK9sPngID3T5UJCP
 YpefQwyT2xKKNs5Q+vNcteHdw05WCiNKWtOTDsbtob+xAy7fkkTq9IS+LCoYyfhNOixK
 8QoOmTu41zPi8aQ6Dr+7OORkEvsvApj5Yqu1lHOSV+2tAu/nTibTUGxwiunF2WA10Jak
 GGGLbL20aU8OqUbL4YuSQ1AX7qMQVaEmKyoNw/XV9buZ7MG6xpqPR46FkRpV/idI+MPJ
 YwY3hCb1WTgGa87t/RGjsTAdsOs05i9vdBqgzeY4bY+WpbfixoYaZH9DZShAo8AnXpjP
 52kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zwl2+Ft+3Qu+jRfq+fQCSw9Ftp5WH4Fwu9KoZnjQnYQ=;
 b=Ca7dZCO6gcR/D9XPl6rxJ6Momrr/jjAxF2zBegerAUxJdMg+rRxGwZg4IHsFu7+4UE
 L17ilwSLMf1byTS6aer0rWXui8ERAEVuK4ANQNiTMCXAmhRSKwmUoe1PpNiqGgzblL1u
 kXRqHbUVHsDQ35se24dzMdb0AVSCzkpaHWHimAWgrVt+5e3d8r6JrFai5p0PUr8NiT7q
 e0zB6Qcn2yv2P9cuMIsNWxOrqeOX0SRHJxkFrvn2Gmx2YTksVwJdu6VG4l3+vjRU1akP
 FBtALx2FHeKmwM53bhktBhWDbuXOgqvU28GO1CV8iwR/z8gVLu7rGIEiwph6Z/PBWJhr
 2EwA==
X-Gm-Message-State: APjAAAUhER5AtQKmWGVIaQgAjaQtIGLtPTTB6czbWQ0Q/Ki3JIfkSadE
 PeQ8brIMfafI8eDfVy8/IwyyQQ==
X-Received: by 2002:a62:e30f:: with SMTP id g15mr5103872pfh.124.1576701048672; 
 Wed, 18 Dec 2019 12:30:48 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id g9sm4613637pfm.150.2019.12.18.12.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 12:30:47 -0800 (PST)
Subject: Re: [RFC PATCH v2 5/6] hw/net/imx_fec: Remove unuseful FALLTHROUGH
 comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b436a7de-45ed-d90e-9524-62261b5a0274@linaro.org>
Date: Wed, 18 Dec 2019 10:30:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218192526.13845-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k+CbvSF36o3t

On 12/18/19 9:25 AM, Philippe Mathieu-Daudé wrote:
> We don't need to explicit these obvious switch fall through
> comments. Stay consistent with the rest of the codebase.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/net/imx_fec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
