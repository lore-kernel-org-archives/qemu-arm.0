Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp68406ejq;
        Mon, 15 May 2023 16:25:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5bvDDCgIL9La7KAXXdj1OTnZPG/4oBSoSn3pYNdAP3Vg8KALqOyRsjv57U4cOp3dAUtTwc
X-Received: by 2002:a05:6214:f27:b0:5ef:422c:be7f with SMTP id iw7-20020a0562140f2700b005ef422cbe7fmr62753069qvb.12.1684193117089;
        Mon, 15 May 2023 16:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684193117; cv=none;
        d=google.com; s=arc-20160816;
        b=sYMhpEWoQfp7svskVg7UWlxPb3f56xYsv8byfSVaSe8N/V2G6vL1133tYQ7G1Naru4
         vyl1h3hwN6TpskgqyUh1RlJMiM/2LbqQU1EDIZ4tIvBfaL4441A1Klq9YYYmHeiivgac
         D+3FWNePuZafuZ74Uip5kBJKRiha/Kl7HVc1+1NUC5f0ySCNMO4Z/v9twJFSsSUt6tQn
         Zsk1PBGajIrogdbl6Dhb/qlibd/rduG6pxAknptuTjbxVy3tDKmcEHbe/TDZAh0WN7nK
         WFEZMUzLPS47m6afPXyVv2bhhsKYqCuN31GTMRc1RqROvveX4oBcNs3dkTgoSribQiGF
         zjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ErmvmWZRvra71DStvOlkrRkcQHRr4QERu5Rb/NcH9Ek=;
        b=loexeAWDQhyvS7onf4i16/7XrvA075mMT7P4W1mCWyGeulCx35EqBsH1jCeEP7HIgu
         ILaEW/hYppTQ0QaVnhyDFopIzCtMs3wOI0pUG4I0/P+ekDLtZuezrTPkbhRSuylc8wWq
         WyHHob5Q7PdOoBr3VHNv7KnXY2XZ/c7aAVflk+igFvZ9OQSUgYSK/qKjETG9Skx8kqiG
         2W2hTWA4YIlvoVY3H77Sscm5nYr2cTge82YQu5XCPhYxqXAi4B/e7nzYVONOBu872oWZ
         PLb6P19kA1k9REFT3bkoar7UEzxs5sIZ6bOvrO59MhMdTOw8YqQOSEULwN+AwuB7kLtX
         Cz4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KwV1gm05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ae9ec0d000000b00757799b6e23si331408qkg.405.2023.05.15.16.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 16:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KwV1gm05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyhYp-0006ur-O4; Mon, 15 May 2023 19:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyhYn-0006u7-J1
 for qemu-arm@nongnu.org; Mon, 15 May 2023 19:24:57 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyhYj-0001eB-UR
 for qemu-arm@nongnu.org; Mon, 15 May 2023 19:24:57 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64395e741fcso13925458b3a.2
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 16:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684193092; x=1686785092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ErmvmWZRvra71DStvOlkrRkcQHRr4QERu5Rb/NcH9Ek=;
 b=KwV1gm05spJzW9sPKWzgxiHq4Sf2tcNqz7PbleaFwreHfhTa9Etrttn9LliC5TWOlP
 kT4SOfO38ld9cSCkOHSIKaeEAAvnIRmXHWzy2h2xxU1OKnKgiYMb+gdcM9mymkzmD4d7
 nLxWqR+rZs0DvlNG6WlHT6x1w26yLxTXIt/m6O051H2ZmS46MhVVQfSs4N/HTcWF6Ing
 AV6ZNbdCrPbiTxc+JojyHq13sT4Y90gEkJWYEO5UBdAp74OyMuIYiBJExf7BOcnZBu79
 prPJSpFvyx9/f3vPW4+fxdw3c1EkY4srzBCyUAACoiYn3HSzpPZzoXwjV4ogFSIGcD7t
 YFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684193092; x=1686785092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ErmvmWZRvra71DStvOlkrRkcQHRr4QERu5Rb/NcH9Ek=;
 b=jcDyYhwLsWhZCK1UwSNIrXGY+H42/CvSw7MpnY0DDuLTxxfQPWoUj5Exa1AZdmcVP7
 0P2oSo6haW1Db665C6b/PMteTgErGobelNZU/dcmw2fpC32cLmGS+6dLAiEsiXL98AMi
 +hATSAJDaYiDalZefVkUxXZf0F18/G3aw65v08QVw7zXXPQZPnU3PqBJ80XS+pG7w/E6
 KQQS9lq1i7u/bgPmdgXd8LcH+ew1mW0rjT6h2Se/0wka/gr50k2sb9gKyeP+pcxQSSHL
 DX/v3X/H9UMDIlvNJG9s9tBBg14lAx1nhnew0fsO1wAoLhGy2m6SwwlAq80U8Brb7DWs
 63yw==
X-Gm-Message-State: AC+VfDwlc1cuSa4RQ9gD0LyivMwd3Tc6k6qI4vPRqu5P0kiKg49FL1tr
 mmgkq4MkbXzamWuWZL/9owgTMg==
X-Received: by 2002:a05:6a00:a21:b0:62a:d752:acc5 with SMTP id
 p33-20020a056a000a2100b0062ad752acc5mr48912601pfh.32.1684193092114; 
 Mon, 15 May 2023 16:24:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9902:96ac:8d8c:4366?
 ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a62e413000000b0063799398eb9sm12285075pfh.58.2023.05.15.16.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 16:24:51 -0700 (PDT)
Message-ID: <9b20442b-72de-7323-ca0b-c66e49a4c4d8@linaro.org>
Date: Mon, 15 May 2023 16:24:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 02/54] accel/tcg: Honor atomicity of loads
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-3-richard.henderson@linaro.org>
 <CAFEAcA_KaYWE+Yh+vberVqk6hV=3R1Xm2V2Po+jrS54i6S1Quw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_KaYWE+Yh+vberVqk6hV=3R1Xm2V2Po+jrS54i6S1Quw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
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
X-TUID: RfC1Hnz82nLC

On 5/15/23 09:43, Peter Maydell wrote:
>> +static uint16_t load_atom_2(CPUArchState *env, uintptr_t ra,
>> +                            void *pv, MemOp memop)
>> +{
>> +    uintptr_t pi = (uintptr_t)pv;
>> +    int atmax;
>> +
>> +    if (likely((pi & 1) == 0)) {
>> +        return load_atomic2(pv);
>> +    }
>> +    if (HAVE_al16_fast) {
>> +        return load_atom_extract_al16_or_al8(pv, 2);
>> +    }
>> +
>> +    atmax = required_atomicity(env, pi, memop);
>> +    switch (atmax) {
>> +    case MO_8:
>> +        return lduw_he_p(pv);
>> +    case MO_16:
>> +        /* The only case remaining is MO_ATOM_WITHIN16. */
>> +        if (!HAVE_al8_fast && (pi & 3) == 1) {
>> +            /* Big or little endian, we want the middle two bytes. */
>> +            return load_atomic4(pv - 1) >> 8;
>> +        }
>> +        if (unlikely((pi & 15) != 7)) {
> 
> Why is this the unlikely case ?

Ug, it's not.  Assuming random distribution of misalignment, this is 6 of 7 cases.
I'll remove all markup, as it doesn't enhance understanding.


r~
