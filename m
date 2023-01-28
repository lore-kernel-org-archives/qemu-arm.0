Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1533361ejc;
        Fri, 27 Jan 2023 16:33:44 -0800 (PST)
X-Received: by 2002:a17:902:e848:b0:196:32fa:6993 with SMTP id t8-20020a170902e84800b0019632fa6993mr12290329plg.66.1674866024530;
        Fri, 27 Jan 2023 16:33:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674866024; cv=none;
        d=google.com; s=arc-20160816;
        b=ElUs+pcwIlgn9pSBE1VffMy6dWjePcUZTif5UP/wWdZsjS9UDxNoR+/uYBF+OoWWxp
         sMuEkw2fPb/xbWWip0rbRX2T/4rvebO/hQ1dHlqTfHRhV3+ZhtMVYXiCSCfgLPybv89v
         p9C9m1Dx0SBEb9XPcL8J9mmhB27MuDdz+XES0ZNgAJzUfXjbW5YW+o6xzrd8StUdtGnn
         hIuBfXcrP6sQqzbClBYzFs21Ep0DtdR1tRmd0Ub+Vm8OQ6A+x27LHoWOoZoEl5fbH7/U
         8WTk6Dv3rL8pr8auGy7ISe6Nbey3KlkrW/l0z4pVCCuVnvmdFzpdIfK17juxdNDbiJtv
         CTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bceFme0wvDbnZhOW7mvUZDJn6AR+mq1r2XbzWS5aS1o=;
        b=0BsYqsezbOsebNu+0PhycBNMYUmfBTKOsEKxG+4jO4UnLaWtSzp5S4gZjElmvOrk0h
         mxdnOURB/91QygNjy/BjCZ1q6QF/3DqYSWnDrJ9Ov1/0ChHgaGsO8JY5lXzuceleM4hN
         KxJs4GBrFR1SgJjgG11ulugJq9bCsAFnCTtRbDGbH0ihb3eTEpmm3zJjPRj2PJw6wjcf
         URQx8TLcxUbevR5m4hw1GBUiZlHTF3aOgPUeZPVVIik0MrQcee/dPuNcsKqE64bXYaRe
         VApgQKKaoXAQVBpts8XFJj1lrukr7vYO8B4TICKw9i/qbgh1lW8pE2BQo9QqLaemWemC
         a5ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xbwWU7cs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l11-20020a170902d34b00b0019644d4246fsor2296243plk.105.2023.01.27.16.33.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:33:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xbwWU7cs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bceFme0wvDbnZhOW7mvUZDJn6AR+mq1r2XbzWS5aS1o=;
        b=xbwWU7csSrnXJGKnoiQN1IusBekUp4P1A+3dTFA1wGXGm9tduw+CE9Jy+KZBZbPzuG
         cwDIpexfHq19EYZyzT5Fec+iADT1Zf1pr5X004KDPxfWTLtav0EiF4rzpJXflhshoDfK
         z/jmoLoY+VGgk5+jNqm1bIgmYKiPQm4r0cJerq8x4OPMju4FQCkzREc+crgZNP++gbEL
         JpUUzozSiVQMkO9c8k+YY1cteEZE14hfb7JOoo7htlWFJlNqBj7IcBhw1C/rLjw/A00X
         cV+bhnDSnbH5236Rnvbqi5rMLb4JxLg5Pdu52Zo8+o0C795s43QV6o/8bBaB5YdGV0ZM
         xi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bceFme0wvDbnZhOW7mvUZDJn6AR+mq1r2XbzWS5aS1o=;
        b=luPoNYCJJmy3/yz9vY9y6/HwvALsAJerTip8PvNBegGsAMfb+hCa9cPwThRPcYq8Vw
         BGio/ZrQvXaUjrSebXyxagiCfs9eFXWsHafnF4JF4sGkl/YUf9Nt+gxrKf8OsOf29IqC
         iE9rbs+plmVCX+gfgAwx8zo4w5+KGANaIllygIRL+WnWdDOrfL3+mrsIonBI6QcK3YM1
         488bibbMMHToX09PFn4iS4NOxZv0t8TFXx+a/IF+DppuTAfljdmX1ysIt3FgRK1lnBlD
         /Eg+icZCTbCYFE71nNj0cRJGuxY5JUc+Qi/azakI0jK9jCNMnU7BcZpxkv+hDteRX2tM
         iOyA==
X-Gm-Message-State: AO0yUKWJr+Jm6FrWmSCzuzLkwTTVqXDQYvZ66PQqL+dDmJiM7+MyN0ht
	a9giLH7TY4AnUbm1miWWDTJmyakA
X-Google-Smtp-Source: AK7set/LRV5zb/U7VGjvn8n1Z/AyUWNk0TGaAhNEFKzffKaVGc9Q/fmVHTlqWzUJW2/OFN0I63W+Ng==
X-Received: by 2002:a05:6a20:ce49:b0:bb:9aee:f6d3 with SMTP id id9-20020a056a20ce4900b000bb9aeef6d3mr16147079pzb.46.1674866024062;
        Fri, 27 Jan 2023 16:33:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id s5-20020a637705000000b004da425922c6sm2859419pgc.74.2023.01.27.16.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:33:43 -0800 (PST)
Message-ID: <5969a459-eb33-630d-447d-3481e3b2744c@linaro.org>
Date: Fri, 27 Jan 2023 14:33:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 13/16] target/arm/kvm-rme: Add breakpoints and
 watchpoints parameters
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-14-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-14-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /kDhWHO0PHbi

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> Pass the num_bps and num_wps parameters to Realm creation. These
> parameters contribute to the initial Realm measurement.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   qapi/qom.json        |  8 +++++++-
>   target/arm/kvm-rme.c | 34 +++++++++++++++++++++++++++++++++-
>   2 files changed, 40 insertions(+), 2 deletions(-)

Modulo the comments vs sve-vl and use of more specific functions,

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I see that the KVM branch you referenced defines but does not implement this.


r~
