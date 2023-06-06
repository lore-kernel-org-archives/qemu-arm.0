Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3538385ejb;
        Tue, 6 Jun 2023 07:44:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5bedlWmJ76oCMyR+TGxjYwlFCsq3N8rIsxLP2ct9yazB4OWOJZC3VI1/HRI/lNwD9yvBBV
X-Received: by 2002:a05:6214:e66:b0:56e:c066:3cd2 with SMTP id jz6-20020a0562140e6600b0056ec0663cd2mr2727618qvb.2.1686062660588;
        Tue, 06 Jun 2023 07:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686062660; cv=none;
        d=google.com; s=arc-20160816;
        b=kjrW1E1OcbPbV/pqTooR4/kTp8lSy2ZueWWMiEdLw5SPQoGPj5H0bT1LuNIitjmT2X
         +mv9mnK2Y05fWUfpWQR54dMDPtW/iPqev9DzzkGRPzbpCAxf6D9v2UiJNFZbb+5q8Dlk
         5c+0zKHUka139nK2vEic/OyTuCcszcnNqX3nDoQMYDi8XVhJ6YwOwti0VsfZY4NmItmk
         tnnkxN9d9sAMYwobHtZwWD5wrovWtG80mXKcgofXNrEI/AzWw1Ki27X+O7mH99Nq/BHL
         MCO8fcsgIYulduc2NTKUUBOFeMZQ/u/e0WOTCi/am8D9E1gYK9PK5XHI6VeotEk/wEyR
         hPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+DmIAMbunq1pomrbFObBYHR3zPVk1GkroIuzxg71Tvs=;
        b=yitrPlL4bYUk2Y7TDPAA9z8fslqJpBhfgZMuwKTsH2qxUXFgzIItql7cCwBcp+v1EI
         sEioL5NDfAeVas3Qu+SLnWeuNa1W072yP1LhdD1+v9eQv/vyn5i22F3kq2tIdd+gCPBc
         U0HKZdxOjTxvO5I3LA/vPsnl64l7JS1AWxWWBaXg8c/uEOvKoeYzsYs6ElCqKBgHG+Al
         B2b6xztMA+sM33hQHEEYAzmO4BGdLAJHIuA/I/q3f5BFVHVfkXOCEqB9q7RHVxYgGSEB
         8EU93lGjKJ9/G9dgT/8+zVQaSnCXiHiHfdXCVnHk4ch3egl+ygXwATP7S/uaYL5ahjOp
         qJgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=co+ciTo9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020ae9f709000000b0075d0c5038d8si6050081qkg.291.2023.06.06.07.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=co+ciTo9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Xuf-0005mv-Ur; Tue, 06 Jun 2023 10:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xue-0005kZ-J8
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:43:56 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xuc-0003hN-V2
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:43:56 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d24136685so4493996b3a.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062633; x=1688654633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+DmIAMbunq1pomrbFObBYHR3zPVk1GkroIuzxg71Tvs=;
 b=co+ciTo9d//afNbYvWaad3TbOUv/eF6ZQhg/wRDZRO9Kebl110sLG09CiTrrdDB/cN
 U5fzCSKpytAv3rCvr+FDAkb4t1OoK8vR9MZpIK0kWjlvoM8T9X43qrU59uVi5nMIaI+9
 8CM6HsDwlJbruhO/s0C94YwFcpOEDm9Ulp8N7ZUGYfDa2Rv6ZXZWuh6FAeK7Wi6aOmGr
 PkgrAbTwhNu1xpIANL35iEsrfQWj99Kwvy25R8d2waxvhv5Jh7Kmb4JmI89Qwpa1pfJG
 aqoltUIHegFZljemfPu8YLDbtVcVZ+FViwtfj6PHNSaQLqXAvfrRyOj7Q9y9lQo4E2YD
 E0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062633; x=1688654633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+DmIAMbunq1pomrbFObBYHR3zPVk1GkroIuzxg71Tvs=;
 b=YQ1Y2Gii1V8zR3QxRZ7fAFVPlee0moKNxNQ7PHE1UXmvO94S06Yn1viffc4id9XwlC
 hFTQWwu4ANvufEn66l4N0GlzQ9/syTZQ8IrF9aNN8lbk5BuSZnrLPaegsY8C4DsFNcZu
 WG3O37ZG5DRqBrk/4oqx+EOt29sF1LtyuHP8RBA+wm3HVBM/A6yiBdCjOJdY1AJl9wAj
 4pwWegh18/bBKLH9OoMYKLbOEF5xdWfJe7rLY5WHFwQlUVxGOWXebGj/qC+kg9il4gNA
 OlxKA1OOIEuh+7rdZA06/x1Kk1D70uNhyMEgSTTNYwXU0BTCNH1YNXOecbOS7jlh7UJK
 MMmA==
X-Gm-Message-State: AC+VfDxI9KVow3lxWOqEOq3WyCVTb1/8ypwkvB/6zn0eAJBcREyM93IP
 0jrC3pzl0wALiNYt7kk8kkX4/A==
X-Received: by 2002:a05:6a00:4403:b0:659:14c8:1f0b with SMTP id
 br3-20020a056a00440300b0065914c81f0bmr3276276pfb.4.1686062633323; 
 Tue, 06 Jun 2023 07:43:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a62b517000000b0064d2ad04cbesm6840668pfe.209.2023.06.06.07.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:43:52 -0700 (PDT)
Message-ID: <cad000d7-f408-9337-9328-ccb262c5fcc7@linaro.org>
Date: Tue, 6 Jun 2023 07:43:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] target: Rename per-target 'helper.h' -> 'helper.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606141252.95032-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8pz6C3Vp56IQ

On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename the included 'helper.h' as 'helper.h.inc' for
> all targets (updating the documentation).
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---

A bulk patch like this isn't ideal.  Targets that have a tcg/ subdir should have 
helper.h.inc moved into there.  At the end, include/exec/helper-gen.h and 
include/exec/helper-proto.h become unused and go away.


r~
