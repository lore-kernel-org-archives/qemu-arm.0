Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1432215lfb;
        Mon, 6 Jun 2022 08:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBF6h1UdBrVJdjvx6QXxetzxnzC1DjFZBBdsDP6KOiaylyS9h31z5Larp9xEbVmAciY14B
X-Received: by 2002:ad4:596d:0:b0:464:f983:f7bf with SMTP id eq13-20020ad4596d000000b00464f983f7bfmr19766720qvb.88.1654527714241;
        Mon, 06 Jun 2022 08:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654527714; cv=none;
        d=google.com; s=arc-20160816;
        b=QEcZx+QzFu6Js8wMIa/wyH8LTfYKnAepa+czykJc9UiIoucDSG1G236nc7+MHbL9MQ
         p7zvSQu3Dbr9bs2hLuuxaueB+q8pc+NWluL6i3ApkmSlDYzobvUJACJiYFmueQoq1sc8
         Egl5AkCkk92vP2ZsAMGSs+wXvow0teg3AM5U3cuSecBDDOATzbJ9wLx5N0D5jdDyBPXO
         DH2Qg7tVIZ9ttR5kXTa6f5oVH+tWMFYGazo4y3zjGhqtep+He9O04QoBEjLZYUtE89NU
         rvw6kRVJVvcr3uTUvtzDVdIPr1qx0rLoJL5yE+DXFSUqtfnnXv64wOCyqg7T8M2siY3F
         1AiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LAZqLghCm/i7dTss0BdB9gKflCCyU1Ag7Sq14FLF994=;
        b=gyDoaUVhw8wWnSpUh5HJRbKwznAKpQ5q0mEnpO6hnv+TSdVEbbBxhq7TjJjmMgs+aB
         RZn4wCYPk/fs4tLYLNdwDAweQiy1ruT4aIfZnwA8Rm3iT1CIM4Uh/hGxwt/vwY2CA1mw
         wkdddPuoslS1onI9moUBHaDLKfnVmQNUUj9S6VkqwNE3/F15C3zVxHToxKXWZtW8c/0T
         lAsOKcj59G0lGPdesmLFBG5dCPQZicz7kYWcxypsFcg5LXWytq8PckU4m1tODkQz70g0
         eYC+pn2pqJI6MOK6V3PIsncntAMnX6kVf2PVsKlkmWN+HkXQX/9eXCSH1jMqbY1IjXVf
         yljQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pMdwACp6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv14-20020ad44eee000000b0046468973fefsi7758787qvb.131.2022.06.06.08.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:01:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pMdwACp6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEEr-00022d-I2
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyDv6-0006Gm-JV
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 10:41:28 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyDv4-0001Vx-UJ
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 10:41:28 -0400
Received: by mail-pg1-x534.google.com with SMTP id q123so13066770pgq.6
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LAZqLghCm/i7dTss0BdB9gKflCCyU1Ag7Sq14FLF994=;
 b=pMdwACp6ng+/BaldQcMtW0QS5u+pqN++hblyik8Y9VW2NHmSJNkksx5vqr+729+sYr
 /BDMaH1nPdtaUvRAeN4aGjxZtueH0qNW1MEc0UFTxpjN8y7uWvlEQirlQZTCbxX/9qJx
 5JvqV6D/Vl+9EDLbRjWYanv0Gl6FmquxU1N3IfZJzmkesVBN8/wLDjbEZF7jTw2c7RFv
 gq67WsHAWWHlT9iyPSgsFKPA44vgcvvrcX9OX9ICRfL+WW1aoNjVZFOHn+F9zCpgy9jR
 aiP9jpGuSfCMjZ+NeZ1h7ufFFEE9+N3IvJ/HdHhrvKGlKm6PZtazTKBjgq2vf2phSS+D
 0vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LAZqLghCm/i7dTss0BdB9gKflCCyU1Ag7Sq14FLF994=;
 b=lk7Fq3IlD6+bQfKAzV+0Xhimmn4DBHTiFTZQuRAtfj5RY1brO2XEGaAHcLUwgBQF2d
 a6evHmXJEOuQwnk8xjPh6OfCedA32orfU6hLMKr+4zjmFGHcBC6hG/tuT+llh/fw1Kj6
 TGjx3BYcLZO/76tHsrp8lHpS7v9VIH4XyoTdnxHnl2FPHHo4DfqXu/XPc9LslGn6Ro+J
 4x/EmQWZjpwRWNJIqQRTm8feDMzPzpcAUql3+0TCTVbG/Hh9C7Rnd+mr8JqUZg8t0nr7
 BuatrdJvs/vA6keztaA2XrjFuia8x23rq8V8/EPxFeY4tTPPQG/f3u+IlNy10g0DC+dP
 3K9A==
X-Gm-Message-State: AOAM531SGJBboieJ2qNh0FSY+6WRANdN6S52vdpS4CwAH/DhUf4Xua1h
 HuHcsxAFoj4O1f5zxu+1AKsqdg==
X-Received: by 2002:a63:e114:0:b0:3fd:97a1:7a5 with SMTP id
 z20-20020a63e114000000b003fd97a107a5mr7566843pgh.178.1654526485456; 
 Mon, 06 Jun 2022 07:41:25 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:dd1c:9738:3e40:ffe0?
 ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902a3c600b00163f36005e1sm10628503plb.42.2022.06.06.07.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:41:25 -0700 (PDT)
Message-ID: <14816c96-e9bc-2c12-a558-eda3df15f36e@linaro.org>
Date: Mon, 6 Jun 2022 07:41:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 25/71] target/arm: Add SVCR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-26-richard.henderson@linaro.org>
 <CAFEAcA80uRfdLR+4pJU6p8wDBgottFUaKDOCmgiHPj7B-qL=qQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA80uRfdLR+4pJU6p8wDBgottFUaKDOCmgiHPj7B-qL=qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Or+zElEztmv

On 6/6/22 06:40, Peter Maydell wrote:
> What about the "MSR SVCR*, #<imm>" forms ? I had a quick scan
> through the subject lines of the rest of the patchset and didn't
> see them.

They get alias names of SMSTART and SMSTOP.  Patch 30.


r~
