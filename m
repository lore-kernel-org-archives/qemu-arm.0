Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1773840lfc;
        Fri, 28 Aug 2020 13:47:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMNQmEiZe+VhXZDAF2dpFVU7xD+e22m/0RzaOE4In7XqVOFCjtvP7iOG+YTXFDn1qZZCZK
X-Received: by 2002:a25:7310:: with SMTP id o16mr5128609ybc.415.1598647626419;
        Fri, 28 Aug 2020 13:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598647626; cv=none;
        d=google.com; s=arc-20160816;
        b=YyulDIu2F+bZ76kBjTGxApBUH4O2/qSV0HtmpHfD6YeK2EsDrx7IZfji5OZ5yD3koz
         ElEAvcjetddwY2Y0wDBQpYYs+fAGtmTrvgriEtPgYixBmlaZriSEhn3Z4aYAY1XvjMSq
         hODUgKwJ7HQ0A1av+EARAr9L2hSiBUnCsgwqdAwSxFuOSJTx7oLqi8i3+srFBM4IsWpy
         Z2005QXyVrXQ3Ip4y876Z76+poLztHpgQNKeG7PaAfBYXoXA96g0+AQOkmAowAGBPc6B
         BCn2HJ3HMab3dNUcH/IxJ9xgcK/OsQcQnkkkY+qn8h39Z/bh2cTaD0pixaVCORyjVWZE
         JH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fvrJS0J5JAtvCHtGn92jeQQIGjakVXL01C+zgxiQjZE=;
        b=xxVo3KK3xB1utgfxEknYI2LFiK0vMA8/YD8Of1W1DsI3ZNAjvdEwOnNk7WT0pNqYat
         B0yC5TBFBXYjodz1f44vkWjm1lU+pzVJxO9/Z0BKIBb09a6wGAAYZOZcj0B+n6JDIDXu
         sXv6Xigk6q4h3+7ap64GojukuDEO4rQPKDryP0YY6jXTUXmKg6RMw5KXEIEa2uuld/vS
         v6UdnTmoPniWGjF8pHRb7BBM5X1/MVD2yOyJrsLvPbfQaSSvScc35NlmneS4t7McTPlm
         9aZCOHPSB4oRkfh3LBVjAVBazpZfU6pN+tgqJsjm5fsXWRLYKepcf4qkMkvqhUNUEZcq
         rzPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QqJkCJv9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si410786ybq.241.2020.08.28.13.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QqJkCJv9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBlH7-0003LM-RV
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlGy-0003J5-2J
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:46:56 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:38934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlGs-0005Vd-Dg
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:46:55 -0400
Received: by mail-pj1-x1041.google.com with SMTP id s2so126676pjr.4
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fvrJS0J5JAtvCHtGn92jeQQIGjakVXL01C+zgxiQjZE=;
 b=QqJkCJv9+tbF25ea0Te+z/0J5xx1WJkIPNpL7ir8z8iCcE13pN4p2V4O2H0Onee+uM
 KbIHIA7vBCj7SN6xzfpECOW1dFUJBswXU+iuYO+x0eHlvuH5nKXxoKZ4XWWChmQx2HsR
 qsJvvwALo/sni3Sf1spKlPxZJ/skw+mM0pm0RFCq2h+XCfhA8nTl1RLgd9ZzunKyDeS3
 bkn3TbbRqDF5t8engJzrNw10U+FzSioI76OEUYVVtwr68ZoQEpDWUOeNBvbIMGABGckr
 wRP2PfCUOp8mZCrpxzSZATNEHhTkNo4I60UmiB2MPftGJnTBO69AvnoAmlh8bcVom8lx
 +jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvrJS0J5JAtvCHtGn92jeQQIGjakVXL01C+zgxiQjZE=;
 b=IXtJUzY4e6WDYF1yzaJV2lHs+Izq4KYwZC7KTOfZdsYbnz+Cog7o5YqCRvgoqYTO/K
 CfVi3Q2AQ+Q9CvNjfkNk1G50sPNFxIrp5W4JQxT50Kf/SSOKHxaY1NiyAu0fKN2upuox
 yxYkcHWtEwB63T2j4WoHTWrFoGSiPQ9+IapWLzZtYcJ/e8o4GJy7VMWb/gjWdYZ5MZ2e
 9kbEseEpxmqcz//fJx6e60uF6hF0oS6RPZdxQFtM1qrC3d9I7YdEnqwY+O6feQc1uZlE
 33+lWxrGN12MXmRsR/2W2LUdi4nqEouLsRhkGwCFK6KskqOupvelsOQwuLlgl0kZrx2G
 TTjA==
X-Gm-Message-State: AOAM531hVwFUEUX+Nzh8JfC+UziOZeZK3NyxU74cCik5iCRgP9rXjP+v
 Dli69q5bnnmANd4259DdfhoOCxRmDTT7rA==
X-Received: by 2002:a17:90a:7b82:: with SMTP id
 z2mr670624pjc.106.1598647609008; 
 Fri, 28 Aug 2020 13:46:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v20sm203498pju.14.2020.08.28.13.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:46:48 -0700 (PDT)
Subject: Re: [PATCH v2 28/45] target/arm: Implement fp16 for Neon VMAX, VMIN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f5562f27-155d-dbd1-3772-b0f737ea3468@linaro.org>
Date: Fri, 28 Aug 2020 13:46:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-TUID: 0F4JGyPJJw3j

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon float-point VMAX and VMIN insns over to using
> a gvec helper, and use this to implement the fp16 case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             | 6 ++++++
>  target/arm/vec_helper.c         | 6 ++++++
>  target/arm/translate-neon.c.inc | 5 ++---
>  3 files changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

