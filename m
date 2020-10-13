Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2317177lfa;
        Tue, 13 Oct 2020 14:04:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd6FlyO0Non/+mlkBEBrz/lSlCHV0JOh4R7TJ0ekPh/LXos8Y0bQLf4/EtrVwVG2Yn/asj
X-Received: by 2002:a25:48c1:: with SMTP id v184mr2570915yba.113.1602623056770;
        Tue, 13 Oct 2020 14:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602623056; cv=none;
        d=google.com; s=arc-20160816;
        b=CQMqzKlT37BEoH5WEN+NI2hjFA499nsuIO2UBkcp3rqoyIvoQXpm4KozlEeU9yGrou
         KFXQUJYBeNr5DoPJrXhlTvNWYGXsK4l7gqkkBbNYftKn4hfqvVn4V1LdgC4UfkjpSu2g
         28SAlRb/kqvSl6XExzyKu243P+H4CXTtZZhF7p711mxh6TfPqfSBVF0YR53prqRo7oqN
         pwvKhHzR0ZbO52eJD8tF8aKN39LcqLXoW2FqAjh55CLdoQOzOA+Mq2pNXYRKqDScz8G4
         czxhCfsgzFz88TwlQuKgBaxMtgvA4nNRJuCl5gLSXETCXy83kNrj0X5DGZJ4bcllT+ta
         u6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ga4I9OYNBnZa92Yj0J1iTWKYRoX+Gn4YsWG55dsQZCc=;
        b=hLpSBV2TVb1Zep0xCYc2Ot8237wHGeozFIXxSSaySgzkvkOSOwoxOPG+s2g6LJYob8
         T12I8vqDS2LqNOhp3xKvkiu3NmWWuazuwrF0ja/ZoQF7XrxlTPKgb04GFAKOTLjKJuOr
         o75rY8Du1PJZf6HRYRQRCV12r1uyE/bjZjromYRFs70+UZ9p+xDw+ZaHhu+1KXm7qsSb
         wlgeuDAUp9rOd4VpaBDHaU4nxXjXTN3ImTDEob6vEJYKWf7irdkxSVfPD4SUuenzCzUi
         bvPLk00dBbkkGU11dzPij292GkxtYx2k1MleLDdAzhtEvRyxR1de8SrMROeonCegfx96
         2nSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+5bCzX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x33si1101690ybh.26.2020.10.13.14.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 14:04:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+5bCzX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSRSy-0000AC-5J
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 17:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSRQk-00077r-B1
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 17:01:58 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSRQi-0004im-IS
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 17:01:57 -0400
Received: by mail-pj1-x1043.google.com with SMTP id gm14so133247pjb.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 14:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ga4I9OYNBnZa92Yj0J1iTWKYRoX+Gn4YsWG55dsQZCc=;
 b=n+5bCzX3CzK3AOk+gct66uIE7AcAIOfdFt7ZZgQnHv+n7GDnbEcBRspHNGJqUSjhGF
 3fotr2Dro/IfaQkt+J7TAFv38QrXX7Ox4uimbEvjYsetXeAd2YHCiTBLY0inPWSq4DsG
 CKPQlGqW7pvu/KSitA0lK3rlPdPVNHlzSciQLhMNrKTvdaa6t/4DZEqOU/lzJ4T3eQD7
 A/mJP9DCebMLk4fU4FxEXlhoFGQy0Tqkc3HInXQigAbK3aOGj9O0mJz3QHYii1v/yyGS
 DxS2DYRtHXD+0LUOzAghQ3mt5GwfaGGxqkg984TO+HwG33btsn4lZPa4wakH9HeuIejU
 fc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ga4I9OYNBnZa92Yj0J1iTWKYRoX+Gn4YsWG55dsQZCc=;
 b=bVPYITPCfe5nWP3yW45YeX36lIxIDDxcHXbdkwxeyzMji7IIpkij18DHT3II2ptt7H
 C9FlYEMno9++8Bbpu6nsN5eHmMqLq2BUBPgcshgmYdQF4INKzPmMqVWXYsDOY4Qqm2cK
 q5NGIEntcT5S1tN6//G+tqi1gdzXRMZh/F+KjInI0jNaAYgjCQG69hh0tstWWQZCor67
 bifmghu19rqu85hLFBNUOOxyrHeN/hxd9wiSjJxw9k0d7dBXjf1F0ZtVfef2FVOfZ13z
 RS60Fz49fSBFvvMDyqQBLhLHlLEHfYqv7kdXzrsHN5rMJJm4I6OVVOttuQPQxZvdQkXk
 Zr/w==
X-Gm-Message-State: AOAM530HWwYkYIPHx86GF5d1+RNpKMR1jp1uZYqGxgLJ5Aoh4O7JFfNt
 o9MPmtiXK+rAE3rFh/HLS0wpOw==
X-Received: by 2002:a17:90a:e088:: with SMTP id
 q8mr238320pjy.172.1602622914801; 
 Tue, 13 Oct 2020 14:01:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t13sm595762pfc.1.2020.10.13.14.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 14:01:53 -0700 (PDT)
Subject: Re: [PATCH 09/10] target/arm: Implement FPSCR.LTPSIZE for M-profile
 LOB extension
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-10-peter.maydell@linaro.org>
 <dbba485a-b69e-9138-5db4-d146ceec3c3a@linaro.org>
 <CAFEAcA_v3f4meMrENphpXSHNz=dNBQDE0LA=_3DMjxvSKL6wnQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b64525f5-e5ba-7c36-f672-c0a560473e0b@linaro.org>
Date: Tue, 13 Oct 2020 14:01:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_v3f4meMrENphpXSHNz=dNBQDE0LA=_3DMjxvSKL6wnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EGI2JIAfQvIn

On 10/13/20 1:38 PM, Peter Maydell wrote:
>  * has short-vector support (eg Cortex-A9)
>  * v8A, can implement FPSCR.{Stride,Len} as RAZ/WI
>  * no short-vector support, Stride/Len can be written
>    but the only effect is that some insns must UNDEF
>    (eg Cortex-A7)

Yep.

The other thing I wondered is if it was worthwhile to go ahead and split out
ltpsize now, even with MTE not implemented.

Eventually the conditions here would look like

    if (m-profile) {
        if (mte) {
            ltpsize = [18:16];
        }
    } else {
        if (!v8) {
            vec_len = [18:16];
            vec_stride = [22:20];
        }
    }

but for now you could leave out the assignment to ltpsize and just leave it
initialized to 4 since reset.


r~
