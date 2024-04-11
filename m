Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp160587ejv;
        Thu, 11 Apr 2024 13:14:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4qMuToDUeiw3ncsU0HJAg8mQVTRtBsdwiTnkdHkWt6Yd1K2daemh3kERaRWuSttKX7zOTk/vUhtgNwHsPaSRH9VSWszoS
X-Google-Smtp-Source: AGHT+IGMhkJz5yt+28VJC8pJrESFM1ls3Q9y/NLUD5BQd4DVlotY5+vwjW6yFwiK+MYOy4gWUc84
X-Received: by 2002:ac8:5a8d:0:b0:436:43ac:8370 with SMTP id c13-20020ac85a8d000000b0043643ac8370mr722962qtc.27.1712866462503;
        Thu, 11 Apr 2024 13:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712866462; cv=none;
        d=google.com; s=arc-20160816;
        b=tpw0mKDNmsBmpH6EiP/Eqhq8XxWrkVdGIeewl/MV9hqlXHlhDqCRqvVY0ld9oRBBKm
         nh2Pn3wbudXYTDwbyCNuwZJsa3KA4y/XEpShKYpZ358h+dwPrMzH4q6awzrjlyVIoqw4
         LqALDUOli3YYGi4uGOnRC7AuHokGmwnR7HK+P3Rn2aLu1o1nbzQqGfQHdfuxa7kc0zgz
         fTeewpGnEgqOLR3BhezvbgXmVkfRzB5+5lJ8vHVIrBMiLyldM9QuTMiHCSv6yWZFCVme
         dMy7I5nAvRI+YurNWN3EZCN3XSQLWayUFGnf7+CP30++7++wpZvlBsmlBSe64egkxtZ5
         2y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gFX/sl7xJ0Uk86tSI51fKGf1ykvVdP9omN56kE7qKv0=;
        fh=bW8kAoi2c9pk/ahfwzfSSKIb0YmA0CrsdWtSUl5NqqM=;
        b=PMYNHwCfyv65jemyNws6tB9MAL2rqfmqnAZhKNd3ue8oxQ/j8AduzaATPLJ3GSeoNO
         wCPEIQ774XU6JZV5Bi4L6hYTDUkIuLkvjPaF622PIOfgUdwMsVtaCqDRKma/gVKdWfc7
         PF3vAOMNV0f1H8NkkPw5ueEo4uGJ/KvbsWbVl7s179Rkfp7H0C+7psXAIR6xeVDvFYTE
         nIJBsah53XPO/7prrmoZ8/RyweXTPupXomtKUPo+oDnW352URIGZq/5NZv8BfDWCqz14
         cQC2VnbkzLz5YUO4MwqarmTQfZt3K9IZmeC/NlIPoM6Gsw2HiGFkMtYDyD4cYAO5Ochl
         EWGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z9pQeDSx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020ac87dc7000000b00434b19fe146si2313469qte.247.2024.04.11.13.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 13:14:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z9pQeDSx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv0no-0004d2-HI; Thu, 11 Apr 2024 16:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv0nX-0004az-P3
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:13:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv0nU-0007hb-Ay
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:13:27 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1e3ca546d40so1676875ad.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712866403; x=1713471203; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFX/sl7xJ0Uk86tSI51fKGf1ykvVdP9omN56kE7qKv0=;
 b=Z9pQeDSxxkHTnwmr9s3ZLU2JtkY7Ellf9x4d1THuZaNHnTUZfrclhekXzX+wsFidX4
 8Ku3MxbJo/rhGIDhTXG7qauwh/xdRMVv3AWppeADkjPFu6LkWp0NiLNQ5841DqArRWYJ
 LCmwN0+Mb8ZfAvI4+kGQSPgAHLej3ehdSPkZvFZ6KF4vZ4+SY/zwnSrvpmuDZOzfVwdS
 rUvk1RNGpUh6EsqTGtnIva/z4dXjlh8ErP1B5Pd/xFaIPO7ulJWNZOw9UdEVHEOpQ8Zr
 9XzmFAm1iKw7J1HmqWUv8e9TxHazKkvXQ0sqH/xWEzI1FWb6bkjHwv/57WSEfmml8fcH
 lUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712866403; x=1713471203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFX/sl7xJ0Uk86tSI51fKGf1ykvVdP9omN56kE7qKv0=;
 b=lg5JtOrvrGb+vAqvGPcRh0cTuEXcJs95Iru9LoOxWrr/VXQkUD6phYyF38sx9YOsoS
 1rjhN9ZzqwXqrZxBp+eKLceiY5b12EHsPAZgrNudUnm2l9VfuaFtEkD6YEy6ZUkQCgMt
 ao6wS2Inm1K4TZvMpIysyGBmrnkeKVm4xzm/QuzZJ4HZG7dDNI8uLwVxgiv6S4GxXpDF
 /IlnpyAyFBPByQ0hpKmDiutx+siHHa5i8ruhkCVoSTbzqaN2NH3VjwzKHuX59AyMJb3u
 r1AZ0tusaWs6fIOtK5X8Z2tatQEXHGHEHmQJU0jsRBgDwNXk908PSjC3ngQXbE/R3Gux
 YH9A==
X-Gm-Message-State: AOJu0YwC/9oOyFOZiJBC1f8KTSwpOl23cj0qRyHBpYBkhXhHi+FUOy33
 yv5sq24bEmCb17M4y9JDw9AnQBeTfYoa1ABDeDLm2y7Lzy1Uz2GAZKYV+T1ZY9k=
X-Received: by 2002:a17:902:ccce:b0:1e4:62e2:fc86 with SMTP id
 z14-20020a170902ccce00b001e462e2fc86mr699234ple.7.1712866402829; 
 Thu, 11 Apr 2024 13:13:22 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f7d300b001e290af5ec9sm1566304plw.115.2024.04.11.13.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:13:22 -0700 (PDT)
Message-ID: <8fd3391c-7515-47a3-89f2-49cf90b61ae1@linaro.org>
Date: Thu, 11 Apr 2024 13:13:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] system/qtest: Replace sprintf() by
 g_string_append_printf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411101550.99392-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: guZ9MAvSEerZ

On 4/11/24 03:15, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.
> 
> Replace sprintf() by GString API uses in order to avoid:
> 
>    [120/169] Compiling C object libcommon.fa.p/system_qtest.c.o
>    system/qtest.c:623:13: warning: 'sprintf' is deprecated:
>      This function is provided for compatibility reasons only.
>      Due to security concerns inherent in the design of sprintf(3),
>      it is highly recommended that you use snprintf(3) instead.
>      [-Wdeprecated-declarations]
>              sprintf(&enc[i * 2], "%02x", data[i]);
>              ^
>    1 warning generated.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   system/qtest.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
