Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1852412lfc;
        Fri, 28 Aug 2020 16:10:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztzKpYiGcUDtS0w0282PLi5h7cFs7nJmaF7xVEbA/oU8ggKL5ATizxJM1F2RHIJYWMHmGY
X-Received: by 2002:a25:6555:: with SMTP id z82mr6322508ybb.472.1598656236114;
        Fri, 28 Aug 2020 16:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598656236; cv=none;
        d=google.com; s=arc-20160816;
        b=fRbe/XEEXDrTIu7i4l7wn88xTKLYzWiZRRkh+TIiQrzgt4PIcO7T1D+AIpSKe2+QI/
         W9dgvt0elv/lw4lnD7zYMYhpRJxIh+2IugWRv8XmZJlkKRe7jKY67oYGH517BKY70sjD
         2WWFggcbUWjE5Ud5ZfSzDGW+u2Z81a55jre9m70eEki+C2ZiqJZBFr0W0UvsJ+caZtzk
         PwxxvK3Qo2Bm2KrTlIFT856WAHVZa6AibC7TtwOO6O3eIy0Bx/QgTiBUQVavI9Y8tLFi
         eiuoory2/VxRlBFjCLq7cEU6UiiYhQFEXLcvYmAQveKDOZLtYXSkcY5nH94Hbg9xmlrk
         j/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/86uaWpsV2+7UNCKhxmdHU1qRp7rlhVnoPARlh3Gjdo=;
        b=hV+4LU+gc9YlW7n9gWBzB/dvoitcAkRt5hytkSgS49wmep9LlyqYRxcvKf+I8s16XY
         4YDw6QIi2BNUg6sEXXtW+b8WRJi97BYgoMlvdp/gp5rAZucOvwgQFdVeyH1gBqP+NsVt
         XzennMTUlLxwlPgkwMzCZHcCFsyMI3+pNrf8TXjqub9y9wut68IJWca8rU5mONUekzTj
         njb+J85zHbhfwbVn24ejoyPAus2Ve/Q3joL/2oZJ71NzJrd0c4N8XW61tTXFDyldTOhC
         V/H3S7IY4PlPtoGpf6y3D0/xiyFCJnjt91qsNa2bGLd0NY20frUMiRpmBnptgthkHBek
         RPEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eO7oHpLc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si664259ybp.130.2020.08.28.16.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eO7oHpLc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnVz-0002YM-Fg
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnVn-0002W7-Vh
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:10:23 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnVk-0004nm-3E
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:10:23 -0400
Received: by mail-pl1-x644.google.com with SMTP id bh1so334853plb.12
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/86uaWpsV2+7UNCKhxmdHU1qRp7rlhVnoPARlh3Gjdo=;
 b=eO7oHpLcuMdHMEjlP31TjcTTTulRCvcxTh71WSeszU9EFrRSaW4U2kVjLwWVXSX3x0
 0ZnBuhBkOBQfzZYluGEpheOS+8BwwGP6OdraH/Y7L9wSKHN0TC0Wm5h62YsHlZglkwPx
 MrBrtXPafhmQsjFVMZ8Wn6t4dJ9YJjGyBJJgtAzoeOOlabu3E2sm0tOU0lgfmMVtmFcX
 r4CAwWhqHm8Y/vZZuDe1rCsdMGX0sth44HB9VdHS08gY3QGhrqBwAxN8+PtIxLZbJgrn
 mFuZYY6ALGhR0NrkNVAE75h7uUynR6HF1/V/TL6js5fmj6VDux2XTlQoomxfwiuhu6Jr
 xOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/86uaWpsV2+7UNCKhxmdHU1qRp7rlhVnoPARlh3Gjdo=;
 b=RBoy4cxhu/9M1HYRdYVhqrwAqnaxr/UtEIenFQsaDb3Y32U4vHMghpmTncmsyKHVUw
 Q4/YX4ISiPZPfWj1LLaY8PKENhHp2/ryCKLctysr8K+MxvqLoCWX1hrp1+kislciDzHb
 MI1WBF0gyy6mZ0FFdI9uKfiOiwMp9XzuD6qWA/O9HBN4Gg8d4bWiv2stTrlkJWaAyXKJ
 imF9mQsc+xDixSC8c2bMLXRolK0FnZmOQ2DuAIe8PuKW1jBincZB5VPXR0+3Vv9iw4UN
 BxBpU6/Z3dx7QiVa/Plkbd3bnEdceED99Bj6Kl+8a+l3hJ/EgDo/FYnIPgEvkq15jQRw
 oJzA==
X-Gm-Message-State: AOAM532CwuL7DJgowvHLl6j8kYZdmlrG2pmBtlsL7ITCM9Qvais516W4
 4vtKlH5xrwW9Yhc5VdR4S1ygxg==
X-Received: by 2002:a17:90a:5aa2:: with SMTP id
 n31mr1011341pji.33.1598656218313; 
 Fri, 28 Aug 2020 16:10:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a13sm500030pgn.17.2020.08.28.16.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:10:17 -0700 (PDT)
Subject: Re: [PATCH v2 38/45] target/arm: Implement fp16 for Neon VCVT
 fixed-point
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-39-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e73adcfe-598f-5792-a901-1f5ed79838d1@linaro.org>
Date: Fri, 28 Aug 2020 16:10:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-TUID: X/ANo5roxPQ8

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Implement fp16 for the Neon VCVT insns which convert between
> float and fixed-point.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             | 5 +++++
>  target/arm/neon-dp.decode       | 8 +++++++-
>  target/arm/vec_helper.c         | 4 ++++
>  target/arm/translate-neon.c.inc | 5 +++++
>  4 files changed, 21 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

