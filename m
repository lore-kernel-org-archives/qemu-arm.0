Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2510165lfo;
        Tue, 8 Mar 2022 09:16:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt9S1GeNUFZMCnvXYJlyQLrAFFUBAfis2QnIcD5gP0QFUqJWhbWXO8bZFYHTiAvY+kOW7V
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id q16-20020a5b0350000000b0062886b86e09mr12672056ybp.39.1646759782855;
        Tue, 08 Mar 2022 09:16:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646759782; cv=none;
        d=google.com; s=arc-20160816;
        b=yk0jv9fKoB6RZgVtwk5ewvDqbczJQF7dkbeykQPcXWryd7Xex//dbRuwW6ADmo31qu
         Esvp2gFFDEOT/dG3u975rN+VQUQ4SKDtPu1vKUz1zgqL83cbiQbSwMxj1VvVuK5sz1I8
         u7PrV6w59KE4+1JK9itxWbnPmxk8gYlgdk56bvUdPxhKyiyNB4xSuZY6mQfey6qf6VyC
         6l/+oGnHJmuTj0V4rwLGmaXMx7if0PZL+UFh7rI6/qOCqJRJHcYjhSuKZihXpgvkx6jb
         9IrDlTbVgRi0StF21pNQlsEeNjIH2IXGPhoDbsAlxhu5OLj9P9nROp0lBQA+O0NczZ5s
         kJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=FbKkt2GMChw/gdDM2BH8Sw69CAIU+pcQBfXhPGI96HA=;
        b=S++DPmanNpfnrHibYDbMCXsyssOLezdLDZX3XA2hUq35HtQZDGfMAa/x224ynyokPa
         dXm6hR2ha2XCE0j3wEYuSALfh1x4uOszcYljmK9yHxQwCLFEpeopm+ZhQhGHN/pCy6aF
         pZ+7m9kZctim8XQDq6qphcO+ZqhVlyI45ydXQ0k+cHq0ed6I2EVvCh8qe8H0IIotM8NT
         6xul8GRGqydi3P3HPUs5SXqh31MnJqjJtWSH+F4YLgR3ZWs/qsRuGMYONvr4YnLIZgM/
         PR98hwinnibvGJfjQxNhiJojb8HPYhLO73y6ZImJTgdww5qbgPRd4N4AVngD7ZHhM6aH
         EE5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nKEAhxFM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i201-20020a25d1d2000000b00628771a886dsi11032746ybg.223.2022.03.08.09.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 09:16:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nKEAhxFM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRdRe-0004hX-9Y
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 12:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRdOH-0002J8-PW
 for qemu-arm@nongnu.org; Tue, 08 Mar 2022 12:12:53 -0500
Received: from [2607:f8b0:4864:20::435] (port=37442
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRdOE-0007xg-Jj
 for qemu-arm@nongnu.org; Tue, 08 Mar 2022 12:12:53 -0500
Received: by mail-pf1-x435.google.com with SMTP id t5so17880589pfg.4
 for <qemu-arm@nongnu.org>; Tue, 08 Mar 2022 09:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FbKkt2GMChw/gdDM2BH8Sw69CAIU+pcQBfXhPGI96HA=;
 b=nKEAhxFMOswT4o5bqehniY4rTDJQ85DhSiozppLwcNUSR25luVv5yZlTu+ubrE8P16
 i+uxUp3ZKjBB9vv30Iy0LH/sRUfYK4PlSTGsHS++lHpPvlitf7UeOe6hKOn7hVzC51Kz
 DysENi4pUDAyZ8Q8ZAB5asElk2px97gsSk+ZfxvdV0ebWSiRGI8c03+xwbxkQkkDCBc/
 csJzPL1TFKfewcZzMfn1VJ5BBMQN7Yku42uNcT/rVHbouSONUtvS3Dv3YfhxadAWs8rZ
 hkPMmw6MCi02cSf4ksU1fNdN+kFzyDdEEsURArBjpdcl2hnR1kAxN9bydwr1tN3d4r3G
 xw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FbKkt2GMChw/gdDM2BH8Sw69CAIU+pcQBfXhPGI96HA=;
 b=mp3N64pMHi6LTAhp+zGj9l9CbdfeKM5ijLYFmNkHsYWY31zsmyoPb4y7XCaqscx3Vv
 yNJ+GttGopm3Zpae9NjvoraO2JbI1IAaEi7z31keA439MDV6wfuEuMbewPeqBaUJ9RVl
 EsvhauqRrcwhGa7iaZVddp3HmeTTEs8Q5UEMB8mcfTYjeu/sFlxjrb4jDj3PhsutlM71
 BzfYiWvd0WRntIowWbov0JxodqZBCcT2EVXCjzTb7juSQekDw4/K9yb8dqRUo6Q3xUxC
 XKD55EL6BSvM8GnO3y4VWMtjMC0MgQclygwEtY98CDUD2hD+Kl5JH/sMaLvbgCzDTF95
 apdg==
X-Gm-Message-State: AOAM532YusJDHH8CHYg8eip0HiRWY6Orqr1Tk/B0di5PTfjxyBaBbHq3
 fg36fwsl6vQRPw1/j4J/w3+QaQ==
X-Received: by 2002:a63:e303:0:b0:380:83f6:55a2 with SMTP id
 f3-20020a63e303000000b0038083f655a2mr5268218pgh.519.1646759569188; 
 Tue, 08 Mar 2022 09:12:49 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056a000a8200b004e1414f0bb1sm21337815pfl.135.2022.03.08.09.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:12:48 -0800 (PST)
Message-ID: <a6489f6f-24da-aa1b-3845-a4b441bf80a2@linaro.org>
Date: Tue, 8 Mar 2022 07:12:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] target/arm: Fix sve2 ldnt1 and stnt1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308031655.240710-1-richard.henderson@linaro.org>
 <CAFEAcA8fKkf4T0AhyhrFZS2=vGKBJ7ZtBBtZwEfpzWqztZ0xeA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8fKkf4T0AhyhrFZS2=vGKBJ7ZtBBtZwEfpzWqztZ0xeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: smRMysXFWxYX

On 3/8/22 01:56, Peter Maydell wrote:
>> -# SVE2 64-bit gather non-temporal load
>> -#   (scalar plus unpacked 32-bit unscaled offsets)
>> +# SVE2 64-bit gather non-temporal load (scalar plus 64-bit unscaled offsets)
>>   LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
>> -                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
>> +                &rprr_gather_load xs=2 esz=3 scale=0 ff=0
> 
> We correct the xs= value here...
...
>> +    switch (a->esz) {
>> +    case MO_32:
>> +        fn = gather_load_fn32[mte][be][0][0][a->u][a->msz];
>> +        break;
>> +    case MO_64:
>> +        fn = gather_load_fn64[mte][be][0][2][a->u][a->msz];
>> +        break;
>> +    }
> 
> ...but then instead of using it we hard code use of 0 or 2 here,
> which makes the change above a bit moot.

Yeah, sorry for that.  I was in the middle of reducing the argument set collected by those 
decode patterns, then decided there was little advantage, and left something in the middle.



r~
