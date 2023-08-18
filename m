Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp1917266ejs;
        Fri, 18 Aug 2023 08:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+nICzdK7YyTM4t99an8sj90NfvuKsXcWxjtvK/KBz8Yd+og53pyhwGNvHvQrxVGlM42dZ
X-Received: by 2002:a05:6358:919e:b0:134:c4dc:2c43 with SMTP id j30-20020a056358919e00b00134c4dc2c43mr4024738rwa.28.1692373513334;
        Fri, 18 Aug 2023 08:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692373513; cv=none;
        d=google.com; s=arc-20160816;
        b=Ds1cp7t6RyS2hTofHVj8tGuv/b+eCteCzd5918/eKUR/UfYqdcfDkN3MHTaE62DblU
         /Heu+6kj3m7S762C579Qsx3TbvesbKxGUQa+ENr0cQmwwrPfcAjmy1LgOFCYa6ChvU+Y
         lC3OJ7vlu0WdT61kueERK/A8rk6gfb5fP+mm/Rpek83Pr/rEX0qpshFOqZ7waxQGHAWG
         ++w4JoKbwhEv68iiNJHNjPym/ltKkPsv26i89n7QWVzmouOZn82Q4gOZWYbcDMydRtV/
         nkDRBkmMu3ayvJzSOIzgIjjzE17tU4/poKWv8FvYzyN15LClMwNBVQNN/Nrk2zNaUdRw
         y8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=doeutOUn44L8jw+lOHBD199GqBXSr/S9eSHYvvWRDkQ=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=HYdvYjxZzqobHubXd4KphYfWx2D5MbwxdDMG+IQKW4ntYCZcQzBqkoNChUZ+Onq/SE
         Gbu8Wf0xVJPpe03FhV2bWhmt3P3La8UEEBtkke9kYqFyIW7X3qIilDF+aX/PFgXt6/un
         JL6o8omXApohEVtTxTSNBT0HPINXNZLlVdlltKlMnVn2rWwMnC4/vWxgxb79qdMuu7kz
         4xQQzUSp61gMUbSOPJT5w8IfQyYletuPtfUKTlWm3x4Zy42HKc3poqNyGA5e8+XdKLhI
         hKhR3zh5Ck7SBZSH/+fKJoH1invnitOxju+V7QjQc3syhJ/raNGWGdC+ARUJBu/ujLK0
         W0Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FeqZ2bUJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020a05622a134e00b003f9a7314533si1417612qtk.127.2023.08.18.08.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Aug 2023 08:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FeqZ2bUJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qX1ee-0000MO-MH; Fri, 18 Aug 2023 11:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qX1ec-0000LU-Rs
 for qemu-arm@nongnu.org; Fri, 18 Aug 2023 11:44:51 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qX1ea-0001mB-I1
 for qemu-arm@nongnu.org; Fri, 18 Aug 2023 11:44:50 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bdaeb0f29aso7957735ad.2
 for <qemu-arm@nongnu.org>; Fri, 18 Aug 2023 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692373487; x=1692978287;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=doeutOUn44L8jw+lOHBD199GqBXSr/S9eSHYvvWRDkQ=;
 b=FeqZ2bUJ2lVPkxT/QMq9hzvfHsfIkdMQVmBMlNTzjlpDia+k0ob5i/VzPej7PsMiMg
 BulzMhd/GMiJ3HAa3v8psEK0y7zfsFCw+STdgQT/IMGfNHuwVEtN1jlqqIhlOUFy37gF
 TKmxocol599khHGriSKSxt0Oo9ufd0ZMD90E60X37lnhLWkzlACH1hG1ECJe26DyHY/W
 yZGlvZQ+M9vaWkxlzY7zBYOmkoodyrmd3H4qnS4x4aVCPOMD1K0fgi4IHvDY73kMM/fk
 UPQ9CZP76L7AaS6z15yYMzFpK1Tt23F2U/Uzmq97gcCq2Xw007B19XpkZV0V0hDv4Tlh
 KhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692373487; x=1692978287;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=doeutOUn44L8jw+lOHBD199GqBXSr/S9eSHYvvWRDkQ=;
 b=KL42vjzEqOP3rQptlR2nRltKfkzPL12nc3LdsTnKG+zKBkvwflKwd5gwGwE9boZgE1
 Jb1BybL9T6PhdnHkJ+yAekfb3SGrYoHfWlpfxMReCCLeSv0Vk/pKhZAd7TNxC2HnI+sh
 HdkgVeqVQ6S9EIvApz2Ulcr6DueKrx3eNyxlKyj5Ba+JCt1W5soZpwuU5nzBi9LL82uE
 zR7bGfNtOC+LkcHJXKoKoYkiIAczoOSVBntRrI4r98mBw/g6syGhv3wGjNtLkRXBvIVS
 WqiiOsxjRwkT7A0sZSv9nwbLWyNln31yv6EUgYzFfX44I+1frGOl82AbqRuAlB/HwOwa
 gyZg==
X-Gm-Message-State: AOJu0YzLmRmXuTEaKTgKmZaYMGgSAMT7LNYJSQ4H19A3Q2zQj/xNYFWi
 v4aFiqqbIjpyQh6Zb3gV/mlNSw==
X-Received: by 2002:a17:902:d3cc:b0:1b6:649b:92cc with SMTP id
 w12-20020a170902d3cc00b001b6649b92ccmr2604267plb.69.1692373487001; 
 Fri, 18 Aug 2023 08:44:47 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:cf24:6daf:2b9e:7972?
 ([2602:47:d483:7301:cf24:6daf:2b9e:7972])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bb8895848bsm1946055plb.71.2023.08.18.08.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 08:44:46 -0700 (PDT)
Message-ID: <d6d4d4ae-6514-760b-e13c-6652ca4ae103@linaro.org>
Date: Fri, 18 Aug 2023 08:44:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/arm: Remove unused allocation_tag_mem() argument
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230818123834.1370818-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230818123834.1370818-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.454,
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
X-TUID: 10dArqndO3Rz

On 8/18/23 05:38, Peter Maydell wrote:
> The allocation_tag_mem() function takes an argument tag_size,
> but it never uses it. Remove the argument. In mte_probe_int()
> in particular this also lets us delete the code computing
> the value we were passing in.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I was looking at this function to see what argument I needed to pass it
> for the FEAT_MOPS stuff, and it turns out the answer was "it doesn't
> matter because it never uses the argument anyway" :-)
> 
>   target/arm/tcg/mte_helper.c | 42 +++++++++++++------------------------
>   1 file changed, 14 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
