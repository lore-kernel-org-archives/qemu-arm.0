Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3616356ejy;
        Wed, 5 Jul 2023 07:28:23 -0700 (PDT)
X-Received: by 2002:a05:6512:3703:b0:4f8:7551:7485 with SMTP id z3-20020a056512370300b004f875517485mr9148250lfr.5.1688567303082;
        Wed, 05 Jul 2023 07:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688567303; cv=none;
        d=google.com; s=arc-20160816;
        b=WgGx1peZscVBZjVdthxB7OmHCKQ2XE4+qs7euZMs1jxpdoAUYgOXjXBqrYtjYTMDuJ
         NAXjWqRBTUCMt8H2EUPHCOf13sTkzTo/JmNFBX5Cc18FunVL+nvIU5PQbSA0GtrFvoU7
         9ktcWuSOeT0G6P1s5fxZbConROQKp8GONo5c4h+bwyl4MrgR2VTQz4x3oPy1n1Jrbtbc
         bZiCV5nZAAxf0xUZXbmleS9dRLzwpv/M62jWv2l7TWB1kADdbtE9SnxNu/ZXmuuJU4ed
         /eIumiODvLv/OrzrjH+oRQSgVgBKjmY6aXEo0mkMZXKzkzWlI4JGXmPX48p7gn8E0z2X
         rtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PDPOmokUF2beJm8ie2U23bitmWIjV59/u3PFgyn9hms=;
        fh=PdX3xrb7PQU2JVUTolLSxvX4zMdKsudDGpGP+62jNBo=;
        b=P+hu3J+rj1mtRwOpckLkBG57Sk0WpR+HACaK3x9TEBIiHIQPKZgSGM7E1Lm0f20A74
         4aDmOtVuZIJHkaS0IbW1p/n4p5pq6i4IPbt+Rccogm7QaPGqbdPe3Pk2KinlBdYNTuPG
         V6f9BMiBLbZbyH/OpXb3S552hpvXLEmo/eXuFXpT+Noy0WCn1sNZQ50tXSfrGFGq2FKU
         YwJD9QXoyQREbKGRDe6oTBh6X8GJl+Gzo7danYmU0a9+TIujxKPWv4NnBB1YauxE9BBJ
         DzwFrTu2+Joii51RN9QrgqLAerhKiy3g41hmXFLY4zN1AurUz+l9N9JBxxMksPNI6qEC
         ZVRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EurDq2Sk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x11-20020a19e00b000000b004f864ba6fcdsor9356122lfg.16.2023.07.05.07.28.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Jul 2023 07:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EurDq2Sk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688567302; x=1691159302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDPOmokUF2beJm8ie2U23bitmWIjV59/u3PFgyn9hms=;
        b=EurDq2Skxz8vTmIDbDDA+tM2SeT5Ejmbca/WCEoHELiW0kbVw2WfYDyoeNPcmfAn58
         p/2MMV46jn03Mu27IHlF55nb0TiX+8xfZw0JlnQBljtc6DSnCsGe+6C7f6xJoFlHsxOt
         fnvGAg7IIgV//de93K3FPbFTXdBVVVXoX6lZeaG5WO/yYEXs7K8GBOmpFoaq6srpJU36
         F+bZqmzUu+AXPMSqDuUh6VHWGbYt8FI6779QBjTZnF5qDFHMHpE6zjDbTtt2snmv5dBq
         mzZvvcqVGBpE/Uls8GwN5RVakUMfrcHCSGY688vjgnNFWZBCYdrAKu2mSX20ceyjL9H2
         71Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688567302; x=1691159302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDPOmokUF2beJm8ie2U23bitmWIjV59/u3PFgyn9hms=;
        b=j6jkNLmQb+UuLswOv+koXiPke3H+a0ywK8KNwAsvXmJOsKb1Q297Ko7fM3dEMAR4nN
         mYIjiI0iSXSTG5wYGpOBbAfBphsroe9JYb1hqQeuTexxlUwJ8ot/H4UPnCu/K/07Q5Pp
         YUqINJjFw99eS9dAp/ccNcgCHRkvSHNTdLGDDXy43wvUDp20vzqDPa/Z5uqQllyIr70U
         NHdWw6LOADeHXNI5FaMBkwz9LcnrOavwhBKJ1B3coj7SuWk9XRXZFMhasMLxb0e2aixK
         bcKyySCwyphLnbSZq5CsSUSP2T4ASMVKSbb2e2Z2M0Zosan3wqZnXMBS8ueMutqvjXV7
         OCZQ==
X-Gm-Message-State: ABy/qLZ6NGdwl1VjeSuqh12Jyd4D+ZJjXWQaXeWuBMwtOZ4uAz0wfdqT
	fwxYXM3gpFer/Nv45Hv+PNyHtOf9
X-Google-Smtp-Source: APBJJlHADc0w15Z0H+W3AkiHOAh9shvM4XDRnWgSKZK8bp/J0jEOlMp/EPPiBVKrKOko21SLlDn7tg==
X-Received: by 2002:a2e:91ce:0:b0:2b6:9871:21b0 with SMTP id u14-20020a2e91ce000000b002b6987121b0mr12033616ljg.36.1688567302557;
        Wed, 05 Jul 2023 07:28:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.82.227] ([91.223.100.51])
        by smtp.gmail.com with ESMTPSA id z11-20020a2e7e0b000000b002b6ff6e7dccsm330689ljc.26.2023.07.05.07.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 07:28:22 -0700 (PDT)
Message-ID: <2a4fc15a-10fb-8b44-ce98-63e704d10d9a@linaro.org>
Date: Wed, 5 Jul 2023 16:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 02/37] tests/multiarch: Add test-aes
Content-Language: en-US
To: =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 pbonzini@redhat.com, eduardo@habkost.net, alistair.francis@wdc.com,
 danielhb413@gmail.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-3-richard.henderson@linaro.org>
 <CAEg0e7hqkof1N9ymmkopPpEP8P+cnUJ=qr365dxHgUQaRPvvgQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAEg0e7hqkof1N9ymmkopPpEP8P+cnUJ=qr365dxHgUQaRPvvgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SHKOjn1YMGok

On 7/3/23 14:08, Christoph Müllner wrote:
>> +config-cc.mak: Makefile
>> +       $(quiet-@)( \
>> +           $(call cc-option,-mrv64g_zk, CROSS_CC_HAS_ZK) \
> 
> I think this should be "-march=rv64g_zk" instead of "-mrv64g_zk"
> Otherwise this will always fail.

*shrug* FWIW, something built for me...

> 
> But I would drop this gating mechanism and use the idea that you
> proposed for Zfa:

... however, you're right, I should be using .insn here.
Thanks for the translations, I've c-n-p'd them in.


r~
