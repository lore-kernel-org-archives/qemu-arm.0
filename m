Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2601988ejb;
        Wed, 25 Oct 2023 02:17:31 -0700 (PDT)
X-Received: by 2002:a05:651c:1c4:b0:2c4:f768:c6ee with SMTP id d4-20020a05651c01c400b002c4f768c6eemr10187903ljn.19.1698225451469;
        Wed, 25 Oct 2023 02:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698225451; cv=none;
        d=google.com; s=arc-20160816;
        b=E986WJrO7yR4wpvDC/hC60qHP7S68NFAqLl/2A8SP9Xxz97sT5O4Br0YLIEx8rpzJD
         m+1eo3trdQ9xa5CMWOoSVFFy/yWyydXzY2ErZcmGoV/tksg/O7I5nXeplctB4iS9NMKh
         CJold5fmAPpe9ztWewpsZVCwHhs5+RH267b9rIpoynmYCmq2v7klCfcrh/g7pWlX+ZE9
         f6NC79SNW37GWi3kIYfMYfv1Z/rFSHYaiIMPdyx7yOtLVmgw0NZcw6nLN2+bJxIj0ERL
         zjOYxVNVd8RBbbFnjpRMOz/5f++DHaBA+zPsfMn6EJHcgnZvWwMKVoSek0pehxZvn3qK
         q2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zT/r30Ujd+ELUU/7Pv792UL3pTWDRgtNZUNpUq2d2eU=;
        fh=h4APDBVmkEuJk0kArkckqp42lnCJbzubsNpkppVKQbg=;
        b=ldNB6MV46EsUWlM5zgWYPelmBkbxPczSuMOzNSaI9eGzLxl7aHlqIbcwj46FhoEtdU
         7Y/fTH+vaBex+zu6v3h0nWAY63obloCBhnJUOZLGMYmQZ4ndZO1NRb0Zztd/a8738fIz
         pHhtn1CcYaaysT3ol+7Dkqma6YwudbHqjNiejtS3SOqi88UG76bKpCtpDlFnOVNfDP5E
         DE5J/VOo97p1f4S/Rf1tk+b4nnpC4jDy/Xt4VI8OtF0IWEe0Dp5DAZMXtLzdQEGMXRvf
         C6WCPm4gXcjz7hCPJxVBbNZrVC9XnhWsEMwSaflOWOPnlPa4jUNJUnzR0G4e38C9EBWy
         R92w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wnlvkJRu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x6-20020a05651c104600b002c187b3843csor3300324ljm.8.2023.10.25.02.17.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Oct 2023 02:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wnlvkJRu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698225451; x=1698830251; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zT/r30Ujd+ELUU/7Pv792UL3pTWDRgtNZUNpUq2d2eU=;
        b=wnlvkJRuKT8KkTyg1/WzpMMG4VKtqP88jdTUVcy6syVbF54nQ9+JDn39XZdglnJoCc
         k1IVhL2dLFA5RA7fxp20SM3DE7k2k73kZRFz3//URkFnjc0TCXr4fG2tvP+8nB0x9nCj
         jayI7bCyTu0miUL5C6N/eCOC3/TgzngQv9zXNR/uuC+6ylvQeNTIYanl8CNdvdM4boT5
         cldtRPGYvprKzbdxmKGskoAxYhLMsbCfxEVNjsCdJWELrujkCU28KXSFF8vK7c4f0dqR
         OGUCv5USZALPj3JjqL4QpDH1JnwdT8AbbkILm5oco5+wcJLApfZUbn5VV9nXdS3iL6g3
         NIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698225451; x=1698830251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zT/r30Ujd+ELUU/7Pv792UL3pTWDRgtNZUNpUq2d2eU=;
        b=eJqCHiqeMFEOHVHczfWnnJgXM/x8HJpdI9T8pRwB3xBB4KPzq2BmurWJ0WpxvQ/wo8
         FOshtz6AQmwNOqxfY5/k5i4kjAnrGYcziJMtJ3XbarWrrHZcAr0hMF3bVYRo3v6ClJA6
         mRdVjjyYg3kAImh/mzR0wi46xI24LnKIUKTle33Anu12V82UOgsZtlzdETpBu276Sm5q
         9IpdMa7vID2HqYnPN2EnqlRfeToLFJCZp0goJoOVmF55EIACkUHjKWDU5hSMiypnsqTE
         ePwG2g9zACLQYFSRoiEhPihK8/CopfuwLTYBUw5E5De51XKtzBEhqoGSES8YiC/FoqIZ
         vEFg==
X-Gm-Message-State: AOJu0YxPbroxcc2JyWWLiqicRrQKiahB0rajZGLu0e1XZK8hmX51jUDB
	wH7VCgSXM5c3aDfTJapUgIP9GokJXDPZPoCj+IQ26A==
X-Google-Smtp-Source: AGHT+IHmcrJudfTqlFcNpOS3NR61cAh/+K78fSCeUf+dvBCZcULQX1AuDWNl+PnpMAeGkv3BpycrAQ==
X-Received: by 2002:a2e:9f45:0:b0:2c5:f8e:35cf with SMTP id v5-20020a2e9f45000000b002c50f8e35cfmr10656674ljk.20.1698225451032;
        Wed, 25 Oct 2023 02:17:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr. [176.171.219.76])
        by smtp.gmail.com with ESMTPSA id dl11-20020a0560000b8b00b0032da4f70756sm11649942wrb.5.2023.10.25.02.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:17:30 -0700 (PDT)
Message-ID: <608d8f04-5458-125c-3fa0-9296dfecc9fc@linaro.org>
Date: Wed, 25 Oct 2023 11:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 00/11] hw/arm/aspeed: Split AspeedSoCState per
 2400/2600/10x0
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231024162423.40206-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231024162423.40206-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ruKg/MunQUbp

On 24/10/23 18:24, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series is extracted for a bigger work.
> 
> Cortex-A MP clusters (TYPE_A15MPCORE_PRIV) should create
> the ARM cores in its own state. Unfortunately we don't do
> it that way, and this model calls qemu_get_cpu().
> 
> In order to remove the qemu_get_cpu() call there, we first
> need to rework some SoC users.
> 
> This series rework the Aspeed SoC state, so it is clear
> what fields are really used by a SoC type (2400 / 2600 /
> 10x0). It will then be easier to have the MP cluster create
> the core instances.

Being a bit more verbose, as I was trying to explain to Cédric
on IRC.

The fby35 machine creates 2 SoCs:

static void fby35_init(MachineState *machine)
{
     Fby35State *s = FBY35(machine);

     fby35_bmc_init(s);
     fby35_bic_init(s);
}

- bmc is Aspeed2600 (A7 MPCORE)
- bic is Aspeed10x0 (M7)

If we were to create the bic before the bmc, as:

static void fby35_init(MachineState *machine)
{
     Fby35State *s = FBY35(machine);

     fby35_bic_init(s);
     fby35_bmc_init(s);
}

then the MPCORE misbehave as it calls qemu_get_cpu(0) which
returns the M7 from the bic.
