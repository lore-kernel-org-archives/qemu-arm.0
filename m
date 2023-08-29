Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3960477ejc;
        Tue, 29 Aug 2023 15:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxZHhM0Fy1FVEaJFG5PXpfWOLpC3LA/TH9Za7jd+PxkGsuTtfdbICFAnDtLLHPP2x3bFOQ
X-Received: by 2002:a05:620a:470a:b0:76d:268b:9741 with SMTP id bs10-20020a05620a470a00b0076d268b9741mr438217qkb.17.1693347508710;
        Tue, 29 Aug 2023 15:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693347508; cv=none;
        d=google.com; s=arc-20160816;
        b=OPBQEWiow5V+9zpBNpZA+5DUMD036iYRf03oLjYX7TmXOnN4NFh1fjZPHgiw8H2PtG
         RLZ9o9qyPUtLsXSyhOC3areX+FxYGfgGiDKpY2UGZ5/MTfC70kCGrTjOpzVJAduqDmBU
         tYzzEEWpW/PvL5xPYCU8TEYyt5+RmlU0VD3bTaU+pS9HW0tUX+/y2jw+Qqlq+a6Rwr4s
         DN7XeZzAUj9YIE0mHVr/mCoMHZQCzZKFgjGuaQi9pMEtv3aRdSxXQA2oIgKIJUEQFpXW
         1noQ/V8Tluez1CP+XsXQWwluIZK3wwJ3+WpeXU/ajgcM53PrrctGr6dt2F7VOgWATq3j
         7hNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=i+BzlalAfS3SboUKU7O75glZ8iZoS13QYwh3GvCIW5o=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=TfHGeVHBEl79thMDvk3I8IL3REGZ7Bb2scAa6qokVnL+z4UOMQSTy6njuw/rK+lCx3
         TN0XbbEURbcVjl3wZTpsnE4u2oo3mUQoY7SviILKEYXZ/9QIwNlngd7wlToLekLlbbnw
         mIQp3ms1zV9fvvDEhpcQssvAHS7W3eSwh3qmu7GVgwbhKWv8o9SrwDDRSh5S3hPmF9Ao
         Wjtijh7HClbCZGUdKKToJe+el9Wonn/tpgbD2d2g0cMljf7W6R8FiDrkqlWQw2p0nyZm
         Rw6fUFytyx5UKRA7i2mn/IClX/DgHd6ZoVb7zX/4DzBheuUFlhhbpHIsW8Nkf3/lHHZ+
         k8zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfqazTp4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a05620a438700b0076da5b428c1si4349459qkp.785.2023.08.29.15.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 15:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfqazTp4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb72E-0001ZV-SA; Tue, 29 Aug 2023 18:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb6qZ-0004QN-Vj
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 18:06:04 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb6qX-0004e6-Op
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 18:06:03 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bc0d39b52cso30357685ad.2
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 15:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693346760; x=1693951560; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i+BzlalAfS3SboUKU7O75glZ8iZoS13QYwh3GvCIW5o=;
 b=CfqazTp4pmFTOclSRNfrvyIYdDd/dBPo9dRDvqgbMsysE2ac1753PBNHisqCUkEmw5
 KzT/1jib2TqHvp1+ZBY5v/odaG1pYoAs4spbc6Px4xmx6uM2JUqGAgrqZO354rD5SKH+
 9hhGem92MVSJu1RImqXvaBCF81Hs3QgQny8RZ6Gd9jTYkXEbz6p/7J/8mGiCxt9fGk9P
 jnwAd5df0WwQZhdvpo7ThHKSpbjzk9xTspYm0SvmRDxxY4OWPnLjQfW/pWO4Z79iNTZx
 dEDKc/OuVHF9JW9MelFA0BlTR+HHAsS+7q7hx4GcHMmVW40efjBGCndmL7dA8niAZUYD
 eJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693346760; x=1693951560;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i+BzlalAfS3SboUKU7O75glZ8iZoS13QYwh3GvCIW5o=;
 b=luZd08+1bA8/EkVCkEKpVCzuAk2bCT4Ekap8cWy7b/sK81giSU2UkCwsMZ7ruPApSm
 XWmwyegpNnYR2qorrjpigv5lJUanR424rHpXOthQ0GmYqY+KwAoHV7NKnlvY7nhAb70M
 DHfQyIL9yL2/suNE5NntvtxWjXXrgncPO+W9QvXoXOCOkyYaTk451LY6xRzc5sKRN2R5
 FCRmC/nfDCuL4JwlgQFvZNd9QTdM82Up+9vWv8ZDa8XxNWJBkS2srQqFbsxSnnbX/5+e
 JoL1BgCh+99YR+K/w4MNi46wsDKpDMkicZxwHcFd1QXzfxdhdOBMsGz4kaYKrgeINZ/q
 ul4A==
X-Gm-Message-State: AOJu0Yx9MeUz9TZm/X6K3OYXR2j1v4WI0jtV8CCmJANXrl8m1Iusbh9e
 wa6578KyAIi2zjCJ6ZG1N/gyjqY7g5AJwTveIFs=
X-Received: by 2002:a17:902:eed2:b0:1b8:6cab:db7f with SMTP id
 h18-20020a170902eed200b001b86cabdb7fmr355188plb.53.1693346759814; 
 Tue, 29 Aug 2023 15:05:59 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a170903101400b001b890009634sm9878956plb.139.2023.08.29.15.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 15:05:59 -0700 (PDT)
Message-ID: <3bb2bdef-1b83-0f73-4802-8cf5d7f253f9@linaro.org>
Date: Tue, 29 Aug 2023 15:05:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/9] tests/tcg/aarch64: Adjust pauth tests for FEAT_FPAC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
 <20230822042530.1026751-2-richard.henderson@linaro.org>
 <CAFEAcA9qHW4-OGnsPnNHHhn+fda0Qri_8iqcNwkc-nhxqYiCYw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9qHW4-OGnsPnNHHhn+fda0Qri_8iqcNwkc-nhxqYiCYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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
X-TUID: FOGmBQeOVYHr

On 8/29/23 05:52, Peter Maydell wrote:
>> -run-pauth-%: QEMU_OPTS += -cpu max
>> +run-pauth-1: QEMU_OPTS += -cpu max
>> +run-pauth-2: QEMU_OPTS += -cpu max
>> +run-pauth-4: QEMU_OPTS += -cpu neoverse-v1
>> +run-pauth-5: QEMU_OPTS += -cpu neoverse-v1
> 
> Why do we need to specify neoverse-v1 here ? A comment
> would help.

neoverse-v1 has FEAT_EPAC, but not FEAT_FPAC.


r~
