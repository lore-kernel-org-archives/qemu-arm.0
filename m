Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2497280ejb;
        Fri, 8 Dec 2023 10:01:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF47oL/058TzDTzIbT4I3CEL2L/kj20f7CgDdsQnjlNLvMwsnll0dgG3HdAIeG9lUbj+lb
X-Received: by 2002:a05:6830:1be5:b0:6d8:74e2:7ce0 with SMTP id k5-20020a0568301be500b006d874e27ce0mr462886otb.59.1702058513820;
        Fri, 08 Dec 2023 10:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702058513; cv=none;
        d=google.com; s=arc-20160816;
        b=Vze7xR2ZP3kLEDx7miQj+4lQs8ci0FWZhfBhRWIb0OSZv5lS/f96u8Y+Nd6pgOsA7O
         r0poWIBhaUfuzgUwE9VTa2s/cVP1ur1+SJs2NXP9/JEUtU30VymTdhyxVHvk+ycW6AT4
         BFDVT0QLL+N2jMRJH2oj/oNGxOlaqkNeazE/7o9PtuX8tJCrTjukuicwskSKCGdmt4/n
         ktaTsiHlU4RLsCrTaw4qGHESAZt/BbVmsjAsiX2EFZI4zt1OhEku4CMj3nRwBNnCrnTL
         PQoLM3omf5m/WxnJbVaacDoFdA+krDQ3GLCITxavelvdxPL5VaxdCW97wfJotSxs1GdV
         g96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/4Vv6Rze+fS3c7oqzK9hyFILJWWiOEfb1Br8IM+zSY8=;
        fh=E5Ae+sw58p11tFK58Zyhxow9EJHZwrmlzwrzmAw9P1o=;
        b=owlaDlCcgXKjXot9L94z7PwiLZ1OCW9fyXQA/GfWdfwVTrN95JGvAq7C3eAoGDIOkJ
         XE/0uAtWlch/9KRzGhHlf51bXcagp9AyEz/hcsKtjnjAYLiUiRWMZOUb9qZ7GkbwR9O2
         NlnnDRkPhq726JwubzpfGqhlJI+VtMvln0F4bmH17DGU4wqtqDTdEXO6mtnvvZmMQ9C8
         d6QhI9bHNzCiSdZNOhkasIt7+wwwS8QZhdyvt36oqS3kSBcO/aKrzNZFkS6WZzNNUR14
         xBYn92TQjbRHf5Ob1ie5/rs0oCeVozRgsZdmxrb7VaQCbJIH6IRsm0mI+9t/R0m5ev/A
         6F3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VhUvafjn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24-20020a056102395800b004648d137971si624375vsu.381.2023.12.08.10.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 10:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VhUvafjn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBfA5-0006jr-DH; Fri, 08 Dec 2023 13:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBfA4-0006j6-1d
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 13:01:16 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBfA2-0001AU-IZ
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 13:01:15 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6ce831cbba6so1587574b3a.2
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 10:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702058473; x=1702663273; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/4Vv6Rze+fS3c7oqzK9hyFILJWWiOEfb1Br8IM+zSY8=;
 b=VhUvafjnB8srchah9X7BYYcvidIeSdqK/3pLGKDPkWw2yRtyiRu1uq+Dl+wVpMPHuj
 KCggWHucavNyh/CSdITVPSi0m/M8sQnES3+V2026YDnBMldVxIzUcf7vPC8XFALT6i9a
 cb4rCjji0005DulosbFWOdFNNXqdIfaU0gyryZ9TknzIlnUYB2qSycqc7JwPP4Dq8en7
 QTjFyYbrTC4asgp9RIySWd+j3Q2lwhTKo4wKmf2RpLHl3LaZ20H4ZYXn4gEqPrb8RW4V
 G5lLzE9KTf0XbErQESf5FFjSzDfpjhL6F0EhhWO+AQgwV5x6LnENjCDYqGRzpRb4Rfbm
 cLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702058473; x=1702663273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/4Vv6Rze+fS3c7oqzK9hyFILJWWiOEfb1Br8IM+zSY8=;
 b=rWUC7pS5bKuiW/9UGyAPGpOe1iYvJZJPwch4hnutPy6Q1f+wCYsGl80gief0To/tAa
 zFD7di7xj4wrg7u7bTQXHMcFP5rdDnA6WoyUT3L9oQ2abnT87qLrDM133lHM0sMizSnH
 j7cP8+AmabHzwdddDnsD1onMWtnE2GDOGdCeEv/P0yHOjrgpQDV7NczNHacGB+kwyy3U
 fSB0scS6y7ChX0ROukaAINZer9KnyGnXk50FyTgUoT+3SwLbv6bBhWeNRZu5dPlbzRR4
 6Ytqkv+DDujfPQZt6Sbq55jeGIJr9TbdKIlik/V5ETMBfGnqLr45ni51fyWG6ykTqnr8
 SH/g==
X-Gm-Message-State: AOJu0YyBy6x9fWxUAlJWvR+lQOPvq/b4IBovWow4vvfs1Q6yJ83G4uKY
 BhIve49+O7jGZxAo/mRIDiucAA==
X-Received: by 2002:a05:6a00:1988:b0:6ce:7b6d:b33c with SMTP id
 d8-20020a056a00198800b006ce7b6db33cmr437631pfl.29.1702058472895; 
 Fri, 08 Dec 2023 10:01:12 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 h66-20020a636c45000000b005b9288d51f0sm1815151pgc.48.2023.12.08.10.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 10:01:12 -0800 (PST)
Message-ID: <97c5932d-86bb-47d1-a93f-2f61cc3c4e14@linaro.org>
Date: Fri, 8 Dec 2023 10:01:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] util/async: Only call icount_notify_exit() if
 icount is enabled
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231208113529.74067-1-philmd@linaro.org>
 <20231208113529.74067-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231208113529.74067-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: SgU3DEYlbI92

On 12/8/23 03:35, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/icount-common.c |  4 +++-
>   stubs/icount.c            |  2 +-
>   util/async.c              | 16 +++++++++-------
>   3 files changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
