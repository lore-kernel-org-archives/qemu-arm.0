Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8234642ejb;
        Wed, 4 Jan 2023 11:37:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvDqZAWUTVGhXp/pMTTOVUSNyRYANXdNCGQ3Ez/XofTOusf49NiiEbBMneLHwVc+rUX06jo
X-Received: by 2002:a05:6214:350d:b0:4c6:90c6:b427 with SMTP id nk13-20020a056214350d00b004c690c6b427mr73986025qvb.39.1672861068151;
        Wed, 04 Jan 2023 11:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672861068; cv=none;
        d=google.com; s=arc-20160816;
        b=HF0WFPIDgqkZLSkt/DdjwULP37kvnq44KXrawrCfTUupJos4IYo/Y30az5tPi/H5G/
         33eW34kSAR+PqhrkrH7jj8uWmC0KMtfqcyZo++PArJD7lAcMUsVOjXMfhepadln0ZDZC
         jmC4EOuHLgkQg7aowU/IIRp6Ja8qu5ETLJDtysIFcujU6Cc1WXGRG507jlXYgIYNXCgA
         gWp6+lSgOg//YqXhro4cU2cVlOR8jV7xPTuix+JfNPZgYsvlq+gR6ZxzRoq8acrVwdDY
         aE4npY+vK/T8Egh0Js3AJnmfbtZcSSoiFDRucQnYNKYFEfz2+jl49J1n1G+FTIk0aryK
         D7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mFR7xn7/gWUDLuQiXkEPkHcmTfSnkrZsVCniVDoY85g=;
        b=bID0WCo/3tLncdK6HhkMDHldIeoHqaeywOlboIAHsAvQ4DWZGTfm7fBp7eXGvxBe/4
         +7qNRiC6db38fOxF7XlK4mxYuM3UhXPck9+QAekakydCaFFum1l1XSAxbynMbSKtDioO
         qBwn1ju/o8OAIVuylUm00JXCfgZqia2Xsex9F4sE61H5xW0jIK/TkuTP26Q+aipr4jAR
         DtdlUl7Ifzp+lsejA3shzoO/sZ9mYwOe38waUObKgpFLK6RrTjtwHQcFw14R8CcviRNA
         OTJEPTGRg/1i6YRg8OErmAYh+nlEenjBxul44Z1QRxtIa9SsJT6o3cJMJldiTK3ahhmL
         6PGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oDwmtoUb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn11-20020a056214130b00b004bba3906eb6si19831818qvb.20.2023.01.04.11.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 11:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oDwmtoUb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pD9Z6-0004mT-9q; Wed, 04 Jan 2023 14:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD9Z4-0004lz-Lp
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 14:36:42 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD9Z0-00015L-7l
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 14:36:42 -0500
Received: by mail-ej1-x634.google.com with SMTP id ud5so85215442ejc.4
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFR7xn7/gWUDLuQiXkEPkHcmTfSnkrZsVCniVDoY85g=;
 b=oDwmtoUbWtwgB2AYKuNvien+ULSJpeUiTutojW/nJahOSaf/UeP3C8ZXy7sKWDt5VJ
 +E28dywiyC1W7HLC/YV8kN8Ft9/5wFceSN4StGJ1GSyZCFx3ZJw9qHYJkiL7nbHHnQr7
 9xjijWjbkKmuwW/aToyiTo3L0B4PaG3RN+KIn5ke8rLafjq+tICgduczWDMDu0xgKnGp
 dsMPS/3fFtEK5ftrpBFdq0tF20h8xTy3iYeX+a598iHM9U8+Lu0zQVDmSJQFkOFgzfSd
 N8+uEmeL+NEcJOmQInMzu/YuwwK6lBuwDBZeUGjt3QN4HQxQqM2j7AwIojyKm7qUHBRp
 upVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFR7xn7/gWUDLuQiXkEPkHcmTfSnkrZsVCniVDoY85g=;
 b=C6boTiFIwbDSsT7G1jh/rYyBdE/DFQ+yYWldA2fgQs5l3y4OoaCqEIDPkT+m4CRX37
 bfBu2clvHc5nJggo+ux80HB42pp5PX4aw29hXVKczxPqRVLVB09w71TQrMaFr5ZOYrnE
 FNVIYzXp5TPlGD+SZ+EZVzorbLtVZjtLZeRL+nbvkR8HYDmJ93GmsIyUDKAtXW/yudYS
 KCV5DWBx7vzp7j7hhrd43HIflYbLa8Aas+iPigxJahTMpWThPsISfw/JrR9Dlll6DNt8
 lSvVelz6SJtk6/Q2xgAThywaBXgL+kSNcjFan4lfQXjQatfJhbNaw2Lgb9lP2obUACGK
 zu6g==
X-Gm-Message-State: AFqh2ko1apXDYvWmO4oU7Atx8snSbJDZUwk3nK2rDUQ9a5vso1lCFiJe
 uQh/y5UaviK84wqMibVhINXFXw==
X-Received: by 2002:a17:906:c2cb:b0:842:32e9:f1e9 with SMTP id
 ch11-20020a170906c2cb00b0084232e9f1e9mr35522322ejb.69.1672860996586; 
 Wed, 04 Jan 2023 11:36:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a056402139300b004642b35f89esm15212440edv.9.2023.01.04.11.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 11:36:36 -0800 (PST)
Message-ID: <a3f06abf-641a-10ac-7f93-4e9c2d0b1cd0@linaro.org>
Date: Wed, 4 Jan 2023 20:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/arm: Fix sve_probe_page
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, idan.horowitz@gmail.com, qemu-stable@nongnu.org
References: <20230104190056.305143-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104190056.305143-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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
X-TUID: utpzzXMaMUuW

On 4/1/23 20:00, Richard Henderson wrote:
> Don't dereference CPUTLBEntryFull until we verify that
> the page is valid.  Move the other user-only info field
> updates after the valid check to match.

Easy one :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1412
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/sve_helper.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
