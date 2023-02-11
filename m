Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3189281ejb;
        Sat, 11 Feb 2023 15:49:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9o3qLyUoLWJnU8Njt+zEfh4YnoDfqcrptMp59bbaXBkVMJ6oFVCxq+2vIU9h107QqrpBTf
X-Received: by 2002:ac8:5789:0:b0:3b8:2175:fcff with SMTP id v9-20020ac85789000000b003b82175fcffmr34958346qta.31.1676159360004;
        Sat, 11 Feb 2023 15:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676159359; cv=none;
        d=google.com; s=arc-20160816;
        b=f4ar/pgV0OTeXI7l1RRqjc6fQrPEJ3Q4eSeZ68RuL8q09eYvvy0UG5srFnmiCMjPhM
         K3BdLr74cE5zYbjqFuboAkrhJ3uG5o/++OozLXltvrBrVyQ8kj7pF8791auipDoUV2wL
         BQNf3CCeXeZqGJXKVxv/fivU2dO5sp57HyMZbJkkEbCH9mJOaOkAdc9/hJUG+HQdYfhy
         yIwE8BYSduOoKPxHFJxou7BrxqVxjbIk9CFTuTVA33BBNb31lXY2wOWe/8CQp+JJviVm
         5ZushE1nCMURxoy4AFU+y0va2Y6x2yzPaAfxiY82skJL58MsoC4kvj9TQAhVM2Lz5oYw
         Hvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Y662xSXYvUMPaWAcLcTrCsWo+jXze99VnrPYhss5aRs=;
        b=qi2ZrIhez8YQ+is5K0+rsro21b2SIHSlQf4Gw+uQ1SzrjJV87SE0TcYOvkCFEHMoT2
         DXb6hEFFxydaDXzIPI9aA6asYUomOvAxkG39dwjtZmPxwOIIhDwq57IQ8AHKrspq35Ui
         OG2ovK0osb6EzeQnvceblm5uRgZsdLaQRrrZVLHuTpaZixjo0X1o0S3mvh5ZTjlhVPDt
         LPS9PfkleRRA31F2+bdO/XPFX1yK54ISOv/eSk8s/JAqQTJfcZN8MJ8bsTp78rNHUa6O
         JrtfmyQz8cKTYqo6b4atFsj7HocQFtC/ATKNjT7AczCEmF/D51KDKmhT7GVKKtVECrUP
         DN9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bWLo/6hO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020ac87f13000000b003b9c812b82asi6419679qtk.464.2023.02.11.15.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Feb 2023 15:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bWLo/6hO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQzcE-00040A-0J; Sat, 11 Feb 2023 18:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzcC-0003zo-D9
 for qemu-arm@nongnu.org; Sat, 11 Feb 2023 18:49:08 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzcA-0006pt-WF
 for qemu-arm@nongnu.org; Sat, 11 Feb 2023 18:49:08 -0500
Received: by mail-pl1-x631.google.com with SMTP id m2so10217607plg.4
 for <qemu-arm@nongnu.org>; Sat, 11 Feb 2023 15:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y662xSXYvUMPaWAcLcTrCsWo+jXze99VnrPYhss5aRs=;
 b=bWLo/6hO2PYWCtkAOI7LZIjAcs88EwQ7yoZ+z325yXQWppDZX4qbwPG5TUPwQfbjA9
 ZMvRT0WhM6jzjFokAwX/jU9l9/x7r9P3NqIaTMkxMRUziQTN+KsluHbTp1kG2frgGrwj
 lo6Kp8OyFi92syrWM178ketkhin1luJdZklta2dYQK9Pjrgfb0CAw6hnqa8gI3RWkVWW
 L8z84TZdj3dThgOi54z1C9VnhqxD91ALLD0fj5+kDKSyBmmC6ARiNLtwNpWi0xXl+pJO
 3XeMSu1kv6N+HNGW2wqPUw43AQth3E9C5gWiRvjrGI530rfj2qBBPUb+GNGqvw2ApP9T
 4XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y662xSXYvUMPaWAcLcTrCsWo+jXze99VnrPYhss5aRs=;
 b=qSb1VOZ+myoo0Ee9OOybUqm4jQ2Y5W9P3e2vOoJwkX5vt02QWRFqrVhtyYLS0VSodx
 grGqxpfD5VxzLL6PRgiNm/35fQbGAsdAT9WFc5PeQXDSnr9jtfk4T2meZ66fGuMIdU6J
 U8nIScGiYRnAR5HKgXZkkdI4WQWfSps7RgvtcDrR3aZaMH9zR3Awc0Q5vm3wyEf53GWx
 Tdcaeao7DL3Vcp9GFzxIl8kRRU6a5PFEMLvFhgdnwBvt6GZxnxtaWEFtevVm1CyMuBlC
 IiZrvncWRCkZPuztYWX555EQ6D8CoB/7VS/QcsihJ2550WvO6BGgRqLek2mwK672PcJQ
 zRxw==
X-Gm-Message-State: AO0yUKXfPu3B8vuafYxd/vSa/Ts+l5C4erFCzVcA7MHkAS4C3+ZM1JAG
 fcqzgNtwZLbeihHrNlNW6pot+g==
X-Received: by 2002:a17:90a:30d:b0:230:f7c1:10c1 with SMTP id
 13-20020a17090a030d00b00230f7c110c1mr18757638pje.41.1676159341625; 
 Sat, 11 Feb 2023 15:49:01 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 w63-20020a17090a6bc500b00230e41e98desm1206161pjj.32.2023.02.11.15.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:49:01 -0800 (PST)
Message-ID: <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
Date: Sat, 11 Feb 2023 13:48:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230210221951.1298668-1-smostafa@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210221951.1298668-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: xil7CZe1tApC

On 2/10/23 12:19, Mostafa Saleh wrote:
> @@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
>   
>           VMSTATE_END_OF_LIST(),
>       },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_gbpa,
> +        NULL
> +    }

Actually, I suspect that you need a pre_load hook that resets gbpa, which will then be 
overwritten if and only if the saved value != reset value.


r~
