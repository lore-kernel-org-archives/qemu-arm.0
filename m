Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3333866lfy;
        Mon, 17 Aug 2020 17:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfWEi71RksSok87jMQMgGGmLhWa6PY3MUi6OFUVuUoOWEQZy9x2WexjDKOho4unFTVzkpE
X-Received: by 2002:a5b:b05:: with SMTP id z5mr17579101ybp.321.1597709225508;
        Mon, 17 Aug 2020 17:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597709225; cv=none;
        d=google.com; s=arc-20160816;
        b=EJxaah2qq6hnB3fCYp5QKSLQqDm1FHmBaOadgKEVrkOnf/QsUjQ2wd7kTQAOHV598W
         xpHZjhAN61iUcGBgYTr7iPdIlo3oT/vA7hyneZpmmpvx54xfOwFlkSwzzxU241tQNK6A
         QDl7eXVsn831S2ZByGORIkWee7ztcG4GTPF35xf+pTbA48tAeInbmmr2wrDkFkzqDuHP
         V6wG5MOajjn1ADZMy4ZzeJHPdapZH/BeMr0q34SZZVMRbdEpFUgW51JZHFKARVA+zRSe
         Jzwi+feXzZD4b0X0aYGn3YoSP7oOylE7kHYlQIIlTMf0ftSa6I5rseADojJVilPvNaHv
         QQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5mDnYRQitt8gXr/PNEepxsq8X2u6jRV4zIf4ec8sACs=;
        b=DogPTs7usuYCgp0s5j/KIF41p7tz9MRDv8+he9HneeGiru65jRkRNiC27VJyv+30s3
         KggH6uLdzzPR883Xhb4RuT/L7APJ4HWzbUtwJh8JZJfRzVj0qNE+kxjjDXS1+GdsfyLj
         DWyPSlg/b4f6SvvO2WML3b8rTrPAIn2/uKL1k+ER4hZgvYtvRS8yFl30QwhfhxNyGak/
         BJIKUJdb56NM7Il0TTHjHlwaE463zlxlbenMj+HU/xPvMwschiKOj6MWGm7PEkrXKDdX
         YsxCE2DuVl7toFUD+66a8CWts/yJllZUKZ621hzQF4yPbd4sDOQISUxPlnnfwPj6amva
         6mMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cAXMbwis;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si18743431ybb.152.2020.08.17.17.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 17:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cAXMbwis;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7p9c-0000I9-Py
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 20:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k7p8n-0008GJ-Uk
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 20:06:13 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k7p8m-0000P6-EA
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 20:06:13 -0400
Received: by mail-pf1-x443.google.com with SMTP id r11so9036990pfl.11
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 17:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5mDnYRQitt8gXr/PNEepxsq8X2u6jRV4zIf4ec8sACs=;
 b=cAXMbwisq2uMLc+Dd7dfr0sasZldYFcwGnAKcGMYTTz1NPInLYsXkxw1bLPJ++OqkD
 HEI+DxBU5q6ZsXzMwDXMwhEUEzZo5p5j/H5EZXR5/APVJ4VkQcpjBwSSWnL6ollPPLo9
 AwXRIHXyEK5y+u+1ROba2thipDW+zf91X+Mihf3J4WT4h7d3px0eQL61qE4/wn7sWL4n
 5DWaMf/IW1l3eqbxxrBG+HP3hqjbelAwQJoq8FHZQo9ouRdYREr7QRp1617tNzC0V52P
 2YDxk2MvO3bdaKEOIoRFjJkB975it6h8gFy/pTYM2sCrTmmkK4elJssYR6WWc85etQ7f
 kBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5mDnYRQitt8gXr/PNEepxsq8X2u6jRV4zIf4ec8sACs=;
 b=Zi4O2vAWvirWugnfM49cDqerp8Y+G/BBAereAFJVVDKdnEwNISChzNegE+9Ghg/LcU
 ezUDHbO4MYqyS7eyo+S3o5cFgqkdidKc/bOVQXOVaDnFPot0IlN95BR8WTZSW9ESp9rP
 6cMf5KHMi84+OjaTETn0RUqzMlZC38O4AfOks9BW/n0EnSZrskTYbhAKvpb1mLTRh3Z/
 993FH4GE5v4PIs6XnHXRyPf43FHllBXr8/F8/3qFcsBszN4fLNmm+m6+q3dqh6SL5cPv
 6s5PgspMP+av2nlUlByueiprRycxgdmTVBVYDw6/X4nSea/wYh5xthvEhxbu7HqTcbaj
 ZQEw==
X-Gm-Message-State: AOAM533GXgAq0NwIhakmnnLsUQMzgG9VF39H+EftWwUO2vtRGwn7GA8/
 9VZoY4jx3JX3VzHK8OPtu8PTHA==
X-Received: by 2002:aa7:92d7:: with SMTP id k23mr12461871pfa.295.1597709170396; 
 Mon, 17 Aug 2020 17:06:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id mp1sm20128426pjb.27.2020.08.17.17.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 17:06:09 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] target/microblaze: mbar: Trap sleeps from
 user-space
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200817173045.437534-1-edgar.iglesias@gmail.com>
 <20200817173045.437534-2-edgar.iglesias@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4aeedf1e-7b1a-6b92-20d8-7bc295ef0fb1@linaro.org>
Date: Mon, 17 Aug 2020 17:06:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817173045.437534-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WX/WAHy099Op

On 8/17/20 10:30 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Trap mbar-sleeps from user-space.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/microblaze/translate.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
