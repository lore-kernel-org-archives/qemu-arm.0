Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3656595ejy;
        Wed, 5 Jul 2023 08:28:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oB7os2VGximFSJNkjik27B4aF/5IqKbw36CuIH53Hq7O6Vb8f/4WxhbFt/dBnkI4GYfGG
X-Received: by 2002:ac8:5b03:0:b0:3f4:cfed:96b5 with SMTP id m3-20020ac85b03000000b003f4cfed96b5mr20826586qtw.59.1688570935929;
        Wed, 05 Jul 2023 08:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688570935; cv=none;
        d=google.com; s=arc-20160816;
        b=zaS39nxMazQdI/rdF77VBDbOKnxD8og9hdr//pJBR5enSii0y7OlTzoHgr8Vy5coiS
         fOkmp0KFPiCUt6EVwCfX3VcC+uXiCyRV4F4CVii0kCpLoeVJ6/f/9IvzsZTDCktUHQpG
         NZOpMtwVX+4WUEtB3t26QXXWIJPxjAvzldIXEYBOjRy5gTG5q0D3O+ekFhpzjsAHcUZ0
         uBYDh3hJpmSrQmIya2iUvep4ytYWsuuvKpAAYd6GleWI9BxUtGrrwf28N0FsRxCs5opo
         q0UnTIX9TzNGeeJ7foszJXuhetm5V1Jr0Zjafv1mG1lpyIm4ymPEPqhA//3VD5KJsxAI
         5Baw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0IBAYmuY+LbwBLAajo03q3ectmCFo8tJaMl4CWIj3kM=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=t+Ug9Qm4IHLUnGSTi8kzBtaRipzlRLwiOgbraGZ6AdZAGiAN49bbaRwWopmk9snBcv
         M2j1hBBFb+oXZqmyM9i8a0AtkABv5xKKMlSaYUVI/fjrD3hDhXJnhyQnuzro5JIu36kk
         fdrn5B+iV8BykNuI7+AZBDO+P+jXRSSYjPhSUoyWgXTB32Q/GFZYV+ibBQTLlPWR94OK
         ULX9eUxZj/cXkHr7SbOk03OxqNONSO19sHM0nxVPwbmdqoYkgls0oaEKbM9p0mTEAjzu
         2ZVyqRi4zIp6Do/F6j56OFdtHbSIYSo31Jq0/C2AqustRzz/cePBvhuEUDNV/tITrlLS
         3Nfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb8BU34V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020ac85e12000000b003fdeb6b4fd5si11003451qtx.766.2023.07.05.08.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb8BU34V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4Qh-0006aG-FH; Wed, 05 Jul 2023 11:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Qg-0006Zt-Mr
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:28:30 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Qe-00055j-WA
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:28:30 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b698937f85so115744551fa.2
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688570907; x=1691162907;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0IBAYmuY+LbwBLAajo03q3ectmCFo8tJaMl4CWIj3kM=;
 b=Yb8BU34VzgAe6K1+oV/qBJ/8Q0KFf2dVJzpDba8vJP2rpURgKipgR08lMSIFy5ovsq
 gNzD11LgacFI3g7tHqJsZ2whaSmBNTlus6tfImi2J/VXFdBeGF3kephTKmjBRwXMZZ/H
 RQ1gYmdpHxVriSOXlAs+MvASsdEX3ATiYAdY2DmoRpHnU/MLPWm/xC0/h98uN5hqwJl4
 yvdLn2/OZiKMee78M2ByRYm3dJpFsDM+R1eZL2trqs+SYqRA6+shzhRtMj6vn+HyeizG
 J+bvPjJVWrzFyWAHaYajRPRIqcjmFEsYLJfVACpufDbCcwceFwY8r0ItSPH56BZ7TkjK
 kJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688570907; x=1691162907;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0IBAYmuY+LbwBLAajo03q3ectmCFo8tJaMl4CWIj3kM=;
 b=L9sj3DH4cdhbaICN3Pk9Q8Vcozlln9f7FZAtWgDXc8zZlN6OTFpiuYAKYrOm1XsVxr
 oeL3tuHQRLGiKvWiZ76+8JXS/m7JI213tPjd+835bT8b/abReL3tHwuFT9EHalnyUYSA
 CzOzBoUr84CDQy4vR51+M/uY1Z6q8k87wmU+4beYSuO5mgjV7QASFSGGtQYwqjzhaKz3
 g+1lYrttaJ5FqxwFwotVAQ1hMtiH7lDzP2an1/5BC/+BXKB1OMyOdug5ZxE5iH6bF5OK
 7ngxASbe5i7OsOzfz9iTXlyKKFRo9q1tslXYa8D1xpgtWlRF9vYCNuPqIOcRQZzILVkl
 mMqA==
X-Gm-Message-State: ABy/qLbKJcdhELcBp2vbNsH7s6Uk0L+UMcmEKBv8pTo2mkIKRDKy6Y9M
 Sx8HJ5coB5/rtrSU+SQ6x1aED1+B21NnR6HQf0lEoA==
X-Received: by 2002:a2e:b703:0:b0:2b6:df15:f6c3 with SMTP id
 j3-20020a2eb703000000b002b6df15f6c3mr9237827ljo.39.1688570906676; 
 Wed, 05 Jul 2023 08:28:26 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a2e9d4d000000b002b69b44fd52sm5959691ljj.5.2023.07.05.08.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:28:26 -0700 (PDT)
Message-ID: <f2d70708-16a5-120f-0ca8-5598fc7b377d@linaro.org>
Date: Wed, 5 Jul 2023 17:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/19] hw/timer/arm_timer: CamelCase rename
 arm_timer_state -> ArmTimer
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: XUW8THGqNDYP

On 7/4/23 16:49, Philippe Mathieu-Daudé wrote:
> Following docs/devel/style.rst guidelines, rename arm_timer_state
> as ArmTimer.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
