Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp326679ejc;
        Wed, 25 Jan 2023 04:16:06 -0800 (PST)
X-Received: by 2002:a05:600c:3488:b0:3cf:68f8:790b with SMTP id a8-20020a05600c348800b003cf68f8790bmr28691778wmq.11.1674648966079;
        Wed, 25 Jan 2023 04:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674648966; cv=none;
        d=google.com; s=arc-20160816;
        b=cTBHZiXY4OxHZKlTjeLRcruJo0pVoStiE8r6h5na4zDZD9Ni+hZLcSak2gbZsFnBro
         U0He7Js2gOjuZY+e/Rg/X55AiGbZmnMK0YDW0jjUlVR1XoaDBobc4oEPXjz8TqwwbFx9
         k3URif6UhClsLByNxZB0qNUHAp7bc5+d90DMpfUUBfVVLk1vMety/Gx0Fp9srbYXp++K
         eYh4tzbZrtCAlVi7HxJdPvLJkrkXipLmyfBRHnIxGGDgAfzkmRvLfpVrUyS55TbwiGGt
         zcyIy1dBfBsd4qZyXiUo82kaCFh3aPV+I084S35yj1xdDZUcdGkxDqZSX0OfubTCM5vX
         1W+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ER2SI4PlaWHGQyH2e2dd96iwPQoAleiGSkVyIcN6NyE=;
        b=bEZK8c+v9CbeLXVs23G1mOtwUtDpRCe65WUPHgoNcQvEORcY1vMMaFkVOO8JmywJuW
         DbRC+5Xhu0Ol/sMk6pBO2rAz4FqO8wTNNeOj4RNJgaks21lLVUakWNnix1CTh5fDK6bg
         kv/RH2o9NAjxXiItAnKkhvfQ+4+Vx2P6c7XZtJC5mHbbB46xI4WzCPm5395/ieDH37EP
         PDCj4lBxJqAYufLl6Byp2T6ybt3gmkIE2mQ67/cLypqyVUtO+eT4grhF1IHW7XbwQQ3X
         XVMUG73YBOXSfyfHPkFdCY2fINYOAR8pFFDH2Wist61du/h4QYeQ8eDinDRo9ttKGyJc
         9Ugw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oJEKCV5G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6-20020a05600c024600b003dafc5fdab8sor560810wmj.43.2023.01.25.04.16.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jan 2023 04:16:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oJEKCV5G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ER2SI4PlaWHGQyH2e2dd96iwPQoAleiGSkVyIcN6NyE=;
        b=oJEKCV5G3wULQ5/rTU24gUwxEFgmQ6i6MzOpcn6cRF1KLaxiN/ecbQSX2wmPb46eKE
         ff0+4tslLvVUSw9iOPKRegyyLrqPpSdvlMen569CuJfBzl4JsDRM6jERXS/MT0mQ6MK7
         lkW0kESfBC0mliv58D6IZnNbNUecPdS0Kv3dE8V38qSCRQeBOaaV9RPJ55ylvfAFhb0O
         X7eDMhfxE+srAQOEiLPYzQVoskR2KRP9hxPcExm14rarBpIbHOzCykBiug7OfF1xNFfz
         x5KTI3Z54DE1hB4h40QZyO//bQKLOjMs3/ipB4fVRJLIHplONZJAoDUXYi+vM1WmroBr
         5COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ER2SI4PlaWHGQyH2e2dd96iwPQoAleiGSkVyIcN6NyE=;
        b=eBFdvpoxGpauXkKw7S9+WUsirPu6vuG3z41OyXMLatYG4BDnNJjr7gYz1PQNhp+Tv1
         vShZ3S952OkI0dm04+3pF1KOgolTbw4KQti09qwKFbqVuvkd4Et6YBDEtVEMI/5LrZG4
         ElyumIoDp4+QFeLOVktkxU1xoHpisM+jt+h1QOd6od+9ODVSv2OOq+aSUvJyp4wtSI/q
         GDec1y34OIHs/KQtLrdky50qf99aDn4P7fxh8mG1xlwzUeIkthyejDRCpARfyuHMDSKr
         fyQE8mIIjKbIFdJmPi+JMBMd2uby+nylBG7WMP/3Rc6U5IAPaDIWhL0w49N2iIP0zITy
         CwdA==
X-Gm-Message-State: AFqh2kosiH0IPmADdGC1A8E3gpk7SM4msPOuvDEeodnDMVfrgt13DHTq
	HkIsNnBBkmk6ZacFo1cSiN2r6zC0L0QAZDWmkVp2mw==
X-Google-Smtp-Source: AMrXdXvNv+mdbb7AtqIq+hx/VRRyNRmxWORy4dDdYX2jOFNqxY/aKSTVG4e6+cVCuwdVgbaphIDiqA==
X-Received: by 2002:a05:600c:ad4:b0:3db:11d0:21e2 with SMTP id c20-20020a05600c0ad400b003db11d021e2mr28325094wmr.29.1674648965603;
        Wed, 25 Jan 2023 04:16:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.0.114] ([196.77.22.181])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c150500b003dafb0c8dfbsm1939388wmg.14.2023.01.25.04.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 04:16:04 -0800 (PST)
Message-ID: <657d1e7c-875f-9eb5-4ab5-9d8f9094063b@linaro.org>
Date: Wed, 25 Jan 2023 13:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 19/35] docs: add hotlinks to about preface text
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zbEnkR0CEteZ

On 24/1/23 19:01, Alex Bennée wrote:
> Make it easier to navigate the documentation.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/about/index.rst  | 16 ++++++++--------
>   docs/system/index.rst |  2 ++
>   docs/tools/index.rst  |  2 ++
>   docs/user/index.rst   |  2 ++
>   4 files changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
