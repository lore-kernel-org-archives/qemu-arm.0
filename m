Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp979574lfo;
        Sun, 6 Mar 2022 11:43:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+7lEMwiP4PMRNYE9qKdPudmaHCku/NCvqThYdytdrTfq14SOBV193IEcGdeLFZw8OVXvA
X-Received: by 2002:a0d:cb12:0:b0:2dc:56c8:1fd2 with SMTP id n18-20020a0dcb12000000b002dc56c81fd2mr6235450ywd.116.1646595820868;
        Sun, 06 Mar 2022 11:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646595820; cv=none;
        d=google.com; s=arc-20160816;
        b=UmRSmFdLR5oYUDOLG0f3ea9RHNJu5JkKHQxz2Kx/sJk+1gXbPsRz6LvtXJQPYB2tgC
         UwAGkVhRNqzr4ajZUmMZeR0RlNG11fQpUux39WuBMiZBDntpahdrxRa0e0yCfJL+ZarN
         g1s9MNvi9s85qo5LNMTDYSvWMfO7BDsFRuXiSbDDvWrZ5rrZxexU4LjYflj0uSzTAJcJ
         BwmNwv7auq5h74lvW4+TsdoeyqyUjsksp9bHtpW7/S8H5ghCFD5AXvMY2NPLFGulJNUs
         d6c7cp9zg3OWYfZyK1WAqQEihd1zoG9hp7I70oAIrD8m4RSaSApJVTd4j0agxiiiV7+z
         /GnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9plVgfW5wBf8/9gcZpwTWQG0j1LTdqmv9dDErqCMUZk=;
        b=u1lX4MEVOg0N7UxzI6hvO0MAPU0X6zGGOZFhKaM6YN2GFOU3zJSCI6YyCToVDfbllG
         decnaZvLI7E8EU56VYulUBNEBQRa0f0Puj/SdJpnVWHqQ5YC3mocDmDGljQ9CllJCXkF
         me43rWxo1gRXAXl0lfrHjHJlW5k+eSETXPdrrktbWtpxYW0keFcuiWspQsMRE2htQv4F
         yx9DdJP/N6vORkNrgalZcUrx6WUNvPUEC4HGn2MIWKZ5CX1fBEzl2AUkRydmVCKVIXbv
         vVEvcGKIX8vTfbV5ok/4ztNypZo8e7GdizkcBmj55QvGwYu1Tjy9dRjEkVbM9kSxIGN5
         ktVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mup37hZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65-20020a250244000000b006289995a5f0si7143696ybc.416.2022.03.06.11.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Mar 2022 11:43:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mup37hZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQwn6-0005zg-5I
	for alex.bennee@linaro.org; Sun, 06 Mar 2022 14:43:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQwmv-0005zM-58
 for qemu-arm@nongnu.org; Sun, 06 Mar 2022 14:43:29 -0500
Received: from [2607:f8b0:4864:20::102d] (port=37411
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQwmt-00029R-F1
 for qemu-arm@nongnu.org; Sun, 06 Mar 2022 14:43:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso14795895pjj.2
 for <qemu-arm@nongnu.org>; Sun, 06 Mar 2022 11:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=9plVgfW5wBf8/9gcZpwTWQG0j1LTdqmv9dDErqCMUZk=;
 b=mup37hZGyxmuG7OGJ4uE0qzpQMEfgGybInJ7JkxDrZPPrL7ikG10rcYMET1cpCWpLp
 oGJO5vZ62Rlp6CTykdMfQ2SDta3Y2Xr0SrGGPPvMfkS5co06VyGecs6qU6zgdr/maPIn
 r42MI9/cSucgwoHSpzV2q3iK5nBRwmfTWzxi/raXlaZHl3m3tLEdiU4a/PQdrgw48it5
 v1js1+qMyl5JkkX71hgTwc4OKbK56b5MIH+3lPIJXzvez+ilEx5W9srFHwFesVbJ4ZrY
 psbTU9odVTjL1Rg9eItDwuusDnR60WcFzmmUq7sEd0V8SU2yB7u5cS0dk+LigjF8p7wV
 zpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=9plVgfW5wBf8/9gcZpwTWQG0j1LTdqmv9dDErqCMUZk=;
 b=2VCfXH/F/PDeYForTRQbYR1xfG7MLluUu80PWNA9JYv1+LXPqwnCiUB8LRuHtYQj2E
 Q2mXDsLZ/e600vVAtPDfAfR09ys+HSrins61soYqFNL3Nwd58GBaJi1rlWgB/TegqD9g
 6fqF0ZyyXcqhsQ03tkMk3UGlStaszGr/MkG+i7QXL1MXsRdsYPK5ZIeQDgEaPXKmjqqo
 2rdlM5kr3tP7Eo39OfkwyZ0Tx+M9T+mU0ELnqskLBzuLeXg2DUaIkWzTUHGCRtH5icNl
 sD5tFjhj42PRswy6VnsWDx7bZUoPap8soIoc71kycydpBiE4GiRNGFaC8BSRgWwQJaE/
 WYlQ==
X-Gm-Message-State: AOAM531qctkh+ZtN6g0CrKSeEOgJdivMOrMZoGjildF99ndWPuOnheJB
 IaehFR+wDzKSK49RCnNhwW5HGw==
X-Received: by 2002:a17:902:ee53:b0:151:ec64:4ee7 with SMTP id
 19-20020a170902ee5300b00151ec644ee7mr1255025plo.89.1646595806156; 
 Sun, 06 Mar 2022 11:43:26 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 w5-20020a17090aaf8500b001bd4c825deesm16024008pjq.43.2022.03.06.11.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 11:43:25 -0800 (PST)
Message-ID: <4a60b54b-46be-7cd2-35c1-2ebe759c3593@linaro.org>
Date: Sun, 6 Mar 2022 09:43:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/arm: Fix sve2 ldnt1 and stnt1
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220306194003.13030-1-richard.henderson@linaro.org>
In-Reply-To: <20220306194003.13030-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KEGCJyqHK3r8

On 3/6/22 09:40, Richard Henderson wrote:
> The order of arguments between ldnt1 and ld1 are swapped in the
> architecture, and similarly for stnt1 and st1.  Swap them in the
> decode so that we have "m" be the vector operand and "n" be the
> general operand.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/sve.decode | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Oh, Peter, perhaps squash this into the other fix for LDNT1?

r~
