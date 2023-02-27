Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4403844ejc;
        Mon, 27 Feb 2023 00:23:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/DqJizmuHrVJvtUgSLLSwmN5+6bNvlP6l/sSS0wci3vEyv5UEpa81iNvG5Xmj2N/v4CRMS
X-Received: by 2002:a05:622a:410:b0:3bf:b950:f684 with SMTP id n16-20020a05622a041000b003bfb950f684mr20347105qtx.53.1677486237972;
        Mon, 27 Feb 2023 00:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677486237; cv=none;
        d=google.com; s=arc-20160816;
        b=wxY5k2z8YPZ9Tdt0ab/a4rWl1QSVRQAsLJLRER7SXbf5PxVp9GD7fKMWAjuGkATOQc
         wtMNvLWtPo+ICx1LZ0db0ufDND0zccB2eUfQV6k5QQJTUs9gm5FZ9J/jkkHl0WHAB9aD
         ICAc1aNYzR3tGz+RcJjkTU7XKVA/He4fi3z1O1m7YbjikvqaSaGjrDefduyPtxbbfXN4
         +ZWs025GOHZ3120maGwctbnOlDV3EAS1RtJapQkay6Zfqm7vw3yOvK6mTbh2YA3+M1/N
         rRj52gIMYCpzBgEm/Q3dJEPeYQbj/vNu3vxe4N7AIN6m+vtcpvaL3nYTuOTc4FhS+uPS
         37ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EkabTtd7DUB+19zLLPs/zHOycE77u2Vk1pv1TbWdLw8=;
        b=eN4Fbpq8VkYyxmYtC9cGVyYXFfIhFsYE1jzxNfTx6OKh5kEaIG1Wke9xxNOIZrvj3+
         Zssl60CoM+RnOWj95NcNEUcxYa2VQGxU5iaEPdEZphx1Pc470jq00blJIj3lOdFtAMNU
         GglP4vOaQ1rGbU+lmyTs8IxSPju185s5Vahxezstq9tqNSsfcpZSU8XaDH4k1Yo1PPp1
         S1Kymr2rIw4g949GwkzgIeOVx7W5/OzBWsYFM/oDSs4xGbBHqH6Tpg/hAjJ1LX9wIywR
         Vaim4EURZwyBnui+ZBUJHp9O8mHdcUmw12kaIHQNoMFEGMLSEZlyK0ICWbecJXM+s+EY
         e7Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fy5cOHwC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130-20020a370488000000b00729ed548e27si5413455qke.214.2023.02.27.00.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:23:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fy5cOHwC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWXn6-0004s2-Dy; Mon, 27 Feb 2023 02:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWXn3-0004pX-1H
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:19:17 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWXmz-0005ew-R1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:19:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id j3so3580197wms.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 23:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EkabTtd7DUB+19zLLPs/zHOycE77u2Vk1pv1TbWdLw8=;
 b=fy5cOHwCUrL9UkxIJSSolZ8m4lbo9PsUZpKRuYs0a9pbPOpEwudDRnoZuaK6o1cLrH
 0bprjYHNFlMqrHMkKXR3+ZQC38iiInw4C7k+p3+UZHufxrUGzaurQ6HGAM25PJTI/K2u
 S5nFVmi3SVSGwSGvBtb1PbKYCpWR4om3eAj0YjFIWTQxPGrNR6X1ePFavA4ts8sGF8fs
 vMTMknKvWrruTV+ImWUgnzTGp11qnHggCHS/DcL6iKLNvRBBlOLYr4uKEtWlIIBj2D++
 xZ4X7D9ixqCynIA1OI4QvDmUEh8Wrk0uUYAxUzqbAr/hJIAWbVkZKUit0CoSlXoLL0Nj
 FECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EkabTtd7DUB+19zLLPs/zHOycE77u2Vk1pv1TbWdLw8=;
 b=mhjmyhQGXjccvwRejyvvg05CMFqj4/7+Gon0lM7nVfzBYBgN9P92Oa03+nA6osUfTJ
 bV8kN2ZgzO37zON7AxGpgJyu7mrZmtBbDGUK9uIetU0Ct2k9i2MGHUjvUkfvOyvYD+KP
 PrIGWvcpYFHFJFwudsnzoF41geEPut4J8epjXLI699mPNw5hkd32DD19CrQUyLHh6iM2
 j5t19XdDq2+MSdzfDqFs23hsF4mrvKThxM9afM1+mq2jDsBQ5h3GSUhBX+s/3HViEd2d
 tcGgEXwSsYIR5GbZHRDmsMxASawoi86MOCHbM53NEzZnklOn6OKkTZql7/dEL3bd8Mbt
 1N6g==
X-Gm-Message-State: AO0yUKXJHUVKsM3nE7VBwPF6MtYTRNlViljzlOUPoRBvcDb0FDpt4l9M
 gY+TXR013CvYvwfBwASfeDKHjg==
X-Received: by 2002:a05:600c:1609:b0:3eb:3f2d:f22f with SMTP id
 m9-20020a05600c160900b003eb3f2df22fmr2840340wmn.21.1677482346561; 
 Sun, 26 Feb 2023 23:19:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i14-20020a5d55ce000000b002c559405a1csm6169808wrw.20.2023.02.26.23.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:19:06 -0800 (PST)
Message-ID: <8aacf5f2-22ca-8905-0187-094e66d1261e@linaro.org>
Date: Mon, 27 Feb 2023 08:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227053701.368744-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qtQaxPB9lxME

On 27/2/23 06:36, Richard Henderson wrote:
> This is now equivalent to gen_tmp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/idef-parser/parser-helpers.c | 24 ++-------------------
>   1 file changed, 2 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

