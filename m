Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp980679ejb;
        Tue, 13 Jun 2023 22:17:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6zGjxN3Ps1dWx5odtBb88Eq7KRZOsfR2feNipV6OoARN+vhKUrKFBYYImoFkASfJ89YQy4
X-Received: by 2002:a05:6214:d0b:b0:621:2478:f75a with SMTP id 11-20020a0562140d0b00b006212478f75amr15320780qvh.45.1686719843419;
        Tue, 13 Jun 2023 22:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686719843; cv=none;
        d=google.com; s=arc-20160816;
        b=Qc7KVWF90u78frU/EE8C52G7vBykkAKSESvzcEMFq033hPetHNEv+2+XgFfrB333Li
         x2P9LX+gNYItyK9UMOoFZEp/5FPTQU4JkGPiShs91iuc6+vXbfdvC8j58TZ5avuODPhg
         acLUWBD1VRtW8l09jtxxbYoymiDXquWUZzl+w1SBAylO8Pc1++zQcu54oXPG+jPlrJHp
         tFy+wYlKNv8CY35mawn9Bwe4g5s2htZoFMx5S7XeS2ladI25suKhxmiXKq3GjPdUUqr9
         McpfhfjidYU9J9lhYTyuK3asKUOFtjf/jcZTNb3HtbUo8qWZynwkOfOv8ufmE78pJhtK
         Tg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Qj61P99PMz7Bwj7U991Mjm37+0kIZapr3a4VZrigir0=;
        b=NWeWudJILQBvkaKWi6pQITXyGQyF7vQ3gUNVWNhZJ03mpUVEs6bGlU/GBpqQxZbix+
         lttYE/0QSbt+qJ9ra0Mqkpvk89Kd/eCHni/pZuNxMRe5AKw+CAG1UXNu5p7G7O5ZRx0V
         y636385qpfQcqSB77wDOTShZqwER0gpDKF2Vn0OdqG4XAD2vovmBoBI5otROzWXzyn0Y
         eDz1TJ/DnO2bY01Iiq1V2ErxPlMRTJKyzxJJh8U3M/9goDdgZMclKi9WxjoovirgroMx
         K8odnFBkgujzCoLKzzHF+zjLWUWnuxEf1IJ9wUZYDvfdQYcZQKf2w1T6XH3WG3Pd1nRV
         YeaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsmzCKwB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw3-20020a0562140f2300b00626080fa03csi8767682qvb.358.2023.06.13.22.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsmzCKwB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9Is5-00064Z-Ir; Wed, 14 Jun 2023 01:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Is3-000637-6N
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 01:16:39 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Is0-0001JN-Mo
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 01:16:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f81b449357so3186455e9.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jun 2023 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686719792; x=1689311792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qj61P99PMz7Bwj7U991Mjm37+0kIZapr3a4VZrigir0=;
 b=xsmzCKwBpFPriRVOKvEcsL6CG8/+fvkjmxU1fLTKJ1aOyxrXRj+bF39zMVqdH5o9bY
 3P/n81L0HBj03l+MS7jV2gXPLq5QG/5GwE1KLwVB3JrhCWC/y92/JGrFwvU7TN5rAeZ0
 CTZSlhZ0kF6JLwmxK3UlB6j/JbtZIs3UK8Dplg0gNS3Z4+T0tmBPxBORhnVKGZMaLA9W
 sNvp3y2maKgfCL/54C7wHHV7SSA4qS0C3zR8AUdG0e1BqCiOrJglrPU1bZYJkYVjPNp7
 x4JA63vNqz+tO4GqtYCAkrOrZ+geqMBEugza8F+WlQ8BHPV5zHgHTpKr6gbF5CPj2GWm
 ScDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686719792; x=1689311792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qj61P99PMz7Bwj7U991Mjm37+0kIZapr3a4VZrigir0=;
 b=l0YpDuOjySBGSDJwxahCZlNtISe3dCpRP3EtNmsIWDmZUXzvdcrMG0uh2sq//lSsvf
 M/jd/guyUQF89ocev1uhJkzTsLkdfmf2rS17vPmu6J0680hi9zeZ9miKr9crS/e3iG6o
 q1e8VYZjUbx3EfDZuBTqKUOracaPtkKyOwMVfHCeE3rn8IgBX6occdmaQZnnCMZrjEzF
 t/hunq/m27iml9VaIM5hVuKpb54HQtxGzl19HyL/8LBpHicUHU40SJRpAfFdmmEjCXuS
 iNPoKwulUS139LstNJflS8c4PMmpQ48uzZSWdalnnXie8he5m+SK9EyGP1ib8vtB5sJs
 Unwg==
X-Gm-Message-State: AC+VfDwfwdMwtro/g5LwSGWnqsKO2HzWBev1AcpFvhhZ8LtgByQj+ceI
 OraIkM+vIy/d1wsv5gQe+dcslA==
X-Received: by 2002:a05:6000:181:b0:30f:cd95:a603 with SMTP id
 p1-20020a056000018100b0030fcd95a603mr2579482wrx.51.1686719792039; 
 Tue, 13 Jun 2023 22:16:32 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff503000000b002ca864b807csm17098769wro.0.2023.06.13.22.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:16:31 -0700 (PDT)
Message-ID: <ae869dc0-c1e9-54ec-007a-102b53b4b935@linaro.org>
Date: Wed, 14 Jun 2023 07:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 7/9] meson: Alias CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230613133347.82210-1-philmd@linaro.org>
 <20230613133347.82210-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230613133347.82210-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bh6Re4k8kh0c

On 6/13/23 15:33, Philippe Mathieu-Daudé wrote:
> We use the CONFIG_USER_ONLY key to describe user emulation,
> and the CONFIG_SOFTMMU key to describe system emulation. Alias
> it as 'CONFIG_SYSTEM_ONLY' for parity with user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   meson.build | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
