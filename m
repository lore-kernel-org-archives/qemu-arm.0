Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4956791ejc;
        Mon, 6 Mar 2023 10:11:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/bkSgkZDrkCnfbdG7LyBjm0ZtU4dMaHD9ef3m4WZQoCGFiFamfrP7IUC5ZJXw35H7Eeh+w
X-Received: by 2002:a05:622a:170b:b0:3b8:58d0:b4e4 with SMTP id h11-20020a05622a170b00b003b858d0b4e4mr20301087qtk.33.1678126279728;
        Mon, 06 Mar 2023 10:11:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678126279; cv=none;
        d=google.com; s=arc-20160816;
        b=AfTSmP8gKjKd3usx9YmmZudfeucbHFoeJgyI49O7w+J3HYzSVEyv3qI+f2TA0I00WR
         H/RVyAOHkE/KphlWJ0ScIwSw30eRHPEt6mSndv4y9SlDZ4gKCUhlPEOjUL/ZuqnJTr8q
         wlOhAFUYnqutIlkDeFx7VHrz28vzbzU2KJ7g0ERTYLzzJNru6d8z5UyDTqyfteVKQe0S
         Bcj/mhx9hAZLIgC9r+0+6nuM9Imgr0+Xk8KpeWZj/Mna5T579Hoz0pSD2sAwyx+FXnnS
         19f/PiBbbpJQcRm1vxcMuTEttpITCFcCAQG9THWKfnwkUxvbl3bm5aWMKYUZLrdkbHDy
         B6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KpoPRq4xeIXJc2QJ8SHpXZqZ9VxjcubXP4aPrtZf44c=;
        b=gYmn57Yun7Vd115TJ+AwJSTOB99X/BhstrBoL32+dgaUUrvxrFDaIDNkgYrXHIFmdn
         YhDb8aNaaHa3VPRkhebZReGLvjzYlFX58ibHub2wUrYoco3Kkem/7diQ89foy+vsDsuE
         5+bXen0BBVVBNGRg/eKAWsDVBwHxphMZaOo7WO3i7jDhvBe9kk+VEmCBdfxt7M1H5uKC
         VMlfQZmhtI2iMbZ92v9wxu1sJ8unwCzH3ryNp3Nyw75JDqb3gxPxQBRzKPxvSn46lqXp
         h303I3FVRdaeBvW2Ifdir0mT8IwIA6zRf5SEC2FTOGWATfrZcteTqTzXiCyWVkqfkB8z
         6Itg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dhAQY8yU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020ac87dcf000000b003b86b6c14f4si7445463qte.254.2023.03.06.10.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 10:11:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dhAQY8yU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZFIm-0004Ke-Pq; Mon, 06 Mar 2023 13:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZFIl-0004Jw-3y
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 13:11:11 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZFIj-0002p4-8E
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 13:11:10 -0500
Received: by mail-pl1-x644.google.com with SMTP id i5so11390408pla.2
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 10:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678126268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KpoPRq4xeIXJc2QJ8SHpXZqZ9VxjcubXP4aPrtZf44c=;
 b=dhAQY8yUqtGoCSCq6gb84LIVWcn1jvKcyXAzeTwI2WwX9A25jbJTZMaxoJnM0dpkvB
 281p4NT+8KtajAvSCdgSzg/8dGfFkxPkV3xgd3J+iUMQeAoKo8A5EkDtLslCJM1fxJdX
 Gi3TogMXfewWc3DLVwSaLI01QcjXmB55mM8tJKu9Tk9/kvk19IWAs8Kbp+s/w6/3bDQJ
 cYs3D1x6ctKLx+AkTtS3A+D1nw+laaWZBROUYWjcnRovMccuzEaROZxaKo7oYmlPSTzw
 Twr46MzO6tXa/fgtVMrfezoX15oryQWQI2llrI6uTEL/r70o9TpwzGXPycle7hw0yJMa
 C8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678126268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KpoPRq4xeIXJc2QJ8SHpXZqZ9VxjcubXP4aPrtZf44c=;
 b=jcKqkyIo5WZP+gHiLiJggaf85tqnVmE/GGRzhXwEmShyJ5pmQQsY52ttg0sM6TIlPq
 UIBUpPLkDrDMTYzPO8Fa+Zc0Voihfl40+qttZLW+e9jbHghw1d/l4BkzQSP+0g7BZTrV
 7VTuy8VpuVKz121aWAMXSXvhTXt02uRGvBIdvxu0KWBDL/4TBijUkdGbuo4hGzKO+5Ud
 rTJyfanzP5rOFjbptQOVy8ouD2hoM0p/l2Lh4ESc7pG1gY5ZdGYYtQ6+s+bqC8ygLcFE
 ZyZIwuM5wxf6RwbfPA+ve2ZZxjXjfzaUwzdPzfZtGnmF0Fsy/gN/YLSTjVaeiem5fNGx
 XSJg==
X-Gm-Message-State: AO0yUKWovHuBJ6oGFrIfjF6z2JKJJIoIEozHz5M4vpuQuXHRn4wAVDoj
 U1Go7BG76UrbfS8DEdpEbI7MwQ==
X-Received: by 2002:a17:902:ec8f:b0:19a:972a:7cb3 with SMTP id
 x15-20020a170902ec8f00b0019a972a7cb3mr15537158plg.60.1678126267635; 
 Mon, 06 Mar 2023 10:11:07 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170903244b00b0019bd934433dsm6915655pls.286.2023.03.06.10.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:11:07 -0800 (PST)
Message-ID: <eea42ad1-3113-d2fe-81b2-46434734e5f7@linaro.org>
Date: Mon, 6 Mar 2023 10:11:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] target/arm: Support reading ZA[] from gdbstub
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230228003713.861168-1-richard.henderson@linaro.org>
 <20230228003713.861168-4-richard.henderson@linaro.org>
 <CAFEAcA9RJ0YTPG52tazPBvo7=DnmotgpoXKPyS=SD3d63ifwjg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9RJ0YTPG52tazPBvo7=DnmotgpoXKPyS=SD3d63ifwjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 7htP3BhhUR58

On 3/6/23 03:06, Peter Maydell wrote:
> On Tue, 28 Feb 2023 at 00:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Mirror the existing support for SVE.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> 
>> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
>> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>> +    g_string_append_printf(s, "<feature name=\"org.gnu.qemu.aarch64.za\">");
> 
> Isn't there an upstream-gdb-defined way to access the SME matrix ?

Not yet.


r~

