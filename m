Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp382905ejx;
        Sat, 9 Sep 2023 08:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl1fYIpJXeqMTaJhtkp+f9oTgmRNptVKe1m8nCJ/Tln9x5L0gjDxD3cbL8gnslB5fwWIhG
X-Received: by 2002:ac8:5912:0:b0:403:b2fc:1e69 with SMTP id 18-20020ac85912000000b00403b2fc1e69mr6333203qty.12.1694275127404;
        Sat, 09 Sep 2023 08:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694275127; cv=none;
        d=google.com; s=arc-20160816;
        b=bPJIWswfhvAXBHjYNsrnzoKdXznw+Qxnk6UbE9r9rFrCoLqvxTNFZQQ71V+b58NYD9
         o/A6+dAX8KS1AjimiOia7pbvjGD0jNF2q4+gtCMXTg7AOAwqRqbAAHzL1yIgHHPAx5N9
         QHyWlRzF3ui76HgXJYenKYbQpOqeLTOGRob3kA8alZaufOycVj2qXESr9SP/q/tDgIG0
         GJsJCALesIZRDxaoWhav5FCafZSp4hYarJTwphmwbeL8+24lXuGpPaggPg+nhYlT6eWD
         c5Qep8iyiPQ+y4vMgJ8tEKNnRqqOaCsNl9tVKEeaqyxJo6KCVUaUuKkWTE1qo2qhWSrD
         5uAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=k7lyftKjpac+B4tW5zU2gSfyT8PFFD7P0aqODmN+Lnk=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=kQmswhgp6mC64HUSIYcIaGXjWEz+HnV8c/RGK3yu1JopyT5UFhr6A+bSX2vzFohizu
         lJ4gMO5W4f2BChkPcuhVYTNICu3aTQHChj4NdsyKBfZaImcqlQlUr7D/O+K4xt7eT+QB
         kYGPRi4KkHMvOW7Ru6aO2VfVtqEqUzE6AdPyKsdN7k3a98WbwkR1BYOwvAzE+Upuz9ly
         SWmQL8n24k309MzfY+8DYNBm4j4asfbyeNMWFLW98wdG1k/FDx1D7TjkoPFxfuURrE8e
         iFpb3drpo9IB/CNHZsZNzk/wLjkhXOie5rpgZ85YrL6mKDvbtakQRU5PbZ4FuDiLOPRI
         qyZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z6x1g+48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a05622a000300b00405513964f7si2625612qtw.51.2023.09.09.08.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Sep 2023 08:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z6x1g+48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qf0Lq-0006JP-W0; Sat, 09 Sep 2023 11:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf0Lp-0006ID-Kq
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 11:58:25 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf0Lm-0003Z1-DU
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 11:58:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-26b41112708so2361207a91.3
 for <qemu-arm@nongnu.org>; Sat, 09 Sep 2023 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694275100; x=1694879900; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k7lyftKjpac+B4tW5zU2gSfyT8PFFD7P0aqODmN+Lnk=;
 b=Z6x1g+48n1tXEw9ugJQlrJBu+FcMJz2ytM6zSKL/5w5JxAVrDLV6kaqpStpA2eHV9t
 kYBWxeamrwvEmtzZ1kEFsDfz+i100PPiWzZuBpqFHdMgmxCImy52D9ai8eZNrCFuBKRQ
 6WOoORYyRcjwg8LPMXwQ+kjftslr6i6SAdqJrkcjWYExVpH2HAfLqn7n3YBbOmKDUUP7
 KGioY05V0PkHMwX0cfvxorv9QJTfFd2xDGOP79oZ9CRqgBLQlurjJ6Tk+fnaf7TpOqA+
 /JW24drJ4LYd8+NiXifBqnrauMakIO2bTQI99NgOBw+wrwCjTowYuTEsrSRfJ2LoT5t4
 5h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694275100; x=1694879900;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k7lyftKjpac+B4tW5zU2gSfyT8PFFD7P0aqODmN+Lnk=;
 b=LbNgNll1em6MJR7QdIyBR7OGgvuc81rHHFgBZdouzh0/AvRtELOsD5I9pXsY/6sVag
 9xKo8wbk513Az2SdSqtW9dD1lBZ9pshOw4EkfJOKwzPK7oQPBiqZ1m69WVEytZ3dX0I+
 FBUM1NjCSkc6JveOvF0E1TyEAYu9nnDbTNWOQdUMEghFBymf0I9NVNQY3WVlaLkL0Asf
 am5LNYDQkxhp2ZFxupkUcD8hQUthw8KaDrsi47syruQJ6SKKqab8q3lGC1mhUsTXpdUz
 hPvAa0i/NsvJ7SNqciFEc48MiUTNuoCzRVv3qnuj0b9tOg8ydf/MaU2IiIKehHJ9a+Sd
 tIuw==
X-Gm-Message-State: AOJu0Yxi89undIvK1lXnq3Mq3T6g/YNh0RG9Y2CjE0kxUSWv32dCBFrU
 tCiJ4d5qEjaXiZ9GJHGEG/DDNw==
X-Received: by 2002:a17:90a:2c9:b0:26b:48e8:cd76 with SMTP id
 d9-20020a17090a02c900b0026b48e8cd76mr5387094pjd.37.1694275100374; 
 Sat, 09 Sep 2023 08:58:20 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170903100b00b001b895336435sm3445710plb.21.2023.09.09.08.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 08:58:19 -0700 (PDT)
Message-ID: <fc2e99c0-2301-38a7-f20e-7c9176ffec00@linaro.org>
Date: Sat, 9 Sep 2023 08:58:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 09/14] target/arm: Implement the SET* instructions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: KCuotjqkQZAk

On 9/7/23 09:03, Peter Maydell wrote:
> Implement the SET* instructions which collectively implement a
> "memset" operation.  These come in a set of three, eg SETP
> (prologue), SETM (main), SETE (epilogue), and each of those has
> different flavours to indicate whether memory accesses should be
> unpriv or non-temporal.
> 
> This commit does not include the "memset with tag setting"
> SETG* instructions.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper-a64.h    |   4 +
>   target/arm/tcg/a64.decode      |  16 ++
>   target/arm/tcg/helper-a64.c    | 323 +++++++++++++++++++++++++++++++++
>   target/arm/tcg/translate-a64.c |  49 +++++
>   4 files changed, 392 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
