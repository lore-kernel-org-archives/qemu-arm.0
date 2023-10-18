Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4506988ejc;
        Wed, 18 Oct 2023 02:24:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBsf6WJGMlyIXtrEjwZtL5hV9AePWZqAt+t3C8MEdBaIMOEgek3Q85BpPOAr+g3mD9Dzzn
X-Received: by 2002:a05:620a:3914:b0:777:27f9:7e54 with SMTP id qr20-20020a05620a391400b0077727f97e54mr5631402qkn.50.1697621046350;
        Wed, 18 Oct 2023 02:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697621046; cv=none;
        d=google.com; s=arc-20160816;
        b=zbx/uIa2oMRdPBOPBpuKiAjmwaKkbLtyFMFc00iVHy1nOiOUntFrQJjazPx640t+7M
         wwfqj6RPwOE9p1+7fYm6t5oLaR3lesbORwpA5kKXsk7AVol/ksTBb588291KbqhC0epr
         SC2VVx9FhCGEFfJ9UzNO0BiamzOsmpqNTVlgViDyruWmNNLIfiZ2RjsuMOvAdWRQVPdM
         Ou/04W9DjIfXv/GAIcD/NHtUKFM/YxrAE5E9f4jgEQd2Lyv2cA7BgtfN4oIxj5Q951zD
         OvUtFFyzCS2kea2sfDnXf+Eo5gNUil3f8TdS0rafIZZNqbqylNS2pdxRPx61pk/U4RwE
         vNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ir4Oi4tJmqD6fb/jTTWI/cvH3QiKo4l3/ltMHsKg+ZY=;
        fh=bZ9Wf0smTP0GJi+WovNSAbRHmtpbA1395yM/1ms8q4Y=;
        b=X3LHzWUyz5BKGTRAD80K0dWebOgK4KqBeVpx2yzcgtvzVAohrN7eKck4he4+ZZs9XC
         tSY4EhGEmnCzressoidmZ8GnpJdJIhp3RKCnyKxDs2nUo4TDxquFyNvCnDU93UQRwPIO
         7RMHfRE7PGbePfZZeow3eLlh+ulNcdG9UhickSHw5MLm9sXjGHN6DKAIj5eW3kACeWRM
         Ri2qjcRfZYszM7ojWtEs35yOY8IL3XZgV2TfNEzPqNkJo9SHDfSD+f7DPwdIw/pFDcmB
         e1WDpB12QKlvZjDQI1K94ftWEPS/FUrZLmNvkTt6OC+AXl/NU8eeYEI9TRaB6px9qmFs
         xvlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynXjKCQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05620a28c700b007759399e39dsi2527874qkp.692.2023.10.18.02.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 02:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynXjKCQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt2mV-0005nC-8D; Wed, 18 Oct 2023 05:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt2mS-0005mp-S9
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 05:23:56 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt2mR-0007sH-3l
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 05:23:56 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so10937207a12.2
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697621033; x=1698225833; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ir4Oi4tJmqD6fb/jTTWI/cvH3QiKo4l3/ltMHsKg+ZY=;
 b=ynXjKCQOCzzq62wRzOHslRIBYPt9MMlTgSZ7/H3mHABsuPXLtfFOOX2+r9QQp8Fqv1
 KOIx8z5SvNmxyh25BLgfgxD6BzB4Vjcl1VC/05j25t3yRzWjlAhRh+CP9ULmR/WSypsp
 me+iyJQ1lSPDDdf6ID+pFS8j+eUhP24kId4JmYNUrcESgYLiEqnMdVhS0nO/PkHZaEP+
 thdE/qAba/+f5WiWZLmMzQbYBx3VDehzgmQAZVMgvDgyYZzF8SfYBo0pT3rsXJPKYbAM
 bgccHfl+CaPZkMCCmrL0IuQNo0pgdf/dJU1FuJ/+/NqUjnFqmctuIcXPlJPLdhtKYzt8
 oz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697621033; x=1698225833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ir4Oi4tJmqD6fb/jTTWI/cvH3QiKo4l3/ltMHsKg+ZY=;
 b=UIOQd3N7dSAhEUB/tIxAmDABeNq0igUO28w2ROlTD9E5u2+HLqspI2jvQrJYm4+iNK
 /ODLMdHHfua7rjSIvA5j9or8h4granhUPYSf2hpQv327+otKD7SU2aqAWwv2GwjqIYlV
 pVsrSunNq2jVluiROSxNHK/ld5IH5EGJFbat56bYMKnQ3sTuLbNMVconz26N7xwJXX9N
 +m/qgodM97GtTp8cYuaTbp8q/1TMFoo7kgJqm6qayiXSBrgd7Ls9bjbJ71Gx2IEWfdK+
 G0PDCPN64XyR2TKhQcLnnCCM9t2gJcXdSMFRigeZPgRX/tb7z1Dd8zCP7UYb0UymWLK+
 oAAQ==
X-Gm-Message-State: AOJu0Yx3QdP1zf1NEMUlT168XGmzMZvkN6bPbXJ75cVbM2Nfj/PIkGJS
 nPPFoePP9yVZfi5rxCO6rKPy+A==
X-Received: by 2002:a05:6402:27ca:b0:53e:1825:d547 with SMTP id
 c10-20020a05640227ca00b0053e1825d547mr4065360ede.24.1697621033385; 
 Wed, 18 Oct 2023 02:23:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a50fa97000000b0053e5edeff3bsm2419154edr.93.2023.10.18.02.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 02:23:52 -0700 (PDT)
Message-ID: <404e3e4d-f478-bb50-300e-b41248a1d0cc@linaro.org>
Date: Wed, 18 Oct 2023 11:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 11/11] hw/net/cadence_gem: enforce 32 bits variable size
 for CRC
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20231017194422.4124691-1-luc.michel@amd.com>
 <20231017194422.4124691-12-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017194422.4124691-12-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: NdYugBI9ukv0

On 17/10/23 21:44, Luc Michel wrote:
> The CRC was stored in an unsigned variable in gem_receive. Change it for
> a uint32_t to ensure we have the correct variable size here.
> 

Fixes: e9f186e514 ("cadence_gem: initial version of device model")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   hw/net/cadence_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

