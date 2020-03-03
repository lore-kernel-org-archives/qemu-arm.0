Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp686058lfi;
        Tue, 3 Mar 2020 10:37:57 -0800 (PST)
X-Google-Smtp-Source: ADFU+vszTk94NhccIumYz0pR+I3rtAOmRT4wtE7o+YmL0gGR7JvruTkUXTx0iR99vmnBUe/m8ySK
X-Received: by 2002:a05:620a:1408:: with SMTP id d8mr5521110qkj.355.1583260677680;
        Tue, 03 Mar 2020 10:37:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583260677; cv=none;
        d=google.com; s=arc-20160816;
        b=j+Tzo0K2HfHNumOQNOLDOQUz2reldXyO6+wubdwsXfmIfn/NbYNZanobwgpYybApPK
         KnvxlzuzKnO8thLX4BNJ6e1Zk5Sxi4wV4NPx6SMiPHYKc6WkCcn+mlt/PVPo30Uuabxg
         cOMZcR7xOC7BFmqjx2MLSmFSSOVhC8PgJvlf5aILYptk6U4GOO3QvBLey8K0iPNED/ry
         Qex/Btc1cKm0LaQRqFsdNEs6yM3+jES7FUJ1KnhKjFeJOMExnhyIfINdpzTHMcGQLw1k
         eXYbWSEGCe9bZU6KXn1JLywFmQFBC4omgJAKHJ1K169U+bgD0dsHlq6LNYQCoo20jMpU
         2s8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=63rBGK/nMEIBUdxAll+/vgkzGgNNpLA2XYVed4iWRxM=;
        b=Bq/j71vYsDwux9KUMI66+Op+knwY4fztZhBF8jxnSR9XImw/4TZjhimfToFTAYt/lW
         mNbwwLjG7NhHz1zQSGVBQaIFWrdLx3+/OrsJ117d4SrBGBCiSKnfizUpmU3BmwYnRaU2
         8g0fjqGhJo2Srpq3ArlcIrPdWLvq6+p4X1thy/D9RLUARxuVlnbyVTGIgM757sIqgNoR
         A6zXI0LzTJ1ujEeMk4Hgl0HKYp84LiqJlrGWZYkHojx8JgQ6zdA6buTwcKPws6NXHLSH
         rGry8Ds/KS8mwfnhGf8hoZv9ZhLolFsl3hTmYXcG04u+xDGhmdEZEHzQi6ysL13gLNsU
         P7Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k2GzHesZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si457385qta.292.2020.03.03.10.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 10:37:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k2GzHesZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9CQW-0000SB-Vl
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 13:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CQO-0000P4-BC
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:37:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CQN-0002b8-Er
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:37:48 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9CQN-0002aw-89
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:37:47 -0500
Received: by mail-pf1-x442.google.com with SMTP id p14so1910972pfn.4
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 10:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=63rBGK/nMEIBUdxAll+/vgkzGgNNpLA2XYVed4iWRxM=;
 b=k2GzHesZ9swofwqeIqdsRxFDrp1tbpJR/vURrwN8gd67dFXNLBZY3elN0y/yxTImZo
 NRgBL0dXJ/MUnmPavSmuPDWefJP1bLNaoy9RJK6G9BzjvoG9P2zIURJ0GFYvgh69UKf7
 6IjroUcj6+e1Dpa7JgvQW/HT7ecOsy5qS3hGipsJwFKekwcdwNSKAMwfEM19hPnsR0HL
 UNrQu5QF7uUk6fFcrSZrpfbK6cEw2owh9wu0TcYob9NHTZkIwSwT/PS4ZicbLTtC7gWK
 aFnmJmHOZyxNPTKsXCUAqBJx55xACO5IYTzI7qmedfCICblI9sAWNTIm4eaBSWxwrijw
 Zq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=63rBGK/nMEIBUdxAll+/vgkzGgNNpLA2XYVed4iWRxM=;
 b=J3R6Boay5+PHe4fs3Fc3LfbVxT8C0IHDyLMJl8H/vyZHyejUArC5LsWuwMilahrdPd
 j5M2JObc//HYC8nZ9a7kbXTKLTq9kQsNkAcQi2621PxPNMBQSFUKmKVhjjXuXvKJs7aZ
 KVr50xPIhU5Y9YIdaZjlTiIZtnjL0++4MRlGYWt+pEcGaPttrMXf70NhxHeJooRvqYgq
 gdG7h6/4Uj1+5+UNLPnvVHWIqLrWpppHTC1J7kSzlscsse4ge0m7T5sfskg9s/DilW4v
 BYFudYcSGcKIZm48SSRewd9uqpsBNArR8aZra5x1h0voFiIWWSVMG+VpM8XpZGT0TqJ+
 hJZA==
X-Gm-Message-State: ANhLgQ3VvcsMV2G+mO+0CL9OeL6OZM2pZchBs+OCX7jAM9K7wYuS45q1
 LpWtUx8/mTbBwRAcENHY2W3kMg==
X-Received: by 2002:a63:f10c:: with SMTP id f12mr5404609pgi.386.1583260666094; 
 Tue, 03 Mar 2020 10:37:46 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 g12sm24659413pfh.170.2020.03.03.10.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:37:45 -0800 (PST)
Subject: Re: [PATCH 3/4] target/arm: Recalculate hflags correctly after writes
 to CONTROL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200303174950.3298-1-peter.maydell@linaro.org>
 <20200303174950.3298-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4d0700a-8a51-41cd-6e5a-486e30c1e5de@linaro.org>
Date: Tue, 3 Mar 2020 10:37:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303174950.3298-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DvdPV8DE1eJZ

On 3/3/20 9:49 AM, Peter Maydell wrote:
> A write to the CONTROL register can change our current EL (by
> writing to the nPRIV bit). That means that we can't assume
> that s->current_el is still valid in trans_MSR_v7m() when
> we try to rebuild the hflags.
> 
> Add a new helper rebuild_hflags_m32_newel() which, like the
> existing rebuild_hflags_a32_newel(), recalculates the current
> EL from scratch, and use it in trans_MSR_v7m().
> 
> This fixes an assertion about an hflags mismatch when the
> guest changes privilege by writing to CONTROL.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h    |  1 +
>  target/arm/helper.c    | 12 ++++++++++++
>  target/arm/translate.c |  7 +++----
>  3 files changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
