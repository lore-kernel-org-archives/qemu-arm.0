Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1534029ejc;
        Fri, 27 Jan 2023 16:35:35 -0800 (PST)
X-Received: by 2002:a17:903:11c5:b0:196:fd8:a95e with SMTP id q5-20020a17090311c500b001960fd8a95emr19458150plh.68.1674866135664;
        Fri, 27 Jan 2023 16:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674866135; cv=none;
        d=google.com; s=arc-20160816;
        b=FI4t35AFxvLCooiCtWs6qqdh09NNokAQP7AkRd32v19pFk3+e7W8pVWBdD1NKI6yBD
         ns47XM7hppzbDp4oNb+1JnBKVfJCpj0uK2qBz88yXWmz67bDhNO2avc2S8vXS2nAYGqh
         a1nnVQxQ8O2ZAu+xgFuFkNi7JmjLA5e6Jra9kzbQZR0FSYt/LqlhDlZ3MqSxK8GmFcTt
         +5/EwDsFJBXx4ytGuBYbSrPJKQTywMTz89Grx/YKxYBNCpwkuJ8WlhUef++5aFGbR1UA
         HfB6N2+KpH01O93nqFTbgYqXKopG7iwMfS+ZlplF8fDPL/yVznJgIp+qKpxRgWayhjug
         foxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=13MYius8ZqZi4woYYxLpVgeITbNSUMDUq3cf0HeqBHQ=;
        b=MJXD6diTCO6X5JTJ5ag5f3G8ew+wcE1Gnr+YHv28EC7l+SswcwDEnCOdyFLPeY5pho
         ZAEfND1KfxAQVWa4JERn4Kxnj4SAtWRBQDnl3hNn7dEZbYWhPONEP0rHZQ3ItKR+hgnv
         EiBpfYrHW15zAJhpj9CF3E6Pj2r+Qo7OgrqGopJwc7a+Ev28mrkBrQ3JOX+kemoQL0rK
         +qT4RzfFz5bzgu6z5S22pMep9T8uY3GWeg1JJlPkdVBB0Vp2b33+ZXb4Pj/3Oa9F7Eku
         artaTJ8euMuMIZaPJ65O1zE8RCD39mITtXzm0gboFtvrHbLAs46D08nx6sFHdWQ2Vq4t
         L2Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=toQsrNcp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cp15-20020a170902e78f00b00194768d4461sor2537141plb.148.2023.01.27.16.35.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:35:35 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=toQsrNcp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13MYius8ZqZi4woYYxLpVgeITbNSUMDUq3cf0HeqBHQ=;
        b=toQsrNcpNVOKs6JR/IdtkWSPoz1EPvUddEXI3raj6ferH8mgRLdnu/rvX/isamw0eT
         ww5YH6c7XDFzebSGZwr5yE/Nh6pchGZR+EsvA0seeozRV4X7/JcYVO1IMJ7rDDTBIZqM
         dk9L7LnaKs4s4UkZhSKt3FzDtvgDv39yQm6TVoMlMUtbTc9twCz4K18hFWpBkoyEEgDR
         tweWGppl1Vv7EiDSGnLrQULpkY6FcyewiBz1u74ZK97z78UBho9iwdos3vzLhw1GsrvQ
         TNtXVqBGPWO8JrHZu+6v05dJqN72pMipnAcKykXCHbKtghCDSxCEnSULyPes62sRzJQC
         SOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13MYius8ZqZi4woYYxLpVgeITbNSUMDUq3cf0HeqBHQ=;
        b=3WtaYhBvSiUl6kwgRf7/Q1TaG+pcffdEdRdVDFJSyep/LHMPwe/3ORE+YdCFaaerQj
         7YQJvv3jucVGR2idjiA9rfPmULqco16jL7SYJipWSSIf/6l/E9qOxjnyoMZH9C5J4Yj1
         zHyweZAxewseYwyL7idvDoRYMr4sxr80Eo8ARrl+Vi4UTpamlXLOI9U6fTSdyPztbl1E
         7HHgfuPySHp2+lsWq3FtAQKkrElcUNDX4H9x2CYvzeMom6NVq8w87UECFlSF1IXtqixQ
         U+3fXk3YRWLAOa6axeTzcfPLIra1lwV7ZMJqX1a+ThgUUsanzlk3M1+bbnJpg8wXUShE
         6UQw==
X-Gm-Message-State: AFqh2koHgNYDAk3/kFw5cdbdiZCJUn0b5P7MRzvfQ1feMlOhRAFhJJQ9
	5xuB5xBDToZ6KReFirgqsm4dRG/z
X-Google-Smtp-Source: AMrXdXulNx3skpeDMn8l+pbsSp33YwQPkus7iHjT6AcuAlwSJ/GU4yH9s++VPx91FWU0I8rA+PGeEA==
X-Received: by 2002:a05:6a20:4386:b0:b9:3cb5:99c2 with SMTP id i6-20020a056a20438600b000b93cb599c2mr37613946pzl.17.1674866135225;
        Fri, 27 Jan 2023 16:35:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id f186-20020a62dbc3000000b0058a72925687sm3156152pfg.212.2023.01.27.16.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:35:34 -0800 (PST)
Message-ID: <9508d39b-91fa-919d-0bd4-622930eea003@linaro.org>
Date: Fri, 27 Jan 2023 14:35:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 15/16] target/arm/kvm: Disable Realm reboot
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-16-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-16-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: EnvyhALAby4u

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> A realm cannot be reset, it must be recreated from scratch. The RMM
> specification defines states of a Realm as NEW -> ACTIVE -> SYSTEM_OFF,
> after which the Realm can only be destroyed. A PCSI_SYSTEM_RESET call,
> which normally reboots the system, puts the Realm in SYSTEM_OFF state.
> 
> QEMU does not support recreating a VM. Normally, a reboot request by the
> guest causes all devices to reset, which cannot work for a Realm.
> Indeed, loading images into Realm memory and changing the PC is only
> allowed for a Realm in NEW state. Resetting the images for a Realm in
> SYSTEM_OFF state will cause QEMU to crash with a bus error.
> 
> Handle reboot requests by the guest more gracefully, by indicating to
> runstate.c that the vCPUs of a Realm are not resettable, and that QEMU
> should exit.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   target/arm/kvm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
