Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp837255ejc;
        Thu, 11 Apr 2024 02:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzIzTB4JqgYki7yN5wScYOhiuuk9mMc5sU1+7WB8CDEYjiI0PKBQAVFeDd0syeuUxV+QciswaDw8P9A17Tr76HM47b6izQ
X-Google-Smtp-Source: AGHT+IHbu82+y/mT+NxUkhipPWLqpYDERJnVdIdmCITJbjGqanM1VRPAyn76M/3lXDAnhdjbgVgI
X-Received: by 2002:a05:620a:1725:b0:78d:692a:9dfe with SMTP id az37-20020a05620a172500b0078d692a9dfemr3340842qkb.28.1712828198515;
        Thu, 11 Apr 2024 02:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712828198; cv=none;
        d=google.com; s=arc-20160816;
        b=V/BNzHlgWAkWCtFa1a+o1RwX18QcPzRKJxEG6LTqEDqmXBkG5yjwC4Ph/Q3qzmRC+e
         eiNDiXFPs10J6eUba/39aZ7G7zuTTtQwt57whhXhzxxaJzgKFA9aah9yVfDG51CCGHEr
         NIQ4R4JfpgfkOsW6G4GrVpLdO6Ju5GV7ZJVLGaz4i5QCDTatPgdRldlXCP9ofnZ+swoQ
         UVznm6PEal3pV2lEf/9FhRXvr1T3vezMFmWTAtTxyPErOQUACDM5d1IJ9YYVY9LtsDQB
         XsoDUTRAncrSDknwIg641VkeU9vcWDm8xkAe2Y5/EcDjNKF9mYm9TOOzO7BgkDOiNr4A
         V1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UE6t2jCVit83Kyhn5LvJR7ZKVRuHMJ6vHRvosUhAV+A=;
        fh=CfGOM5edlcUka8Lgbi3rjLpfoRm2A6ySbkPEnSIJ9YI=;
        b=HTRHGUX4PKvRc1T2S77y23kHVhDgEcWTlnW+L7Oq51vY4u/QTQhcMobp6nnq0/ZuMa
         i3W20wuNi7akw/+ZphY0Btq5ndVmeRj72FfJUsL8ORt+V8RUXSsY/zpbmmLl/XfvG5e7
         h/8GUxYx9nKl38nPjycAwbdLYVW7vZEouvP1jGc8TMweN1EfjKDynazuXPtTR0uY/7tP
         znaWoET34RAyG2GUHFteX2zOgNHBImS7YtVez4W1TWD/5KmvbaJc8Y1myj/0IkRoP+tf
         oJYGdNdNbPR9/dzojrSi8Nkka5l/mrPOkCPBheYrIeNWgVaHt4X2P+qqaC6kkTMxR6wu
         sW6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rc44rY/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05620a0c0900b0078d69eb61fasi1087142qki.591.2024.04.11.02.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 02:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rc44rY/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruqqz-00031m-HY; Thu, 11 Apr 2024 05:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruqqx-00031B-QH
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 05:36:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruqqw-0001SV-8u
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 05:36:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so3756205e9.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 02:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712828176; x=1713432976; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UE6t2jCVit83Kyhn5LvJR7ZKVRuHMJ6vHRvosUhAV+A=;
 b=rc44rY/nygEJH94IAw6L+LeJsxenss7LasN4PSWYSrEh8+s1jxAknWXg6BIEWzerL0
 F2PWoKsEzQIgqJv41Im+Ud0Amk+oBUsGaOpxBPKoaMb+AqkkQuCfE7YzKw354yp7fM0c
 TkmGln6ZfqgLDosguCASu/Vlu7vVYMZH0hPpMGZ8Qgao3ul44ITH231x11ItAuXsyEWg
 oeasRASjcPhhZHPOKctrvLYkKeYtWEo0JVZkVt13Lwkxv54kcUm6V7ax9M2hHr3Ngnvc
 rcBIsVEMpZshqXPY1udhpihj4G4ad6lwk4Ai+syiyEhi0yRCIqoOSMT2wfnRaE6nRQwd
 BhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712828176; x=1713432976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UE6t2jCVit83Kyhn5LvJR7ZKVRuHMJ6vHRvosUhAV+A=;
 b=fjtUKgEACt43/yZ+EfZEMxcwlA9XXusRjYnwhfrmy3KRleOUMPRMj25M8apD82COVt
 HxUXPDgnRV5CoftiDSLuQCGo/ct6Ujj3BJ+ewaHOYHecDBXFsnZKKpX1D080Fc2Rex1t
 ANVb6hCCGy9Zj/RvRGBP5E1TTsBEp50tr6zVNsQBeOJw4baRcj+pQoCqk1t2P/ZHGCmp
 OLygOxSewaV/6YFtk1ZzUTv1BrfuOJ1MDuZPtjCHyfWNymU4p6OGmYvmnkNVf2lKl0Tu
 oJ8DBhu8k8j+axF4K6BIHYF4/QG7AB5hIAHxaEArCSwZOB1BBe84NELwPsc43R+Vf/0k
 0yPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIA+ZBvNqtl4MqpRjGjfi+yKXG7jf11HbyMnm7FC7VSjI1evB+VuhA8bkxuTkrTVZkwacfPg5+kr7oyZKy4ovtwoBG
X-Gm-Message-State: AOJu0Yyq06dMmKV/PrcSF0LcANzdDI0GslgZN/PaR3TnyCtDAUDK/UtT
 An0w5FaGiYipfEALCksHioT6+MbCE3Uhji6MfMD+UiBETkAFGxmELZzZSAhsDLo=
X-Received: by 2002:a05:600c:4f93:b0:416:389d:a4b6 with SMTP id
 n19-20020a05600c4f9300b00416389da4b6mr2107258wmq.12.1712828176496; 
 Thu, 11 Apr 2024 02:36:16 -0700 (PDT)
Received: from [192.168.202.175] (137.red-88-29-174.dynamicip.rima-tde.net.
 [88.29.174.137]) by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b0041772ec5d18sm4237322wmq.0.2024.04.11.02.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 02:36:16 -0700 (PDT)
Message-ID: <4c683f51-fe0f-4ef9-b424-aee8a859df0e@linaro.org>
Date: Thu, 11 Apr 2024 11:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] ui/console-vc: Replace sprintf() by
 g_strdup_printf()
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20240410160614.90627-1-philmd@linaro.org>
 <20240410160614.90627-2-philmd@linaro.org>
 <dx3zdfuwz7gam7brijaqfd4kg4uttybr2s2pjonhl4twyivhf3@afcjz4iulzcn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <dx3zdfuwz7gam7brijaqfd4kg4uttybr2s2pjonhl4twyivhf3@afcjz4iulzcn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: pf6xVRqdQZhJ

On 11/4/24 09:47, Gerd Hoffmann wrote:
>    Hi,
> 
>>      Due to security concerns inherent in the design of sprintf(3),
>>      it is highly recommended that you use snprintf(3) instead.
> 
>> -    char response[40];
>> +    g_autofree char *response = NULL;
> 
>> -                    sprintf(response, "\033[%d;%dR",
>> +                    response = g_strdup_printf("\033[%d;%dR",
> 
> Any specific reason why you don't go with the recommendation above?
> 
> While using g_strdup_printf() isn't wrong it allocates memory which
> is not needed here because you can continue to use the stack buffer
> this way:
> 
> 	snprintf(response, sizeof(response), ...);

I thought GLib/GString was recommended for formatting, so choose
this thinking mostly about style. Indeed in this case snprintf()
is sufficient. I'll respin, thanks.

> 
> take care,
>    Gerd
> 

