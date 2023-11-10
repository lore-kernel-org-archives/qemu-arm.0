Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1123407ejq;
        Fri, 10 Nov 2023 03:33:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz8GrvXO/EZsyLw77VPBo7jGo0vzWDjYL4fFKZL4xK8FK/Qg6kw/PKSxwQ0X9YNT/jqBoR
X-Received: by 2002:ac8:5e4c:0:b0:410:89e7:ef0b with SMTP id i12-20020ac85e4c000000b0041089e7ef0bmr8693737qtx.14.1699616015402;
        Fri, 10 Nov 2023 03:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699616015; cv=none;
        d=google.com; s=arc-20160816;
        b=yWLV01JoMdtajEY2WPBzgu8g3xV8Chg6SCKgoj7rXp2bFaXVt8z6xYKGykxXrVqsFt
         Q+tXwIM2MlJjJVufDoK56XgGQPYIUE7xCvpR5VpESaH3kJq3pOOERQgOukzJd2jUyQc1
         lGdeyp6KmwG/97EyQ0SarRMmCn55byFiTANg+V2s3LcsDQKNOlCGFjJY1awN7Vi7Omml
         l6etNgGvmTkbojmFkPEITuCZQW4jOmQDwLcPgfRjp1EHNQrk6V9MCiwEzY06pMY8Kb2l
         FN0GLvJ7JsYPmeijtA/9zSenaWw+BVp2FtBEArcBHCYi7oW+elMyK3OEmBkLkLGdaDIu
         FShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=N9RRjo0H7ohPMN50cLmaMghwMlykvqa2DWQuM/AlxhE=;
        fh=LMea0p/jA6xvmRSFcVeSFyoeO4LQ/xGWTUhsWuuvPcM=;
        b=wKKga5pHdJhw9K1HmZovBAjHY44Cx/JRp+3Zl2yFEL1AFOHD2fQJ34cumrP4iS4kHe
         J9EBYcLLnhMjKdDbVGbX+tvukfOn6OxK8hVdAG9OQT4Sz+GUSJTMw1oYh+6YIcjpqx+f
         vS4XmXMRJmEuajfzj05atUa7cz8MqgQ9tmIw5TrIC84khddk2NRB3UQN3HRX3etXwurK
         utkirBPi/Q4PJdT96shLukeTWMkNodp1yDSNxypQnHNArJxnf920haLpiYsC3MAFhDdr
         fO5DXYGf/eTXJjOx6NdcIxzGWwMWdI6SxXCoKq/RuewtUMv7OBUo+jCcvHJPNa2x01Sq
         nUqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpLzH6gh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a05622a018200b00417d1c0ba59si4401058qtw.341.2023.11.10.03.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 03:33:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpLzH6gh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1PlM-0004gj-8D; Fri, 10 Nov 2023 06:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r1PlI-0004gI-TB
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:33:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r1PlG-0007P6-Jd
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:33:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4083740f92dso14410125e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699615994; x=1700220794; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N9RRjo0H7ohPMN50cLmaMghwMlykvqa2DWQuM/AlxhE=;
 b=lpLzH6ghRlUR38FVa1ED8/9BWWg5tGfeYEhcIOMgEVpeK9jSuUvHY9BJ7UY1IER/qS
 UBlK1rby9dhrCHpOyizWmOhMUz9xZ+t+716wHcdB2nLWRCLLpIl+entOZPLo8AZIS7H9
 oDQJQXO0A25b7Wer9408fsAmM/8G8D2RnecTL+MtDki2G1wvzj2jSUrm7lV7CJ88beKW
 1YBsEdZTMtUneiZdIiZj0ljgfarSThLrsn496XUfkyC75cwSir/kurquQAIXaAyi0I/N
 rGZa79eSShbPSvuqcWV0syEQyP2PydjC8+6CD3TFX9hcnv5dzr1iTIoSJfikF60wQ6Rm
 l4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699615994; x=1700220794;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N9RRjo0H7ohPMN50cLmaMghwMlykvqa2DWQuM/AlxhE=;
 b=a8NngrKtKqutncAToe8bxNjLQTYDzzK40aNcYx5z6dfPodcrdr6OrpA02nXQGthFrP
 9Gye9wVqYhjiiyzzoGiN6QZwU5qGVILk127K2Z8od2RAgWYgrW4QyIccXNe2zB5c8S+Q
 aRBzId5yIC8j+XuDhcBFu6lcDFwGe/PeeJKRli45sD+6HiiGmWOUhzRu5pEGIQmq95zr
 pqXeKFK56k/AFQlLI5AqQ+9prcSirwdo8h51sNrVUC6ft3EYk4HeujBAv52icp6uvRo0
 k59/Be4lQdHXKwFzhkIvt5BTJh6fHIlKSS6kejSMFQjhZbmPUThXrkJiY5m66KssFZEb
 Vp6Q==
