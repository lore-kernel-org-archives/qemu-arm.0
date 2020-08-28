Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1844897lfc;
        Fri, 28 Aug 2020 15:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4V+gSVTTbKTMWbmwtjoK5m7QxvjAgVxWHqiXXsQpDdOlmS3VlDbSI52xjkxhk5YRzdQBz
X-Received: by 2002:a25:7453:: with SMTP id p80mr5550926ybc.441.1598655471783;
        Fri, 28 Aug 2020 15:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598655471; cv=none;
        d=google.com; s=arc-20160816;
        b=Va230FeY6fzzsIsyPqMg0jmGqsb6WzaVPmWJAKRbuClOV+dYB85G6IbqOlLec0yTZR
         u7tZ04NKcB8Oe0y69NclqqXx2k+Ci5h5LdRGZKgaH57zGXWba2udjpth30NgWW/8kf36
         j7P8m0a2xKjBCUycTpHQLtEgTfhZ0opJzu/ZfG5Oa2PfdLRP8l2G4EYnAx56XI5oueXh
         sPbJTY4zokjR+mu/SVk0QkgkIFUW5O/qBJBd6SO4+rh2ImhTiZNLRi8E+o2hWQuNks+L
         I2sXyBwJibQGOjY7xUfuG4WmEOA2NaVGDdNpL9PiucS7XRLSGTL5mbVHc9pCgOHJ98gS
         c9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vr7/94X/ISbH0MIWH8Q3N/llWaToJDvUTex71/t/ZS0=;
        b=IqFXPR5/HTB6Oq+MFe4GONSFZ/juy+t+UcaphC93/z3ObhhlroOCq4PK5dCQt0ehEc
         0two4N0er2O9VDDJAvHhw/KTroJgDWeRpuD6HchqwF9Ks2L8hc4QcX2K6V7TYxncA7nO
         Rl5V7r78pIp5tDWE6dBVKaQ0OQrHX4amt6R75sj7tuQrOLvB7Wnd/sA/CT4+ztrOQE8v
         MIdvUyldcgDkBqIUas6tJDsZG7P3GrpK2OQSYnluh4KsCEkA2FfzSVDLxvb3O1BenoV6
         olvyJWL6hetNgmL9HGihQJTGpxJ4u7sxSr6kJWTzbmz28xJ0aOR7SdhRWXbwKABipLq0
         6asA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="inpC/3Ot";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si679155ybw.299.2020.08.28.15.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 15:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="inpC/3Ot";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnJf-0001De-72
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 18:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnJW-0001D1-Rj
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 18:57:42 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnJV-0003Nd-3o
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 18:57:42 -0400
Received: by mail-pl1-x642.google.com with SMTP id bh1so324306plb.12
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 15:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vr7/94X/ISbH0MIWH8Q3N/llWaToJDvUTex71/t/ZS0=;
 b=inpC/3Ot8TVObT5ygG3Vr8tsZ/LYmC3B0o8Hn/Eqm7KlHxNf3pxvwT3maICGiGbwaD
 wg3axbbXrcya0F51L6mIl22sex93sfxY6+wz5jsiuks7qDfHAVMfW94KTrxXf8E1+GPm
 c8BDKuRjneve7TeKlRKJDFrfFC+kdMBVtIOMErMRYPkOtS6pLi7lpt0Y77HZU4pmkvWv
 Kv4tKyD7dfOcDgLPXuxSdsJ+rzQx1ILGhRkHZaFQHWnrkM08vVpTgf2O+DDNeDwxA8yd
 WP0AFAEnXW3Hnt0Z9HBzE4sl53w98aF9DJ4O2MfbRw+YBnJ2QD2iyBdmCR+2HFAg5Gbk
 BUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vr7/94X/ISbH0MIWH8Q3N/llWaToJDvUTex71/t/ZS0=;
 b=dcztkY1vzatVSowFtEV9B5b6mUo8B2dX4hFz82r00juDcTqWz1IH/+h6wkXQ/Y2bTi
 xleV3oi06a05oj7KR+XI8WWo9c2KLT7OWvvgyXGpAsPAauRzpLnizA0eqn7GNJllXY6a
 E8F5Nqsw7jeF+bxwOvmjVmq/1DxGkOs/yNzHghUK6fmJgZ1xqIFExoYV5a2swU8CJt8X
 dCaMHLAvsT+XS7F9ftu/MHIkncCW9KE/tkohLLULp5JBSGkr1I6ugchMhUHbg/qHq8uc
 D3eR7lnWdNYqXI4gJPdVE79Cd/MzjmsWuYFlK7wUtIErTwz2Mg+gnRr1xpYFtkHBdphj
 CDNA==
X-Gm-Message-State: AOAM533+kakdJIhkDPbBONb3TdvEylEnyLD1CDbJA4l3Zl+hsa/5/SGt
 QM5uHGO5Mwzy2MtO5pApk+7edA==
X-Received: by 2002:a17:902:9692:: with SMTP id
 n18mr857297plp.110.1598655459835; 
 Fri, 28 Aug 2020 15:57:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 29sm327672pje.10.2020.08.28.15.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 15:57:39 -0700 (PDT)
Subject: Re: [PATCH v2 32/45] target/arm: Implement fp16 for Neon fp
 compare-vs-0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc820128-9148-db55-22a7-717ed94887f2@linaro.org>
Date: Fri, 28 Aug 2020 15:57:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
X-TUID: 6uZiZM7QeXKC

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the neon floating-point vector compare-vs-0 insns VCEQ0,
> VCGT0, VCLE0, VCGE0 and VCLT0 to use a gvec helper, and use this to
> implement the fp16 case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             | 15 +++++++++++++++
>  target/arm/vec_helper.c         | 25 +++++++++++++++++++++++++
>  target/arm/translate-neon.c.inc | 33 +++++----------------------------
>  3 files changed, 45 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

