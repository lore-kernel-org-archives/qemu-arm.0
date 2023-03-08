Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp935323ejc;
        Wed, 8 Mar 2023 09:25:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+TKA/bG00M5tBsAoC60rwCGX7BvZiMeX+Tv3D4XEsRznQohs2TToKKqbsSTifIbzbv8FCy
X-Received: by 2002:a05:6214:2524:b0:56e:a658:84e4 with SMTP id gg4-20020a056214252400b0056ea65884e4mr31689775qvb.36.1678296356258;
        Wed, 08 Mar 2023 09:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678296356; cv=none;
        d=google.com; s=arc-20160816;
        b=aAj6JxS7NxkBp3/iB+VlUM3qXUsjv0ouVKiwrud/2LzEHlbL1zMatl5lUfjbjp0ic1
         zQBtZCCJ5+ptajs59tLxW8BqB6rzt2a+O+qbcqZzzvn2ypOui9bSfUjQl3tftU6NeNXs
         VAd3TL7ENAV1G0H9Y0kuz2z/9/tp3idwOVLI/uRj/O1+Xmt8kfVoHmKX+6lrKqkvIfA7
         QE8QPT6zGiPFAZ3UJxc7oYX4owSXyrJyt/hQ+9aDjkFZDOT4fsdleT3XIsabWpAEwZLS
         jkI1qU9jkWJayeNocFIkxL/DMwjvD1XO6ILfECqJ1pvATA7NQI7AL8zpN0ulxoenA6Ai
         h0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PF2YCsQCmeKGuXjs46/8QOADvm1NubSQ8ahqkqgQx2Q=;
        b=md0COW25kx1GfVzpBIbOVF8RH1AvitTYUKNCOAM97BzvIW8mnHS9O05yFw+BiLoqLN
         8giSmfj9S0/XIQBuzExGgzE+xGLAb4VnHrtA7+YySHy69Y5k36iiuXoL4Czwn54/PyuT
         6cLxNOi8sYWNcISYzgkkWm3JCaSkpWSvzrcHnGuWnKT2sALM0BTCpSA9Vkjvo+Tb+f2b
         Fe+/C4asjH+vwxwVegPvhgJbUav9X6u1RjXZf7yirZJylv3EaQ54bhDo4daAgNyBwMg1
         FNquqkXaOb04hosrvjSq5N3FqAvjYVk7uHy/g/MOx3hSsUdW7IjwXOncShgOI7nxDc6i
         CRGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsjnuiqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a0ccb93000000b0054ace222c06si12374598qvk.589.2023.03.08.09.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Mar 2023 09:25:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsjnuiqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZxXu-00023D-DY; Wed, 08 Mar 2023 12:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZxXt-00022k-0b
 for qemu-arm@nongnu.org; Wed, 08 Mar 2023 12:25:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZxXr-000395-JQ
 for qemu-arm@nongnu.org; Wed, 08 Mar 2023 12:25:44 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso1861264wmb.0
 for <qemu-arm@nongnu.org>; Wed, 08 Mar 2023 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678296342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PF2YCsQCmeKGuXjs46/8QOADvm1NubSQ8ahqkqgQx2Q=;
 b=xsjnuiqatVXAFtH6fPOE9HsXg+9/5HaeD4gWy0YLU3d4EvKUiXwfx1L8IDF7nmuSQd
 zDaNuR1cvjC+zrSQM6zoY2CRiOk1EQ1PkMhVf9iWI5J19DqcS0yZ8MQV8rd2XnSO3/vu
 kjFum6VQKAxpRS6xWkT4+5bNWGUDQRbqpwcSV6JLFSovzzoow5WFk8oi76YsqrMg7u0V
 3xGOnbinhnNhBOwDBbhJTuLkrbmpih4+FeGahX+O5CZ1sIKoI7stI+9OELK4EMljE3dW
 SbBSoSP2DpajOdNu3IkOXai5Fq7FkDfBkHqFcojh75+YBWOBOKUTlRAsdl8UH2gK4qgM
 zLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678296342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PF2YCsQCmeKGuXjs46/8QOADvm1NubSQ8ahqkqgQx2Q=;
 b=G/iw2Tgcg9uQ/6X/WpKF8dzeFT10tCGgjVJmAInTEFf/89ZP79UCBn4e+6lw6Tb14O
 2Ui8Y0ofriFaFlcL2E4o6zQvSR67UgB/c1EFq8flouyKHEjiJhPNttlL5FpUTKI98aF3
 Ahy0JKf6h/Iw97qPQqCwIhGJUr5c7QV+Joj6VV2SpxzLt6ExL06GWN0P/PWabVqK7LGD
 9KCCdIoZdkTuokCf01oZ/z5UdoWwQwLUl0udRPTJJTOAStVR8Y4FK6ao1D6mqFWxhHYz
 DKbBRugX7MJ085hg+dLh/eVHDtmPlDAX6I1XoVFlYqBSn9pBm4aCJdW2G9KVmV+4lfs9
 zitQ==
X-Gm-Message-State: AO0yUKUoAkYirAdsPu6ksYtQ0F7uHf6H9iHeuK++b+lW33NhjWHAkwj8
 7CfXPDs/3bmbmFSQD636U4MNcw==
X-Received: by 2002:a05:600c:3c95:b0:3eb:a4e:a2b2 with SMTP id
 bg21-20020a05600c3c9500b003eb0a4ea2b2mr17014052wmb.4.1678296341796; 
 Wed, 08 Mar 2023 09:25:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d4e91000000b002c559626a50sm15918815wru.13.2023.03.08.09.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 09:25:41 -0800 (PST)
Message-ID: <fb389228-c429-1c41-aa62-e266058c86d4@linaro.org>
Date: Wed, 8 Mar 2023 18:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/25] target/arm: Handle FPROUNDING_ODD in
 arm_rmode_to_sf
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: QEqDJ+s1d0ZF

On 7/3/23 19:34, Richard Henderson wrote:
> While this enumerator has been present since the first commit,
> it isn't ever used.  The first actual use of round-to-odd came
> with SVE, which currently uses float_round_to_odd instead of
> the arm-specific enumerator.
> 
> Amusingly, the comment about unhandled TIEAWAY has been
> out of date since the initial commit of translate-a64.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-arm@nongnu.org
> ---
>   target/arm/vfp_helper.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

