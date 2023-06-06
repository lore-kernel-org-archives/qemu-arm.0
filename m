Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3544713ejb;
        Tue, 6 Jun 2023 07:55:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4u4idUBmuNg+2gWQnxP1KD7W/1Gz/Bhx5quhOeMsGLvMPFRkVnFGI+qC+viMRWCqOsew+j
X-Received: by 2002:a05:6214:d88:b0:5a6:24f6:724d with SMTP id e8-20020a0562140d8800b005a624f6724dmr2508983qve.13.1686063329726;
        Tue, 06 Jun 2023 07:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686063329; cv=none;
        d=google.com; s=arc-20160816;
        b=Cd/xwUSMq/fnb0b8gFs5JTtU5MZOEe3JuU+1fSKvDROqA/O3x1bsTi+0QFqkP7wt8W
         DargaW0Zlmqem1xZI81hi3XP7t86RM3iYQx1aZBRK6BaYsHxE5XyVQgeoRC/pixYRl4y
         q0BdHGPZ07rx5zGPuczTQcxjJ5gHrZTWiNKgHIocd8YE9qMZFdW0gZzCA6DqBzczhmt7
         JWYmQcnxfTyjPb6OHjObW59PPCQyFnVosVL52tlMZAdoAfutFODe2eRgg5oVuHE3mNG5
         kPE5J89la9OKbaNPlO4JfH1e6Y9Xby712f/lnJyOJ36vXWj+Na5+8gX/Mu3d0F0DXm6T
         4Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=INnI1lr2XAhjC5wzJJ1Y/b40cRTPk74Z3EIw14ox1Lw=;
        b=W9TjoA+2lxi2sq0xZVFSlNU3042zJ99nL1Fzl+eKzQlYYXawxdkVgSnhE7IGDKQqgJ
         aKaBTLr8U0vD2twd/ztakllOZ+4E+t7453iwLnuH4SvcLl6novydiT6hqH/sv2rtyRw8
         52u78ad7/GtC6PfCQ8d6sqOyBHytSDNDhSrekz5I6NlmBZqQOi/21Hx0UHKSKXwd2W/x
         iyX4Ko5A5EL60cyzk9p0mNfwr2W0wpuVLwdk9CLeMiJngVaSmxy++lHX6ZibwEYSHsM8
         JBrvSs0cXlMmJRLpqi69CBuCVINHrETOaCSqNLSsnLu3Aa72RnIue5RL7aqKA2uaeC4m
         8aNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmxkQt7U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu13-20020a056214234d00b00625a833a0a1si6342852qvb.166.2023.06.06.07.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmxkQt7U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Y5K-0000rC-O8; Tue, 06 Jun 2023 10:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y5D-0000pp-2g
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:54:53 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y59-0005r3-TV
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:54:50 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-39a505b901dso5362283b6e.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686063286; x=1688655286;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=INnI1lr2XAhjC5wzJJ1Y/b40cRTPk74Z3EIw14ox1Lw=;
 b=LmxkQt7UPtYlFt/nctma4qRjL+9gEj39khWmBbB0IkWxx2GMUl2lpT3OvkCkOHoCkF
 Ux6M6zuR/z+z++ubTbr3G60VV5VV8RrA6LrpMshCiy8jVgOGPkBj/L5qitlQmzMTc5y9
 f+S2v0Tupkg9OW71ckbgt/2wYI3pJc3H/WjEV33pfyP7kQIghbKyUIUy+c1uDGSHoaEs
 EelI9GhlYLc2w3tvUsbEpbA4KcAD/DKfH/lRFDI8OGNPK1YIS7csyctNtf/Cy3t0MC2S
 QwMgdPXlnexFw9B2ebSrs6Dg3u7tKdD6TxcvzUx77kVkwL24aIYX7KhaUBXlRlIlzD/O
 7Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686063286; x=1688655286;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INnI1lr2XAhjC5wzJJ1Y/b40cRTPk74Z3EIw14ox1Lw=;
 b=ijw0l+B1StNpjpyiTZKd+ZyIbn/j1YeB7jXyb6lZv6zCpT5VUwPxzIhuZ0wN65kQNi
 5Ebg59uPrsnnOfv2R+Cy+x2E8qNwpDBUFC5q2yxBe5WM56dCsjCnUCfPSCjxYM96EpsM
 98212ZRPKP0oTsah43SW8Tpffk/NyfPqxqxb/R34nbtM70ceVYTZvNd4GRkZ9pXU8Mi0
 u8q1KrfFnnKmi+AzqKVQ+eY+dlrTrODdHuB0OjQQekR5SOSNwW5QiO9tQPUKPRVT9ALi
 MrIFBHRD84Z95XcJivMeTbQPl7lsIL8UDyIeYN5RzniclikQJzK/AWNIgDII1vUKSONC
 zH4Q==
X-Gm-Message-State: AC+VfDxF6CVQiFQR+QbR5EVF8JzKM3ft2DEQVKqrRU0MVps3iYV9kRcB
 8EXU4wJGL4n0iADa5NZaregckQ==
X-Received: by 2002:a05:6359:608:b0:128:6cca:f306 with SMTP id
 eh8-20020a056359060800b001286ccaf306mr2520273rwb.30.1686063286585; 
 Tue, 06 Jun 2023 07:54:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a17090b124d00b002560ab7a15fsm7717525pjb.36.2023.06.06.07.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:54:46 -0700 (PDT)
Message-ID: <4573751b-f863-02a4-e401-5b0e5cb524f2@linaro.org>
Date: Tue, 6 Jun 2023 07:54:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 9/9] meson: Replace softmmu_ss -> system_ss
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: ACi8+wWc4/4M

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> We use the user_ss[] array to hold the user emulation sources,
> and the softmmu_ss[] array to hold the system emulation ones.
> Hold the latter in the 'system_ss[]' array for parity with user
> emulation.
> 
> Mechanical change doing:
> 
>    $ sed -i -e s/softmmu_ss/system_ss/g $(git grep -l softmmu_ss)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
