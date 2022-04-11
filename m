Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1939839lfq;
        Mon, 11 Apr 2022 15:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6w1PsKwiagM4iZZCIOM9f55l+pycxBw5flFUkWtLzuwYSBJc03zeyjJRBSje1/HB9zL5N
X-Received: by 2002:a81:16cb:0:b0:2eb:f4c2:fadd with SMTP id 194-20020a8116cb000000b002ebf4c2faddmr11806878yww.475.1649715345267;
        Mon, 11 Apr 2022 15:15:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649715345; cv=none;
        d=google.com; s=arc-20160816;
        b=sb7vUh0/SztJGds++97COE0CB0JRSU7F0paEV+gV1GAiYCwDtEw6KvUVX9ey++lOI2
         fOJ3igY+cAmOLo7uQtOPz9KegBfKSs5tVzyA2JKdQHiSaH6Dcic4UVfTi7Eh45P7Gn8W
         40h3rNp7MDPYlHSEgkCMPJc/ZRYZWqNXrNIS54EPeAwJDVoHBP+qhUIlo4FdRgOrCoLO
         eHldXkjrdMAdouynikOBlFCt+7yCjXrw4G/5SkvBZQUSzebMpeRkBQomaZfWk80wUwwo
         2PeotI9nALgjQQlKs/tjsSU3VabfRDVj7UQCtRM7ae1j/N+GeLdVVp2IknG9b5+l9GYq
         khbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Z6mFu1hzSQP6ctrth6YYhN28eSmwuzyAnSAPUgwi+TU=;
        b=uGjIty5IiVyaNb6TRd9n7BHMhdkzJ4v5fbVOKMUz6l3c/tNtfVrTOwkggp6IbsfEZK
         FCVDAB0Y9h1ETRCquCTryRSBxpxd3qjO0nWtj1o1WS5LuVGsACVxjKvMjQ99G9QBGALt
         Bv9ZnBR/1igqbyzs8/aa9cU6XPmst5tMqZPiBgGfKkl8hnCuaoWrtRSEcvcRD3xS2+DI
         WpErUsFOLMWj4a3U5WK7lkNapr0gmah7en41dHIxzLYoGAGZLNRqDOF+X9VltM2C+Pjs
         IX6v4jRnpwywTl+z29Z40NNSoGbLpGtLgNS4Gmp0hS+aHPT/WNI0puS1hisGlHAAhtX/
         m5AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4r05DuK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d71-20020a0ddb4a000000b002eb5d4fb9e1si4893581ywe.171.2022.04.11.15.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 15:15:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4r05DuK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne2K0-000099-Mq
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 18:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne2JH-00008f-Fc
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 18:14:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne2JF-0006Am-Vj
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 18:14:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id z16so15797943pfh.3
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 15:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z6mFu1hzSQP6ctrth6YYhN28eSmwuzyAnSAPUgwi+TU=;
 b=I4r05DuKC/WTNFz/sr7zBx2h0IymCesaoIhBslclb1kW+vJvA3DnwQ6yLLGPAEIKEA
 klyswV4uO+Bolx3R/HB0M+tqNRyZiRwaDYxx3xqEeaSdFe9UUyTlevgSq4+Hrw0Snp4U
 FcwMknLp+Iy2uAz2SnSYRGKyv5cBG6BmeDPqisxuoDinF4fbgLTfVucdWDtsoS9+uFrr
 LZjiHipn0gsquCzrenWITkcQBvLUeYawZLhVVh/2IADFpCjUd4O8jLKhvjQuuUK5Hdk4
 Rh4e8RfMrVzIqYNSU5fEYMZOmnC+PJyjeIBLPpVnQTXDZFEubX1CYEWINEOyviAyMAwu
 pedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z6mFu1hzSQP6ctrth6YYhN28eSmwuzyAnSAPUgwi+TU=;
 b=lZraTqD1OpRxweaNhNBd58T/3l5oSl4140HwLmMQFC5E2pCBQgS5CgiBA0YMRtAGDj
 YoCad+tO+pzY0Di222V5L9zJnLjE5tqFEmN1d6auyPDWdpXI+zOa8fzdlJgIlt6HtVfe
 MDLbNxoDoPieIAKlbkL8WHSGSfRAvkrc4gLm3nGvRrFmijoFVPQa76pqsWBlvxRHCJJa
 uT8FvrjJIssngjmS1b6snnsnKwKyesoaAWRqhcgxdG49BGa5cmYPAcjlkKgdbs+LgFJm
 YsXQrpZ5rWYdJtUkdDYY5dhc0APsY61yFg6DD7TM7atLXfTMHMgSOJNv7sTH9vm6JwHH
 5Mgg==
X-Gm-Message-State: AOAM532IZACYx45e4KS18TSz1vdrdAXcdtXLlxDjlKKhDHLo7UwVLUdo
 J8YUD6LxJV6+tHN5BOF/l9rphA==
X-Received: by 2002:a05:6a00:1701:b0:505:c49b:d2ed with SMTP id
 h1-20020a056a00170100b00505c49bd2edmr6945516pfc.56.1649715296347; 
 Mon, 11 Apr 2022 15:14:56 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 md4-20020a17090b23c400b001cb66e3e1f8sm466376pjb.0.2022.04.11.15.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 15:14:55 -0700 (PDT)
Message-ID: <78faaf43-4304-ff1e-1c8a-0102725eecbf@linaro.org>
Date: Mon, 11 Apr 2022 15:14:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/16] target/arm: Implement ESB instruction
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-15-richard.henderson@linaro.org>
 <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Zcjch6Yrc9Y

On 4/11/22 09:18, Peter Maydell wrote:
>> +      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
>> +    ]
> 
> Why don't we decode bits [11:8] here? I see it's the same
> as YIELD/WFE/WFI, but I'm not sure why we're not decoding
> those bits in those insns either...

See page F4-7074 in H.a, where bits [11:8] of the imm12 field are described with 'xxxx'.

>> +static bool trans_ESB(DisasContext *s, arg_ESB *a)
>> +{
>> +    if (dc_isar_feature(aa32_ras, s) &&
>> +        arm_dc_feature(s, ARM_FEATURE_EL2) &&
>> +        s->current_el <= 1) {
> 
> This is doing the right thing for M-profile but only rather
> indirectly because it happens to get caught by the FEATURE_EL2
> check.

Yes, I had though that a feature, reducing the number of checks, but...


> I think it would be safer to explicitly check for
> not-M-profile (which then gives you a place to put the
> "For M-profile minimal-RAS ESB can be a NOP" comment that got
> removed above).

... fair enough.

> I think a comment noting that without RAS we must NOP would
> be useful here.

Ok.


r~
