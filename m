Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1403428ejc;
        Fri, 27 Jan 2023 11:50:52 -0800 (PST)
X-Received: by 2002:a17:902:d4cc:b0:196:3ae3:4ffe with SMTP id o12-20020a170902d4cc00b001963ae34ffemr10243975plg.41.1674849052112;
        Fri, 27 Jan 2023 11:50:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674849052; cv=none;
        d=google.com; s=arc-20160816;
        b=MhGz+I4OsbggIqWOjJLVySojEMpMQLSgTIc1fNT8l9eeK4/bkcgHHQs0m1yatLTVo4
         1Vd3fnsJ0g0HcI7NBJRK7BY6oP8j2gg32czJLrSkUIQxn2wazZJIC9T+taGXKsWEaK68
         AssPKzyMYbqV3UEMivq20JE/6drv2sZpvU+bht88lch/HZ/FKy1UPOvDqDa2g95etx7/
         Y7hJ1NcviVs/5apVhZdBOEwww2qt1Wl8SNPm4LkFjSXBOnatRlEm+8+IpSfLflR68Mir
         FbwYJ/Hvm7ZIJefvVpNdwOLzC7Q+BsZzaLNFT1KoOdzco7H4QXGXxdMBvhSkTcFsW83v
         ogmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rLQtvAJmyr/gx5Q7DrUJnzijgRegKpEcegPNG7FtvUg=;
        b=gPOngVnaYsYcH4BER0ilg1gQJJgqYFSgG48CkPqutm9DJbVdeuBV3SnsYzGh2cat+k
         ABzeRkTAjrLT2vTOMAy3elTCtGimit8/o2YNtV1SE6z8Pu8zFmAqE+f5d7gpK5Iag0MO
         TC9+CBbSnld5NAgbYpjEi8Jnh4oFl99g+BtKja8IJjO1NOvfQV24pdIlpV09QgkogyoW
         eMJyFYGAMTCRQuXCONlNCtYASrKO2QuMZxXNhisYqwDD1c4TzH+j1E9D5eaL6Zt5Z/xE
         R4dRykYGFcjYB/0NmCMRHbdWRhKYBo9mYMOVrk00rDn2YRpUx8sCU5ZAM+wJDUv3bWR8
         w6XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scrqAZ3O;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w24-20020a170902a71800b00196632386ffsor114013plq.113.2023.01.27.11.50.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 11:50:52 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scrqAZ3O;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLQtvAJmyr/gx5Q7DrUJnzijgRegKpEcegPNG7FtvUg=;
        b=scrqAZ3OQb8s+LndQOv/80aY6edi1KOEF1xakWWk2P7SdsV0d3f4BMgojLzUM4svoy
         1AJaGZAu1EUEQR68+CFZcXWVgn016uGxc8WACldSOOIAQdp7UHVQZp0MopLmLXpBUxRK
         AAysYvFEWDmEso/WRj2/dhaXoWYNaEhA1tH//7HHY0FqPsP9ZmoJtbmlcMLnBf+nirsz
         oprhjo/Ar+Jlrg6ClXcuIhV4da0PyCIdMhsWDk1w8vpTXw2DmR1Gp/fY2zUEL8Nj7v3K
         kRfac8Xo77ToBu2WwTqH1Bqkb3O4iyajxLb3E5pNI2kPGIf8EVe2w16uTt/WgYTjpp55
         QTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLQtvAJmyr/gx5Q7DrUJnzijgRegKpEcegPNG7FtvUg=;
        b=oA54DK14VHO7pIn7bkAPA2LHI5k5+Z5IWJfewwOS6hjfG3ii8Sc+00ujPrdKCAuIqW
         2clTKsFqDud6TRE1bhvbQDwnjI8bIjC4JGve5S2hkm0kHUarc0d5VWJcuXHIKdzl0YD3
         dmF0hIwRE4N9cdHu/AfmfbruwwmDOngSSISlfIhD812Ls3LBr2IhNsbLlWDAEYaZdju/
         xcJkYwUm7TJuz5vz/WZI96pQqydvCfeDixzb/wSq3g4G/Lxu3xslxB6mG3iPIWa1ThTd
         OO8ZdVvGu6YRkELUhzNEsfb9ke9Loc89D1acg2Ezu3KU8B6cZobMGyrt6+Meb+IT8ENk
         JX0w==
X-Gm-Message-State: AO0yUKU49mKful4motcbEs5Bo/qI5UiN7LVmQBjvAqZPNi/ieQg3mHZI
	JjKVuS0cfMGu9HXkiBWr2yj/b7K7
X-Google-Smtp-Source: AK7set+moD3dE5fNEqCPFxLjaD/ubMJ/eQd6cnxx5hbcxP37cmZTnJktA5yDLwgYyU+wnzMMyKZ8nw==
X-Received: by 2002:a17:902:db04:b0:196:5640:b081 with SMTP id m4-20020a170902db0400b001965640b081mr4433495plx.7.1674849051682;
        Fri, 27 Jan 2023 11:50:51 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c20c00b001963232f49dsm3220411pll.233.2023.01.27.11.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 11:50:51 -0800 (PST)
Message-ID: <f6f17e0e-ead1-9209-8f8f-070f796cb582@linaro.org>
Date: Fri, 27 Jan 2023 09:50:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 02/16] target/arm: Add confidential guest support
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-3-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-3-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6Xyvsv3FNi39

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> support the Arm Realm Management Extension (RME). It is instantiated by
> passing on the command-line:
> 
>    -M virt,confidential-guest-support=<id>
>    -object guest-rme,id=<id>[,options...]
> 
> This is only the skeleton. Support will be added in following patches.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   docs/system/confidential-guest-support.rst |  1 +
>   qapi/qom.json                              |  3 +-
>   target/arm/kvm-rme.c                       | 48 ++++++++++++++++++++++
>   target/arm/meson.build                     |  7 +++-
>   4 files changed, 57 insertions(+), 2 deletions(-)
>   create mode 100644 target/arm/kvm-rme.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
