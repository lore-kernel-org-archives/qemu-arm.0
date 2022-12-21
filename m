Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5322347ejb;
        Wed, 21 Dec 2022 09:14:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXthxSNwJoX9S7aVgB3SvOtrCG24x300gO+ZEr3f9GbH0HG34ID+DdAC2KywH9gMFHAEffM3
X-Received: by 2002:ad4:4a0d:0:b0:4c7:595c:9940 with SMTP id m13-20020ad44a0d000000b004c7595c9940mr3009511qvz.51.1671642842114;
        Wed, 21 Dec 2022 09:14:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671642842; cv=none;
        d=google.com; s=arc-20160816;
        b=X5Tu+b46byc5GHjuzWei09oxpQcuJndmvQbXwS/JJilcGdbhLiUSKv6cG0bOg6KfoM
         tmLDzc1yj5eJ1eXi4ler4qZV+bRho67lLHZ+EF6he4XbpraVdoo6IilNCaTL3bXpRln5
         9qr7Q+qNWygMGP9hCEfZqgBrxRbp6iubf9aw+5ah5zFpwOKns1Mg/snY8vOs44FxJkA/
         5PEY3+OzTT5K68BPdYIr9gBMi6vkc3TIV2exYSjne2qLEvGmm3ZbUdTD4jnu9dBo6R+I
         /53qI0cW84eofhiYOi7KUR/7X05ySkPSifd3NOFGPJ8ewckQtAar7FMleowmUsjdKVSU
         onPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H9yJIy+QpJBdkLtul9qBshFIzrIuJYc+4knoKV5NJz8=;
        b=UpW6Ue4wOCuG6BLMn396L0Cv+yiU8iXaPVEJdjqOGplNospXSjKxj2Kp9q0fmakCiS
         553RVz0V7k/TvY/9AMgA8u+bFilW58CuMByb3HuLu2poRVON11yT5rAwRfPslBthmecc
         /bTv9u54jyCgwv5mNv4BMiJD1MwdVf5L8Vn/ROWQAfZPsEWMeB+GrCj5WXniDybHXz6h
         E5m+CL1Ko4FEch8qyH5gUbxDQ1A9qesw79LCgxkQF/VWXpxAOP5M41yrscp2YSSc+VBH
         T7GNmJHJ66UZBqhx18UMouE40y0WcbLrChiMLxMAt7cq/3LWl0Ln9JTBSWMIXL9NnZYv
         r4RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTUy4dEK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t202-20020a3746d3000000b006fc9a9bb420si5987235qka.123.2022.12.21.09.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 09:14:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTUy4dEK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82e4-0005uQ-GA; Wed, 21 Dec 2022 12:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p82dz-0005jW-BS
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:12:39 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p82dx-0002CA-Pr
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:12:39 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so2982594pjj.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 09:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9yJIy+QpJBdkLtul9qBshFIzrIuJYc+4knoKV5NJz8=;
 b=PTUy4dEKWHizLImYQb0faHL5apyPesHNkLOaTjTQDXsZNmrd9vMIJLHaO8Yk1NXRdy
 /B7NHLf8By3r+iUXyGeOTGmCNAPidKjCpMCWkBx673/kG7ExaXnuC/+yFDF23TlNDLTE
 7KOETJyXrz2NS2mxt9NQAaDZvss7UDkdXwMe+3DVA3EWwfYFcx9RAzlr0tHFUhWAvc+P
 TPPQjmedbVX0wXw2FlIQbCR8aifSHgXVjnlxhMJ8nJ6ONVsSdKiOJLeM5aryuybNPVuu
 Se2TVj6ockLgkf9ELX3BpIRm8KyWPzZFRd3VZPdkDuTIVewe20bYRZ/Uztwzt8NIDTfa
 Drfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9yJIy+QpJBdkLtul9qBshFIzrIuJYc+4knoKV5NJz8=;
 b=NpRKew8756wayeYQ4lWR3ABI3laDMVXxMSuVJgVRaWHYZAaNPdprvIxKD4+smH66V3
 wTRp2uqDfTFiW9F7d931nt0TM8LjNfToKRDoe+kU4juFiha/bzYhe8YnWGmLMuHU4Hzn
 2tSiQdy55FHbhDBdxY26Tr2NnMuaZ9rhuAbNCfmtn5TykPyqsdN2OAFeFiMqf2nxqmqe
 RaOkunfRVnc6C2z5PNYfG5KIsogcE85TUTE8jMyrpyqFm4P4/TE9twoWwWHkh7sPefFT
 b35hn1Ih3pvJcHRQ92Kb/QsO4Y11a1hFPQhbgZd8oLIV9G6jpco1R/Pu/UpboNk9P4I7
 V69g==
X-Gm-Message-State: AFqh2kpcoo/iCrUudSO/IrhRuzBOESwlExYTIb6eg6K1o3+PFeUgl/qj
 9oUuB/eRtyBznHIX9pgb1DdQNg==
X-Received: by 2002:a17:90b:3751:b0:221:1232:b0ec with SMTP id
 ne17-20020a17090b375100b002211232b0ecmr3011085pjb.21.1671642756242; 
 Wed, 21 Dec 2022 09:12:36 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:e04c:516d:5698:abe8?
 ([2602:47:d48c:8101:e04c:516d:5698:abe8])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a17090a2fcc00b00217cdc4b0a5sm1626683pjm.16.2022.12.21.09.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:12:35 -0800 (PST)
Message-ID: <be924b62-c2ea-45bd-e949-bfc6e77c69ab@linaro.org>
Date: Wed, 21 Dec 2022 09:12:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] hw/arm/nseries: Silent -Wmissing-field-initializers
 warning
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20221220142520.24094-1-philmd@linaro.org>
 <20221220142520.24094-4-philmd@linaro.org>
 <eac96f81-8cd5-5951-6b0f-69da5985d47c@linaro.org>
 <4398ae9e-c29a-503f-0738-4a4a161eb714@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4398ae9e-c29a-503f-0738-4a4a161eb714@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: z/yrSTudEAwZ

On 12/20/22 23:16, Philippe Mathieu-Daudé wrote:
> However I find '{ /* end of list */ }' cleaner/clearer than assigning
> the first field.

I agree with that, for those cases we don't already have a separate sentinal define.


r~

