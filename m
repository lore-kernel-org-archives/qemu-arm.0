Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2641061ejc;
        Sat, 25 Feb 2023 01:26:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9Xv06h7KPHQ+AzQ+ydEdgdo0f0wued9jyxMSYyqfYG/wzRao0VvVjHYWIyP34wwcn8z/i2
X-Received: by 2002:ad4:5bef:0:b0:56e:b124:156e with SMTP id k15-20020ad45bef000000b0056eb124156emr28882317qvc.10.1677317193285;
        Sat, 25 Feb 2023 01:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317193; cv=none;
        d=google.com; s=arc-20160816;
        b=xVpxZ0Qepz33qAI5ZgQKwwnixiFNoTIhiQi6kqGmld+IE1KGQ1mhrIroq565azeWQP
         ODlJasyO+RcwJi8swH4ba2sZ+Hn4+zXFZI+LYbvQ1sF+4Vfh44fbXxsitHAKLCJdWb6O
         mioibRqGShOp8hwUgs1sPPPJ1yXerRjOctdH/62GnT1bSWTULPm0DKcTNkhbbJ9u60je
         3V7tl/mzhAJDeV6IzAxR8+xIL5NzZ8vSW/OAGN2roVug4qZthEqm900WxSYFBEl6X1M3
         F8jzqHVD0q0jmjBxft1enEbn+CCf+TjHxdGK4VofGMle1kKPO94iL3F801Db1wqpGs00
         xFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yHxA2wOQFMHShl8sCbWARBWtz+v6OrdY/sRfPJxwjYo=;
        b=oERRxnw89vsiW6btfzyN9CdvFfNy0Qx9Rior7KT884mOOin5tOsiyzi5IzWa65mZVo
         mewVuz4wFYp2BmyXqh7YV12YHF1bkJkhzlQNcCnAVR4zmaflMaQQWcZgEnCyOYK34R2E
         kkdFuBa0utEJ4h1GETrGa1bGBpBUIDWoWu8Iua3E49fdVum3PWGqWxCtAlEs/CTUbBUs
         cZpB1hrJPXEyEkVWrD1Fp8sCCa57O8qikkEGVGBtQiiXdWRMJMiB+rbaFq0IqASOrVvJ
         5JBUaICn8KBbwC7oDGnTeEtOB7UYbdiBNmdsmRUOnW7gTP8zh8edWPsRcxlIBJPrXgNA
         qMnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCksE971;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj18-20020a05620a191200b007425f875552si1532974qkb.25.2023.02.25.01.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:26:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCksE971;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqhE-000800-3P; Sat, 25 Feb 2023 04:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqh5-0007iv-6x
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:18:16 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqh2-0002hx-Kx
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:18:14 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso8160342pjv.0
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHxA2wOQFMHShl8sCbWARBWtz+v6OrdY/sRfPJxwjYo=;
 b=CCksE971udFBvISfU4vGG5CkgX4CGqC31u1DQOETeBzLkOKBQE/GzvABB0bveCD62k
 /iDg9VRD+MabahlyZlbJDu6oE88V3iCg/CWFgngoCb4iL9PJEfwGwU54DPOmQeI4Z/S9
 wDjK8xs2UnOrQDWMLVkSsFDdhqxl3+oqLvpOj7HVEmwfEpZ6/sfrZpvIzxQ+tVLg8iug
 JEqfsXRzXXWcDsEeE0L/brlNCNfytaRg0Dc/RLlmejbDAJ7vh8Gb01EGesZ/yNta2yMS
 m0TnrdiqKsZ2Hj7tGUszF2RGUYHm0GMFNR3sTtU1f15Ga0zZH3GBcd/SZVtCBOrk0q87
 Mb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHxA2wOQFMHShl8sCbWARBWtz+v6OrdY/sRfPJxwjYo=;
 b=BQfjBeHXfdwY+o2hj6aeA8d2yAHf7EjEOvbqfZTkUurkb45Mn8bUAhc8NwBgxKnNLW
 lkyVcvo0KazkX+GXSOG3wVQFcfd6ZohFbN6BfV/D+mqk8hX0sPdvMHWHVzzgI7QkdqwS
 rlGAhuQp/XcSF7CKU3liCVngSmZodiOg9C0gsIf5RJTd/80evTejneTGmCFlVhHLaLw6
 ywQrqJ6I0gfJh65rXTIRg4Set1XR8kJNPf69H41gWBN1f5GGxPZDfqEBOaVV2uKbezFq
 dAbHyw7cKw8OGrkXnjd3BjHlASFOhERaDEwNb3lokXnm6H8inZF9o0hxMkd6uMdNhoa8
 ytOw==
X-Gm-Message-State: AO0yUKUFtIikOs+a7r2eMsUNjnIohg7xlJFYwRXId7d0IbIcEtyzJ6uY
 N/nP8KF59gUHgsrFv1dDIV/grw==
X-Received: by 2002:a17:902:e84b:b0:196:44d4:2453 with SMTP id
 t11-20020a170902e84b00b0019644d42453mr22023371plg.7.1677316691091; 
 Sat, 25 Feb 2023 01:18:11 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u9-20020a17090282c900b001991f07f41dsm804218plz.297.2023.02.25.01.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:18:10 -0800 (PST)
Message-ID: <d54fb59f-549c-9eae-80e7-8f02462e9a2b@linaro.org>
Date: Fri, 24 Feb 2023 23:18:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 26/76] target/cris: Drop tcg_temp_free from
 gen_tcg_funcs.py
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-27-richard.henderson@linaro.org>
In-Reply-To: <20230225091427.1817156-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AGRbl2aDSQCh

On 2/24/23 23:13, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/gen_tcg_funcs.py | 79 +--------------------------------
>   1 file changed, 1 insertion(+), 78 deletions(-)

Bah.  s/cris/hexagon/ in $SUBJECT.


r~

