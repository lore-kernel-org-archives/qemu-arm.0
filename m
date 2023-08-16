Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp646837ejs;
        Wed, 16 Aug 2023 14:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZy6cmyWkcL86a5a5doeYxBqztwmk4lcd1Fn7ltGG99+gv4O4bZ37FJn+rM+JZqGsoU/8O
X-Received: by 2002:a0c:b2c8:0:b0:63c:fd89:f045 with SMTP id d8-20020a0cb2c8000000b0063cfd89f045mr2189202qvf.54.1692221860443;
        Wed, 16 Aug 2023 14:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692221860; cv=none;
        d=google.com; s=arc-20160816;
        b=dE8jcCHNnJNJ7ypnWGOiUbO/MsxYgqQB6RJVD5zBxBhPuUvoDbm0K/eOcBqoyeJ1TG
         CXe4HRwNtE6vsp9b9885iDDYHf6iN/2/cXoEqC8nY6B+ORbvjCUqN4AStmTkfEwueu4f
         YP3OynRBtyMlcbRQaQ3Fn7EH8i33U3brb9ZFL9ijIWAWvoWfwJ39JWlW1umBVWuEFTz7
         ErdeWAX2wnne8AX77qq4VUJHKwPiT4tQpPidAePEsZq/x1a17G6FNG6zVyXzLUtFcLAy
         bXXDCrGINDeoRtBKWW32UIsBeRCdluqS3mqHjJCM1YOdF+qk/oTr8L8IEDTIpX/OQVpl
         b4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VZsPmh3euSheMWIDgUIopUjXqOluereIHAZc7FTWXy8=;
        fh=WMRjIW8SxRhJzSxXV2TOZJwwi2fPtxqsT1yI+qxoMU4=;
        b=rJXoLQjSatwf3VdMzQmE9YG7Vbs7MeYdHyPhROBdlmcmz6EqNHPnQVKPVUhyQirpzp
         sPzvk8lKak5gkeczMpWArhGDgw3AZQYdZIAfAoKuwFgQAbyExPhFUbMBRaULwXn1vFbG
         zj9xVbYI42naHO2BX4U7ntc6//t6nQk7c9aqCf5aNzsgydrDCD+Cs4PbGwKTG+OtNjVm
         ttMSkQNh5Vp6NQ15iwM/WXCljBXdIQ3Pgm5P9u/xOiUGwe4ctnStyim1rJ4/UBTFRYLj
         dJMcYebqsnhNOxG6uiAYLLVt7+YeU21rQAiQpxuyFZDqdiqPFMujQV4g/bdzhn47gaB+
         N/dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QwmjxkaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a0cde09000000b006473387fe46si2814866qvk.267.2023.08.16.14.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Aug 2023 14:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QwmjxkaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qWOCW-0005zy-Fm; Wed, 16 Aug 2023 17:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qWOCU-0005yX-NL
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 17:37:10 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qWOCQ-0007LU-PN
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 17:37:08 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99c136ee106so930293566b.1
 for <qemu-arm@nongnu.org>; Wed, 16 Aug 2023 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692221825; x=1692826625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZsPmh3euSheMWIDgUIopUjXqOluereIHAZc7FTWXy8=;
 b=QwmjxkaBuwO0Kpu97iAiO2wCF/vYSZ1sN5rHPr/8PITRM/83qjbfw8EXhZ/EtLf+Bo
 Iwo7YHEXBB1iu6d6ENkWmLuNSxldYZaWmXKPSPT139sSozkM4etH07lrmG+KQOx0Yg2S
 QTp0Rc2GMh7a9PfTSGNdT7OJh1gnYYcfbgl689l0Rx1EpZ9t61apoSzYmpWKF53Zelxx
 SkgFgV3d4nYtBbTqB3ymuSGxjsQ4uDD/S6d9VFvoRe0xQ9L7Y5hTulJVMLsidkbvDpDk
 wZF3BFYQ3+NiiLuWKp6V3WnMpJVrcLw1r5AwbsEWbbPn42euwFJW0/MKZjlXx0bSQbNU
 jWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692221825; x=1692826625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZsPmh3euSheMWIDgUIopUjXqOluereIHAZc7FTWXy8=;
 b=L4TRNjTMYy3lWlAE8ITumiyJKerCyOXfXYtoWtEYryc3Z1ZFF/3MreOjK8b0qkwlhr
 8SukzyUKQt5i3HpUiFt8NdcO4aRCa28Uy/WszznK75MsfQ9IN6Ebg//vLYxH62PGW1tB
 cuQG/qSzUk1Rdne0fLwP3C4nDiVLnVD9qrPY4ab51WPTAjl5lhEi1Zx0JeByoHmUXCOi
 xS9n80KMs4oM4Gfl4BWUi3prqNtcTlUcWPJsx34tWdYf3m9TvhICIoGGYZkqXiMAoBnX
 o+G4iTFquwUqA1eM2/Y5PPWBuUGCFVDrUIC+P0h4zwGSVrICgDiadJm1EpuVlMXAgLyD
 oZ/g==
X-Gm-Message-State: AOJu0YxgFQXtgko4e033/3WZJ4BTru1wuQIgtN8h1RAw/aX1UepA5jvq
 GPsMwGkLP5lfw7QmD5DmSqexxh3rzIRwQKtJXyM=
X-Received: by 2002:a17:907:7709:b0:993:d47f:3c84 with SMTP id
 kw9-20020a170907770900b00993d47f3c84mr2873316ejc.7.1692221825134; 
 Wed, 16 Aug 2023 14:37:05 -0700 (PDT)
Received: from [192.168.69.115] (mna75-h02-176-184-40-35.dsl.sta.abo.bbox.fr.
 [176.184.40.35]) by smtp.gmail.com with ESMTPSA id
 ks19-20020a170906f85300b0098733a40bb7sm9087018ejb.155.2023.08.16.14.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 14:37:04 -0700 (PDT)
Message-ID: <8fdd9ed6-64aa-c4f3-6136-3363193f200b@linaro.org>
Date: Wed, 16 Aug 2023 23:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 2/4] util/cpuinfo-aarch64: Add CPUINFO_BTI
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230816142516.469743-1-richard.henderson@linaro.org>
 <20230816142516.469743-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230816142516.469743-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.165,
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
X-TUID: A0ykt1q5XrEf

On 16/8/23 16:25, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   host/include/aarch64/host/cpuinfo.h | 1 +
>   util/cpuinfo-aarch64.c              | 4 ++++
>   2 files changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

