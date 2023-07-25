Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp26756ejb;
        Tue, 25 Jul 2023 11:37:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG6PG+Ha57463bZQmUgFx4dSQkPF/C9ilTBqY82uVUeNfaOOv4DJY9rys3u5HnASMi/HxGc
X-Received: by 2002:a05:622a:1aa5:b0:403:e7aa:4ba8 with SMTP id s37-20020a05622a1aa500b00403e7aa4ba8mr3997625qtc.3.1690310221854;
        Tue, 25 Jul 2023 11:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690310221; cv=none;
        d=google.com; s=arc-20160816;
        b=VH7P1EDtlNb8Huu0ZufII5JsjlGgTc4RZV9fv+BBs5i52N1VD+ZvRInHv+WO1E5FsP
         riMrnOMPS4PCHZovNaqccJsVGjKsqW7GJyARoxIhyUyhY8pYaAk7/P8szwbpDqyudDH/
         UPD1mNPFzndZ7LTKK5XOW7p09dEgnPCxpVCnM4sqDhYs1wmKVS0QVyZZacN+4LERujHB
         zcJqKzJ8+yKN46xAPq9JY0be+IDeybD/sJ9vPqEfxN5jR3CS5NWgWGo94S+Xl+k9WkGj
         d/VsUBsoS6ds/iUWVfTMtd2wl1kZFaOqWZLD16MNtdIstOQOP85S+7ZJaDNu9jHoecUC
         1d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gZAPlvPWYUTp4z9QljCKilDGvRoinPZYI6o4B5qGstU=;
        fh=rdQCX1qeekyMAWmhXJhxNVlQpgHv4+fi2JS7acfhn+k=;
        b=kmaiVU2zRknSvCSKtA9knOw2SlrrgNH3aYtLYsmLMmTQuOJFCttsMi63SiqEADyhCw
         xrssSk7+E7zQEjviRJPkHCTDlGrZXIKX0601NW2i/lwOkWC3vg+EIgAmM3XBmJUGv1CH
         dxhy1K5xZXC2XnG7vv3DU6q2CslBiI604rEtPA7sWrVpIZW4K+iKipbWwdvp7GzBUdC0
         KZpuqEYWwRmG7XHNl2pnAVbSan1DquUU1cQHjTgPNkPdGzr27QL584K43KCbAoaqMJi9
         VEGWmfdDUA+r34lGr4pBcT8lq5VOL0Ep0mMMWkYMTa+I7WEBNwrpc5KQhKE8+Mwsg8sc
         sgow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=McfCmZQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19-20020ac85e53000000b00405514d07e1si5590299qtx.764.2023.07.25.11.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=McfCmZQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMtn-0006AC-QG; Tue, 25 Jul 2023 14:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qOMtl-00069P-Vv
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:36:42 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qOMtj-0000Km-Ow
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:36:41 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686ba29ccb1so106326b3a.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jul 2023 11:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690310198; x=1690914998;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gZAPlvPWYUTp4z9QljCKilDGvRoinPZYI6o4B5qGstU=;
 b=McfCmZQjB/PFhXCjYPS1gskKIZbowdc0exaQLDidVzuvSizYuRUstUsSqxTL7/q/td
 X1Nhyojmr+pBF+FtbLPg+wk4fbvTAA7ggqcBRwulUJ7j7YFyk5q7146CqjRDZbCBE6O6
 FrL7N4cQengBMQo73KYYB09etHwtOQ2+PC42fcygE9ltjVCBBTNLIgKSnq0BmMepTZSU
 aFfnHQL90daWnAcV41ySdmFUstCi3H+9ZYIasPCx5xyBOZ+yBUZbtojpdFyI1TUTMpt4
 TTBcTjkDTh1ACuUNCRfIn+uzCgpMr0ROby3ZhU21XB/geFCms46DXVgHTUKCIJsddPfv
 Gd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690310198; x=1690914998;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gZAPlvPWYUTp4z9QljCKilDGvRoinPZYI6o4B5qGstU=;
 b=BzgAdKupxSbzE1JUa4JD3jEOdYcmUBmm5mrteEHuz1+hj85pvm3+D3a1j8V4iA+SUW
 58EZsezjcUwGbRUuwVkHudIj6I8vNMUDvPzwO3pvRHFkhKUAHz54VZcUOnRgxNDBo26w
 nLlHi2D6Z9nBLxocix51389LlPZL83aZHPSObNz4Vw2oY2Nc/hsB91GWKCAlzfS+HeO5
 TY6sFx7uSJdxOUf9O4JHZs8LYYRfeWDzR47rAQy3M7g972aW/eRWOkOd4mc7i5MQQ5S7
 6ck0oE3YCetOV93kUmFAIbgZsdqUdZa0wILmgfkYvzh8Z+q5dUBGynkT8uSsO24/d5z/
 DoIQ==
X-Gm-Message-State: ABy/qLbd2C2hhQ7V3O00wi0iZScRApY37n/8tabVXPD43n9GldwGOOZX
 tiFf+tXTRVWdo9V+8ISfxVD1sez8Xi7pz3yHFAo=
X-Received: by 2002:a05:6a00:1c83:b0:686:626d:71e with SMTP id
 y3-20020a056a001c8300b00686626d071emr23650pfw.2.1690310197754; 
 Tue, 25 Jul 2023 11:36:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:a083:fa5e:b91b:bcc6?
 ([2602:ae:1598:4c01:a083:fa5e:b91b:bcc6])
 by smtp.gmail.com with ESMTPSA id
 b7-20020aa78107000000b0066884d4efdbsm10324514pfi.12.2023.07.25.11.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 11:36:37 -0700 (PDT)
Message-ID: <36445f06-644d-c20d-beff-2dd7a8ac5d79@linaro.org>
Date: Tue, 25 Jul 2023 11:36:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/14] target/arm/ptw: Pass an ARMSecuritySpace to
 arm_hcr_el2_eff_secstate()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-7-peter.maydell@linaro.org>
 <230dd650-846f-7105-7add-43fa2d03dad7@linaro.org>
 <CAFEAcA---QdS2vo3iAivTdBVAtFz5qOaC9Mdy2AhvXWGyaO7BQ@mail.gmail.com>
 <CAFEAcA-za6cJvahgzNMXOZrMhW4REOfZ6HKJh5GwwutJDPmbzA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-za6cJvahgzNMXOZrMhW4REOfZ6HKJh5GwwutJDPmbzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: QB+ojmDpVkjt

On 7/24/23 07:38, Peter Maydell wrote:
>> Does it? HCR_EL2 says "behaves as 0 if EL2 is not enabled in the
>> current Security state". If the current Security state is Root then
>> EL2 isn't enabled (because there's no such thing as EL2 Root), so the
>> function should return 0, shouldn't it?
> 
> I guess there's an argument that what the spec really means is
> "the security state described by the current effective value
> of SCR_EL3.{NSE,NS}" (to steal language from the docs of the
> AT operations), though.

Yes, that's how I read it.


r~
