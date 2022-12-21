Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4771333ejb;
        Tue, 20 Dec 2022 17:00:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtzweUn/JMWjTi8v/uSffeMdai+FQFbA1/J3h9jseXd3FeFOJk5rQzohzxaCq3VQYdOsOh7
X-Received: by 2002:a05:6214:3788:b0:4c6:d77b:8b4a with SMTP id ni8-20020a056214378800b004c6d77b8b4amr81821qvb.33.1671584453103;
        Tue, 20 Dec 2022 17:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671584453; cv=none;
        d=google.com; s=arc-20160816;
        b=gGPbE75pSmINaHdDgLRTdwEUV5s7rSbRfzJW4zBi68+Md5Cfm7MydsrjyZj0IkB4q6
         GbLpHEAihUYUmo1nFHkOfrxL4KmEAxMYxHyhq5d/2w1tPEtZyesZ114nEnqio+dfs8Mf
         ircidUj7txfq5Xltwodvrr4pNaP7kmjvmTPf63f9Gsw/5Fxv3wkxobNUCWGnQhyOOdiD
         JFoNWZriGorgHm9npz7azaXKpP7V69su064eHhn5Kt/Rwg4Ohlel8A8PSy76N4PDwsaO
         HZnFPHmOKzEHwdVFzAXLIcpTsAcjz+Zr5ooIHsJcDAnQS+no8rfs2P87QH80URIl87RR
         od6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WyekTRW+97ltxUXOINXM2jx9fnDKNYTKA/E4fwTFN+Y=;
        b=Jm/5NCJlNkPoLvIVx/4LuIXxcoIavj1xhjJWIfoUgmIQy+z+i/M98ILTmi7aI0CTQj
         cLsLMedUYm9v9drqGussjN+nZa4KdY3GxYYMjAVd3jKCFyAAH53YwqrPSvrcUmD2PyCe
         mCMJnqK3cJqyGXCA5v3pkO7ZA5rbUGLI+yiYuNzwGUVmOlgrD811yFy7PjVuuuaycui/
         KTh5kXYjgY1DptZEoa74xE05VRF0mLzql9ydLZBhitXObb2fY9LNEuLnHTsXpQldV0H+
         sQrnd5JpL/ABfKi167W2WRJb7P0A887VLkUa3AUcUG2l/f793wXTEKMlPhk60aneZYBK
         TfyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o91XmJU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs20-20020a05620a471400b006fc2b6729e6si5912234qkb.567.2022.12.20.17.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 17:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o91XmJU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7nTK-0000CP-4i; Tue, 20 Dec 2022 20:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nTI-0000C0-Sl
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 20:00:36 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nTG-00036i-Hg
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 20:00:36 -0500
Received: by mail-pl1-x62e.google.com with SMTP id l10so13994121plb.8
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 17:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WyekTRW+97ltxUXOINXM2jx9fnDKNYTKA/E4fwTFN+Y=;
 b=o91XmJU8U1B+QMX/D6mOem543OTrZVUnlUuM3eN/vxfdgcaEuziETw+Qz1uE8zWzqI
 ir0tDE2YZfHOEqyDr2ku98ZQpwVH9liu84IpI0de6WiLnJzPhwuOUjCZWTi5xfW+fKEh
 1gVph+LJmhRvtR46wNNOTiA3nGv2WzFzZnos8Xd8cbtWBiJT76ft4MtNXF0AS0vdfpqU
 JU/lvgNTilAOMMPX8Z8VM0zHElKA3z96gmhn1bzxPX+4mbw83EfUo8Q/EmlYnKlhnFxp
 p2cGsz5NjHhTb+eKNPIqV9qozmYv4XqFA9OYKCQU9P+CFtLjVbX+0O77jOcG9EjRgJNb
 DfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WyekTRW+97ltxUXOINXM2jx9fnDKNYTKA/E4fwTFN+Y=;
 b=gMx4Q96mjFRtQdaxTlt8U8QsYJU14deqcUIHF+e2gcvID/9ALh96mcIxnSz2piSiD0
 UaYUKmAVBbmADze0e+YR71MdYHLBazAtmNkC8SYJxsbqcgMpDv+3XBiCTg7T/SpU9boA
 NofaQ9ZxzkBNrFvWM0rk/OoNfScpjP85MWDHCnwfIJ17TUv6GU9dyF9dOq4rC7LOp5h3
 gmmE0d7+QJfG9rF+x3kwP+21Vaf4tiKnJLY1NcJDt0s/tJuBNJwJZHXnUeiHN2gnOyxy
 bBvqpXvIOxrPTkiRHUf9XLVqsG3J/YRPdA/10sAByt+Z+vjmsaVNDwqWiKK+bExYUCiy
 C3vw==
X-Gm-Message-State: AFqh2kpyl7P9xHOVFaNm1H3gwm9bJhA0jfKNn8Fn9V4Pcy+RzznZmIgN
 UQzhjNy8ppV26GO5mkPC8gMxvQ==
X-Received: by 2002:a17:902:c401:b0:189:ba1f:b168 with SMTP id
 k1-20020a170902c40100b00189ba1fb168mr176284plk.1.1671584432519; 
 Tue, 20 Dec 2022 17:00:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a656804000000b004792b557b1csm9013133pgt.87.2022.12.20.17.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:00:31 -0800 (PST)
Message-ID: <ca7c39b0-c3d1-2993-b1cc-b4550c674440@linaro.org>
Date: Tue, 20 Dec 2022 17:00:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] hw/input/tsc2xxx: Constify set_transform()'s
 MouseTransformInfo arg
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20221220142520.24094-1-philmd@linaro.org>
 <20221220142520.24094-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220142520.24094-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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
X-TUID: hl5hPvphM53b

On 12/20/22 06:25, Philippe Mathieu-Daudé wrote:
> The pointed MouseTransformInfo structure is accessed read-only.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/input/tsc2005.c         | 2 +-
>   hw/input/tsc210x.c         | 3 +--
>   include/hw/input/tsc2xxx.h | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
