Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3548620lfc;
        Mon, 1 Jun 2020 16:41:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqxYXUJzR+Ruu5vUf/+7FvjQdryxhuyTZwLwdhuNO2UMVc8XOwBR+nmlu5KgM7Hy4XvUhS
X-Received: by 2002:a05:6902:1003:: with SMTP id w3mr19532014ybt.174.1591054881455;
        Mon, 01 Jun 2020 16:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591054881; cv=none;
        d=google.com; s=arc-20160816;
        b=o4yBZvdWQo/3Y4VZxKtSGvRjQ/A3g4ifTLrU+WSG6yqM+TNyO4oNOb3/9HnmTMRWXV
         1Gnqnq6f601miX3W+Z9M1hx6rUDuyLgHjV56NlWovG/0YV5kcC4sDZc/0ZSPs2pGZkAr
         zYivNR8QhPLVCoZ9VXxufikBbSiDuFBuf1MisgfFk0ZiXSuymbHGnojeQWmAo6xqdfWQ
         bhlfx68kfXj2po0qivdB9wQXIK2ptrXcF5lIcbFKTHDp+i8ywigisQA+qXeTnbX0sMBV
         nf+/ZPSCV5CFiry7DyY+Z8XgFV6m5tHEPe8Vc17QrvjJRwRWcCR0sGVecsTxjwjsb3c3
         WPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KUapqzqKD/nil8AJP/KRmcd5zCFEf0jfxXrXYdNEGQI=;
        b=o4YTD7VBTSj3yXzZvLkqCSw8nAeyYCrT9nMfWIqJ1r0RwVjM4puWfnGJvbN5Us/Nou
         eqlvItsHjoGbw1bsLH5Dlfhk6PFhjqnGCjdTuhq2QK8+w1rcgJJ3tNZ+6mW5FYnRRmyu
         rlLg2qqBUP71g4Y69PqblBchrxDNPVkIAfAzDhSjUTsZHjofPVKl4X2x7E3yHmLigYau
         TeD3tGw494AKGS4wZ2vKaoqMyuQBLZReN072zlv7Ra2z4hjkeHk383ymIfaF3kAph4BL
         xobJkR2ZoSGyUhgrkVtFaSVst0l10G0CNW4SrS8sFsfbSisP650sHip18nddlaYQOQJm
         WjrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FatqtVOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d63si764173ybc.458.2020.06.01.16.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FatqtVOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfu3U-0007lT-Iy
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfu02-0003Lu-I8
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:37:47 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftzx-0006PK-Lq
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:37:45 -0400
Received: by mail-pg1-x542.google.com with SMTP id r10so4193771pgv.8
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KUapqzqKD/nil8AJP/KRmcd5zCFEf0jfxXrXYdNEGQI=;
 b=FatqtVOR5hD/fcjlHQiJxex0C6zQusiasYEb/yEipsUHJ8XYLQsy5xfoCZP0e+yu2k
 iuyeevu0q7AhEwUlWsJu32GG5SazukklQ7e67apLyPFjt5a/kRoa7XobmxW3KegBIMKP
 ENP/BSizdgxJ2u8Tvh8iFJAyCgLU5iLwR4aQ1m509XvSedk9+fo6MComm8rgpnGt+o0N
 Q98WvROsPGMZBjMcvm6JrmLaNrnVanswonOdPV+SMxS43AgLRfuApjZXh5bhpv+tDGdz
 MMCTMQ66HTYSfiIMqxA5Ki+niSFNrxoUK9Dpm02g07u76J4kojC7ItRwfO6gs62s6NM6
 DARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KUapqzqKD/nil8AJP/KRmcd5zCFEf0jfxXrXYdNEGQI=;
 b=oWMdt+Sj6dKcymYo4KsNgPhCpiGZKyVuyLwXKlaGSlLMQdEma9PffpMPAXq9Hg1IQ0
 YgX6kkuL9E/k5SoQ+aV2y5jfDNEoIPY3hDLz8sbsnm8CfuniLjVwnmPCzsgS0VzBGq69
 VatogTbQAmQFHcLvybXmTXMyLAUxaYdTQif9rtlQ5A9cjdgVNuF+Ajpd9uY6IJE0nxA+
 nKNlywlbE3s7kfGsjCyygoamvcJ7zj6El8t/SBHBBUWRXZmd8XSEKMEt8PS8mjJ1OzWC
 LMFcztS27tGswSQ6dPKR+CUjYScpHXTZulQ+zBMkSJ9t1+QOEuLlCCTNOU9+9rwRtnAJ
 G4CQ==
X-Gm-Message-State: AOAM533lvu4CUHctAOVgON1+DHES6XZvCZ+2CPgDavK91kpNL+z07EIa
 9ZmuxQUyN13MHr9hYedR4KqghQ==
X-Received: by 2002:a63:6345:: with SMTP id x66mr20915001pgb.156.1591054659488; 
 Mon, 01 Jun 2020 16:37:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id g19sm415680pfo.209.2020.06.01.16.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:38 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <403c7efe-bfa4-c6e3-7ab7-0592bc16bfc8@linaro.org>
Date: Mon, 1 Jun 2020 16:37:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ELyQLD+iS54v

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/xen/xen-hvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

