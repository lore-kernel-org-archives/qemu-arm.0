Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp618284lfg;
        Thu, 18 Mar 2021 11:41:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhZc4BpZc32M06HrYltT9A2wyLqdclffdHLHywYCewDCsZrDLFLgOTKiU99xTIKHM8vpG+
X-Received: by 2002:a02:c8d4:: with SMTP id q20mr8119591jao.90.1616092902748;
        Thu, 18 Mar 2021 11:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616092902; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsQxqoedPcveGLuaYoLQzmqA4HPKr5gVwAvfSxnsXNjAQVQQFwhiIQqFFLyDA+y+CZ
         E6t/p97nmPH6DZljuYN1vtZkaEzkaBOmWhNPgeS1lzRKtTT9894XXL7dg5IDN1CnsyD7
         p8ino3jVARjifo2+P8Cpwr7QATWhiczYhH+F5Pi4weXeRcirnH1tVeXyvmN3TOONy+WG
         by1UUIw/amQeMSya/9G3E+dlSETuxgA0tlvetoR5LG+Y0oP+m6Tz069PWQqbQRnDaSHu
         n7f2zjqLro90sD9ftVUa+7ZhOE5+en1YRSxOEqYubXe3SyJBN0YZskF2ymy8GGXuJjOa
         c6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=S8BecUbGKusNgxBfQYWgESkKlmAd3uL+QRkM2+RBa4w=;
        b=rXgzpkM1cvI0EfvsghRMwTO6cTjGzO5qMCfhqoK5iu5S8M+XU9aeTj0dC2kM5kOXwY
         ermyu55OG2wf0rGCUJ1TUi6inSOX3E54ojPstGHzEYQhQhVS3JXNNaEgaifxvo/aczQs
         dB1PBrcCSmLAkZefLvLeRUQJoHYIA9l4oWK4GEI0U38XmQryfPlyMOtLzyOQPZu5P9Zc
         hPYoM6/lST0mKUro1SE8dlcaVUytvFUgYf/TKWijnwkvJ1ff9y5d5+VGhH30mQs7oJ+q
         rsvMPc6OzVh4Zejbp5APoWpgDStWJLUgKhG3uKbM+RDQf+31AVqOjGx6SAcUzgoqywru
         ACLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLTL3GIE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si1647057iow.56.2021.03.18.11.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 11:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLTL3GIE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMxaY-0008V1-1u
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 14:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxZY-0008SW-Qp
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 14:40:40 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:44727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxZW-00046t-U4
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 14:40:40 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 p2-20020a4aa8420000b02901bc7a7148c4so1672330oom.11
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S8BecUbGKusNgxBfQYWgESkKlmAd3uL+QRkM2+RBa4w=;
 b=DLTL3GIE72fTjtnUcUMboA4Ygt1MplqovORfo9U5vcWhq3VyqTgX3kTYPoks/qFoai
 5E+IhHbN9Lf74foiHdHaTDe4O1UbjyjRbXrsz29l2TBYKI7p8qPfTfHKPSrBSpaXp12Q
 wTYodwuliz+BWaXAuHJlXoJBuiB6J0stlxBuaDJ3ryelCZ7kAabgWSu73RUNyNfhbADo
 bcZnpePoGJXZCQ1JyKeHvvN6659IX7NQAIjiMF5970TMhqdu2dB3mjxdtUgxeufWDqhr
 L/HCMnWc/Rc13KOYSr9P8SZ6g6ug8bZrw/pOy6jqD5v8ZFewP+p0LlLIJH6Fo4ouS7MW
 A2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S8BecUbGKusNgxBfQYWgESkKlmAd3uL+QRkM2+RBa4w=;
 b=WndpvKXDry4cBchoKOkoOqBbcyC1IAP7D05nKsXjme7L/VOl984AHxN2R82uI6MSv2
 YfjhbdcDx/mVvxyZBIi4GsGuiv6MKxbxmOErVcpCgnZ3K18n0KhDToje+hUz6ED/6pSP
 1klcZ8Tk/G6/IWyrdj/PSS9e0k5+lhDYSlUbBGJqaHMeWbJYVhxyMCCJ80Q8o2/tWYdq
 46RCNsflqt6KNIqOhKCpMrdQnZ8BwdD5fxVAf7dtFswiRfNevq1vrySbltEikhMcVl1Q
 l2p3995JAsYWCh23bO2jDepM1q+qGMYz5Efbn2h9f3dd03yiPXaUU3KnmHx3WaS0se5f
 nBmg==
X-Gm-Message-State: AOAM530mSusXLBBtuBArhvMbIGQD0+96qYqIiuskHNtbYk835kJIsr/j
 ofaW6R32KNiLeGpibc5LdPigZQ==
X-Received: by 2002:a4a:e70a:: with SMTP id y10mr8585641oou.75.1616092837843; 
 Thu, 18 Mar 2021 11:40:37 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 106sm640655oth.81.2021.03.18.11.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:40:37 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 3/5] memory: Add offset_in_region to
 flatview_cb arguments
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <50e1efc4-c060-2374-e535-6086b57f2e6e@linaro.org>
Date: Thu, 18 Mar 2021 12:40:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HexX9tCDdsqH

On 3/18/21 11:48 AM, Peter Maydell wrote:
> The function flatview_for_each_range() calls a callback for each
> range in a FlatView.  Currently the callback gets the start and
> length of the range and the MemoryRegion involved, but not the offset
> within the MemoryRegion.  Add this to the callback's arguments; we're
> going to want it for a new use in the next commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/exec/memory.h           | 2 ++
>   softmmu/memory.c                | 4 +++-
>   tests/qtest/fuzz/generic_fuzz.c | 5 ++++-
>   3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

