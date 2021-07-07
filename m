Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2665267lfk;
        Tue, 6 Jul 2021 18:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy91dG1nVkcTD1SqHqu9Jte3Q76BQu/H4OdXd7OrubfQcxK1ccETkVgZyY/VT8bUmWEyCqW
X-Received: by 2002:a05:6102:1042:: with SMTP id h2mr17917420vsq.33.1625621662788;
        Tue, 06 Jul 2021 18:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625621662; cv=none;
        d=google.com; s=arc-20160816;
        b=GuYsI12pgl3Ux5DTr2qZJqG9lzTrHxNnfaLjVpQpVMAhuxvVSIE9XtWVJmgCQ2Yu11
         wYNELG5PgetuWDcsuDZztbsct4159nWJZYfNelQEKZ4Y6+JdGWVdbWVGuKaajLTzkAcf
         geImbHo02yReVTVFvuBFVkWIb+FDUFK3Aq+K+xX+ZQS6mU61WhEhnTBjN7j9XTmlVnXQ
         tXzZj+z6jRkBfh7eQ9rqMBqwT1V5P2Xj0eoxggaFgg7LOcLH1ioBjdnAkKQsYRworQDo
         kA9uaOAXtdUbfOK/dyYP3A+KkCM2bg0l5oVkEZMt6Wr6IUpBYuqoRdMg+W3Ur4yroDK+
         Fdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GfnO4w7zfONq/KjtjkwO2tXT1byxVRFhpgIOQqCHeBM=;
        b=D7C0f3rLNUJa3lybnrVWMkzRRQdp1QIcUZcWcqsFz/Ry/b4e02v8zDhgMj/jj9rhrh
         jZdym4DbHTs8YHfninjTZtX8JrnHAnjuJzganPttX1N2HueFzwpqMl5ibZ8hDzxWwxZn
         YVadK3CbHIiZI6t5JonBMyW2SXdk+01ZXlZDk5B2VnZse97vlyvdgPGFSO2H4HHbsc3f
         bA172Pj33MCqhM+b9zXLMM1nCHCIzHS5cuDoJHdqHJrbsaU3IAWfyRtKo5n5KWlWBvuD
         e1XvWiM9n15DzHppCt51Lc6UVsxbhqC7UW63sRo2nwY8ojfwphnYHlx4yEawyVQMhhc7
         Znsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RaLkM3yL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si14250950uad.138.2021.07.06.18.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 18:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RaLkM3yL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wSE-0006DC-23
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 21:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wRv-0006CX-Ov
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:34:03 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wRr-0006Fv-PJ
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:34:03 -0400
Received: by mail-pg1-x533.google.com with SMTP id 62so606560pgf.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 18:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GfnO4w7zfONq/KjtjkwO2tXT1byxVRFhpgIOQqCHeBM=;
 b=RaLkM3yL/0pR9lSYi1peHOzXj6rYZZQ8lvUtZkyykLWeCUluydcEfWiU+1NJh9g+kj
 LMKdoZvHCh+lfPzSeBgCzzp9TLKWwgBBJBB8ZZ3xSbc59k2i+QDm3yzqHtjeoqgCwxMu
 NhlsBcyi0xIQlTuUnQAyFV5/7M9ncf5uf5iOWuMAAqPwiW6K6egwVhLTQj7zRaPj1Oml
 K50YPDYJjXxEOb3vOYncUS1EqmgcQpk4VupSH/6n6kwK/hSdv5W9HZThebHe5BXI5pPb
 buU2xc+eB+hgY5V3FJ+tjmP4bbNR/Nxosfy3aI7iGfKuDj3Csz+iOkWSnuWFfn3kyTdb
 nUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GfnO4w7zfONq/KjtjkwO2tXT1byxVRFhpgIOQqCHeBM=;
 b=m5dDqGcCBvcamhKBt4LZ4EVCGWD9O3PLGd+0oyhp9QmB1QjFohkBnBinnGUbzaCRF0
 DltRqCITbfgdgbtNE8qCJNfHnfM7OXyi56e5ViHd4cJB4syoPmb6HRfRVhsaQzUMAfaB
 eFjZDcFBwlRZFC96FQHqZSpuATnDD1Y6rKGA0tam7xAjQMxoKTY5tr4tqI/V6/FoyqaC
 LGZtzVPUqLFKRf0HYaeS6/YgUG1ELootACKgDvyU8z4znWgVaiZe0k8lkie2ISwcOp0c
 z46WqYnFHHZGrTtLfrwxf3FNIOb8C13fD34MZKZpYWaCkE0KN8aisFaHpgUo4zQUwqtp
 Nwwg==
X-Gm-Message-State: AOAM531WPl7HBG6Aptirg367ryguOh4Tvc/W4dQgEnQ52quToRar6YD+
 g7O/HnVKiOsBUYyLtPb0RxK/519cd7CodA==
X-Received: by 2002:a62:758c:0:b029:31b:908f:4507 with SMTP id
 q134-20020a62758c0000b029031b908f4507mr18578145pfc.42.1625621638538; 
 Tue, 06 Jul 2021 18:33:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s126sm18038749pfb.164.2021.07.06.18.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:33:58 -0700 (PDT)
Subject: Re: [PATCH 09/11] hw/gpio/pl061: Convert to 3-phase reset and assert
 GPIO lines correctly on reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31d9f554-8094-01ff-a7f4-a2645016d1eb@linaro.org>
Date: Tue, 6 Jul 2021 18:33:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hAzbiExlYJAj

On 7/2/21 3:40 AM, Peter Maydell wrote:
> The PL061 comes out of reset with all its lines configured as input,
> which means they might need to be pulled to 0 or 1 depending on the
> 'pullups' and 'pulldowns' properties.  Currently we do not assert
> these lines on reset; they will only be set whenever the guest first
> touches a register that triggers a call to pl061_update().
> 
> Convert the device to three-phase reset so we have a place where we
> can safely call qemu_set_irq() to set the floating lines to their
> correct values.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c      | 29 +++++++++++++++++++++++++----
>   hw/gpio/trace-events |  1 +
>   2 files changed, 26 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
