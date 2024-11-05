Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2822527njc;
        Tue, 5 Nov 2024 05:31:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4gWtf2HuP0gX9xOzp6U5fT3O1vwVpWJgRqBOr1FUzk17PY1Qzd7TInHmncjUaobyW+oY85NhMyIGSpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE/0a7lOFyWuEjHGjY2vz2HbTMwxot5nnGgFgKieYZF63mJqT9RQwlbJG9XWFuaIE2IKazh
X-Received: by 2002:a05:6122:4681:b0:50d:2aca:3b13 with SMTP id 71dfb90a1353d-51226d4eb51mr12671733e0c.3.1730813508034;
        Tue, 05 Nov 2024 05:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730813508; cv=none;
        d=google.com; s=arc-20240605;
        b=CEY6FWYBCg4INLuO23YKJ0qLMbIQe/RqICPYSW9AFhc78jk8DkElr5sCXjr0dGbqoX
         7uuUlm5lIZTYsjGeabATxTH/9OhQrQaCwrb0ADrRmJ0Yev9Ywte97Ld5Ds+3YNeVA20Z
         ird9MtxTTVdzp3KokVxmJ2OCT1HzPFiCUY5sxje0S91STZFRd3aeR6B2Vr1eSYx0sdos
         xG6JMPB83qNtzuWeZ4gxG07hawIBpSmfrF4eqJpDkyuxLBmZf8+M4LAcDwqdD1Tuo0lR
         X3BnNozTRIh5bh9N0URqa0I5STlLETEVAJ0v/J1WIT3SVhUwH37ROwBd3PEvkm6FrtVJ
         bMVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HNI3Qh5aNI25n6R83vyAaIQ79DEw1hHSlCehSa4dQ80=;
        fh=/fmXpAXxM3TrkJr+IyzSqcv+FE33Ih9zdnelJ50qNtI=;
        b=g+DD4D+dPO7r6zkz4jXZ0K9e9809IIlCmVuy1AhebZizDW4O6EI06dCpzprbBPe6LW
         IoxbdC3q+kjLD1FXD4XguInSWAHd4jwKYzG01PuhyQwZqOmFoxGzn/S3PtXq0CfPGPgP
         AaGMJcA47wUSwHGy0U9oko81aj9p3EDZLtOHzBY7pBkDo/DhZThnD4SJv4KWPNyC9haR
         wtQoV0yZEF4V7QIboFR00CgVt8CKUpvoZ8xfyIgm+lvHgdX01D8pMB7EeAP4QbS1NGWT
         B3096+STFQQeKQUOUxH+P4RaYXGx81vHM0Rjpphmh1OA6tmcwYpq8tbN9tU4Uc6GaSZS
         mLNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oEVxMqcW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-855dae58235si2603912241.110.2024.11.05.05.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oEVxMqcW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8Jeg-0001gI-9k; Tue, 05 Nov 2024 08:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8JeH-0001XJ-65
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 08:31:09 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8JeF-0007Ip-3h
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 08:31:08 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315eac969aso34017355e9.1
 for <qemu-devel@nongnu.org>; Tue, 05 Nov 2024 05:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730813465; x=1731418265; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HNI3Qh5aNI25n6R83vyAaIQ79DEw1hHSlCehSa4dQ80=;
 b=oEVxMqcW4sMIe+psywmuTN2hmmOWJm/MCx2AtAAkgKGXR8ExkeznkXDcNZmdeh1UMz
 Nb8A5QIvHz70oYerOS+oSGiaxVa2K+GRi/094IaRdVAr1vph6QZ2olxGkNE/B+zUrEYS
 irTX+dMkx+xgp7lt0KgFyS/mO4BbhtvZVZz/E6pT/35Q09wFkn2l7M5tWJyjQxuplqal
 4O2ucxUaL2EKSG7vQZ2Xw7vwSAI6S/tKQQ2VUHl/MYePrTgkU3wsV2r26S42pv+ai+vL
 V+hBzMM876QCPIIVRa5GVjtGNwRfEVkKRSSP51L5qSyHH4sh+Bqa/x3UNjHgCdAQ1PUh
 lIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730813465; x=1731418265;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HNI3Qh5aNI25n6R83vyAaIQ79DEw1hHSlCehSa4dQ80=;
 b=CZdhiVoOrOY9oXKRaNBeAmw861zpC0OhmaisMrMAZAWiJozmktUdhlTiXKa19tIeRF
 SFw/SZdoWkqMg/d820884lBfbMk+eBEupWl2oKl6wzI+b65ImsbwV5d6727g1akSdUzi
 LhLM+rN+t3x2Tjz7o0t61LHWwOpyEi+9mdazCuZKzztQCUtvr+lTijSfBtn0DZYjFnJ0
 e/EsJV70j791tH6hgfT91boBCLUiztc9n39y778oRbgtEQzt/X577eP+I1Z6v42FLlKc
 WGsupwHhZV7FoORFTMkz50GXb/0vrbF1qJIxcENp61UdpmK+XT0IBGEWRVWyIJa5EMLV
 lAQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVot4upBoMrG6EoUm4MWGH/tbh6x2G4WMIMuxhdbD2qu7mJFE+WwLS+BcRvlj/+Bl+urbGWGpE5j8pD@nongnu.org
X-Gm-Message-State: AOJu0Yzm8U08gScibXvMIkSKN3z8+olf9YPBJAxaPXUWnpSHMzSpsOxi
 aUbzdhYI97NbNfhjDI2DcVGQCiPH6ZkII8SNdBxZ6oRoyy1EEA+nCRDPn1SSPrE=
X-Received: by 2002:a05:600c:4e94:b0:431:52da:9d89 with SMTP id
 5b1f17b1804b1-4327da720bfmr155605225e9.1.1730813465024; 
 Tue, 05 Nov 2024 05:31:05 -0800 (PST)
Received: from [192.168.21.227] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e7c9asm195326765e9.21.2024.11.05.05.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:31:04 -0800 (PST)
Message-ID: <f15f4d4a-9166-4cc4-b1b9-f888be911a75@linaro.org>
Date: Tue, 5 Nov 2024 13:31:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/19] target/microblaze: Explode MO_TExx -> MO_TE | MO_xx
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-14-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241105130431.22564-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vp0Qkl+tqZhC

On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
> Extract the implicit MO_TE definition in order to replace
> it by runtime variable in the next commit.
> 
> Mechanical change using:
> 
>    $ for n in UW UL UQ UO SW SL SQ; do \
>        sed -i -e "s/MO_TE$n/MO_TE | MO_$n/" \
>             $(git grep -l MO_TE$n target/microblaze); \
>      done
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/microblaze/translate.c | 36 +++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
