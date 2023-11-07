Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp241816ejv;
        Tue, 7 Nov 2023 03:24:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNG4WNCWD4fQXhhE7TUhbIvB/My2KO0Df7rugwjWdbPRwQWPfmgl0kEb6/QehTUUj/uF4R
X-Received: by 2002:a25:d30e:0:b0:da0:95c0:d157 with SMTP id e14-20020a25d30e000000b00da095c0d157mr23216311ybf.51.1699356266467;
        Tue, 07 Nov 2023 03:24:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699356266; cv=none;
        d=google.com; s=arc-20160816;
        b=kLclrz29l42rZkRnwY3mvKzPxBnaryL871X0lzm2ISSqCZVoYigbAX+yPcVPp5lr/x
         OuXsGrNZiEv60VT4JhdaPgTR9DjXxP8Zdwgd6IozMswVx3XHKW5gLXAw8U7r9Mv9qcmf
         SPG1Q3czRf+Hu9rr6LXs2f2VbKxnKfULwZC56f5J5RrwS45BFDRlrexyGu8ynv7q2ZN9
         hDqM3bj40F9vyAGagG7NpHeQxlbf+aEyNRW1EXwRdCVk6EkqabnKVOkDKjlpDZM2q6j/
         GThrsY/cQqDMMbTMkHAxJoWutmJq9evWaOqkRERKZRro5Tp7ZKz2zwFXjK57a/5MMXKk
         lL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=FBonne8TDnBN5zXma4N4N4nGDVIu81rRxyfquoryPlM=;
        fh=6hblrBvBi7rG1faX3zh9xMJSpVgzaTtBBn4+gASQ0lc=;
        b=s/Lg7d+EaWThz9sqnUEIcku0dk9cheCAgnplljd+GEq0V3EuOoW9Q1BEhKumj3j0mh
         GOEdnqWOwt/tKMwpzntfyqrP79kkQHVt9XaYTyReRlIZLWBOWViYhEVtcmx9x95lLWaN
         d8GKCPSdRbgqSWjZ1fqNVPmbCl/Qgb9iicl8VlIRHOfgC4oUyGEyHQwEWiLCNFIzMDz+
         aP6byeNJ4BuAX5ZY5d6uT2Z6pt+oYqiW3Rp4D9/PPh9w0tFRAcRFUsvDAus+FbhR/bcJ
         FWJwEYukYF8+03p92exITX333Mx++hKp8S1m12v921m2JjYFiu3lYCbOGkLR6InwrF3l
         z+7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0M96KM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18-20020a0cbf52000000b00670e25f2d01si6860568qvj.436.2023.11.07.03.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 03:24:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0M96KM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0KBy-0004OY-RL; Tue, 07 Nov 2023 06:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0KBy-0004LY-CZ
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 06:24:22 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0KBw-0007tu-PQ
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 06:24:22 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so9514023a12.0
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699356259; x=1699961059; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FBonne8TDnBN5zXma4N4N4nGDVIu81rRxyfquoryPlM=;
 b=V0M96KM5IMgH88zb9FP9BwwzRsVzXkLL7Gp/EKSne7rThLyI8oa6sijNlLyGuuNJb1
 LipdlcUQdSLD/rg0pGBk/zlmlwTw/A2o/2UNhDfpfdDNjpv9DPGf2sh06jdLuwapI1SO
 w4neEG3jk4sOrDV2LASgnq7Sfe9tsZX5uJp5qnrkOLXkbTNSIMzxkxbsOl5GmeHvB8/5
 DDH6WOUgkb3Iq0Yd1jgHSnHuzgjMGaTMOHv5dOpzyAh3IQF9uwkDWnx9WSozbYaW34ya
 liWYB7dnoW0vVJJOwCFWdWGgUeHhP0Z5LxtbeEZ9yec2DRk6ABfhVUhhThYR7sKfyt7/
 IKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699356259; x=1699961059;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FBonne8TDnBN5zXma4N4N4nGDVIu81rRxyfquoryPlM=;
 b=coJIaY6AD9KEyjBCJBn1WhSoS9KdJnig057ZumEzSjhfmBfqplu1jjRRxE0ceHWx+p
 BvB+twpXk8YuvTaqAlaXCWbvXMQzsP4CeO7RTqzmNdBc4M6gPMuqlBzU2bNEftx4Y0rm
 Ab692nRGxfIYYZU7q55wjbeRKU4QC9YwJCVEsFir8iuqYppMsLGxgzyFA3YenfLe2vnL
 Qx90H4Y/HSy1wUYZuMbJOrijXXqcAvtJ9XJJUiaIBjYZconoscja/lUCs19ShGgRx6J3
 vfOrf+0dkWqX8nZT1nIjDSEc95qvb7MqQH06Kh7so1dsJJ6uNXZdSj9rQ3kRoVBc25OA
 KXXg==
X-Gm-Message-State: AOJu0YwhMxmKIvEHneYVIyMdYQUTmu6nZQi8puMiMwuvfqdrrx/koCHu
 h9bzx78jLLglLUvrsyt+uFEZAw==
X-Received: by 2002:a50:d709:0:b0:544:b880:b316 with SMTP id
 t9-20020a50d709000000b00544b880b316mr3487405edi.30.1699356258906; 
 Tue, 07 Nov 2023 03:24:18 -0800 (PST)
Received: from [192.168.69.115] ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 b67-20020a509f49000000b0053d9f427a6bsm5488119edf.71.2023.11.07.03.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 03:24:18 -0800 (PST)
Message-ID: <cf12ee11-bf7d-4d05-ab21-5d194a1bcf3f@linaro.org>
Date: Tue, 7 Nov 2023 12:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] MAINTAINERS: Extend the Stellaris section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231020060936.524988-1-thuth@redhat.com>
 <20231020060936.524988-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231020060936.524988-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: +2bJ+qhCCxZT

On 20/10/23 08:09, Thomas Huth wrote:
> This header include/hw/timer/stellaris-gptm.h obviously belongs to the
> Stellaris machines, so let's add it to the corresponding section.
> 
> And hw/display/ssd0303.c and hw/display/ssd0323.c are only used
> by hw/arm/stellaris.c, so add them to the corresponding section
> in the MAINTAINERS file, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


