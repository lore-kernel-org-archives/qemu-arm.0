Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp56496lff;
        Wed, 11 Dec 2019 18:37:59 -0800 (PST)
X-Received: by 2002:a63:d958:: with SMTP id e24mr7765101pgj.31.1576118279623;
        Wed, 11 Dec 2019 18:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576118279; cv=none;
        d=google.com; s=arc-20160816;
        b=rwdAiaCa3SP9zpGGtT3AAZAkij70HO8ryL5rBzBeHU6O3jBWZzxCZveDzqkNYKt/AE
         u2SODa7Ze8XqIjMCkL+wC2MKNfX1KcgtrKL3IURtAEWcGRffvjLc6JS3VV2vy0YE86rm
         feMxf1jTXbOMkIafTtnBPB6LR6uncMh3TraU/BLEPCb/ClMLliftxM0UV5cbspJ4uHQx
         SPUYimir9obLVeV+UKPjHQOC/yyaypdBuRXZNWnfZUUihmPIdIVVPx2w9TNUWSgb1VSF
         UZ4F9Xsy7A/5uk2FFI9CWooWGEW0q5r77eO5eI5dsa/+Sm3Mhaby20Lz7o1C+NJ+26ha
         RopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pSHE4/4kZo4fmk7WZTpI8ZXurfiJ2m59mz49KBX6aNE=;
        b=XXtfRPiWyU2Mdp+/SKKV74SfayMl750Zb9STCZe6/UsDbFPMvIuCeUWs9/17F1gNB7
         t7s1BUzSyaeQn0NmCZz6waurrMtL4op8p+v/jAFcltk91dRuRvruNAVM9f45rs+fh06H
         P+J3Y6Hhj7PLOjaq3AaePCrrOT+kaljGMgfFk8GnGrnWQJQMVuvYOsGcFD1IwqHa3Xve
         7vK+CuLbKsLqPDREs3mpEnccYLuOBR5RKtQe/4sv2rd505ZzLK9wGFL3GmU2bA8kF0mj
         jQZDoFZGdMGLbxlB+++ADsi6ZS+7xni3oWF4LKS9U2ogZoxZyVQ3TDb0Cna8US3Vnzdu
         Dc+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O5TnFHVp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i22sor5079877pfo.44.2019.12.11.18.37.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2019 18:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O5TnFHVp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pSHE4/4kZo4fmk7WZTpI8ZXurfiJ2m59mz49KBX6aNE=;
        b=O5TnFHVp7jidZfGX1NaAxdPAQ8fDH2FKgEOoM6KTaCZ9CrNiVQ1FZbyiDh8X++Y9M2
         BWh1HjskUxNlZn1kVAk8WRc8lMUqPXQH1wXFTQsMLyDFo58B12nGKiulFJfJtpcgxSY3
         GvBzArwvPK2uuBjfuhxN6VZtAm5VpUsn/8s8occ7DYLma9zlZsB7dlX1GjyNhXJ1MM3q
         wcJ4jVzdieq4NcKRPQGM0JcyzemUr/InjlBtvUnD+Qjm4CwGilw5DMuytoXUWlTVf4mR
         N3ZBV66fAuJ1MA4I70OW6sXxgOER9WWZGtpNx4wO4vIaGb4qOw0XligjcYRUUFrCwUH9
         SWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pSHE4/4kZo4fmk7WZTpI8ZXurfiJ2m59mz49KBX6aNE=;
        b=KHupvrrvhha/UigMYKGl6Nov1XGok8wNRsxq4Zw0lcnEM41ee6/aO9YG4f6KMzcVuD
         3l798wau7UhzHGbdwSgHPAF3sbSOggSk/OzVWx0OVwQyLAWdGSErCp8alOsfcNEQErBe
         aiH+0Ba3rsjsA7qw4DWzW0qDAQTgPCRA1BX7Tn6HUyr5guv4cST70/HwonR17n+Uzol6
         fC4tgwsxJmEPy0FFgEB1i0wZjEVOyk/av9DlDdtSFsyNr5oiAJqcSj8rol3LxrsoTNnd
         sO5rJO8IWBgQMVFMR9R+dk5aXhO5oZ9cRDCwsFk3W7jCYRkwtR0LfNt2zLOpx6HsSLpa
         ipiw==
X-Gm-Message-State: APjAAAVSwyVrlBPyAK6Gn/FwHjBwlv2a+wZP8jQj85iv0dlUHEvKLVs4
	LEDiCSz67iabVXd59xPkBp4V7oKL
X-Google-Smtp-Source: APXvYqxQPTooAJBxcMUkp7dyDemkvXFk6+p0VEGbeOIoo/p9UEc19YOBL3QyQZdz4JU4X3t8MftpXg==
X-Received: by 2002:a62:b509:: with SMTP id y9mr7114028pfe.12.1576118279208;
        Wed, 11 Dec 2019 18:37:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id b10sm4754340pff.59.2019.12.11.18.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 18:37:58 -0800 (PST)
Subject: Re: [PATCH v3 19/20] tests/tcg/aarch64: add SVE iotcl test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e17f7512-8936-4926-6558-75b6dd6e6786@linaro.org>
Date: Wed, 11 Dec 2019 18:37:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bz+jVzuferWr

On 12/11/19 9:05 AM, Alex Bennée wrote:
> +int main(int argc, char **argv)
> +{
> +    unsigned int sve_feature = (get_cpu_reg(ID_AA64PFR0_EL1) >> 32) & 0xf;
> +    /* Exit early if we don't support SVE at all */
> +    if (sve_feature == 0x1) {
> +        /* we also need to probe for the ioctl support */
> +        if (getauxval(AT_HWCAP) & HWCAP_SVE) {
> +            return do_sve_ioctl_test();
> +        } else {
> +            printf("SKIP: no HWCAP_SVE on this system\n");
> +            return 0;
> +        }

I don't see the point in the PFR0 test.
Testing HWCAP_SVE should be sufficient.


r~
