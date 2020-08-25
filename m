Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp91050lfc;
        Tue, 25 Aug 2020 11:40:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxh5be/sVUEJ+mvgzUxfj7nUdVsbn3lUPZtJ1+j9/M6zk9KtwFnq8Q+Lzei7dHYjXQjOwi
X-Received: by 2002:a25:f30f:: with SMTP id c15mr14218945ybs.154.1598380808744;
        Tue, 25 Aug 2020 11:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598380808; cv=none;
        d=google.com; s=arc-20160816;
        b=w9+hwJKSBwEHXj9yelS/1autcK3uwlJoWkYXsQbDncVTpXWol6jq75rFPrQtjvAM1z
         bdRoibph6hP3OPezFeKU90kIDBvgomFSE57G2uJp/A29KKn6Km9TvSQaksUjENaFYobQ
         QvrNN5csdXGu7AFqLPCyRVPTD7HEaMnKKAkyIM8FLv/x6nJw49035rxem/eZxmAIvwkk
         qZmS9zBn8ZgzsD1BNMIlnmlPvXw+hACK4adBu3Pckq4LdHhHCIlXybhlGioXMaRPGOg3
         gpAweykxQ20DcY5oS2TL/wQa2v35rRPOS2QQS0EoL5gQC3/bXZv6GXbSGIsoO7SgftJx
         B0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JofeZzJ5SExg9SUh7gqUsyQBbdBpgvVivJ1TorSzG9A=;
        b=tt6VDz0IygKvswpDc06i5xp3cvfI786G/OksCNjFdlZsvJD1Nzoras2koe6Tv4VSJH
         38q5cvT5pTYsIPkQGyp0KS8d39Nqn6g2pACzJ2ejY5gj8F4vMIYRolEpsHw2l+I/j0FS
         4Hys2VpFDuxUdk0qub+xcy34Y7OYlunjcdbovu+cjpM5mA1QgI+ZVsH6u5Vaj4GlUtJw
         gSUzlNZ+15KMeb5fCftq8efsyEg8Kn2olarpGrwV+gZXPBQyDGO9hTYbtRL+bWDxPjN/
         tYeTQR8UNeSlyWdzKGLY7SJdmbuO2jduV429PmN3YxAcNCDn/hh/69OyWTafAAyZBWTY
         RC6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXk52AXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si15297169ybs.132.2020.08.25.11.40.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:40:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXk52AXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdrc-0000Fa-4d
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdrU-0000FG-3P
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:40:00 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdrS-0000dX-7s
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:39:59 -0400
Received: by mail-pf1-x441.google.com with SMTP id k15so1553364pfc.12
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JofeZzJ5SExg9SUh7gqUsyQBbdBpgvVivJ1TorSzG9A=;
 b=RXk52AXHDt/Njtutv9ZVE4oSFP+ovKxZFi7wxg+Ug43LoNLh4TiXCpdfLHtuE9VLUA
 nlZf0wPX8p3TtUG65fKD0fmakc6J7AKdosAFMKfqoOJmWxNizBIPuNTpVQTZ1wEaPBNU
 mOqdaTpD5RT2/ZvYbZTCMIg+re5Mp7GVj07qSUNmzD81Mz8HUmch/IzWHAESgJkmI08m
 xwLP4iwICdH3tUCVyFUSI5gDywMBLZcjuUhzmeiE2dfOqhUF765WMc4vNS1Ld/X5OmA2
 MSBTQMaLZiYghoyFqfVOjXKmqyOdY3fAUs84R8x1XD1T1FhGTVdXBZdHPdRoGZIl2szF
 vqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JofeZzJ5SExg9SUh7gqUsyQBbdBpgvVivJ1TorSzG9A=;
 b=fGUoT5c6F+RXLcWj2rRZ9jr0zwgBsUpk2ySilG6WKz36CtySKRCErpu7arAs7rDver
 Ii++/d3h2AZQ6vTmYd8bvXD8c7dttCek0UGpREh270X7kTAbZgVhdZF0EF54k1o6vI9H
 qCBdXMUSewRLhoAVa4epPatqcwcFKJpw8/8R0lZOVNSS31eBwVQfXdg1SP7KuFap0fBB
 b9waVs2vhniwCYTHOHM9lWTxMtMKWQbI0rQ3fF1+hrl7zfJ22U6mErP0K6RoshDvAdM3
 dwV56sPCUnPpMnjv3CcBz/UIYYZD42sV7icNggsu0Vze6CL0HjHdoAtI8oBN2QOkkQ/o
 btOQ==
X-Gm-Message-State: AOAM5304pGjAGA5kuf/0r0AsUl6IsGjOeWwJ+gnq/trr/XsTqpKWigRu
 ktw4Anghf4rYhWSgWa8/8/KSAg==
X-Received: by 2002:a17:902:8f8f:: with SMTP id
 z15mr8596549plo.221.1598380796372; 
 Tue, 25 Aug 2020 11:39:56 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id q34sm97937pgl.28.2020.08.25.11.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:39:55 -0700 (PDT)
Subject: Re: [PATCH 10/22] target/arm: Implement VFP fp16 VCMP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cfb93cb-6a50-a229-c9f5-b8cb96dfa675@linaro.org>
Date: Tue, 25 Aug 2020 11:39:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OlvXqdoGxbVN

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement fp16 version of VCMP.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h            |  2 ++
>  target/arm/vfp.decode          |  2 ++
>  target/arm/vfp_helper.c        | 15 +++++++------
>  target/arm/translate-vfp.c.inc | 39 ++++++++++++++++++++++++++++++++++
>  4 files changed, 51 insertions(+), 7 deletions(-)

Same comments re the helper types.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
