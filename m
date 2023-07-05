Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3661146ejy;
        Wed, 5 Jul 2023 08:35:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGvb9LlpX2rAbRHQ3liFLvv+oLLDEAXTNEVeWkCXEv12bKhWT4y8J6DdhWL+zbN3kfCo7O1
X-Received: by 2002:a05:6358:51d7:b0:134:d27d:a338 with SMTP id 23-20020a05635851d700b00134d27da338mr4018684rwl.25.1688571353443;
        Wed, 05 Jul 2023 08:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571353; cv=none;
        d=google.com; s=arc-20160816;
        b=H36scZTePGgcfk4dEabAH0JuKqodq/2e24p8h5kHo8a1el6tqzeUmm855viLyBzG02
         xjP6TGlnQhNuuSnHOvSse79Tg8TX5v1I3WLc5dcCxvOD0kKeLUifwA48xMq/3+pi2hPW
         ZLZGRVvNLzARBc/W3w0kUaSXIIlxmG0PZRqUhJ6fQUWUJDWL9mOskQE8bj4vv5FL/tLT
         Lelzl60SEJNRQNqJizhWJMOHExj9DkcxljZpwItK1uDW5gmTk5mEl7sWYz9bo1lqnNp+
         YhQVR0TtrXaYoPlO224iKWFNMij2ceXQaKchFegFa1ehDuyDWXcueFpDDWKTr0Ig9Bph
         GpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ru07I0h2xoQPCun5MuggERVtGuI5Rom4FGynHtWi0uY=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=XKgGbhKUY0gLYWE4k4c6LN//20SY2QAZ0Lf4g3zB2CAKcNA2+meNd75enMrNUpTf3z
         WbN/61J0/QnPg68OaE4GnOLcwp1nuRXqHs8d6O0KYdjYlOvj34NDB1Nlna3gwezxnjUT
         mqej04Hz9IVVnKp0lauuVBplJxOZSqVH0iUms7LwovAY8ijzmUJDMiAFfE5p3mIK/oa7
         NfCVwWhlwuX46uDFYyxsh/2RHkdff9RmMEur0ifhtoAb+OTkNzgnuv0g0WcbmhriIPEc
         YDrkwEty7qUoenp1OuBSqTztT3KYxeV+7kPuOeIo+u2YC+FX6YevrkyLkfhUpRR+SxJ+
         Dttg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DXEhMoIj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a13d200b003fb425fd706si14734412qtk.323.2023.07.05.08.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DXEhMoIj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4Xm-0003Sj-Hs; Wed, 05 Jul 2023 11:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Xl-0003Ls-AA
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:35:49 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Xj-0007hQ-La
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:35:49 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso10713435e87.0
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571346; x=1691163346;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ru07I0h2xoQPCun5MuggERVtGuI5Rom4FGynHtWi0uY=;
 b=DXEhMoIjmzZOkQFZkThKez/eZaK2LXodOUwzi4p7PpotHvVVx1F1YtZobR3Z602JYF
 2VaUJ9n9nB3wtRpEl67kaNRZRGJJxJidMhUkIJHuAFHHfXkYY3Fic68S2NcgFzUCkkIp
 PDxDR9gEokXNi8hUtq5h8Ahl35GB1JBRlPObfvF3cS65lnVYV1G/nfr1H2D06nYfM4U2
 XNkXEgXmxhHipgr3fzX3SjO6XKaqjyshcLcz0UBwnyS6DSF9grsk9tjNftP/9JCVhH4Y
 ta1wDHrNcYD6YL9HU7KNLZAXU0pdWKMYQfe9Jb4CiLISxw7seNFMYY8JNnXvd3M9vVf7
 dJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571346; x=1691163346;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ru07I0h2xoQPCun5MuggERVtGuI5Rom4FGynHtWi0uY=;
 b=Tto5k7e5RuJr4U27CcBpouxcrS4eLmcdviSBqQrF1Fwp6LO0uWoELm9oWavHp+FaIv
 dNi2T2GAK8kGCDnLVezuEjdCq7M1YbwjjEMQgO3IIXqgh3WX+cyNcMVdU1asEgsD0UjB
 GzvXYXCFyTL2oibVWDX6tSsdSvXe0b9usoiWg+26N1OOiE/8wzfgwQ3wyE/h7V53Mdrx
 fiqjYWQOEMxNXA3SlhG7H23ZHHN9RXpvaUZhiCkKUZYiGv41ERQ4eOmuZFJ44Pi4d3ev
 nfvtco1uju+LKEiRoOxyjYO1g33ocyPmeBipGhkwtqCxlrSvtvlAuZKeDsGvZY5hN8Qj
 yDxg==
X-Gm-Message-State: ABy/qLZFuEIDqXdnhSS+cpD8kndO/ayc7+7HwPLUke85S2mLSoYoMLqK
 UT94kGDVoGzPjsQb6Pfkeoanxg==
X-Received: by 2002:a05:6512:718:b0:4f9:557e:35ae with SMTP id
 b24-20020a056512071800b004f9557e35aemr10629597lfs.19.1688571345804; 
 Wed, 05 Jul 2023 08:35:45 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a19ae08000000b004fba8ebe559sm2793751lfc.191.2023.07.05.08.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:35:45 -0700 (PDT)
Message-ID: <98c08222-3a29-1e50-86c8-274fced66e29@linaro.org>
Date: Wed, 5 Jul 2023 17:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 10/19] hw/timer/arm_timer: Rename arm_timer_init() ->
 arm_timer_new()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: Orp4wvKWkI88

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> QDev models often use foo_new() as the combination of
> foo_init() + foo_realize(). Here arm_timer_init() is
> a such combination, so rename it as arm_timer_new() to
> emphasis the returned device is already realized.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
