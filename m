Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5668032lfa;
        Wed, 9 Jun 2021 12:13:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdYiT33mornrbqcpJt0UvcBKpPLT/gd7hKXqWl2JWUmszWQ6HOnGce4LIGOs6OoR93g/uJ
X-Received: by 2002:a67:f55a:: with SMTP id z26mr1885493vsn.48.1623266002871;
        Wed, 09 Jun 2021 12:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623266002; cv=none;
        d=google.com; s=arc-20160816;
        b=W1yC3OjA20Wik4GsY58bWtu7AkdXUi9E7q0oJWPYlc/knz9jqSl+Y6yZ/ZcTgOIxAT
         BRVKIvW8iyWSNUdcpvuZVXGkTDheNgWDX/VMxPH1YhrVNZBOgEGPFBjQqa1+a+J+DE0B
         p9DsbaEgai5ikJYWKUTSRt3qXS9trqw1sWisHAUjst3xKToRRYz0ZG6elTnulely+H89
         Fg6o+keIZyijwBGY7rwmQJTW0UXAgtt7dPY00vpWPL54fOKb3nMk00vHU/gPD7Ic6RoP
         NsyOWs3HiH61HTsAqxw33XZRo4llxq5nzyOShtlIUAzxy+guO3BqiThP+4lvOxCnjlgj
         ZD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vhp6+mtLXHVv/+nq0t1zmaxJuHmutmXqaQJUEwn+3ig=;
        b=OCi2gF7t/vE6vjioBd2JZbx5mqFF1epBiLhYKGlUxwkva63PeiEYDpxkKysDtxaA4v
         ECe7WvGfu5TUH4LzV2xx++60b7zTnB0d1IY2KlrkBZ4ApcuIZ54dWxVVzT/VFlGo3Dkw
         D7F8/4tgn+UrND6X6r2PZHNl6JYIL0qW4EcL7ZJmz+OiStyWs3TvansTYiBFgtnraQsx
         jUs2OLPVWGU9a5U+UBZA/C6yc2VNgctTImIF8ZaVItO9rTd2dE5yhlehTG/KleEaBzPL
         r9ExUO0C6oulYGnwmo3q4orOguSzyzQTeDUqXzN+I6b+hCHOoqBie6+1S2VCdxIG9yql
         izAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PCS422Gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si460803uaj.5.2021.06.09.12.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 12:13:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PCS422Gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr3dh-0001Kk-67
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 15:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3dS-0001Iv-Aa
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:13:06 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3dP-0001Wg-NR
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:13:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so2089068pjp.4
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Vhp6+mtLXHVv/+nq0t1zmaxJuHmutmXqaQJUEwn+3ig=;
 b=PCS422GmbCe/NJqbo2gc51H65XMdUJEdp4f+9IwHP1ouM9sVBzWGj096wCstD1Nht8
 De2Id3GvfH6ZdPxlHsazY5s/5YW4k8+qI+I8C4I9mrm6ViVVb6ET83pMbLmW5Uu49Jkn
 RDosNsdbvxfH1T5l67Y4bZQo7ACeiIzS02YeMLsrwHB4mVuY4NLFu3ZiFGfcsXhzJ1OY
 svczYxYjH55AWpzIUrn4BlODf+lKXEwzzkNWdVtPoeyYEZ+5ZVWru4rOsZv5uYalbg66
 4q9Evd5Y5blxlgf1vBhOH9s3xIwqi63y2BkbKJPdFk7OaNbTrve9e6vfReo/KTNgJK64
 2M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vhp6+mtLXHVv/+nq0t1zmaxJuHmutmXqaQJUEwn+3ig=;
 b=GZTM5AsbJ7s/jmH1jnmPwx7YaFfFanYLJmfn0Ya/skO27YhPXrK57qBSR+IvbFlmVQ
 9VcZB8iZkxb4/hZdbVYY6yHwT51luuyAxD49uOphGVyxcJQZSrPKxqAdlroonWPBNf58
 6vTCtOTL4tjqWLosYIGIXZxnNT42axhfcZNVoBFVhq5y6W7Sp3oVfT7Zq+OUq+1gzEFU
 cxI3pQCrnwwKeNZ7nwnCNAN4oNuKs/Xt9OZrM9i6yQIOPoRe6T8oKbnrGXSpLK80YGS0
 sNbncKTWKDQIu5suGAlI+S5DR4+sNZNSFxeQVewaRAahUyVPI4z4iz7H2veTih+b/mbx
 zEIw==
X-Gm-Message-State: AOAM533k/By/6yATqglCNiIO4laXMAP0+T4JwiE5ccgp8VUUbdJx8vQI
 LVTG9+bZZMSZtIbCgPZU6Yz/4A==
X-Received: by 2002:a17:902:b288:b029:111:4a4f:9916 with SMTP id
 u8-20020a170902b288b02901114a4f9916mr1221510plr.24.1623265982325; 
 Wed, 09 Jun 2021 12:13:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s13sm489707pgi.36.2021.06.09.12.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:13:02 -0700 (PDT)
Subject: Re: [PATCH 41/55] target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <254b9e4c-864c-d443-de22-b3fcbbb955a4@linaro.org>
Date: Wed, 9 Jun 2021 12:13:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gjLMotBeUH0J

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the vector forms of the MVE VQDMULH and VQRDMULH insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 27 +++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
