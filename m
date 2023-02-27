Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5070347ejc;
        Mon, 27 Feb 2023 14:01:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9299wRlW0+FoyTfocD98Lem2gSXeVNEKvIiq2t+pHnxVNmjka5/qX5D4ynfwIuA28fRG+g
X-Received: by 2002:a05:6214:2388:b0:56e:a899:1614 with SMTP id fw8-20020a056214238800b0056ea8991614mr2103729qvb.0.1677535299445;
        Mon, 27 Feb 2023 14:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677535299; cv=none;
        d=google.com; s=arc-20160816;
        b=LMMuygS94QN+BK3BncO9cKfdHpQK4lOyNUzhN52NaS2zG4vuXCFaLGMEGUU206J4yN
         FsK714cfL+vyf+6TAJnbC2fd1TC00vcNOqMvGooBq96dkPy1SFW+I5KCI6VOjeZ5Nauk
         ibBh8J6RyuNNit5ShxjO1f+bI4qKCraVBfeK7JDmOiXl5unkdwDN1SGK5JCrPL4/FT2s
         0/mQlcwg98e3+Gj0JOs50jWhPG2MLnhbLfQZhgPHW9xvy4+FeB8mCrxtFypaOODjiFnc
         xmEjJeDy+QtQKJOMsp4SHzr6UdTRyYbcM7mttJ7pl79Ugj8jgJf0tW3th5qZRwDYs/wI
         e5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4kY2qXRh3ybL8nxlU7ApPM5E+rp6yddmUTu4Cu6SGmI=;
        b=YtvewJUJi9WLyXH1ZLX5jZUd/G/sgLYCp1E/A1/6egPtf8Wn2Zr8jfI6Qu1hpx1kww
         vXbRjVChHaZLGS9ba5iDnqkxM0Wxk15/jOk+yXe3pWNyDAPbIqvPJcs0MszxAbDdk9p6
         Glf8KYoKbJUvLohUCntQoZqOQS5N0kcOruA1mnYF+BtT7egKjmDujRYYDdZw3s5wZ1jU
         bXzjGblp8CyFO+bMl4CIS2h11bRSVYmB0jREzdJuNafJZ0bhkZ6sMFSwKZt6gWqT6mGy
         0vqw1c/ke3z41Lh0eWcH66YlGBhMcNCyFHCP+rdXDdBaLhuGoBr1G8EaaqmVIJgcYdtQ
         IkAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qmcN3cyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020a0ce18f000000b00570fa2d0be0si6735071qvl.112.2023.02.27.14.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 14:01:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qmcN3cyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWlYM-0003lS-F3; Mon, 27 Feb 2023 17:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWlYF-0003XL-8J
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 17:00:59 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWlYD-00029z-1k
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 17:00:54 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y2so7693580pjg.3
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 14:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kY2qXRh3ybL8nxlU7ApPM5E+rp6yddmUTu4Cu6SGmI=;
 b=qmcN3cyAuN5EgWOw0yGlzKqIp9doylY/r+FqBoxy6Hg7VEEr6lYTsPPPrSVhqLokJF
 qDQq8QmD6KA05Nk+ORUexLaG6k9Y0PM/QAoozI34YuxTBBHJan2tVXOdoNd2U/7TMYSF
 NToStwhHJbx6feTHyafl/zXBIVal4F/mmHQYX5nxXtcXY8dvhw1R5AIAzzQ5vGOT9Nlb
 uDYUdtCHxUBAwMAV6sl2x1OwrMQif71uBESg+MQghyMU36i+eGPTiymXzWQHRtc0W3Mz
 EGlxDF0lGtWASZ/wpO5XIDps2GIJxOysj5rqUOoFsDdqiNSL9y5ZMqF6Xl+z/nq4kkxt
 ghgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kY2qXRh3ybL8nxlU7ApPM5E+rp6yddmUTu4Cu6SGmI=;
 b=LeeAXGPeFi8Y+ZzMJ2UIh3YBYlAb+aqjJUTj6tN/kWRm8f6zohnDSP9xkiYXe77dYt
 Yph34xJkhDCZy7KJprUh2Q+W+y8EBi+JH+Hqqha9P6Fn1EacWmlpKMmsCluUaxRj/aZy
 9CXs+WS+WCfwikzSV7sPgv21pdhttRNV/FDoqMZwg6TsEpr6XaJkYlVaKBwbfdS0/Oi9
 jE7couWY3yUH07LmNNJgx/DV83+61CMba0vRT50DsIUd3s+Pbb2dFyO637SrnM+krxpI
 orS4aDOybegM1vONwwqioH/zr2pBmvaCnMhDH4/Os9XeB1T3zJqMibVOWuTvpN78bcwF
 qPqg==
X-Gm-Message-State: AO0yUKUeR/jslHBh3aoxXdAmiROZHLrHQl3tPhvGNhZChHUsmpcYEYxx
 Yu2h70H94oaL2Iqsub3RoJODGg==
X-Received: by 2002:a17:902:ec8a:b0:19c:c8c8:b545 with SMTP id
 x10-20020a170902ec8a00b0019cc8c8b545mr397981plg.50.1677535249255; 
 Mon, 27 Feb 2023 14:00:49 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170902bd8900b0019a73faf773sm5084398pls.71.2023.02.27.14.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:00:48 -0800 (PST)
Message-ID: <b80bcdd5-d64c-0d90-151c-bc73257744bc@linaro.org>
Date: Mon, 27 Feb 2023 12:00:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 19/70] target/hexagon/idef-parser: Use gen_constant for
 gen_extend_tcg_width_op
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "gaosong@loongson.cn" <gaosong@loongson.cn>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, "ale@rev.ng"
 <ale@rev.ng>, "mrolnik@gmail.com" <mrolnik@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-20-richard.henderson@linaro.org>
 <SN4PR0201MB880877A0320F4E445033484DDEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB880877A0320F4E445033484DDEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: bXqp7vBhc/rV

On 2/27/23 11:55, Taylor Simpson wrote:
>> -        HexValue mask = gen_tmp_value(c, locp, mask_str,
>> -                                     dst_width, UNSIGNED);
>> +        HexValue mask = gen_constant(c, locp, "-1", dst_width,
>> + UNSIGNED);
>>           OUT(c, locp, "tcg_gen_shr_i", &dst_width, "(",
>> -            &mask, ", ", &mask, ", ", &shift, ");\n");
>> +            &res, ", ", &mask, ", ", &shift, ");\n");
>>           OUT(c, locp, "tcg_gen_and_i", &dst_width, "(",
>> -            &res, ", ", value, ", ", &mask, ");\n");
>> +            &res, ", ", &res, ", ", value, ");\n");
> 
> What's the advantage of putting the result of the tcg_gen_shr into res instead of mask?  Is there something in TCG code generation that takes advantage?

With this patch, mask is read-only, so a write to it is illegal.


r~
