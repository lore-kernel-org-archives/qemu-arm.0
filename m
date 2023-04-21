Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1321220ejm;
        Fri, 21 Apr 2023 10:53:56 -0700 (PDT)
X-Received: by 2002:adf:e9d0:0:b0:2ff:6906:7169 with SMTP id l16-20020adfe9d0000000b002ff69067169mr4158352wrn.68.1682099636177;
        Fri, 21 Apr 2023 10:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682099636; cv=none;
        d=google.com; s=arc-20160816;
        b=ye0hTmItAeLBoHaUvzoI0ow1/omh3+NpFNup7jlj+JoHV0mZ6PM7BRVnl/kBGnsYWs
         vS74OligNS2uMt26s708bUJVLReH/wiHXXJ2xJsronVDquZaTHUYAIQfkMY2kkOAMZgR
         XZ7QpNrYqJ1++ztfFSMK0BSVP+NS45WBZavM7sXTc38mw04v/ZmTziFGPVM5hOqICog8
         VWFLQK1fzyWQx30fFt8rWrNdwwiZQqsQ6xOxdrBTJg+KLfsoWNBcoN0wJX5WXUMA2QBy
         FgT2o61vF8QPk7bNjQ9hJSZGikKlj+Hp9Nw5f2/gUM2QfYyn0WxAO3H3sxUxeqM/lcpp
         MwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=03B2mBgyGNXDvur0BdNOnKF8TZiflUVanf9eQfWsihQ=;
        b=Wz040TSCe68dU/zsGfW+RS2CUgfOtjvQdzOIkQFKazofKj+asSUv8hjxdCteGZtxAF
         i4c5kLust2bnJF0c+iUFixBJ6usgbdZ7QB+zEr/YAeZA39ncGR7dHYzwIg9RHNTdQJvB
         yMTAEHMFS5FNi+zWBU3J0ZDTZDHfXLfzg5hvP9HYnUer1FUACv++f7ni1QgJnivyemNy
         3y7JhvU3ekFI+gnFqtLrgjYZuopQsJPtYG56UwfMXuysQGytAeifVj5wMq3UqNr+Ofr4
         qnvUU8UbL7rHK0o8+WNodNYaUhfcuFdSBbUZzgChxw0pEUaKip5OonH1JfY2QCYpUCN+
         X2Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULEKuwCB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l14-20020a5d4bce000000b002f2791a0552sor2156955wrt.88.2023.04.21.10.53.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Apr 2023 10:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULEKuwCB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682099636; x=1684691636;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03B2mBgyGNXDvur0BdNOnKF8TZiflUVanf9eQfWsihQ=;
        b=ULEKuwCB6aSu0NAOEPPfs7d/0Nuzm2cXejyo3ZLDo1jMP4azNkirfo7dCmz+V1b4pV
         dx9fjWMnRf5uzDN3zLSTJupn7qVMz7hiheSS7Yov0P6kLH4mAzW7bHqDrPbYp0rloHSW
         R9BX3xLJ5Ckp0fEErT2uwwUtIDNiqRx1Gyjw3t6xYq9mc/UNSORE5TC6PPNipJ7QQtR/
         6a2NGsQpcVlcZWYY1+0+wVClxlEVoPnbWd1w25iLowFWOUFakUqa8hdOMLE9S/HoVatg
         9Jin1xO2SbM6Pw2uxfrC5OSyeUqKFrbmBoGv342DVvNUQO3FlK3pEsZN33YJo8iNafiQ
         tmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682099636; x=1684691636;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03B2mBgyGNXDvur0BdNOnKF8TZiflUVanf9eQfWsihQ=;
        b=B7Z/9TUrSQmVDbq+uAaJM6EjBBcOkh+X5FQ1KrRplyKB6Ue9h4m7pExcVYfK654+1+
         ukj2bJJ7A1F8RPRp6n7ZxZmWlwjAuaglJtc+7RwJAgDotKfzPdVwm+WPBc4jSu/ShdnO
         wmFW04KrbkgN1CNfx5Oa2z2dRgMiCfzLeNbke1Q59I6Dk1ZR/p3WTj6tdi6briSmAL/C
         VPzHx1dpk4VWkFHNEsXi4VirAryI7a1TdW+IPSBqZQGRcfzhtL/vxXNnB9RYKw94LOcp
         oMWxMu7J4iBI+OuXwiSJSpIenmJILmOu0F2tC92frqepxJaTuTFKUoHyHBbtqwpfp5kH
         8cOg==
X-Gm-Message-State: AAQBX9d3Kj5dunx+/KnE8yuiqCBxExtVYpGYFKKKPeUWOELbI/3flUky
	/rIxzBvrHHKL8KNdBSJ8cQVa7/V73+cYSWEvl6QMJ/tF
X-Google-Smtp-Source: AKy350abM6zOxTQwplMPZ+L5xDn8pRJ/C5W15ziqARV0AeMHlCvQ7ywdm5OvaesyXvLsjewFuQVqFg==
X-Received: by 2002:a5d:4bcf:0:b0:2ef:eba4:e208 with SMTP id l15-20020a5d4bcf000000b002efeba4e208mr4694757wrt.45.1682099635825;
        Fri, 21 Apr 2023 10:53:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr. [176.184.28.119])
        by smtp.gmail.com with ESMTPSA id r3-20020a05600c35c300b003f1836c98b7sm6524522wmq.48.2023.04.21.10.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 10:53:55 -0700 (PDT)
Message-ID: <6d0e4b13-e143-d899-5960-dbc23f3dba5f@linaro.org>
Date: Fri, 21 Apr 2023 19:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 02/11] target/arm: Remove dead code from
 cpu_max_set_sve_max_vq
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-3-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412121829.14452-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: o412NoRGXwmF

On 12/4/23 14:18, Fabiano Rosas wrote:
> The sve-max-vq property has been removed from the -cpu max used with
> KVM, so code under kvm_enabled in cpu_max_set_sve_max_vq is not
> reachable.
> 
> Fixes: 0baa21be49 ("target/arm: Make KVM -cpu max exactly like -cpu host")
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu64.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