X-Gm-Message-State: AOJu0Yy5LSQg+eD+l9NVnGiK/PPDQyvERLv75UFsiqLM4N+8nuplS5gH
 9IvTBUSzep9PlUPBTfJPZwQvHw==
X-Received: by 2002:a05:600c:190a:b0:40a:4609:9cbd with SMTP id
 j10-20020a05600c190a00b0040a46099cbdmr1129318wmq.13.1699615994588; 
 Fri, 10 Nov 2023 03:33:14 -0800 (PST)
Received: from meli.delivery (adsl-205.37.6.2.tellas.gr. [37.6.2.205])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c445300b0040813e14b49sm4988328wmn.30.2023.11.10.03.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 03:33:14 -0800 (PST)
Date: Fri, 10 Nov 2023 13:28:14 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: "Daniel P. Berrang=?UTF-8?B?w6k=?= " <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marc-Andr=?UTF-8?B?w6kg?=Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
Bcc: 
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
User-Agent: meli 0.8.2
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
 <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
 <3wmne.fhuf28sb5yfg@linaro.org>
 <CAFEAcA-mSBgLuGLp4Tzaq0L78PtsxF19CVfmkJwaM8pHfwv7wg@mail.gmail.com>
 <ZU4SmH8LMGVJmGZp@redhat.com>
In-Reply-To: <ZU4SmH8LMGVJmGZp@redhat.com>
Message-ID: <3wo3c.z2jjrdl2xn4i@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t2NO4tRTAYZy

On Fri, 10 Nov 2023 13:23, "Daniel P. Berrangé" <berrange@redhat.com> wrote:
>On Fri, Nov 10, 2023 at 11:18:39AM +0000, Peter Maydell wrote:
>> On Fri, 10 Nov 2023 at 11:02, Manos Pitsidianakis
>> <manos.pitsidianakis@linaro.org> wrote:
>> >
>> > On Fri, 10 Nov 2023 12:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > >This kind of thing is why Coverity's unused-result warning has a
>> > >lot of false positives. We shouldn't introduce extra code like
>> > >this to work around the fact that the tooling doesn't understand
>> > >our error-handling convention (i.e. error_fatal, and the way
>> > >that some functions report errors both via the return value and
>> > >also via the Error** argument).
>> >
>> > I respect that :). But I personally believe that clinging to C's
>> > inadequacies, instead of preventing bugs statically just because it adds
>> > some lines of code, is misguided. Proper code should strive to make bugs
>> > impossible in the first place.
>> 
>> I generally agree. The problem here really is that we've ended
>> up with this odd API convention that reports errors in two
>> ways. In an ideal world we'd tidy up our APIs to report errors
>> exactly in one way (presumably via the Error).
>
>The compelling thing about our slightly odd &error_fatal/error_abort
>approach is that we can directly get stack traces showing exactly
>where the error happened.
>
>If we just propagate the error up the stack to finally exit/abort,
>the origin context is essentially lost, and when it does abort, we
>don't get a snapshot of all threads at the time the error hit, as
>we've moved on in time.

FYI: It is possible to get a stack trace using gnu libunwind which is 
portable, dependency-free and runs on many targets: 
https://github.com/libunwind/libunwind#libunwind

Or llvm's libunwind which is also of great quality: 
https://bcain-llvm.readthedocs.io/projects/libunwind/en/latest/

They are also compatible with co-routines and JIT code (At least, the 
GNU one is, not sure about llvm).
