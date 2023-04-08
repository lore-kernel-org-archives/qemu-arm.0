Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp610347ejb;
        Fri, 7 Apr 2023 17:37:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:3388:b0:d9:b94c:54a2 with SMTP id f8-20020a056a20338800b000d9b94c54a2mr4415838pzd.16.1680914256107;
        Fri, 07 Apr 2023 17:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680914256; cv=none;
        d=google.com; s=arc-20160816;
        b=kKkoveQgZ5giKfIpUNhO9irL5DjeZGMfGRGduKkUvLEEOme3Zid/LXRSh884z6/Hsg
         2vym8vCcQCvo4MncrpeHIhIAKljFgDO2Q/e9KMeEpnAOOPKaBbE5Avz04hwFUOGDQMlV
         b9BHXFOl1xOR5kxBgSy+QBzvc+URZJpls6TAt97BaU/TwD5MtORqojWmOhDjfRPgjzOC
         SiTs5dzUmdApqztkGD0cCH/OdeBHYzLkST/yl8cO3A9FvjADCDksU1S7pg2xqAuXHm9o
         CcmfOAWnantFVDJa+TYN3qoNEr3Aameeax0j+41FRu2AlcfesloY2oQIsSvkkTazmGNI
         U6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FlnYyalzN/iYxpFe1DybwocYPl8XORXDn/OIhRtakc4=;
        b=gHO/6oy0XoZAUfpp8oP/gCioSq0gZMfX/bFCnHk5BPrVVoPHrQlnXnyZ3Hu5XnoK3H
         pGpFWxyD9hZL2OsA4Uw/yCb33s2oC4TO1fH4UF7AqQ1bCdgwWHI982vcit3PsKIONv1Q
         Zaoz8Nw44HAqgn+tDyvGNynDHTzOgS/QO8z7UHyBijIc6u/LVI9ojQNZHTmGinw9KD3y
         LDwC1zx+qhBl+j0edr6LrzJAN7waeCYoT/ziupK1phJ3C3bIV6X+zF6gXEyp6xKLdoru
         uCizZYXlg25l2Kmnii8EHYiBLnwVhJIshOO/xSWWkrsUtBH7LJAKZHfxEFdMgjVFQ+Yj
         +yhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jD/5aTfj";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c5-20020a62e805000000b0062d7fb4c70csor2173379pfi.105.2023.04.07.17.37.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 17:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jD/5aTfj";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680914255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlnYyalzN/iYxpFe1DybwocYPl8XORXDn/OIhRtakc4=;
        b=jD/5aTfjyaqC30FvcPzK1FczFQvjqacUTe6hG7h7Zdejg2oqWWAxgluXNmGIKRau7Z
         aCv0iGDV9NKf/eTTyW03asl72Ya09KyKgvltAiInJJ7jP3tIPSLwGu/U8PKdhS+BUSje
         o0IMuUyW0Wp56hmbf1TkgK5jgSn0hDE5uleDPAoa3y6mXvo6uAvglTH0VAD4WsZzqMve
         xHOcVyp1Is8jg2qJ3e1Xs0LP/X147jJLfPm3uHUN5aQ7m4kGtDxuSUfWbi+J105NC+Bo
         FJc1L95ryAhR3qGy+BLef2OPTuiayCPXNzvjEYwZyHqWiCZqWlaChfRFFBJqLFw6IAi7
         SzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680914255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlnYyalzN/iYxpFe1DybwocYPl8XORXDn/OIhRtakc4=;
        b=Ram5cFfAhBiOcsKWqdNJay0UieH8khrKeK+3lyC/0Nwmr/GW26lXQ1/mYfQ8+y9vcQ
         o3aR/dENsR2jobwaisi4jYFtjaTAe1KCkpXCuV67FgyVdEKGHdLU0yeu5xyLtboXXdVI
         T7Iw2ZNfMFs1rEr1b0AzoDVoeRYENh1sKr1hIdXzwG7SqqtdVDcezeZQrjaAoMYDkKFv
         eS8pbPKsYoeClBmqu/Qrb0bGNal1EtRpGlw32btjd2NdzHz3YoEFjoH2/twewabjdaZQ
         kUlVQvXmMbgF2OUI3DXDU8GM2R9QIvJqty36NMwZ2i1SnYZMQxo7wvZ29h57xlJCEg6s
         4LMg==
X-Gm-Message-State: AAQBX9fwNGpXdsC8mLJ8IPoocR73sEkIdNQgirvuGdt7Tbgovxaypmsz
	avknjtebEl6CFBxPfwxiRIgHbd8L
X-Google-Smtp-Source: AKy350ZFn5BoldKrbBUWslJpxAkAjDJBSYdQq+Ec5vWs6+jDZvrCocT7tagi2MsZlaQ9G0+7PoMgYg==
X-Received: by 2002:a62:3884:0:b0:623:165e:e459 with SMTP id f126-20020a623884000000b00623165ee459mr3904159pfa.7.1680914255611;
        Fri, 07 Apr 2023 17:37:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id 6-20020a630706000000b00517be28bcf9sm145504pgh.86.2023.04.07.17.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 17:37:35 -0700 (PDT)
Message-ID: <bbb6afe3-60b7-04c5-a65e-62873744d3fe@linaro.org>
Date: Fri, 7 Apr 2023 17:37:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/10] accel/kvm: Declare kvm_direct_msi_allowed in stubs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6EEd39VL3SGe

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> Avoid when calling kvm_direct_msi_enabled() from
> arm_gicv3_its_common.c the next commit:
> 
>    Undefined symbols for architecture arm64:
>      "_kvm_direct_msi_allowed", referenced from:
>          _its_class_name in hw_intc_arm_gicv3_its_common.c.o
>    ld: symbol(s) not found for architecture arm64
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/stubs/kvm-stub.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
