Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp459779ejb;
        Fri, 8 Sep 2023 07:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkBplpIFpQ7ysjwaFr1683/yuEMBJiVQB/63vjUGl1+DmPXPg1CLEyG8+T1DK3EDt9Lop0
X-Received: by 2002:ac8:5ad1:0:b0:410:95bd:d43d with SMTP id d17-20020ac85ad1000000b0041095bdd43dmr2948149qtd.51.1694182771528;
        Fri, 08 Sep 2023 07:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694182771; cv=none;
        d=google.com; s=arc-20160816;
        b=MjKXfl8M41OPEqyXpmaAaC3+cq7dzQjZ1n3Zwlm/lSqfkX+nEmBx3toJOloYihnCOY
         nZr47p+PBgC0KjHAlmuzQxE9yvenzlQbZ4hlleDQQeyGWtPLPoRkcpgRtawaAentHJWG
         cA91tbBJzFBx+vZ2EZIvTYz9LMfJAz235ARhr03hF6vRFm1sd3bv8rRnzem41SYRFt1I
         qXoNlcp8FaIrXUhZcDXxEjxPBPovuOLXrJ9wD3LI5SNZ4NuppW2vy2wy2brqYgcoEXZU
         pEOG9JyaJTogHYWxM8TwkIiTmi39OseOJTLg/329nqdbFB/LVdpsHS8QJaAjD27Libhe
         1ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=JGzmzqlyHI87vneM6Qha0RxFp3f3R+b/M4nOF88y5nQ=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=yBWzWw7mq81c6XLt4l2I9yMI9t2Doa1Kh553W66pKaXMN5VA6zZjuf1ZQ8quIxCzrH
         4Dmqua0rNI8YKlZtJz3n5J2HY3fIi1Y08PlY4phWTyMUGjpazgjac5qsM4N2AgVwwaqk
         naSWAq7mvqSmMEG83+Nxz8jiVT2jTL/lOPXWOgOeB+ZmToPQB/o3C6TPdCNQWymtI1Uq
         SaQ/2r/h2tAZIeAMWUKWdZTg+Usu5k8iyJ4TVAPvBNy8dO0IgVTsJzsD2xDgn425Kvn6
         7Gu/EYjEFsFG96O8Ng1KFL0dJRmS5yrxhLwNfkUlpqoaEzCpM/8qDRksN+D4eH5WuXg5
         qtdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFVLVv1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14-20020ac8598e000000b004055346c0bcsi1189385qte.705.2023.09.08.07.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 07:19:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFVLVv1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qecKN-0007c9-HW; Fri, 08 Sep 2023 10:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qecKL-0007ba-9T
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 10:19:17 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qecKJ-0000j1-2r
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 10:19:17 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso37681261fa.0
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694182753; x=1694787553; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JGzmzqlyHI87vneM6Qha0RxFp3f3R+b/M4nOF88y5nQ=;
 b=zFVLVv1EPN8uCSCQhFIxkviaWAEucKvYVAbzYztu+GobkCccFNJ9OkWw39Ds2bqfEO
 J7jT/zz1NXcRZ3Z8AsolHS8dmBI44jzhCXlsoTK/qGyXYrRRcnGJVP1NMXRkv2+tB7g8
 PeHnYxjGt7JDLvUI8Ma7wz128s6J8EyjnPcUPTY2kQGKWbn4AOeqGxQtnbmVPuZzp8qr
 XiovsJBTV+0JcEnJKrsGQnLx4IgehFCMkhO2/ipBoqgaffTaE1KmNRk8EZRKfpWz+iAp
 2bsH3WbtBrGrsLrgB8vMFBIuEgAFwt/fAutJIVqTkejpCj0G+k905hmbQUpEMZxIIgzA
 nGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694182753; x=1694787553;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JGzmzqlyHI87vneM6Qha0RxFp3f3R+b/M4nOF88y5nQ=;
 b=pFAUb1GldAi/QOVOBuHxpmpp7R61EM3VTV5eE/I6jki84DLZtorj8bVb39r5rXrlgs
 K0O2rwSxONnX7fofa6D8VKiJ3hbeAtew/kRnRHkjV4WtlQicYRNP8c04ePpa41vp7XmC
 FwSIpFND8kO/9zObpgcpSb7LJyQBGQ0EoBvJHrkGdwjU8SzTK5hzcnOaLxhYwOqLBlaj
 1fD09JrEQ46zzayBX7wCdxhOlWVh/L8mCrn3yPLztotUSKmAi/qeSi0dISv2xBQNuk8y
 EqbuOC5LOiRABP7ifvs3q2i5wrGVksME44hLM4OVWeBRouu/huPQFqQfGLefPQtWUuMS
 qdhA==
X-Gm-Message-State: AOJu0YyjrVLNVWv9gZWp5P7bqJoWOaSMJfhXNeTepftGUfB62vbWBsIL
 7tAQAOT0z+Q2l+xyM9n2FBXCbQ==
X-Received: by 2002:a2e:9bc1:0:b0:2b9:b4eb:c39c with SMTP id
 w1-20020a2e9bc1000000b002b9b4ebc39cmr1743733ljj.8.1694182752901; 
 Fri, 08 Sep 2023 07:19:12 -0700 (PDT)
Received: from [192.168.69.115]
 (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr. [176.173.167.175])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a1709062c1600b009934855d8f1sm1106928ejh.34.2023.09.08.07.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 07:19:12 -0700 (PDT)
Message-ID: <3e1fd06b-ec03-0ccb-77e0-c52f5587a470@linaro.org>
Date: Fri, 8 Sep 2023 16:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 05/14] target/arm: Pass unpriv bool to
 get_a64_user_mem_index()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907160340.260094-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wEoO8LxBzSEQ

On 7/9/23 18:03, Peter Maydell wrote:
> In every place that we call the get_a64_user_mem_index() function
> we do it like this:
>   memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
> Refactor so the caller passes in the bool that says whether they
> want the 'unpriv' or 'normal' mem_index rather than having to
> do the ?: themselves.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm about to add another use of this function which would
> otherwise also end up doing this same ?: expression...
> ---
>   target/arm/tcg/translate-a64.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

