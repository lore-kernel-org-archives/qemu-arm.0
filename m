Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp202867eja;
        Thu, 2 Nov 2023 00:29:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ1JnDTgssOeM8Y57SxHKW7VNrXj8Eq5zWBRVHkm/KGPUKr7odm8AWx9c50UArN8KzH+25
X-Received: by 2002:a1f:9b8f:0:b0:49d:10ce:9a8b with SMTP id d137-20020a1f9b8f000000b0049d10ce9a8bmr14472759vke.15.1698910174707;
        Thu, 02 Nov 2023 00:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698910174; cv=none;
        d=google.com; s=arc-20160816;
        b=oW6zOU0dz4sNupENzqGPVKj8/YYi08cJT+Vot9Kl53FMg2ogpj+vRkhDxvu55CesD1
         at74RY72JSahCAnJP1mYLQCzeQ3Chct0oQ1hoHugXyyNhjKoghQe7jtbEGeix+rb25w1
         0EUm49hItr23mE7ITXQCYmxNHAEMUulDG4FLOc0xHNH4TX3p3sxC6LNutpmHm8IajdNV
         KH90AKLVci8CIswJ1O6cRdLPYZJkVFZONaIpZDljvWaTMNjKFFSXPc4oCFnLyV4yXdKv
         uW+YPrWbPcnHerCHAG+ruweDPx5CoKDK0JJNm+UVgJfO7B0j0L5qBkz28I2DEEaxWuWD
         tw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=bQs93aMYfASDblqZAecRC/6iObYeY9wecDvgSeUOO0Q=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=hEqQqeQTlzQr8FXIs+4fFONckApphSQuHeS0Iy8qbmeZ6IUHbtnQEUog+mOM5Nvleg
         qhh6fsojTtdzy8O3HOdAqjCSOi1kSzEwtVb+EiFpcJTYRyOXAhMtkI9Uo4BxhgoVHG51
         vSsZP+JfFuNyTU1v+/Pi0udfnU0LoppvZNLQJ811tl6Zpkrj41WLHk+6t0Pcpzdq1PMn
         C6xUxkoPqkjZsXOosRloCxQLazdZFEizmp8PT9U0jIHaYxp0g/hdE0sTp3lraRTQnRk2
         m8VX7gee6CfKp81Cq9fzRgtG+t0fLyFanYJYcDDOxpkPmMC5IxPOkBkD0C7ompRTXQXU
         thYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e1b57erc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp17-20020a05620a459100b0076810d8f04esi4390709qkb.266.2023.11.02.00.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 00:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e1b57erc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyS8C-0003E8-Ll; Thu, 02 Nov 2023 03:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qyS8B-0003DX-Ll
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 03:28:43 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qyS8A-0003Hh-2R
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 03:28:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-409299277bbso4417075e9.2
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698910119; x=1699514919; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bQs93aMYfASDblqZAecRC/6iObYeY9wecDvgSeUOO0Q=;
 b=e1b57ercaKfWg2yGBLzc57ACJPzY6pyL1m32QYrYm79x2xPDAqwc0WfOxVCOElu/bQ
 HeX7wmen9G8/mYC43hZ2I76DWbqd8HVHJNeLVyIOejlZ+EtpAZP+eojQ7rMmU70UwmZg
 1u0szbWBLW1WkgOQvXjB+HGgi4QQJl64M9bPZ3plVT887DPs60wWcD0hw/ts19fpRNR/
 Fj3WyPB77lMiAcwqtAolsJ0z86A1WwFZlWMk5CQ44cFF7owMCMO2S7dgAMiDsyVP+7lh
 mf92f0w+pPXRMOpfD9RIDW+gPlOUK9SJpP4gcigETL27MyJt7qKYL8GdqqQ335AfM2p4
 V2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698910119; x=1699514919;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bQs93aMYfASDblqZAecRC/6iObYeY9wecDvgSeUOO0Q=;
 b=gwOWQWTWmk1hBdqI8fU9c1r7jGqR6VjsWlOOV3YkvZTyzTg2CIzcYd1NSTQe8dbYc8
 6dvG1MqpyTQonQRpPg3nM87Mc6EzdjGmP8QnxQ7XafR04rBMzboY4/T9v73lX2pXdQ4T
 DB+fMSU1XU6GgTbJsBcsWQmqsg3J+5XtCTP2rZ2A8Zgj/b9JU293S4EXp5DHmCjtm0mh
 FsBIZ/s+YkWJXKGyTgfnX7C7O2Bkw1JWFgFADtRmur9H/NWTaejdDdVrN1KNr+41QyjW
 cfYajq1l57x3w2/YhLAoIrHhwZKMTeKPzl3f42dVbPtnluZtfWEPSeBtMXp3FugBYOCi
 CuCQ==
X-Gm-Message-State: AOJu0Yx9v8uHEPp6gwiujTKU62MUs86O+mOrnXKeDv40+6xjwzeFDGR9
 /tSCZW9uLUlcy1graqJbeRUOeqXhSLUhJtG3KMY=
X-Received: by 2002:a05:600c:4594:b0:406:54e4:359c with SMTP id
 r20-20020a05600c459400b0040654e4359cmr14341163wmo.19.1698910119455; 
 Thu, 02 Nov 2023 00:28:39 -0700 (PDT)
Received: from [192.168.69.115] (176-131-219-113.abo.bbox.fr.
 [176.131.219.113]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b00401b242e2e6sm1890592wmr.47.2023.11.02.00.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 00:28:39 -0700 (PDT)
Message-ID: <d897c14b-d193-f148-1afe-aa64e348da52@linaro.org>
Date: Thu, 2 Nov 2023 08:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] linux-user: Report AArch64 hwcap2 fields above bit 31
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231030174000.3792225-1-peter.maydell@linaro.org>
 <20231030174000.3792225-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231030174000.3792225-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.777,
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
X-TUID: E2a6Fk5mjHqL

On 30/10/23 18:39, Peter Maydell wrote:
> The AArch64 ELF hwcap2 field is 64 bits, but our get_elf_hwcap2()
> works with uint32_t, so it accidentally fails to report any hwcaps
> over bit 31.  Use uint64_t here.
> 
> The Arm hwcap2 is only 32 bits (because the ELF format makes these
> fields be the size of "long" in the ABI), but since it shares the
> prototype declaration for get_elf_hwcap2() it is easier to also
> expand it to 64 bits.
> 
> The only hwcap fields we implement already that are affected by this
> are the HBC and MOPS ones, neither of which were implemented in a
> previous release, so this doesn't need backporting to older stable
> branches.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/loader.h  | 2 +-
>   linux-user/elfload.c | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

